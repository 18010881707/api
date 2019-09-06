<?php
/**
 * Created by PhpStorm.
 * User: 牛旺科技
 * Date: 2019/7/24
 * Time: 11:17
 * 进度模块
 *
 */

namespace app\index\controller;



use think\Db;

class Speed extends Base
{


    /**
     * 修改项目
     */
    public function editProject()
    {

        $project_name = input('post.project_name','','trim');
        $project_id = input('post.pid',0);

        if(!$project_id) {

            $return = my_return('',500,'参数不全');
            return $return;
        }

        if(!$project_name) {

            $return = my_return('',500,'项目名称不能为空');
            return $return;
        }

        if(projectname_exist($project_name)){
            $return = my_return('',500,'项目名称已存在');
            return $return;
        }
        $data = [
            'project_name'=>$project_name
        ];
        $res = Db::name('project')->where('id',$project_id)->update($data);
        if($res === false) {
            $return = my_return('',500,'修改失败');
            return $return;
        } else {
            $return = my_return('',200,'修改成功');
            return $return;
        }

    }

    /**
     * 新建项目
     */
    public function newProject(){
        $project_name = input('post.project_name','','trim');

        $user_info = $this->user_info;


        if(!$project_name) {

            $return = my_return('',500,'项目名称不能为空');
            return $return;
        }

        if(projectname_exist($project_name)){
            $return = my_return('',500,'项目名称已存在');
            return $return;
        }
        $data = [
            'project_name'=>$project_name,
            'add_time'=>time(),
            'add_user'=>$user_info['user_name'],
            'add_uid'=>$user_info['uid']
        ];
        $res = Db::name('project')->insert($data);
        if($res) {
            $return = my_return('',200,'创建成功');
            return $return;
        } else {
            $return = my_return('',500,'添加失败');
            return $return;
        }
    }

    /**
     * 删除项目
     */
    public function deleteProject(){
    $project_id = input('post.pid',0);
    $uid = $this->uid;
    if(!$project_id) {

        $return = my_return('',500,'参数不全');
        return $return;
    }
    $info = Db::name('project')->where('id',$project_id)->find();
        if($info['add_uid'] != $uid) {
            $return = my_return('',500,'您非创建本人，无权删除');
            return $return;
        }
    $res = Db::name('project')->where('id',$project_id)->update(['delete'=>2]); //假删除
    if($res===false) {
        $return = my_return('',500,'删除失败');
        return $return;
    } else {
        $return = my_return('',200,'删除成功');
        return $return;
    }
}

    /**
     * 删除计划
     */
    public function deletePlan(){
        $project_id = input('post.pid',0);
        $uid = $this->uid;
        if(!$project_id) {

            $return = my_return('',500,'参数不全');
            return $return;
        }

        $info = Db::name('speed_plan')->where('id',$project_id)->find();
        if($info['create_uid'] != $uid) {
            $return = my_return('',500,'您非创建本人，无权删除');
            return $return;
        }

        $res = Db::name('speed_plan')->where('id',$project_id)->update(['state'=>2]); //假删除
        if($res===false) {
            $return = my_return('',500,'删除失败');
            return $return;
        } else {
            $return = my_return('',200,'删除成功');
            return $return;
        }
    }

    /**
     * 模板删除
     */
    public function modelDel() {
        $model_id = input('post.model_id',0);
        if(!$model_id) {
            $return = my_return('',500,'缺少参数');
            return $return;
        }

        Db::startTrans();
        try{
            Db::name('speed_model')->where('id',$model_id)->delete();
            Db::name('speed_model_detail')->where('m_id',$model_id)->delete();
        }catch (\Exception $e) {
            Db::rollback();
            $return = my_return('',500,'删除失败');
            return $return;
        }
        $return = my_return('',200,'删除成功');
        return $return;
    }

    /**
     * 模板编辑
     */
    public function modelEdit(){
        $model_id = input('post.model_id',0);
        if(!$model_id) {
            $return = my_return('',500,'缺少参数');
            return $return;
        }
        $model_list = Db('speed_model')
            ->alias('t')
            ->join('__SPEED_MODEL_DETAIL__ d','d.m_id = t.id','LEFT')
            ->where('t.id',$model_id)
            ->field('t.id as model_id,t.model_name,t.remark,d.id as detail_id,d.c_name,d.parent_id,d.code,d.ctype')
            ->select();
        $return = my_return($model_list,200,'成功');
        return $return;
    }

