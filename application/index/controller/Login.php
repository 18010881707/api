<?php
/**
 * Created by PhpStorm.
 * User: 牛旺科技
 * Date: 2019/7/25
 * Time: 10:50
 */

namespace app\index\controller;


use think\Controller;
use think\Db;
use think\config;


class Login extends Controller
{
    /**登录
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function login()
    {

        $user_name = input('post.username','','trim');
        $password = input('post.password','','trim');
        $remember = input('post.checked');//是否记住一周
        $timestamp = time();


        $user_info = Db::name('user')->where('user_name',$user_name)->find();


        if(!$user_info) {

            $return = my_return('',500,'用户名错误！');
            return $return;
        }

        if($user_info['state'] != 1) {

            $return = my_return('',500,'账户不可用，请联系管理员');
            return $return;
        }

        if(md5($password.$user_info['add_time']) == $user_info['password']) {
                //删除已存在token
            $re = delete_token($user_info['uid']);
            if($re) {
                //生成新的token
               $token =  generate_token($user_info['uid']);
               $expire_time = 60*60*24; //默认一天
               if($remember) {
                   $expire_time *= 7;
               }
               $insert_data = [
                   'uid'=>$user_info['uid'],
                   'token'=>$token,
                   'add_time'=>$timestamp,
                   'expire_time'=>$timestamp+$expire_time
               ];
               $add_res = Db::name('user_token')->insert($insert_data);

               if($add_res) {

                   $return_data = [
                       'uid'=>$user_info['uid'],
                       'user_name'=>$user_info['user_name'],
                       'position'=>$user_info['position'],
                       'types'=>$user_info['types'],
                       'token'=>$token,
                   ];
                   $return = my_return($return_data,200,'登录成功');
                   return $return;
               } else {
                   $return = my_return('',500,'登陆失败！');
                   return $return;
               }


            } else {

                $return = my_return('',500,'登陆信息更新失败！');
                return $return;
            }



        } else {

            $return = my_return('',500,'密码错误！');

            return $return;
        }
    }

    /**退出登录
     * @return array
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function logout(){
        $token = $_SERVER['HTTP_TOKEN'];
        $user_id = input('request.token_uid');

        $res = Db::name('user_token')->where(['token'=>$token,'uid'=>$user_id])->delete();
        if($res) {
            $return = my_return('',200,'退出成功');
            return $return;
        } else {
            $return = my_return('',500,'退出失败');
            return $return;
        }
    }

    public function test(){

       echo ROOT_PATH;
//        dump($data);die;


    }
}