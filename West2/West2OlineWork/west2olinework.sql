/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : west2olinework

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 31/08/2020 11:55:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assignment
-- ----------------------------
DROP TABLE IF EXISTS `assignment`;
CREATE TABLE `assignment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_date` datetime(0) NULL DEFAULT NULL,
  `belong_category_id` int(11) NULL DEFAULT NULL,
  `belong_class_id` int(11) NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `belong_category_id`(`belong_category_id`) USING BTREE,
  INDEX `belong_class_id`(`belong_class_id`) USING BTREE,
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`belong_category_id`) REFERENCES `second_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`belong_class_id`) REFERENCES `class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assignment
-- ----------------------------
INSERT INTO `assignment` VALUES (1, '精华浏览使用如果设备.', 'default.jpg', '2020-08-31 03:53:57', 1, 7, NULL);
INSERT INTO `assignment` VALUES (2, '中心联系可能两个地址方面操作我的.', 'default.jpg', '2020-08-31 03:53:57', 2, 6, NULL);
INSERT INTO `assignment` VALUES (3, '科技特别积分主题具有现在.', 'default.jpg', '2020-08-31 03:53:57', 3, 7, NULL);
INSERT INTO `assignment` VALUES (4, '同时应该发表.', 'default.jpg', '2020-08-31 03:53:57', 4, 7, NULL);
INSERT INTO `assignment` VALUES (5, '回复对于主要特别生活业务其他.', 'default.jpg', '2020-08-31 03:53:57', 5, 6, NULL);
INSERT INTO `assignment` VALUES (6, '经济来自因为资料看到项目.', 'default.jpg', '2020-08-31 03:53:57', 6, 3, NULL);
INSERT INTO `assignment` VALUES (7, '行业一直事情会员作品标准.', 'default.jpg', '2020-08-31 03:53:57', 7, 10, NULL);
INSERT INTO `assignment` VALUES (8, '产品决定不能的话.', 'default.jpg', '2020-08-31 03:53:57', 8, 7, NULL);
INSERT INTO `assignment` VALUES (9, '可能个人最大世界报告.', 'default.jpg', '2020-08-31 03:53:57', 9, 7, NULL);
INSERT INTO `assignment` VALUES (10, '制作准备原因只有语言然后.', 'default.jpg', '2020-08-31 03:53:57', 10, 4, NULL);
INSERT INTO `assignment` VALUES (11, '其实注册位置成功你们一起知道.', 'default.jpg', '2020-08-31 03:53:57', 11, 2, NULL);
INSERT INTO `assignment` VALUES (12, '不同这个一种没有时候作者行业.', 'default.jpg', '2020-08-31 03:53:57', 12, 6, NULL);
INSERT INTO `assignment` VALUES (13, '责任特别质量政府部分应该可是.', 'default.jpg', '2020-08-31 03:53:57', 13, 10, NULL);
INSERT INTO `assignment` VALUES (14, '事情方面日本方式.', 'default.jpg', '2020-08-31 03:53:57', 14, 6, NULL);
INSERT INTO `assignment` VALUES (15, '历史支持注意认为.', 'default.jpg', '2020-08-31 03:53:57', 15, 10, NULL);
INSERT INTO `assignment` VALUES (16, '个人教育您的类别不断活动成功.', 'default.jpg', '2020-08-31 03:53:57', 16, 6, NULL);
INSERT INTO `assignment` VALUES (17, '业务最新社区人民联系类别.', 'default.jpg', '2020-08-31 03:53:57', 17, 7, NULL);
INSERT INTO `assignment` VALUES (18, '搜索阅读北京美国成为威望情况自己.', 'default.jpg', '2020-08-31 03:53:57', 18, 9, NULL);
INSERT INTO `assignment` VALUES (19, '知道不同大小帖子这里业务还是服务.', 'default.jpg', '2020-08-31 03:53:57', 19, 2, NULL);
INSERT INTO `assignment` VALUES (20, '完全生产历史同时而且城市.', 'default.jpg', '2020-08-31 03:53:57', 20, 6, NULL);
INSERT INTO `assignment` VALUES (21, '设备关系准备方式.', 'default.jpg', '2020-08-31 03:53:57', 21, 7, NULL);
INSERT INTO `assignment` VALUES (22, '研究汽车公司他的国家来源单位.', 'default.jpg', '2020-08-31 03:53:58', 22, 9, NULL);
INSERT INTO `assignment` VALUES (23, '状态价格自己.', 'default.jpg', '2020-08-31 03:53:58', 23, 6, NULL);
INSERT INTO `assignment` VALUES (24, '这是关系现在你们在线.', 'default.jpg', '2020-08-31 03:53:58', 24, 10, NULL);
INSERT INTO `assignment` VALUES (25, '一直语言他的东西.', 'default.jpg', '2020-08-31 03:53:58', 25, 6, NULL);
INSERT INTO `assignment` VALUES (26, '怎么国际就是实现推荐威望过程.', 'default.jpg', '2020-08-31 03:53:58', 26, 7, NULL);
INSERT INTO `assignment` VALUES (27, '最大电影说明喜欢用户一个显示.', 'default.jpg', '2020-08-31 03:53:58', 27, 10, NULL);
INSERT INTO `assignment` VALUES (28, '计划等级你们要求.', 'default.jpg', '2020-08-31 03:53:58', 28, 5, NULL);
INSERT INTO `assignment` VALUES (29, '一起由于威望建设大家相关.', 'default.jpg', '2020-08-31 03:53:58', 29, 7, NULL);
INSERT INTO `assignment` VALUES (30, '部门一次数据商品知道.', 'default.jpg', '2020-08-31 03:53:58', 30, 1, NULL);
INSERT INTO `assignment` VALUES (31, '事情本站其中部门客户一起.', 'default.jpg', '2020-08-31 03:53:58', 31, 6, NULL);
INSERT INTO `assignment` VALUES (32, '上海控制的人解决一下.', 'default.jpg', '2020-08-31 03:53:58', 32, 9, NULL);
INSERT INTO `assignment` VALUES (33, '大家相关通过政府规定.', 'default.jpg', '2020-08-31 03:53:58', 33, 6, NULL);
INSERT INTO `assignment` VALUES (34, '情况操作组织科技回复简介完成.', 'default.jpg', '2020-08-31 03:53:58', 34, 3, NULL);
INSERT INTO `assignment` VALUES (35, '这种欢迎经验价格活动密码.', 'default.jpg', '2020-08-31 03:53:58', 35, 7, NULL);
INSERT INTO `assignment` VALUES (36, '大小业务特别政府威望对于相关不同.', 'default.jpg', '2020-08-31 03:53:58', 36, 6, NULL);
INSERT INTO `assignment` VALUES (37, '认为新闻价格分析.', 'default.jpg', '2020-08-31 03:53:58', 37, 6, NULL);
INSERT INTO `assignment` VALUES (38, '主要作为他的结果城市软件名称.', 'default.jpg', '2020-08-31 03:53:58', 38, 10, NULL);
INSERT INTO `assignment` VALUES (39, '以及组织北京没有.', 'default.jpg', '2020-08-31 03:53:58', 39, 3, NULL);
INSERT INTO `assignment` VALUES (40, '一样简介起来工具.', 'default.jpg', '2020-08-31 03:53:58', 40, 6, NULL);

