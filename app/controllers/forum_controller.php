<?php
/**
 * forum controller for nforum
 *
 * @author xw
 */
App::import("vendor", "inc/db");
class ForumController extends AppController {

    public function index(){
        $this->js[] = "jquery-ui-1.8.7.pack.js";
        $this->js[] = "forum.xwidget.js";
        $this->css[] = "jquery-ui-1.8.7.css";
        $this->css[] = "xwidget.css";
        $this->notice = array(array("url"=>Configure::read("site.notice.url"), "text"=>Configure::read("site.notice.text")));

        App::import('Sanitize');
        App::import('vendor', 'model/widget');
        $u = User::getInstance();
        $ret = $w = array();
        $ret = Widget::wGet($u);
        if(empty($ret)){
            $this->set("widget", array());    
            return;
        }
        $persistent = Configure::read("widget.persistent");
        if($persistent){
            $time = (array) nforum_cache_read("widget_time");
            $update = false;
        }
        $w = array_fill(1, ($u->getCustom("userdefine1", 31) == 1)?3:2, array());
        foreach($ret as $v){
            $w[$v['col']][$v['row']] = $v;
            if($persistent){
                try{
                    $ww = Widget::getInstance($v['name']);
                    if(strpos($v['name'], "favor-") === 0){
                        $html = Widget::html($ww->wGetList());
                    }else if(!isset($time[$v['name']]) || $time[$v['name']] < $ww->wGetTime() || false === ($html = nforum_cache_read("widget_" . $v['name']))){
                        $time[$v['name']] = $ww->wGetTime();
                        $html = Widget::html($ww->wGetList());
                        nforum_cache_write("widget_" . $v['name'], $html);
                        $update = true;
                    }
                }catch(WidgetNullException $e){
                    $ww = new EWidget();
                    //if persistent,it will not check wiget time and will not update widget_time.
                    $html = Widget::html($ww->wGetList());
                }
                $w[$v['col']][$v['row']]['content'] = $html;
            }
        }
        if($persistent && $update) nforum_cache_write("widget_time", $time);
        $this->set("widget", $w);    
        $this->jsr[] = 'var persistent=' . ($persistent?'true':'false');
    }
    
    public function preIndex(){
        if($this->ByrSession->isLogin)
            $this->redirect(Configure::read("site.home"));
        $this->brief = true;
        $this->js[] = "forum.pre.js";
        $this->css[] = "preindex.css";
        $this->set("preimg", $this->Adv->getPreImg());
        $this->set("preadv", $this->Adv->getPreAdv());
    }

    public function flink(){
        $this->css[] = "flink.css";
        $this->notice[] = array("url"=>"javascript:void(0)", "text"=>"友情链接");
        $file = BBS_HOME . '/etc/friend_link';
        $plant = $img = array();
        if(file_exists($file)){
            $content = file_get_contents($file);
            $contents = explode("*img*",$content);      //分开文字连接和图片链接
            $plant = explode("\n",$contents[0]);         //获取文字连接
            $img = explode("\n",$contents[1]);
        }
        foreach($plant as &$v){
            $v = split("[ \r\n\t]+", $v);
        }
        foreach($img as &$v){
            $v = split("[ \r\n\t]+", $v);
        }
        $this->set("plant", $plant);
        $this->set("img", $img);
    }

    public function online(){
        $this->requestLogin();
        $this->js[] = "forum.friend.js";
        $this->css[] = "mail.css";
        $this->notice[] = array("url"=>"/online", "text"=>"在线用户");

        $p = isset($this->params['url']['p'])?$this->params['url']['p']:1;
        try{
            App::import("vendor", "inc/pagination");
            $f = Forum::getOnlineUser();
            $pagination = new Pagination($f, Configure::read("pagination.friend"));
            $users = $pagination->getPage($p);
        }catch(FriendNullException $e){
            $this->error();
        }
        if($f->getTotalNum() > 0){
            $info = array();
            foreach($users as $v){
                $info[] = array(
                    "fid" => $v->userid,
                    "from" => $v->userfrom,
                    "mode" => $v->mode,
                    "idle" => sprintf('%02d:%02d',intval($v->idle/60), ($v->idle%60))
                );
            }
            $this->set("friends", $info);
        }
        $link = "?p=%page%";
        $pageBar = $pagination->getPageBar($p, $link);
        $this->set("pageBar", $pageBar);
        $this->set("totalNum", $f->getTotalNum());
        $this->set("curPage", $pagination->getCurPage());
        $this->set("totalPage", $pagination->getTotalPage());
    }
}
?>
