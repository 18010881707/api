<?php
/**
 * Created by PhpStorm.
 * User: 牛旺科技
 * 材料验收
 * Date: 2019/9/2
 * Time: 9:52
 */

namespace app\index\controller;

use think\Db;

class Material extends Base
{
    /**
     * 列表
     */
    public function index()
    {
        $limit = input('post.limit', 20);
        $page = input('post.page', 1);
        $project_id = input('post.pid', 0);
        $state = input('post.state', 0);
        $material_name = input('post.material_name', '');
        $where = ' t.id > 0';

        $my_uid = $this->uid;
        if ($project_id) {
            $where .= ' and t.pid = ' . $project_id;
        }
        if ($state) {
            $where .= ' and t.state = ' . $state;
        }
        if ($material_name != '') {
            $where .= " and t.material_name like '%$material_name%' ";
        }

        $total = Db::name('material_acceptance')->alias('t')->where($where)->count();
        $plan_list = Db::name('material_acceptance')
            ->alias('t')
            ->join('__PROJECT__ p', 'p.id = t.pid', 'LEFT')
            ->join('__USER__ u', 'u.uid = t.creator', 'LEFT')
            ->join('__USER__ us', 'us.uid = t.acceptor', 'LEFT')
            ->where($where)
            ->page($page, $limit)
            ->order('t.update_time desc')
            ->field('t.*,p.project_name,u.user_name as creator,us.user_name as acceptor,u.uid')
            ->select();
        $pagedata = [
            'page' => $page,
            'limit' => $limit,
            'total' => $total
        ];

        foreach ($plan_list as $key => $value) {
            $plan_list[$key]['add_time'] = date('Y-m-d', $value['add_time']);
            if ($plan_list[$key]['update_time']) {
                $plan_list[$key]['update_time'] = date('Y-m-d', $value['update_time']);
            }


            //获取抄送人
            if ($value['read_group'] == 0) {
                $serch_list = $value['read_people'];
            } else {
                $group_user = get_group($value['read_group']);
                if ($group_user) {
                    $serch_list = $group_user['group_uid'];
                } else {
                    $return = my_return('', 500, '用户分组未找到');
                    return $return;
                }
            }
            $serch_list_chao = explode(',', $serch_list);//抄送人
            //获取监理，建设审批人
            $serch_list_jianli = explode(',', $value['jianli_accept']);
//            $me[0] = $my_uid;
            if($value['need_jianshe_verify'] ==1) {
                //没有建设单位
                $serch_list_all = array_merge($serch_list_chao,$serch_list_jianli);
            } else {
                //有建设单位
                $serch_list_jianshe = explode(',', $value['target_accept_user']);
                $serch_list_all = array_merge($serch_list_chao,$serch_list_jianli,$serch_list_jianshe);
            }
            //加上发起者自己
            array_push($serch_list_all,$value['creator']);
            $plan_list[$key]['can_read'] = in_array($my_uid,$serch_list_all );//当前用户是否可见
            //去除不可见的数据
            if(!$plan_list[$key]['can_read']) {
                unset($plan_list[$key]);
            }
        }
        $re_data['list'] = array_values($plan_list);
        $re_data['page'] = $pagedata;


        $return = my_return($re_data, 200, '操作成功');
        return $return;
    }