-- ----------------------------
-- Table structure for assignment_read
-- ----------------------------
DROP TABLE IF EXISTS `assignment_read`;
CREATE TABLE `assignment_read`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NULL DEFAULT NULL,
  `readed_std_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for association
-- ----------------------------
DROP TABLE IF EXISTS `association`;
CREATE TABLE `association`  (
  `user_id` int(11) NULL DEFAULT NULL,
  `class_id` int(11) NULL DEFAULT NULL,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `class_id`(`class_id`) USING BTREE,
  CONSTRAINT `association_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `association_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of association
-- ----------------------------
INSERT INTO `association` VALUES (2, 1);
INSERT INTO `association` VALUES (3, 2);
INSERT INTO `association` VALUES (1, 3);
INSERT INTO `association` VALUES (1, 4);
INSERT INTO `association` VALUES (2, 5);
INSERT INTO `association` VALUES (5, 6);
INSERT INTO `association` VALUES (5, 7);
INSERT INTO `association` VALUES (4, 8);
INSERT INTO `association` VALUES (3, 9);
INSERT INTO `association` VALUES (4, 10);
INSERT INTO `association` VALUES (34, 7);
INSERT INTO `association` VALUES (35, 4);
INSERT INTO `association` VALUES (36, 3);
INSERT INTO `association` VALUES (37, 9);
INSERT INTO `association` VALUES (38, 9);
INSERT INTO `association` VALUES (39, 6);
INSERT INTO `association` VALUES (40, 5);
INSERT INTO `association` VALUES (41, 6);
INSERT INTO `association` VALUES (42, 3);
INSERT INTO `association` VALUES (43, 9);
INSERT INTO `association` VALUES (44, 9);
INSERT INTO `association` VALUES (45, 7);
INSERT INTO `association` VALUES (46, 8);
INSERT INTO `association` VALUES (47, 6);

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '分析', '该班级暂无描述');
INSERT INTO `class` VALUES (2, '没有', '该班级暂无描述');
INSERT INTO `class` VALUES (3, '而且', '该班级暂无描述');
INSERT INTO `class` VALUES (4, '价格', '该班级暂无描述');
INSERT INTO `class` VALUES (5, '继续', '该班级暂无描述');
INSERT INTO `class` VALUES (6, '手机', '该班级暂无描述');
INSERT INTO `class` VALUES (7, '知道', '该班级暂无描述');
INSERT INTO `class` VALUES (8, '主要', '该班级暂无描述');
INSERT INTO `class` VALUES (9, '名称', '该班级暂无描述');
INSERT INTO `class` VALUES (10, '产品', '该班级暂无描述');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_user_id` int(11) NULL DEFAULT NULL,
  `send_time` datetime(0) NULL DEFAULT NULL,
  `is_reply` tinyint(1) NULL DEFAULT NULL,
  `belong_talking_id` int(11) NULL DEFAULT NULL,
  `replied_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `from_user_id`(`from_user_id`) USING BTREE,
  INDEX `belong_talking_id`(`belong_talking_id`) USING BTREE,
  INDEX `replied_id`(`replied_id`) USING BTREE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`belong_talking_id`) REFERENCES `talkings` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`replied_id`) REFERENCES `comments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, '关系经验根据您的大学.', 4, '2020-08-27 06:03:07', 0, 13, NULL);
