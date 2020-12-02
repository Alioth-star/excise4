/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : excise

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2020-12-02 14:35:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_city
-- ----------------------------
DROP TABLE IF EXISTS `t_city`;
CREATE TABLE `t_city` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) NOT NULL,
  `p_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `t_city_t_province_p_id_fk` (`p_id`),
  CONSTRAINT `t_city_t_province_p_id_fk` FOREIGN KEY (`p_id`) REFERENCES `t_province` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_city
-- ----------------------------
INSERT INTO `t_city` VALUES ('1', '武汉市', '1');
INSERT INTO `t_city` VALUES ('2', '仙桃市', '1');
INSERT INTO `t_city` VALUES ('3', '荆州市', '1');
INSERT INTO `t_city` VALUES ('4', '天门市', '1');
INSERT INTO `t_city` VALUES ('5', '宜昌市', '1');
INSERT INTO `t_city` VALUES ('6', '襄阳市', '1');
INSERT INTO `t_city` VALUES ('7', '杭州市', '2');
INSERT INTO `t_city` VALUES ('8', '温州市', '2');
INSERT INTO `t_city` VALUES ('9', '宁波市', '2');
INSERT INTO `t_city` VALUES ('10', '绍兴市', '2');
INSERT INTO `t_city` VALUES ('11', '湖州市', '2');
INSERT INTO `t_city` VALUES ('12', '嘉兴市', '2');
INSERT INTO `t_city` VALUES ('13', '广州市', '3');
INSERT INTO `t_city` VALUES ('14', '深圳市', '3');
INSERT INTO `t_city` VALUES ('15', '珠海市', '3');
INSERT INTO `t_city` VALUES ('16', '佛山市', '3');
INSERT INTO `t_city` VALUES ('17', '惠州市', '3');
INSERT INTO `t_city` VALUES ('18', '汕头市', '3');
INSERT INTO `t_city` VALUES ('19', '韶关市', '3');
INSERT INTO `t_city` VALUES ('20', '长沙市', '4');
INSERT INTO `t_city` VALUES ('21', '株洲市', '4');
INSERT INTO `t_city` VALUES ('22', '岳阳市', '4');
INSERT INTO `t_city` VALUES ('23', '张家界市', '4');
INSERT INTO `t_city` VALUES ('24', '邵阳市', '4');
INSERT INTO `t_city` VALUES ('25', '湘潭市', '4');
INSERT INTO `t_city` VALUES ('26', '南京市', '5');
INSERT INTO `t_city` VALUES ('27', '无锡市', '5');
INSERT INTO `t_city` VALUES ('28', '苏州市', '5');
INSERT INTO `t_city` VALUES ('29', '南通市', '5');
INSERT INTO `t_city` VALUES ('30', '常州市', '5');
INSERT INTO `t_city` VALUES ('31', '徐州市', '5');

-- ----------------------------
-- Table structure for t_downloadlist
-- ----------------------------
DROP TABLE IF EXISTS `t_downloadlist`;
CREATE TABLE `t_downloadlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `size` longblob NOT NULL,
  `star` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_downloadlist
-- ----------------------------
INSERT INTO `t_downloadlist` VALUES ('1', 'Android.pdf电子书', 'Android.pdf', '安卓是一种基于Linux内核（不包含GNU组件）的自由及开放源代码的操作系统。主要使用于移动设备，如智能手机和平板电脑，由美国Google公司和开放手机联盟领导及开发。Android操作系统最初由Andy Rubin开发，主要支持手机。2005年8月由Google收购注资。2007年11月，Google与84家硬件制造商、软件开发商及电信营运商组建开放手机联盟共同研发改良Android系统。', 0x313631363630, '3', 'e_books.png');
INSERT INTO `t_downloadlist` VALUES ('2', 'Web.pdf电子书', 'Web.pdf', 'JSP（全称JavaServer Pages）是由Sun Microsystems公司主导创建的一种动态网页技术标准。JSP部署于网络服务器上，可以响应客户端发送的请求，并根据请求内容动态地生成HTML、XML或其他格式文档的Web网页，然后返回给请求者。JSP技术以Java语言作为脚本语言，为用户的HTTP请求提供服务，并能与服务器上的其它Java程序共同处理复杂的业务需求。', 0x39353334313835, '4', 'books.png');
INSERT INTO `t_downloadlist` VALUES ('3', '无线传感器网络.pdf电子书', '无线传感器网络.pdf', '无线传感器网络(Wireless Sensor Networks, WSN)是一种分布式传感网络，它的末梢是可以感知和检查外部世界的传感器。WSN中的传感器通过无线方式通信，因此网络设置灵活，设备位置可以随时更改，还可以跟互联网进行有线或无线方式的连接。通过无线通信方式形成的一个多跳自组织网络。', 0x3138313332313432, '2', 'e_books.png');