    /**
     * 新建材料验收
     */
    public function addMaterial()
    {
        $pid = input('post.pid', 0);//所属项目
        $material_name = input('post.material_name', '');
        $material_server = input('post.material_server', '');
        $position = input('post.position', '');//位置
        $remark = input('post.des', '');//描述
        $group = input('post.group');//是否分组
        $target_accept_user = input('post.target_accept_user/a', '');//建设方验收人
        $jianli_accept = input('post.jianli_accept/a', '');//监理方验收人
        $need_accept = input('post.need_accept', 1);//是否需要验收 1:无需验收 2：需要
        if ($group) {
            $to_user = input('post.to_user');//抄送人
        } else {
            $to_user = input('post.to_user/a');//抄送人组
        }


        if (mb_strlen($remark) > 100) {
            $return = my_return('', 500, '描述请不要超过100字');
            return $return;
        }

        $time = time();
        $userinfo = $this->user_info;

        if ($userinfo['types'] != 4) {
            $return = my_return('', 500, '您无权创建');
            return $return;
        }
        if ($need_accept == 2) {
            if ($target_accept_user == '') {
                $return = my_return('', 500, '请选择建设方验收人');
                return $return;
            }


        }

        if (!$pid || !$material_name || !$jianli_accept) {
            $return = my_return('', 500, '参数不全');
            return $return;
        }

        $insert_data = [
            'pid' => $pid,
            'material_name' => $material_name,
            'material_server' => $material_server,
            'position' => $position,
            'remark' => $remark,
            'target_accept_user' => implode(',', $target_accept_user),
            'jianli_accept' => implode(',', $jianli_accept),
            'state' => 1,
            'need_jianshe_verify' => $need_accept,
            'add_time' => $time,
            'update_time' => $time,
            'creator' => $userinfo['uid'],
        ];

        if ($group) {
            //分组
            $insert_data['read_group'] = $to_user;
            $notify_data_t = get_group($to_user);
//            $notify_data = explode(',', $notify_data_t['group_uid']);

        } else {
//            $notify_data = $to_user;
            $insert_data['read_people'] = implode(',', $to_user);

        }

        $res = Db::name('material_acceptance')->insert($insert_data);
        if (!$res) {
            $return = my_return('', 500, '创建失败');
            return $return;
        }
        //保存通知表 用户登录通知

        /*if ($need_accept == 2) {
            $notify_data = array_merge($notify_data, $target_accept_user);
        }

        foreach ($notify_data as $k => $v) {
            $notify[$k]['uid'] = $v;
            $notify[$k]['type'] = 1;
            $notify[$k]['describe'] = '您有一个材料问题待验收';
            $notify[$k]['state'] = 1;
            $notify[$k]['add_time'] = $time;
        }

        $notify_res = Db::name('notify')->insertAll($notify);

        if (!$notify_res) {
            $return = my_return('', 200, '创建成功,通知创建失败');
            return $return;
        }*/

        $return = my_return('', 200, '创建成功');
        return $return;
    }

    /**
     * 删除
     */
    public function del()
    {
        $id = input('post.id', 0);
        if (!$id) {
            $return = my_return('', 500, '参数缺失');
            return $return;
        }
        $uid = $this->uid;
        $info = Db::name('material_acceptance')->where('id', $id)->find();
        if (!$info) {
            $return = my_return('', 500, '记录未找到');
            return $return;
        }

        if ($uid != $info['creator']) {
            $return = my_return('', 500, '只有本人才能删除');
            return $return;
        }

        $res = Db::name('material_acceptance')->where('id', $id)->delete();
        if ($res === false) {
            $return = my_return('', 500, '删除失败');
            return $return;
        } else {
            $return = my_return('', 200, '删除成功');
            return $return;
        }

    }

