/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50024
Source Host           : localhost:3306
Source Database       : eshop

Target Server Type    : MYSQL
Target Server Version : 50024
File Encoding         : 65001

Date: 2020-05-13 00:50:53
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
INSERT INTO `goods_category` VALUES ('5', '裤子');
INSERT INTO `goods_category` VALUES ('6', '毛衣');

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
INSERT INTO `goods_info` VALUES ('11', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');
INSERT INTO `goods_info` VALUES ('12', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');
INSERT INTO `goods_info` VALUES ('13', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');
INSERT INTO `goods_info` VALUES ('14', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');
INSERT INTO `goods_info` VALUES ('15', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');
INSERT INTO `goods_info` VALUES ('16', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');
INSERT INTO `goods_info` VALUES ('17', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');
INSERT INTO `goods_info` VALUES ('18', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');
INSERT INTO `goods_info` VALUES ('19', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');
INSERT INTO `goods_info` VALUES ('20', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');
INSERT INTO `goods_info` VALUES ('21', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');
INSERT INTO `goods_info` VALUES ('22', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');
INSERT INTO `goods_info` VALUES ('23', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');
INSERT INTO `goods_info` VALUES ('24', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');
INSERT INTO `goods_info` VALUES ('25', '优衣库长裤', '火热促销中', '99.90', '优衣库长裤火热促销中', '10');

-- ----------------------------
-- Table structure for goods_info_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_info_goods_category`;
CREATE TABLE `goods_info_goods_category` (
  `id` int(11) NOT NULL auto_increment,
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
INSERT INTO `goods_info_goods_category` VALUES ('14', '11', '6');
INSERT INTO `goods_info_goods_category` VALUES ('15', '12', '6');
INSERT INTO `goods_info_goods_category` VALUES ('16', '13', '6');
INSERT INTO `goods_info_goods_category` VALUES ('17', '14', '6');
INSERT INTO `goods_info_goods_category` VALUES ('18', '15', '6');
INSERT INTO `goods_info_goods_category` VALUES ('19', '16', '6');
INSERT INTO `goods_info_goods_category` VALUES ('20', '17', '6');
INSERT INTO `goods_info_goods_category` VALUES ('21', '18', '6');
INSERT INTO `goods_info_goods_category` VALUES ('22', '19', '6');
INSERT INTO `goods_info_goods_category` VALUES ('23', '20', '6');
INSERT INTO `goods_info_goods_category` VALUES ('24', '21', '6');
INSERT INTO `goods_info_goods_category` VALUES ('25', '22', '6');
INSERT INTO `goods_info_goods_category` VALUES ('26', '23', '6');
INSERT INTO `goods_info_goods_category` VALUES ('27', '24', '6');
INSERT INTO `goods_info_goods_category` VALUES ('28', '25', '6');

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
INSERT INTO `goods_info_goods_tags` VALUES ('13', '11', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('14', '11', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('15', '12', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('16', '12', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('17', '13', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('18', '13', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('19', '14', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('20', '14', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('21', '15', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('22', '15', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('23', '16', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('24', '16', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('25', '17', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('26', '17', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('27', '18', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('28', '18', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('29', '19', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('30', '19', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('31', '20', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('32', '20', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('33', '21', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('34', '21', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('35', '22', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('36', '22', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('37', '23', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('38', '23', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('39', '24', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('40', '24', '2');
INSERT INTO `goods_info_goods_tags` VALUES ('41', '25', '1');
INSERT INTO `goods_info_goods_tags` VALUES ('42', '25', '2');

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
INSERT INTO `goods_photo` VALUES ('8', '11', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291645013O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');
INSERT INTO `goods_photo` VALUES ('9', '12', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291668524O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');
INSERT INTO `goods_photo` VALUES ('10', '13', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291670289O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');
INSERT INTO `goods_photo` VALUES ('11', '14', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291671593O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');
INSERT INTO `goods_photo` VALUES ('12', '15', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291672925O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');
INSERT INTO `goods_photo` VALUES ('13', '16', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291674027O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');
INSERT INTO `goods_photo` VALUES ('14', '17', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291675187O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');
INSERT INTO `goods_photo` VALUES ('15', '18', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291676554O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');
INSERT INTO `goods_photo` VALUES ('16', '19', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291677625O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');
INSERT INTO `goods_photo` VALUES ('17', '20', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291678659O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');
INSERT INTO `goods_photo` VALUES ('18', '21', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291679662O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');
INSERT INTO `goods_photo` VALUES ('19', '22', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291681207O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');
INSERT INTO `goods_photo` VALUES ('20', '23', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291682285O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');
INSERT INTO `goods_photo` VALUES ('21', '24', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291683398O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');
INSERT INTO `goods_photo` VALUES ('22', '25', 'E:\\apache-tomcat-9.0.34\\webapps\\eshop_war\\upload\\1589291684596O1CN011CqUjXBxyNTXTMy_!!654230132.jpg');

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