INSERT INTO `comments` VALUES (2, '更多全部查看评论也是语言.', 1, '2020-08-27 06:07:19', 0, 1, NULL);
INSERT INTO `comments` VALUES (3, '事情北京详细留言还是以后推荐的人.', 1, '2020-08-27 06:07:19', 0, 20, NULL);
INSERT INTO `comments` VALUES (4, '是一特别专业关于政府通过不过.', 3, '2020-08-27 06:07:19', 0, 9, NULL);
INSERT INTO `comments` VALUES (5, '一种经验类型他们大小责任.', 5, '2020-08-27 06:07:19', 0, 19, NULL);
INSERT INTO `comments` VALUES (6, '浏览地址销售作品很多.', 4, '2020-08-27 06:07:19', 0, 8, NULL);
INSERT INTO `comments` VALUES (7, '大学工程全国.', 1, '2020-08-27 06:07:19', 0, 7, NULL);
INSERT INTO `comments` VALUES (8, '也是但是包括一点广告国家.', 2, '2020-08-27 06:07:19', 0, 11, NULL);
INSERT INTO `comments` VALUES (9, '发表新闻因此技术成功.', 2, '2020-08-27 06:07:19', 0, 17, NULL);
INSERT INTO `comments` VALUES (10, '部门很多一点事情注意.', 2, '2020-08-27 06:07:19', 0, 17, NULL);
INSERT INTO `comments` VALUES (11, '密码要求知道基本相关.', 3, '2020-08-27 06:07:19', 0, 18, NULL);
INSERT INTO `comments` VALUES (12, '简介一定今年音乐处理进行感觉.', 3, '2020-08-27 06:07:19', 0, 9, NULL);
INSERT INTO `comments` VALUES (13, '经营浏览有些为了价格各种.', 1, '2020-08-27 06:07:19', 0, 2, NULL);
INSERT INTO `comments` VALUES (14, '系统详细为什一下.', 1, '2020-08-27 06:07:19', 0, 1, NULL);
INSERT INTO `comments` VALUES (15, '在线正在那些.', 5, '2020-08-27 06:07:19', 0, 12, NULL);
INSERT INTO `comments` VALUES (16, '不会你们建设.', 3, '2020-08-27 06:07:19', 0, 6, NULL);
INSERT INTO `comments` VALUES (17, '新闻帖子看到继续.', 3, '2020-08-27 06:07:19', 0, 9, NULL);
INSERT INTO `comments` VALUES (18, '其他无法规定方面还是问题.', 2, '2020-08-27 06:07:19', 0, 17, NULL);
INSERT INTO `comments` VALUES (19, '国家教育那么历史音乐管理.', 2, '2020-08-27 06:07:19', 0, 3, NULL);
INSERT INTO `comments` VALUES (20, '学校提供是一报告世界.', 1, '2020-08-27 06:07:19', 0, 7, NULL);
INSERT INTO `comments` VALUES (21, '完全这些注意这是.', 2, '2020-08-27 06:07:19', 0, 11, NULL);
INSERT INTO `comments` VALUES (22, '登录不能您的工作一样等级安全.', 2, '2020-08-27 06:07:19', 0, 15, NULL);
INSERT INTO `comments` VALUES (23, '怎么分析主题大小注册.', 2, '2020-08-27 06:07:19', 0, 17, NULL);
INSERT INTO `comments` VALUES (24, '那么一点单位评论使用论坛可以.', 2, '2020-08-27 06:07:19', 0, 3, NULL);
INSERT INTO `comments` VALUES (25, '事情主题当前而且内容说明.', 4, '2020-08-27 06:07:19', 0, 14, NULL);
INSERT INTO `comments` VALUES (26, '主要品牌精华有关任何责任.', 2, '2020-08-27 06:07:19', 0, 17, NULL);
INSERT INTO `comments` VALUES (27, '时候科技显示参加关于.', 4, '2020-08-27 06:07:20', 0, 5, NULL);
INSERT INTO `comments` VALUES (28, '广告大小已经使用标题精华业务.', 3, '2020-08-27 06:07:20', 0, 9, NULL);
INSERT INTO `comments` VALUES (29, '图片有关出来系统注意登录.', 4, '2020-08-27 06:07:20', 0, 14, NULL);
INSERT INTO `comments` VALUES (30, '不断位置网站详细具有的话中国完全.', 3, '2020-08-27 06:07:20', 0, 6, NULL);
INSERT INTO `comments` VALUES (31, '深圳学生现在欢迎重要.', 2, '2020-08-27 06:07:20', 0, 3, NULL);
INSERT INTO `comments` VALUES (32, '到了状态广告谢谢或者不断.', 5, '2020-08-27 06:07:20', 0, 12, NULL);
INSERT INTO `comments` VALUES (33, '加入价格通过.', 3, '2020-08-27 06:07:20', 0, 6, NULL);
INSERT INTO `comments` VALUES (34, '这种基本完全.', 39, '2020-08-30 08:46:26', 1, 12, 15);
INSERT INTO `comments` VALUES (35, '首页首页分析任何同时这里学校.', 4, '2020-08-30 08:46:26', 1, 14, 29);
INSERT INTO `comments` VALUES (36, '软件系列经营也是希望运行设计.', 4, '2020-08-30 08:46:26', 1, 13, 1);
INSERT INTO `comments` VALUES (37, '新闻男人处理不是记者时间.', 2, '2020-08-30 08:46:26', 1, 3, 31);
INSERT INTO `comments` VALUES (38, '他的汽车要求完成回复到了这是.', 42, '2020-08-30 08:46:26', 1, 2, 13);
INSERT INTO `comments` VALUES (39, '类别一直这些如何但是.', 41, '2020-08-30 08:46:26', 1, 12, 32);
INSERT INTO `comments` VALUES (40, '来源公司拥有建设成功应该.', 46, '2020-08-30 08:46:26', 1, 13, 36);
INSERT INTO `comments` VALUES (41, '经营支持全国活动全国.', 4, '2020-08-30 08:46:26', 1, 14, 35);
INSERT INTO `comments` VALUES (42, '教育行业当前能够重要工作.', 43, '2020-08-30 08:46:26', 1, 9, 12);
INSERT INTO `comments` VALUES (43, '你们不同特别经营关系.', 3, '2020-08-30 08:46:26', 1, 9, 17);
INSERT INTO `comments` VALUES (44, '研究由于那个如果实现这种工作.', 4, '2020-08-30 08:46:26', 1, 5, 27);
INSERT INTO `comments` VALUES (45, '朋友生产行业时候目前的话.', 46, '2020-08-30 08:46:26', 1, 8, 6);
INSERT INTO `comments` VALUES (46, '中文企业一般决定下载可以销售.', 46, '2020-08-30 08:46:26', 1, 5, 44);
INSERT INTO `comments` VALUES (47, '自己等级不过运行得到只有地方男人.', 39, '2020-08-30 08:46:26', 1, 19, 5);
INSERT INTO `comments` VALUES (48, '生活功能这些设计已经会员.', 46, '2020-08-30 08:46:26', 1, 5, 44);
INSERT INTO `comments` VALUES (49, '搜索准备一切最新.', 5, '2020-08-30 08:46:26', 1, 19, 47);
INSERT INTO `comments` VALUES (50, '音乐这样以下还是.', 37, '2020-08-30 08:46:26', 1, 9, 42);
INSERT INTO `comments` VALUES (51, '为了地方文件生产不要.', 41, '2020-08-30 08:46:26', 1, 19, 49);
INSERT INTO `comments` VALUES (52, '得到只有男人我们虽然.', 36, '2020-08-30 08:46:26', 1, 20, 3);
INSERT INTO `comments` VALUES (53, '其实就是评论孩子怎么.', 36, '2020-08-30 08:46:26', 1, 2, 38);
INSERT INTO `comments` VALUES (54, '处理中心要求注册处理环境.', 46, '2020-08-30 08:46:26', 1, 13, 40);
INSERT INTO `comments` VALUES (55, '对于汽车有限.', 1, '2020-08-30 08:46:26', 1, 20, 3);
INSERT INTO `comments` VALUES (56, '加入显示点击上海功能经验评论.', 41, '2020-08-30 08:46:26', 1, 12, 15);
INSERT INTO `comments` VALUES (57, '人员项目是一.', 46, '2020-08-30 08:46:26', 1, 5, 44);
INSERT INTO `comments` VALUES (58, '之间处理经营这种.', 2, '2020-08-30 08:46:26', 1, 11, 21);
INSERT INTO `comments` VALUES (59, '类型重要影响更新一点个人北京.', 1, '2020-08-30 08:46:26', 1, 20, 3);
INSERT INTO `comments` VALUES (60, '事情男人论坛发现.', 2, '2020-08-30 08:46:26', 1, 15, 22);
INSERT INTO `comments` VALUES (61, '教育一些业务她的密码.', 37, '2020-08-30 08:46:26', 1, 9, 17);

-- ----------------------------
-- Table structure for course_read
-- ----------------------------
DROP TABLE IF EXISTS `course_read`;
CREATE TABLE `course_read`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NULL DEFAULT NULL,
  `readed_std_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for finish_status
-- ----------------------------
DROP TABLE IF EXISTS `finish_status`;
CREATE TABLE `finish_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NULL DEFAULT NULL,
  `finish_user_id` int(11) NULL DEFAULT NULL,
  `finish_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `finish_time` datetime(0) NULL DEFAULT NULL,
  `score` int(11) NOT NULL,
  `is_correct` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `assignment_id`(`assignment_id`) USING BTREE,
  INDEX `finish_user_id`(`finish_user_id`) USING BTREE,
  CONSTRAINT `finish_status_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `assignment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `finish_status_ibfk_2` FOREIGN KEY (`finish_user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for first_category
-- ----------------------------
DROP TABLE IF EXISTS `first_category`;
CREATE TABLE `first_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `belong_class_id` int(11) NULL DEFAULT NULL,
  `next_category_id` int(11) NULL DEFAULT NULL,
  `is_first_category` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `belong_class_id`(`belong_class_id`) USING BTREE,
  CONSTRAINT `first_category_ibfk_1` FOREIGN KEY (`belong_class_id`) REFERENCES `class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of first_category
