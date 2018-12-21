/*
Navicat MySQL Data Transfer

Source Server         : a
Source Server Version : 50718
Source Host           : 127.0.0.1:3306
Source Database       : fang

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-12-21 19:45:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '123', '123');
INSERT INTO `admin` VALUES ('2', '321', '321');

-- ----------------------------
-- Table structure for agent
-- ----------------------------
DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `id_number` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `status` int(2) NOT NULL COMMENT '状态,-2删除，-1未通过，0，审核中，1审核通过，',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agent
-- ----------------------------
INSERT INTO `agent` VALUES ('32', '4211', 'liu', '-1');
INSERT INTO `agent` VALUES ('33', '110', '柳', '1');
INSERT INTO `agent` VALUES ('34', '110', '柳', '1');
INSERT INTO `agent` VALUES ('35', '110', '柳', '-1');
INSERT INTO `agent` VALUES ('100', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('101', 'liu', '4211', '1');
INSERT INTO `agent` VALUES ('102', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('103', 'liu', '4211', '1');
INSERT INTO `agent` VALUES ('104', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('105', 'liu', '4211', '1');
INSERT INTO `agent` VALUES ('106', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('107', 'liu', '4211', '1');
INSERT INTO `agent` VALUES ('108', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('109', 'liu', '4211', '1');
INSERT INTO `agent` VALUES ('110', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('111', 'liu', '4211', '1');
INSERT INTO `agent` VALUES ('112', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('113', 'liu', '4211', '1');
INSERT INTO `agent` VALUES ('114', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('115', 'liu', '4211', '1');
INSERT INTO `agent` VALUES ('116', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('117', 'liu', '4211', '1');
INSERT INTO `agent` VALUES ('118', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('119', 'liu', '4211', '1');
INSERT INTO `agent` VALUES ('120', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('121', 'liu', '4211', '1');
INSERT INTO `agent` VALUES ('122', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('123', 'liu', '4211', '1');
INSERT INTO `agent` VALUES ('124', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('125', 'liu', '4211', '1');
INSERT INTO `agent` VALUES ('126', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('127', 'liu', '4211', '1');
INSERT INTO `agent` VALUES ('128', 'liu', '4211', '0');
INSERT INTO `agent` VALUES ('129', 'liu', '4211', '1');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `cid` int(3) DEFAULT NULL COMMENT '类别id,1出租房，2二手房，3新房,4广告',
  `small_pic` varchar(100) DEFAULT NULL COMMENT '压缩图片（为了提高响应速度，作为首页内容展示不需要高清）',
  `big_pic` varchar(100) DEFAULT NULL COMMENT '高清图片',
  `headline` varchar(50) DEFAULT NULL COMMENT '首页内容展示标题（默认是house表的标题）',
  `price` varchar(20) DEFAULT NULL COMMENT '价格',
  `house_id` bigint(20) DEFAULT NULL COMMENT '对应house表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('3', '1', null, 'http://192.168.25.128:8080/images/liu/1545014670232469.jpg', '精品单间低价转让', '2321', '5');
INSERT INTO `content` VALUES ('16', '1', null, '高清图片测试', '低价转让豪华公寓', '2451', '7');

-- ----------------------------
-- Table structure for content_cat
-- ----------------------------
DROP TABLE IF EXISTS `content_cat`;
CREATE TABLE `content_cat` (
  `id` int(2) NOT NULL,
  `content_cat` varchar(20) DEFAULT NULL COMMENT '类别名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content_cat
-- ----------------------------
INSERT INTO `content_cat` VALUES ('1', '二手房广告');
INSERT INTO `content_cat` VALUES ('2', '出租房广告');

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `headline` varchar(50) DEFAULT NULL COMMENT '房屋标题',
  `sell_point` varchar(300) DEFAULT NULL COMMENT '房屋卖点',
  `price` varchar(20) DEFAULT NULL COMMENT '价格',
  `created` datetime DEFAULT NULL COMMENT '发布时间',
  `area` varchar(20) DEFAULT NULL COMMENT '面积',
  `cid` int(2) DEFAULT NULL COMMENT '类别id,对应房屋类别表',
  `storey_height` varchar(20) DEFAULT NULL COMMENT '房屋层次，低中高层',
  `village_name` varchar(20) DEFAULT NULL COMMENT '小区名字',
  `subway_name` varchar(20) DEFAULT NULL COMMENT '地铁名',
  `direction` varchar(20) DEFAULT NULL COMMENT '方向，东南西北南北',
  `status` int(2) DEFAULT NULL COMMENT '状态，0在审核，1正常，-1审核不通过',
  `block_number` varchar(20) DEFAULT NULL COMMENT '楼号',
  `unit_number` varchar(20) DEFAULT NULL COMMENT '单元号',
  `house_number` varchar(20) DEFAULT NULL COMMENT '门牌号',
  `aid` bigint(20) DEFAULT NULL COMMENT '代理人id',
  `image_1` varchar(100) DEFAULT NULL COMMENT '图片1',
  `Image_2` varchar(100) DEFAULT NULL COMMENT '图片2',
  `Image_3` varchar(100) DEFAULT NULL COMMENT '图片3',
  `Image_4` varchar(100) DEFAULT NULL COMMENT '图片4',
  `Image_5` varchar(100) DEFAULT NULL COMMENT '图片5',
  `rent_way` int(2) DEFAULT '0' COMMENT '1短期，2长期，3合租，0都可以',
  `location` varchar(30) DEFAULT NULL COMMENT '位置信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES ('1', '精品单间', '测试卖点', '100', null, '300', '1', null, '幸福小区', '岳家嘴', null, '-1', null, null, null, '100', null, null, null, null, null, '1', '阳逻');
INSERT INTO `house` VALUES ('2', '精品单间', '测试卖点', '1000', null, '900', '1', null, '幸福小区', '岳家嘴', null, '1', null, null, null, '100', 'http://192.168.25.128:8080/images/liu/1545014258818492.jpg', '', '', '', '', '1', '阳逻');
INSERT INTO `house` VALUES ('3', '精品单间低价转让', '测试卖点', '3000', null, '100', '1', null, '幸福小区', '岳家嘴', null, '-1', null, null, null, '101', null, null, null, null, null, '1', '阳逻');
INSERT INTO `house` VALUES ('4', '精品单间低价转让', '测试卖点', '1000', null, '50', '2', null, '幸福小区', '岳家嘴', null, '0', null, null, null, '102', null, null, null, null, null, '3', '阳逻');
INSERT INTO `house` VALUES ('5', '精品单间低价转让', '测试卖点', '2321', null, '50', '3', null, '幸福小区', '岳家嘴', null, '-1', null, null, null, '103', 'http://192.168.25.128:8080/images/liu/1545014670232469.jpg', '', '', '', '', '2', '光谷');
INSERT INTO `house` VALUES ('6', '低价转让豪华公寓', '测试卖点', '3210', null, '50', '4', null, '中铁小区', '汪家墩', null, '0', null, null, null, '104', null, null, null, null, null, '3', '光谷');
INSERT INTO `house` VALUES ('7', '低价转让豪华公寓', '测试卖点', '2451', null, '50', '5', null, '中铁小区', '汪家墩', null, '1', null, null, null, '105', 'http://192.168.25.128:8080/images/liu/1545014680529751.jpg', '', '', '', '', '1', '光谷');
INSERT INTO `house` VALUES ('8', '低价转让豪华公寓', '测试卖点', '150', null, '100', '1', null, '中铁小区', '汪家墩', null, '0', null, null, null, '106', null, null, null, null, null, '2', '光谷');
INSERT INTO `house` VALUES ('9', '低价转让豪华公寓', '测试卖点', '5000', null, '100', '1', null, '中铁小区', '汪家墩', null, '1', null, null, null, '107', 'http://192.168.25.128:8080/images/liu/1545014732467469.jpg', '', '', '', '', '1', '光谷软件园');
INSERT INTO `house` VALUES ('10', '低价转让豪华公寓', '测试卖点', '4000', null, '100', '2', null, '中铁小区', '徐东', null, '0', null, null, null, '108', null, null, null, null, null, '2', '光谷软件园');
INSERT INTO `house` VALUES ('11', '经济公寓限时销售', '测试卖点', '4000', null, '100', '1', null, '中铁小区', '徐东', null, '1', null, null, null, '109', 'http://192.168.25.128:8080/images/liu/1545014739436583.jpg', '', '', '', '', '3', '光谷软件园');
INSERT INTO `house` VALUES ('12', '二环内时尚公寓', '测试卖点', '1000', null, '100', '2', null, '梅苑小区', '徐东', null, '0', null, null, null, '110', null, null, null, null, null, '1', '光谷软件园');
INSERT INTO `house` VALUES ('13', '二环内时尚公寓', '测试卖点', '1102', null, '100', '3', null, '梅苑小区', '徐东', null, '1', null, null, null, '111', 'http://192.168.25.128:8080/images/liu/1545014745943454.jpg', '', '', '', '', '2', '新洲区');
INSERT INTO `house` VALUES ('14', '二环内时尚公寓', '测试卖点', '312', null, '100', '3', null, '梅苑小区', '光谷', null, '0', null, null, null, '112', null, null, null, null, null, '1', '武汉科技大学');
INSERT INTO `house` VALUES ('15', '光谷附近低价房', '测试卖点', '3213', null, '150', '3', null, '梅苑小区', '光谷', null, '1', null, null, null, '113', 'http://192.168.25.128:8080/images/liu/1545014753194113.jpg', '', '', '', '', '2', '华中科技大学');
INSERT INTO `house` VALUES ('16', '光谷附近低价房', '测试卖点', '10000', null, '150', '3', null, '梅苑小区', '光谷', null, '0', null, null, null, '114', null, null, null, null, null, '3', '黄冈');
INSERT INTO `house` VALUES ('17', '光谷附近低价房', '测试卖点', '312', null, '150', '1', null, '梅苑小区', '光谷', null, '1', null, null, null, '115', 'http://192.168.25.128:8080/images/liu/1545014761362550.jpg', '', '', '', '', '1', '傅家坡');
INSERT INTO `house` VALUES ('18', '光谷附近低价房', '测试卖点', '1324', null, '150', '1', null, '梅园小区', '光谷', null, '0', null, null, null, '116', null, null, null, null, null, '2', '傅家坡');
INSERT INTO `house` VALUES ('19', '光谷附近低价房', '测试卖点', '2131', null, '150', '1', null, '梅园小区', '后胡大道', null, '1', null, null, null, '117', 'http://192.168.25.128:8080/images/liu/1545014767242335.jpg', '', '', '', '', '2', '傅家坡');
INSERT INTO `house` VALUES ('20', '光谷附近低价房', '测试卖点', null, null, '150', '2', null, '梅园小区', '后胡大道', null, '0', null, null, null, '118', null, null, null, null, null, '3', '傅家坡');
INSERT INTO `house` VALUES ('21', '光谷附近低价房', '测试卖点', null, null, '80', '2', null, '梅园小区', '后胡大道', null, '1', null, null, null, '119', 'http://192.168.25.128:8080/images/liu/1545014776748763.jpg', '', '', '', '', '1', '新荣客运站');
INSERT INTO `house` VALUES ('22', '光谷附近低价房', '测试卖点', null, null, '80', '2', null, '梅园小区', '后胡大道', null, '0', null, null, null, '120', null, null, null, null, null, '2', '傅家坡');
INSERT INTO `house` VALUES ('23', '光谷附近低价房', '测试卖点', null, null, '300', '1', null, '经济小区', '后胡大道', null, '1', null, null, null, '121', 'http://192.168.25.128:8080/images/liu/1545014786060900.jpg', '', '', '', '', '3', '新荣客运站');
INSERT INTO `house` VALUES ('24', '光谷附近低价房', '测试卖点', null, null, '300', '1', null, '经济小区', '武生院', null, '0', null, null, null, '122', null, null, null, null, null, '1', '新荣客运站');
INSERT INTO `house` VALUES ('25', '经济公寓限时销售', '测试卖点', null, null, '300', '1', null, '经济小区', '武生院', null, '1', null, null, null, '123', 'http://192.168.25.128:8080/images/liu/1545014795905155.jpg', '', '', '', '', '2', '新荣客运站');
INSERT INTO `house` VALUES ('26', '经济公寓限时销售', '测试卖点', null, null, '300', '1', null, '经济小区', '武生院', null, '0', null, null, null, '124', null, null, null, null, null, '2', '吉林市长春药店');
INSERT INTO `house` VALUES ('27', '经济公寓限时销售', '测试卖点', null, null, '300', '1', null, '经济小区', '武生院', null, '1', null, null, null, '125', 'http://192.168.25.128:8080/images/liu/1545023077900072.jpg', '', '', '', '', '3', '吉林市长春药店');
INSERT INTO `house` VALUES ('28', '三环经济小区', '测试卖点', null, null, '300', '1', null, '经济小区', '武生院', null, '0', null, null, null, '126', null, null, null, null, null, '1', '吉林市长春药店');
INSERT INTO `house` VALUES ('29', '一环豪华别墅', '测试卖点', null, null, '300', '2', null, '经济小区', '武生院', null, '1', null, null, null, '127', 'http://192.168.25.128:8080/images/liu/1545014817766699.jpg', '', '', '', '', '2', '吉林市长春药店');
INSERT INTO `house` VALUES ('30', '一环豪华别墅', '测试卖点', null, null, '300', '2', null, '经济小区', '武生院', null, '0', null, null, null, '128', null, null, null, null, null, '1', '吉林市长春药店');
INSERT INTO `house` VALUES ('31', '一环豪华别墅', '测试卖点', null, null, '300', '2', null, '经济小区', '武生院', null, '1', null, null, null, '129', 'http://192.168.25.128:8080/images/liu/1545014832052326.jpg', '', '', '', '', '3', '吉林市长春药店');

-- ----------------------------
-- Table structure for house_cat
-- ----------------------------
DROP TABLE IF EXISTS `house_cat`;
CREATE TABLE `house_cat` (
  `id` int(2) NOT NULL,
  `cat_name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house_cat
-- ----------------------------
INSERT INTO `house_cat` VALUES ('1', '单间（不带独卫）');
INSERT INTO `house_cat` VALUES ('2', '三室一厅');
INSERT INTO `house_cat` VALUES ('3', '单间（带独卫）');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'usermanager');
INSERT INTO `permission` VALUES ('2', 'housemanage');

-- ----------------------------
-- Table structure for rent_way
-- ----------------------------
DROP TABLE IF EXISTS `rent_way`;
CREATE TABLE `rent_way` (
  `id` int(2) NOT NULL,
  `rent_name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rent_way
-- ----------------------------
INSERT INTO `rent_way` VALUES ('0', '都可以');
INSERT INTO `rent_way` VALUES ('1', '短期');
INSERT INTO `rent_way` VALUES ('2', '长期');
INSERT INTO `rent_way` VALUES ('3', '合租');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin');
INSERT INTO `role` VALUES ('2', 'productManager');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `rid` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL,
  PRIMARY KEY (`rid`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('2', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `password` varchar(300) NOT NULL COMMENT '密码',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '手机号',
  `portrait` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `status` int(2) DEFAULT NULL COMMENT '状态，0表示正常，-1删除',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2241 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '321', '1233123', '131@qq.com', '158', '', '0', '2012-12-01 10:00:00');
INSERT INTO `user` VALUES ('22', 'liu', '123', '131@qq.com', '158', '', '0', null);
INSERT INTO `user` VALUES ('23', '123', '123', '321', '312', '321', '0', null);
INSERT INTO `user` VALUES ('32', '321', '12312', '1310510120@qq.com12', '12', '12', '-1', null);
INSERT INTO `user` VALUES ('33', 'liu', '123', '131@qq.com', '158', null, '0', null);
INSERT INTO `user` VALUES ('34', 'liu', '123', '131@qq.com', '158', null, null, null);
INSERT INTO `user` VALUES ('35', '231', '312', '3112', '123', '312', '1', null);
INSERT INTO `user` VALUES ('100', '100liu', '123', '100@qq.com', '158', null, '0', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('101', '101liu', '123', '101@qq.com', '158', null, '1', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('102', '102liu', '123', '102@qq.com', '158', null, '0', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('103', '103liu', '123', '103@qq.com', '158', null, '1', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('104', '104liu', '123', '104@qq.com', '158', null, '0', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('105', '105liu', '123', '105@qq.com', '158', null, '1', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('106', '106liu', '123', '106@qq.com', '158', null, '0', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('107', '107liu', '123', '107@qq.com', '158', null, '1', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('108', '108liu', '123', '108@qq.com', '158', null, '0', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('109', '109liu', '123', '109@qq.com', '158', null, '1', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('110', '110liu', '123', '110@qq.com', '158', null, '0', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('111', '111liu', '123', '111@qq.com', '158', null, '1', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('112', '112liu', '123', '112@qq.com', '158', null, '0', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('113', '113liu', '123', '113@qq.com', '158', null, '1', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('114', '114liu', '123', '114@qq.com', '158', null, '0', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('115', '115liu', '123', '115@qq.com', '158', null, '1', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('116', '116liu', '123', '116@qq.com', '158', null, '0', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('117', '117liu', '123', '117@qq.com', '158', null, '1', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('118', '118liu', '123', '118@qq.com', '158', null, '0', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('119', '119liu', '123', '119@qq.com', '158', null, '1', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('120', '120liu', '123', '120@qq.com', '158', null, '0', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('121', '121liu', '123', '121@qq.com', '158', null, '1', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('122', '122liu', '123', '122@qq.com', '158', null, '0', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('123', '123liu', '123', '123@qq.com', '158', null, '1', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('124', '124liu', '123', '124@qq.com', '158', null, '0', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('125', '125liu', '123', '125@qq.com', '158', null, '1', '2018-12-08 16:49:31');
INSERT INTO `user` VALUES ('126', '126liu', '123', '126@qq.com', '158', null, '0', '2018-12-08 16:49:32');
INSERT INTO `user` VALUES ('127', '127liu', '123', '127@qq.com', '158', null, '1', '2018-12-08 16:49:32');
INSERT INTO `user` VALUES ('128', '128liu', '123', '128@qq.com', '158', null, '0', '2018-12-08 16:49:32');
INSERT INTO `user` VALUES ('129', '129liu', '123', '129@qq.com', '158', null, '1', '2018-12-08 16:49:32');
INSERT INTO `user` VALUES ('2234', 'liu', '123', '131@qq.com', '158', null, null, null);
INSERT INTO `user` VALUES ('2235', '123', '123', '1310510120@qq.com', '12', '12', null, '2018-12-09 20:00:29');
INSERT INTO `user` VALUES ('2236', '123', '123', '21', '12', '1', null, '2018-12-09 20:00:54');
INSERT INTO `user` VALUES ('2237', '123', '123', '', '', 'D:/springUpload/erweima.png', null, '2018-12-10 10:48:38');
INSERT INTO `user` VALUES ('2238', '123', '123', '', '', 'D:/springUpload/war1.jpg', null, '2018-12-10 10:54:40');
INSERT INTO `user` VALUES ('2239', '123', '123', '', '', '', null, '2018-12-14 11:08:06');
INSERT INTO `user` VALUES ('2240', '123', '123', '', '', 'http://192.168.25.128:8080/images/liu/1544757189648423.jpg', null, '2018-12-14 11:13:25');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `uid` bigint(20) NOT NULL,
  `rid` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('2', '2');