    /**
     * 新建计划
     */
    public function newPlan() {
        $user_info = $this->user_info;
        $group = input('post.group');//true:按组 false：自由选择
        $project_id = input('post.proj',0);//所属项目ID
        $plan_name = input('post.projName','','trim');//计划名称
        $cate = input('post.survey',0);//是否精确到楼层 1：是 2：否
        $table_data =  input('post.tabledata/a');
        if($group) {
            $can_read = input('post.canRead');
//            $plan_data['see_group'] =$can_read;
            /*$group_info = Db::name('user_group')->where('id',$can_read)->find();
            if(!$group_info) {
                $return = my_return('',500,'未找到该分组');
                return $return;
            }
            $user_see = $group_info['group_uid'];*/

        } else {
            $can_read = input('post.canRead/a');//哪些人能看
            $user_see = implode(',',$can_read);

        }

        $remark = input('post.remark','','trim');
        $time = time();
        if(!$project_id) {
            $return = my_return('',500,'所属项目不能为空');
            return $return;
        }
        if(!$plan_name) {
            $return = my_return('',500,'计划名称不能为空');
            return $return;
        }
        if(!$can_read) {
            $return = my_return('',500,'请选择可看人员');
            return $return;
        }

        //开启事务
        Db::startTrans();

        try{
            //新建计划
            $plan_data = [
              'pid' => $project_id,
              'plan_name'=>$plan_name,
              'remark'=>$remark,
              'include_floor'=>$cate,
              'create_uid'=>$user_info['uid'],
              'add_time'=>$time
            ];
            if($group) {
                $plan_data['see_group'] =$can_read;
            } else {
                $plan_data['user_see'] =$user_see;
            }
            $new_plan_id = Db::name('speed_plan')->insertGetId($plan_data);

            if($new_plan_id) {
                if($cate == 1) {
                    //精确到楼层
                    //创建楼号
                    foreach ($table_data as $key => $value) {
                        $build_data = [
                          'plan_id'=>$new_plan_id,
                          'build_num'=>$value['id'],
//                          'area'=>$value['area'],
                          'floor_num'=>$value['floor'],
                        ];

                        $build_id = Db::name('speed_build')->insertGetId($build_data);

                        if($build_id){
                            //创建层
                            foreach ($value['partial'] as $k => $v) {
                                $floor_data = [
                                    'b_id'=>$build_id,
                                    'floor_num'=>$v['floor'],
                                    'model_id'=>$v['model'],
//                                    'area'=>$v['area']
                                ];

                                $floor_id = Db::name('speed_floor')->insertGetId($floor_data);

                                if($floor_id) {
                                    //保存计划任务
                                    $model_detail = Db::name('speed_model')
                                        ->alias('t')
                                        ->join('__SPEED_MODEL_DETAIL__ de','de.m_id = t.id')
                                        ->where('t.id',$v['model'])
                                        ->select();
                                   /* $return = my_return(Db::name('speed_model')->getLastSql(),500,$model_detail);
                                    return $return;*/
                                    $model_detail_data = [];
                                    if($model_detail) {
                                        foreach($model_detail as $m_key => $m_v) {
                                            $model_detail_data[] = [
                                                'pid'=>$floor_id,
                                                'task_id'=>$m_v['id']
                                            ];
                                        }

                                        //插入分部项任务

                                              Db::name('speed_speed')->insertAll($model_detail_data);

                                        //插入本人可见 本地编辑
//                                          Db::name('speed_speed_stage')->insertAll($model_detail_data);




                                    } else {
                                        Db::rollback();
                                        $return = my_return('',500,'模板不存在');
                                        return $return;
                                        break;
                                    }
                                }


                            }
                        } else {
                            //回滚事务
                            Db::rollback();
                            $return = my_return('',500,'计划创建失败');
                            return $return;
                            break;
                        }
                    }
                } else {
                    //楼栋绑定模型

                    //创建楼号
                    foreach ($table_data as $key => $value) {
                        $build_data = [
                            'plan_id'=>$new_plan_id,
                            'build_num'=>$value['id'],
//                            'area'=>$value['area'],
                            'floor_num'=>$value['floor'],
                            'model_id'=>$value['partial'],
                        ];
                        $build_id = Db::name('speed_build')->insertGetId($build_data);
                        if($build_id){

                                    //保存计划任务
                                    $model_detail = Db::name('speed_model')
                                        ->alias('t')
                                        ->join('__SPEED_MODEL_DETAIL__ de','de.m_id = t.id')
                                        ->where('t.id',$value['partial'])
                                        ->select();

                                    if($model_detail) {
                                        foreach($model_detail as $m_key => $m_v) {
                                            $model_detail_data[] = [
                                                'pid'=>$build_id,
                                                'task_id'=>$m_v['id']
                                            ];
                                        }

                                        //插入分部项任务

                                        Db::name('speed_speed')->insertAll($model_detail_data);

                                        //插入本人可见 本地编辑
                                        Db::name('speed_speed_stage')->insertAll($model_detail_data);



                                    } else {
                                        Db::rollback();
                                        $return = my_return('',500,'模板不存在');
                                        return $return;
                                        break;
                                    }




                        } else {
                            //回滚事务
                            Db::rollback();
                            $return = my_return('',500,'计划创建失败');
                            return $return;
                            break;
                        }
                    }
                }
            } else {
                //回滚事务
                Db::rollback();
                $return = my_return('',500,'计划创建失败');
                return $return;
            }

            // 提交事务
            Db::commit();


        } catch (\Exception $e) {
            //回滚事务
            Db::rollback();
            $return = my_return('',500,'计划创建失败');
            return $return;
        }
        $return = my_return('',200,'计划创建成功');
        return $return;



    }

