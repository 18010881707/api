/*
 Navicat Premium Data Transfer

 Source Server         : mydb
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : management

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 11/09/2019 15:39:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for x_material_acceptance
-- ----------------------------
DROP TABLE IF EXISTS `x_material_acceptance`;
CREATE TABLE `x_material_acceptance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '所属项目',
  `material_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '材料名称',
  `material_server` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '材料供应商',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用部位',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '补充说明',
  `read_people` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抄送人',
  `read_group` int(11) NOT NULL DEFAULT 0 COMMENT '抄送组',
  `target_accept_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '建设方验收人',
  `jianli_accept` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监理方验收人',
  `state` tinyint(1) NOT NULL COMMENT '1：监理待验收\r\n2：建设方待验收\r\n3：已验收\r\n4：已拒绝',
  `refuse_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拒绝理由',
  `creator` int(11) NULL DEFAULT NULL COMMENT '发起者',
  `acceptor` int(11) NULL DEFAULT NULL COMMENT '最后验收人',
  `add_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  `need_jianshe_verify` tinyint(1) NULL DEFAULT NULL COMMENT '是否需要建设单位验收1：不要 2：要',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '材料验收' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_material_acceptance
-- ----------------------------
INSERT INTO `x_material_acceptance` VALUES (1, 12, '我完全若', '欠人情若群无', '请问人情味若', '法师法师法发顺丰碍事法师啊', '4', 0, NULL, NULL, 1, NULL, 9, NULL, 1567497792, 1567497792, NULL);
INSERT INTO `x_material_acceptance` VALUES (5, 13, '撒发送撒发送发', '必须赞发声方法', '还会热回复打电话', '科技路上了国家历史的管理 空间里睡大觉高老师是开始看过了就死了赶紧上来的国家历史建设', NULL, 7, '', NULL, 1, NULL, 9, NULL, 1567502039, 1567502039, NULL);
INSERT INTO `x_material_acceptance` VALUES (4, 13, '撒发送', '必须赞', '还会热回复打电话', '科技路上了国家历史的管理 空间里睡大觉高老师是开始打开', NULL, 7, NULL, NULL, 1, NULL, 9, NULL, 1567501982, 1567501982, NULL);
INSERT INTO `x_material_acceptance` VALUES (6, 12, '灌灌灌灌或', '吞吞吐吐玩儿玩儿', '东方饭店丰富的', '两个经历过了建立国家来说就是对计算机是 公司 的  十多个s\'d\'g\'d\'d', '8,7,6,3', 0, '7,4', NULL, 4, 'sgkshd s s', 9, 7, 1567502115, 1567564149, NULL);
INSERT INTO `x_material_acceptance` VALUES (7, 12, '方法发却无法去', 'AAS爱上萨法是', ' 防风网放弃我放弃无法去 ', '青浦区欧文日抛弃我', '6,7', 0, '3', NULL, 2, NULL, 9, NULL, 1567502158, 1567502158, NULL);
INSERT INTO `x_material_acceptance` VALUES (8, 12, 'www', 'wwww', 'ww', 'www', '9,8', 0, '3,4,7', NULL, 3, '', 9, 7, 1567503435, 1567563128, NULL);
INSERT INTO `x_material_acceptance` VALUES (9, 14, '水泥', 'B公司', '墙体', '', '11', 0, '10', NULL, 3, '', 12, 10, 1567652854, 1567653234, NULL);
INSERT INTO `x_material_acceptance` VALUES (10, 14, 'w', 'w', 'w', 'wwwwwwwww', '6,9,7', 0, '7,10', '11,8,6', 1, NULL, 9, NULL, 1567676679, 1567676679, 2);
INSERT INTO `x_material_acceptance` VALUES (11, 12, 'vb', 'bb', 'bb', 'bbbb', '6,8', 0, '', '6,8', 1, NULL, 9, NULL, 1567677349, 1567677349, 1);

-- ----------------------------
-- Table structure for x_notify
-- ----------------------------
DROP TABLE IF EXISTS `x_notify`;
CREATE TABLE `x_notify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` tinyint(5) NULL DEFAULT NULL COMMENT '1：质量检查\r\n2：安全检查\r\n3：材料验收',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1：未读 2：已读',
  `add_time` int(11) NULL DEFAULT NULL,
  `read_time` int(11) NULL DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_notify
-- ----------------------------
INSERT INTO `x_notify` VALUES (92, 7, 1, '您有一个材料问题待验收', 1, 1567503435, NULL);
INSERT INTO `x_notify` VALUES (91, 4, 1, '您有一个材料问题待验收', 1, 1567503435, NULL);
INSERT INTO `x_notify` VALUES (90, 3, 1, '您有一个材料问题待验收', 1, 1567503435, NULL);
INSERT INTO `x_notify` VALUES (89, 8, 1, '您有一个材料问题待验收', 1, 1567503435, NULL);
INSERT INTO `x_notify` VALUES (88, 9, 1, '您有一个材料问题待验收', 1, 1567503435, NULL);
INSERT INTO `x_notify` VALUES (87, 3, 1, '您有一个材料问题待验收', 1, 1567502158, NULL);
INSERT INTO `x_notify` VALUES (86, 7, 1, '您有一个材料问题待验收', 1, 1567502158, NULL);
INSERT INTO `x_notify` VALUES (85, 6, 1, '您有一个材料问题待验收', 1, 1567502158, NULL);
INSERT INTO `x_notify` VALUES (84, 4, 1, '您有一个材料问题待验收', 1, 1567502115, NULL);
INSERT INTO `x_notify` VALUES (83, 7, 1, '您有一个材料问题待验收', 1, 1567502115, NULL);
INSERT INTO `x_notify` VALUES (82, 3, 1, '您有一个材料问题待验收', 1, 1567502115, NULL);
INSERT INTO `x_notify` VALUES (81, 6, 1, '您有一个材料问题待验收', 1, 1567502115, NULL);
INSERT INTO `x_notify` VALUES (80, 7, 1, '您有一个材料问题待验收', 1, 1567502115, NULL);
INSERT INTO `x_notify` VALUES (79, 8, 1, '您有一个材料问题待验收', 1, 1567502115, NULL);
INSERT INTO `x_notify` VALUES (78, 7, 1, '您有一个材料问题待验收', 1, 1567502039, NULL);
INSERT INTO `x_notify` VALUES (77, 8, 1, '您有一个材料问题待验收', 1, 1567502039, NULL);
INSERT INTO `x_notify` VALUES (76, 9, 1, '您有一个材料问题待验收', 1, 1567502039, NULL);
INSERT INTO `x_notify` VALUES (75, 7, 1, '您有一个材料问题待验收', 1, 1567501982, NULL);
INSERT INTO `x_notify` VALUES (74, 8, 1, '您有一个材料问题待验收', 1, 1567501982, NULL);
INSERT INTO `x_notify` VALUES (73, 9, 1, '您有一个材料问题待验收', 1, 1567501982, NULL);
INSERT INTO `x_notify` VALUES (72, 8, 1, '您有一个材料问题待验收', 1, 1567501151, NULL);
INSERT INTO `x_notify` VALUES (71, 4, 1, '您有一个材料问题待验收', 1, 1567501151, NULL);
INSERT INTO `x_notify` VALUES (70, 4, 1, '您有一个材料问题待验收', 1, 1567497987, NULL);
INSERT INTO `x_notify` VALUES (69, 7, 1, '您有一个材料问题待验收', 1, 1567497987, NULL);
INSERT INTO `x_notify` VALUES (93, 7, 1, '您有一个质量问题待审批', 1, NULL, NULL);
INSERT INTO `x_notify` VALUES (94, 3, 1, '您有一个安全问题待处理', 1, 1567575952, NULL);
INSERT INTO `x_notify` VALUES (95, 9, 1, '您有一个安全问题待处理', 1, 1567575952, NULL);
INSERT INTO `x_notify` VALUES (96, 7, 1, '您有一个安全问题待处理', 1, 1567579105, NULL);
INSERT INTO `x_notify` VALUES (97, 3, 1, '您有一个安全问题待处理', 1, 1567579105, NULL);
INSERT INTO `x_notify` VALUES (98, 3, 1, '您有一个安全问题待处理', 1, 1567579672, NULL);
INSERT INTO `x_notify` VALUES (99, 7, 1, '您有一个安全问题待处理', 1, 1567579672, NULL);
INSERT INTO `x_notify` VALUES (100, 11, 1, '您有一个材料问题待验收', 1, 1567652854, NULL);
INSERT INTO `x_notify` VALUES (101, 10, 1, '您有一个材料问题待验收', 1, 1567652854, NULL);
INSERT INTO `x_notify` VALUES (102, 12, 1, '您有一个质量问题待处理', 1, 1567653448, NULL);
INSERT INTO `x_notify` VALUES (103, 11, 1, '您有一个质量问题待处理', 1, 1567653448, NULL);
INSERT INTO `x_notify` VALUES (104, 10, 1, '您有一个质量问题待审批', 1, NULL, NULL);

-- ----------------------------
-- Table structure for x_position_category
-- ----------------------------
DROP TABLE IF EXISTS `x_position_category`;
CREATE TABLE `x_position_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位名称',
  `types` tinyint(1) NULL DEFAULT NULL COMMENT '职位类型\r\n2：建设方\r\n3：监理方\r\n4：施工方',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '职位名称' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_project
-- ----------------------------
DROP TABLE IF EXISTS `x_project`;
CREATE TABLE `x_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `add_time` int(11) NULL DEFAULT NULL,
  `add_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:可用 2：删除',
  `add_uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_project
-- ----------------------------
INSERT INTO `x_project` VALUES (12, '碧桂园', 1566179471, '刘某', 1, 3);
INSERT INTO `x_project` VALUES (13, '万达茂', 1566206095, 'ss', 2, 7);
INSERT INTO `x_project` VALUES (14, '项目A', 1567649183, 'admin', 1, 1);

-- ----------------------------
-- Table structure for x_quality
-- ----------------------------
DROP TABLE IF EXISTS `x_quality`;
CREATE TABLE `x_quality`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '所属项目',
  `build` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼号',
  `floor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层',
  `position` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `image` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '质检，图片（逗号分割）',
  `re_image` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '整改，图片（逗号分割）',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1：现存问题 \r\n2：待审批\r\n3：整改通过\r\n4：整改未通过\r\n--------------\r\n超时未改（计算得出）',
  `add_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `require_time` int(11) NULL DEFAULT NULL COMMENT '要求整改时间（最长期限）',
  `modify_time` int(11) NULL DEFAULT NULL COMMENT '实际整改时间',
  `creator` int(11) NULL DEFAULT NULL COMMENT '发起者',
  `modify_people` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抄送人',
  `modify_group` int(11) NOT NULL DEFAULT 0 COMMENT '抄送人组',
  `do_people` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理人',
  `is_del` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1：可用 2：删除',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '最近更新时间',
  `verify_user` int(11) NULL DEFAULT NULL COMMENT '审批者',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1：质量 2：安全',
  `refuse_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不通过理由',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '质量检查' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_quality
-- ----------------------------
INSERT INTO `x_quality` VALUES (25, 14, '1', '2', '墙体', '不符合规范', 'http://192.168.1.140/uploads/20190905\\a3d93a5e4ecb8f5468313d7652bfee3e.jpg', 'http://192.168.1.140/uploads/20190905\\b751529880f3d4d5387e2a7f82793b30.jpg', 3, 1567653448, 1568044800, 1567653555, 10, '12,11', 0, '', 1, 1567653576, 10, 1, '');
INSERT INTO `x_quality` VALUES (20, 13, '2', '2', '2', '22', '192.168.1.183/uploads/20190902\\cf6b3c449e157569b4a03e045ba4c399.jpg', NULL, 4, 1567406001, 1569772800, NULL, 7, NULL, 2, '', 1, 1567406279, 7, 1, '女的长的太丑了');
INSERT INTO `x_quality` VALUES (18, 13, '1', '1', '1', '1', '192.168.1.183/uploads/20190902\\320c57b1f1511cf1817f85599375a770.jpg', '192.168.1.140/uploads/20190904\\fe4818006e882454864d43954d49dfa9.jpg', 3, 1567404578, 1569168000, 1567566739, 7, NULL, 6, '', 2, 1567566761, 7, 1, '');
INSERT INTO `x_quality` VALUES (19, 12, '1', '1', '1', '1', '192.168.1.183/uploads/20190902\\f8dcad089944b015063b6508b915a0d6.jpg', '192.168.1.183/uploads/20190902\\04fb29504ec7f821fa5042b89abd4a73.jpg,192.168.1.183/uploads/20190902\\636e9ceb99b646938492e93662d4af26.jpg', 3, 1567405408, 1569254400, 1567405495, 7, NULL, 6, '', 1, 1567405684, 7, 1, '');
INSERT INTO `x_quality` VALUES (24, 12, '所有', '1', '', '速度', 'http://192.168.1.140/uploads/20190904\\92492107d0e68f27c9b8fb3b2edd2859.jpg,http://192.168.1.140/uploads/20190904\\e3ea8be63b9de536c49053ed630009fd.jpg', NULL, 1, 1567579672, 1569513600, NULL, 3, '3,7', 0, '', 1, 1567579672, NULL, 2, NULL);
INSERT INTO `x_quality` VALUES (26, 12, '222', '2', '2', '22', 'http://wl.ngrok.it-wpf.info/uploads/20190906\\cea86f93aa103aa16b973e987ab3e080.jpg', 'http://wl.ngrok.it-wpf.info/uploads/20190906\\7ec8fea4628ac5cecc54511ce8938b01.jpg', 3, 1567759300, 1568131200, 1567759325, 7, NULL, 6, '9', 1, 1567759331, 7, 1, '');

-- ----------------------------
-- Table structure for x_speed_build
-- ----------------------------
DROP TABLE IF EXISTS `x_speed_build`;
CREATE TABLE `x_speed_build`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL COMMENT '所属计划',
  `build_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼号名',
  `area` float(11, 2) NULL DEFAULT NULL COMMENT '面积（单位平方米）',
  `floor_num` int(11) NULL DEFAULT NULL COMMENT '楼层数',
  `model_id` int(11) NOT NULL DEFAULT 0 COMMENT '0:不是楼层对应',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划--对应楼号表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of x_speed_build
-- ----------------------------
INSERT INTO `x_speed_build` VALUES (7, 6, '1', 1000.00, 8, 0);
INSERT INTO `x_speed_build` VALUES (8, 6, '2', 2000.00, 8, 0);
INSERT INTO `x_speed_build` VALUES (9, 6, '3', 1500.00, 8, 0);
INSERT INTO `x_speed_build` VALUES (10, 7, '1', 200.00, 4, 0);
INSERT INTO `x_speed_build` VALUES (11, 7, '2', 300.00, 2, 0);
INSERT INTO `x_speed_build` VALUES (12, 8, '1', 233.00, 2, 0);
INSERT INTO `x_speed_build` VALUES (13, 9, '1', 200.00, 3, 24);
INSERT INTO `x_speed_build` VALUES (14, 10, '11', 2323.00, 2, 24);
INSERT INTO `x_speed_build` VALUES (15, 11, '1', 0.00, 0, 24);
INSERT INTO `x_speed_build` VALUES (16, 12, '1', 233.00, 2, 0);
INSERT INTO `x_speed_build` VALUES (17, 13, '1', 2.00, 2, 0);
INSERT INTO `x_speed_build` VALUES (18, 14, '1', 2000.00, 29, 24);
INSERT INTO `x_speed_build` VALUES (19, 15, '1', 100.00, 4, 0);
INSERT INTO `x_speed_build` VALUES (20, 15, '2', 200.00, 3, 0);
INSERT INTO `x_speed_build` VALUES (21, 16, '1', 100.00, 4, 0);
INSERT INTO `x_speed_build` VALUES (22, 16, '2', 120.00, 3, 0);
INSERT INTO `x_speed_build` VALUES (23, 17, '1', NULL, 2, 0);
INSERT INTO `x_speed_build` VALUES (24, 18, '1', NULL, 6, 0);

-- ----------------------------
-- Table structure for x_speed_floor
-- ----------------------------
DROP TABLE IF EXISTS `x_speed_floor`;
CREATE TABLE `x_speed_floor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b_id` int(11) NULL DEFAULT NULL COMMENT '所属楼号',
  `floor_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层名',
  `model_id` int(11) NULL DEFAULT NULL COMMENT '模板id',
  `area` float(20, 2) NOT NULL COMMENT '面积（单位平方米）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '楼层表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of x_speed_floor
-- ----------------------------
INSERT INTO `x_speed_floor` VALUES (34, 7, '1', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (35, 7, '2', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (36, 7, '3', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (37, 7, '4', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (38, 7, '5', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (39, 7, '6', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (40, 7, '7', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (41, 7, '8', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (42, 8, '1', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (43, 8, '2', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (44, 8, '3', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (45, 8, '4', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (46, 8, '5', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (47, 8, '6', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (48, 8, '7', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (49, 8, '8', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (50, 9, '1', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (51, 9, '2', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (52, 9, '3', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (53, 9, '4', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (54, 9, '5', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (55, 9, '6', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (56, 9, '7', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (57, 9, '8', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (58, 10, '1', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (59, 10, '2', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (60, 10, '3', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (61, 10, '4', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (62, 11, '1', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (63, 11, '2', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (64, 12, '1', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (65, 12, '2', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (66, 16, '1', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (67, 16, '2', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (68, 17, '1', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (69, 17, '2', 24, 0.00);
INSERT INTO `x_speed_floor` VALUES (70, 19, '1', 27, 0.00);
INSERT INTO `x_speed_floor` VALUES (71, 19, '2', 28, 0.00);
INSERT INTO `x_speed_floor` VALUES (72, 19, '3', 28, 0.00);
INSERT INTO `x_speed_floor` VALUES (73, 19, '4', 29, 0.00);
INSERT INTO `x_speed_floor` VALUES (74, 20, '1', 27, 0.00);
INSERT INTO `x_speed_floor` VALUES (75, 20, '2', 28, 0.00);
INSERT INTO `x_speed_floor` VALUES (76, 20, '3', 29, 0.00);
INSERT INTO `x_speed_floor` VALUES (77, 21, '1', 30, 0.00);
INSERT INTO `x_speed_floor` VALUES (78, 21, '2', 31, 0.00);
INSERT INTO `x_speed_floor` VALUES (79, 21, '3', 31, 0.00);
INSERT INTO `x_speed_floor` VALUES (80, 21, '4', 29, 0.00);
INSERT INTO `x_speed_floor` VALUES (81, 22, '1', 30, 0.00);
INSERT INTO `x_speed_floor` VALUES (82, 22, '2', 31, 0.00);
INSERT INTO `x_speed_floor` VALUES (83, 22, '3', 29, 0.00);
INSERT INTO `x_speed_floor` VALUES (84, 23, '1F', 29, 0.00);
INSERT INTO `x_speed_floor` VALUES (85, 23, '2F', 27, 0.00);
INSERT INTO `x_speed_floor` VALUES (86, 24, '1F', 28, 0.00);
INSERT INTO `x_speed_floor` VALUES (87, 24, '2F', 30, 0.00);
INSERT INTO `x_speed_floor` VALUES (88, 24, '3F', 27, 0.00);
INSERT INTO `x_speed_floor` VALUES (89, 24, '4F', 25, 0.00);
INSERT INTO `x_speed_floor` VALUES (90, 24, '5F', 31, 0.00);
INSERT INTO `x_speed_floor` VALUES (91, 24, '6F', 31, 0.00);

-- ----------------------------
-- Table structure for x_speed_model
-- ----------------------------
DROP TABLE IF EXISTS `x_speed_model`;
CREATE TABLE `x_speed_model`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板备注',
  `add_time` int(11) NULL DEFAULT NULL,
  `add_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模板总表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_speed_model
-- ----------------------------
INSERT INTO `x_speed_model` VALUES (24, '标准模板', '', 1566179492, '刘某');
INSERT INTO `x_speed_model` VALUES (25, '特殊模板', '', 1567575617, '刘某');
INSERT INTO `x_speed_model` VALUES (27, '地下工程', '', 1567649822, 'admin');
INSERT INTO `x_speed_model` VALUES (28, '标准层施工', '', 1567649844, 'admin');
INSERT INTO `x_speed_model` VALUES (29, '屋面层', '', 1567649908, 'admin');
INSERT INTO `x_speed_model` VALUES (30, '土方开挖', '', 1567650703, 'admin');
INSERT INTO `x_speed_model` VALUES (31, '主体结构', '', 1567650794, 'admin');
INSERT INTO `x_speed_model` VALUES (32, '屋面工程', '', 1567650820, 'admin');

-- ----------------------------
-- Table structure for x_speed_model_detail
-- ----------------------------
DROP TABLE IF EXISTS `x_speed_model_detail`;
CREATE TABLE `x_speed_model_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` int(11) NOT NULL COMMENT '所属模板',
  `c_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分项名称',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父级ID  0：一级 其他：对应父级',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ctype` tinyint(1) NULL DEFAULT NULL COMMENT '是否有子集 1：有子集，0没有子集',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 198 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模板详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_speed_model_detail
-- ----------------------------
INSERT INTO `x_speed_model_detail` VALUES (118, 24, '电梯工程', 0, '78', 0);
INSERT INTO `x_speed_model_detail` VALUES (119, 24, '节能工程：保温', 0, '77', 0);
INSERT INTO `x_speed_model_detail` VALUES (120, 24, '屋面工程', 0, '76', 0);
INSERT INTO `x_speed_model_detail` VALUES (121, 24, '土方开挖回填', 0, '75', 0);
INSERT INTO `x_speed_model_detail` VALUES (122, 24, '主体结构施工', 0, '71', 1);
INSERT INTO `x_speed_model_detail` VALUES (123, 24, '模板支设', 122, '74', 0);
INSERT INTO `x_speed_model_detail` VALUES (124, 24, '钢筋绑扎', 122, '73', 0);
INSERT INTO `x_speed_model_detail` VALUES (125, 24, '砼浇筑', 122, '72', 0);
INSERT INTO `x_speed_model_detail` VALUES (126, 24, '二次结构工程', 0, '67', 1);
INSERT INTO `x_speed_model_detail` VALUES (127, 24, '模板支设', 126, '69', 0);
INSERT INTO `x_speed_model_detail` VALUES (128, 24, '墙体砌筑', 126, '70', 0);
INSERT INTO `x_speed_model_detail` VALUES (129, 24, '砼浇筑', 126, '68', 0);
INSERT INTO `x_speed_model_detail` VALUES (130, 24, '装饰装修工程', 0, '63', 1);
INSERT INTO `x_speed_model_detail` VALUES (131, 24, '顶棚腻子', 130, '64', 0);
INSERT INTO `x_speed_model_detail` VALUES (132, 24, '内粉', 130, '65', 0);
INSERT INTO `x_speed_model_detail` VALUES (133, 24, '地坪', 130, '66', 0);
INSERT INTO `x_speed_model_detail` VALUES (134, 25, '电梯工程-1', 0, '78', 0);
INSERT INTO `x_speed_model_detail` VALUES (135, 25, '节能工程：保温', 0, '77', 0);
INSERT INTO `x_speed_model_detail` VALUES (136, 25, '屋面工程', 0, '76', 0);
INSERT INTO `x_speed_model_detail` VALUES (137, 25, '土方开挖回填-1', 0, '75', 0);
INSERT INTO `x_speed_model_detail` VALUES (138, 25, '主体结构施工-1', 0, '71', 1);
INSERT INTO `x_speed_model_detail` VALUES (139, 25, '模板支设', 138, '74', 0);
INSERT INTO `x_speed_model_detail` VALUES (140, 25, '钢筋绑扎', 138, '73', 0);
INSERT INTO `x_speed_model_detail` VALUES (141, 25, '砼浇筑', 138, '72', 0);
INSERT INTO `x_speed_model_detail` VALUES (142, 25, '二次结构工程', 0, '67', 1);
INSERT INTO `x_speed_model_detail` VALUES (143, 25, '模板支设', 142, '69', 0);
INSERT INTO `x_speed_model_detail` VALUES (144, 25, '墙体砌筑', 142, '70', 0);
INSERT INTO `x_speed_model_detail` VALUES (145, 25, '砼浇筑', 142, '68', 0);
INSERT INTO `x_speed_model_detail` VALUES (146, 25, '装饰装修工程', 0, '63', 1);
INSERT INTO `x_speed_model_detail` VALUES (147, 25, '顶棚腻子', 146, '64', 0);
INSERT INTO `x_speed_model_detail` VALUES (148, 25, '内粉', 146, '65', 0);
INSERT INTO `x_speed_model_detail` VALUES (149, 25, '地坪', 146, '66', 0);
INSERT INTO `x_speed_model_detail` VALUES (177, 27, '内粉', 175, '65', 0);
INSERT INTO `x_speed_model_detail` VALUES (176, 27, '顶棚腻子', 175, '64', 0);
INSERT INTO `x_speed_model_detail` VALUES (175, 27, '装饰装修工程', 0, '63', 1);
INSERT INTO `x_speed_model_detail` VALUES (174, 27, '砼浇筑', 171, '68', 0);
INSERT INTO `x_speed_model_detail` VALUES (173, 27, '墙体砌筑', 171, '70', 0);
INSERT INTO `x_speed_model_detail` VALUES (172, 27, '模板支设', 171, '69', 0);
INSERT INTO `x_speed_model_detail` VALUES (171, 27, '二次结构工程', 0, '67', 1);
INSERT INTO `x_speed_model_detail` VALUES (170, 27, '砼浇筑', 167, '72', 0);
INSERT INTO `x_speed_model_detail` VALUES (169, 27, '钢筋绑扎', 167, '73', 0);
INSERT INTO `x_speed_model_detail` VALUES (168, 27, '模板支设', 167, '74', 0);
INSERT INTO `x_speed_model_detail` VALUES (167, 27, '主体结构施工', 0, '71', 1);
INSERT INTO `x_speed_model_detail` VALUES (166, 27, '土方开挖回填', 0, '75', 0);
INSERT INTO `x_speed_model_detail` VALUES (178, 27, '地坪', 175, '66', 0);
INSERT INTO `x_speed_model_detail` VALUES (179, 28, '节能工程：保温', 0, '77', 0);
INSERT INTO `x_speed_model_detail` VALUES (180, 28, '主体结构施工', 0, '71', 1);
INSERT INTO `x_speed_model_detail` VALUES (181, 28, '模板支设', 180, '74', 0);
INSERT INTO `x_speed_model_detail` VALUES (182, 28, '钢筋绑扎', 180, '73', 0);
INSERT INTO `x_speed_model_detail` VALUES (183, 28, '砼浇筑', 180, '72', 0);
INSERT INTO `x_speed_model_detail` VALUES (184, 28, '二次结构工程', 0, '67', 1);
INSERT INTO `x_speed_model_detail` VALUES (185, 28, '模板支设', 184, '69', 0);
INSERT INTO `x_speed_model_detail` VALUES (186, 28, '墙体砌筑', 184, '70', 0);
INSERT INTO `x_speed_model_detail` VALUES (187, 28, '砼浇筑', 184, '68', 0);
INSERT INTO `x_speed_model_detail` VALUES (188, 28, '装饰装修工程', 0, '63', 1);
INSERT INTO `x_speed_model_detail` VALUES (189, 28, '顶棚腻子', 188, '64', 0);
INSERT INTO `x_speed_model_detail` VALUES (190, 28, '内粉', 188, '65', 0);
INSERT INTO `x_speed_model_detail` VALUES (191, 28, '地坪', 188, '66', 0);
INSERT INTO `x_speed_model_detail` VALUES (192, 29, '屋面工程', 0, '76', 1);
INSERT INTO `x_speed_model_detail` VALUES (193, 29, '防水工程', 192, '1567649892506', 0);
INSERT INTO `x_speed_model_detail` VALUES (194, 29, '保温工程', 192, '1567649900574', 0);
INSERT INTO `x_speed_model_detail` VALUES (195, 30, '土方开挖回填', 0, '75', 0);
INSERT INTO `x_speed_model_detail` VALUES (196, 31, '主体结构施工', 0, '71', 0);
INSERT INTO `x_speed_model_detail` VALUES (197, 32, '屋面工程', 0, '76', 0);

-- ----------------------------
-- Table structure for x_speed_plan
-- ----------------------------
DROP TABLE IF EXISTS `x_speed_plan`;
CREATE TABLE `x_speed_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL COMMENT '所属项目',
  `plan_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划名称',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `include_floor` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分部分项工程是否精确到楼层 1：是 2：不是',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1：使用 2：删除（不使用）',
  `create_uid` int(11) NULL DEFAULT NULL COMMENT '创建者（仅创建者可编辑）',
  `user_see` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '可看者（‘，’拼接字符串）',
  `see_group` int(11) NOT NULL DEFAULT 0 COMMENT '可见分组',
  `add_time` int(11) NULL DEFAULT NULL,
  `is_submit` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:已提交 2：待提交',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of x_speed_plan
-- ----------------------------
INSERT INTO `x_speed_plan` VALUES (6, 12, '周计划', '测试周计划', 1, 1, 3, '7,5', 0, 1566179599, 1);
INSERT INTO `x_speed_plan` VALUES (7, 13, '测试', '测试测试测试踩刹车时踩刹车时踩刹车', 1, 2, 7, '6,7,5', 0, 1566206145, 1);
INSERT INTO `x_speed_plan` VALUES (8, 13, '假数据吧', '测试是偶是 是樊登读书会 私活 私活私活', 1, 2, 7, '7,6,5', 0, 1566281849, 1);
INSERT INTO `x_speed_plan` VALUES (9, 12, '意大利炮', '测试是偶是 是樊登读书会 私活 私活私活', 2, 2, 7, '6,7,5', 0, 1566281986, 1);
INSERT INTO `x_speed_plan` VALUES (10, 13, 'sgdsgggs', 'sgsdgsgsdgsgsdg', 2, 2, 7, '6,7,5', 0, 1566374322, 1);
INSERT INTO `x_speed_plan` VALUES (11, 13, '的时候所发生的和多号', '法法师法师法师', 2, 2, 7, '6,4,1', 0, 1566374447, 1);
INSERT INTO `x_speed_plan` VALUES (12, 12, '哈哈', '暗示法法师法师号', 1, 2, 7, '0', 0, 1566381736, 1);
INSERT INTO `x_speed_plan` VALUES (13, 12, '科技馆好客山东', '开始打科锐国际那肯定是技能大赛国家大事就算了；是', 1, 2, 7, '0', 0, 1566381929, 1);
INSERT INTO `x_speed_plan` VALUES (14, 13, 'test', 'fffafasffasf', 2, 2, 7, '0', 2, 1566438692, 1);
INSERT INTO `x_speed_plan` VALUES (15, 14, '10月月计划', '', 1, 2, 1, '0', 9, 1567650278, 1);
INSERT INTO `x_speed_plan` VALUES (16, 14, '十月计划', '', 1, 1, 1, '0', 9, 1567650901, 1);
INSERT INTO `x_speed_plan` VALUES (17, 14, '1', '1', 1, 2, 9, '0', 7, 1567738402, 1);
INSERT INTO `x_speed_plan` VALUES (18, 14, 'test', 'test', 1, 1, 9, '10,11,12', 0, 1567742015, 1);

-- ----------------------------
-- Table structure for x_speed_speed
-- ----------------------------
DROP TABLE IF EXISTS `x_speed_speed`;
CREATE TABLE `x_speed_speed`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '对应楼层/楼栋',
  `task_id` int(11) NOT NULL COMMENT '分项id',
  `plan_start_date` int(11) NULL DEFAULT NULL COMMENT '计划开始时间',
  `plan_end_date` int(11) NULL DEFAULT NULL COMMENT '计划结束时间',
  `plan_day_num` int(11) NULL DEFAULT NULL COMMENT '计划完成天数',
  `plan_percent` int(11) NOT NULL DEFAULT 100 COMMENT '计划百分比',
  `real_start_date` int(11) NULL DEFAULT NULL COMMENT '实际开始时间',
  `real_end_date` int(11) NULL DEFAULT NULL COMMENT '实际结束时间',
  `real_day_num` int(11) NULL DEFAULT NULL COMMENT '实际使用时间',
  `percent` int(11) NOT NULL DEFAULT 0 COMMENT '完成百分比',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '最近更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1312 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分步项计划与实际进度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of x_speed_speed
-- ----------------------------
INSERT INTO `x_speed_speed` VALUES (529, 34, 118, NULL, NULL, NULL, 100, 1566144000, 1567094400, 11, 12, 1566200681, 0);
INSERT INTO `x_speed_speed` VALUES (530, 34, 119, 1566144000, 1567180800, 10, 100, NULL, NULL, NULL, 0, 1566200970, 0);
INSERT INTO `x_speed_speed` VALUES (531, 34, 120, 1566144000, 1568217600, 10, 100, NULL, NULL, NULL, 0, 1566201234, 0);
INSERT INTO `x_speed_speed` VALUES (532, 34, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (533, 34, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (534, 34, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (535, 34, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (536, 34, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (537, 34, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (538, 34, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (539, 34, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (540, 34, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (541, 34, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (542, 34, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (543, 34, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (544, 34, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (545, 35, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (546, 35, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (547, 35, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (548, 35, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (549, 35, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (550, 35, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (551, 35, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (552, 35, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (553, 35, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (554, 35, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (555, 35, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (556, 35, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (557, 35, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (558, 35, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (559, 35, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (560, 35, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (561, 36, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (562, 36, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (563, 36, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (564, 36, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (565, 36, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (566, 36, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (567, 36, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (568, 36, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (569, 36, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (570, 36, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (571, 36, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (572, 36, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (573, 36, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (574, 36, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (575, 36, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (576, 36, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (577, 37, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (578, 37, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (579, 37, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (580, 37, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (581, 37, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (582, 37, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (583, 37, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (584, 37, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (585, 37, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (586, 37, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (587, 37, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (588, 37, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (589, 37, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (590, 37, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (591, 37, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (592, 37, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (593, 38, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (594, 38, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (595, 38, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (596, 38, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (597, 38, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (598, 38, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (599, 38, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (600, 38, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (601, 38, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (602, 38, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (603, 38, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (604, 38, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (605, 38, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (606, 38, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (607, 38, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (608, 38, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (609, 39, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (610, 39, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (611, 39, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (612, 39, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (613, 39, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (614, 39, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (615, 39, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (616, 39, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (617, 39, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (618, 39, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (619, 39, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (620, 39, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (621, 39, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (622, 39, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (623, 39, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (624, 39, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (625, 40, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (626, 40, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (627, 40, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (628, 40, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (629, 40, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (630, 40, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (631, 40, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (632, 40, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (633, 40, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (634, 40, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (635, 40, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (636, 40, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (637, 40, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (638, 40, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (639, 40, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (640, 40, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (641, 41, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (642, 41, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (643, 41, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (644, 41, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (645, 41, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (646, 41, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (647, 41, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (648, 41, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (649, 41, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (650, 41, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (651, 41, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (652, 41, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (653, 41, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (654, 41, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (655, 41, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (656, 41, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (657, 42, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (658, 42, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (659, 42, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (660, 42, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (661, 42, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (662, 42, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (663, 42, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (664, 42, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (665, 42, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (666, 42, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (667, 42, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (668, 42, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (669, 42, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (670, 42, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (671, 42, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (672, 42, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (673, 43, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (674, 43, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (675, 43, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (676, 43, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (677, 43, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (678, 43, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (679, 43, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (680, 43, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (681, 43, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (682, 43, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (683, 43, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (684, 43, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (685, 43, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (686, 43, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (687, 43, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (688, 43, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (689, 44, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (690, 44, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (691, 44, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (692, 44, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (693, 44, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (694, 44, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (695, 44, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (696, 44, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (697, 44, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (698, 44, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (699, 44, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (700, 44, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (701, 44, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (702, 44, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (703, 44, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (704, 44, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (705, 45, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (706, 45, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (707, 45, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (708, 45, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (709, 45, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (710, 45, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (711, 45, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (712, 45, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (713, 45, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (714, 45, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (715, 45, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (716, 45, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (717, 45, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (718, 45, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (719, 45, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (720, 45, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (721, 46, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (722, 46, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (723, 46, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (724, 46, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (725, 46, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (726, 46, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (727, 46, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (728, 46, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (729, 46, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (730, 46, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (731, 46, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (732, 46, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (733, 46, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (734, 46, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (735, 46, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (736, 46, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (737, 47, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (738, 47, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (739, 47, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (740, 47, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (741, 47, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (742, 47, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (743, 47, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (744, 47, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (745, 47, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (746, 47, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (747, 47, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (748, 47, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (749, 47, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (750, 47, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (751, 47, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (752, 47, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (753, 48, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (754, 48, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (755, 48, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (756, 48, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (757, 48, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (758, 48, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (759, 48, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (760, 48, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (761, 48, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (762, 48, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (763, 48, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (764, 48, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (765, 48, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (766, 48, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (767, 48, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (768, 48, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (769, 49, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (770, 49, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (771, 49, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (772, 49, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (773, 49, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (774, 49, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (775, 49, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (776, 49, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (777, 49, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (778, 49, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (779, 49, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (780, 49, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (781, 49, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (782, 49, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (783, 49, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (784, 49, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (785, 50, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (786, 50, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (787, 50, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (788, 50, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (789, 50, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (790, 50, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (791, 50, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (792, 50, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (793, 50, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (794, 50, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (795, 50, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (796, 50, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (797, 50, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (798, 50, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (799, 50, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (800, 50, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (801, 51, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (802, 51, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (803, 51, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (804, 51, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (805, 51, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (806, 51, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (807, 51, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (808, 51, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (809, 51, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (810, 51, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (811, 51, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (812, 51, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (813, 51, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (814, 51, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (815, 51, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (816, 51, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (817, 52, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (818, 52, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (819, 52, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (820, 52, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (821, 52, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (822, 52, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (823, 52, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (824, 52, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (825, 52, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (826, 52, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (827, 52, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (828, 52, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (829, 52, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (830, 52, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (831, 52, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (832, 52, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (833, 53, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (834, 53, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (835, 53, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (836, 53, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (837, 53, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (838, 53, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (839, 53, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (840, 53, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (841, 53, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (842, 53, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (843, 53, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (844, 53, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (845, 53, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (846, 53, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (847, 53, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (848, 53, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (849, 54, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (850, 54, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (851, 54, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (852, 54, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (853, 54, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (854, 54, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (855, 54, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (856, 54, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (857, 54, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (858, 54, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (859, 54, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (860, 54, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (861, 54, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (862, 54, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (863, 54, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (864, 54, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (865, 55, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (866, 55, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (867, 55, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (868, 55, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (869, 55, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (870, 55, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (871, 55, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (872, 55, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (873, 55, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (874, 55, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (875, 55, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (876, 55, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (877, 55, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (878, 55, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (879, 55, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (880, 55, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (881, 56, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (882, 56, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (883, 56, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (884, 56, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (885, 56, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (886, 56, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (887, 56, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (888, 56, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (889, 56, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (890, 56, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (891, 56, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (892, 56, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (893, 56, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (894, 56, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (895, 56, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (896, 56, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (897, 57, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (898, 57, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (899, 57, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (900, 57, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (901, 57, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (902, 57, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (903, 57, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (904, 57, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (905, 57, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (906, 57, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (907, 57, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (908, 57, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (909, 57, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (910, 57, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (911, 57, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (912, 57, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (913, 58, 118, 1564934400, 1567180800, 1, 100, 1566144000, 1566576000, NULL, 59, 1566271080, 0);
INSERT INTO `x_speed_speed` VALUES (914, 58, 119, 1566230400, 1567094400, 10, 100, 1566057600, 1567094400, NULL, 77, 1566270063, 0);
INSERT INTO `x_speed_speed` VALUES (915, 58, 120, NULL, NULL, NULL, 100, 1564934400, 1567008000, NULL, 58, 1566206242, 0);
INSERT INTO `x_speed_speed` VALUES (916, 58, 121, NULL, NULL, NULL, 100, 1566230400, 1566921600, NULL, 64, 1566271820, 0);
INSERT INTO `x_speed_speed` VALUES (917, 58, 122, NULL, NULL, NULL, 100, 1566230400, 1566489600, NULL, 32, 1566271840, 0);
INSERT INTO `x_speed_speed` VALUES (918, 58, 123, NULL, NULL, NULL, 100, 1566230400, NULL, NULL, 25, 1566271917, 0);
INSERT INTO `x_speed_speed` VALUES (919, 58, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (920, 58, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (921, 58, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (922, 58, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (923, 58, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (924, 58, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (925, 58, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (926, 58, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (927, 58, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (928, 58, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (929, 59, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (930, 59, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (931, 59, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (932, 59, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (933, 59, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (934, 59, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (935, 59, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (936, 59, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (937, 59, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (938, 59, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (939, 59, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (940, 59, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (941, 59, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (942, 59, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (943, 59, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (944, 59, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (945, 60, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (946, 60, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (947, 60, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (948, 60, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (949, 60, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (950, 60, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (951, 60, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (952, 60, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (953, 60, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (954, 60, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (955, 60, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (956, 60, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (957, 60, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (958, 60, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (959, 60, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (960, 60, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (961, 61, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (962, 61, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (963, 61, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (964, 61, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (965, 61, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (966, 61, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (967, 61, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (968, 61, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (969, 61, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (970, 61, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (971, 61, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (972, 61, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (973, 61, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (974, 61, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (975, 61, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (976, 61, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (977, 62, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (978, 62, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (979, 62, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (980, 62, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (981, 62, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (982, 62, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (983, 62, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (984, 62, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (985, 62, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (986, 62, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (987, 62, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (988, 62, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (989, 62, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (990, 62, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (991, 62, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (992, 62, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (993, 63, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (994, 63, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (995, 63, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (996, 63, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (997, 63, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (998, 63, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (999, 63, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1000, 63, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1001, 63, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1002, 63, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1003, 63, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1004, 63, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1005, 63, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1006, 63, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1007, 63, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1008, 63, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1009, 64, 118, 1565452800, 1567180800, 18, 100, 1565625600, 1566144000, NULL, 14, 1566357012, 0);
INSERT INTO `x_speed_speed` VALUES (1010, 64, 119, 1564588800, 1565625600, 10, 10, NULL, NULL, NULL, 0, 1566354480, 0);
INSERT INTO `x_speed_speed` VALUES (1011, 64, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1012, 64, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1013, 64, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1014, 64, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1015, 64, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1016, 64, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1017, 64, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1018, 64, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1019, 64, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1020, 64, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1021, 64, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1022, 64, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1023, 64, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1024, 64, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1025, 65, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1026, 65, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1027, 65, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1028, 65, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1029, 65, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1030, 65, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1031, 65, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1032, 65, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1033, 65, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1034, 65, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1035, 65, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1036, 65, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1037, 65, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1038, 65, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1039, 65, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1040, 65, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1041, 13, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1042, 13, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1043, 13, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1044, 13, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1045, 13, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1046, 13, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1047, 13, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1048, 13, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1049, 13, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1050, 13, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1051, 13, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1052, 13, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1053, 13, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1054, 13, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1055, 13, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1056, 13, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1057, 14, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1058, 14, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1059, 14, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1060, 14, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1061, 14, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1062, 14, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1063, 14, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1064, 14, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1065, 14, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1066, 14, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1067, 14, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1068, 14, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1069, 14, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1070, 14, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1071, 14, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1072, 14, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1073, 15, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1074, 15, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1075, 15, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1076, 15, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1077, 15, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1078, 15, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1079, 15, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1080, 15, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1081, 15, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1082, 15, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1083, 15, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1084, 15, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1085, 15, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1086, 15, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1087, 15, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1088, 15, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1089, 66, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1090, 66, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1091, 66, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1092, 66, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1093, 66, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1094, 66, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1095, 66, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1096, 66, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1097, 66, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1098, 66, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1099, 66, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1100, 66, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1101, 66, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1102, 66, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1103, 66, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1104, 66, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1105, 67, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1106, 67, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1107, 67, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1108, 67, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1109, 67, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1110, 67, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1111, 67, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1112, 67, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1113, 67, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1114, 67, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1115, 67, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1116, 67, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1117, 67, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1118, 67, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1119, 67, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1120, 67, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1121, 68, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1122, 68, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1123, 68, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1124, 68, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1125, 68, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1126, 68, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1127, 68, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1128, 68, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1129, 68, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1130, 68, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1131, 68, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1132, 68, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1133, 68, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1134, 68, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1135, 68, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1136, 68, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1137, 69, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1138, 69, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1139, 69, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1140, 69, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1141, 69, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1142, 69, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1143, 69, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1144, 69, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1145, 69, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1146, 69, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1147, 69, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1148, 69, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1149, 69, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1150, 69, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1151, 69, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1152, 69, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1153, 18, 118, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1154, 18, 119, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1155, 18, 120, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1156, 18, 121, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1157, 18, 122, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1158, 18, 123, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1159, 18, 124, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1160, 18, 125, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1161, 18, 126, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1162, 18, 127, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1163, 18, 128, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1164, 18, 129, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1165, 18, 130, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1166, 18, 131, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1167, 18, 132, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1168, 18, 133, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1169, 70, 177, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1170, 70, 176, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1171, 70, 175, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1172, 70, 174, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1173, 70, 173, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1174, 70, 172, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1175, 70, 171, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1176, 70, 170, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1177, 70, 169, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1178, 70, 168, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1179, 70, 167, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1180, 70, 166, 1569859200, 1570204800, 4, 100, NULL, NULL, NULL, 0, 1567650601, 0);
INSERT INTO `x_speed_speed` VALUES (1181, 70, 178, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1182, 71, 179, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1183, 71, 180, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1184, 71, 181, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1185, 71, 182, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1186, 71, 183, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1187, 71, 184, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1188, 71, 185, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1189, 71, 186, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1190, 71, 187, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1191, 71, 188, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1192, 71, 189, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1193, 71, 190, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1194, 71, 191, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1195, 72, 179, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1196, 72, 180, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1197, 72, 181, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1198, 72, 182, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1199, 72, 183, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1200, 72, 184, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1201, 72, 185, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1202, 72, 186, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1203, 72, 187, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1204, 72, 188, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1205, 72, 189, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1206, 72, 190, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1207, 72, 191, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1208, 73, 192, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1209, 73, 193, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1210, 73, 194, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1211, 74, 177, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1212, 74, 176, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1213, 74, 175, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1214, 74, 174, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1215, 74, 173, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1216, 74, 172, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1217, 74, 171, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1218, 74, 170, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1219, 74, 169, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1220, 74, 168, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1221, 74, 167, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1222, 74, 166, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1223, 74, 178, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1224, 75, 179, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1225, 75, 180, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1226, 75, 181, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1227, 75, 182, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1228, 75, 183, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1229, 75, 184, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1230, 75, 185, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1231, 75, 186, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1232, 75, 187, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1233, 75, 188, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1234, 75, 189, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1235, 75, 190, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1236, 75, 191, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1237, 76, 192, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1238, 76, 193, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1239, 76, 194, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1240, 77, 195, 1569859200, 1570636800, 10, 100, 1569859200, 1571241600, 7, 30, 1567652406, 0);
INSERT INTO `x_speed_speed` VALUES (1241, 78, 196, 1570723200, 1571500800, 9, 57, 1570982400, 1571155200, NULL, 100, 1567652123, 0);
INSERT INTO `x_speed_speed` VALUES (1242, 79, 196, 1571500800, 1572105600, 10, 100, 1571155200, 1571328000, NULL, 100, 1567651631, 0);
INSERT INTO `x_speed_speed` VALUES (1243, 80, 192, 1571673600, 1571932800, 10, 100, 1571846400, 1572451200, NULL, 63, 1567651652, 0);
INSERT INTO `x_speed_speed` VALUES (1244, 80, 193, 1571846400, 1572278400, 10, 100, 1572192000, 1572451200, NULL, 92, 1567651678, 0);
INSERT INTO `x_speed_speed` VALUES (1245, 80, 194, 1572364800, 1572451200, 10, 100, 1572364800, 1572451200, NULL, 89, 1567651708, 0);
INSERT INTO `x_speed_speed` VALUES (1246, 81, 195, 1570636800, 1571068800, 10, 100, 1569859200, 1570636800, NULL, 100, 1567651737, 0);
INSERT INTO `x_speed_speed` VALUES (1247, 82, 196, 1571155200, 1571414400, 10, 100, 1570723200, 1571500800, NULL, 100, 1567651767, 0);
INSERT INTO `x_speed_speed` VALUES (1248, 83, 192, 1571846400, 1572192000, 10, 100, 1571846400, 1572451200, NULL, 57, 1567651826, 0);
INSERT INTO `x_speed_speed` VALUES (1249, 83, 193, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1250, 83, 194, 1572278400, 1572451200, 32, 100, NULL, NULL, NULL, 0, 1567651452, 0);
INSERT INTO `x_speed_speed` VALUES (1251, 84, 192, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1252, 84, 193, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1253, 84, 194, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1254, 85, 177, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1255, 85, 176, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1256, 85, 175, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1257, 85, 174, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1258, 85, 173, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1259, 85, 172, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1260, 85, 171, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1261, 85, 170, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1262, 85, 169, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1263, 85, 168, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1264, 85, 167, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1265, 85, 166, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1266, 85, 178, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1267, 86, 179, 1567353600, 1569772800, 10, 100, 1567353600, 1569772800, 10, 0, 1567748454, 0);
INSERT INTO `x_speed_speed` VALUES (1268, 86, 180, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1269, 86, 181, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1270, 86, 182, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1271, 86, 183, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1272, 86, 184, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1273, 86, 185, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1274, 86, 186, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1275, 86, 187, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1276, 86, 188, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1277, 86, 189, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1278, 86, 190, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1279, 86, 191, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1280, 87, 195, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1281, 88, 177, 1567699200, 1568563200, 10, 100, 1567699200, 1568563200, 10, 0, 1567748504, 0);
INSERT INTO `x_speed_speed` VALUES (1282, 88, 176, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1283, 88, 175, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1284, 88, 174, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1285, 88, 173, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1286, 88, 172, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1287, 88, 171, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1288, 88, 170, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1289, 88, 169, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1290, 88, 168, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1291, 88, 167, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1292, 88, 166, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1293, 88, 178, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1294, 89, 134, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1295, 89, 135, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1296, 89, 136, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1297, 89, 137, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1298, 89, 138, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1299, 89, 139, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1300, 89, 140, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1301, 89, 141, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1302, 89, 142, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1303, 89, 143, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1304, 89, 144, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1305, 89, 145, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1306, 89, 146, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1307, 89, 147, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1308, 89, 148, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1309, 89, 149, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1310, 90, 196, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `x_speed_speed` VALUES (1311, 91, 196, NULL, NULL, NULL, 100, NULL, NULL, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for x_speed_speed_stage
-- ----------------------------
DROP TABLE IF EXISTS `x_speed_speed_stage`;
CREATE TABLE `x_speed_speed_stage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '对应楼层/楼栋',
  `task_id` int(11) NOT NULL COMMENT '分项id',
  `plan_start_date` int(11) NULL DEFAULT NULL COMMENT '计划开始时间',
  `plan_end_date` int(11) NULL DEFAULT NULL COMMENT '计划结束时间',
  `plan_day_num` int(11) NULL DEFAULT NULL COMMENT '计划完成天数',
  `real_start_date` int(11) NULL DEFAULT NULL COMMENT '实际开始时间',
  `real_end_date` int(11) NULL DEFAULT NULL COMMENT '实际结束时间',
  `real_day_num` int(11) NULL DEFAULT NULL COMMENT '实际使用时间',
  `plan_percent` int(11) NULL DEFAULT NULL COMMENT '计划完成百分比',
  `percent` int(11) NULL DEFAULT NULL COMMENT '完成百分比',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `submit_time` int(11) NULL DEFAULT NULL COMMENT '最近提交时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分步项计划与实际进度表本地暂存' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of x_speed_speed_stage
-- ----------------------------
INSERT INTO `x_speed_speed_stage` VALUES (529, 34, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (530, 34, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (531, 34, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (532, 34, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (533, 34, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (534, 34, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (535, 34, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (536, 34, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (537, 34, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (538, 34, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (539, 34, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (540, 34, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (541, 34, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (542, 34, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (543, 34, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (544, 34, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (545, 35, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (546, 35, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (547, 35, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (548, 35, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (549, 35, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (550, 35, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (551, 35, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (552, 35, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (553, 35, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (554, 35, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (555, 35, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (556, 35, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (557, 35, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (558, 35, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (559, 35, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (560, 35, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (561, 36, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (562, 36, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (563, 36, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (564, 36, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (565, 36, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (566, 36, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (567, 36, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (568, 36, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (569, 36, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (570, 36, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (571, 36, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (572, 36, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (573, 36, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (574, 36, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (575, 36, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (576, 36, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (577, 37, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (578, 37, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (579, 37, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (580, 37, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (581, 37, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (582, 37, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (583, 37, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (584, 37, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (585, 37, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (586, 37, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (587, 37, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (588, 37, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (589, 37, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (590, 37, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (591, 37, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (592, 37, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (593, 38, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (594, 38, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (595, 38, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (596, 38, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (597, 38, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (598, 38, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (599, 38, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (600, 38, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (601, 38, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (602, 38, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (603, 38, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (604, 38, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (605, 38, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (606, 38, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (607, 38, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (608, 38, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (609, 39, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (610, 39, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (611, 39, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (612, 39, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (613, 39, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (614, 39, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (615, 39, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (616, 39, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (617, 39, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (618, 39, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (619, 39, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (620, 39, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (621, 39, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (622, 39, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (623, 39, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (624, 39, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (625, 40, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (626, 40, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (627, 40, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (628, 40, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (629, 40, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (630, 40, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (631, 40, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (632, 40, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (633, 40, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (634, 40, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (635, 40, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (636, 40, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (637, 40, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (638, 40, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (639, 40, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (640, 40, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (641, 41, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (642, 41, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (643, 41, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (644, 41, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (645, 41, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (646, 41, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (647, 41, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (648, 41, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (649, 41, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (650, 41, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (651, 41, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (652, 41, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (653, 41, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (654, 41, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (655, 41, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (656, 41, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (657, 42, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (658, 42, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (659, 42, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (660, 42, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (661, 42, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (662, 42, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (663, 42, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (664, 42, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (665, 42, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (666, 42, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (667, 42, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (668, 42, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (669, 42, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (670, 42, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (671, 42, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (672, 42, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (673, 43, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (674, 43, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (675, 43, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (676, 43, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (677, 43, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (678, 43, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (679, 43, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (680, 43, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (681, 43, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (682, 43, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (683, 43, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (684, 43, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (685, 43, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (686, 43, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (687, 43, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (688, 43, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (689, 44, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (690, 44, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (691, 44, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (692, 44, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (693, 44, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (694, 44, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (695, 44, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (696, 44, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (697, 44, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (698, 44, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (699, 44, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (700, 44, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (701, 44, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (702, 44, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (703, 44, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (704, 44, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (705, 45, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (706, 45, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (707, 45, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (708, 45, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (709, 45, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (710, 45, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (711, 45, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (712, 45, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (713, 45, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (714, 45, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (715, 45, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (716, 45, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (717, 45, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (718, 45, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (719, 45, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (720, 45, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (721, 46, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (722, 46, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (723, 46, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (724, 46, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (725, 46, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (726, 46, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (727, 46, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (728, 46, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (729, 46, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (730, 46, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (731, 46, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (732, 46, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (733, 46, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (734, 46, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (735, 46, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (736, 46, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (737, 47, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (738, 47, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (739, 47, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (740, 47, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (741, 47, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (742, 47, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (743, 47, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (744, 47, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (745, 47, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (746, 47, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (747, 47, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (748, 47, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (749, 47, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (750, 47, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (751, 47, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (752, 47, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (753, 48, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (754, 48, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (755, 48, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (756, 48, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (757, 48, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (758, 48, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (759, 48, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (760, 48, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (761, 48, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (762, 48, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (763, 48, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (764, 48, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (765, 48, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (766, 48, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (767, 48, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (768, 48, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (769, 49, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (770, 49, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (771, 49, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (772, 49, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (773, 49, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (774, 49, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (775, 49, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (776, 49, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (777, 49, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (778, 49, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (779, 49, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (780, 49, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (781, 49, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (782, 49, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (783, 49, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (784, 49, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (785, 50, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (786, 50, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (787, 50, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (788, 50, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (789, 50, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (790, 50, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (791, 50, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (792, 50, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (793, 50, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (794, 50, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (795, 50, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (796, 50, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (797, 50, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (798, 50, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (799, 50, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (800, 50, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (801, 51, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (802, 51, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (803, 51, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (804, 51, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (805, 51, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (806, 51, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (807, 51, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (808, 51, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (809, 51, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (810, 51, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (811, 51, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (812, 51, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (813, 51, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (814, 51, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (815, 51, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (816, 51, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (817, 52, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (818, 52, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (819, 52, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (820, 52, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (821, 52, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (822, 52, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (823, 52, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (824, 52, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (825, 52, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (826, 52, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (827, 52, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (828, 52, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (829, 52, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (830, 52, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (831, 52, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (832, 52, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (833, 53, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (834, 53, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (835, 53, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (836, 53, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (837, 53, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (838, 53, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (839, 53, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (840, 53, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (841, 53, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (842, 53, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (843, 53, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (844, 53, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (845, 53, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (846, 53, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (847, 53, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (848, 53, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (849, 54, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (850, 54, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (851, 54, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (852, 54, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (853, 54, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (854, 54, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (855, 54, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (856, 54, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (857, 54, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (858, 54, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (859, 54, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (860, 54, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (861, 54, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (862, 54, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (863, 54, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (864, 54, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (865, 55, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (866, 55, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (867, 55, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (868, 55, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (869, 55, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (870, 55, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (871, 55, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (872, 55, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (873, 55, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (874, 55, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (875, 55, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (876, 55, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (877, 55, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (878, 55, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (879, 55, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (880, 55, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (881, 56, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (882, 56, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (883, 56, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (884, 56, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (885, 56, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (886, 56, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (887, 56, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (888, 56, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (889, 56, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (890, 56, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (891, 56, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (892, 56, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (893, 56, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (894, 56, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (895, 56, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (896, 56, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (897, 57, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (898, 57, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (899, 57, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (900, 57, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (901, 57, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (902, 57, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (903, 57, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (904, 57, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (905, 57, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (906, 57, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (907, 57, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (908, 57, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (909, 57, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (910, 57, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (911, 57, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (912, 57, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (913, 58, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (914, 58, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (915, 58, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (916, 58, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (917, 58, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (918, 58, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (919, 58, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (920, 58, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (921, 58, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (922, 58, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (923, 58, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (924, 58, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (925, 58, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (926, 58, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (927, 58, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (928, 58, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (929, 59, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (930, 59, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (931, 59, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (932, 59, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (933, 59, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (934, 59, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (935, 59, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (936, 59, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (937, 59, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (938, 59, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (939, 59, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (940, 59, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (941, 59, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (942, 59, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (943, 59, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (944, 59, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (945, 60, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (946, 60, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (947, 60, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (948, 60, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (949, 60, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (950, 60, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (951, 60, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (952, 60, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (953, 60, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (954, 60, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (955, 60, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (956, 60, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (957, 60, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (958, 60, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (959, 60, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (960, 60, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (961, 61, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (962, 61, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (963, 61, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (964, 61, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (965, 61, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (966, 61, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (967, 61, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (968, 61, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (969, 61, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (970, 61, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (971, 61, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (972, 61, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (973, 61, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (974, 61, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (975, 61, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (976, 61, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (977, 62, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (978, 62, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (979, 62, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (980, 62, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (981, 62, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (982, 62, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (983, 62, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (984, 62, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (985, 62, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (986, 62, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (987, 62, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (988, 62, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (989, 62, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (990, 62, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (991, 62, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (992, 62, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (993, 63, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (994, 63, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (995, 63, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (996, 63, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (997, 63, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (998, 63, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (999, 63, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1000, 63, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1001, 63, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1002, 63, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1003, 63, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1004, 63, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1005, 63, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1006, 63, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1007, 63, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1008, 63, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1009, 64, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1010, 64, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1011, 64, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1012, 64, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1013, 64, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1014, 64, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1015, 64, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1016, 64, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1017, 64, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1018, 64, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1019, 64, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1020, 64, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1021, 64, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1022, 64, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1023, 64, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1024, 64, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1025, 65, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1026, 65, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1027, 65, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1028, 65, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1029, 65, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1030, 65, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1031, 65, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1032, 65, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1033, 65, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1034, 65, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1035, 65, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1036, 65, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1037, 65, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1038, 65, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1039, 65, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1040, 65, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1041, 13, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1042, 13, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1043, 13, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1044, 13, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1045, 13, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1046, 13, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1047, 13, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1048, 13, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1049, 13, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1050, 13, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1051, 13, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1052, 13, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1053, 13, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1054, 13, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1055, 13, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1056, 13, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1057, 14, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1058, 14, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1059, 14, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1060, 14, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1061, 14, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1062, 14, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1063, 14, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1064, 14, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1065, 14, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1066, 14, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1067, 14, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1068, 14, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1069, 14, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1070, 14, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1071, 14, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1072, 14, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1073, 15, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1074, 15, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1075, 15, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1076, 15, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1077, 15, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1078, 15, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1079, 15, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1080, 15, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1081, 15, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1082, 15, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1083, 15, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1084, 15, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1085, 15, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1086, 15, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1087, 15, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1088, 15, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1089, 18, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1090, 18, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1091, 18, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1092, 18, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1093, 18, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1094, 18, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1095, 18, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1096, 18, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1097, 18, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1098, 18, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1099, 18, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1100, 18, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1101, 18, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1102, 18, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1103, 18, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `x_speed_speed_stage` VALUES (1104, 18, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for x_speed_update_log
-- ----------------------------
DROP TABLE IF EXISTS `x_speed_update_log`;
CREATE TABLE `x_speed_update_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `build_id` int(11) NULL DEFAULT NULL COMMENT '所属楼号ID',
  `pid` int(11) NULL DEFAULT NULL COMMENT '所属楼层/楼栋',
  `task_id` int(11) NULL DEFAULT NULL COMMENT '分项ID',
  `speed_id` int(11) NULL DEFAULT NULL COMMENT '进度表中的ID',
  `percent` int(11) NULL DEFAULT NULL COMMENT '完成百分比',
  `add_time` int(11) NULL DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '进度更新日志表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of x_speed_update_log
-- ----------------------------
INSERT INTO `x_speed_update_log` VALUES (3, 7, 34, 118, 529, 29, 1566200600);
INSERT INTO `x_speed_update_log` VALUES (4, 7, 34, 118, 529, 12, 1566200681);
INSERT INTO `x_speed_update_log` VALUES (5, 10, 58, 118, 913, 59, 1566206203);
INSERT INTO `x_speed_update_log` VALUES (6, 10, 58, 119, 914, 77, 1566206218);
INSERT INTO `x_speed_update_log` VALUES (7, 10, 58, 120, 915, 58, 1566206242);
INSERT INTO `x_speed_update_log` VALUES (8, 10, 58, 121, 916, 64, 1566271820);
INSERT INTO `x_speed_update_log` VALUES (9, 10, 58, 122, 917, 32, 1566271840);
INSERT INTO `x_speed_update_log` VALUES (10, 10, 58, 123, 918, 0, 1566271864);
INSERT INTO `x_speed_update_log` VALUES (11, 10, 58, 123, 918, 25, 1566271917);
INSERT INTO `x_speed_update_log` VALUES (12, 12, 64, 118, 1009, 14, 1566357012);
INSERT INTO `x_speed_update_log` VALUES (13, 21, 77, 195, 1240, 0, 1567651494);
INSERT INTO `x_speed_update_log` VALUES (14, 21, 77, 195, 1240, 100, 1567651547);
INSERT INTO `x_speed_update_log` VALUES (15, 21, 78, 196, 1241, 100, 1567651577);
INSERT INTO `x_speed_update_log` VALUES (16, 21, 79, 196, 1242, 100, 1567651631);
INSERT INTO `x_speed_update_log` VALUES (17, 21, 80, 192, 1243, 63, 1567651653);
INSERT INTO `x_speed_update_log` VALUES (18, 21, 80, 193, 1244, 92, 1567651678);
INSERT INTO `x_speed_update_log` VALUES (19, 21, 80, 194, 1245, 89, 1567651709);
INSERT INTO `x_speed_update_log` VALUES (20, 22, 81, 195, 1246, 100, 1567651738);
INSERT INTO `x_speed_update_log` VALUES (21, 22, 82, 196, 1247, 100, 1567651767);
INSERT INTO `x_speed_update_log` VALUES (22, 22, 83, 192, 1248, 57, 1567651826);
INSERT INTO `x_speed_update_log` VALUES (23, 21, 77, 195, 1240, 10, 1567652388);
INSERT INTO `x_speed_update_log` VALUES (24, 21, 77, 195, 1240, 30, 1567652406);

-- ----------------------------
-- Table structure for x_user
-- ----------------------------
DROP TABLE IF EXISTS `x_user`;
CREATE TABLE `x_user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `position` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `types` tinyint(1) NULL DEFAULT NULL COMMENT '1：总管理员\r\n2：建设方\r\n3：监理方\r\n4：施工方',
  `add_time` int(11) NULL DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1：可用 0：不可用',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_user
-- ----------------------------
INSERT INTO `x_user` VALUES (1, 'admin', '0b6f7d6404c5266af522ac9145fb3e76', '总管理员', 1, 1563954101, 1);
INSERT INTO `x_user` VALUES (3, '刘某', '3b05ad6c2aab0a2ef045a162cc8a9cb8', '测试', 2, 1564038702, 1);
INSERT INTO `x_user` VALUES (4, 'test', '529d0e5473f2294311ba30b812c1900d', 'CEO', 2, 1564631259, 0);
INSERT INTO `x_user` VALUES (5, 'heyman', 'bf532c6c6640ad6669fbe5431b133b0e', 'tttt', 3, 1564631767, 0);
INSERT INTO `x_user` VALUES (6, '测试', 'a0ea674381d3d7e95980682a352efd3e', 'CTO', 3, 1564640164, 1);
INSERT INTO `x_user` VALUES (7, 'ss', '53b180933056e998be38db95e0f30e83', 'CTO', 2, 1565232604, 1);
INSERT INTO `x_user` VALUES (8, 'dd', '98119fb40f51c7b82a37b1b10f3217c7', 'CBO', 3, 1567407342, 1);
INSERT INTO `x_user` VALUES (9, 'ff', '257265cb6e77b2db8611880472d59353', 'CFO', 4, 1567407365, 1);
INSERT INTO `x_user` VALUES (10, '111', 'ea25bf2ffcf19d699ef4f1cfa2e026cc', '甲方1', 2, 1567648912, 1);
INSERT INTO `x_user` VALUES (11, '222', 'e2f7b006be716f25953efa264feec970', '监理2', 3, 1567649089, 1);
INSERT INTO `x_user` VALUES (12, '333', '61a907c36cfb336943971dda3f3ec86c', '施工2', 4, 1567649119, 1);

-- ----------------------------
-- Table structure for x_user_group
-- ----------------------------
DROP TABLE IF EXISTS `x_user_group`;
CREATE TABLE `x_user_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '哪个用户的分组',
  `group_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组名',
  `group_uid` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分组成员UID',
  `add_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_user_group
-- ----------------------------
INSERT INTO `x_user_group` VALUES (6, 7, 'ss', '7', 1567402998);
INSERT INTO `x_user_group` VALUES (2, 7, 'app', '5,6,3,4', 1565948790);
INSERT INTO `x_user_group` VALUES (7, 9, 'test', '9,8,7', 1567501354);
INSERT INTO `x_user_group` VALUES (5, 3, '同事', '3,1,7', 1566453231);
INSERT INTO `x_user_group` VALUES (8, 7, 'gg', '8,7,9', 1567565567);
INSERT INTO `x_user_group` VALUES (9, 1, '项目A', '10,11,12', 1567649149);

-- ----------------------------
-- Table structure for x_user_token
-- ----------------------------
DROP TABLE IF EXISTS `x_user_token`;
CREATE TABLE `x_user_token`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` int(11) NULL DEFAULT NULL COMMENT '开始时间',
  `expire_time` int(11) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 185 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x_user_token
-- ----------------------------
INSERT INTO `x_user_token` VALUES (183, 1, 'PZ7gYkYiLUgfmxEER9oVhMpuEC0', 1568086733, 1568691533);
INSERT INTO `x_user_token` VALUES (184, 3, '59R2V8Y4lxBJztjZKIkfY5TEq94', 1568086764, 1568691564);
INSERT INTO `x_user_token` VALUES (181, 7, 'N4lmg0Cjgkw-FRyhQ6BM1Q1J7h4', 1567753828, 1568358628);
INSERT INTO `x_user_token` VALUES (178, 9, '2UNasCnkdNrMxFfW4VuCK8cpdB8', 1567676635, 1568281435);
INSERT INTO `x_user_token` VALUES (147, 8, 'P9HTQFTAmnEOTruO_q5-JoysBbY', 1567407475, 1568012275);
INSERT INTO `x_user_token` VALUES (171, 12, 'o9M6WdcbZiH2oIUokYnk-kNRzS0', 1567653250, 1568258050);
INSERT INTO `x_user_token` VALUES (173, 11, 'vXOFc-fsd3lTWwtD_jRbgA3C5nM', 1567653495, 1568258295);
INSERT INTO `x_user_token` VALUES (174, 10, 'A8TnGff9RP8JxeT716PGOB5Enlg', 1567653565, 1568258365);

SET FOREIGN_KEY_CHECKS = 1;