    /**
     * 查看详情
     */
    public function materialDetail()
    {
        $id = input('post.id', 0);
        /*$is_read_id = input('post.is_read_id',0);

        if($is_read_id) {
            //通过通知打开，标记消息已读
            Db::name('notify')->where('id',$is_read_id)->update(['state'=>2,'read_time'=>time()]);
        }*/
        if (!$id) {
            $return = my_return('', 500, '参数缺失');
            return $return;
        }
        $where['t.id'] = $id;
        $my_uid = $this->uid;


        $plan_list = Db::name('material_acceptance')
            ->alias('t')
            ->join('__PROJECT__ p', 'p.id = t.pid', 'LEFT')
            ->join('__USER__ u', 'u.uid = t.creator', 'LEFT')
            ->join('__USER__ us', 'us.uid = t.acceptor', 'LEFT')
            ->where($where)
            ->order('t.update_time desc')
            ->field('t.*,p.project_name,u.user_name as creator,us.user_name as acceptor')
            ->find();


        $plan_list['add_time'] = date('Y-m-d', $plan_list['add_time']);
        $plan_list['update_time'] = date('Y-m-d', $plan_list['update_time']);


        if ($plan_list['read_group'] == 0) {
//            $serch_list = $plan_list['read_people'];
            $plan_list['group'] = false;
            $plan_list['read_people'] = explode(',', $plan_list['read_people']);
        } else {
            $plan_list['group'] = true;
            $group_user = get_group($plan_list['read_group']);
            if ($group_user) {
//                $serch_list = $group_user['read_group'];
            } else {
                $return = my_return('', 500, '用户分组未找到');
                return $return;
            }
        }
//        $serch_list = explode(',',$serch_list);

        $plan_list['target_accept_user'] = explode(',', $plan_list['target_accept_user']);
        $plan_list['jianli_accept'] = explode(',', $plan_list['jianli_accept']);
        if ($plan_list['state'] == 1) {
            //监理方验收
            $serch_list = $plan_list['jianli_accept'];
//            $serch_list = array_merge($serch_list,explode(',',$plan_list['target_accept_user']));

            $plan_list['about_me'] = in_array($my_uid, $serch_list);
        }elseif ($plan_list['state'] == 2){
            //建设方可验收
            $serch_list = $plan_list['target_accept_user'];
//            $serch_list = array_merge($serch_list,explode(',',$plan_list['target_accept_user']));

            $plan_list['about_me'] = in_array($my_uid, $serch_list);
        } else {

            $plan_list['about_me'] = false;
        }


        $return = my_return($plan_list, 200, '操作成功');
        return $return;
    }

    /**
     * 审批验收
     */
    public function verifyAccept()
    {
        $id = input('post.id', 0);
        $verify = input('post.verify', 0);//3：通过 4：驳回
        $refuse_reason = input('post.refuse_reason', '', 'trim');
        $uid = $this->uid;
        if (mb_strlen($refuse_reason) > 100) {
            $return = my_return('', 500, '驳回理由不要超过100字');
            return $return;
        }
        if (!$verify || !$id) {
            $return = my_return('', 500, '参数不全');
            return $return;
        }


        $info = Db::name('material_acceptance')->where('id', $id)->find();
        if (!$info) {
            $return = my_return('', 500, '记录未找到');
            return $return;
        }

        if(in_array($uid, explode(',', $info['jianli_accept']))) {

            $types = 1 ;//当前是监理验收
        } elseif (in_array($uid, explode(',', $info['target_accept_user']))) {
            //当前是建设方验收
            $types = 2;
        } else {

            $return = my_return('', 500, '您不是指定验收人');
            return $return;
        }

        if($info['state'] == 1) {
            //待监理验收
            if($types == 2) {
                $return = my_return('', 500, '先等待监理验收。。');
                return $return;
            }
            if($verify == 3) {
                if($info['need_jianshe_verify'] == 2) {
                    //需要建设方验收
                    //通过，下一步建设方验收
                    $state = 2;
                } else{
                    $state = $verify;
                }

            } else {
                $state = $verify;
            }

        } elseif($info['state'] == 2) {
            //需要建设方验收
            if($types !=2){
                $return = my_return('', 500, '需要建设方验收');
                return $return;
            }
            $state = $verify;
        }






        $update = [
            'state' => $state,
            'update_time' => time(),
            'acceptor' => $uid,
            'refuse_reason' => $refuse_reason,

        ];
        $res = Db::name('material_acceptance')->where('id', $id)->update($update);
        if ($res === false) {
            $return = my_return('', 500, '审核失败');
            return $return;
        } else {
            $return = my_return('', 200, '审核成功');
            return $return;
        }


    }
}