    /**
     * 查看计划
     */
    public function viewPlan() {
        $plan_id = input('post.plan_id',0);
        $planInfo = get_plan_by_id($plan_id);
        if(!$planInfo) {
            $return = my_return('',500,'计划不可用');
            return $return;
        }
        if($planInfo['include_floor'] == 1) {
            $planData = Db::name('speed_plan')
                ->alias('p')
                ->join('__PROJECT__ pr','pr.id = p.pid','LEFT')
                ->join('__USER__ u','u.uid = p.create_uid','LEFT')
                ->join('__SPEED_BUILD__ b','b.plan_id = p.id','LEFT')
                ->join('__SPEED_FLOOR__ f','b.id = f.b_id','LEFT')
                ->field('pr.project_name,pr.id as project_id,p.id as plan_id,p.plan_name,p.remark,p.user_see,u.user_name as creaor,b.build_num,b.build_num,b.area,b.floor_num,f.floor_num as floor_name,f.model_id')
                ->where('p.id',$plan_id)
                ->select();

            $target = [];
            if($planData) {
                if($planInfo['see_group'] == 0) {
                    $target['group'] = false;
                    $target['canRead'] = explode(',',$planData[0]['user_see']);
                } else {
                    $target['group'] = true;
//                    $group_user = get_group($planInfo['see_group']);
                    $target['canRead']=$planInfo['see_group'];
                }

                $target['creator'] = $planData[0]['creaor'];
                $target['proj'] = $planData[0]['project_id'];
                $target['projName'] = $planData[0]['project_name'];
                $target['remark'] = $planData[0]['remark'];
                $target['survey'] = 1;
                foreach ($planData as $key => $val) {
                    $target['tabledata'][$val['build_num']]['area'] = $val['area'];
                    $target['tabledata'][$val['build_num']]['floor'] = $val['floor_num'];
                    $target['tabledata'][$val['build_num']]['id'] = $val['build_num'];
                    $target['tabledata'][$val['build_num']]['partial'][$val['floor_name']]['floor'] = $val['floor_name'];
                    $target['tabledata'][$val['build_num']]['partial'][$val['floor_name']]['model'] = $val['model_id'];

                }
                foreach ($target['tabledata'] as $key => $val) {
                    $target['tabledata'][$key]['partial'] = array_values($val['partial']);
                }
            }

        } else {
            $planData = Db::name('speed_plan')
                ->alias('p')
                ->join('__PROJECT__ pr','pr.id = p.pid','LEFT')
                ->join('__USER__ u','u.uid = p.create_uid','LEFT')
                ->join('__SPEED_BUILD__ b','b.plan_id = p.id','LEFT')
                ->field('pr.project_name,pr.id as project_id,p.id as plan_id,p.plan_name,p.remark,p.user_see,u.user_name as creaor,b.build_num,b.area,b.floor_num,b.model_id')
                ->where('p.id',$plan_id)
                ->select();

            $target = [];
            if($planData) {
                if($planInfo['see_group'] == 0) {
                    $target['group'] = false;
                    $target['canRead'] = explode(',',$planData[0]['user_see']);
                } else {
                    $target['group'] = true;
//                    $group_user = get_group($planInfo['see_group']);
                    $target['canRead']=$planInfo['see_group'];
                }

                $target['creator'] = $planData[0]['creaor'];
                $target['proj'] = $planData[0]['project_id'];
                $target['projName'] = $planData[0]['project_name'];
                $target['remark'] = $planData[0]['remark'];
                $target['survey'] = 2;
                foreach ($planData as $key => $val) {
                    $target['tabledata'][$val['build_num']]['area'] = $val['area'];
                    $target['tabledata'][$val['build_num']]['floor'] = $val['floor_num'];
                    $target['tabledata'][$val['build_num']]['id'] = $val['build_num'];
                    $target['tabledata'][$val['build_num']]['partial'] = $val['model_id'];

                }
            }


        }

        $target['tabledata'] = array_values( $target['tabledata']);
        $return = my_return($target,200,'查找成功');
        return $return;





    }

    /**
     * 联动获取计划
     */
    public function proPlan() {
        $project_id = input('post.pid',0);
        if(!$project_id) {
            $return = my_return('',200,'操作成功');
            return $return;
        }
        $where['pid'] = $project_id;
        $where['state'] = 1;

        $re_data = Db::name('speed_plan')->order('id desc')->where($where)->select();
        $return = my_return($re_data,200,'操作成功');
        return $return;
    }

    /**
     * 计划列表
     */
    public function planList() {
        $limit = input('post.limit',20);
        $page = input('post.page',1);
        $is_page = input('post.is_page',1);
        $project_id = input('post.pid',0);
        $where['t.state'] = 1;
        if($project_id) {
            $where['t.pid'] = $project_id;
        }
        if($is_page == 1 ) {
            $total = Db::name('speed_plan')->alias('t')->where($where)->count();
            $plan_list = Db::name('speed_plan')
                ->alias('t')
                ->join('__PROJECT__ p','p.id = t.pid','LEFT')
                ->join('__USER__ u','u.uid = t.create_uid','LEFT')
                ->where($where)
                ->page($page,$limit)
                ->order('t.id desc')
                ->field('t.*,p.project_name,u.user_name')
                ->select();
            $pagedata = [
                'page'=>$page,
                'limit'=>$limit,
                'total'=>$total
            ];

            $re_data['list'] = $plan_list;
            $re_data['page'] = $pagedata;
        } else {
            $re_data = Db::name('speed_plan')->alias('t')->order('id desc')->where($where)->select();
        }

        $return = my_return($re_data,200,'操作成功');
        return $return;
    }

    /**
     * 获取模板
     */
    public function modelList(){
        $limit = input('request.limit',20);
        $page = input('request.page',1);
        $is_page = input('request.is_page',1);
        if($is_page == 1 ) {
            $total = Db::name('speed_model')->count();
            $model = Db::name('speed_model')->order('id desc')->page($page,$limit)->select();
            $pagedata = [
                'page'=>$page,
                'limit'=>$limit,
                'total'=>$total
            ];

            $re_data['list'] = $model;
            $re_data['page'] = $pagedata;
        } else {
            $re_data = Db::name('speed_model')->order('id desc')->select();
        }

        $return = my_return($re_data,200,'操作成功');
        return $return;
    }

    /**
     * 项目列表
     */
    public function projectList(){
        $limit = input('request.limit',20);
        $page = input('request.page',1);
        $is_page = input('request.is_page',1);
        if($is_page == 1) {
            //分页
            $total = Db::name('project')->where('delete',1)->count();
            $project = Db::name('project')->where('delete',1)->order('id desc')->page($page,$limit)->select();
            $pagedata = [
                'page'=>$page,
                'limit'=>$limit,
                'total'=>$total
            ];

            $re_data['list'] = $project;
            $re_data['page'] = $pagedata;
        } else {
            //不分页
            $re_data = Db::name('project')->where('delete',1)->order('id desc')->select();
        }

        $return = my_return($re_data,200,'操作成功');
        return $return;
    }

