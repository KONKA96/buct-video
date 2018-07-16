/*
MySQL Data Transfer
Source Host: localhost
Source Database: buct_video
Target Host: localhost
Target Database: buct_video
Date: 2018/7/16 17:19:23
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
INSERT INTO `auditor_example` VALUES ('au1', 'au1', 'konka2', '6a356b7a2991d7a0f7661b95234b9022', 'kj', '0', '157', null, '0', '00:00:00', null, null);
INSERT INTO `auditor_example` VALUES ('au2', 'au2', 'wangwu', 'ba384ee7c3fd57501b01c64c81bb5536', '王五', '0', '158', null, '0', '00:00:00', null, null);
INSERT INTO `group_pojo` VALUES ('1', '软件组', null);
INSERT INTO `group_pojo` VALUES ('2', '编程组', null);
INSERT INTO `group_pojo` VALUES ('3', 'false', null);
INSERT INTO `record_pojo` VALUES ('1', 'au1', '2018-07-13 08:12:08', '2018-07-13 10:12:14', '2');
INSERT INTO `record_pojo` VALUES ('2', 'au2', '2018-07-13 05:12:28', '2018-07-13 10:12:33', '2');
INSERT INTO `record_pojo` VALUES ('3', 'au2', '2018-07-11 10:12:44', '2018-07-12 10:12:52', '2');
INSERT INTO `record_pojo` VALUES ('4', 'sp3', '2018-07-12 10:13:15', '2018-07-13 10:13:18', '1');
INSERT INTO `record_pojo` VALUES ('5', 'sp3', '2018-07-04 10:13:27', '2018-07-06 10:13:31', '1');
INSERT INTO `speaker_example` VALUES ('ad001', 'ad001', 'konka2', '6a356b7a2991d7a0f7661b95234b9022', '康佳', '0', '157', '1', '0', '00:00:00', '0', '2.png', null);
INSERT INTO `speaker_example` VALUES ('sp001', 'sp001', 'zhangsan', null, '张三', '1', '158', '1', '0', '00:00:00', '1', '1.png', null);
INSERT INTO `speaker_example` VALUES ('sp002', 'sp002', 'lisi', null, '李四', '0', '159', '1', '0', '00:00:00', '1', '3.png', null);
INSERT INTO `speaker_example` VALUES ('sp10', 'sp5', 'souhu', '5348753aba9af6fd72883c17fc0fc700', 'souhu', '0', '135', '2', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp11', 'sp6', 'sp6', '1d7150a0f27353ed98c49d516d570fac', '234', '1', '135', '1', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp12', 'sp7', 'sp7', '6d218f6344cbdc57bfc84bd229d324cf', '234', '1', '135', '1', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp13', 'sp5', 'sp5', '5348753aba9af6fd72883c17fc0fc700', '234', '1', '135', '1', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp14', 'sp6', 'sp6', '1d7150a0f27353ed98c49d516d570fac', '234', '1', '135', '1', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp15', 'sp7', 'sp7', '6d218f6344cbdc57bfc84bd229d324cf', '234', '1', '135', '1', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp16', 'sp5', 'sp5', '5348753aba9af6fd72883c17fc0fc700', '234', '1', '135', '1', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp17', 'sp6', 'sp6', '1d7150a0f27353ed98c49d516d570fac', '234', '1', '135', '1', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp18', 'sp7', 'sp7', '6d218f6344cbdc57bfc84bd229d324cf', '234', '1', '135', '1', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp3', 'sp3', 'wangwu', 'ba384ee7c3fd57501b01c64c81bb5536', '王五', '0', null, '1', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp4', 'sp5', 'sp5', '5348753aba9af6fd72883c17fc0fc700', '234', '1', '135', '1', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp5', 'sp6', 'sp6', '1d7150a0f27353ed98c49d516d570fac', '234', '1', '135', '1', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp6', 'sp7', 'sp7', '6d218f6344cbdc57bfc84bd229d324cf', '234', '1', '135', '1', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp7', 'sp5', 'sp5', '5348753aba9af6fd72883c17fc0fc700', '234', '1', '135', '1', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp8', 'sp6', 'sp6', '1d7150a0f27353ed98c49d516d570fac', '234', '1', '135', '1', '0', '00:00:00', '1', null, null);
INSERT INTO `speaker_example` VALUES ('sp9', 'sp7', 'sp7', '6d218f6344cbdc57bfc84bd229d324cf', '234', '1', '135', '1', '0', '00:00:00', '1', null, null);
