<?php
/****************************************************
 * FileName: app/vendors/model/forum.php
 * Author: xw <wei.xiao.bupt@gmail.com>
 *****************************************************/
App::import("vendor", array("model/user","inc/pagination"));

/**
 * class Forum encapsulate some global kbs function
 *
 * @author xw
 */
class Forum {

    /**
     * function initUser check current user cookie data valid
     * if valid , complete the user init. guest is also a currrent user
     *
     * @param string $id
     * @param int $utmpnum
     * @param string $utmpkey
     * @return boolean true|false if cookie data is invalid
     * @static
     * @access public
     */
    public static function initUser($id, $utmpnum, $utmpkey){
        $arr = array();
        return (bbs_setonlineuser($id, $utmpnum, $utmpkey, $arr) == 0); 
        
    }

    /**
     * function setUser using current user to login
     * current user will be set in self::checkPwd with bbs_checkpasswd function if no current user set, this funciton will login with guest
     *
     * @param boolean $kick kick out other login session if session is full
     * @return int 
     * @static
     * @access public
     */
    public static function setUser($kick = true){
        $ret = bbs_wwwlogin($kick?1:0);
        return $ret;
    }

    /**
     * function kick out current user from kbs
     *
     * @static
     * @access public
     */
    public static function kickUser(){
        bbs_wwwlogoff();
    }

    public static function setFrom($ip){
        bbs_setfromhost($ip, "");
    }

    /**
     * function checkPwd check password right or not
     * if login must log because it will set current user OMG
     * this is not a well design function
     *
     * @param string $id
     * @param string $pwd
     * @param boolean $md5
     * @param boolean $log if false, can not use $md5
     * @return boolean true|false
     * @static
     * @access public
     */
    public static function checkPwd($id, $pwd, $md5, $log){
        //bbs_checkuserpasswd only check no log 
        //bbs_checkpasswd check, set current user and log error for login 
        $md5 = $md5?1:0;
        if($md5){
            return (bbs_checkpasswd($id, $pwd, $md5) == 0);
        }else{
            if($log)
                return (bbs_checkpasswd($id, $pwd, $md5) == 0);
            else
                return (bbs_checkuserpasswd($id, $pwd) == 0);
        }
    }

    public static function getOnlineUser(){
        return new OnlineUser();
    }

    public static function getOnlineNum(){
        return bbs_getonlinenumber();
    }

    public static function getOnlineUserNum(){
        return bbs_getonlineusernumber();
    }

    public static function getOnlineGuestNum(){
        return bbs_getwwwguestnumber();
    }

    /**
     * function *Att
     * the three functions below handle user upload file
     * they are hard to place any model
     *
     * @return array(size, name, pos)
     * @static
     * @access public
     */
    public static function listAttach(){
        $ret = bbs_upload_read_fileinfo();
        return (array)$ret;
    }

    /**
     *
     * @param string $file
     * @param string $fileName
     * @static
     * @access public
     * @throws AttException
     */
    public static function addAttach($file, $fileName){
        $ret = bbs_upload_add_file($file, $fileName);
        if($ret != 0)
            throw new AttException(ECode::kbs2code($ret));
    }

    /**
     *
     * @param string $name
     * @static
     * @access public
     * @throws AttException
     */
    public static function delAttach($name){
        $ret = bbs_upload_del_file($name);
        if($ret != 0)
            throw new AttException(ECode::kbs2code($ret));
    }
}

class OnlineUser implements Pageable{

    private $_num;

    public function __construct(){
        $this->_num = Forum::getOnlineUserNum();
    }

    public function getTotalNum(){
        return $this->_num;
    }

    public function getRecord($start, $num){
        $users = array();
        $ret = bbs_getonline_user_list($start, $num);
        if($ret == 0)
            return array();
        foreach($ret as $v){
            $info = array();
            if(bbs_getuser($v['userid'], $info) == 0){
                throw new UserNullException();
            }
            $users[] = new User($info, $v);
        }
        return $users;
    }
}
class AttException extends Exception{}
?>
