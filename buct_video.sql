/*
MySQL Data Transfer
Source Host: localhost
Source Database: buct_video
Target Host: localhost
Target Database: buct_video
Date: 2018/7/11 17:36:57
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for auditor_example
-- ----------------------------
CREATE TABLE `auditor_example` (
  `id` varchar(255) NOT NULL,
  `snum` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `truename` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `use_num` int(11) DEFAULT NULL,
  `use_duration` varchar(255) DEFAULT NULL,
  `icon_img` varchar(255) DEFAULT NULL,
  `remake` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for group_pojo
-- ----------------------------
CREATE TABLE `group_pojo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `group_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_pojo
-- ----------------------------
CREATE TABLE `record_pojo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `role_power` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for speaker_example
-- ----------------------------
CREATE TABLE `speaker_example` (
  `id` varchar(255) NOT NULL,
  `snum` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `truename` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_num` int(11) DEFAULT NULL,
  `use_duration` varchar(255) DEFAULT NULL,
  `role_power` int(11) DEFAULT NULL,
  `icon_img` varchar(255) DEFAULT NULL,
  `remake` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `group_pojo` VALUES ('1', '软件组', null);
INSERT INTO `group_pojo` VALUES ('2', '编程组', null);
INSERT INTO `speaker_example` VALUES ('ad001', 'ad001', 'konka2', '6a356b7a2991d7a0f7661b95234b9022', '康佳', '0', '157', '1', '0', '00:00:00', '0', '2.png', null);
INSERT INTO `speaker_example` VALUES ('sp001', 'sp001', 'zhangsan', null, '张三', '1', '158', '1', '0', '00:00:00', '1', '1.png', null);
INSERT INTO `speaker_example` VALUES ('sp002', 'sp002', 'lisi', null, '李四', '0', '159', '2', '0', '00:00:00', '1', '3.png', null);
