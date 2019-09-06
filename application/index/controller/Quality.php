<?php
/**
 * Created by PhpStorm.
 * User: 牛旺科技
 * 质量检查
 * Date: 2019/8/26
 * Time: 14:56
 */

namespace app\index\controller;

use think\Db;
class Quality extends Base
{

    /**
     * 创建质检/安全
     */
    public function addQuality(){
        $pid = input('post.pid',0);//所属项目
        $build = input('post.build','');//楼号
        $floor = input('post.floor','');//楼层数
        $position   = input('post.position','');//位置
        $description = input('post.des','');//描述
        $images = input('post.images/a');
        $modify_time = input('post.modify_time','');//整改时间
        $group = input('post.group');//是否分组
        $do_people = input('post.do_people/a');//是否分组
        if($group) {
            $to_user = input('post.to_user');
        } else {
            $to_user = input('post.to_user/a');
        }
        $type = input('type'); //1:质量 2：安全

        if(mb_strlen($description) >100) {
            $return = my_return('',500,'描述请不要超过100字');
            return $return;
        }

        $time = time();
        $userinfo = $this->user_info;

        if($userinfo['types'] == 4) {
            $return = my_return('',500,'您无权创建');
            return $return;
        }

        if(!$pid || !$build || !$floor|| !$images || !$modify_time ||!$type || !$do_people) {
            $return = my_return('',500,'参数不全');
            return $return;
        }

        $insert_data = [
            'pid'=>$pid,
            'build'=>$build,
            'floor'=>$floor,
            'position'=>$position,
            'description'=>$description,
            'state'=>1,
            'add_time'=>$time,
            'update_time'=>$time,
            'type'=>$type,
            'require_time'=>strtotime($modify_time),
            'creator'=>$userinfo['uid'],
            'image'=>implode(',',$images),
            'do_people'=>implode(',',$do_people),
        ];

        if($group) {
            //分组
            $insert_data['modify_group'] = $to_user;
            $notify_data_t = get_group($to_user);
            $notify_data = explode(',',$notify_data_t['group_uid']);

        } else {
            $notify_data = $to_user;
            $insert_data['modify_people'] = implode(',',$to_user);

        }

        $res = Db::name('quality')->insert($insert_data);
        if(!$res) {
            $return = my_return('',500,'创建失败');
            return $return;
        }
        //保存通知表 用户登录通知

        if($type == 1) {
            $key = '质量';
        } else {
            $key = '安全';
        }
        foreach ($notify_data as $k =>$v) {
            $notify[$k]['uid'] = $v;
            $notify[$k]['type'] = 1;
            $notify[$k]['describe'] = '您有一个'.$key.'问题待处理';
            $notify[$k]['state'] = 1;
            $notify[$k]['add_time'] = $time;
        }

        /*$notify_res = Db::name('notify')->insertAll($notify);

        if(!$notify_res) {
            $return = my_return('',200,'创建成功,通知创建失败');
            return $return;
        }*/

        $return = my_return('',200,'创建成功');
        return $return;





    }

    /**
     *质检安全列表
     */
    public function qualityList(){
        $limit = input('post.limit',20);
        $page = input('post.page',1);
        $project_id = input('post.pid',0);
        $state  = input('post.state',0);
        $type = input('cate_type',1); //1:质量 2：安全
        $where = ' t.type = '.$type;
        $time = time();

        $my_uid = $this->uid;
        if($project_id) {
            $where .=' and t.pid = '.$project_id;
        }
        if($state) {
            $where .=' and t.state = '.$state;
        }

            $total = Db::name('quality')->alias('t')->where($where)->count();
            $plan_list = Db::name('quality')
                ->alias('t')
                ->join('__PROJECT__ p','p.id = t.pid','LEFT')
                ->join('__USER__ u','u.uid = t.creator','LEFT')
                ->join('__USER__ us','us.uid = t.verify_user','LEFT')
                ->where($where)
                ->page($page,$limit)
                ->order('t.update_time desc')
                ->field('t.*,p.project_name,u.user_name as creator,us.user_name as verify_user,u.uid')
                ->select();
            $pagedata = [
                'page'=>$page,
                'limit'=>$limit,
                'total'=>$total
            ];

            foreach ($plan_list as $key => $value) {
                $plan_list[$key]['add_time'] = date('Y-m-d',$value['add_time']);
                $plan_list[$key]['require_time'] = date('Y-m-d',$value['require_time']);
                if($value['state'] != 3) {
                    if($value['require_time'] < $time) {
                        //超时未整改
                        $plan_list[$key]['state'] = 5;
                    }

                }

                if($value['modify_group'] == 0) {
                    $serch_list = $value['modify_people'];
                } else {
                    $group_user = get_group($value['modify_group']);
                    if($group_user) {
                        $serch_list = $group_user['group_uid'];
                    }else {
                        $return = my_return('',500,'用户分组未找到');
                        return $return;
                    }
                }
                $serch_list_arr = explode(',',$serch_list);
                //加上创建者自己可见
                array_push($serch_list_arr,$value['creator']);
                $plan_list[$key]['about_me'] = in_array($my_uid,$serch_list_arr);
                if(!$plan_list[$key]['about_me']) {
                    unset($plan_list[$key]);
                }
            }
            $re_data['list'] = array_values($plan_list);
            $re_data['page'] = $pagedata;


        $return = my_return($re_data,200,'操作成功');
        return $return;
    }

