<?php
/**
 * Board controller for nforum
 *
 * @author xw
 */
App::import("vendor", array("model/section", "model/board", "model/threads", "inc/pagination"));
class BoardController extends AppController {

    private $_board;

    public function beforeFilter(){
        parent::beforeFilter();
        if(!isset($this->params['name'])){
            $this->error(ECode::$BOARD_NONE);
        }

        try{
            $boardName = $this->params['name'];
            if(preg_match("/^\d+$/", $boardName))
                throw new BoardNullException();
            $this->_board = Board::getInstance($boardName);
            if($this->_board->isDir())
                throw new BoardNullException();
        }catch(BoardNullException $e){
            $this->error(ECode::$BOARD_UNKNOW);
        }

        if(!$this->_board->hasReadPerm(User::getInstance())){
            if(!$this->ByrSession->isLogin)
                $this->requestLogin();
            $this->error(ECode::$BOARD_NOPERM);
        }
        $this->_board->setOnBoard();
    }

    public function index(){
        $this->js[] = "forum.board.js";
        $this->css[] = "board.css";
        $this->_getNotice();
        $this->notice[] = array("url"=>"javascript:void(0);", "text"=>"�����б�");

        App::import('Sanitize');
        $pageBar = "";
        $p = isset($this->params['url']['p'])?$this->params['url']['p']:1;
        $pagination = new Pagination($this->_board, Configure::read("pagination.threads"));
        $threads = $pagination->getPage($p);
        $u = User::getInstance();
        $bm = $u->isBM($this->_board) || $u->isAdmin();
        $info = false;
        $curTime = strtotime(date("Y-m-d", time()));
        $pageArticle = Configure::read("pagination.article");
        foreach($threads as $v){
            $page = ceil($v->articleNum / $pageArticle);
            $last = $v->LAST;
            $postTime = ($curTime > $v->POSTTIME)?date("Y-m-d", $v->POSTTIME):(date("H:i:s", $v->POSTTIME)."&emsp;");
            $replyTime = ($curTime > $last->POSTTIME)?date("Y-m-d", $last->POSTTIME):(date("H:i:s", $last->POSTTIME)."&emsp;");
            $info[] = array(
                "tag" => $this->_getTag($v),
                "title" => Sanitize::html($v->TITLE),
                "poster" => $v->isSubject()?$v->OWNER:"ԭ����ɾ��",
                "postTime" => $postTime,
                "gid" => $v->ID,
                "last" => $last->OWNER,
                "replyTime" => $replyTime,
                "num" => $v->articleNum - 1,
                "page" => $page,
                "del" => $bm?1:0
            );
        }
        $this->set("info", $info);
        $this->set("noThreads", ECode::msg(ECode::$BOARD_NOTHREADS));
        $link = "?p=%page%";
        $pageBar = $pagination->getPageBar($p, $link);

        $bms = split(" ", $this->_board->BM);
        foreach($bms as &$bm){
            if(preg_match("/[^0-9a-zA-Z]/", $bm)){
                $bm = array($bm, false);
            }else{
                $bm = array($bm, true);
            }
        }

        $this->set("totalPage", $pagination->getTotalPage());
        $this->set("todayNum", $this->_board->getTodayNum());
        $this->set("curNum", $this->_board->CURRENTUSERS);
        $this->set("totalNum", $this->_board->threadsNum);
        $this->set("curPage", $pagination->getCurPage());
        $this->set("bms", $bms);
        $this->set("bName", $this->_board->NAME);
        $this->set("tmpl", $this->_board->isTmplPost());
        $this->set("hasVote", count($this->_board->getVotes()) != 0);
        $this->set("pageBar", $pageBar);
        //for default search day 
        $this->set("searchDay", Configure::read("search.day"));
        //for elite path
        $this->set("elitePath", urlencode($this->_board->getElitePath()));
        $this->jsr[] = "var user_post=" . ($this->_board->hasPostPerm($u)?"true":"false") . ";";
    }

    public function vote(){
        $this->requestLogin();
        $this->_getNotice();
        $this->notice[] = array("url"=>"javascript:void(0);", "text"=>"ͶƱ");
        App::import('Sanitize');
        if(isset($this->params['num'])){
            $num = (int) $this->params['num']; 
            $vote = $this->_board->getVote($num);
            if($this->RequestHandler->isPost()){
                $v = @$this->params['form']['v'];
                $msg = @$this->params['form']['msg'];
                $val = 0;
                if($vote['type'] == '����'){
                    $val = (int)$v;
                }else if($vote['type'] == '��ѡ'){
                    if(count((array)$v) > $vote['limit'])
                        $this->error(ECode::$BOARD_VOTEFAIL);
                    foreach((array)$v as $k=>$v)
                        $val += 1 << intval($k);
                }else if($vote['type'] != '�ʴ�'){
                    $val = 1 << intval($v);
                }
                if(!$this->_board->vote($num, $val, $msg))
                    $this->error(ECode::$BOARD_VOTEFAIL);
                $this->waitDirect(
                    array(
                        "text" => $this->_board->DESC, 
                        "url" => "/board/" . $this->_board->NAME
                    ),ECode::$BOARD_VOTESUCCESS,
                    array(array("text" => "ͶƱ�б�", "url" => '/board/' .  $this->_board->NAME . '/vote/')
                        ,array("text" => Configure::read("site.name"), "url" => Configure::read("site.home"))
                    ));

            }
            if($vote === false)
                $this->error();
            $vote['start'] = date('Y-m-d H:i:s', $vote['start']);
            $vote['day'] .= '��';
            $vote['title'] = Sanitize::html($vote['title']);
            if(is_array($vote['val'])){
                foreach($vote['val'] as &$v)
                    $v = Sanitize::html($v);
            }
            $this->set($vote);
            $this->render("vote_que");
            return;
        }
        $votes = $this->_board->getVotes();
        $info = array();
        foreach($votes as $k=>$v){
            $info[$k]['owner'] = $v['USERID'];
            $info[$k]['title'] = Sanitize::html($v['TITLE']);
            $info[$k]['start'] = date('Y-m-d H:i:s', $v['DATE']);
            $info[$k]['type'] = $v['TYPE'];
            $info[$k]['day'] = $v['MAXDAY'].'��';
        }
        $this->set("info", $info);
        $this->set("bName", $this->_board->NAME);
    }

    private function _getTag($threads){
        if($threads->isTop()){
            return "T";
        }
        if($threads->isM() || $threads->isB()){
            return "M";
        }
        if($threads->isNoRe()){
            return ";";
        }
        if($threads->isG()){
            return "G";
        }
        if($threads->articleNum > 10)
            return "L";
        return "N";
    }

    private function _getNotice(){
        $root = Configure::read("section.{$this->_board->SECNUM}");
        $this->notice[] = array("url"=>"/section/{$this->_board->SECNUM}", "text"=>$root[0]);
        $boards = array(); $tmp = $this->_board;
        while(!is_null($tmp = $tmp->getDir())){
            $boards[] = array("url"=>"/section/{$tmp->NAME}", "text"=>$tmp->DESC);
        }
        foreach($boards as $v)
            $this->notice[] = $v;
        $this->notice[] = array("url"=>"/board/{$this->_board->NAME}", "text"=>$this->_board->DESC);
    }
}
?>