-- ----------------------------
INSERT INTO `first_category` VALUES (1, '地方同时电话男人.', 6, 8, 1);
INSERT INTO `first_category` VALUES (2, '我们时候国内因为这样最大.', 4, 12, 1);
INSERT INTO `first_category` VALUES (3, '起来地址之间为了说明密码学校.', 5, 0, 1);
INSERT INTO `first_category` VALUES (4, '位置今天当然还是来自.', 1, 0, 1);
INSERT INTO `first_category` VALUES (5, '关系发展必须功能帖子.', 9, 9, 1);
INSERT INTO `first_category` VALUES (6, '业务等级有关市场登录帮助搜索.', 2, 0, 1);
INSERT INTO `first_category` VALUES (7, '有限一切的话.', 8, 10, 1);
INSERT INTO `first_category` VALUES (8, '投资网络情况帮助.', 6, 15, 0);
INSERT INTO `first_category` VALUES (9, '安全工作所有资源开始一点.', 9, 0, 0);
INSERT INTO `first_category` VALUES (10, '过程下载那些时间.', 8, 0, 0);
INSERT INTO `first_category` VALUES (11, '软件系列活动有限国际作者不同发展.', 7, 13, 1);
INSERT INTO `first_category` VALUES (12, '控制当前一切政府来源.', 4, 19, 0);
INSERT INTO `first_category` VALUES (13, '中心我的一些为了推荐还有.', 7, 0, 0);
INSERT INTO `first_category` VALUES (14, '帮助登录全部那个.', 3, 0, 1);
INSERT INTO `first_category` VALUES (15, '成功起来方法说明所以.', 6, 16, 0);
INSERT INTO `first_category` VALUES (16, '点击问题介绍查看更新控制.', 6, 18, 0);
INSERT INTO `first_category` VALUES (17, '因为也是可能规定大家因为.', 10, 20, 1);
INSERT INTO `first_category` VALUES (18, '科技建设等级阅读.', 6, 0, 0);
INSERT INTO `first_category` VALUES (19, '那些说明今天方法只是参加深圳.', 4, 0, 0);
INSERT INTO `first_category` VALUES (20, '参加主要或者非常责任.', 10, 0, 0);

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `belong_class_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `belong_class_id`(`belong_class_id`) USING BTREE,
  CONSTRAINT `notices_ibfk_1` FOREIGN KEY (`belong_class_id`) REFERENCES `class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES (1, '今年事情因为因此社区当然方面.', '一次名称成功标准没有一些各种.数据法律市场的话业务会员建设.\n会员有些积分不会完全商品功能.来源美国还是然后你的.认为无法图片次数虽然有关当前.\n可是电脑加入我的的是介绍.由于在线教育完全.\n觉得应该阅读她的计划搜索.能力自己朋友可以看到.\n两个你们关系世界.服务留言发表其实今天.过程这里选择拥有电子都是空间.\n所有参加密码用户.资源只有研究发展无法.\n全国其实名称目前是一提高或者日本.阅读参加这个不能包括方面.', 6, '2020-08-30 08:46:27');
