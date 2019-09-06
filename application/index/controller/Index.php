<?php
namespace app\index\controller;


use think\Db;
use think\config;

class Index extends Base
{

    /**
     * 首页
     */
    public function index(){
        //材料
        $userInfo = $this->user_info;
        $uid = $this->uid;
        $material = Db::name('material_acceptance')->where('state','<',3)->select();
        $data[0][0] = 0;//材料抄送数 初始化
        $data[0][1] = 0;//材料待处理
        $data[1][0] = 0;//质量抄送
        $data[1][1] = 0;//质量待处理
        $data[2][0] = 0;//安全抄送
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
        $re_data['material'] = $data[0];
        $re_data['quality'] = $data[1];
        $re_data['safe'] = $data[2];

        $return = my_return($re_data,200,'成功');
        return $return;

    }

    /**
     * 用户列表
     */
    public function memberList(){
        $limit = input('post.limit',20);
        $page = input('post.page',1);
        $is_page = input('post.is_page',1);
        $type = input('post.types',0);
        $user_name = input('post.user_name',0);
        $where = ' 1=1 ';
        if($type !=0) {
            $where.=' and types = '.$type;
        }
        if($user_name != 0) {
            $where.=" and user_name like '%$user_name%'";
        }
        if($is_page == 1) {
            $total = Db::name('user')->where($where)->count();
            $member_list = Db::name('user')->order('uid desc')->field('uid,user_name,position,types,add_time,state')->page($page,$limit)->where($where)->select();
            $pagedata = [
                'page'=>$page,
                'limit'=>$limit,
                'total'=>$total
            ];

            $re_data['list'] = $member_list;
            $re_data['page'] = $pagedata;
        } else {
            $re_data = Db::name('user')->order('uid desc')->field('uid,user_name,position,types,add_time,state')->where($where)->select();
        }

        $return = my_return($re_data,200,'操作成功');
        return $return;
    }

    /**
     * 启用/禁用用户
     */
    public function userState(){
        $state = input('post.state',1);
        $uid = input('post.uid');
        $res = Db::name('user')->where('uid',$uid)->update(['state'=>$state]);
        if($res) {
            $return = my_return('',200,'已更新');
            return $return;
        } else {
            $return = my_return('',500,'未更新');
            return $return;
        }
    }

    /**
     * 添加用户
     * @return array
     */
   public function addMember(){

       $user_name = input('post.user_name','','trim');
       $password = input('post.password','123456','trim');
       $position = input('post.position','','trim');
       $type = input('post.types',0);
       //验证用户登录是否存在
       $user_info = $this->user_info;

       if($password == '') {
           $password = '123456';
       }
       if(!legal_username($user_name)) {

           $return = my_return('',500,'请输入2-12位用户名');
           return $return;
       }

       //验证用户名是否重复

       if(username_exist($user_name)) {
           $return = my_return('',500,'该用户名已存在');
           return $return;
       }

       if(!legal_password($password)) {
           $return = my_return('',500,'请输入6-16位不含中文的密码');
           return $return;
       }

       if(!$position) {
           $return = my_return('',500,'请输入用户职位');
           return $return;
       }
       if(!$type) {
           $return = my_return('',500,'请选择用户身份');
           return $return;
       }
       if($user_info['types'] != 1) {

           $return = my_return('',500,'您无权操作');
           return $return;
       }
       $time = time();
       $data = [
           'user_name'=>$user_name,
           'password'=>md5($password.$time),
           'position'=>$position,
           'types'=>$type,
           'add_time'=>$time,

       ];
       Db::name('user')->insert($data);
       $return = my_return('',200,'添加成功！');
       return $return;
   }

   /**
    * 修改用户信息
    */
   public function editUser(){
       $user_name = input('post.user_name','','trim');
       $password = input('post.password',0,'trim');
       $position = input('post.position','','trim');
       $type = input('post.types',0);
       $uid = input('post.uid',0);

       $edit_user = get_userinfo($uid);
       if(!$edit_user) {
           $return = my_return('',500,'用户不存在');
           return $return;
       }
       $user_info = $this->user_info;

       if(!legal_username($user_name)) {

           $return = my_return('',500,'请输入2-12位用户名');
           return $return;
       }

       //验证用户名是否重复

       $res = Db::name('user')->where("uid != '$uid' and  user_name ='$user_name' ")->find();

       if($res) {
           $return = my_return('',500,'该用户名已存在');
           return $return;
       }


       if(!$position) {
           $return = my_return('',500,'请输入用户职位');
           return $return;
       }
       if(!$type) {
           $return = my_return('',500,'请选择用户身份');
           return $return;
       }
       if($user_info['types'] != 1) {

           $return = my_return('',500,'您无权操作');
           return $return;
       }
//       $time = time();
       $data = [
           'user_name'=>$user_name,
           'position'=>$position,
           'types'=>$type

       ];
       if($password && $password!=''){
           if(!legal_password($password)) {
               $return = my_return('',500,'请输入6-16位不含中文的密码');
               return $return;
           }
           $data['password'] = md5($password.$edit_user['add_time']);
       }
       $res = Db::name('user')->where('uid',$uid)->update($data);
       if($res ===false) {
           $return = my_return('',500,'修改失败！');
           return $return;
       } else {
           $return = my_return('',200,'修改成功！');
           return $return;
       }

   }

