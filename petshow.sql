/*
Navicat MySQL Data Transfer

Source Server         : Local Host
Source Server Version : 50619
Source Host           : localhost:3306
Source Database       : petshow

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2017-07-14 11:23:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ps_admin
-- ----------------------------
DROP TABLE IF EXISTS `ps_admin`;
CREATE TABLE `ps_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(50) DEFAULT NULL,
  `head_portrait_path` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `roleId` varchar(255) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `dict_sex` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDD92A613D02C3192` (`dict_sex`),
  CONSTRAINT `FKDD92A613D02C3192` FOREIGN KEY (`dict_sex`) REFERENCES `sys_dict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_admin
-- ----------------------------
INSERT INTO `ps_admin` VALUES ('1', 'Admin', '/PetShow/attachFiles/test/pic/201707/822c01360a754262ae8f2afc5156710b.jpg', 'C4CA4238A0B923820DCC509A6F75849B', '管理员', '1', '管理员', '1');

-- ----------------------------
-- Table structure for ps_beauty
-- ----------------------------
DROP TABLE IF EXISTS `ps_beauty`;
CREATE TABLE `ps_beauty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `beauty_name` varchar(255) DEFAULT NULL,
  `beauty_picture_path` varchar(255) DEFAULT NULL,
  `phonenum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_beauty
-- ----------------------------
INSERT INTO `ps_beauty` VALUES ('1', '乌鲁木齐市沙依巴克区西北路499号', '新疆大学美容院', '/PetShow/attachFiles/test/pic/201707/6d68a126d8c541ebb43db2c7e8b7c56b.png', '15719994781');
INSERT INTO `ps_beauty` VALUES ('2', '乌鲁木齐市沙依巴克区西北路4651', '新疆大学4651六味地黄丸', '/PetShow/attachFiles/test/pic/201707/a705aa60befe480dbfc1873601839acc.jpg', '15702251196');
INSERT INTO `ps_beauty` VALUES ('3', '乌鲁木齐市沙依巴克区西北路4651', '新疆大学4655最强战队', '/PetShow/attachFiles/test/pic/201707/6d68a126d8c541ebb43db2c7e8b7c56b.png', '15709914895');

-- ----------------------------
-- Table structure for ps_editor
-- ----------------------------
DROP TABLE IF EXISTS `ps_editor`;
CREATE TABLE `ps_editor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `editorname` varchar(255) DEFAULT NULL,
  `head_portrait_path` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `roleId` varchar(255) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `dict_sex` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDB93D729D02C3192` (`dict_sex`),
  CONSTRAINT `FKDB93D729D02C3192` FOREIGN KEY (`dict_sex`) REFERENCES `sys_dict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_editor
-- ----------------------------
INSERT INTO `ps_editor` VALUES ('1', 'Editor', '/PetShow/attachFiles/test/pic/201707/822c01360a754262ae8f2afc5156710b.jpg', 'C4CA4238A0B923820DCC509A6F75849B', '小小编辑', '2', '编辑', '2');
INSERT INTO `ps_editor` VALUES ('2', 'DaDa', '/PetShow/attachFiles/test/pic/201707/4be08cd2683c4eaa98ead1ecfeb48116.jpg', 'C4CA4238A0B923820DCC509A6F75849B', '大大', '2', '编辑', '2');
INSERT INTO `ps_editor` VALUES ('3', 'Lizhiliang', '/PetShow/attachFiles/test/pic/201707/6d68a126d8c541ebb43db2c7e8b7c56b.png', 'C4CA4238A0B923820DCC509A6F75849B', '李治亮', '2', '编辑', '1');

-- ----------------------------
-- Table structure for ps_essay
-- ----------------------------
DROP TABLE IF EXISTS `ps_essay`;
CREATE TABLE `ps_essay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `essay_picture_path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `editor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDDD1EB415E6702A0` (`editor_id`),
  CONSTRAINT `FKDDD1EB415E6702A0` FOREIGN KEY (`editor_id`) REFERENCES `ps_editor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_essay
-- ----------------------------
INSERT INTO `ps_essay` VALUES ('1', '我像一个优伶，时哭时笑着，久而久之，也不知这悲喜是自己的，还是一种表演，很多人在看着我，他们在叫好，但我很孤独，我生活在自己的幻想中，我幻想着我在一个简单而又复杂的世界，那里只有神与妖，没有人，没有人间的一切琐碎，却有一切你所想象不到的东西。但真正生活在那里，我又孤独，因为我是一个人。', '/PetShow/attachFiles/test/pic/201707/e295edce8c56468e8ee7451907859807.png', '陈二狗的妖孽人生', '1');
INSERT INTO `ps_essay` VALUES ('2', '能记得你的人已经不在了,我也已经不在了,没有人再爱着你也没有人再恨着你,一切不过是虚无,我也只是虚无,在宇宙间飘忽,没有倒影,光线穿透我而去,没有人看见我.', '/PetShow/attachFiles/test/pic/201707/822c01360a754262ae8f2afc5156710b.jpg', 'String', '1');
INSERT INTO `ps_essay` VALUES ('3', '世中仙 千般流连是风月  惘人间 千般婉转皆戏言  忆少年 忆不过逝水经年  倾城颜 莫怪笑人太痴癫  纤影翩 戏子 多情怨  解语解花 再经年  粉黛掩 眉眼 犹少年  叹此间世事 如烟', '/PetShow/attachFiles/test/pic/201707/20693f78c75046d7b20bb02eb746b082.jpg', '大大大大大大', '2');
INSERT INTO `ps_essay` VALUES ('4', '站在多洛米蒂山脉上远观可能会让你对意大利的美景有一个全新的角度。在Lagazuoi山，登山者可以在这里休息，也可以从这里看到意大利东北部山脉的另外一座山峰——佩尔莫山。而位于高耸山脉之间的科尔蒂纳丹佩佐市，则是欧洲人的热门滑雪胜地。', '/PetShow/attachFiles/test/pic/201707/6cb56ed6a28645e09a54d8cf76c04dd0.jpg', '意大利的山山水水', '3');

-- ----------------------------
-- Table structure for ps_hospital
-- ----------------------------
DROP TABLE IF EXISTS `ps_hospital`;
CREATE TABLE `ps_hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `hospital_picture_path` varchar(255) DEFAULT NULL,
  `phonenum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_hospital
-- ----------------------------
INSERT INTO `ps_hospital` VALUES ('1', '乌鲁木齐市沙依巴克区农大东路', '新疆农业大学动物医学学院动物医院', '/PetShow/attachFiles/test/pic/201707/f1334229a86e4cb6b19a81dc70d05142.jpg', '0991-8762706');
INSERT INTO `ps_hospital` VALUES ('2', '新疆维吾尔自治区乌鲁木齐市沙依巴克区珠江路37号', '宠物医院珠江宠物诊所', '/PetShow/attachFiles/test/pic/201707/7bcc518445f04c168d5deaa20890141a.jpg', '0991-5626680');
INSERT INTO `ps_hospital` VALUES ('3', '南湖西路21号', '宠物医院旺旺动物门诊', '/PetShow/attachFiles/test/pic/201707/f3b5fe3f458349c6b3c7eec86ec06d4f.jpg', '0991-4661415');

-- ----------------------------
-- Table structure for ps_menu
-- ----------------------------
DROP TABLE IF EXISTS `ps_menu`;
CREATE TABLE `ps_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iconCls` varchar(255) DEFAULT NULL,
  `leaf` tinyint(1) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sn` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEE650A1BD2B3B5` (`parent_id`),
  CONSTRAINT `FKEE650A1BD2B3B5` FOREIGN KEY (`parent_id`) REFERENCES `ps_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_menu
-- ----------------------------
INSERT INTO `ps_menu` VALUES ('1', 'glyphicon glyphicon-align-justify', '0', '0', '信息管理', '0', 'admin/view', null);
INSERT INTO `ps_menu` VALUES ('2', 'glyphicon glyphicon-align-justify', '1', '1', '个人信息管理', '0', 'admin/view', '1');
INSERT INTO `ps_menu` VALUES ('3', 'glyphicon glyphicon-align-justify', '1', '1', '用户信息管理', '1', 'user/view', '1');
INSERT INTO `ps_menu` VALUES ('4', 'glyphicon glyphicon-align-justify', '1', '1', '编辑信息管理', '2', 'editor/view', '1');
INSERT INTO `ps_menu` VALUES ('5', 'glyphicon glyphicon-align-justify', '0', '0', '宠物服务管理', '1', '#', null);
INSERT INTO `ps_menu` VALUES ('6', 'glyphicon glyphicon-align-justify', '1', '1', '宠物医院管理', '0', 'pet_hospital/view', '5');
INSERT INTO `ps_menu` VALUES ('7', 'glyphicon glyphicon-align-justify', '1', '1', '宠物商店管理', '1', 'pet_shop/view', '5');
INSERT INTO `ps_menu` VALUES ('8', 'glyphicon glyphicon-align-justify', '1', '1', '宠物美容管理', '2', 'pet_beauty/view', '5');
INSERT INTO `ps_menu` VALUES ('9', 'glyphicon glyphicon-align-justify', '0', '0', '系统管理', '2', '#', null);
INSERT INTO `ps_menu` VALUES ('10', 'glyphicon glyphicon-align-justify', '1', '1', '菜单管理', '0', 'menu/view', '9');
INSERT INTO `ps_menu` VALUES ('11', 'glyphicon glyphicon-align-justify', '1', '1', '数据字典管理', '1', 'dict/view', '9');
INSERT INTO `ps_menu` VALUES ('12', 'glyphicon glyphicon-align-justify', '1', '1', '角色管理', '2', 'role/view', '9');
INSERT INTO `ps_menu` VALUES ('13', 'glyphicon glyphicon-align-justify', '1', '1', '附属文件管理', '3', 'fileAttach/view', '9');
INSERT INTO `ps_menu` VALUES ('14', 'glyphicon glyphicon-align-justify', '0', '0', '信息管理', '0', 'user/self_view', null);
INSERT INTO `ps_menu` VALUES ('15', 'glyphicon glyphicon-align-justify', '1', '1', '个人信息管理', '0', 'user/self_view', '14');
INSERT INTO `ps_menu` VALUES ('16', 'glyphicon glyphicon-align-justify', '1', '1', '宠物信息管理', '1', 'user_pet/view', '14');
INSERT INTO `ps_menu` VALUES ('17', 'glyphicon glyphicon-align-justify', '0', '0', '信息管理', '0', 'editor/self_view', null);
INSERT INTO `ps_menu` VALUES ('18', 'glyphicon glyphicon-align-justify', '1', '1', '个人信息管理', '0', 'editor/self_view', '17');
INSERT INTO `ps_menu` VALUES ('19', 'glyphicon glyphicon-align-justify', '1', '1', '文章信息管理', '1', 'essay/view', '17');

-- ----------------------------
-- Table structure for ps_pet
-- ----------------------------
DROP TABLE IF EXISTS `ps_pet`;
CREATE TABLE `ps_pet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pet_picture_path` varchar(255) DEFAULT NULL,
  `petname` varchar(255) DEFAULT NULL,
  `dict_kind` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC5A034E3A0C7CFB2` (`dict_kind`),
  KEY `FKC5A034E37CAAC760` (`user_id`),
  CONSTRAINT `FKC5A034E37CAAC760` FOREIGN KEY (`user_id`) REFERENCES `ps_user` (`id`),
  CONSTRAINT `FKC5A034E3A0C7CFB2` FOREIGN KEY (`dict_kind`) REFERENCES `sys_dict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_pet
-- ----------------------------
INSERT INTO `ps_pet` VALUES ('1', '/PetShow/attachFiles/test/pic/201707/4edb23769694425b92dc125a30f98bc9.jpg', '妞妞', '3', '1');
INSERT INTO `ps_pet` VALUES ('2', '/PetShow/attachFiles/test/pic/201707/6d68a126d8c541ebb43db2c7e8b7c56b.png', '柯基', '4', '2');
INSERT INTO `ps_pet` VALUES ('3', '/PetShow/attachFiles/test/pic/201707/a5921b2f6642441ca95a3285474b3b2b.jpg', '孙红雷', '4', '1');
INSERT INTO `ps_pet` VALUES ('8', '/PetShow/attachFiles/test/pic/201707/45a7ecab8ea748ce8ab5b8d447dd800f.jpg', '拉布拉多', '3', '9');
INSERT INTO `ps_pet` VALUES ('9', '/PetShow/attachFiles/test/pic/201707/99d5c13cd614486bb3d2ca723e3c745e.jpg', '天天', '3', '1');
INSERT INTO `ps_pet` VALUES ('10', '/PetShow/attachFiles/test/pic/201707/45a7ecab8ea748ce8ab5b8d447dd800f.jpg', '振振', '3', '10');
INSERT INTO `ps_pet` VALUES ('11', '/PetShow/attachFiles/test/pic/201707/6d68a126d8c541ebb43db2c7e8b7c56b.png', '啦啦', '3', '1');

-- ----------------------------
-- Table structure for ps_role
-- ----------------------------
DROP TABLE IF EXISTS `ps_role`;
CREATE TABLE `ps_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuIds` varchar(255) DEFAULT NULL,
  `menuNames` varchar(1000) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_role
-- ----------------------------
INSERT INTO `ps_role` VALUES ('1', '1,2,3,4,5,6,7,8,9,10,11,12,13', '信息管理,宠物服务管理,系统管理', '管理员', '拥有大多数系统权限');
INSERT INTO `ps_role` VALUES ('2', '17,18,19', '信息管理,个人信息管理,文章信息管理', '编辑', '拥有文章管理权限');
INSERT INTO `ps_role` VALUES ('3', '14,15,16', '信息管理,个人信息管理,宠物信息管理,图片信息管理', '普通用户', '拥有从查看宠物和图片信息的权限');

-- ----------------------------
-- Table structure for ps_shop
-- ----------------------------
DROP TABLE IF EXISTS `ps_shop`;
CREATE TABLE `ps_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `phonenum` varchar(255) DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `shop_picture_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_shop
-- ----------------------------
INSERT INTO `ps_shop` VALUES ('1', '新疆乌鲁木齐新市区天津北路西五巷58号嘉盛园小区1-11B', '13639931229', '圣宠宠物', '/PetShow/attachFiles/test/pic/201707/4c7ed398af2948c3b0d84509a3c704aa.jpg');
INSERT INTO `ps_shop` VALUES ('2', '乌鲁木齐市沙依巴克区红十月北一区2号楼五号铺', '13909904442', '派多格宠物店', '/PetShow/attachFiles/test/pic/201707/e94ed2ed19f94bfdb35c3eb64ed143b3.jpg');
INSERT INTO `ps_shop` VALUES ('3', '新疆乌鲁木齐新市区喀什西路景苑小区1-7', '13999992953', '家有憨狗宠物店', '/PetShow/attachFiles/test/pic/201707/20693f78c75046d7b20bb02eb746b082.jpg');

-- ----------------------------
-- Table structure for ps_user
-- ----------------------------
DROP TABLE IF EXISTS `ps_user`;
CREATE TABLE `ps_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head_portrait_path` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `roleId` varchar(255) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `dict_sex` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEE68E087D02C3192` (`dict_sex`),
  CONSTRAINT `FKEE68E087D02C3192` FOREIGN KEY (`dict_sex`) REFERENCES `sys_dict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps_user
-- ----------------------------
INSERT INTO `ps_user` VALUES ('1', '/PetShow/attachFiles/test/pic/201707/264bc0b4e2f24ed79f30a4bc57bab361.jpg', 'C4CA4238A0B923820DCC509A6F75849B', '黎正阳', '3', '普通用户', 'String', '1');
INSERT INTO `ps_user` VALUES ('2', '/PetShow/attachFiles/test/pic/201707/a705aa60befe480dbfc1873601839acc.jpg', 'C4CA4238A0B923820DCC509A6F75849B', '刘龙龙', '3', '普通用户', 'Asoh', '1');
INSERT INTO `ps_user` VALUES ('9', '/PetShow/attachFiles/test/pic/201707/20693f78c75046d7b20bb02eb746b082.jpg', 'C4CA4238A0B923820DCC509A6F75849B', '李扬', '3', '普通用户', 'Liyang', '1');
INSERT INTO `ps_user` VALUES ('10', '/PetShow/attachFiles/test/pic/201707/bb941e29860a4068a4b8de41e5be611b.png', 'C4CA4238A0B923820DCC509A6F75849B', '王振', '3', '普通用户', 'Wangzhen', '1');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(255) DEFAULT NULL,
  `itemValue` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `sn` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '性别', '男', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '性别', '女', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '种类', '狗', '狗', '0');
INSERT INTO `sys_dict` VALUES ('4', '种类', '猫', '猫', '0');

-- ----------------------------
-- Table structure for sys_file_attach
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_attach`;
CREATE TABLE `sys_file_attach` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `delFlag` int(11) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `fileType` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `totalBytes` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_file_attach
-- ----------------------------
INSERT INTO `sys_file_attach` VALUES ('1', '2017-07-12 22:10:33', null, '1', '0', 'jpg', '爱心宠物医院.jpg', '/test/pic/201707/7bcc518445f04c168d5deaa20890141a.jpg', null, '22.5 KB', '22480');
INSERT INTO `sys_file_attach` VALUES ('2', '2017-07-12 22:10:33', null, '1', '0', 'jpg', '宠物医院.jpg', '/test/pic/201707/f1334229a86e4cb6b19a81dc70d05142.jpg', null, '22.4 KB', '22366');
INSERT INTO `sys_file_attach` VALUES ('3', '2017-07-12 22:10:33', null, '1', '0', 'jpg', '布鲁宠物店.jpg', '/test/pic/201707/e94ed2ed19f94bfdb35c3eb64ed143b3.jpg', null, '16.0 KB', '16007');
INSERT INTO `sys_file_attach` VALUES ('4', '2017-07-12 22:10:33', null, '1', '0', 'jpg', '宠物.jpg', '/test/pic/201707/20693f78c75046d7b20bb02eb746b082.jpg', null, '9.7 KB', '9718');
INSERT INTO `sys_file_attach` VALUES ('5', '2017-07-12 22:10:33', null, '1', '0', 'jpg', 'IU.jpg', '/test/pic/201707/264bc0b4e2f24ed79f30a4bc57bab361.jpg', null, '243.8 KB', '243801');
INSERT INTO `sys_file_attach` VALUES ('6', '2017-07-12 22:10:33', null, '1', '0', 'jpg', '胜宠宠物店.jpg', '/test/pic/201707/4c7ed398af2948c3b0d84509a3c704aa.jpg', null, '2.9 KB', '2930');
INSERT INTO `sys_file_attach` VALUES ('7', '2017-07-12 22:10:33', null, '1', '0', 'jpg', '旺旺医院.jpg', '/test/pic/201707/f3b5fe3f458349c6b3c7eec86ec06d4f.jpg', null, '15.9 KB', '15873');
INSERT INTO `sys_file_attach` VALUES ('8', '2017-07-12 22:10:33', null, '1', '0', 'jpg', '青村.jpg', '/test/pic/201707/4be08cd2683c4eaa98ead1ecfeb48116.jpg', null, '140.9 KB', '140859');
INSERT INTO `sys_file_attach` VALUES ('9', '2017-07-12 22:14:53', null, '1', '0', 'png', '柯基.png', '/test/pic/201707/6d68a126d8c541ebb43db2c7e8b7c56b.png', null, '432.2 KB', '432249');
INSERT INTO `sys_file_attach` VALUES ('10', '2017-07-12 22:14:53', null, '1', '0', 'png', '狗狗.png', '/test/pic/201707/e295edce8c56468e8ee7451907859807.png', null, '243.1 KB', '243139');
INSERT INTO `sys_file_attach` VALUES ('11', '2017-07-12 22:14:53', null, '1', '0', 'png', '老鼠.png', '/test/pic/201707/bb941e29860a4068a4b8de41e5be611b.png', null, '267.4 KB', '267433');
INSERT INTO `sys_file_attach` VALUES ('12', '2017-07-12 22:14:53', null, '1', '0', 'jpg', '美女.jpg', '/test/pic/201707/822c01360a754262ae8f2afc5156710b.jpg', null, '157.7 KB', '157740');
INSERT INTO `sys_file_attach` VALUES ('13', '2017-07-13 10:55:13', null, '1', '0', 'jpg', 'Liu.jpg', '/test/pic/201707/a705aa60befe480dbfc1873601839acc.jpg', null, '55.1 KB', '55071');
INSERT INTO `sys_file_attach` VALUES ('14', '2017-07-13 13:36:32', null, '1', '0', 'jpg', '拉布拉多.jpg', '/test/pic/201707/45a7ecab8ea748ce8ab5b8d447dd800f.jpg', null, '40.7 KB', '40671');
INSERT INTO `sys_file_attach` VALUES ('15', '2017-07-13 13:36:32', null, '1', '0', 'jpg', '萨摩耶.jpg', '/test/pic/201707/4edb23769694425b92dc125a30f98bc9.jpg', null, '21.4 KB', '21437');
INSERT INTO `sys_file_attach` VALUES ('16', '2017-07-13 13:36:32', null, '1', '0', 'jpg', '日本尖嘴.jpg', '/test/pic/201707/99d5c13cd614486bb3d2ca723e3c745e.jpg', null, '33.4 KB', '33354');
INSERT INTO `sys_file_attach` VALUES ('17', '2017-07-13 13:36:32', null, '1', '0', 'jpg', '牛头梗犬 .jpg', '/test/pic/201707/a5921b2f6642441ca95a3285474b3b2b.jpg', null, '108.1 KB', '108147');
INSERT INTO `sys_file_attach` VALUES ('18', '2017-07-13 15:00:27', null, '1', '0', 'jpg', '梦境.jpg', '/test/pic/201707/6cb56ed6a28645e09a54d8cf76c04dd0.jpg', null, '119.5 KB', '119500');
