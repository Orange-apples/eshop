/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50024
Source Host           : localhost:3306
Source Database       : eshop

Target Server Type    : MYSQL
Target Server Version : 50024
File Encoding         : 65001

Date: 2020-05-12 13:19:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_category
-- ----------------------------
INSERT INTO `goods_category` VALUES ('1', '短袖');
INSERT INTO `goods_category` VALUES ('2', '长袖');
INSERT INTO `goods_category` VALUES ('3', '衬衫');
INSERT INTO `goods_category` VALUES ('4', '裙子');

-- ----------------------------
-- Table structure for goods_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `title` varchar(100) default NULL,
  `price` double(10,2) default NULL,
  `description` varchar(3000) default NULL,
  `total` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_info
-- ----------------------------
INSERT INTO `goods_info` VALUES ('1', '优衣库-夏季T-shirt', '优衣库夏季促销，火爆进行中', '99.90', '。。。。。', '50');

-- ----------------------------
-- Table structure for goods_info_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_info_goods_category`;
CREATE TABLE `goods_info_goods_category` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) default NULL,
  `category_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_goods_id` (`goods_id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `goods_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_info_goods_category
-- ----------------------------
INSERT INTO `goods_info_goods_category` VALUES ('1', '1', '4');
INSERT INTO `goods_info_goods_category` VALUES ('2', '1', '1');

-- ----------------------------
-- Table structure for goods_info_goods_tags
-- ----------------------------
DROP TABLE IF EXISTS `goods_info_goods_tags`;
CREATE TABLE `goods_info_goods_tags` (
  `id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) default NULL,
  `tags_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_goods_tags` (`goods_id`),
  KEY `fk_tags_goods` (`tags_id`),
  CONSTRAINT `fk_goods_tags` FOREIGN KEY (`goods_id`) REFERENCES `goods_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tags_goods` FOREIGN KEY (`tags_id`) REFERENCES `goods_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_info_goods_tags
-- ----------------------------
INSERT INTO `goods_info_goods_tags` VALUES ('1', '1', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('2', '1', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('3', '1', '3');

-- ----------------------------
-- Table structure for goods_photo
-- ----------------------------
DROP TABLE IF EXISTS `goods_photo`;
CREATE TABLE `goods_photo` (
  `id` int(11) NOT NULL auto_increment,
  `goods_id` int(11) default NULL,
  `photo_addr` varchar(2000) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_photo_goods` (`goods_id`),
  CONSTRAINT `fk_photo_goods` FOREIGN KEY (`goods_id`) REFERENCES `goods_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_photo
-- ----------------------------

-- ----------------------------
-- Table structure for goods_tags
-- ----------------------------
DROP TABLE IF EXISTS `goods_tags`;
CREATE TABLE `goods_tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_tags
-- ----------------------------
INSERT INTO `goods_tags` VALUES ('1', '男士');
INSERT INTO `goods_tags` VALUES ('2', '女士');
INSERT INTO `goods_tags` VALUES ('3', '儿童');
INSERT INTO `goods_tags` VALUES ('4', '3');
