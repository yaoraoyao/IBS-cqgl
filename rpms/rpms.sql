/*
MySQL Backup
Source Server Version: 5.7.20
Source Database: rpms
Date: 2019/9/19 18:14:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_department`
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_employee`
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `Hiredate` date DEFAULT NULL,
  `departmentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `FK4AFD4ACE851EFECF` (`departmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_employee_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_employee_role`;
CREATE TABLE `t_employee_role` (
  `employee_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`employee_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_login`
-- ----------------------------
DROP TABLE IF EXISTS `t_login`;
CREATE TABLE `t_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(40) DEFAULT NULL,
  `url` varchar(70) DEFAULT NULL,
  `icon` varchar(80) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_part`
-- ----------------------------
DROP TABLE IF EXISTS `t_part`;
CREATE TABLE `t_part` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(60,2) NOT NULL,
  `num` int(100) NOT NULL,
  `warnum` int(100) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `createtime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_payway`
-- ----------------------------
DROP TABLE IF EXISTS `t_payway`;
CREATE TABLE `t_payway` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `way` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_permission_copy`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission_copy`;
CREATE TABLE `t_permission_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_repairorder`
-- ----------------------------
DROP TABLE IF EXISTS `t_repairorder`;
CREATE TABLE `t_repairorder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer` varchar(255) NOT NULL,
  `carnum` varchar(255) NOT NULL,
  `createtime` datetime DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `opt_id` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `opt_id` (`opt_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_repairorderitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_repairorderitem`;
CREATE TABLE `t_repairorderitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mainid` bigint(20) DEFAULT NULL,
  `optid` bigint(20) DEFAULT NULL,
  `pid` bigint(20) NOT NULL,
  `amt1` decimal(19,2) NOT NULL,
  `amt2` decimal(19,2) DEFAULT NULL,
  `num` decimal(19,2) NOT NULL,
  `totalamt` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mainid` (`mainid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_resource`
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_id` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_settedbill`
-- ----------------------------
DROP TABLE IF EXISTS `t_settedbill`;
CREATE TABLE `t_settedbill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer` varchar(255) DEFAULT NULL,
  `mainid` bigint(20) NOT NULL,
  `settedtime` date DEFAULT NULL,
  `status` int(3) DEFAULT NULL,
  `reAmount` decimal(10,2) DEFAULT NULL,
  `payAmount` decimal(10,2) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `way` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_systemlog`
-- ----------------------------
DROP TABLE IF EXISTS `t_systemlog`;
CREATE TABLE `t_systemlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `opuser` varchar(255) DEFAULT NULL,
  `opip` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `optime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=926 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1','admin','admin');
INSERT INTO `t_department` VALUES ('1','结算部'), ('2','维修部'), ('3','售后部'), ('4','接待部'), ('11','人事部2');
INSERT INTO `t_employee` VALUES ('1','admin','6006eba3724471f7e1b7945b10ddb1d7','34','admin@itsource.com','2019-09-13','1'), 
('2','admin1','01a15d8abd779aabd15956e51e4335bc','32','admin1@itsource.com','2019-09-11','1'), 
('6','admin2','ad9d9b375dd0b4a3ef9ff36379a6be6b','23','123@qq.com','2019-09-18','2'), 
('8','admin3','32cacb2f994f6b42183a1300d9a3e8d6','25','xycb@qq.com','2019-09-18','2'), 
('9','admin4','fc1ebc848e31e0a68e868432225e3c82','26','qwer@qq.com','2019-09-18','2'), 
('10','admin5','26a91342190d515231d7238b0c5438e1','24','asdf@qq.com','2019-09-18','3'), 
('11','admin6','c6b853d6a7cc7ec49172937f68f446c8','26','asd@126.com','2019-09-18','1'), 
('12','admin7','788073cefde4b240873e1f52f5371d7d','43','admin7@qq.com','2019-09-18','4'), 
('17','admin10','4fbd41a36dac3cd79aa1041c9648ab89','22','123@11.com','2019-09-19','2'), 
('19','admin9','eed57216df3731106517ccaf5da2122d','12','g','2019-09-19','1');
INSERT INTO `t_employee_role` VALUES ('1','1');
INSERT INTO `t_menu` VALUES ('1','系统管理',NULL,NULL,NULL), ('25','角色管理','/role/index','1','1'), ('26','权限管
理','/permission/index',NULL,'1'), ('27','菜单管理','/menu/index',NULL,'1'), ('28','系统日志','/systemlog/index',NULL,'1'), 
('29','维修管理','',NULL,NULL), ('30','结算管理','/settedbill/index',NULL,'29'), ('31','支付管理',NULL,NULL,NULL), ('32','支付
方式','/payway/index',NULL,'31'), ('33','库存管理',NULL,NULL,NULL), ('34','配件管理','/part/index',NULL,'33'), ('35','还车服
务','/returncar/index',NULL,'29'), ('36','维修工单','/repairorder/index',NULL,'29'), ('37','员工管
理','/employee/index',NULL,'1'), ('38','部门管理','/department/index',NULL,'1');
INSERT INTO `t_part` VALUES ('1','轮胎','4000.00','20','10','米其林轮胎','2019-09-11 00:00:00.000000'), ('2','机
油','600.00','100','50','黑霸机油','2019-09-11 19:33:54.000000'), ('3','变速器','10000.00','70','20','米其林变速器','2019-09-04 
19:35:47.000000'), ('4','冷凝剂','5000.00','99','30','冲冲冲','2019-09-05 14:25:30.000000'), ('5','刹车
片','2222.00','3333','70','冲冲冲','2019-09-06 14:25:59.000000'), ('6','离合器','3333.00','4444','88','冲冲冲','2019-09-01 
14:27:18.000000'), ('7','祈祈','122.00','222','222','22','2019-09-19 11:17:20.000000');
INSERT INTO `t_payway` VALUES ('1','现金支付'), ('2','银行卡支付'), ('3','信用卡支付'), ('4','微信支付'), ('5','支付宝支付');
INSERT INTO `t_permission` VALUES ('1','角色管理1','/role/index','role:index','25'), ('2','权限管
理','/permission/index','permission:index','26'), ('3','菜单管理','/menu/index','menu:index','27'), ('4','日志管
理','/systemlog/index','systemlog:index','28'), ('5','维修工单','/repairorder/index','repairorder:index','29'), ('6','结算管
理','/settedbill/index','settedbill:index','30'), ('7','支付管理','/payway/index','payway:index','31'), ('8','配件管
理','/part/index','part:index','33'), ('9','员工管理','/employee/index','employee:index','37'), ('10','部门管
理','/department/index','department:index','38'), ('13','还车管理','/returncar/index','returncar:index','35'), ('14','维修明
细','/repairorderitem/index','repairorderitem:index',NULL);
INSERT INTO `t_permission_copy` VALUES ('1','角色管理','/role/index','role:index','25'), ('2','权限管
理','/permission/index','permission:index','26'), ('3','菜单管理','/menu/index','menu:index','27'), ('4','日志管
理','/systemlog/index','systemlog:index','28'), ('5','维修工单','/repairorder/index','repairorder:index','29'), ('6','结算管
理','/settedbill/index','settedbill:index','30'), ('7','支付管理','/payway/index','payway:index','31'), ('8','配件管
理','/part/index','part:index','33'), ('9','员工管理','/employee/index','employee:index','37'), ('10','部门管
理','/department/index','department:index','38'), ('13','还车管理','/returncar/index','returncar:index','35'), ('14','维修明
细','/repairorderitem/index','repairorderitem:index',NULL);
INSERT INTO `t_repairorder` VALUES ('1','雄峰','京A88888','2019-09-11 15:29:11','0','1','朝阳区58号'), ('2','邱定森','京
A99999','2019-09-11 15:31:33','0','1','渝中区00号'), ('3','张三','渝B12345','2019-09-19 08:50:34','0','2','大竹林');
INSERT INTO `t_repairorderitem` VALUES ('1','1','1','1','12.00','12.00','12.00','156.00');
INSERT INTO `t_resource` VALUES ('1','日志管理','/systemlog/index');
INSERT INTO `t_role` VALUES ('1','admin','管理员','1'), ('2','jiedaiyuan','接待员','4'), ('3','option','维修员','2'), 
('4','settlement','结算员','2');
INSERT INTO `t_role_menu` VALUES ('1','1'), ('1','25'), ('1','26'), ('1','27'), ('1','28'), ('1','29'), ('1','30'), ('1','31'), 
('1','32'), ('1','33'), ('1','34'), ('1','35'), ('1','36'), ('1','37'), ('1','38');
INSERT INTO `t_role_permission` VALUES ('1','1'), ('1','2'), ('1','3'), ('1','4'), ('1','5'), ('1','6'), ('1','7'), ('1','8'), 
('1','9'), ('1','10'), ('1','13'), ('1','14');
INSERT INTO `t_settedbill` VALUES ('1','奚铭','2','2019-07-17','1','1200.00','1200.00','c304','4');
INSERT INTO `t_systemlog` VALUES ('1','admin','1.1.1.1.1','111','12','2019-09-16'), 
('2',NULL,'127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-16'), 
('3',NULL,'127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-16'), 
('4',NULL,'127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-16'), 
('5',NULL,'127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, password=admin}','2019-09-16'), 
('6',NULL,'127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('7',NULL,'127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('8',NULL,'127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-16'), 
('9',NULL,'127.0.0.1','cn.itsource.web.controller.MenuController.index()',NULL,'2019-09-16'), 
('10',NULL,'127.0.0.1','cn.itsource.web.controller.PermissionController.index()',NULL,'2019-09-16'), 
('11',NULL,'127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@2ea55a23','
2019-09-16'), ('12',NULL,'127.0.0.1','index',NULL,'2019-09-16'), 
('13','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-16'), 
('14','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-16'), 
('15','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-16'), 
('16','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('17','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('18','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('19','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('20','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-16'), 
('21','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('22','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('23','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-16'), 
('24','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('25','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('26','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('27','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('28','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-16'), 
('29','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('30','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('31','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-16'), 
('32','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-16'), 
('33','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('34','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('35','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-16'), 
('36','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('37','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('38','admin','127.0.0.1','cn.itsource.web.controller.SettedBillController.index()',NULL,'2019-09-16'), 
('39','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-16'), 
('40','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-16'), 
('41','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('42','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('43','admin','127.0.0.1','cn.itsource.web.controller.SettedBillController.index()',NULL,'2019-09-16'), 
('44','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('45','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('46','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('47','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('48','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('49','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('50','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('51','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('52','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('53','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('54','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('55','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('56','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.index()',NULL,'2019-09-16'), 
('57','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@13c22898
','2019-09-16'), ('58','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('59','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('60','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.index()',NULL,'2019-09-16'), 
('61','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@4b59b3a0
','2019-09-16'), ('62','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('63','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('64','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('65','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('66','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('67','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('68','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('69','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('70','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('71','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('72','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('73','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('74','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('75','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('76','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('77','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('78','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('79','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('80','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('81','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('82','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.index()',NULL,'2019-09-16'), 
('83','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@1219b128
','2019-09-16'), ('84','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('85','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('86','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('87','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('88','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('89','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('90','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('91','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('92','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('93','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('94','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('95','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('96','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('97','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('98','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('99','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('100','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16');
INSERT INTO `t_systemlog` VALUES 
('101','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('102','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('103','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('104','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('105','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('106','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-16'), 
('107','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('108','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('109','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-16'), 
('110','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('111','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('112','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('113','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('114','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('115','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('116','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('117','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('118','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('119','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('120','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('121','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('122','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-16'), 
('123','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('124','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('125','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('126','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('127','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('128','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('129','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('130','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('131','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('132','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('133','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('134','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('135','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('136','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('137','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-16'), 
('138','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('139','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('140','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-16'), 
('141','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('142','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('143','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.index()',NULL,'2019-09-16'), 
('144','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@244aeb1
5','2019-09-16'), ('145','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('146','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('147','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('148','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('149','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-16'), 
('150','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('151','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('152','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-16'), 
('153','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('154','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('155','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('156','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('157','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('158','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('159','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-16'), 
('160','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-16'), 
('161','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-16'), 
('162','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-16'), 
('163','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('164','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('165','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-16'), 
('166','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-16'), 
('167','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('168','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('169','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.index()',NULL,'2019-09-16'), 
('170','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.page()','cn.itsource.query.DepartmentQuery@7a4ffda2
','2019-09-16'), ('171','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.delete()','9','2019-09-16'), 
('172','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.page()','cn.itsource.query.DepartmentQuery@1be6447'
,'2019-09-16'), ('173','admin','127.0.0.1','cn.itsource.web.controller.RoleController.index()',NULL,'2019-09-16'), 
('174','admin','127.0.0.1','cn.itsource.web.controller.RoleController.findAll()',NULL,'2019-09-16'), 
('175','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-16'), 
('176','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-16'), 
('177','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-17'), 
('178','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('179','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('180','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-17'), 
('181','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-17'), 
('182','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-17'), 
('183','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('184','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('185','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('186','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('187','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('188','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('189','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('190','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('191','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('192','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('193','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('194','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('195','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('196','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('197','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('198','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('199','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('200','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17');
INSERT INTO `t_systemlog` VALUES 
('201','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('202','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('203','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('204','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('205','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('206','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('207','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('208','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('209','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-17'), 
('210','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('211','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('212','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-17'), 
('213','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('214','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('215','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-17'), 
('216','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('217','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('218','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-17'), 
('219','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('220','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('221','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('222','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('223','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('224','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('225','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('226','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('227','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-17'), 
('228','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('229','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('230','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('231','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('232','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-17'), 
('233','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('234','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('235','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('236','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('237','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('238','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('239','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('240','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('241','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('242','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('243','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('244','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('245','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('246','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('247','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('248','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('249','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-17'), 
('250','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('251','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('252','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-17'), 
('253','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('254','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('255','admin','127.0.0.1','cn.itsource.web.controller.RoleController.index()',NULL,'2019-09-17'), 
('256','admin','127.0.0.1','cn.itsource.web.controller.RoleController.findAll()',NULL,'2019-09-17'), 
('257','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.index()',NULL,'2019-09-17'), 
('258','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@3890809
8','2019-09-17'), ('259','admin','127.0.0.1','cn.itsource.web.controller.MenuController.index()',NULL,'2019-09-17'), 
('260','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findAll()',NULL,'2019-09-17'), 
('261','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-17'), 
('262','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-17'), 
('263','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.index()',NULL,'2019-09-17'), 
('264','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.page()','cn.itsource.query.DepartmentQuery@1b8a0048
','2019-09-17'), ('265','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.index()',NULL,'2019-09-17'), 
('266','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@627c8d7
8','2019-09-17'), ('267','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('268','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('269','admin','127.0.0.1','cn.itsource.web.controller.RoleController.index()',NULL,'2019-09-17'), 
('270','admin','127.0.0.1','cn.itsource.web.controller.RoleController.findAll()',NULL,'2019-09-17'), 
('271','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.index()',NULL,'2019-09-17'), 
('272','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@1f0f8c2
5','2019-09-17'), ('273','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('274','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('275','admin','127.0.0.1','cn.itsource.web.controller.SettedBillController.index()',NULL,'2019-09-17'), 
('276','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('277','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('278','admin','127.0.0.1','cn.itsource.web.controller.PartController.index()',NULL,'2019-09-17'), 
('279','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@677ccafd','2019
-09-17'), ('280','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('281','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('282','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('283','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('284','admin','127.0.0.1','cn.itsource.web.controller.PartController.index()',NULL,'2019-09-17'), 
('285','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@45a277ad','2019
-09-17'), ('286','admin','127.0.0.1','cn.itsource.web.controller.RoleController.index()',NULL,'2019-09-17'), 
('287','admin','127.0.0.1','cn.itsource.web.controller.RoleController.findAll()',NULL,'2019-09-17'), 
('288','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.index()',NULL,'2019-09-17'), 
('289','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@793e35a
0','2019-09-17'), 
('290','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@5b59483
5','2019-09-17'), ('291','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('292','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('293','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.index()',NULL,'2019-09-17'), 
('294','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@50b669f
a','2019-09-17'), 
('295','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@1ed6038
c','2019-09-17'), ('296','admin','127.0.0.1','cn.itsource.web.controller.RoleController.index()',NULL,'2019-09-17'), 
('297','admin','127.0.0.1','cn.itsource.web.controller.RoleController.findAll()',NULL,'2019-09-17'), 
('298','admin','127.0.0.1','cn.itsource.web.controller.MenuController.index()',NULL,'2019-09-17'), 
('299','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findAll()',NULL,'2019-09-17'), 
('300','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-17');
INSERT INTO `t_systemlog` VALUES 
('301','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('302','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('303','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-17'), 
('304','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('305','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('306','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-17'), 
('307','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('308','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('309','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-17'), 
('310','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-17'), 
('311','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('312','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('313','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-17'), 
('314','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('315','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('316','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('317','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('318','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('319','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('320','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-17'), 
('321','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('322','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('323','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-17'), 
('324','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-17'), 
('325','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-17'), 
('326','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-17'), 
('327','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('328','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('329','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-17'), 
('330','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-17'), 
('331','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-17'), 
('332','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('333','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('334','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-17'), 
('335','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-17'), 
('336','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-17'), 
('337','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-17'), 
('338','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-17'), 
('339','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-17'), 
('340','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('341','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('342','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('343','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('344','admin','127.0.0.1','cn.itsource.web.controller.RoleController.index()',NULL,'2019-09-18'), 
('345','admin','127.0.0.1','cn.itsource.web.controller.RoleController.findAll()',NULL,'2019-09-18'), 
('346','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('347','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@2ea01199','
2019-09-18'), 
('348','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@cadcb59'
,'2019-09-18'), ('349','admin','127.0.0.1','cn.itsource.web.controller.SettedBillController.index()',NULL,'2019-09-18'), 
('350','admin','127.0.0.1','cn.itsource.web.controller.SettedBillController.findBypId()',NULL,'2019-09-18'), 
('351','admin','127.0.0.1','cn.itsource.web.controller.ReturnCarController.index()',NULL,'2019-09-18'), 
('352','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('353','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('354','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('355','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('356','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('357','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('358','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.index()',NULL,'2019-09-18'), 
('359','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@6946796
0','2019-09-18'), ('360','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('361','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('362','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.index()',NULL,'2019-09-18'), 
('363','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@4f79546
4','2019-09-18'), ('364','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('365','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('366','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('367','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@527b2f6c','
2019-09-18'), 
('368','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@6226e82c
','2019-09-18'), 
('369','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@5c3ef6ec
','2019-09-18'), ('370','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('371','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('372','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('373','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('374','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('375','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('376','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('377','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-18'), 
('378','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('379','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('380','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('381','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@32e642dc','
2019-09-18'), 
('382','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@6ab9dcf5
','2019-09-18'), ('383','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('384','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('385','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('386','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('387','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('388','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('389','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('390','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('391','admin','127.0.0.1','cn.itsource.web.controller.PartController.findAll()',NULL,'2019-09-18'), 
('392','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-18'), 
('393','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findByMainId()','2','2019-09-18'), 
('394','admin','127.0.0.1','cn.itsource.web.controller.MenuController.index()',NULL,'2019-09-18'), 
('395','admin','127.0.0.1','cn.itsource.web.controller.MenuController.queryPage()','cn.itsource.query.MenuQuery@48c3d03a','2019
-09-18'), ('396','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findByMainId()','2','2019-09-18'), 
('397','admin','127.0.0.1','cn.itsource.web.controller.MenuController.queryPage()','cn.itsource.query.MenuQuery@634c55b4','2019
-09-18'), ('398','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findByMainId()','1','2019-09-18'), 
('399','admin','127.0.0.1','cn.itsource.web.controller.MenuController.queryPage()','cn.itsource.query.MenuQuery@62ee5bef','2019
-09-18'), ('400','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findByMainId()','1','2019-09-18');
INSERT INTO `t_systemlog` VALUES 
('401','admin','127.0.0.1','cn.itsource.web.controller.RoleController.index()',NULL,'2019-09-18'), 
('402','admin','127.0.0.1','cn.itsource.web.controller.RoleController.findAll()',NULL,'2019-09-18'), 
('403','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findByMainId()','2','2019-09-18'), 
('404','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findByMainId()','1','2019-09-18'), 
('405','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findByMainId()','2','2019-09-18'), 
('406','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('407','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('408','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('409','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('410','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('411','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@30498507','
2019-09-18'), 
('412','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@5c471a6d
','2019-09-18'), ('413','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('414','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('415','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('416','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('417','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('418','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('419','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('420','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('421','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findByMainId()','1','2019-09-18'), 
('422','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findByMainId()','1','2019-09-18'), 
('423','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findByMainId()','2','2019-09-18'), 
('424','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findByMainId()','1','2019-09-18'), 
('425','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findByMainId()','2','2019-09-18'), 
('426','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findByMainId()','1','2019-09-18'), 
('427','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('428','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('429','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('430','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('431','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('432','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('433','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('434','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('435','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('436','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('437','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@6190ec2d','
2019-09-18'), ('438','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('439','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('440','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('441','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('442','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('443','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('444','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('445','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@50525ceb
','2019-09-18'), ('446','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('447','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('448','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('449','admin','127.0.0.1','cn.itsource.web.controller.RoleController.index()',NULL,'2019-09-18'), 
('450','admin','127.0.0.1','cn.itsource.web.controller.RoleController.findAll()',NULL,'2019-09-18'), 
('451','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.index()',NULL,'2019-09-18'), 
('452','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@40bd327
0','2019-09-18'), ('453','admin','127.0.0.1','cn.itsource.web.controller.MenuController.index()',NULL,'2019-09-18'), 
('454','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findAll()',NULL,'2019-09-18'), 
('455','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('456','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-18'), 
('457','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.index()',NULL,'2019-09-18'), 
('458','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.page()','cn.itsource.query.DepartmentQuery@490dea1d
','2019-09-18'), ('459','admin','127.0.0.1','cn.itsource.web.controller.SettedBillController.index()',NULL,'2019-09-18'), 
('460','admin','127.0.0.1','cn.itsource.web.controller.SettedBillController.findBypId()',NULL,'2019-09-18'), 
('461','admin','127.0.0.1','cn.itsource.web.controller.ReturnCarController.index()',NULL,'2019-09-18'), 
('462','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('463','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('464','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('465','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('466','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('467','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('468','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('469','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-18'), 
('470','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('471','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('472','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('473','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('474','admin','127.0.0.1','cn.itsource.web.controller.PartController.index()',NULL,'2019-09-18'), 
('475','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@a14d52b','2019-
09-18'), ('476','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('477','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('478','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('479','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('480','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('481','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('482','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('483','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-18'), 
('484','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('485','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('486','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('487','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('488','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('489','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('490','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('491','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('492','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('493','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('494','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('495','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('496','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('497','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('498','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('499','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('500','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18');
INSERT INTO `t_systemlog` VALUES 
('501','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('502','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('503','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('504','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('505','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('506','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('507','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('508','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('509','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('510','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('511','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('512','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('513','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('514','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('515','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('516','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('517','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('518','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','1','2019-09-18'), 
('519','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('520','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('521','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('522','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('523','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('524','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@27fb4531','
2019-09-18'), 
('525','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@e4c1a5e'
,'2019-09-18'), ('526','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('527','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('528','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('529','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('530','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('531','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findOne()','1','2019-09-18'), 
('532','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('533','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('534','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('535','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('536','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('537','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findOne()','1','2019-09-18'), 
('538','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('539','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('540','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('541','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('542','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('543','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','1','2019-09-18'), 
('544','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('545','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','1','2019-09-18'), 
('546','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('547','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('548','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('549','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@3ce29b78','
2019-09-18'), 
('550','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@3ce53257
','2019-09-18'), 
('551','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@7af65fbc
','2019-09-18'), ('552','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('553','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('554','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('555','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@117cd380','
2019-09-18'), 
('556','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@5af72958
','2019-09-18'), ('557','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('558','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('559','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('560','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('561','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('562','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@5b44724','2
019-09-18'), 
('563','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@4400a11e
','2019-09-18'), ('564','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('565','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('566','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('567','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@75d379ad','
2019-09-18'), 
('568','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@6a2ffab7
','2019-09-18'), ('569','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('570','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('571','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('572','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@52554450','
2019-09-18'), ('573','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('574','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('575','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('576','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@82a7d78','2
019-09-18'), ('577','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('578','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('579','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('580','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('581','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('582','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','1','2019-09-18'), 
('583','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('584','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('585','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('586','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@43055fba','
2019-09-18'), ('587','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('588','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('589','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('590','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('591','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('592','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('593','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('594','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@504ef535','
2019-09-18'), 
('595','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@301754b9
','2019-09-18'), 
('596','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@581c9440
','2019-09-18'), ('597','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('598','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('599','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('600','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@21bb8048','
2019-09-18');
INSERT INTO `t_systemlog` VALUES 
('601','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@3c5ed473
','2019-09-18'), 
('602','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.list()','cn.itsource.query.DepartmentQuery@c883e02'
,'2019-09-18'), ('603','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('604','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('605','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('606','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('607','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@7edf55aa','
2019-09-18'), 
('608','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.query()','cn.itsource.query.EmployeeQuery@19ddc5a0','
2019-09-18'), ('609','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('610','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('611','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('612','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('613','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('614','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@135dde8f','
2019-09-18'), 
('615','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.query()','cn.itsource.query.EmployeeQuery@213998f3','
2019-09-18'), 
('616','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.query()','cn.itsource.query.EmployeeQuery@5ca4172f','
2019-09-18'), 
('617','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.query()','cn.itsource.query.EmployeeQuery@d03ac31','2
019-09-18'), 
('618','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.query()','cn.itsource.query.EmployeeQuery@33a7b2b0','
2019-09-18'), 
('619','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.query()','cn.itsource.query.EmployeeQuery@41f97fc6','
2019-09-18'), ('620','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('621','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('622','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('623','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('624','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('625','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@1ac712a0','
2019-09-18'), 
('626','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.query()','cn.itsource.query.EmployeeQuery@6242ca8e','
2019-09-18'), 
('627','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.query()','cn.itsource.query.EmployeeQuery@577936b8','
2019-09-18'), ('628','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('629','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('630','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('631','admin','127.0.0.1','cn.itsource.web.controller.PartController.index()',NULL,'2019-09-18'), 
('632','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@1b087e02','2019
-09-18'), ('633','admin','127.0.0.1','cn.itsource.web.controller.PartController.deleteById()',NULL,'2019-09-18'), 
('634','admin','127.0.0.1','cn.itsource.web.controller.PartController.query()','cn.itsource.query.PartQuery@4a25a34b','2019-09-
18'), 
('635','admin','127.0.0.1','cn.itsource.web.controller.PartController.query()','cn.itsource.query.PartQuery@628ec1d2','2019-09-
18'), 
('636','admin','127.0.0.1','cn.itsource.web.controller.PartController.query()','cn.itsource.query.PartQuery@63be4db6','2019-09-
18'), 
('637','admin','127.0.0.1','cn.itsource.web.controller.PartController.query()','cn.itsource.query.PartQuery@768aff18','2019-09-
18'), ('638','admin','127.0.0.1','cn.itsource.web.controller.PartController.saveOrUpdate()','Part{id=1, name=\'轮胎\', 
price=3000, num=20, warnum=20, context=\'米其林轮胎\', createtime=Wed Sep 11 00:00:00 CST 2019}','2019-09-18'), 
('639','admin','127.0.0.1','cn.itsource.web.controller.PartController.saveOrUpdate()','Part{id=1, name=\'轮胎\', price=3000, 
num=20, warnum=20, context=\'米其林轮胎\', createtime=Wed Sep 11 00:00:00 CST 2019}','2019-09-18'), 
('640','admin','127.0.0.1','cn.itsource.web.controller.PartController.saveOrUpdate()','Part{id=1, name=\'轮胎\', price=3000, 
num=20, warnum=20, context=\'米其林轮胎\', createtime=Wed Sep 11 00:00:00 CST 2019}','2019-09-18'), 
('641','admin','127.0.0.1','cn.itsource.web.controller.PartController.saveOrUpdate()','Part{id=1, name=\'轮胎\', price=3000, 
num=20, warnum=20, context=\'米其林轮胎\', createtime=Wed Sep 11 00:00:00 CST 2019}','2019-09-18'), 
('642','admin','127.0.0.1','cn.itsource.web.controller.PartController.saveOrUpdate()','Part{id=1, name=\'轮胎\', price=3000, 
num=20, warnum=20, context=\'米其林轮胎\', createtime=Wed Sep 11 00:00:00 CST 2019}','2019-09-18'), 
('643','admin','127.0.0.1','cn.itsource.web.controller.PartController.saveOrUpdate()','Part{id=1, name=\'轮胎\', price=3000, 
num=20, warnum=20, context=\'米其林轮胎\', createtime=Wed Sep 11 00:00:00 CST 2019}','2019-09-18'), 
('644','admin','127.0.0.1','cn.itsource.web.controller.PartController.saveOrUpdate()','Part{id=1, name=\'轮胎\', price=3000, 
num=20, warnum=20, context=\'米其林轮胎\', createtime=Wed Sep 11 00:00:00 CST 2019}','2019-09-18'), 
('645','admin','127.0.0.1','cn.itsource.web.controller.PartController.deleteById()',NULL,'2019-09-18'), 
('646','admin','127.0.0.1','cn.itsource.web.controller.PartController.saveOrUpdate()','Part{id=1, name=\'轮胎\', price=3000, 
num=20, warnum=20, context=\'米其林轮胎\', createtime=Wed Sep 11 00:00:00 CST 2019}','2019-09-18'), 
('647','admin','127.0.0.1','cn.itsource.web.controller.PartController.deleteById()',NULL,'2019-09-18'), 
('648','admin','127.0.0.1','cn.itsource.web.controller.PartController.saveOrUpdate()','Part{id=1, name=\'轮胎\', price=3000, 
num=20, warnum=20, context=\'米其林轮胎\', createtime=Wed Sep 11 00:00:00 CST 2019}','2019-09-18'), 
('649','admin','127.0.0.1','cn.itsource.web.controller.PartController.saveOrUpdate()','Part{id=1, name=\'轮胎\', price=3000, 
num=20, warnum=20, context=\'米其林轮胎\', createtime=Wed Sep 11 00:00:00 CST 2019}','2019-09-18'), 
('650','admin','127.0.0.1','cn.itsource.web.controller.PartController.saveOrUpdate()','Part{id=1, name=\'轮胎\', price=3000, 
num=20, warnum=20, context=\'米其林轮胎\', createtime=Wed Sep 11 00:00:00 CST 2019}','2019-09-18'), 
('651','admin','127.0.0.1','cn.itsource.web.controller.PartController.saveOrUpdate()','Part{id=1, name=\'轮胎\', price=3000, 
num=20, warnum=20, context=\'米其林轮胎\', createtime=Wed Sep 11 00:00:00 CST 2019}','2019-09-18'), 
('652','admin','127.0.0.1','cn.itsource.web.controller.PartController.deleteById()',NULL,'2019-09-18'), 
('653','admin','127.0.0.1','cn.itsource.web.controller.PartController.saveOrUpdate()','Part{id=2, name=\'机油\', price=600, 
num=100, warnum=10, context=\'黑霸机油\', createtime=Wed Sep 11 00:00:00 CST 2019}','2019-09-18'), 
('654','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.query()','cn.itsource.query.EmployeeQuery@5dffb846','
2019-09-18'), 
('655','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.query()','cn.itsource.query.EmployeeQuery@4a853a3','2
019-09-18'), ('656','admin','127.0.0.1','cn.itsource.web.controller.PartController.deleteById()',NULL,'2019-09-18'), 
('657','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('658','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('659','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('660','admin','127.0.0.1','cn.itsource.web.controller.PartController.index()',NULL,'2019-09-18'), 
('661','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@1dd39946','2019
-09-18'), ('662','admin','127.0.0.1','cn.itsource.web.controller.PartController.deleteById()',NULL,'2019-09-18'), 
('663','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('664','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('665','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('666','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@73ffc4e9','
2019-09-18'), 
('667','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@1e61f66a','
2019-09-18'), 
('668','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@38f589f6','
2019-09-18'), ('669','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('670','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@648e3cd8','
2019-09-18'), 
('671','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@5546832a','
2019-09-18'), ('672','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('673','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('674','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('675','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@3e6043fa','
2019-09-18'), 
('676','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.query()','cn.itsource.query.EmployeeQuery@24b7c995','
2019-09-18'), ('677','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('678','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('679','admin','127.0.0.1','cn.itsource.web.controller.PartController.index()',NULL,'2019-09-18'), 
('680','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@1372665','2019-
09-18'), 
('681','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@24c71e88','2019
-09-18'), 
('682','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@ea083c4','2019-
09-18'), 
('683','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@3beab846','2019
-09-18'), 
('684','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@34727ff9','2019
-09-18'), 
('685','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@22b7f9b2','2019
-09-18'), 
('686','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@428c0432','2019
-09-18'), 
('687','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@606d93b8','2019
-09-18'), 
('688','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@5cb94fa5','2019
-09-18'), ('689','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('690','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('691','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('692','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('693','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('694','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@542edd37','
2019-09-18'), 
('695','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.query()','cn.itsource.query.EmployeeQuery@53f712c7','
2019-09-18'), ('696','admin','127.0.0.1','cn.itsource.web.controller.MenuController.index()',NULL,'2019-09-18'), 
('697','admin','127.0.0.1','cn.itsource.web.controller.MenuController.queryPage()','cn.itsource.query.MenuQuery@190ea6ce','2019
-09-18'), 
('698','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@160ced7a','2019-09-
18'), 
('699','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@3cd76bd9','2019-09-
18'), 
('700','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@66653216','2019-09-
18');
INSERT INTO `t_systemlog` VALUES 
('701','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@78245ea4','2019-09-
18'), 
('702','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@11f4e7f8','2019-09-
18'), 
('703','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@2811bf81','2019-09-
18'), 
('704','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@5437591e','2019-09-
18'), 
('705','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@e2c756','2019-09-18
'), 
('706','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@7d98afa1','2019-09-
18'), ('707','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('708','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('709','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('710','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('711','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('712','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('713','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('714','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-18'), 
('715','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('716','admin','127.0.0.1','cn.itsource.web.controller.PartController.index()',NULL,'2019-09-18'), 
('717','admin','127.0.0.1','cn.itsource.web.controller.PartController.queryPage()','cn.itsource.query.PartQuery@77e0e31b','2019
-09-18'), ('718','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('719','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('720','admin','127.0.0.1','cn.itsource.web.controller.RoleController.index()',NULL,'2019-09-18'), 
('721','admin','127.0.0.1','cn.itsource.web.controller.RoleController.findAll()',NULL,'2019-09-18'), 
('722','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.index()',NULL,'2019-09-18'), 
('723','admin','127.0.0.1','cn.itsource.web.controller.PermissionController.query()','cn.itsource.query.PermissionQuery@286a70a
9','2019-09-18'), ('724','admin','127.0.0.1','cn.itsource.web.controller.MenuController.index()',NULL,'2019-09-18'), 
('725','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findAll()',NULL,'2019-09-18'), 
('726','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('727','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-18'), 
('728','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.index()',NULL,'2019-09-18'), 
('729','admin','127.0.0.1','cn.itsource.web.controller.DepartmentController.page()','cn.itsource.query.DepartmentQuery@2e10415'
,'2019-09-18'), ('730','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('731','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('732','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('733','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('734','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('735','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('736','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('737','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-18'), 
('738','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.save()','RepairOrder{id=null, custormer=\'null\', 
carNum=\'null\', createTime=null, status=null, userName=\'null\', address=\'null\'}','2019-09-18'), 
('739','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('740','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('741','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('742','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('743','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.index()',NULL,'2019-09-18'), 
('744','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.queryPage()','cn.itsource.query.MenuQuery@3f6066e0','
2019-09-18'), ('745','admin','127.0.0.1','cn.itsource.web.controller.MenuController.index()',NULL,'2019-09-18'), 
('746','admin','127.0.0.1','cn.itsource.web.controller.MenuController.queryPage()','cn.itsource.query.MenuQuery@33cc1518','2019
-09-18'), 
('747','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@6e4d0d9e','2019-09-
18'), ('748','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.save()','RepairOrder{id=null, 
custormer=\'null\', carNum=\'null\', createTime=null, status=null, userName=\'null\', address=\'null\'}','2019-09-18'), 
('749','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('750','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('751','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('752','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('753','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('754','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('755','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('756','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('757','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('758','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('759','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('760','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('761','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('762','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('763','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('764','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('765','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('766','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-18'), 
('767','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.save()','RepairOrder{id=null, custormer=\'null\', 
carNum=\'null\', createTime=null, status=null, userName=\'null\', address=\'null\'}','2019-09-18'), 
('768','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@55de8b25','2019-09-
18'), ('769','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.save()','RepairOrder{id=null, 
custormer=\'null\', carNum=\'null\', createTime=null, status=null, userName=\'null\', address=\'null\'}','2019-09-18'), 
('770','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('771','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('772','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('773','admin','127.0.0.1','cn.itsource.web.controller.MenuController.index()',NULL,'2019-09-18'), 
('774','admin','127.0.0.1','cn.itsource.web.controller.MenuController.queryPage()','cn.itsource.query.MenuQuery@6ec68169','2019
-09-18'), 
('775','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@587c3ad9','2019-09-
18'), 
('776','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@484da901','2019-09-
18'), 
('777','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@57998e12','2019-09-
18'), 
('778','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@3b05d7ee','2019-09-
18'), ('779','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('780','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('781','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('782','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('783','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('784','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('785','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('786','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','1','2019-09-18'), 
('787','admin','127.0.0.1','cn.itsource.web.controller.SettedBillController.index()',NULL,'2019-09-18'), 
('788','admin','127.0.0.1','cn.itsource.web.controller.SettedBillController.findBypId()',NULL,'2019-09-18'), 
('789','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('790','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('791','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('792','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('793','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('794','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('795','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('796','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','1','2019-09-18'), 
('797','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','2','2019-09-18'), 
('798','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','1','2019-09-18'), 
('799','admin','127.0.0.1','cn.itsource.web.controller.ReturnCarController.index()',NULL,'2019-09-18'), 
('800','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18');
INSERT INTO `t_systemlog` VALUES 
('801','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('802','admin','127.0.0.1','cn.itsource.web.controller.MenuController.index()',NULL,'2019-09-18'), 
('803','admin','127.0.0.1','cn.itsource.web.controller.MenuController.queryPage()','cn.itsource.query.MenuQuery@7b242b57','2019
-09-18'), 
('804','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@64d8eff2','2019-09-
18'), ('805','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-18'), 
('806','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','1','2019-09-18'), 
('807','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('808','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('809','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('810','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('811','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('812','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('813','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','1','2019-09-18'), 
('814','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('815','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('816','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('817','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('818','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('819','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('820','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('821','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-18'), 
('822','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('823','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('824','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('825','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('826','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('827','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','1','2019-09-18'), 
('828','admin','127.0.0.1','cn.itsource.web.controller.MenuController.query()','cn.itsource.query.MenuQuery@6ab02016','2019-09-
18'), ('829','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('830','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('831','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('832','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('833','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('834','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','1','2019-09-18'), 
('835','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('836','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('837','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('838','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('839','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('840','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','1','2019-09-18'), 
('841','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('842','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('843','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('844','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('845','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('846','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('847','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('848','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('849','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('850','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','1','2019-09-18'), 
('851','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-18'), 
('852','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('853','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('854','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('855','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-18'), 
('856','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('857','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('858','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('859','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-18'), 
('860','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('861','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('862','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('863','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('864','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('865','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('866','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-18'), 
('867','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('868','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('869','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('870','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-18'), 
('871','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('872','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('873','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('874','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('875','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-18'), 
('876','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('877','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('878','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('879','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-18'), 
('880','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('881','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('882','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('883','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('884','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('885','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-18'), 
('886','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('887','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('888','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('889','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-18'), 
('890','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('891','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('892','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('893','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('894','admin','127.0.0.1','cn.itsource.web.controller.LoginController.loginPage()',NULL,'2019-09-18'), 
('895','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.index()',NULL,'2019-09-18'), 
('896','admin','127.0.0.1','cn.itsource.web.controller.PayWayController.findAll()',NULL,'2019-09-18'), 
('897','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('898','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('899','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('900','admin','127.0.0.1','cn.itsource.web.controller.SettedBillController.index()',NULL,'2019-09-18');
INSERT INTO `t_systemlog` VALUES 
('901','admin','127.0.0.1','cn.itsource.web.controller.SettedBillController.findBypId()',NULL,'2019-09-18'), 
('902','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.getReAmount()','1','2019-09-18'), 
('903','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('904','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('905','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('906','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('907','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('908','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('909','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-18'), 
('910','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.save()','RepairOrder{id=null, custormer=\'null\', 
carNum=\'null\', createTime=null, status=null, userName=\'null\', address=\'null\'}','2019-09-18'), 
('911','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.save()','RepairOrder{id=null, custormer=\'null\', 
carNum=\'null\', createTime=null, status=null, userName=\'null\', address=\'null\'}','2019-09-18'), 
('912','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('913','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('914','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('915','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('916','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('917','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('918','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-18'), 
('919','admin','127.0.0.1','cn.itsource.web.controller.LoginController.login()','{username=admin, 
password=admin}','2019-09-18'), 
('920','admin','127.0.0.1','cn.itsource.web.controller.LoginController.index()',NULL,'2019-09-18'), 
('921','admin','127.0.0.1','cn.itsource.web.controller.MenuController.findByEmployeeId()',NULL,'2019-09-18'), 
('922','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.index()',NULL,'2019-09-18'), 
('923','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderController.findAll()',NULL,'2019-09-18'), 
('924','admin','127.0.0.1','cn.itsource.web.controller.RepairOrderItemController.findAll()',NULL,'2019-09-18'), 
('925','admin','127.0.0.1','cn.itsource.web.controller.EmployeeController.findAll()',NULL,'2019-09-18');
INSERT INTO `t_user` VALUES ('1','lqy','lqy',NULL,NULL), ('2','lzy','lzy',NULL,NULL);