INSERT INTO `notices` VALUES (2, '用户浏览合作当前.', '回复上海一种工具为什技术之后.不同文件自己主要业务组织标准.拥有人民东西商品发生设备状态需要.\n用户不会信息规定基本评论.资料直接公司.\n如何朋友如此方面专业.经营我的提供地方.经营环境空间社区不断责任.\n这样国际可能中文因此要求还有过程.全国一下网上他的当然相关手机.直接一切而且正在喜欢.\n程序广告当前有关.大家成为在线直接不能分析方面知道.\n参加拥有更多具有那些基本参加单位.政府部分制作一般其中北京.这些已经位置类别学习.', 3, '2020-08-30 08:46:27');
INSERT INTO `notices` VALUES (3, '发现不同用户威望.', '历史增加情况继续历史.你的今年地址都是.文化评论资源投资内容的话游戏.\n怎么进入没有事情不会东西.现在有限中国这是密码.组织文章客户一般.\n是否学习处理本站深圳.市场出现不断无法.\n中文论坛如果工程单位来自.应该相关经验.\n不要一切游戏工具两个控制.可以如何选择阅读无法汽车得到感觉.有关时间最大一样东西市场.\n之后来自正在投资.\n今年他们的是业务最大合作资源出现.这种专业还有你们一个密码.进行公司汽车科技谢谢.', 7, '2020-08-30 08:46:27');
INSERT INTO `notices` VALUES (4, '是一软件责任特别来自决定制作.', '价格图片合作影响信息主题.可以相关注意国家当然全部电脑以下.\n电脑事情有关名称有些这样根据.电话科技什么电影网络北京联系.世界国际关系资料.部门时候主题情况都是经验地址.\n起来技术有些的话是一经济之间.朋友图片完全.用户的人电话生产一种完全然后.\n登录部分你的国家密码介绍文章.积分那么今天.\n客户这么全部一下阅读.为了目前法律方面.\n电话只是完成问题.经验他们学校重要.', 5, '2020-08-30 08:46:27');
INSERT INTO `notices` VALUES (5, '本站单位认为特别以下以后.', '帖子我们技术文化孩子组织.详细部门标准继续精华虽然位置.以下状态也是记者.\n游戏那么不断方式选择注意.全国计划学校.文件时间只是学生您的继续发生.\n那个那么今天一起威望.数据那么之后技术进入他的.最新全部简介如果商品.\n研究通过人民城市这是日期.是一价格在线.\n如此必须得到比较威望一定发生.直接状态类别说明一般.问题方式注意过程质量.\n应该情况网络那么也是.的是部门会员发布.而且操作学习最新到了.科技投资研究由于地址.', 3, '2020-08-30 08:46:27');
INSERT INTO `notices` VALUES (6, '进行发展汽车当前出来产品联系.', '只是管理品牌其中一直.欢迎内容规定操作发现主要最后文件.当前为了应该不是问题分析网络.\n增加一次登录国内可能单位.\n公司是否您的全部.介绍那么广告事情电脑只有这么搜索.结果非常公司留言学生的话更新.\n社区不过等级操作出现关系.事情产品女人你的所有对于社区.网络个人的话两个安全系列.\n如此数据之后这么不会方式经验.之间广告一定一些不能工作.\n数据时候非常.一些这个市场感觉.', 10, '2020-08-30 08:46:28');
INSERT INTO `notices` VALUES (7, '因此地址程序语言精华社会次数发现.', '完成通过个人中国方面直接.到了设备只是音乐搜索规定音乐国际.事情方面一起然后合作应用其他.\n关于关于国家美国因为.浏览在线他们合作作者方法一般.\n只是能力问题首页.任何觉得学生类别活动.由于责任还是电脑.\n最新两个因为一定研究地区.\n免费能够各种方面一切.方法一种男人业务网站.\n制作解决大家服务谢谢管理当前.用户她的因为合作可以提供以及.表示电话帮助一个加入欢迎相关.\n以下一般操作原因企业控制.标准深圳开发威望.', 10, '2020-08-30 08:46:28');
INSERT INTO `notices` VALUES (8, '来自之后原因浏览.', '中国孩子准备所有.社区如此也是程序选择.\n非常使用关系电影技术时间地区阅读.更新当然北京是一的是发表一样.\n但是发生所以出现.方面工具次数大家比较.重要次数威望已经这样日本选择.\n很多参加操作地址.大学服务关于之后.\n记者今年决定价格发表项目欢迎.得到可以工具手机.必须大学如何应用联系类型之间.\n文章全国之间帮助参加一切.成功空间相关.今年是一新闻那么时候没有结果.', 3, '2020-08-30 08:46:28');
INSERT INTO `notices` VALUES (9, '当前设计经济可能参加能够浏览简介.', '行业责任法律来源.精华作者能够帖子最大喜欢解决喜欢.\n电脑拥有自己合作.评论非常系统报告女人结果.可以主要联系等级学习.\n已经参加个人经营阅读.环境大学我的会员.支持但是希望如何怎么推荐.\n网络地址各种你的增加你们.部分密码根据女人实现操作之间如何.只是要求参加提高你的质量游戏.\n业务女人进行的人以及业务喜欢.生活正在是一参加.记者什么您的一定自己拥有手机.\n系列因为学生文件程序.还是这样看到图片制作欢迎还有.成为大学得到.\n我们次数完全.音乐解决语言增加之后.', 3, '2020-08-30 08:46:28');
INSERT INTO `notices` VALUES (10, '出来加入一定建设.', '发布浏览控制以下部门.问题因为广告那个这么日期得到.企业只要中心的是如何.环境音乐美国销售计划都是学校.\n然后准备拥有无法.项目可以大小等级浏览.目前已经增加如何精华国家.\n以下方式很多标准情况企业.帖子具有的人增加世界关于.\n到了孩子一点.点击日本开始现在状态.处理关系一次世界不过深圳一次.\n的人商品最后.继续新闻发现那么经营.最大所有开始回复进行.\n详细比较欢迎也是工程参加更多.有限希望就是控制解决问题规定.', 9, '2020-08-30 08:46:28');
INSERT INTO `notices` VALUES (11, '类别名称作者这个.', '责任回复其实.实现一下具有.\n生产得到报告用户因为组织.世界音乐什么.深圳所有出来重要当前资料目前然后.\n技术责任公司表示准备以上开发.手机研究国家.一点所以以后威望语言也是质量拥有.\n帮助在线电话发表增加知道已经.时候比较表示完全不会部门.当然等级合作制作今年文件.名称设计分析标准操作.\n两个技术专业结果正在.出现免费详细大家设计的话.\n如何是否那些地方学生类别部门.系统地址今年.\n重要自己如何系列能够注意网络.品牌规定工程.', 4, '2020-08-30 08:46:28');
INSERT INTO `notices` VALUES (12, '学生这么业务.', '感觉经营东西环境一点计划.直接包括自己女人一个.\n音乐来自自己论坛空间各种.状态电子所以要求投资.可以日本名称.\n不断运行一个显示状态方式可以网上.一直功能最后主题.详细查看位置主要来源发生虽然.\n你的生产国内如何开发.一下更新公司也是网络城市要求社会.您的个人政府作为.\n国际这种工作处理各种.\n很多提高活动一样.由于汽车作品当前音乐.\n网站的是业务继续.来源产品为了怎么状态论坛不要建设.', 2, '2020-08-30 08:46:28');
INSERT INTO `notices` VALUES (13, '点击企业得到数据部门.', '功能自己注意.空间发现手机历史是一运行.\n任何学生资料环境.这是是否他的发展.公司联系谢谢日期.图片但是一些浏览会员客户威望.\n销售原因一直介绍得到.出来到了有限产品文化密码国家.\n作品起来运行地方美国.今天只是那么最后经济出来可以.作者更新结果一次论坛.\n广告全国方面因此图片.音乐以下经济要求网络.今天解决最新能力音乐应用公司.\n学习电脑你的制作个人一定.生产电影帮助国内你们商品.中国需要地址有限.', 3, '2020-08-30 08:46:28');
INSERT INTO `notices` VALUES (14, '方式都是以上.', '参加学校上海有关经验企业社会.基本网站不过.\n同时专业可以这是.电影或者活动功能时间根据状态.应该一直名称之后一定开始分析.\n详细单位这是得到.得到完成拥有.欢迎搜索登录名称包括最新技术.\n设计科技是一对于设计学校.活动生产只有企业问题支持方法.北京大学以后资源学生应用但是.\n不会最大喜欢大家.资料中国问题一次之间.\n网站教育制作.电脑国际空间以及的是问题.\n支持你的他们位置.要求是否地区电话关系积分主题简介.标准需要网络通过.', 6, '2020-08-30 08:46:28');
INSERT INTO `notices` VALUES (15, '继续法律运行手机阅读.', '这个其他精华正在评论.因为国家能够一点注意女人联系.\n准备出来发布方面目前.市场发布系列项目支持行业是一觉得.\n控制类别问题其他我们同时.免费产品孩子一次技术.\n生产通过方法工具这是这是.的人他的法律回复制作.\n客户怎么等级发展成为服务世界.图片没有空间方法人员是一空间.\n制作同时回复解决也是.这个以上那些欢迎专业.\n是一内容作品有些.日本今年为了文化事情.', 10, '2020-08-30 08:46:28');
INSERT INTO `notices` VALUES (16, '工作名称相关评论都是基本网上.', '数据点击主题广告.使用是否最新以上浏览报告.\n这么网站阅读.到了可是文化之间以上汽车.\n方式你们根据.软件资源教育个人世界威望下载.不是比较只是点击不过.\n不是显示文件为什商品还是实现.注册有关一点说明.\n重要比较介绍这种比较那个.首页完全只要部分.\n发布还有制作美国.目前价格新闻电影精华虽然.\n发布支持主要上海文件.增加语言基本行业生活注册.表示类型一点一次.\n提供一般不是参加.更新类型以后需要一个可是拥有.', 5, '2020-08-30 08:46:28');
INSERT INTO `notices` VALUES (17, '一个管理积分.', '简介方法下载.已经以后我们.\n法律加入不是电话行业.谢谢业务资源经验推荐虽然.\n精华等级推荐精华包括文件.科技下载我的学习.类型可能中文搜索显示只有.\n音乐原因部门日本出现.上海音乐支持系统任何音乐美国由于.\n大学美国美国资源.分析名称发展各种完全那些人民项目.\n这里学习评论留言.具有责任标准内容.还有这么销售是否行业显示.设计分析一般登录可能论坛技术.\n不要进行有限她的来自.可能来自计划.', 5, '2020-08-30 08:46:28');
INSERT INTO `notices` VALUES (18, '由于还是研究她的非常项目当然.', '位置论坛决定.\n任何资源这个次数手机而且评论.有关制作留言.\n看到介绍她的项目.汽车汽车行业一次帮助你们政府.已经可能规定事情今年介绍阅读系统.\n这里那些帖子以后电子.评论到了都是不是根据地址那个.\n的是所以一个操作一起应该自己.本站方面发表软件管理一般男人.一起中国中文.\n地区方式必须很多工具一种销售.国内语言市场地址一些不断产品商品.\n广告投资以上方面.社会文化都是重要选择来自详细.最大电子作为比较或者.', 9, '2020-08-30 08:46:28');
INSERT INTO `notices` VALUES (19, '责任查看最大设备位置东西.', '国内还有提供.这些经验关系经济.\n然后图片结果.电话不能提高对于你的.系统操作实现之间只是.\n部门非常回复程序一直主题首页.\n客户两个责任.作者结果设计得到.一切国内喜欢觉得.\n其中内容公司不断发布企业免费.这些免费这些什么一次因为时候.\n是一关系个人包括.时间以及密码.\n继续会员需要影响对于我们这样无法.历史她的研究合作原因看到成功.公司只有可能不要历史说明如此.\n具有状态日本.我们法律状态一起环境比较.业务系统活动这些.', 9, '2020-08-30 08:46:28');
INSERT INTO `notices` VALUES (20, '一样方法数据留言没有中国.', '原因如此问题开发一次主题.文化查看也是你的如果介绍广告.\n来自大学项目其他不是那个以及更多.规定一般单位.工具结果不同起来不是看到结果.\n我的简介而且他们.很多出现对于游戏影响只是项目一切.无法用户还有安全自己.\n管理部分决定发生.\n过程有限搜索已经因为她的分析功能.相关支持作者男人分析首页.学校具有规定次数.\n文化来源支持不断什么生产.非常法律阅读当然组织开始.以及处理具有游戏.\n时间联系部门一起能力威望.为了就是需要还是日本.手机女人经营这么资料拥有语言.', 10, '2020-08-30 08:46:28');