    /**
     * 新建模板，编辑模板
     */
    public function addModel() {

        $model_id = input('post.model_id',0);//模板ID 编辑时用到

        $model_name = input('post.model_name','','trim');//计划名称
        $flag = input('post.flag','add','trim');//计划名称
        $remark = input('post.remark','','trim');//备注
        $tree_content = input('post.tree/a');
        $time = time();
        $user_info = $this->user_info;
        if($model_name =='') {

            $return = my_return('',500,'模板名称不能为空');
            return $return;
        }

        if($flag == 'update' ) {
            if(!$model_id) {
                $return = my_return('',500,'缺少参数');
                return $return;
            }
            Db::startTrans();
            try{
                Db::name('speed_model')->where('id',$model_id)->delete();
                Db::name('speed_model_detail')->where('m_id',$model_id)->delete();
            }catch (\Exception $e) {
                Db::rollback();
                $return = my_return('',500,'编辑失败');
                return $return;
            }
        }

        //先保存到模板总表

        $data = [
            'model_name'=>$model_name,
            'remark'=>$remark,
            'add_time'=>$time,
            'add_user'=>$user_info['user_name']
        ];
        $insert_id = Db::name('speed_model')->insertGetId($data);

//按id排序
        /*$last_names = array_column($tree_content,'id');
        array_multisort($last_names,SORT_ASC ,$tree_content);*/

        if($insert_id) {
            //创建模板目录

            //开启事务
            Db::startTrans();

            try{
                $parent_arr = [];
                foreach ($tree_content as $k => $v) {
                    $data = [
                        'm_id'=>$insert_id,
                        'c_name'=>$v['name'],
                        'code'=>$v['id'],
                        'ctype'=>$v['ctype']
                    ];
                    if($v['parent'] == 0) {
                        //一级
                        $data['parent_id'] = 0;

                        $p_id = Db::name('speed_model_detail')->insertGetId($data);
                        if(!$p_id) {
                            //回滚事务
                            Db::rollback();
                            $return = my_return('',500,'目录父级添加失败');
                            return $return;
                            break;
                        }
                        $parent_arr[$v['id']] = $p_id;
                    } else {
                        if(!isset($parent_arr[$v['parent']])) {
                            //回滚事务
                            Db::rollback();
                            $return = my_return('',500,'查找父级失败');
                            return $return;
                            break;
                        }
                        $data['parent_id'] = $parent_arr[$v['parent']];
                        $p_id = Db::name('speed_model_detail')->insertGetId($data);
                        if(!$p_id) {
                            //回滚事务
                            Db::rollback();
                            $return = my_return('',500,'目录子集添加失败');
                            return $return;
                            break;
                        }
                    }
                }


            } catch (\Exception $e){
                //回滚事务
                Db::rollback();
                $return = my_return('',500,'模板创建失败');
                return $return;
            }
            // 提交事务
            Db::commit();
            $return = my_return('',200,'模板提交成功');
            return $return;

        } else {
            $return = my_return('',500,'计划任务创建失败');
            return $return;
        }
    }

    /**
     * 计划项目进度接口
     */
    public function planForm(){
        $project_id = input('param.pro_id',12);//项目
        $plan_id = input('param.plan_id',6);//计划
        $build_id = input('param.build_id',7);//楼号
        $user_info = $this->user_info;
        $is_author = 0;
        if(!$project_id || !$plan_id || !$build_id) {
            $return = my_return('',500,'参数信息不全');
            return $return;
        }

        $plan_info = get_plan_by_id($plan_id);

        if($plan_info['state'] != 1) {
            $return = my_return('',500,'该计划已弃用');
            return $return;
        }

        //判断是否是本人查看和查看权限
        if($user_info['uid'] == $plan_info['create_uid']) {
            $is_author = 1;
        }
        //本人查看数据 未 自己保存的数据 别人查看为已提交数据
        if($is_author == 1) {
//            $join_str = '__SPEED_SPEED_STAGE__ s';
            $join_str = '__SPEED_SPEED__ s';
        } else {
            $join_str = '__SPEED_SPEED__ s';
        }
        if($plan_info['include_floor'] ==1 ) {
            //精确到楼层
            $table_info = Db::name('speed_build')
                ->alias('b')
                ->join('__SPEED_FLOOR__ f','f.b_id = b.id','LEFT')
                ->join($join_str,'s.pid = f.id','LEFT')
                ->join('__SPEED_MODEL_DETAIL__ d','d.id = s.task_id')
                ->order('s.id asc')
                ->where('b.id',$build_id)
//                ->where('d.ctype',0)
                ->field('b.id as build_id,b.plan_id,b.build_num,b.area,b.floor_num,f.floor_num as floor_name,f.id as floor_id,s.id as speed_id,s.task_id,s.plan_start_date,s.plan_end_date,s.plan_day_num,s.real_start_date,s.plan_percent,s.real_end_date,s.real_day_num,s.percent,s.update_time,d.id as cate_id,d.c_name as cate_name,d.parent_id,d.code')
                ->select();


        } else {
                //不精确到楼层
            $table_info = Db::name('speed_build')
                ->alias('b')
                ->join($join_str,'s.pid = b.id','LEFT')
                ->join('__SPEED_MODEL_DETAIL__ d','d.id = s.task_id')
                ->order('s.id asc')
                ->where('b.id',$build_id)
//                ->where('d.ctype',0)
                ->field('b.id as build_id,b.plan_id,b.build_num,b.area,s.id as speed_id,s.task_id,s.plan_start_date,s.plan_end_date,s.plan_day_num,s.real_start_date,s.real_end_date,s.plan_percent,s.real_day_num,s.percent,s.update_time,d.id as cate_id,d.c_name as cate_name,d.parent_id,d.code')
                ->select();


        }

        foreach ($table_info as $key => $value) {
                if($value['plan_start_date'] != '') {
                    $table_info[$key]['plan_start_date'] = date('d-m-Y',$value['plan_start_date']);
                }
            if($value['plan_end_date'] != '') {
                $table_info[$key]['plan_end_date'] = date('d-m-Y',$value['plan_end_date']);
            }
            if($value['real_start_date'] != '') {
                $table_info[$key]['real_start_date'] = date('d-m-Y',$value['real_start_date']);
            }
            if($value['real_end_date'] != '') {
                $table_info[$key]['real_end_date'] = date('d-m-Y',$value['real_end_date']);
            }

        }

        //给楼层“造数据”

        $lou_data=[];
        if($plan_info['include_floor'] ==1 ) {
            $f_l = 0;
            foreach ($table_info as $k => $v) {

                $floor_id = $v['floor_id'];
                $floor_num = $v['floor_name'];
                if($floor_num != $f_l){
                    $f_l = $floor_num;
                    $start[$floor_num] = 0;
                    $end[$floor_num] = 0;
                }

                if ($start[$floor_num] > $v['plan_start_date'] || $start[$floor_num] == 0 ){
                    $start[$floor_num] = $v['plan_start_date'];
                }
                if ($end[$floor_num] < $v['plan_end_date']){
                    $end[$floor_num] = $v['plan_end_date'];
                }
                $lou_data[$floor_num]['cate_name'] = $floor_num ;
                $lou_data[$floor_num]['lou_id'] = $floor_id ;
                $lou_data[$floor_num]['floor_id'] = 0 ;
                $lou_data[$floor_num]['plan_start_date'] = $start[$floor_num] ;
                $lou_data[$floor_num]['plan_end_date'] = $end[$floor_num] ;
                $table_info[$k]['lou_id'] = 300+$k;

            }

        $table_info = array_merge($table_info,$lou_data);
        }

        $return = my_return(array_values($table_info),200,'查找成功');
        return $return;



    }

