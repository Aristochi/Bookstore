/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : bookstore

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 26/12/2019 20:54:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cartitem
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT 0,
  `sum` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `deleteAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_cartitem_product`(`pid`) USING BTREE,
  INDEX `fk_cartitem_user`(`uid`) USING BTREE,
  CONSTRAINT `fk_cartitem_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cartitem_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cartitem
-- ----------------------------
INSERT INTO `cartitem` VALUES (1, 2, 9, 1, 28.00, NULL);
INSERT INTO `cartitem` VALUES (2, 3, 65, 1, 188.00, '2019-12-26 20:15:48');
INSERT INTO `cartitem` VALUES (3, 4, 10, 3, 46.00, NULL);
INSERT INTO `cartitem` VALUES (4, 4, 27, 1, 38.00, NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `recommend` int(11) NOT NULL DEFAULT 0,
  `deleteAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '世界名著', 15, NULL);
INSERT INTO `category` VALUES (2, '中国小说', 14, NULL);
INSERT INTO `category` VALUES (3, '情感小说', 13, NULL);
INSERT INTO `category` VALUES (4, '历史人文', 12, NULL);
INSERT INTO `category` VALUES (5, '哲学宗教', 11, NULL);
INSERT INTO `category` VALUES (6, '经济管理', 9, NULL);
INSERT INTO `category` VALUES (7, '当代文学', 10, NULL);
INSERT INTO `category` VALUES (8, '期刊/音像', 8, NULL);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `deleteAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_comment_product`(`pid`) USING BTREE,
  INDEX `fk_comment_user`(`uid`) USING BTREE,
  CONSTRAINT `fk_comment_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 65, 3, '', '2019-12-26 20:16:14', NULL);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rate` int(11) NOT NULL DEFAULT 0,
  `deleteAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'website_name', '网站名称', 'BookStore', 100, NULL);
INSERT INTO `config` VALUES (2, 'index_description', '首页描述', 'BookStore是一个大型网上图书商城', 50, NULL);
INSERT INTO `config` VALUES (3, 'index_keyword', '首页关键词', 'BookStore', 25, NULL);
INSERT INTO `config` VALUES (4, 'index_title', '首页标题', 'BootStore,图书自营商城', 12, NULL);
INSERT INTO `config` VALUES (5, 'path_product_img', '产品图片存放目录', 'pictures/product/', 6, NULL);
INSERT INTO `config` VALUES (6, 'path_category_img', '分类图片存放目录', 'pictures/category/', 5, NULL);

-- ----------------------------
-- Table structure for order_
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `orderCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sum` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `totalNumber` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `post` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `userMessage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `createDate` datetime(0) NULL DEFAULT NULL,
  `payDate` datetime(0) NULL DEFAULT NULL,
  `deliverDate` datetime(0) NULL DEFAULT NULL,
  `confirmDate` datetime(0) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleteAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_order_user`(`uid`) USING BTREE,
  CONSTRAINT `fk_order_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES (1, 3, '201912262015481761755830220', 188.00, 1, '嘻嘻嘻', '21312', '321312312', '11111111111', '', '2019-12-26 20:15:48', '2019-12-26 20:15:50', '2019-12-26 20:16:00', '2019-12-26 20:16:06', 'finish', NULL);
INSERT INTO `order_` VALUES (2, 4, '20191226204257200838988253', 39.00, 1, '华南师范大学南海校区A601', '528225', 'yman', '13250120047', '', '2019-12-26 20:42:57', '2019-12-26 20:42:59', NULL, NULL, 'waitDeliver', NULL);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `cmid` int(11) NULL DEFAULT NULL,
  `number` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sum` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `deleteAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_orderitem_product`(`pid`) USING BTREE,
  INDEX `fk_orderitem_order`(`oid`) USING BTREE,
  INDEX `fk_orderitem_comment`(`cmid`) USING BTREE,
  CONSTRAINT `fk_orderitem_comment` FOREIGN KEY (`cmid`) REFERENCES `comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderitem_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (1, 1, 65, 1, 1, 188.00, NULL);
INSERT INTO `orderitem` VALUES (2, 2, 27, NULL, 1, 39.00, NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `subTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `originalPrice` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `nowPrice` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `stock` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `imgid` int(11) NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `commentCount` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `saleCount` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `deleteAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_category`(`cid`) USING BTREE,
  INDEX `fk_product_product_image`(`imgid`) USING BTREE,
  CONSTRAINT `fk_product_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 1, '我是猫', '我是猫', 69.00, 39.00, 20, 42, '2019-12-26 16:00:40', 0, 0, NULL);
