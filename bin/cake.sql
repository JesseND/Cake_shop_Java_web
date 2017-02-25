/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : mydb

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-12-20 18:27:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cake`
-- ----------------------------
DROP TABLE IF EXISTS `cake`;
CREATE TABLE `cake` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `cakename` char(100) DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cake
-- ----------------------------
INSERT INTO `cake` VALUES ('1', '01.jpg', '柠香葡挞', '158');
INSERT INTO `cake` VALUES ('2', '02.jpg', '爱丽丝鲜果', '148');
INSERT INTO `cake` VALUES ('3', '03.jpg', '蓝莓芝士', '158');
INSERT INTO `cake` VALUES ('4', '04.jpg', '夏洛特鲜果', '148');
INSERT INTO `cake` VALUES ('5', '05.jpg', '百香果香草慕斯', '118');
INSERT INTO `cake` VALUES ('6', '06.jpg', '提拉米苏', '158');
INSERT INTO `cake` VALUES ('7', '07.jpg', '雪域牛乳蛋糕', '128');
INSERT INTO `cake` VALUES ('8', '08.jpg', '草莓拿破仑蛋糕', '148');
INSERT INTO `cake` VALUES ('9', '09.jpg', '巧克力松露蛋糕', '128');