-- ----------------------------
-- Table structure for second_category
-- ----------------------------
DROP TABLE IF EXISTS `second_category`;
CREATE TABLE `second_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent_category_id` int(11) NULL DEFAULT NULL,
  `movie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `add_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_category_id`(`parent_category_id`) USING BTREE,
  CONSTRAINT `second_category_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `first_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of second_category
-- ----------------------------
INSERT INTO `second_category` VALUES (1, '成为', 11, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (2, '起来', 18, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (3, '标题', 13, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (4, '作者', 11, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (5, '汽车', 16, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (6, '直接', 14, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (7, '推荐', 17, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (8, '也是', 11, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (9, '提高', 11, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (10, '以及', 2, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (11, '解决', 6, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (12, '已经', 15, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (13, '运行', 17, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (14, '以后', 18, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (15, '资料', 20, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (16, '大学', 8, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (17, '如此', 13, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (18, '处理', 5, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (19, '特别', 6, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (20, '操作', 1, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (21, '政府', 13, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (22, '东西', 9, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (23, '学生', 18, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (24, '继续', 17, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (25, '语言', 16, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (26, '而且', 11, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (27, '投资', 17, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (28, '国家', 3, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (29, '加入', 11, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (30, '以后', 4, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (31, '任何', 15, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (32, '觉得', 9, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (33, '电子', 18, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (34, '经营', 14, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (35, '大家', 11, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (36, '人员', 8, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (37, '必须', 8, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (38, '到了', 20, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (39, '为什', 14, 'default.mp4', '2020-08-30 08:46:27');
INSERT INTO `second_category` VALUES (40, '那些', 15, 'default.mp4', '2020-08-30 08:46:27');

-- ----------------------------
-- Table structure for talkings
-- ----------------------------
DROP TABLE IF EXISTS `talkings`;
CREATE TABLE `talkings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `belong_class_id` int(11) NULL DEFAULT NULL,
  `publish_time` datetime(0) NULL DEFAULT NULL,
  `publish_user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `belong_class_id`(`belong_class_id`) USING BTREE,
  INDEX `publish_user_id`(`publish_user_id`) USING BTREE,
  CONSTRAINT `talkings_ibfk_1` FOREIGN KEY (`belong_class_id`) REFERENCES `class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `talkings_ibfk_2` FOREIGN KEY (`publish_user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of talkings
-- ----------------------------
INSERT INTO `talkings` VALUES (1, '两个是否规定产品.', '以下国内活动问题注册可以开发当前.有些最大一切生产.位置关于经济有关操作登录生产.\n方式日本积分就是文化.感觉项目拥有自己在线其实.\n工作合作这些大学成为.客户或者那个参加空间还有电子有些.\n那个内容人民可能他们孩子.进行关于是一我们为什表示.\n联系一样如何同时操作人民的人.增加今天希望设备这些行业之间发现.大家企业生产个人注册.特别发布品牌只要自己非常学校.', 4, '2020-08-27 06:02:48', 1);
INSERT INTO `talkings` VALUES (2, '生产系统社区图片.', '两个电影作者经营这里出现她的.质量在线电话是一语言.已经空间也是.\n使用一种世界增加公司北京.使用功能根据这些.\n完全的话中文美国.或者自己建设拥有汽车状态.到了系列美国工程您的这里类别.\n同时加入名称说明生活.感觉运行实现现在出现必须空间.\n系统她的阅读系统出来因此.\n公司原因的人以后中文文化能够.\n全国联系出现加入是一.经济具有活动怎么更新她的所有.也是免费制作精华她的有关相关.\n根据具有深圳为了帮助开始.免费项目来自还有主题.\n内容拥有如此加入.的话合作因此介绍认为.增加国际汽车不会地址企业.', 3, '2020-08-27 06:02:48', 1);
INSERT INTO `talkings` VALUES (3, '一切单位语言直接系统计划经营.', '控制应该可是位置空间计划.能够决定一次成功分析主题一定.她的显示以后图片.\n规定现在女人最大.\n广告类型可是免费那些.他们活动技术设备.历史以上已经主要资源目前游戏.\n全部资源网上深圳以后.网站目前影响可能.\n汽车关于参加我的决定管理设计.工程类型学习个人知道选择日期.使用如果不同法律只是.', 1, '2020-08-27 06:02:48', 2);
INSERT INTO `talkings` VALUES (4, '不过只是到了起来这些.', '注册电话单位看到公司.行业一直日本有限.\n语言标准日本要求专业相关以下.之后科技也是电影标准之间不是.\n学校行业日本免费.开发根据价格发表网络政府同时.使用日本图片软件这个对于.\n都是空间最大参加这些参加拥有历史.威望具有不会历史任何.一样说明欢迎注意不要解决是否朋友.\n一样查看空间认为广告工作.生产广告资料需要精华最后.经济来源中文目前联系.\n当然根据由于上海经营有些.最后世界来自法律留言可是有限.孩子起来谢谢来自.人民操作各种会员.\n中文只有科技类型销售他的以下.价格系统最后浏览记者.城市特别查看.情况文章解决免费影响.', 4, '2020-08-27 06:02:48', 1);
INSERT INTO `talkings` VALUES (5, '得到文件发生网络由于用户他们公司.', '网站建设密码空间会员社会.女人产品起来增加.\n直接应用手机安全.查看关系程序公司由于还是我的价格.技术查看业务法律是否研究学习.\n还是这是最新决定帖子欢迎.\n阅读增加实现以上教育根据.客户基本程序政府.\n一些文化帖子来自问题一次上海.无法研究表示我们免费技术资料.大小注意经验操作功能一起起来.\n发布是一朋友社区.到了上海查看在线方式她的免费行业.知道正在阅读网上质量文件推荐.\n这个需要问题出现拥有开发.最后公司学生科技控制注意生活.', 8, '2020-08-27 06:02:48', 4);
INSERT INTO `talkings` VALUES (6, '不会欢迎人员完全专业一次.', '开发两个客户学生业务网络一个.计划开发比较汽车而且经营还有.有限正在新闻.\n质量可是城市一般不要表示通过处理.\n部门今年其中进入最新.那个成为威望日期.来源教育我的名称.\n认为朋友所以简介一样网络影响.这么参加准备一下当然同时拥有其实.相关为了虽然直接使用学生.', 2, '2020-08-27 06:02:48', 3);
INSERT INTO `talkings` VALUES (7, '语言支持教育说明商品个人提高.', '其实支持以后文化阅读.生活其他很多免费不要作品.不过大学不会评论工程软件.\n一直投资介绍时候他们所以.很多积分合作生活网上.\n当前密码网络当前.作品介绍地址比较详细继续管理.电子责任工程.查看或者资料不是.\n帖子不断必须起来公司注意.根据完全国家经验.美国登录直接电话这里其他.\n我的一切空间.位置今天技术联系.组织手机说明汽车商品.\n虽然资源没有当前使用然后而且.回复威望电影为了这里其中发布.\n类别广告那些怎么社会推荐中国.发生你们一些.', 3, '2020-08-27 06:02:48', 1);
INSERT INTO `talkings` VALUES (8, '一般时间如何什么教育.', '如此支持只要情况.如此工作开发朋友地区其他科技.标准增加评论一起数据.准备只有主题新闻当然.\n能够一直安全这种.个人一定阅读网站而且本站那些.\n以及孩子我们最新实现直接关于.解决然后公司设备.经验经验标准同时.\n感觉信息学生以后合作专业一些女人.问题那些类型中心可能包括.\n开始研究全国对于回复质量.科技简介法律控制安全特别.不是实现阅读实现报告新闻.\n以及电影运行准备解决觉得汽车.操作当前对于只有一直开发.\n发现本站不要可以.对于信息浏览是否政府时间不要.怎么企业地址更新音乐.', 8, '2020-08-27 06:02:48', 4);
INSERT INTO `talkings` VALUES (9, '其实都是今天看到今天这个当然谢谢.', '还是进入控制.搜索谢谢不断.开发价格因为品牌.\n都是也是需要经济责任事情教育.设计实现的是建设可以免费.\n情况汽车这么类别介绍是一.类别公司科技政府这种销售作为.是否包括音乐那些因为阅读.\n客户知道全国.而且北京业务语言学校企业.可能开始发展作品城市.\n不断论坛状态任何他们.全部国际发布手机他的活动学校必须.\n以上设计帮助因此有关决定软件一次.有关其实那些全国业务开发等级完成.一样分析实现觉得等级介绍注意.', 9, '2020-08-27 06:02:48', 3);
INSERT INTO `talkings` VALUES (10, '感觉原因当前工作.', '根据过程公司联系留言操作.\n国内一起非常全国方面.那么作者图片就是自己日本需要.主题然后科技应该免费.\n虽然政府今年有些起来任何文件.一直国家运行欢迎工作.具有只要各种拥有.\n过程这个但是女人到了业务.其实电影当然.比较过程国际应用运行.\n品牌这是就是这么.经营联系必须自己那个关于.操作电话包括回复以及提供一直.', 4, '2020-08-27 06:02:48', 1);
INSERT INTO `talkings` VALUES (11, '工作本站特别以下.', '就是是一全国这种名称.关系今年销售次数学习.\n最新空间当然.如果关于下载关于首页为了提供.\n注册工程因此不能大学.就是地区国家经验地区威望.\n经营部分任何正在发布大小首页.价格需要位置可以等级.广告必须建设一直.\n软件地方系列已经发生更新你的组织.得到这样为什.\n简介登录专业开始手机.他们不是设计项目解决公司首页.\n历史不会点击系列网站法律之后.那些还有最大类别完全.', 1, '2020-08-27 06:02:48', 2);
INSERT INTO `talkings` VALUES (12, '可是发生起来实现计划.', '提供投资登录我们自己具有可以我们.喜欢各种安全加入这些也是可以.\n感觉由于你们相关价格还有.当然在线结果标题我们一直作品.\n开发的话说明标题.看到论坛这里控制首页主要.本站加入学校客户.你们不是原因说明浏览还是.\n一种进入设计自己当然.国际由于因此已经应该作者有些.所以本站管理有些非常注意.\n不能增加加入不要.完全音乐中文位置.\n中文他的目前世界价格目前公司.数据名称控制电脑回复主要部门.', 6, '2020-08-27 06:02:48', 5);
INSERT INTO `talkings` VALUES (13, '汽车研究有些设计.', '能力操作密码用户东西.来自认为工作更新还是.那个可以环境市场注意主要规定.\n如此一定这里基本能够.电话大小事情科技方式.无法感觉如何.\n个人影响一下联系部门.\n那个不断都是国际在线.\n相关更多所以安全在线进行一次.所以出来任何北京基本品牌责任.由于增加继续.', 8, '2020-08-27 06:02:48', 4);
INSERT INTO `talkings` VALUES (14, '不是教育标题美国影响制作一种方法.', '的话由于必须问题.运行社会大小然后这里.发布联系更多介绍评论.\n来自下载组织研究首页.方面原因评论回复首页.一些游戏加入感觉标准.\n推荐行业本站如果最后我们方式.具有更多通过不同在线.注意经营国际地区系统发表专业帖子.\n能够发表还是.\n有限之后一切可以有限这是.本站由于他的学习开始的话标准.', 8, '2020-08-27 06:02:48', 4);
INSERT INTO `talkings` VALUES (15, '注意结果现在不是.', '学生虽然基本一起.没有业务得到.看到搜索虽然经营一种.\n一些一般日本今天.非常名称实现文化成功.本站电话相关资源积分.\n建设当然信息通过得到发表孩子.来源为什搜索学校价格.虽然正在网上他的关于认为的是.\n阅读如此商品一定软件正在之间一些.', 1, '2020-08-27 06:02:48', 2);
INSERT INTO `talkings` VALUES (16, '功能您的技术软件.', '规定合作能力.程序记者已经国家信息.北京为什等级积分认为同时不过非常.\n电话浏览注册威望.或者或者处理公司部分相关.帮助客户资源以及.\n还是出来积分还是主要关于可是成功.以上公司任何部分地址.\n历史部分城市主要文化帮助.等级法律这些其中品牌来源.拥有实现通过直接电话.\n表示地区市场帮助一样.环境法律积分软件经验专业这么.\n方式一切组织实现.支持经验法律孩子而且留言社会.\n以后搜索能够以下程序历史.精华个人也是.\n建设决定注意是一.\n男人自己系统帮助经验.地址因此报告留言.开始回复世界国际增加.', 5, '2020-08-27 06:02:48', 2);
INSERT INTO `talkings` VALUES (17, '大学一下原因男人.', '因此然后学校.两个希望只是根据方面基本.方式能够文件质量.\n项目有限下载现在资料很多可以.增加一些记者历史运行点击.\n规定得到影响有限.科技政府如何电脑标题发布.\n可以增加音乐不能因此主题.发布这个由于原因分析.\n原因只要作品世界加入操作.精华最后深圳决定教育.过程所以必须准备的话公司.\n手机方法到了.中文谢谢很多说明如何增加.这是正在任何行业软件广告.\n国内国内程序介绍只要两个也是.方面拥有价格今年客户解决.用户参加帮助决定专业应该查看.', 5, '2020-08-27 06:02:48', 2);
INSERT INTO `talkings` VALUES (18, '看到工具根据国家不能一切.', '来自经验目前只是.他们那个而且工程继续查看应该.\n记者登录经济电子得到认为生活.只要地区会员影响怎么电话.能够全部不过广告.\n情况相关你们还有.名称有关开发政府支持.正在这个成功你的用户选择程序.\n公司学校提高不能没有广告能够相关.\n手机企业都是不同语言经验一个深圳.主要通过汽车所有.感觉大家之间任何登录.', 2, '2020-08-27 06:02:48', 3);
INSERT INTO `talkings` VALUES (19, '原因觉得事情可能支持.', '服务法律安全有些各种认为这样.\n已经任何组织如果参加内容.\n目前主题选择应该.以下无法运行注意如何发生计划.大家只是非常可是.\n合作不能汽车就是.那么世界操作你们学生次数.看到美国北京更新关系密码.\n推荐当前东西单位美国以后数据规定.其实只是两个需要过程完全不要发生.运行最后上海还有一点能力记者.\n中文知道作为的人.\n会员生活日本当然非常北京.没有公司过程标准相关一种.市场这些但是以上这里美国电脑.\n关于实现特别同时.只是只是完全.\n影响处理功能电脑特别那些的人.以上记者包括.免费资源专业经营.\n只有中国软件重要进入.美国一般表示网络质量.', 6, '2020-08-27 06:02:48', 5);
INSERT INTO `talkings` VALUES (20, '女人一直什么过程.', '为了记者东西名称合作希望.本站朋友能力.历史国家次数.\n单位目前可以不能专业原因.相关同时正在.只有来自根据各种特别发生.\n评论由于看到品牌图片.历史基本关系还是都是比较地方.\n这里还是公司注意发生教育.能力提供应该人民.\n的人学生首页汽车责任.\n公司城市图片一点最新方面进行.不要方式中文选择看到大小显示帮助.\n进行介绍阅读次数产品出现评论.但是是否以上如果人员.目前需要觉得拥有只有.', 3, '2020-08-27 06:02:48', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `college` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` tinyint(1) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `total_study` int(11) NULL DEFAULT NULL,
  `is_teacher` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Brenda', 'Jennifer Horton', 'pbkdf2:sha256:150000$kqiussiv$b52ccaef32670401f4bfda53e707f35eb32f3518cc5cf77213638fe0887eb1ad', '672.723.2824x518', 'hayespatricia@gmail.com', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:02:04', 'default', 0, 1);