INSERT INTO `product` VALUES (2, 1, '古都', '古都', 59.00, 39.00, 15, 39, '2019-12-26 16:01:08', 0, 0, NULL);
INSERT INTO `product` VALUES (3, 1, '罗生门', '罗生门', 69.00, 59.00, 20, 36, '2019-12-26 16:01:26', 0, 0, NULL);
INSERT INTO `product` VALUES (4, 1, '源氏物语', '源氏物语', 69.00, 49.00, 25, 33, '2019-12-26 16:01:47', 0, 0, NULL);
INSERT INTO `product` VALUES (5, 1, '局外人', '局外人', 49.00, 29.00, 50, 30, '2019-12-26 16:02:06', 0, 0, NULL);
INSERT INTO `product` VALUES (6, 1, '傲慢与偏见', '傲慢与偏见', 89.00, 69.00, 50, 27, '2019-12-26 16:02:23', 0, 0, NULL);
INSERT INTO `product` VALUES (7, 1, '昆虫记', '昆虫记', 49.00, 39.00, 25, 24, '2019-12-26 16:02:45', 0, 0, NULL);
INSERT INTO `product` VALUES (8, 1, '漫长的告别', '漫长的告别', 49.00, 39.00, 25, 21, '2019-12-26 16:03:01', 0, 0, NULL);
INSERT INTO `product` VALUES (9, 1, '雾都孤儿', '雾都孤儿', 49.00, 29.00, 50, 18, '2019-12-26 16:03:20', 0, 0, NULL);
INSERT INTO `product` VALUES (10, 1, '巴黎圣母院', '巴黎圣母院', 59.00, 49.00, 25, 15, '2019-12-26 16:03:37', 0, 0, NULL);
INSERT INTO `product` VALUES (11, 2, '北上', '北上，一条河流与一个民族的秘史', 69.00, 39.30, 20, 76, '2019-12-26 18:46:46', 0, 0, NULL);
INSERT INTO `product` VALUES (12, 2, '你坏', '大冰新作', 69.00, 39.00, 50, 73, '2019-12-26 18:47:18', 0, 0, NULL);
INSERT INTO `product` VALUES (13, 2, '赴宴者', '赴宴者', 59.00, 49.00, 50, 66, '2019-12-26 18:47:52', 0, 0, NULL);
INSERT INTO `product` VALUES (14, 2, '云中记', '云中记', 59.00, 39.00, 25, 63, '2019-12-26 18:48:15', 0, 0, NULL);
INSERT INTO `product` VALUES (15, 2, '狂人日记', '鲁迅经典小说', 39.00, 29.00, 25, 60, '2019-12-26 18:48:40', 0, 0, NULL);
INSERT INTO `product` VALUES (16, 2, '呼兰河传', '呼兰河传', 29.00, 25.00, 40, 57, '2019-12-26 18:49:10', 0, 0, NULL);
INSERT INTO `product` VALUES (17, 2, '黄雀记', '黄雀记', 59.00, 49.00, 25, 54, '2019-12-26 18:49:30', 0, 0, NULL);
INSERT INTO `product` VALUES (18, 2, '林家铺子', '林家铺子', 59.00, 39.00, 25, 51, '2019-12-26 18:49:54', 0, 0, NULL);
INSERT INTO `product` VALUES (19, 2, '围城', '围城', 59.00, 49.00, 25, NULL, '2019-12-26 18:50:14', 0, 0, '2019-12-26 18:50:30');
INSERT INTO `product` VALUES (20, 2, '在细雨中呼喊', '在细雨中呼喊', 39.00, 29.00, 15, 48, '2019-12-26 18:52:59', 0, 0, NULL);
INSERT INTO `product` VALUES (21, 2, '子夜', '子夜', 59.00, 39.00, 25, 45, '2019-12-26 18:53:13', 0, 0, NULL);
INSERT INTO `product` VALUES (22, 3, '围城', '围城', 59.00, 49.00, 60, 106, '2019-12-26 18:53:30', 0, 0, NULL);
INSERT INTO `product` VALUES (23, 3, '外婆的道歉信', '外婆的道歉信', 39.00, 35.00, 25, 103, '2019-12-26 18:53:56', 0, 0, NULL);
INSERT INTO `product` VALUES (24, 3, '岛上书店', '岛上书店', 59.00, 39.00, 25, 100, '2019-12-26 18:54:17', 0, 0, NULL);
INSERT INTO `product` VALUES (25, 3, '狼图腾', '狼图腾', 59.00, 39.00, 25, 97, '2019-12-26 18:55:19', 0, 0, NULL);
INSERT INTO `product` VALUES (26, 3, '后来，时间都与你有关', '后来，时间都与你有关', 39.00, 29.00, 25, 94, '2019-12-26 18:55:52', 0, 0, NULL);
INSERT INTO `product` VALUES (27, 3, '余生，请多多指教', '余生，请多多指教', 59.00, 39.00, 24, 91, '2019-12-26 18:56:17', 0, 1, NULL);
INSERT INTO `product` VALUES (28, 3, '你要好好的', '你要好好的', 69.00, 39.00, 52, 88, '2019-12-26 18:56:54', 0, 0, NULL);
INSERT INTO `product` VALUES (29, 3, '我们最好的十年', '我们最好的十年', 59.00, 39.00, 26, 85, '2019-12-26 18:57:25', 0, 0, NULL);
INSERT INTO `product` VALUES (30, 3, '总要习惯一个人', '总要习惯一个人', 69.00, 39.00, 25, 82, '2019-12-26 18:57:44', 0, 0, NULL);
INSERT INTO `product` VALUES (31, 3, '我喜欢你，像风走了八千里', '我喜欢你，像风走了八千里', 39.00, 25.00, 25, 79, '2019-12-26 18:58:42', 0, 0, NULL);
INSERT INTO `product` VALUES (32, 4, '游牧民族的世界观', '游牧民族的世界观', 39.00, 35.00, 25, NULL, '2019-12-26 18:59:46', 0, 0, NULL);
INSERT INTO `product` VALUES (33, 4, '史记全集', '史记全集', 255.00, 249.00, 25, NULL, '2019-12-26 19:00:42', 0, 0, NULL);
INSERT INTO `product` VALUES (34, 4, '史记', '史记', 96.00, 89.00, 25, NULL, '2019-12-26 19:01:01', 0, 0, NULL);
INSERT INTO `product` VALUES (35, 4, '年羹饶之死', '年羹饶之死', 69.00, 49.00, 25, NULL, '2019-12-26 19:01:28', 0, 0, NULL);
INSERT INTO `product` VALUES (36, 4, '继承者们', '继承者们', 59.00, 49.00, 25, NULL, '2019-12-26 19:01:57', 0, 0, NULL);
INSERT INTO `product` VALUES (37, 4, '万历十五年', '万历十五年', 49.00, 39.00, 25, 121, '2019-12-26 19:02:19', 0, 0, NULL);
INSERT INTO `product` VALUES (38, 4, '乡土中国', '乡土中国', 45.00, 35.00, 25, 118, '2019-12-26 19:02:40', 0, 0, NULL);
INSERT INTO `product` VALUES (39, 4, '论语译注', '论语译注', 45.00, 40.00, 25, 115, '2019-12-26 19:03:11', 0, 0, NULL);
INSERT INTO `product` VALUES (40, 4, '中国文化课', '中国文化课', 98.00, 89.00, 25, 112, '2019-12-26 19:03:29', 0, 0, NULL);
INSERT INTO `product` VALUES (41, 4, '故宫日历', '故宫日历', 59.00, 49.00, 55, 109, '2019-12-26 19:03:52', 0, 0, NULL);
INSERT INTO `product` VALUES (42, 5, '资本论', '资本论', 59.00, 50.00, 25, NULL, '2019-12-26 19:04:20', 0, 0, NULL);
INSERT INTO `product` VALUES (43, 5, '长短经', '长短经', 99.00, 90.00, 25, NULL, '2019-12-26 19:04:44', 0, 0, NULL);
INSERT INTO `product` VALUES (44, 5, '冥想', '冥想', 45.00, 43.00, 25, NULL, '2019-12-26 19:04:58', 0, 0, NULL);
INSERT INTO `product` VALUES (45, 5, '了凡四训', '了凡四训', 45.00, 39.00, 25, NULL, '2019-12-26 19:05:19', 0, 0, NULL);
INSERT INTO `product` VALUES (46, 5, '美的历史', '美的历史', 88.00, 49.00, 59, NULL, '2019-12-26 19:05:53', 0, 0, NULL);
INSERT INTO `product` VALUES (47, 7, '皮囊', '皮囊', 45.00, 39.00, 25, NULL, '2019-12-26 19:06:19', 0, 0, NULL);
INSERT INTO `product` VALUES (48, 7, '且在，独行', '且在，独行', 59.00, 49.00, 60, NULL, '2019-12-26 19:06:44', 0, 0, NULL);
INSERT INTO `product` VALUES (49, 7, '文化苦旅', '文化苦旅', 45.00, 39.00, 25, NULL, '2019-12-26 19:07:02', 0, 0, NULL);
INSERT INTO `product` VALUES (50, 7, '万事有心，人间有味', '万事有心，人间有味', 59.00, 49.00, 25, NULL, '2019-12-26 19:07:42', 0, 0, NULL);
INSERT INTO `product` VALUES (51, 7, '白说', '白说', 45.00, 39.00, 25, NULL, '2019-12-26 19:07:56', 0, 0, NULL);
INSERT INTO `product` VALUES (52, 7, '愿你，归来仍是少年', '愿你，归来仍是少年', 49.00, 39.00, 25, NULL, '2019-12-26 19:08:35', 0, 0, NULL);
INSERT INTO `product` VALUES (53, 7, '梦里花落知多少', '梦里花落知多少', 49.00, 45.00, 25, NULL, '2019-12-26 19:08:51', 0, 0, NULL);
INSERT INTO `product` VALUES (54, 7, '春风十里不如你', '春风十里不如你', 49.00, 39.00, 25, NULL, '2019-12-26 19:09:18', 0, 0, NULL);
INSERT INTO `product` VALUES (55, 7, '我与地坛', '我与地坛', 59.00, 49.00, 55, NULL, '2019-12-26 19:09:33', 0, 0, NULL);
INSERT INTO `product` VALUES (56, 7, '沉默的大多数', '沉默的大多数', 25.00, 24.00, 55, NULL, '2019-12-26 19:10:03', 0, 0, NULL);
INSERT INTO `product` VALUES (57, 8, '博物', '博物', 192.00, 190.00, 1000, NULL, '2019-12-26 19:10:32', 0, 0, NULL);
INSERT INTO `product` VALUES (58, 8, '读者', '读者', 209.00, 199.00, 555, NULL, '2019-12-26 19:21:48', 0, 0, NULL);
INSERT INTO `product` VALUES (59, 8, '中国国家地理', '中国国家地理', 189.00, 155.00, 1000, NULL, '2019-12-26 19:22:14', 0, 0, NULL);
INSERT INTO `product` VALUES (60, 8, '青年文摘', '青年文摘', 199.00, 189.00, 555, NULL, '2019-12-26 19:22:37', 0, 0, NULL);
INSERT INTO `product` VALUES (61, 8, '生活周刊', '生活周刊', 199.00, 189.00, 555, NULL, '2019-12-26 19:23:06', 0, 0, NULL);
INSERT INTO `product` VALUES (62, 8, '博物', '博物', 192.00, 190.00, 1000, NULL, '2019-12-26 19:10:32', 0, 0, NULL);
INSERT INTO `product` VALUES (63, 8, '读者', '读者', 209.00, 199.00, 555, NULL, '2019-12-26 19:21:48', 0, 0, NULL);
INSERT INTO `product` VALUES (64, 8, '中国国家地理', '中国国家地理', 189.00, 155.00, 1000, NULL, '2019-12-26 19:22:14', 0, 0, NULL);
INSERT INTO `product` VALUES (65, 8, '青年文摘', '青年文摘', 199.00, 189.00, 554, NULL, '2019-12-26 19:22:37', 1, 1, NULL);
INSERT INTO `product` VALUES (66, 8, '生活周刊', '生活周刊', 199.00, 189.00, 555, NULL, '2019-12-26 19:23:06', 0, 0, NULL);
INSERT INTO `product` VALUES (67, 5, '资本论', '资本论', 59.00, 50.00, 25, NULL, '2019-12-26 19:04:20', 0, 0, NULL);
INSERT INTO `product` VALUES (68, 5, '长短经', '长短经', 99.00, 90.00, 25, NULL, '2019-12-26 19:04:44', 0, 0, NULL);
INSERT INTO `product` VALUES (69, 5, '冥想', '冥想', 45.00, 43.00, 25, NULL, '2019-12-26 19:04:58', 0, 0, NULL);
INSERT INTO `product` VALUES (70, 5, '了凡四训', '了凡四训', 45.00, 39.00, 25, NULL, '2019-12-26 19:05:19', 0, 0, NULL);
INSERT INTO `product` VALUES (71, 5, '美的历史', '美的历史', 88.00, 49.00, 59, NULL, '2019-12-26 19:05:53', 0, 0, NULL);
INSERT INTO `product` VALUES (72, 6, '国富论', '国富论', 69.00, 59.00, 55, NULL, '2019-12-26 19:31:48', 0, 0, NULL);
INSERT INTO `product` VALUES (73, 6, '美联储', '美联储', 49.00, 45.00, 55, NULL, '2019-12-26 19:32:03', 0, 0, NULL);
INSERT INTO `product` VALUES (74, 6, '大败局', '大败局', 96.00, 59.00, 55, NULL, '2019-12-26 19:32:27', 0, 0, NULL);
INSERT INTO `product` VALUES (75, 6, '互联网+', '互联网+', 56.00, 49.00, 55, NULL, '2019-12-26 19:32:55', 0, 0, NULL);
INSERT INTO `product` VALUES (76, 6, '大数据时代', '大数据时代', 98.00, 69.00, 55, NULL, '2019-12-26 19:34:09', 0, 0, NULL);

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleteAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_image`(`pid`) USING BTREE,
  CONSTRAINT `fk_product_image` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES (1, 10, 'cover', '2019-12-26 19:34:23');
INSERT INTO `product_image` VALUES (2, 10, 'top', '2019-12-26 19:34:25');
INSERT INTO `product_image` VALUES (3, 10, 'detail', '2019-12-26 19:34:27');
INSERT INTO `product_image` VALUES (4, 9, 'cover', '2019-12-26 19:38:54');
INSERT INTO `product_image` VALUES (5, 8, 'cover', '2019-12-26 16:48:20');
INSERT INTO `product_image` VALUES (6, 8, 'cover', '2019-12-26 19:39:30');
INSERT INTO `product_image` VALUES (7, 7, 'cover', '2019-12-26 19:41:04');
INSERT INTO `product_image` VALUES (8, 6, 'cover', '2019-12-26 19:42:13');
INSERT INTO `product_image` VALUES (9, 5, 'cover', '2019-12-26 19:43:55');
INSERT INTO `product_image` VALUES (10, 4, 'cover', NULL);
INSERT INTO `product_image` VALUES (11, 3, 'cover', NULL);
INSERT INTO `product_image` VALUES (12, 2, 'cover', NULL);
INSERT INTO `product_image` VALUES (13, 1, 'cover', NULL);
INSERT INTO `product_image` VALUES (14, 10, 'cover', '2019-12-26 19:34:35');
INSERT INTO `product_image` VALUES (15, 10, 'cover', '2019-12-26 20:46:23');
INSERT INTO `product_image` VALUES (16, 10, 'top', '2019-12-26 20:46:25');
INSERT INTO `product_image` VALUES (17, 10, 'detail', '2019-12-26 20:46:28');
INSERT INTO `product_image` VALUES (18, 9, 'cover', NULL);
INSERT INTO `product_image` VALUES (19, 9, 'top', NULL);
INSERT INTO `product_image` VALUES (20, 9, 'detail', NULL);
INSERT INTO `product_image` VALUES (21, 8, 'cover', NULL);
INSERT INTO `product_image` VALUES (22, 8, 'top', NULL);
INSERT INTO `product_image` VALUES (23, 8, 'detail', NULL);
INSERT INTO `product_image` VALUES (24, 7, 'cover', NULL);
INSERT INTO `product_image` VALUES (25, 7, 'top', NULL);
INSERT INTO `product_image` VALUES (26, 7, 'detail', NULL);
INSERT INTO `product_image` VALUES (27, 6, 'cover', NULL);
INSERT INTO `product_image` VALUES (28, 6, 'top', NULL);
INSERT INTO `product_image` VALUES (29, 6, 'detail', NULL);
INSERT INTO `product_image` VALUES (30, 5, 'cover', NULL);
INSERT INTO `product_image` VALUES (31, 5, 'top', NULL);
INSERT INTO `product_image` VALUES (32, 5, 'detail', NULL);
INSERT INTO `product_image` VALUES (33, 4, 'cover', NULL);
INSERT INTO `product_image` VALUES (34, 4, 'top', NULL);
INSERT INTO `product_image` VALUES (35, 4, 'detail', NULL);
INSERT INTO `product_image` VALUES (36, 3, 'cover', NULL);
INSERT INTO `product_image` VALUES (37, 3, 'top', NULL);
INSERT INTO `product_image` VALUES (38, 3, 'detail', NULL);
INSERT INTO `product_image` VALUES (39, 2, 'cover', NULL);
INSERT INTO `product_image` VALUES (40, 2, 'top', NULL);
INSERT INTO `product_image` VALUES (41, 2, 'detail', NULL);
INSERT INTO `product_image` VALUES (42, 1, 'cover', NULL);
INSERT INTO `product_image` VALUES (43, 1, 'top', NULL);
INSERT INTO `product_image` VALUES (44, 1, 'detail', NULL);
INSERT INTO `product_image` VALUES (45, 21, 'cover', NULL);
INSERT INTO `product_image` VALUES (46, 21, 'top', NULL);
INSERT INTO `product_image` VALUES (47, 21, 'detail', NULL);
INSERT INTO `product_image` VALUES (48, 20, 'cover', NULL);
INSERT INTO `product_image` VALUES (49, 20, 'top', NULL);
INSERT INTO `product_image` VALUES (50, 20, 'detail', NULL);
INSERT INTO `product_image` VALUES (51, 18, 'cover', NULL);
INSERT INTO `product_image` VALUES (52, 18, 'top', NULL);
INSERT INTO `product_image` VALUES (53, 18, 'detail', NULL);
INSERT INTO `product_image` VALUES (54, 17, 'cover', NULL);
INSERT INTO `product_image` VALUES (55, 17, 'top', NULL);
INSERT INTO `product_image` VALUES (56, 17, 'detail', NULL);
INSERT INTO `product_image` VALUES (57, 16, 'cover', NULL);
INSERT INTO `product_image` VALUES (58, 16, 'top', NULL);
INSERT INTO `product_image` VALUES (59, 16, 'detail', NULL);
INSERT INTO `product_image` VALUES (60, 15, 'cover', NULL);
INSERT INTO `product_image` VALUES (61, 15, 'top', NULL);
INSERT INTO `product_image` VALUES (62, 15, 'detail', NULL);
INSERT INTO `product_image` VALUES (63, 14, 'cover', NULL);
INSERT INTO `product_image` VALUES (64, 14, 'top', NULL);
INSERT INTO `product_image` VALUES (65, 14, 'detail', NULL);
INSERT INTO `product_image` VALUES (66, 13, 'cover', NULL);
INSERT INTO `product_image` VALUES (67, 13, 'top', NULL);
INSERT INTO `product_image` VALUES (68, 13, 'detail', NULL);
INSERT INTO `product_image` VALUES (69, 12, 'cover', '2019-12-26 19:53:04');
INSERT INTO `product_image` VALUES (70, 12, 'cover', '2019-12-26 19:53:34');
INSERT INTO `product_image` VALUES (71, 12, 'top', '2019-12-26 19:53:36');
INSERT INTO `product_image` VALUES (72, 12, 'detail', '2019-12-26 19:53:38');
INSERT INTO `product_image` VALUES (73, 12, 'cover', NULL);
INSERT INTO `product_image` VALUES (74, 12, 'top', NULL);
INSERT INTO `product_image` VALUES (75, 12, 'detail', NULL);
INSERT INTO `product_image` VALUES (76, 11, 'cover', NULL);
INSERT INTO `product_image` VALUES (77, 11, 'top', NULL);
INSERT INTO `product_image` VALUES (78, 11, 'detail', NULL);
INSERT INTO `product_image` VALUES (79, 31, 'cover', NULL);
INSERT INTO `product_image` VALUES (80, 31, 'top', NULL);
INSERT INTO `product_image` VALUES (81, 31, 'detail', NULL);
INSERT INTO `product_image` VALUES (82, 30, 'cover', NULL);
INSERT INTO `product_image` VALUES (83, 30, 'top', NULL);
INSERT INTO `product_image` VALUES (84, 30, 'detail', NULL);
INSERT INTO `product_image` VALUES (85, 29, 'cover', NULL);
INSERT INTO `product_image` VALUES (86, 29, 'top', NULL);
INSERT INTO `product_image` VALUES (87, 29, 'detail', NULL);
INSERT INTO `product_image` VALUES (88, 28, 'cover', NULL);
INSERT INTO `product_image` VALUES (89, 28, 'top', NULL);
INSERT INTO `product_image` VALUES (90, 28, 'detail', NULL);
INSERT INTO `product_image` VALUES (91, 27, 'cover', NULL);
INSERT INTO `product_image` VALUES (92, 27, 'top', NULL);
INSERT INTO `product_image` VALUES (93, 27, 'detail', NULL);
INSERT INTO `product_image` VALUES (94, 26, 'cover', NULL);
INSERT INTO `product_image` VALUES (95, 26, 'top', NULL);
INSERT INTO `product_image` VALUES (96, 26, 'detail', NULL);
INSERT INTO `product_image` VALUES (97, 25, 'cover', NULL);
INSERT INTO `product_image` VALUES (98, 25, 'top', NULL);
INSERT INTO `product_image` VALUES (99, 25, 'detail', NULL);
INSERT INTO `product_image` VALUES (100, 24, 'cover', NULL);
INSERT INTO `product_image` VALUES (101, 24, 'top', NULL);
INSERT INTO `product_image` VALUES (102, 24, 'detail', NULL);
INSERT INTO `product_image` VALUES (103, 23, 'cover', NULL);
INSERT INTO `product_image` VALUES (104, 23, 'top', NULL);
INSERT INTO `product_image` VALUES (105, 23, 'detail', NULL);
INSERT INTO `product_image` VALUES (106, 22, 'cover', NULL);
INSERT INTO `product_image` VALUES (107, 22, 'top', NULL);
INSERT INTO `product_image` VALUES (108, 22, 'detail', NULL);
INSERT INTO `product_image` VALUES (109, 41, 'cover', NULL);
INSERT INTO `product_image` VALUES (110, 41, 'top', NULL);
INSERT INTO `product_image` VALUES (111, 41, 'detail', NULL);
INSERT INTO `product_image` VALUES (112, 40, 'cover', NULL);
INSERT INTO `product_image` VALUES (113, 40, 'top', NULL);
INSERT INTO `product_image` VALUES (114, 40, 'detail', NULL);
INSERT INTO `product_image` VALUES (115, 39, 'cover', NULL);
INSERT INTO `product_image` VALUES (116, 39, 'top', NULL);
INSERT INTO `product_image` VALUES (117, 39, 'detail', NULL);
INSERT INTO `product_image` VALUES (118, 38, 'cover', NULL);
INSERT INTO `product_image` VALUES (119, 38, 'top', NULL);
INSERT INTO `product_image` VALUES (120, 38, 'detail', NULL);
INSERT INTO `product_image` VALUES (121, 37, 'cover', NULL);
INSERT INTO `product_image` VALUES (122, 37, 'top', NULL);
INSERT INTO `product_image` VALUES (123, 37, 'detail', NULL);

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `deleteAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_property_category`(`cid`) USING BTREE,
  CONSTRAINT `fk_property_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for property_value
-- ----------------------------
DROP TABLE IF EXISTS `property_value`;
CREATE TABLE `property_value`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `ptid` int(11) NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `deleteAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_property_value_property`(`ptid`) USING BTREE,
  INDEX `fk_property_value_product`(`pid`) USING BTREE,
  CONSTRAINT `fk_property_value_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_property_value_property` FOREIGN KEY (`ptid`) REFERENCES `property` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `group_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'user',
  `deleteAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '3acf16259def65456fc2a68ab5e10d96', 'superAdmin', NULL);
INSERT INTO `user` VALUES (2, '小猪佩奇我配你', '3acf16259def65456fc2a68ab5e10d96', 'user', NULL);
INSERT INTO `user` VALUES (3, '小鸡傻逼', 'd23692cad75564da5d89e83e94bc98e', 'user', NULL);
INSERT INTO `user` VALUES (4, 'yman', '3acf16259def65456fc2a68ab5e10d96', 'user', NULL);

SET FOREIGN_KEY_CHECKS = 1;