    /**
     * 查看详情
     */
    public function qualityDetail(){
        $id = input('post.id',0);
        /*$is_read_id = input('post.is_read_id',0);

        if($is_read_id) {
            //通过通知打开，标记消息已读
            Db::name('notify')->where('id',$is_read_id)->update(['state'=>2,'read_time'=>time()]);
        }*/
        if(!$id) {
            $return = my_return('',500,'参数缺失');
            return $return;
        }
        $where['t.id'] = $id;
        $my_uid = $this->uid;

        $time = time();
        $plan_list = Db::name('quality')
            ->alias('t')
            ->join('__PROJECT__ p','p.id = t.pid','LEFT')
            ->join('__USER__ u','u.uid = t.creator','LEFT')
            ->join('__USER__ us','us.uid = t.verify_user','LEFT')
            ->where($where)
            ->order('t.update_time desc')
            ->field('t.*,p.project_name,u.user_name as creator,us.user_name as verify_user')
            ->find();




            if($plan_list['state'] != 3) {
                if($plan_list['require_time'] < $time) {
                    //超时未整改
                    $plan_list['state'] = 5;
                }

            }
            $plan_list['add_time'] = date('Y-m-d',$plan_list['add_time']);
            $plan_list['require_time'] = date('Y-m-d',$plan_list['require_time']);
            if($plan_list['image'] != ''){
                $plan_list['image'] = explode(',',$plan_list['image']);
            }
            if($plan_list['re_image'] != '') {
                $plan_list['re_image'] = explode(',',$plan_list['re_image']);
            }

        $plan_list['do_people'] = explode(',',$plan_list['do_people']);
            if($plan_list['modify_group'] == 0) {
                $serch_list = $plan_list['modify_people'];
                $plan_list['group'] = false;
                $plan_list['modify_people'] = explode(',',$plan_list['modify_people']);
            } else {
                $plan_list['group'] = true;
                $group_user = get_group($plan_list['modify_group']);
                if($group_user) {
                    $serch_list = $group_user['group_uid'];
                }else {
                    $return = my_return('',500,'用户分组未找到');
                    return $return;
                }
            }
            $plan_list['about_me'] = in_array($my_uid,explode(',',$serch_list));



        $return = my_return($plan_list,200,'操作成功');
        return $return;
    }

    /**
     * 质检 安全删除
     */
    public function qualityDelete(){
        $id = input('post.id',0);
        if(!$id) {
            $return = my_return('',500,'参数缺失');
            return $return;
        }
        $uid = $this->uid;
        $info = Db::name('quality')->where('id',$id)->find();
        if(!$info) {
            $return = my_return('',500,'记录未找到');
            return $return;
        }

        if($uid != $info['creator']) {
            $return = my_return('',500,'只有本人才能删除');
            return $return;
        }

        $res = Db::name('quality')->where('id',$id)->delete();
        if($res === false){
            $return = my_return('',500,'删除失败');
            return $return;
        } else {
            $return = my_return('',200,'删除成功');
            return $return;
        }
    }

    /**
     * 整改
     */
    public function modify(){
        $id = input('post.id',0);
        $images = input('post.images/a');
        $uid = $this->uid;
        $userInfo = $this->user_info;
        /*if($userInfo['types'] != 4){
            $return = my_return('',500,'您无需整改');
            return $return;
        }*/

        $this_info = Db::name('quality')->where('id',$id)->find();
        if(!$this_info) {
            $return = my_return('',500,'该问题不存在');
            return $return;
        }

        $time = time();
        if(!$id || !$images)  {
            $return = my_return('',500,'参数缺失');
            return $return;
        }
        $info = Db::name('quality')->where('id',$id)->find();
        if(!$info) {
            $return = my_return('',500,'记录未找到');
            return $return;
        }
        //验证此人是否是整改人
        if($info['modify_group'] == 0) {
            $mod_user = explode(',',$info['modify_people']);
        } else {
            $group_info = get_group($info['modify_group']);
            $mod_user = explode(',',$group_info['group_uid']);
        }

        if(!in_array($uid,$mod_user)){
            $return = my_return('',500,'没有指定您整改');
            return $return;
        }

        $update_date = [
            're_image'=>implode(',',$images),
            'state'=>2,
            'modify_time'=>$time,
            'update_time'=>$time,
        ];
        $res = Db::name('quality')->where('id',$id)->update($update_date);

        //通知发起者
       /* if($this_info['type'] == 1){
            $key = '质量';
        } else {
            $key = '安全';
        }
        $notify['uid'] = $this_info['creator'];
        $notify['type'] = 1;
        $notify['describe'] = '您有一个'.$key.'问题待审批';
        $notify_res = Db::name('notify')->insert($notify);*/

        if($res === false) {

            $return = my_return('',500,'提交失败');
            return $return;
        } else{

            $return = my_return('',200,'提交成功');
            return $return;
        }

    }

    /**
     * 审批整改
     */
    public function verifyModify(){
        $id = input('post.id',0);
        $verify = input('post.verify',0) ;//3：通过 4：驳回
        $refuse_reason  = input('post.refuse_reason','','trim');
        $uid = $this->uid;
        if(mb_strlen($refuse_reason) >100) {
            $return = my_return('',500,'驳回理由不要超过100字');
            return $return;
        }
        if(!$verify || !$id) {
            $return = my_return('',500,'参数不全');
            return $return;
        }

        $userInfo  = $this->user_info;
        if($userInfo['types'] == 4) {
            $return = my_return('',500,'您无权审批');
            return $return;
        }

        $update = [
            'state' =>$verify,
            'update_time' =>time(),
            'verify_user' =>$uid,
            'refuse_reason' =>$refuse_reason,

        ];
        $res = Db::name('quality')->where('id',$id)->update($update);
        if($res === false){
            $return = my_return('',500,'审核失败');
            return $return;
        } else {
            $return = my_return('',200,'审核成功');
            return $return;
        }


    }


}