    /**
     * 实际进度(计划/实际)保存，填写
     */
    public function formEdit() {
//        $save_way = input('post.type',1); //1：保存，2：提交
        $type  = input('post.type',0); // 1：计划 2：实际
        $start_time = input('post.stime',0);
        $end_time = input('post.etime',0);
        $speed_id = input('post.speed_id',0);
        $user_info = $this->user_info;
        if($end_time != '') {
            if($start_time >= $end_time) {
                $return = my_return('',500,'结束时间必须大于开始时间');
                return $return;
            }
        }

        if(!$type || !$speed_id) {
            $return = my_return('',500,'上传参数缺失');
            return $return;
        }
        if($type == 1) {
            //计划进度保存
            $plan_percent = input('post.plan_percent',0);
            $plan_day_num = input('post.plan_day_num',0);
            if(!preg_match("/^[0-9][0-9]*$/",$plan_percent)){
                $return = my_return('',500,'百分比为正整数');
                return $return;
            }
            if(!preg_match("/^[0-9][0-9]*$/",$plan_day_num)){
                $return = my_return('',500,'天数必须为正整数');
                return $return;
            }
            if($start_time) {
                $save_data['plan_start_date'] = strtotime($start_time);
                $save_data['real_start_date'] = strtotime($start_time);
            }
            if($end_time) {
                $save_data['plan_end_date'] = strtotime($end_time);
                $save_data['real_end_date'] = strtotime($end_time);
            }
            if($plan_day_num) {
                $save_data['plan_day_num'] = $plan_day_num;
                $save_data['real_day_num'] = $plan_day_num;
            }
            if($plan_percent) {
                $save_data['plan_percent'] = $plan_percent;
            }
            $save_data['update_time'] = time();
            $save_data['update_user'] = $user_info['user_name'];

            $res = update_speed_by_id($speed_id,$save_data);
            if($res === false) {
                $return = my_return('',500,'更新失败');
                return $return;
            }



        } elseif($type == 2){
            //实际进度保存
            $real_percent = input('post.real_percent',0);
            $real_day_num = input('post.real_day_num',0);
            if(!preg_match("/^[0-9][0-9]*$/",$real_percent)){
                $return = my_return('',500,'百分比为正整数');
                return $return;
            }

            if(!preg_match("/^[0-9][0-9]*$/",$real_day_num)){
                $return = my_return('',500,'天数必须为正整数');
                return $return;
            }
            $build_id = input('post.build_id',0);
            $pid = input('post.pid',0);
            $task_id = input('post.task_id',0);

            if(!$build_id || !$pid || !$task_id) {
                $return = my_return('',500,'参数缺失');
                return $return;
            }

            if($start_time) {
                $save_data['real_start_date'] = strtotime($start_time);
            }
            if($end_time) {
                $save_data['real_end_date'] = strtotime($end_time);
            }
            if($real_day_num) {
                $save_data['real_day_num'] = $real_day_num;
            }
            if($real_percent) {
                $save_data['percent'] = $real_percent;
            }
            $save_data['update_time'] = time();
            $save_data['update_user'] = $user_info['user_name'];

            $res = update_speed_by_id($speed_id,$save_data);
            if($res === false) {
                $return = my_return('',500,'更新失败');
                return $return;
            }
            //保存到更新日志

            $log_data=[
                'build_id'=>$build_id,
                'pid'=>$pid,
                'task_id'=>$task_id,
                'speed_id'=>$speed_id,
                'percent'=>$real_percent,
                'add_time'=>time()
            ];
            $res = Db::name('speed_update_log')->insert($log_data);

            if(!$res){
                $return = my_return('',500,'日志更新失败，请重新保存');
                return $return;
            }

        }


        $return = my_return('',200,'更新成功');
        return $return;





    }

