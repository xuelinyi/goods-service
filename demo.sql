/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : goods

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 20/06/2020 13:51:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `id_card` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '手机号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '姓名',
  `age` tinyint(0) NULL DEFAULT NULL COMMENT '年龄',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pk_id`(`id`) USING BTREE,
  UNIQUE INDEX `pk_id_card`(`id_card`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '例子' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo
-- ----------------------------
INSERT INTO `demo` VALUES (1, '37068619920613', '13521190257', 'yixuelin', 11, '2020-06-20 11:59:05', '2020-06-20 11:59:05');
INSERT INTO `demo` VALUES (3, '37068619920614', '13521190254', 'yixuelin', 11, '2020-06-20 12:00:06', '2020-06-20 12:00:06');
INSERT INTO `demo` VALUES (4, '37068619920654', '13521190255', 'yixuelin', 11, '2020-06-20 12:11:53', '2020-06-20 12:11:53');
INSERT INTO `demo` VALUES (5, '37068619920656', '13521190256', 'yixuelin', 11, '2020-06-20 12:11:59', '2020-06-20 12:11:59');
INSERT INTO `demo` VALUES (6, '37068619920658', '13521190258', 'yixuelin', 11, '2020-06-20 12:12:08', '2020-06-20 12:12:08');
INSERT INTO `demo` VALUES (7, '37068619920659', '13521190259', 'yixuelin', 11, '2020-06-20 12:12:16', '2020-06-20 12:12:16');
INSERT INTO `demo` VALUES (8, '37068619920619', '13521190219', 'yixuelin', 11, '2020-06-20 12:12:22', '2020-06-20 12:12:22');
INSERT INTO `demo` VALUES (9, '37068619920611', '13521190211', 'yixuelin', 11, '2020-06-20 12:12:35', '2020-06-20 12:12:35');
INSERT INTO `demo` VALUES (10, '37068619920612', '13521190212', 'yixuelin', 11, '2020-06-20 12:12:42', '2020-06-20 12:12:42');
INSERT INTO `demo` VALUES (13, '37068619920624', '13521190224', 'yixuelin', 11, '2020-06-20 12:16:09', '2020-06-20 12:16:09');
INSERT INTO `demo` VALUES (14, '3706861992062199', '123456', 'yixuelin123', 12, '2020-06-20 12:16:21', '2020-06-20 12:19:48');

SET FOREIGN_KEY_CHECKS = 1;
