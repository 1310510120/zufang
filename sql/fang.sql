/*
Navicat MySQL Data Transfer

Source Server         : a
Source Server Version : 50718
Source Host           : 127.0.0.1:3306
Source Database       : fang

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-12-07 16:02:13
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
  `status` int(2) NOT NULL COMMENT '状态',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agent
-- ----------------------------

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `headline` varchar(50) DEFAULT NULL COMMENT '房屋标题',
  `sell_point` varchar(300) DEFAULT NULL COMMENT '房屋卖点',
  `price` varchar(20) DEFAULT NULL COMMENT '价格',
  `location` varchar(50) DEFAULT NULL COMMENT '位置',
  `created` datetime DEFAULT NULL COMMENT '发布时间',
  `area` varchar(20) DEFAULT NULL COMMENT '面积',
  `cid` bigint(20) DEFAULT NULL COMMENT '类别id',
  `storey_height` varchar(20) DEFAULT NULL COMMENT '房屋层次，低中高层',
  `villageid` bigint(20) DEFAULT NULL COMMENT '小区id，对应小区城市表的id，从而得知城市和小区名字',
  `subway_name` varchar(20) DEFAULT NULL COMMENT '地铁名',
  `direction` varchar(20) DEFAULT NULL COMMENT '方向，东南西北南北',
  `status` int(2) DEFAULT NULL COMMENT '状态，0在审核，1正常，-1审核不通过',
  `block_number` varchar(20) DEFAULT NULL COMMENT '楼号',
  `unit_number` varchar(20) DEFAULT NULL COMMENT '单元号',
  `house_number` varchar(20) DEFAULT NULL COMMENT '门牌号',
  `aid` bigint(20) DEFAULT NULL COMMENT '代理人id',
  `image_1` varchar(30) DEFAULT NULL COMMENT '图片1',
  `Image_2` varchar(30) DEFAULT NULL COMMENT '图片2',
  `Image_3` varchar(30) DEFAULT NULL COMMENT '图片3',
  `Image_4` varchar(30) DEFAULT NULL COMMENT '图片4',
  `Image_5` varchar(30) DEFAULT NULL COMMENT '图片5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house
-- ----------------------------

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
  `portrait` varchar(30) DEFAULT NULL COMMENT '用户头像',
  `status` int(2) DEFAULT NULL COMMENT '状态，0表示正常，-1删除',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2236 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'liu', '123', '131@qq.com', '158', null, '0', '2012-12-01 10:00:00');
INSERT INTO `user` VALUES ('22', 'liu', '123', '131@qq.com', '158', '', '0', null);
INSERT INTO `user` VALUES ('23', '123', '123', '321', '312', '321', '0', null);
INSERT INTO `user` VALUES ('231', '321', '12312', '1310510120@qq.com12', '12', '12', '-1', null);
INSERT INTO `user` VALUES ('321', 'liu', '123', '131@qq.com', '158', null, '0', null);
INSERT INTO `user` VALUES ('322', 'liu', '123', '131@qq.com', '158', null, null, null);
INSERT INTO `user` VALUES ('2233', '231', '312', '3112', '123', '312', '1', null);
INSERT INTO `user` VALUES ('2234', 'liu', '123', '131@qq.com', '158', null, null, null);

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