    /**
     * 柱状图
     */
    public function histogram(){
        $build_id = input('post.build_id',0);
        $plan_id= input('post.plan_id',0);


        if(!$plan_id || !$build_id) {
            $return = my_return('',500,'参数缺失');
            return $return;
        }
        $plan_info = get_plan_by_id($plan_id);
        if(!$plan_info) {
            $return = my_return('',500,'该计划已弃用');
            return $return;
        }

        if($plan_info['include_floor'] == 1) {
            //精确到楼层

            //1.查找该楼号下所有子项  每一项有多少层（个）
            $dataList  = Db::name('speed_build')
                ->alias('b')
                ->join('__SPEED_FLOOR__ f','f.b_id = b.id','LEFT')
                ->join('__SPEED_SPEED__ s','s.pid = f.id','LEFT')
                ->join('__SPEED_MODEL_DETAIL__ d','d.id = s.task_id')
                ->order('s.id asc')
                ->where('b.id',$build_id)
                ->field('b.id as build_id,b.plan_id,b.build_num,b.area,b.floor_num,f.floor_num as floor_name,f.id as floor_id,s.id as speed_id,s.task_id,s.plan_start_date,s.plan_end_date,s.plan_day_num,s.real_start_date,s.plan_percent,s.real_end_date,s.real_day_num,s.percent,s.update_time,d.ctype,d.id as cate_id,d.c_name as cate_name,d.parent_id,d.code')
                ->select();




            $cate_data = Db::name('speed_build')
                ->alias('b')
                ->join('__SPEED_FLOOR__ f','f.b_id = b.id','LEFT')
                ->join('__SPEED_SPEED__ s','s.pid = f.id','LEFT')
                ->join('__SPEED_MODEL_DETAIL__ d','d.id = s.task_id')
                ->order('s.id asc')
                ->where('b.id',$build_id)
                ->field('d.ctype,d.id as cate_id,d.c_name as cate_name,count(*) as count_num')
                ->group('s.task_id')
                ->select();



        } else {
            $dataList  = Db::name('speed_build')
                ->alias('b')
                ->join('__SPEED_SPEED__ s','s.pid = b.id','LEFT')
                ->join('__SPEED_MODEL_DETAIL__ d','d.id = s.task_id')
                ->order('s.id asc')
                ->where('b.id',$build_id)
                ->field('b.id as build_id,b.plan_id,b.build_num,b.area,b.floor_num,f.floor_num as floor_name,f.id as floor_id,s.id as speed_id,s.task_id,s.plan_start_date,s.plan_end_date,s.plan_day_num,s.real_start_date,s.plan_percent,s.real_end_date,s.real_day_num,s.percent,s.update_time,d.ctype,d.id as cate_id,d.c_name as cate_name,d.parent_id,d.code')
                ->select();




            $cate_data = Db::name('speed_build')
                ->alias('b')
                ->join('__SPEED_SPEED__ s','s.pid = b.id','LEFT')
                ->join('__SPEED_MODEL_DETAIL__ d','d.id = s.task_id')
                ->order('s.id asc')
                ->where('b.id',$build_id)
                ->field('d.ctype,d.id as cate_id,d.c_name as cate_name,count(*) as count_num')
                ->group('s.task_id')
                ->select();
        }
        foreach ($cate_data as $key => $val){
            $target[$key]['name'] = $val['cate_name'];
            $target[$key]['plan'] = 0;
            $target[$key]['real'] = 0;
            $target[$key]['all'] = $val['count_num'];;
            foreach ($dataList as $k => $v) {
                if($v['cate_id'] == $val['cate_id']){
                    $target[$key]['plan']+=$v['plan_percent'];
                    $target[$key]['real']+=$v['percent'];
                }
            }
            $target[$key]['plan'] /= 100;
            $target[$key]['real'] /= 100;


        }
        $return = my_return($target,200,'成功');
        return $return;
    }

