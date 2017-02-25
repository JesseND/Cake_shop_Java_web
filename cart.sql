/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : mydb

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-12-20 18:27:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `cakename` varchar(100) NOT NULL,
  `price` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('13', 'hjz', '02.jpg', '爱丽丝鲜果', '148');
INSERT INTO `cart` VALUES ('17', '123', '01.jpg', '柠香葡挞', '158');
INSERT INTO `cart` VALUES ('18', '123', '02.jpg', '爱丽丝鲜果', '148');
INSERT INTO `cart` VALUES ('19', '123', '03.jpg', '蓝莓芝士', '158');
INSERT INTO `cart` VALUES ('20', '123', '06.jpg', '提拉米苏', '158');
INSERT INTO `cart` VALUES ('21', '123', '05.jpg', '百香果香草慕斯', '118');