-- ----------------------------
-- Table structure for t_province
-- ----------------------------
DROP TABLE IF EXISTS `t_province`;
CREATE TABLE `t_province` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(255) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_province
-- ----------------------------
INSERT INTO `t_province` VALUES ('1', '湖北省');
INSERT INTO `t_province` VALUES ('2', '浙江省');
INSERT INTO `t_province` VALUES ('3', '广东省');
INSERT INTO `t_province` VALUES ('4', '湖南省');
INSERT INTO `t_province` VALUES ('5', '江苏省');

-- ----------------------------
-- Table structure for t_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `resourceId` int(11) NOT NULL AUTO_INCREMENT,
  `resourceName` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`resourceId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resource
-- ----------------------------
INSERT INTO `t_resource` VALUES ('1', '资源下载', '/GetDownloadList.do');
INSERT INTO `t_resource` VALUES ('2', '资源下载页面', '/main/download.jsp');
INSERT INTO `t_resource` VALUES ('3', '用户管理', '/userManager.do');
INSERT INTO `t_resource` VALUES ('4', '用户管理界面', '/main/userManager.jsp');
INSERT INTO `t_resource` VALUES ('5', '资源管理', '/resourceManager.do');
INSERT INTO `t_resource` VALUES ('6', '资源管理界面', '/main/resourceManager.jsp');
INSERT INTO `t_resource` VALUES ('7', '个人中心', '/personalCenter.do');
INSERT INTO `t_resource` VALUES ('8', '个人中心界面', '/main/personalCenter');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '管理员');
INSERT INTO `t_role` VALUES ('2', '普通用户');

-- ----------------------------
-- Table structure for t_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_role_resource`;
CREATE TABLE `t_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleid_fk_rr` (`roleId`),
  KEY `resourceid_fk` (`resourceId`),
  CONSTRAINT `resourceid_fk` FOREIGN KEY (`resourceId`) REFERENCES `t_resource` (`resourceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleid_fk_rr` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_resource
-- ----------------------------
INSERT INTO `t_role_resource` VALUES ('1', '1', '1');
INSERT INTO `t_role_resource` VALUES ('2', '2', '1');
INSERT INTO `t_role_resource` VALUES ('3', '3', '1');
INSERT INTO `t_role_resource` VALUES ('4', '4', '1');
INSERT INTO `t_role_resource` VALUES ('5', '5', '1');
INSERT INTO `t_role_resource` VALUES ('6', '6', '1');
INSERT INTO `t_role_resource` VALUES ('7', '7', '1');
INSERT INTO `t_role_resource` VALUES ('8', '8', '1');
INSERT INTO `t_role_resource` VALUES ('9', '1', '2');
INSERT INTO `t_role_resource` VALUES ('10', '2', '2');
INSERT INTO `t_role_resource` VALUES ('11', '7', '2');
INSERT INTO `t_role_resource` VALUES ('12', '8', '2');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `chrName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `province` int(10) NOT NULL,
  `city` int(10) NOT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('admin', 'admin', '管理员', 'admin@qq.com', '1', '1');
INSERT INTO `t_user` VALUES ('dsadsa', '123456', '阿道夫', 'l12gsi@qq.com', '2', '8');
INSERT INTO `t_user` VALUES ('dsadsa12', '123456', '安定白', 'libadi23@qq.com', '3', '15');
INSERT INTO `t_user` VALUES ('dsadsads', '123456', '李发大水', 'libadi@qq.com', '2', '8');
INSERT INTO `t_user` VALUES ('dsadsadsa', '123456', '发大水', 'libadsadi@qq.com', '2', '8');
INSERT INTO `t_user` VALUES ('ghr', '123456', '荣耀', '55a546i@qq.com', '1', '2');
INSERT INTO `t_user` VALUES ('ls2020', '1341324', '啊但是', '1233@qq.com', '1', '2');
INSERT INTO `t_user` VALUES ('panqinghui', '123456', '学习部', 'panqignhui@qq.com', '1', '3');
INSERT INTO `t_user` VALUES ('qwe12', '134', 'husm', 'zzc01011@qq.com', '1', '1');
INSERT INTO `t_user` VALUES ('qwe3', '1341', '王五', '111231@qq.com', '1', '1');
INSERT INTO `t_user` VALUES ('qwe4', '31432', '甄姬', '123331@qq.com', '1', '1');
INSERT INTO `t_user` VALUES ('qwe5', '314', '电风扇', '1231@qq.com', '1', '1');
INSERT INTO `t_user` VALUES ('qwe6', '14341', '超发', 'zzc01011@qq.com', '1', '1');
INSERT INTO `t_user` VALUES ('s12', '123456', '山东分公司', 'libai@qq.com', '3', '14');
INSERT INTO `t_user` VALUES ('shm123456', '3134', '法国电视', '862924968@qq.com', '1', '1');
INSERT INTO `t_user` VALUES ('shm123456789', '123456', ' 士大夫', 'libai@qq.com', '3', '14');
INSERT INTO `t_user` VALUES ('sunhanming', '1234132', '公司法', '123456789@qq.com', '4', '24');
INSERT INTO `t_user` VALUES ('tgdsg', '123456', '红', 'libadgi23@qq.com', '3', '14');
INSERT INTO `t_user` VALUES ('tgdsgdsa', '123456', '黄', '12sdi@qq.com', '2', '8');
INSERT INTO `t_user` VALUES ('ww2020', '55555', '蓝', '11123@qq.com', '2', '10');
INSERT INTO `t_user` VALUES ('zj2020', '55555', '绿', '12333@qq.com', '2', '12');
INSERT INTO `t_user` VALUES ('zzc01', '55555', '青', '123131@qq.com', '1', '1');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username_fk` (`userName`),
  KEY `roleid_fk` (`roleId`),
  CONSTRAINT `roleid_fk` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `username_fk` FOREIGN KEY (`userName`) REFERENCES `t_user` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1', 'admin');
INSERT INTO `t_user_role` VALUES ('2', '2', 'zzc01');
INSERT INTO `t_user_role` VALUES ('19', '2', 'ls2020');
INSERT INTO `t_user_role` VALUES ('20', '2', 'ww2020');
INSERT INTO `t_user_role` VALUES ('21', '2', 'zj2020');
INSERT INTO `t_user_role` VALUES ('23', '2', 'shm123456');
INSERT INTO `t_user_role` VALUES ('25', '2', 'sunhanming');
INSERT INTO `t_user_role` VALUES ('29', '2', 'dsadsa');
INSERT INTO `t_user_role` VALUES ('30', '2', 'ghr');
INSERT INTO `t_user_role` VALUES ('31', '2', 'dsadsa12');
INSERT INTO `t_user_role` VALUES ('32', '2', 's12');
INSERT INTO `t_user_role` VALUES ('33', '2', 'tgdsg');
INSERT INTO `t_user_role` VALUES ('34', '2', 'dsadsads');
INSERT INTO `t_user_role` VALUES ('35', '2', 'dsadsadsa');
INSERT INTO `t_user_role` VALUES ('36', '2', 'tgdsgdsa');
