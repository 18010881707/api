<?php
/**
 * Created by PhpStorm.
 * User: 牛旺科技
 * Date: 2019/7/24
 * Time: 15:03
 */

/**
 * @param array $data
 * @param int $code
 * @param string $message
 * @return array
 */
use think\Db;

function my_return($data=array(),$code,$message=''){

    return ['data'=>$data,'code'=>$code,'msg'=>$message];
}

/**token验证
 * @param string $token
 * @param $uid
 * @return array|bool|false|PDOStatement|string|\think\Model
 */
function token_verify($token='',$uid){
    $time = time();
    if($token == '' || !$uid ){

        return false;
    }
    $token_info = Db::name('user_token')->where(['uid'=>$uid,'token'=>$token])->find();
    if(!$token_info ) {
        //不存在
        return false;
    }
    if($token_info['expire_time'] < $time)  {
        //已过期，删除过期的token记录
        delete_token($uid);
        return false;
    }

    //登录验证成功，返回用户信息
    $user_info = Db::name('user')->where('uid',$uid)->find();
    return $user_info;

}

/**删除已存在的token
 * @param $uid
 * @return bool
 */
function delete_token($uid) {
    if(!$uid) {
        return false;
    }
    $token_info = Db::name('user_token')->where('uid',$uid)->select();
    if($token_info) {

        $re = Db::name('user_token')->where('uid',$uid)->delete();
        if($re) {

            return true;
        } else {

            return false;
        }
    }

   return true;

}

/**
 * 用户名规则验证
 * @param $name
 * @return bool
 */
function legal_username($name) {
    $len = strlen($name);
    if($name == '' || $len < 2 || $len > 12) {

        return false;
    } else {

        return true;
    }
}

/**
 * 密码规则验证
 * @param $password
 */
function legal_password($password) {

    $res = preg_match('/^[\\~!@#$%^&*()-_=+|{}\[\],.?\/:;\'\"\d\w]{6,16}$/', $password);
    if($res) {
        return true;
    } else {
        return false ;
    }
}

function generate_token($v=1){

    $key = mt_rand();

    $hash = hash_hmac("sha1", $v . mt_rand() . time(), $key, true);

    $token = str_replace('=', '', strtr(base64_encode($hash), '+/', '-_'));
    return $token;
}

function username_exist($name) {

    $res = Db::name('user')->where('user_name',$name)->find();
    if($res) {
        return true;
    } else {
        return false;
    }
}

function projectname_exist($name) {
    $res = Db::name('project')->where('project_name',$name)->find();
    if($res) {
        return true;
    } else {
        return false;
    }
}

function get_plan_by_id($id) {
    $res = Db::name('speed_plan')->where('id',$id)->where('state',1)->find();

    return $res;
}

//数字转大写 100以内
function numberToBig($number = 1){
    $bigArr = ['零','一','二','三','四','五','六','七','八','九'];

    if($number < 1){
        $result = '';
    }elseif($number < 10){
        $result = $bigArr[$number];
    }elseif($number % 10 !== 0 && $number < 100){
        $result = (floor($number / 10) > 1) ? $bigArr[floor($number / 10)] : '';
        $result .= '十' .$bigArr[$number % 10];
    }elseif($number % 10 === 0 && $number < 100){
        $result = (floor($number / 10) > 1) ? $bigArr[floor($number / 10)].'十' : '十';
    }else{
        $result = '';
    }
    return $result;
}

/**
 * @param array $data
 * @param int   $id
 * 更新进度
 */
function update_speed_by_id($id=0,$data = []) {
    if(!$data || !$id) {
        return false;
    }

    $res = Db::name('speed_speed')->where('id',$id)->update($data);
    return $res;

}

function get_userinfo($uid) {
    $user_info = Db::name('user')->where('uid',$uid)->find();
    return $user_info;
}

function get_group($id) {
    $res = Db::name('user_group')->where('id',$id)->find();
    return $res;
}