    /**
     * 折线图
     */
    public function lineChart(){
        $task_id = input('post.task_id'); //分项id
        $build_id = input('post.build_id');//楼号ID
        $duration = input('post.duration',1);//间隔 1:周 2：月 3：年
        if(!$task_id || !$build_id || !$duration){
            $return = my_return('',500,'参数不全');
            return $return;
        }
        $title = Db::name('speed_model_detail')->where('id',$task_id)->find();
//        $time_duration =
        $complete_info = Db::name('speed_update_log')->where(['build_id'=>$build_id,'task_id'=>$task_id])->order('add_time asc')->select();
        /*$complete_info = [
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>1,
                'percent'=>11,
                'add_time'=>strtotime('2018-01-01'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>4,
                'percent'=>11,
                'add_time'=>strtotime('2018-01-01'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>2,
                'percent'=>5,
                'add_time'=>strtotime('2018-01-02'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>5,
                'percent'=>5,
                'add_time'=>strtotime('2018-01-02'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>6,
                'percent'=>10,
                'add_time'=>strtotime('2018-01-03'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>3,
                'percent'=>10,
                'add_time'=>strtotime('2018-01-03'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>1,
                'percent'=>15,
                'add_time'=>strtotime('2018-01-09'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>2,
                'percent'=>10,
                'add_time'=>strtotime('2018-01-09'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>4,
                'percent'=>15,
                'add_time'=>strtotime('2018-01-09'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>5,
                'percent'=>10,
                'add_time'=>strtotime('2018-01-09'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>3,
                'percent'=>20,
                'add_time'=>strtotime('2018-01-10'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>6,
                'percent'=>20,
                'add_time'=>strtotime('2018-01-10'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>1,
                'percent'=>40,
                'add_time'=>strtotime('2018-01-18'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>4,
                'percent'=>40,
                'add_time'=>strtotime('2018-01-18'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>5,
                'percent'=>50,
                'add_time'=>strtotime('2018-01-20'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>6,
                'percent'=>70,
                'add_time'=>strtotime('2018-01-20'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>2,
                'percent'=>50,
                'add_time'=>strtotime('2018-01-20'),

            ],
            [
                'build'=>1,
                'task_id'=>1,
                'pid'=>3,
                'percent'=>70,
                'add_time'=>strtotime('2018-01-20'),

            ],

        ];*/
        if($complete_info) {
            if($duration == 1) {
                //跨度一周
                $base_time = $complete_info[0]['add_time'];
                $h_key = 1;//横坐标个数初始化
                $max=[];
                $now_max=[];
                foreach ($complete_info as $key => $value) {
                    $time_dur = $base_time + 7*3600*24;

                    if($value['add_time'] >= $base_time && $value['add_time'] < $time_dur){
                        //在当前第一个跨度内
                        $target[$h_key]['name'] = '第'.numberToBig($h_key).'周';
                        $last_max = isset($max[$value['pid']])?$max[$value['pid']]:0;
                        $target[$h_key]['value'][$value['pid']] = $value['percent'] - $last_max;
                        $now_max[$value['pid']] = $value['percent'];
                    } else {
                        $max = $now_max;//更新上一阶段的 最大值
                        $now_max[$value['pid']] = $value['percent'];
                        $h_key ++;
                        $base_time = $time_dur;
                        $target[$h_key]['name'] = '第'.numberToBig($h_key).'周';
                        $last_max = isset($max[$value['pid']])?$max[$value['pid']]:0;
                        $target[$h_key]['value'][$value['pid']] = $value['percent'] - $last_max;
                    }

                }
            } elseif($duration == 2 ) {
                //按月统计
                $base_key = date('Ym',$complete_info[0]['add_time']);
                $max=[];
                $now_max=[];
                foreach ($complete_info as $key => $value) {
                    $now_key = date('Ym',$value['add_time']);

                    if($now_key == $base_key) {
                        $target[$base_key]['name'] = date('Y-m',$value['add_time']);
                        $last_max = isset($max[$value['pid']])?$max[$value['pid']]:0;
                        $target[$base_key]['value'][$value['pid']] = $value['percent'] - $last_max;
                        $now_max[$value['pid']] = $value['percent'];
                    } else {
                        $max = $now_max;//更新上一阶段的 最大值
                        $now_max[$value['pid']] = $value['percent'];
                        $base_key = $now_key;

                        $target[$base_key]['name'] = date('Y-m',$value['add_time']);
                        $last_max = isset($max[$value['pid']])?$max[$value['pid']]:0;
                        $target[$base_key]['value'][$value['pid']] = $value['percent'] - $last_max;
                    }
                }

            } elseif ($duration == 3) {
                //按年统计
                $max=[];
                $now_max=[];
                $base_key = date('Y',$complete_info[0]['add_time']);
                foreach ($complete_info as $key => $value) {
                    $now_key = date('Y',$value['add_time']);

                    if($now_key == $base_key) {
                        $target[$base_key]['name'] = date('Y',$value['add_time']);
                        $last_max = isset($max[$value['pid']])?$max[$value['pid']]:0;
                        $target[$base_key]['value'][$value['pid']] = $value['percent'] - $last_max;
                    } else {
                        $max = $now_max;//更新上一阶段的 最大值
                        $now_max[$value['pid']] = $value['percent'];
                        $base_key = $now_key;
                        $target[$base_key]['name'] = date('Y',$value['add_time']);
                        $last_max = isset($max[$value['pid']])?$max[$value['pid']]:0;
                        $target[$base_key]['value'][$value['pid']]['value'] = $value['percent'] - $last_max;
                    }
                }
            }

            foreach ($target as $key => $value) {
                $line_data[$key]["name"] = $value['name'];
                $sum = 0;
                foreach ($value['value'] as $k => $v) {
                    $sum += $v/100;
                }
                $line_data[$key]["value"] = $sum;
            }

            $data['data'] = $line_data;
            $data['title'] = $title['c_name'];
             $return = my_return($data,200,'成功');
             return $return;



        } else{
            $return = my_return('',500,'项目未开始');
            return $return;
        }



    }