   /**
    * 用户添加分组
    */
   public function addGroup(){
       $group_name = input('post.group_name','','trim');
       $group_user = input('post.group_user/a');
       $user_info = $this->user_info;
       if(!$group_name || !$group_user) {
           $return = my_return('',500,'参数不全');
           return $return;
       }

       $is_name_exist = Db::name('user_group')->where(['uid'=>$user_info['uid'],'group_name'=>$group_name])->find();
       if($is_name_exist) {
           $return = my_return('',500,'组名已存在！');
           return $return;
       }

       $insert_data = [
           'uid' => $user_info['uid'],
           'group_name' => $group_name,
           'group_uid' => implode(',', $group_user),
           'add_time'=>time()
       ];

       $res = Db::name('user_group')->insert($insert_data);
       if($res) {
           $return = my_return('',200,'新建成功！');
           return $return;
       } else {
           $return = my_return('',500,'新建失败！');
           return $return;
       }
   }

   /**
    * 用户分组列表
    */
   public function groupList(){
       $userInfo = $this->user_info;
       $uid = $userInfo['uid'];
       $limit = input('request.limit',20);
       $page = input('request.page',0);// 默认不分页
       $is_page = input('request.is_page',1);
       if($is_page == 1) {
           //分页
           $total = Db::name('user_group')->where('uid',$uid)->count();
           $project = Db::name('user_group')->where('uid',$uid)->order('id desc')->page($page,$limit)->select();
           $pagedata = [
               'page'=>$page,
               'limit'=>$limit,
               'total'=>$total
           ];

           $re_data['list'] = $project;
           $re_data['page'] = $pagedata;
       } else {
           //不分页
           $re_data = Db::name('user_group')->where('uid',$uid)->order('id desc')->select();
       }

       $return = my_return($re_data,200,'操作成功');
       return $return;
   }

   /**
    * 用户分组编辑
    */
   public function groupEdit(){
       $group_id = input('post.group_id',0);
       $group_name = input('post.group_name','','trim');
       $group_user = input('post.group_user/a');
       $userInfo = $this->user_info;
       $uid = $userInfo['uid'];
       if(!$group_name || !$group_user || !$group_id) {
           $return = my_return('',500,'参数不全');
           return $return;
       }

       $is_name_exist = Db::name('user_group')->where(['uid'=>$uid,'group_name'=>$group_name])->where("id != $group_id")->find();
       if($is_name_exist) {
           $return = my_return('',500,'组名已存在！');
           return $return;
       }

       $update_data = [
           'group_name' => $group_name,
           'group_uid' => implode(',', $group_user)
       ];

       $res = Db::name('user_group')->where('id',$group_id)->update($update_data);
       if($res === false) {
           $return = my_return('',500,'更新失败！');
           return $return;
       } else {
           $return = my_return('',200,'更新成功！');
           return $return;
       }

   }

   /**
    * 用户分组删除
    */
   public function groupDel(){
       $group_id = input('post.group_id',0);
       if(!$group_id) {
           $return = my_return('',500,'参数不全');
           return $return;
       }
       $res = Db::name('user_group')->where('id',$group_id)->delete();
       if($res) {
           $return = my_return('',200,'删除成功！');
           return $return;
       } else {
           $return = my_return('',500,'删除失败！');
           return $return;
       }
   }

    /**
     * 单图片上传
     */
    public function upload2(){

        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('file');

        // 移动到框架应用根目录/public/uploads/ 目录下
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
            if($info){

                $host = Config::get('my_host');
                $address = $host.'/uploads/'.$info->getSaveName();
//                $address = str_replace('\',','/',$address);
                $return = my_return($address,200,'上传成功');
                return $return;
                // 成功上传后 获取上传信息
                // 输出 jpg
//                echo $info->getExtension();
                // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
//                echo $info->getSaveName();
                // 输出 42a79759f284b767dfcb2a0197904287.jpg
//                echo $info->getFilename();
            }else{
                // 上传失败获取错误信息
                $return = my_return('',500,$file->getError());
                return $return;
//                echo $file->getError();
            }
        } else {
            $return = my_return('',500,'未检测到文件');
            return $return;
        }
    }

    /**
     * 多文件上传
     */
    public function upload(){
        // 获取表单上传文件
        $files = request()->file('file');
        /*$return = my_return($files,200,'');
        return $return;*/
        foreach($files as $key =>$file){
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
            if($info){
                // 成功上传后 获取上传信息
                // 输出 jpg
                $address[] = $_SERVER['SERVER_NAME'].'/uploads/'.$info->getSaveName();
//                echo $info->getExtension();
                // 输出 42a79759f284b767dfcb2a0197904287.jpg
//                echo $info->getFilename();
            }else{
                // 上传失败获取错误信息
                $return = my_return('',500,$file->getError());
                return $return;

//                echo $file->getError();
            }
        }
        $return = my_return($address,200,'上传成功');
        return $return;
    }

    /**
     * 未读消息通知
     */
    public function notify(){
        $uid = $this->uid;
        $data = Db::name('notify')->where(['uid'=>$uid,'state'=>1])->select();

        $return = my_return($data,200,'成功');
        return $return;

    }

}