INSERT INTO `user` VALUES (2, 'Lisa', 'Andrew Barnett', 'pbkdf2:sha256:150000$pUl6eG2Y$3cc5a10ddcc8cc24e268d62c5e68a9f1187fc13fa44e113ccd8c070512bd70e7', '082-488-1044x212', 'austinpetty@yahoo.com', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:02:04', 'default', 0, 1);
INSERT INTO `user` VALUES (3, 'Kenneth', 'William Whitehead', 'pbkdf2:sha256:150000$1Ado7cYD$bdca0514033e844cabb444924881f21c0358935677d1837731226a93a05d364b', '1667512501', 'qperez@morrow-kemp.biz', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:02:04', 'default', 0, 1);
INSERT INTO `user` VALUES (4, 'Amanda', 'Miss Beverly Kelly PhD', 'pbkdf2:sha256:150000$TPKp9WNn$d49138086c7b9d7f43ba301a96e1e99f98c9e5681b57668158ccc767888a209a', '789-575-8058x0517', 'kelly12@hayden-clark.biz', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:02:04', 'default', 0, 1);
INSERT INTO `user` VALUES (5, 'Joshua', 'Crystal Williams', 'pbkdf2:sha256:150000$zqckEgox$c16d072c4785142ba216a31965ffd05a2daf9fd8bc0de6eee03942eb984f3a88', '(223)925-5930x06909', 'tammy23@arnold-edwards.biz', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:02:04', 'default', 0, 1);
INSERT INTO `user` VALUES (34, 'Gina', 'Mike Harris', 'pbkdf2:sha256:150000$xx6pLzbx$b61b1b63e77fac482335587d5de401414c520409b8132bd7c282f29b87435502', '+1-364-925-5713x589', 'william69@gmail.com', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:10:22', 'default', 0, 0);
INSERT INTO `user` VALUES (35, 'Mary', 'Angela Schwartz', 'pbkdf2:sha256:150000$6WYLpTZc$deedfe79da8110e22d3db7ff0caab44c19e7228b81344565c673d6e489eb674a', '001-414-954-7102x80214', 'spearskenneth@perez.org', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:10:23', 'default', 0, 0);
INSERT INTO `user` VALUES (36, 'Calvin', 'Christopher Valentine', 'pbkdf2:sha256:150000$BICUsTiK$e8e49c1e80e692b0aa3d68ff2d0a4e285c16df0b003b3513df26539163fd7db9', '359.435.9841x849', 'abigailsullivan@gmail.com', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:10:23', 'default', 0, 0);
INSERT INTO `user` VALUES (37, 'Charles', 'Catherine Hood', 'pbkdf2:sha256:150000$j7o1AtVA$9260e55d272f9c1f816f6f116bb4d8af76676e48666eb70605fa798f465c0697', '4638254482', 'jacquelineberry@gmail.com', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:10:23', 'default', 0, 0);
INSERT INTO `user` VALUES (38, 'Amber', 'Chase Horton', 'pbkdf2:sha256:150000$poH4qQuO$08be2af5fa05722475aadea852e431909a5f57547662a29b603e5a16801df824', '+1-025-497-5278x8978', 'masonmichelle@yahoo.com', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:10:23', 'default', 0, 0);
INSERT INTO `user` VALUES (39, 'Sheena', 'Michael Webster', 'pbkdf2:sha256:150000$oPVFouCG$2e11cb18bd638d887d9a29a520a06bcee9ff4a41df2f87ed2f5cccf045a0cf9a', '(246)766-2233x60858', 'emilymiller@hotmail.com', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:10:23', 'default', 0, 0);
INSERT INTO `user` VALUES (40, 'Robert', 'Tammy Herman', 'pbkdf2:sha256:150000$9GAx5ZAH$296fcaa8c0581f75eff9028ab96431ab466cc87a6ed45826d6733661a7531b97', '7637673465', 'ashleybuck@kramer.info', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:10:23', 'default', 0, 0);
INSERT INTO `user` VALUES (41, 'Victor', 'Nicholas Neal', 'pbkdf2:sha256:150000$kI4yLdk7$816e6fa9e7056ad40bf5eb8baf35966552a6f9cbcb3153683d890e4fcd643343', '624.178.2527', 'johnsonstacy@brown.net', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:10:24', 'default', 0, 0);
INSERT INTO `user` VALUES (42, 'Laura', 'Kathy Franco', 'pbkdf2:sha256:150000$YdshTQT5$9befb464f407b10a7d007d536e5f14c3aad1f76adc1d7185f48ee010f37d4548', '061.012.8173', 'benjaminlopez@proctor.com', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:10:24', 'default', 0, 0);
INSERT INTO `user` VALUES (43, 'Sharon', 'Gina Shepherd', 'pbkdf2:sha256:150000$ZipsOTf4$55b41a1ac1607cd072d57af0c72b51af912002e8098ac3d1377ab95c2eb3fa12', '916-474-4437x7328', 'christian22@sanchez.biz', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:10:24', 'default', 0, 0);
INSERT INTO `user` VALUES (44, 'Kristin', 'Robert Garcia', 'pbkdf2:sha256:150000$ELmMDZzN$6b47f351797782ee1ba0d91245d39c0bb87ddb4c5d8cca9faeb7014e1986a7c4', '001-353-988-4082x18168', 'emily26@yahoo.com', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:10:24', 'default', 0, 0);
INSERT INTO `user` VALUES (45, 'Gabriela', 'Kenneth Wade', 'pbkdf2:sha256:150000$SD9NWZCH$4d3ae40334a8ff5bc3c34fb4ff38944fd24c1d534b9389a19e6376fd2ca21864', '(978)982-5299', 'ywang@yahoo.com', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:10:24', 'default', 0, 0);
INSERT INTO `user` VALUES (46, 'Tammy', 'Patrick Sullivan', 'pbkdf2:sha256:150000$bMECN0Li$b22d071588019f16fca5965f6d50a4981339bcc8d63b8b30b2f65d42887ad7ba', '402.638.4569', 'bwaters@hotmail.com', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:10:24', 'default', 0, 0);
INSERT INTO `user` VALUES (47, 'Lucas', 'Jessica Bird', 'pbkdf2:sha256:150000$QdDb7VC9$10aae157e3590383e364e4d997beb1124ade16bcf433e3e74cd90050cbfc3cf6', '(266)152-7843x50459', 'englishmichelle@hotmail.com', '未填写', '该用户未填写简介~', 1, '2020-08-27 06:10:25', 'default', 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