    /**
     * 饼图
     */
    public function pieChart(){
        $plan_id = input('post.plan_id',0);
        $build_id = input('post.build_id/a','');
        $task_id = input('post.task_id',0);

        $plan_info = get_plan_by_id($plan_id);

        if(!$plan_info) {
            $return = my_return('',500,'计划不可用');
            return $return;
        }

        if($build_id == '' || !$task_id) {
            $return = my_return('',500,'参数不全');
            return $return;

        }

        if($plan_info['include_floor'] == 1) {
            //精确到楼层

            $dataList  = Db::name('speed_build')
                ->alias('b')
                ->join('__SPEED_FLOOR__ f','f.b_id = b.id','LEFT')
                ->join('__SPEED_SPEED__ s','s.pid = f.id','LEFT')
                ->join('__SPEED_MODEL_DETAIL__ d','d.id = s.task_id')
                ->order('s.id asc')
                ->where('b.id','in',$build_id)
                ->where('s.task_id',$task_id)
                ->field('b.id as build_id,b.plan_id,b.build_num,b.area,b.floor_num,f.floor_num as floor_name,f.id as floor_id,s.id as speed_id,s.task_id,s.plan_start_date,s.plan_end_date,s.plan_day_num,s.real_start_date,s.plan_percent,s.real_end_date,s.real_day_num,s.percent,s.update_time,d.ctype,d.id as cate_id,d.c_name as cate_name,d.parent_id,d.code')
                ->select();



        } else {
            $dataList  = Db::name('speed_build')
                ->alias('b')
                ->join('__SPEED_SPEED__ s','s.pid = b.id','LEFT')
                ->join('__SPEED_MODEL_DETAIL__ d','d.id = s.task_id')
                ->order('s.id asc')
                ->where('b.id','in',$build_id)
                ->where('s.task_id',$task_id)
                ->field('b.id as build_id,b.plan_id,b.build_num,b.area,b.floor_num,f.floor_num as floor_name,f.id as floor_id,s.id as speed_id,s.task_id,s.plan_start_date,s.plan_end_date,s.plan_day_num,s.real_start_date,s.plan_percent,s.real_end_date,s.real_day_num,s.percent,s.update_time,d.ctype,d.id as cate_id,d.c_name as cate_name,d.parent_id,d.code')
                ->select();
        }
        $target['plan'] = 0;
        $target['real'] = 0;
        foreach ($dataList  as $key => $value) {
            $target['plan'] += $value['plan_percent']/100;
            $target['real'] += $value['percent']/100;
            $build_num[] = $value['build_num'];

        }

        $target['build'] = implode(',',$build_num);
        $target['title'] = $dataList[0]['cate_name'];

        $return = my_return($target,200,'成功');
        return $return;

    }

    /**
     * 联动-计划ID获取楼号
     */
    public function planBuild(){
        $plan_id = input('post.plan_id',0);

        if(!$plan_id) {
            $return = my_return($plan_id,500,'请选择所属计划');
            return $return;
        }

        $plan_info = get_plan_by_id($plan_id);
        if(!$plan_info){

            $return = my_return('',500,'该计划不可用');
            return $return;
        }


        $build_info = Db::name('speed_build')->where('plan_id',$plan_id)->select();
        $return_data['data'] = $build_info;
        $return_data['survey'] = $plan_info['include_floor'];
        $return = my_return($return_data,200,'查询成功');
        return $return;
    }

    /**
     * 联动-楼号ID获取楼层
     */
    public function planFloor(){
        $build_id = input('post.build_id',0);
        if(!$build_id) {
            $return = my_return('',500,'请选择所属楼号');
            return $return;
        }

        $build_info = Db::name('speed_floor')->where('b_id',$build_id)->select();
        $return = my_return($build_info,200,'查询成功');
        return $return;
    }

    /**
     * 联动-楼号ID/楼层ID获取分部项
     */
    public function floorTask(){
        $fb_id = input('post.build_id',0);
        $plan_id = input('post.plan_id',0);

        $plan_info = get_plan_by_id($plan_id);
        if(!$plan_info) {
            $return = my_return('',500,'计划不可用');
            return $return;
        }
        $survey = $plan_info['include_floor'];
        if(!$fb_id) {
            $return = my_return('',500,'请选择所属楼号');
            return $return;
        }


        if($survey == 1) {
            $cate_data = Db::name('speed_build')
                ->alias('b')
                ->join('__SPEED_FLOOR__ f','f.b_id = b.id','LEFT')
                ->join('__SPEED_SPEED__ s','s.pid = f.id','LEFT')
                ->join('__SPEED_MODEL_DETAIL__ d','d.id = s.task_id')
                ->order('s.id asc')
                ->where('b.id',$fb_id)
                ->field('d.ctype,d.id as cate_id,d.c_name as cate_name')
                ->group('s.task_id')
                ->select();
        } else {
            $cate_data = Db::name('speed_build')
                ->alias('b')
                ->join('__SPEED_SPEED__ s','s.pid = b.id','LEFT')
                ->join('__SPEED_MODEL_DETAIL__ d','d.id = s.task_id')
                ->order('s.id asc')
                ->where('b.id',$fb_id)
                ->field('d.ctype,d.id as cate_id,d.c_name as cate_name')
                ->group('s.task_id')
                ->select();
        }


        $return = my_return($cate_data,200,'查询成功');
        return $return;
    }

    /**
     * 楼号多选获取分部项接口
     */
    public function multiSelect() {
        $ids = input('post.build_id/a','');
        $plan_id = input('post.plan_id');

        $id_str = implode(',',$ids);
        $plan_info = get_plan_by_id($plan_id);
        if($ids == '') {
            $return = my_return('',500,'请选择对比楼号');
            return $return;
        }
        if(!$plan_info){
            $return = my_return('',500,'计划不可用');
            return $return;
        }

        if($plan_info['include_floor'] == 1) {
            $cate_data = Db::name('speed_build')
                ->alias('b')
                ->join('__SPEED_FLOOR__ f','f.b_id = b.id','LEFT')
                ->join('__SPEED_SPEED__ s','s.pid = f.id','LEFT')
                ->join('__SPEED_MODEL_DETAIL__ d','d.id = s.task_id')
                ->order('s.id asc')
                ->where('b.id','in',$id_str)
                ->field('d.ctype,d.id as cate_id,d.c_name as cate_name')
                ->group('s.task_id')
                ->select();
        } else {
            $cate_data = Db::name('speed_build')
                ->alias('b')
                ->join('__SPEED_SPEED__ s','s.pid = b.id','LEFT')
                ->join('__SPEED_MODEL_DETAIL__ d','d.id = s.task_id')
                ->order('s.id asc')
                ->where('b.id','in',$id_str)
                ->field('d.ctype,d.id as cate_id,d.c_name as cate_name')
                ->group('s.task_id')
                ->select();
        }

        $return = my_return($cate_data,200,'查询成功');
        return $return;

    }


}