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


//材料
//        $userInfo = $this->user_info;
//        $uid = $this->uid;
        $uid = 3;
        $userInfo['types'] = 2;
        $material = Db::name('material_acceptance')->where('state','<',3)->select();
        $data[0][0] = 0;//材料抄送数 初始化
        $data[0][1] = 0;//材料待处理
        $data[1][0] = 0;//质量抄送
        $data[2][0] = 0;//安全抄送
        $data[1][1] = 0;//质量待处理
        $data[2][1] = 0;//安全待处理
        foreach ($material as $key => $value) {
            if ($value['read_group'] == 0) {
                $serch_list = $value['read_people'];
            } else {
                $group_user = get_group($value['read_group']);
                $serch_list = $group_user['group_uid'];

            }
            $serch_list_chao = explode(',', $serch_list);//抄送人
            if(in_array($uid,$serch_list_chao )){
                $data[0][0]++;
            }
            $serch_list_chuli = explode(',',$value['jianli_accept']);
            if($value['target_accept_user'] != '') {
                $jianshe = explode(',',$value['target_accept_user']);
                $serch_list_chuli = array_merge($serch_list_chuli,$jianshe);
            }
            if(in_array($uid,$serch_list_chuli )){
                $data[0][1]++;
            }

        }

        $dataInfo = Db::name('quality')->where('state','<>',3)->select();

        foreach ($dataInfo as $k => $v) {
            if($v['state'] == 2){
                if($userInfo['types'] == 2 || $userInfo['types'] == 3) {
                    $data[1][1]++;
                }
            } else {
                if ($v['modify_group'] == 0) {
                    $serch_list = $v['modify_people'];
                } else {
                    $group_user = get_group($v['modify_group']);
                    $serch_list = $group_user['group_uid'];

                }
                $serch_list_chao = explode(',', $serch_list);//抄送人
                if(in_array($uid,$serch_list_chao )){
                    if($v['type'] == 1) {
                        //质量
                        $data[1][0]++;
                    } else {
                        $data[2][0]++;
                    }

                }
                if(in_array($uid,explode(',',$v['do_people']))) {
                    if($v['type'] == 1) {
                        //质量
                        $data[1][1]++;
                    } else {
                        $data[2][1]++;
                    }
                }
            }
        }
        dump($data);die;


    }
}