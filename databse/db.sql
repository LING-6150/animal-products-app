/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.7
 Source Server Type    : MySQL
 Source Server Version : 50743 (5.7.43)
 Source Host           : 192.168.3.28:3307
 Source Schema         : cwyp_mall

 Target Server Type    : MySQL
 Target Server Version : 50743 (5.7.43)
 File Encoding         : 65001

 Date: 09/11/2024 11:28:21
*/
CREATE DATABASE `cwyp_mall` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cwyp_mall`;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品广告牌id',
  `product_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `product_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品链接',
  `banner_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告宣传栏链接',
  PRIMARY KEY (`banner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品广告轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (5, '麦富迪猫粮营养森林成猫幼猫主粮', 'http://localhost:8080/#/MallPurchase?id=150', 'http://localhost:9999/upload/1731122660659.jpg');
INSERT INTO `banner` VALUES (6, '麦富迪鸭肉干鸡胸肉干360g', 'http://localhost:8080/#/MallPurchase?id=146', 'http://localhost:9999/upload/1731122722348.jpg');
INSERT INTO `banner` VALUES (7, '麦富迪barf霸弗猫粮生骨肉主食', 'http://localhost:8080/#/MallPurchase?id=143', 'http://localhost:9999/upload/1731122762697.jpg');

-- ----------------------------
-- Table structure for inf_file
-- ----------------------------
DROP TABLE IF EXISTS `inf_file`;
CREATE TABLE `inf_file`  (
  `id` varchar(188) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `type` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `content` longblob NULL COMMENT '文件内容',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inf_file
-- ----------------------------

-- ----------------------------
-- Table structure for logistics
-- ----------------------------
DROP TABLE IF EXISTS `logistics`;
CREATE TABLE `logistics`  (
  `logistic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流id',
  `order_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `sender` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发货人',
  `sender_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发货人联系方式',
  `sender_add` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发货人联系地址',
  `receiver` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人',
  `receiver_tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人联系方式',
  `receiver_add` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人联系地址',
  `parcel_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物流公司',
  PRIMARY KEY (`logistic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '物流表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logistics
-- ----------------------------
INSERT INTO `logistics` VALUES (42, '24102915065625', '韩叁川', '400-626-1123', 'xxx大学', '111@qq.com', '15666666666', '天津市 市辖区 和平区幸福小区24号楼3单元1005', '邮政快递');
INSERT INTO `logistics` VALUES (43, '24103013093592', '李宇宁', '400-626-1123', 'xxx大学', '111@qq.com', '15666666666', '天津市 市辖区 和平区 天伦湾小区19号楼2单元1001', '物流');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `product_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编号',
  `product_specs` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `user_account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `contact_way` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系方式',
  `pay_price` double NOT NULL COMMENT '商品金额',
  `pay_amount` int(11) NOT NULL COMMENT '购买数量',
  `pay_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式',
  `order_from` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单来源',
  `order_state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单状态',
  `accept_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货地址',
  `return_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退货状态',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `UNIQUE`(`order_no`) USING BTREE,
  INDEX `product_no`(`product_no`) USING BTREE,
  INDEX `order_ibfk_2`(`user_account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `product_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编号',
  `product_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `product_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类别',
  `product_describe` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '副标题',
  `product_brand` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌',
  `in_price` double NOT NULL COMMENT '进价',
  `out_price` double NOT NULL COMMENT '售价',
  `product_stock` int(11) NOT NULL COMMENT '库存',
  `lowest_stock` int(11) NOT NULL COMMENT '最低库存',
  `is_stockout` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否缺货',
  `is_new` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否新品',
  `is_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否上架',
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上架时间',
  `product_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`product_id`) USING BTREE,
  UNIQUE INDEX `UNIQUE`(`product_no`) USING BTREE,
  INDEX `product_type`(`product_type`) USING BTREE,
  INDEX `product_brand`(`product_brand`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (142, '20241191058480', '麦富迪狗狗火腿肠大礼包', '宠物食品', '逗犬小零食训犬奖励狗吃的香肠牛肉鸡肉', ' MYFOODIE/麦富迪', 59, 66, 506, 50, 0, 1, 1, '2024-11-09 11:02:28', 'http://localhost:9999/upload/1731121346586.png');
INSERT INTO `product` VALUES (143, '20241191102271', '麦富迪barf霸弗猫粮生骨肉主食', '宠物食品', '冻干双拼营养高蛋白天然烘焙成猫粮', ' MYFOODIE/麦富迪', 180, 199, 500, 50, 0, 1, 1, '2024-11-09 11:03:49', 'http://localhost:9999/upload/1731121427789.png');
INSERT INTO `product` VALUES (144, '20241191103482', '麦富迪狗狗磨牙棒', '宠物食品', '清齿倍健狗零食洁齿骨泰迪小型犬咬胶磨牙洁齿', ' MYFOODIE/麦富迪', 29, 36, 500, 50, 0, 1, 1, '2024-11-09 11:04:56', 'http://localhost:9999/upload/1731121495560.png');
INSERT INTO `product` VALUES (145, '20241191104563', '麦富迪barf猫罐头冻干主食', '宠物食品', '罐鲜肉增肥生骨肉成幼猫粮猫咪湿粮零食', ' MYFOODIE/麦富迪', 48, 59, 500, 50, 0, 1, 1, '2024-11-09 11:06:36', 'http://localhost:9999/upload/1731121595424.png');
INSERT INTO `product` VALUES (146, '20241191106364', '麦富迪鸭肉干鸡胸肉干360g', '宠物食品', '泰迪狗零食宠物鸭肉条训犬狗狗零食训狗', ' MYFOODIE/麦富迪', 29, 35, 500, 50, 0, 1, 1, '2024-11-09 11:07:58', 'http://localhost:9999/upload/1731121676946.png');
INSERT INTO `product` VALUES (147, '20241191107575', '麦富迪狗粮鲜肉夹心双拼全价', '宠物食品', '幼犬通用型小型犬柯基金毛比熊2kg', ' MYFOODIE/麦富迪', 59, 66, 506, 50, 0, 1, 1, '2024-11-09 11:09:07', 'http://localhost:9999/upload/1731121746542.png');
INSERT INTO `product` VALUES (148, '20241191109076', '麦富迪狗狗零食牛肉粒牛肉干宠物零食', '宠物食品', '泰迪金毛成幼犬训狗奖励180g', ' MYFOODIE/麦富迪', 66, 89, 500, 50, 0, 1, 1, '2024-11-09 11:10:09', 'http://localhost:9999/upload/1731121808106.png');
INSERT INTO `product` VALUES (149, '20241191110097', '麦富迪猫零食小鱼干冻干', '宠物食品', '多春鱼鸡胸肉三文鱼补充营养成幼猫零食', ' MYFOODIE/麦富迪', 26, 39, 500, 50, 0, 1, 1, '2024-11-09 11:12:14', 'http://localhost:9999/upload/1731121933410.png');
INSERT INTO `product` VALUES (150, '20241191112148', '麦富迪猫粮营养森林成猫幼猫主粮', '宠物食品', '10kg猫饭猫食英短流浪猫粮20斤40', ' MYFOODIE/麦富迪', 120, 148, 500, 50, 0, 1, 1, '2024-11-09 11:13:50', 'http://localhost:9999/upload/1731122029070.png');
INSERT INTO `product` VALUES (151, '20241191113499', '狗狗零食磨牙棒骨头', '宠物食品', '耐咬鸡肉牛皮圈大小型犬金毛泰迪洁齿宠物零食', ' MYFOODIE/麦富迪', 39, 55, 505, 50, 0, 1, 1, '2024-11-09 11:15:12', 'http://localhost:9999/upload/1731122110980.png');

-- ----------------------------
-- Table structure for product_brand
-- ----------------------------
DROP TABLE IF EXISTS `product_brand`;
CREATE TABLE `product_brand`  (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `brand_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌名称',
  `brand_describe` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌描述',
  PRIMARY KEY (`brand_id`) USING BTREE,
  UNIQUE INDEX `UNIQUE`(`brand_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品品牌表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_brand
-- ----------------------------
INSERT INTO `product_brand` VALUES (36, ' MYFOODIE/麦富迪', '是乖宝集团旗下的自主品牌，该品牌主要经营宠物食品和宠物用品，产品品类包括主粮、湿粮、零食、咬胶等六大系列。麦富迪以“国际化、天然、专业、时尚、创新”的品牌形象，致力于成为国内宠物食品行业的标杆。');
INSERT INTO `product_brand` VALUES (37, '皇家宠物食品 (Royal Canin)', '皇家宠物食品自1968年起致力于为猫犬提供量身定制的营养食品。品牌专注于满足猫犬的独特需求，皇家宠物食品在全球范围内享有盛誉，致力于为宠物创造更美好的生活。');
INSERT INTO `product_brand` VALUES (38, '普瑞纳 (Purina)', '普瑞纳是一家有着120多年历史的宠物食品品牌，隶属于总部位于瑞士的全球知名食品饮料公司雀巢集团。普瑞纳致力于研发高品质和创新性的宠物食品，其产品涵盖多个国家和地区。');

-- ----------------------------
-- Table structure for product_review
-- ----------------------------
DROP TABLE IF EXISTS `product_review`;
CREATE TABLE `product_review`  (
  `review_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户评论id',
  `account_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户帐号',
  `product_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编号',
  `product_specs` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `order_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `review_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `star_level` double NOT NULL COMMENT '商品评星',
  `product_review` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品评价',
  PRIMARY KEY (`review_id`) USING BTREE,
  INDEX `account_number`(`account_number`) USING BTREE,
  INDEX `product_no`(`product_no`) USING BTREE,
  INDEX `order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评价' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_review
-- ----------------------------

-- ----------------------------
-- Table structure for product_specs
-- ----------------------------
DROP TABLE IF EXISTS `product_specs`;
CREATE TABLE `product_specs`  (
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `specs_id` int(11) NOT NULL COMMENT '规格id',
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `specs_id`(`specs_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规格表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_specs
-- ----------------------------
INSERT INTO `product_specs` VALUES (122, 57);
INSERT INTO `product_specs` VALUES (123, 57);
INSERT INTO `product_specs` VALUES (124, 57);
INSERT INTO `product_specs` VALUES (125, 57);
INSERT INTO `product_specs` VALUES (126, 57);
INSERT INTO `product_specs` VALUES (127, 57);
INSERT INTO `product_specs` VALUES (128, 57);
INSERT INTO `product_specs` VALUES (129, 57);
INSERT INTO `product_specs` VALUES (130, 57);
INSERT INTO `product_specs` VALUES (131, 57);
INSERT INTO `product_specs` VALUES (132, 59);
INSERT INTO `product_specs` VALUES (133, 59);
INSERT INTO `product_specs` VALUES (134, 59);
INSERT INTO `product_specs` VALUES (135, 59);
INSERT INTO `product_specs` VALUES (136, 59);
INSERT INTO `product_specs` VALUES (137, 59);
INSERT INTO `product_specs` VALUES (138, 59);
INSERT INTO `product_specs` VALUES (139, 59);
INSERT INTO `product_specs` VALUES (140, 59);
INSERT INTO `product_specs` VALUES (141, 59);
INSERT INTO `product_specs` VALUES (142, 62);
INSERT INTO `product_specs` VALUES (143, 62);
INSERT INTO `product_specs` VALUES (144, 62);
INSERT INTO `product_specs` VALUES (145, 62);
INSERT INTO `product_specs` VALUES (146, 62);
INSERT INTO `product_specs` VALUES (147, 62);
INSERT INTO `product_specs` VALUES (148, 62);
INSERT INTO `product_specs` VALUES (149, 62);
INSERT INTO `product_specs` VALUES (150, 62);
INSERT INTO `product_specs` VALUES (151, 62);

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称',
  `type_describe` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别描述',
  `type_url_left` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '左侧宣传图',
  `type_url_top` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '横幅宣传图',
  PRIMARY KEY (`type_id`) USING BTREE,
  UNIQUE INDEX `UNIQUE`(`type_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类别表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES (32, '宠物食品', '狗粮猫粮宠物零食猫咪罐头狗狗罐头小宠食品水族食品', 'http://localhost:9999/upload/1731120515912.jpg', '');
INSERT INTO `product_type` VALUES (33, '宠物玩具', '狗玩具猫玩具鸟类玩具小宠玩具智能玩具训练用具', 'http://localhost:9999/upload/1731120546873.jpg', '');
INSERT INTO `product_type` VALUES (34, '宠物日用', '猫砂盆狗厕所猫砂尿垫食具水具鱼缸/水族箱猫狗窝', 'http://localhost:9999/upload/1731120594117.png', '');

-- ----------------------------
-- Table structure for products_featured
-- ----------------------------
DROP TABLE IF EXISTS `products_featured`;
CREATE TABLE `products_featured`  (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `recommend` int(11) NOT NULL COMMENT '推荐分',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products_featured
-- ----------------------------

-- ----------------------------
-- Table structure for purchase
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase`  (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '采购id',
  `purchase_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采购编号',
  `purchase_number` int(11) NOT NULL COMMENT '进货数量',
  `purchase_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '进货时间',
  `receipt_time` timestamp NULL DEFAULT NULL COMMENT '收货时间',
  `product_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编号',
  `product_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `supplier_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商编号',
  `supplier_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `account_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作员编号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作员名称',
  `receipt_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '收货状态',
  PRIMARY KEY (`purchase_id`) USING BTREE,
  UNIQUE INDEX `UNIQUE`(`purchase_no`) USING BTREE,
  INDEX `product_no`(`product_no`) USING BTREE,
  INDEX `supplier_no`(`supplier_no`) USING BTREE,
  INDEX `account_number`(`account_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采购表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of purchase
-- ----------------------------

-- ----------------------------
-- Table structure for return_goods
-- ----------------------------
DROP TABLE IF EXISTS `return_goods`;
CREATE TABLE `return_goods`  (
  `return_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '退货id',
  `apply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `order_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `user_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `return_price` double NOT NULL COMMENT '退款金额',
  `operator_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作员账号',
  `operator_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作员名称',
  `deal_time` timestamp NULL DEFAULT NULL COMMENT '处理时间',
  `return_reason` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货原因',
  `return_state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '退货状态',
  PRIMARY KEY (`return_id`) USING BTREE,
  INDEX `user_name`(`user_name`) USING BTREE,
  INDEX `return_goods_ibfk_3`(`operator_number`) USING BTREE,
  INDEX `return_goods_ibfk_1`(`order_no`) USING BTREE,
  INDEX `return_goods_ibfk_2`(`user_number`) USING BTREE,
  INDEX `return_goods_ibfk_4`(`return_reason`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品退货表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of return_goods
-- ----------------------------

-- ----------------------------
-- Table structure for return_reason
-- ----------------------------
DROP TABLE IF EXISTS `return_reason`;
CREATE TABLE `return_reason`  (
  `reason_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '退货id',
  `reason_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '退货理由',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  PRIMARY KEY (`reason_id`) USING BTREE,
  UNIQUE INDEX `UNIQUE`(`reason_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货原因表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of return_reason
-- ----------------------------
INSERT INTO `return_reason` VALUES (1, '七天无理由退换', 1);
INSERT INTO `return_reason` VALUES (2, '质量问题', 1);
INSERT INTO `return_reason` VALUES (3, '价格有点贵', 1);
INSERT INTO `return_reason` VALUES (4, '规格 / 款式 /  数量拍错', 1);
INSERT INTO `return_reason` VALUES (5, '收货地址拍错', 1);
INSERT INTO `return_reason` VALUES (6, '暂时不需要了', 1);
INSERT INTO `return_reason` VALUES (7, '其他', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_describe` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色描述',
  `role_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = COMPRESSED;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '超级管理员', 1);
INSERT INTO `role` VALUES (5, '顾客', '顾客', 1);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `account_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户帐号',
  `product_id` int(11) NOT NULL COMMENT '商品id',
  `pay_amount` int(11) NOT NULL COMMENT '购买数量',
  `product_specs` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `account_number`(`account_number`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`account_number`) REFERENCES `user` (`account_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for specs
-- ----------------------------
DROP TABLE IF EXISTS `specs`;
CREATE TABLE `specs`  (
  `specs_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `specs_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格类型',
  `product_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类别',
  PRIMARY KEY (`specs_id`) USING BTREE,
  INDEX `product_type`(`product_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规格表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of specs
-- ----------------------------
INSERT INTO `specs` VALUES (60, '件', '宠物日用');
INSERT INTO `specs` VALUES (61, '件', '宠物玩具');
INSERT INTO `specs` VALUES (62, '件', '宠物食品');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `supplier_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商编号',
  `supplier_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `product_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类别',
  `principal` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '负责人',
  `contact_way` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系方式',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否可用',
  PRIMARY KEY (`supplier_id`) USING BTREE,
  UNIQUE INDEX `UNIQUE`(`supplier_no`) USING BTREE,
  INDEX `product_type`(`product_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (31, '2024119105641956', '乖宝集团', '宠物食品', '赵芸', '18234567890', 1);
INSERT INTO `supplier` VALUES (32, '2024119105712228', '皇家宠物食品集团', '宠物食品', '李铭', '18234567892', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `account_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `user_sex` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户性别',
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `user_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '用户状态',
  `summary` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `user_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `avatar_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `background_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景图片',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户身份',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `UNIQUE`(`account_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (15, 'admin@qq.com', '超级管理员', '4f43b5d043be8e708fae79806ffdffea', NULL, NULL, '2022-11-14 16:50:53', '2024-11-09 10:00:57', 1, NULL, NULL, 'http://localhost:9999/upload/1731057340306.jpg', NULL, 'ADMIN');
INSERT INTO `user` VALUES (19, '111@qq.com', '111@qq.com', '5e05c1df1caa233a92db5def6923870d', NULL, '15666666666', '2024-04-24 10:39:20', '2024-11-09 09:59:47', 1, NULL, '天津市 市辖区 和平区 幸福小区24号楼3单元1006', 'http://localhost:9999/upload/1731056863176.jpeg', 'http://localhost:9999/upload/1730257597920.jpg', 'CUSTOMER');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (15, 1);
INSERT INTO `user_role` VALUES (19, 5);

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip`  (
  `vip_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'vipid',
  `account_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户帐号',
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '充值时间',
  `overdue_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`vip_id`) USING BTREE,
  INDEX `account_number`(`account_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'vip表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vip
-- ----------------------------

-- ----------------------------
-- Event structure for product_event
-- ----------------------------
DROP EVENT IF EXISTS `product_event`;
delimiter ;;
CREATE EVENT `product_event`
ON SCHEDULE
EVERY '1' DAY STARTS '2021-01-07 02:00:00'
ON COMPLETION PRESERVE
DO BEGIN


		UPDATE product SET is_new = 0 WHERE sale_time<(CURRENT_TIMESTAMP() + INTERVAL -15 DAY);#修改15天前的新品数据


		DELETE FROM qiu.`order` WHERE order_time < DATE_SUB(CURDATE(),INTERVAL 1 DAY) AND order_state='待付款';	#清除24小时内未付款的订单信息


		DELETE FROM vip WHERE overdue_time <= CURDATE(); #清除 VIP表 会员过期的信息


	END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table order
-- ----------------------------
DROP TRIGGER IF EXISTS `order_delete`;
delimiter ;;
CREATE TRIGGER `order_delete` BEFORE DELETE ON `order` FOR EACH ROW BEGIN


	UPDATE product SET product_stock = product_stock + old.pay_amount WHERE product_no = old.product_no;


    END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
DROP TRIGGER IF EXISTS `user_insert`;
delimiter ;;
CREATE TRIGGER `user_insert` AFTER INSERT ON `user` FOR EACH ROW BEGIN


	DECLARE roleId INT;


	SET roleId = (SELECT role_id FROM role WHERE role_name ='顾客');


		INSERT user_role VALUES(new.user_id,roleId);


    END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
