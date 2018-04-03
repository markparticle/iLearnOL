/*
 Navicat MySQL Data Transfer

 Source Server         : 193.112.138.50 
 Source Server Type    : MariaDB
 Source Server Version : 50556
 Source Host           : localhost:3306
 Source Schema         : ilearnol

 Target Server Type    : MariaDB
 Target Server Version : 50556
 File Encoding         : 65001

 Date: 03/04/2018 19:22:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (9, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (10, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (11, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add 用户信息', 6, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (22, 'Can change 用户信息', 6, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 用户信息', 6, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (24, 'Can add 轮播图', 7, 'add_banner');
INSERT INTO `auth_permission` VALUES (25, 'Can change 轮播图', 7, 'change_banner');
INSERT INTO `auth_permission` VALUES (26, 'Can delete 轮播图', 7, 'delete_banner');
INSERT INTO `auth_permission` VALUES (27, 'Can add 邮箱验证码', 8, 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (28, 'Can change 邮箱验证码', 8, 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (29, 'Can delete 邮箱验证码', 8, 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (30, 'Can add 登录轮播图', 9, 'add_loginbanner');
INSERT INTO `auth_permission` VALUES (31, 'Can change 登录轮播图', 9, 'change_loginbanner');
INSERT INTO `auth_permission` VALUES (32, 'Can delete 登录轮播图', 9, 'delete_loginbanner');
INSERT INTO `auth_permission` VALUES (33, 'Can view 轮播图', 7, 'view_banner');
INSERT INTO `auth_permission` VALUES (34, 'Can view 邮箱验证码', 8, 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (35, 'Can view 登录轮播图', 9, 'view_loginbanner');
INSERT INTO `auth_permission` VALUES (36, 'Can view 用户信息', 6, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (37, 'Can add 课程', 10, 'add_course');
INSERT INTO `auth_permission` VALUES (38, 'Can change 课程', 10, 'change_course');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 课程', 10, 'delete_course');
INSERT INTO `auth_permission` VALUES (40, 'Can add 课程资源', 11, 'add_courseresource');
INSERT INTO `auth_permission` VALUES (41, 'Can change 课程资源', 11, 'change_courseresource');
INSERT INTO `auth_permission` VALUES (42, 'Can delete 课程资源', 11, 'delete_courseresource');
INSERT INTO `auth_permission` VALUES (43, 'Can add 章节', 12, 'add_lesson');
INSERT INTO `auth_permission` VALUES (44, 'Can change 章节', 12, 'change_lesson');
INSERT INTO `auth_permission` VALUES (45, 'Can delete 章节', 12, 'delete_lesson');
INSERT INTO `auth_permission` VALUES (46, 'Can add 视频', 13, 'add_video');
INSERT INTO `auth_permission` VALUES (47, 'Can change 视频', 13, 'change_video');
INSERT INTO `auth_permission` VALUES (48, 'Can delete 视频', 13, 'delete_video');
INSERT INTO `auth_permission` VALUES (49, 'Can add 轮播课程', 10, 'add_bannercourse');
INSERT INTO `auth_permission` VALUES (50, 'Can change 轮播课程', 10, 'change_bannercourse');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 轮播课程', 10, 'delete_bannercourse');
INSERT INTO `auth_permission` VALUES (52, 'Can view 轮播课程', 14, 'view_bannercourse');
INSERT INTO `auth_permission` VALUES (53, 'Can view 课程', 10, 'view_course');
INSERT INTO `auth_permission` VALUES (54, 'Can view 课程资源', 11, 'view_courseresource');
INSERT INTO `auth_permission` VALUES (55, 'Can view 章节', 12, 'view_lesson');
INSERT INTO `auth_permission` VALUES (56, 'Can view 视频', 13, 'view_video');
INSERT INTO `auth_permission` VALUES (57, 'Can add 城市', 15, 'add_citydict');
INSERT INTO `auth_permission` VALUES (58, 'Can change 城市', 15, 'change_citydict');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 城市', 15, 'delete_citydict');
INSERT INTO `auth_permission` VALUES (60, 'Can add 机构信息', 16, 'add_courseorg');
INSERT INTO `auth_permission` VALUES (61, 'Can change 机构信息', 16, 'change_courseorg');
INSERT INTO `auth_permission` VALUES (62, 'Can delete 机构信息', 16, 'delete_courseorg');
INSERT INTO `auth_permission` VALUES (63, 'Can add 教师信息', 17, 'add_teacher');
INSERT INTO `auth_permission` VALUES (64, 'Can change 教师信息', 17, 'change_teacher');
INSERT INTO `auth_permission` VALUES (65, 'Can delete 教师信息', 17, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (66, 'Can view 城市', 15, 'view_citydict');
INSERT INTO `auth_permission` VALUES (67, 'Can view 机构信息', 16, 'view_courseorg');
INSERT INTO `auth_permission` VALUES (68, 'Can view 教师信息', 17, 'view_teacher');
INSERT INTO `auth_permission` VALUES (69, 'Can add 用户评论', 18, 'add_coursecomments');
INSERT INTO `auth_permission` VALUES (70, 'Can change 用户评论', 18, 'change_coursecomments');
INSERT INTO `auth_permission` VALUES (71, 'Can delete 用户评论', 18, 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES (72, 'Can add 用户咨询', 19, 'add_userask');
INSERT INTO `auth_permission` VALUES (73, 'Can change 用户咨询', 19, 'change_userask');
INSERT INTO `auth_permission` VALUES (74, 'Can delete 用户咨询', 19, 'delete_userask');
INSERT INTO `auth_permission` VALUES (75, 'Can add 用户课程', 20, 'add_usercourse');
INSERT INTO `auth_permission` VALUES (76, 'Can change 用户课程', 20, 'change_usercourse');
INSERT INTO `auth_permission` VALUES (77, 'Can delete 用户课程', 20, 'delete_usercourse');
INSERT INTO `auth_permission` VALUES (78, 'Can add 用户收藏', 21, 'add_userfavorite');
INSERT INTO `auth_permission` VALUES (79, 'Can change 用户收藏', 21, 'change_userfavorite');
INSERT INTO `auth_permission` VALUES (80, 'Can delete 用户收藏', 21, 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES (81, 'Can add 用户消息', 22, 'add_usermessage');
INSERT INTO `auth_permission` VALUES (82, 'Can change 用户消息', 22, 'change_usermessage');
INSERT INTO `auth_permission` VALUES (83, 'Can delete 用户消息', 22, 'delete_usermessage');
INSERT INTO `auth_permission` VALUES (84, 'Can view 用户评论', 18, 'view_coursecomments');
INSERT INTO `auth_permission` VALUES (85, 'Can view 用户咨询', 19, 'view_userask');
INSERT INTO `auth_permission` VALUES (86, 'Can view 用户课程', 20, 'view_usercourse');
INSERT INTO `auth_permission` VALUES (87, 'Can view 用户收藏', 21, 'view_userfavorite');
INSERT INTO `auth_permission` VALUES (88, 'Can view 用户消息', 22, 'view_usermessage');
INSERT INTO `auth_permission` VALUES (89, 'Can add Bookmark', 23, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (90, 'Can change Bookmark', 23, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (91, 'Can delete Bookmark', 23, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (92, 'Can add User Setting', 24, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (93, 'Can change User Setting', 24, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (94, 'Can delete User Setting', 24, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (95, 'Can add User Widget', 25, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (96, 'Can change User Widget', 25, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (97, 'Can delete User Widget', 25, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (98, 'Can add log entry', 26, 'add_log');
INSERT INTO `auth_permission` VALUES (99, 'Can change log entry', 26, 'change_log');
INSERT INTO `auth_permission` VALUES (100, 'Can delete log entry', 26, 'delete_log');
INSERT INTO `auth_permission` VALUES (101, 'Can view Bookmark', 23, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (102, 'Can view log entry', 26, 'view_log');
INSERT INTO `auth_permission` VALUES (103, 'Can view User Setting', 24, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (104, 'Can view User Widget', 25, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (105, 'Can add captcha store', 27, 'add_captchastore');
INSERT INTO `auth_permission` VALUES (106, 'Can change captcha store', 27, 'change_captchastore');
INSERT INTO `auth_permission` VALUES (107, 'Can delete captcha store', 27, 'delete_captchastore');
INSERT INTO `auth_permission` VALUES (108, 'Can view captcha store', 27, 'view_captchastore');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `response` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hashkey` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiration` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hashkey`(`hashkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES (2, 'VYND', 'vynd', '8f59973fb4acf0f26f0f77af3aff0b3e52966bcd', '2018-04-03 04:23:24');

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `degree` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(0) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `course_know` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_tell` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  `course_new` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `big_image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_course_course_org_id_4d2c4aab_fk_organizat`(`course_org_id`) USING BTREE,
  INDEX `courses_course_teacher_id_846fa526_fk_organization_teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES (1, 'Python入门', 'Python开发的入门教程', '<p><span style=\"color: rgb(77, 85, 93); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">Python教程基础分《Python入门》和《Python进阶》两门课程，本视频教程是Python第一门课程，是Python开发的入门教程，将介绍Python语言的特点和适用范围，Python基本的数据类型，条件判断和循环，函数，以及Python特有的切片和列表生成式。希望本python教程能够让您快速入门并编写简单的Python程序。</span></p>', 'initial', 24, 1, 23, 'courses/2018/04/5_PJkKr9Z.png', 104, '2018-03-30 09:10:00', 8, 'Python', 'Python', 1, '如果您了解程序设计的基本概念，会简单使用命令行，了解中学数学函数的概念，那么对课程学习会有很大的帮助，让您学起来得心应手，快速进入Python世界。', '1.面向对象的理论基础2.Python基本的面向对象特性3.深入的了解Python面向对象', 1, '本课程免费提供', 'courses/2018/04/5-2_JVEp31q.png');
INSERT INTO `courses_course` VALUES (2, 'Python-面向对象', '面向对象是目前编程语言里面非常主流的一种思想', '<p>&nbsp; &nbsp; 面向对象是目前编程语言里面非常主流的一种思想。Python对于面向对象有非常好的实现。同时，借助Python灵活的语法，可以实现一些很酷的面向对象特性。</p>', ' medium', 60, 0, 12, 'courses/2018/04/1_bobVikN.png', 84, '2018-03-30 09:10:00', 8, 'Python', 'Python', 1, '热爱编程，对Python基础知识已经掌握。', '面向对象的理论基础 、Python基本的面向对象特性 、深入的了解Python面向对象', 0, '本课程免费提供', 'courses/2018/04/1-2_NnXhgXs.png');
INSERT INTO `courses_course` VALUES (3, 'django初体检', 'Python Web网页开发的一个高级的框架', '<p>&nbsp; &nbsp; Django是Python Web网页开发的一个高级的框架，通过Django框架你可以建立一个高性能的web应用而只花费最小的消耗。这种轻盈、强大、灵活的框架让您在设计方案时无需太多考量。本课程主要讲解Django基础内容，让您快速对它有所了解。</p>', ' medium', 43, 0, 1, 'courses/2018/04/3_sHL7orl.png', 79, '2018-03-30 09:10:00', 8, 'Python', 'Django', 3, '您要具体以下知识： Python基础知识、了解数据库以及SQL语言、了解HTML基础知识', '搭建开发环境、工程的创建及应用、了解django的URL映射、视图(views)、模型(models)、模板（template）', 0, '本课程免费提供', 'courses/2018/04/3-2_E31o0wt.png');
INSERT INTO `courses_course` VALUES (4, 'Python人工智能Numpy', '人工智能', '<p>&nbsp; &nbsp; 人工智能的很多方关于数据的操作，机器学习，深度学习，大数据，数据分析等，或多或少都会用到numpy这一python工具库。本课程从搭建环境开始，从anaconda，jupyter notebook，再到课程重点numpy工具库的使用，让你快速掌握这一热门框架。</p>', 'advanced', 25, 0, 2, 'courses/2018/04/2png_wdAQBj8.png', 77, '2018-03-30 09:10:00', 1, 'Python', 'Numpy', 2, '具备一定的python语法基础最好', 'anaconda安装，jupyter notebook使用简单教程，numpy使用教程。numpy简单教程-数组，索引操作，元素数据类型，数组运算与常用函数，广播', 1, '本课程免费提供', 'courses/2018/04/2-2_14jtOFj.png');
INSERT INTO `courses_course` VALUES (5, '全面解析Java注解', '在项目开发中，注解的使用无处不在', '<p>&nbsp; &nbsp; 在项目开发中，注解的使用无处不在。注解的使用简化了代码，减少了程序员的工作量。本课程带领小伙伴们全面认识Java的注解，包括为什么使用注解、Java中的常见注解、注解的分类和如何自定义注解，最后通过一个实战案例来演示注解在实际项目中的应用。</p>', ' medium', 23, 0, 3, 'courses/2018/04/4_4nyFHtJ.png', 74, '2018-03-30 09:10:00', 8, 'Java', 'Java', 3, '小伙伴们注意啦！学习本课程前需要具备Java基础，理解面向对象思想，熟悉Java反射。如果能了解spring、hibernate等框架就更好啦！', '为什么使用注解、理解注解的基本概念、能够自定义注解、理解注解在实际项目中的应用', 0, '本课程免费提供', 'courses/2018/04/4-2_NqkiwfF.png');
INSERT INTO `courses_course` VALUES (6, 'Python数据科学中的应用', '本课程讲述python在数据科学中的应用，从最基本的语法开始，由浅入深，逐层深入。', '<p>&nbsp; &nbsp; 简介：python近年来正在受到越来越广泛的使用，他作为一个通用的脚本语言正在被引用到了各行各业，本课程讲述python在数据科学中的应用，从最基本的语法开始，由浅入深，逐层深入。学员学完本课程后，将会拥有扎实的python功底，能在工作中很快的上手解决实际问题。</p>', ' medium', 36, 0, 2, 'courses/2018/04/6_PLQHWH9.png', 81, '2018-03-30 09:10:00', 1, 'Python', 'Python', 2, '热爱编程，对python感兴趣的同学。', 'python的基本语法、数据科学中常用到的python基本数据结构、python中常用的数据科学工具包', 0, '本课程免费提供', 'courses/2018/04/6-2_3ZdMpDU.png');
INSERT INTO `courses_course` VALUES (7, 'Web前端性能优化', '让你页面速度飞起来 Web前端性能优化', '<p>&nbsp; &nbsp; 从构建、浏览器渲染、缓存、PWA、服务端优化等多方面，梳理前端性能优化的技术点、综合分析技术的原理，根据不同的业务场景选择合适的性能优化点进行应用，最终为你的网站带来显著的速度提升和整体性能提升。</p>', ' medium', 48, 0, 1, 'courses/2018/04/7.png', 75, '2018-03-31 09:10:00', 8, 'WEB', 'WEB', 4, '至少有一个前端项目的开发经验，遇到发展瓶颈、想提升自己技术的同学', 'Html、CSS、JavaScript基础知识、Webpack、FIS等构架工具的使用经验、有Node.js开发经验、具备一定的自学能力', 0, '本课程免费提供', 'courses/2018/04/9-2.png');
INSERT INTO `courses_course` VALUES (8, 'Python实现线性回归', '对于机器学习的入门学习者提供线性回归的原理讲解，在掌握原理的基础上，利用python实现最小二乘法或者梯度下降来进行线性回归分析。', '<p>&nbsp; &nbsp; 对于机器学习的入门学习者提供线性回归的原理讲解，在掌握原理的基础上，利用python实现最小二乘法或者梯度下降来进行线性回归分析。</p>', ' medium', 26, 0, 1, 'courses/2018/04/1425110365105.png', 76, '2018-04-01 09:10:00', 8, 'Python', 'Python', 3, '有机器学习基础、有一定的python基础', '线性回归的概念、最小二乘法的python实现、梯度下降的python实际、编程处理线性回归分析的一般方法', 1, '本课程免费提供', 'courses/2018/04/10-2_YLcKFXk.png');
INSERT INTO `courses_course` VALUES (9, '数据结构探险之图篇', '本课程主要以图的存储方式，图的遍历方法，图的最小生成树为内容主体，详细讲述了图的存储方式，图的遍历和最小生成树的编程思路及实现原理，并手把手完成图的深度优先遍历算法和广度优先遍历算法，', '<p>&nbsp; &nbsp; 本课程主要以图的存储方式，图的遍历方法，图的最小生成树为内容主体，详细讲述了图的存储方式，图的遍历和最小生成树的编程思路及实现原理，并手把手完成图的深度优先遍历算法和广度优先遍历算法，</p>', ' medium', 12, 0, 4, 'courses/2018/04/8_vKoxsWT.png', 84, '2018-04-02 09:10:00', 1, 'C++', 'C++', 5, '本课程是数据结构初级课程、熟练掌握C++语言基础语法', '图的基本概念、图的存储方式、图的遍历算法、图的最小生成树算法、图的实际应用', 0, '本课程免费提供', 'courses/2018/04/8-2png_w9BIbwh.png');

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `download` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(0) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_courseresource_course_id_5eba1332_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES (1, '源码', 'courses/resource/2018/04/源码.py', '2018-04-01 09:59:00', 3);
INSERT INTO `courses_courseresource` VALUES (2, '源码', 'courses/resource/2018/04/源码.py', '2018-04-01 09:59:00', 2);
INSERT INTO `courses_courseresource` VALUES (3, '源码', 'courses/resource/2018/04/源码.py', '2018-04-01 09:59:00', 4);
INSERT INTO `courses_courseresource` VALUES (4, '源码', 'courses/resource/2018/04/源码.py', '2018-04-01 09:59:00', 5);
INSERT INTO `courses_courseresource` VALUES (5, '源码', 'courses/resource/2018/04/源码.py', '2018-04-01 09:59:00', 6);
INSERT INTO `courses_courseresource` VALUES (6, '源码', 'courses/resource/2018/04/源码.py', '2018-04-01 09:59:00', 7);
INSERT INTO `courses_courseresource` VALUES (7, '源码', 'courses/resource/2018/04/源码.py', '2018-04-01 09:59:00', 8);
INSERT INTO `courses_courseresource` VALUES (8, '源码', 'courses/resource/2018/04/源码.py', '2018-04-01 09:59:00', 9);
INSERT INTO `courses_courseresource` VALUES (9, '源码', 'courses/resource/2018/04/源码.py', '2018-04-01 09:59:00', 1);

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(0) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_lesson_course_id_16bc4882_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES (1, '第1章 课程介绍', '2018-03-30 13:05:00', 1);
INSERT INTO `courses_lesson` VALUES (2, '第2章 安装Python', '2018-03-30 13:06:00', 1);
INSERT INTO `courses_lesson` VALUES (3, '第3章 Python变量和数据类型', '2018-03-30 13:06:00', 1);
INSERT INTO `courses_lesson` VALUES (4, '第4章 List和Tuple类型', '2018-03-30 13:06:00', 1);
INSERT INTO `courses_lesson` VALUES (5, '第5章 条件判断和循环', '2018-03-30 13:06:00', 1);
INSERT INTO `courses_lesson` VALUES (6, '第6章 Dict和Set类型', '2018-03-30 13:06:00', 1);
INSERT INTO `courses_lesson` VALUES (7, '第7章 函数', '2018-03-30 13:07:00', 1);
INSERT INTO `courses_lesson` VALUES (8, '第8章 切片', '2018-03-30 13:07:00', 1);
INSERT INTO `courses_lesson` VALUES (9, '第9章 迭代', '2018-03-30 13:07:00', 1);
INSERT INTO `courses_lesson` VALUES (10, '第10章 列表生成式', '2018-03-30 13:07:00', 1);
INSERT INTO `courses_lesson` VALUES (11, '第1章 课程介绍 ', '2018-04-01 09:56:18', 2);
INSERT INTO `courses_lesson` VALUES (12, '第2章 面向对象概念 ', '2018-04-01 09:57:23', 2);
INSERT INTO `courses_lesson` VALUES (13, '第3章 Python面向对象 ', '2018-04-01 09:57:41', 2);
INSERT INTO `courses_lesson` VALUES (14, '第4章 深入Python面向对象 ', '2018-04-01 09:58:06', 2);
INSERT INTO `courses_lesson` VALUES (15, '第5章 课程总结 ', '2018-04-01 09:58:24', 2);
INSERT INTO `courses_lesson` VALUES (16, '第1章 课程介绍及开发环境搭建 ', '2018-04-01 09:58:24', 3);
INSERT INTO `courses_lesson` VALUES (17, ' 第2章 创建工程及应用 ', '2018-04-01 09:58:23', 3);
INSERT INTO `courses_lesson` VALUES (18, ' 第3章 django初体检 ', '2018-04-01 09:58:23', 3);
INSERT INTO `courses_lesson` VALUES (19, '第1章 课程介绍 ', '2018-04-01 09:58:23', 4);
INSERT INTO `courses_lesson` VALUES (20, '第2章 anaconda介绍与安装 ', '2018-04-01 09:58:23', 4);
INSERT INTO `courses_lesson` VALUES (21, '第3章 jupyter notebook简单教程 ', '2018-04-01 09:58:23', 4);
INSERT INTO `courses_lesson` VALUES (22, '第4章 numpy简单教程 ', '2018-04-01 09:58:23', 4);
INSERT INTO `courses_lesson` VALUES (23, '第1章 概述 ', '2018-04-01 09:58:23', 5);
INSERT INTO `courses_lesson` VALUES (24, '第2章 Java中的常见注解 ', '2018-04-01 09:58:23', 5);
INSERT INTO `courses_lesson` VALUES (25, '第3章 注解的分类 ', '2018-04-01 09:58:23', 5);
INSERT INTO `courses_lesson` VALUES (26, '第4章 自定义注解 ', '2018-04-01 09:58:23', 5);
INSERT INTO `courses_lesson` VALUES (27, '第5章 项目实战 ', '2018-04-01 09:58:23', 5);
INSERT INTO `courses_lesson` VALUES (28, '第6章 课程总结 ', '2018-04-01 09:58:23', 5);
INSERT INTO `courses_lesson` VALUES (29, '第1章 第一章：Python基础 ', '2018-04-01 09:58:23', 6);
INSERT INTO `courses_lesson` VALUES (30, '第2章 list:一种数据结构 ', '2018-04-01 09:58:23', 6);
INSERT INTO `courses_lesson` VALUES (31, '第3章 Python中的函数和包 ', '2018-04-01 09:58:23', 6);
INSERT INTO `courses_lesson` VALUES (32, '第4章 一个用python实现的科学计算包-Numpy ', '2018-04-01 09:58:23', 6);
INSERT INTO `courses_lesson` VALUES (33, '第5章 应用Matplotlib来作图 ', '2018-04-01 09:58:23', 6);
INSERT INTO `courses_lesson` VALUES (34, '第6章 控制流和pandas ', '2018-04-01 09:58:23', 6);
INSERT INTO `courses_lesson` VALUES (35, '第1章 课程简介', '2018-04-01 09:58:23', 7);
INSERT INTO `courses_lesson` VALUES (36, '第2章 资源合并与压缩', '2018-04-01 09:58:23', 7);
INSERT INTO `courses_lesson` VALUES (37, '第3章 图片相关的优化', '2018-04-01 09:58:23', 7);
INSERT INTO `courses_lesson` VALUES (38, '第4章 css 和 js 的装载与执行', '2018-04-01 09:58:23', 7);
INSERT INTO `courses_lesson` VALUES (39, '第5章 懒加载与预加载', '2018-04-01 09:58:23', 7);
INSERT INTO `courses_lesson` VALUES (40, '第6章 重绘与回流', '2018-04-01 09:58:23', 7);
INSERT INTO `courses_lesson` VALUES (41, '第7章 浏览器存储', '2018-04-01 09:58:23', 7);
INSERT INTO `courses_lesson` VALUES (42, '第8章 缓存优化', '2018-04-01 09:58:23', 7);
INSERT INTO `courses_lesson` VALUES (43, '第9章 SSR（服务端渲染）', '2018-04-01 09:58:23', 7);
INSERT INTO `courses_lesson` VALUES (44, '第1章 课程介绍 ', '2018-04-01 09:58:23', 8);
INSERT INTO `courses_lesson` VALUES (45, '第2章 线性回归原理 ', '2018-04-01 09:58:23', 8);
INSERT INTO `courses_lesson` VALUES (46, '第3章 Python实现线性回归 ', '2018-04-01 09:58:23', 8);
INSERT INTO `courses_lesson` VALUES (47, '第4章 课程总结 ', '2018-04-01 09:58:23', 8);
INSERT INTO `courses_lesson` VALUES (48, '第1章 图的基本概念 ', '2018-04-01 09:58:23', 9);
INSERT INTO `courses_lesson` VALUES (49, '第2章 图的存储结构、遍历方式及最小生成树算法原理 ', '2018-04-01 09:58:23', 9);
INSERT INTO `courses_lesson` VALUES (50, '第3章 图的基本操作与遍历 ', '2018-04-01 09:58:23', 9);
INSERT INTO `courses_lesson` VALUES (51, '第4章 图的最小生成树算法 ', '2018-04-01 09:58:23', 9);

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(0) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_video_lesson_id_59f2396e_fk_courses_lesson_id`(`lesson_id`) USING BTREE,
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES (1, '1-1 Python面向对象-课程介绍', '2018-04-01 10:00:00', 11, 'http://193.112.138.50/', 25);
INSERT INTO `courses_video` VALUES (2, ' 2-1 Python-面向对象概念', '2018-04-01 10:00:00', 12, 'http://193.112.138.51/', 28);
INSERT INTO `courses_video` VALUES (3, ' 3-1 用Python定义类 ', '2018-04-01 09:59:59', 13, 'http://193.112.138.52/', 31);
INSERT INTO `courses_video` VALUES (4, ' 3-2 Python面向对象-定义类的属性 ', '2018-04-01 09:59:59', 13, 'http://193.112.138.53/', 34);
INSERT INTO `courses_video` VALUES (5, ' 3-3 Python面向对象-定义类的方法 ', '2018-04-01 09:59:59', 13, 'http://193.112.138.54/', 37);
INSERT INTO `courses_video` VALUES (6, ' 3-4 Python面向对象-类的继承 ', '2018-04-01 09:59:59', 13, 'http://193.112.138.55/', 40);
INSERT INTO `courses_video` VALUES (7, ' 3-5 类的多态 ', '2018-04-01 09:59:59', 13, 'http://193.112.138.56/', 43);
INSERT INTO `courses_video` VALUES (8, ' 4-1 Python面向对象-magic method简介 ', '2018-04-01 09:59:59', 14, 'http://193.112.138.57/', 46);
INSERT INTO `courses_video` VALUES (9, ' 4-2 Python面向对象-对象的实例化 ', '2018-04-01 09:59:59', 14, 'http://193.112.138.58/', 49);
INSERT INTO `courses_video` VALUES (10, ' 4-3 Python面向对象-类与运算符 ', '2018-04-01 09:59:59', 14, 'http://193.112.138.59/', 52);
INSERT INTO `courses_video` VALUES (11, ' 4-4 Python面向对象-类的展现', '2018-04-01 09:59:59', 14, 'http://193.112.138.60/', 55);
INSERT INTO `courses_video` VALUES (12, ' 4-5 Python面向对象-类的属性控制', '2018-04-01 09:59:59', 14, 'http://193.112.138.61/', 58);
INSERT INTO `courses_video` VALUES (13, ' 5-1 Python面向对象-课程总结', '2018-04-01 09:59:59', 15, 'http://193.112.138.62/', 61);
INSERT INTO `courses_video` VALUES (14, ' 1-1 Python入门课程介绍', '2018-04-01 09:59:59', 1, 'http://193.112.138.63/', 64);
INSERT INTO `courses_video` VALUES (15, ' 2-1 选择Python版本 (00:51)', '2018-04-01 09:59:59', 2, 'http://193.112.138.64/', 67);
INSERT INTO `courses_video` VALUES (16, ' 2-2 Windows上安装Python (02:22)', '2018-04-01 09:59:59', 2, 'http://193.112.138.65/', 70);
INSERT INTO `courses_video` VALUES (17, ' 2-3 第一个Python程序 (02:33)', '2018-04-01 09:59:59', 2, 'http://193.112.138.66/', 73);
INSERT INTO `courses_video` VALUES (18, ' 3-1 Python中数据类型', '2018-04-01 09:59:59', 3, 'http://193.112.138.67/', 76);
INSERT INTO `courses_video` VALUES (19, ' 3-2 Python之print语句', '2018-04-01 09:59:59', 3, 'http://193.112.138.68/', 79);
INSERT INTO `courses_video` VALUES (20, ' 3-3 Python的注释', '2018-04-01 09:59:59', 3, 'http://193.112.138.69/', 82);
INSERT INTO `courses_video` VALUES (21, ' 3-4 Python中什么是变量', '2018-04-01 09:59:59', 3, 'http://193.112.138.70/', 85);
INSERT INTO `courses_video` VALUES (22, ' 3-5 Python中定义字符串', '2018-04-01 09:59:59', 3, 'http://193.112.138.71/', 88);
INSERT INTO `courses_video` VALUES (23, ' 3-6 Python中raw字符串与多行字符串', '2018-04-01 09:59:59', 3, 'http://193.112.138.72/', 91);
INSERT INTO `courses_video` VALUES (24, ' 3-7 Python中Unicode字符串', '2018-04-01 09:59:59', 3, 'http://193.112.138.73/', 94);
INSERT INTO `courses_video` VALUES (25, ' 3-8 Python中整数和浮点数', '2018-04-01 09:59:59', 3, 'http://193.112.138.74/', 97);
INSERT INTO `courses_video` VALUES (26, ' 3-9 Python中布尔类型', '2018-04-01 09:59:59', 3, 'http://193.112.138.75/', 100);
INSERT INTO `courses_video` VALUES (27, ' 4-1 Python创建list', '2018-04-01 09:59:59', 4, 'http://193.112.138.76/', 103);
INSERT INTO `courses_video` VALUES (28, ' 4-2 Python按照索引访问list', '2018-04-01 09:59:59', 4, 'http://193.112.138.77/', 106);
INSERT INTO `courses_video` VALUES (29, ' 4-3 Python之倒序访问list', '2018-04-01 09:59:59', 4, 'http://193.112.138.78/', 109);
INSERT INTO `courses_video` VALUES (30, ' 4-4 Python之添加新元素', '2018-04-01 09:59:59', 4, 'http://193.112.138.79/', 112);
INSERT INTO `courses_video` VALUES (31, ' 4-5 Python从list删除元素', '2018-04-01 09:59:59', 4, 'http://193.112.138.80/', 115);
INSERT INTO `courses_video` VALUES (32, ' 4-6 Python中替换元素', '2018-04-01 09:59:59', 4, 'http://193.112.138.81/', 118);
INSERT INTO `courses_video` VALUES (33, ' 4-7 Python之创建tuple', '2018-04-01 09:59:59', 4, 'http://193.112.138.82/', 121);
INSERT INTO `courses_video` VALUES (34, ' 4-8 Python之创建单元素tuple', '2018-04-01 09:59:59', 4, 'http://193.112.138.83/', 124);
INSERT INTO `courses_video` VALUES (35, ' 4-9 Python之“可变”的tuple', '2018-04-01 09:59:59', 4, 'http://193.112.138.84/', 127);
INSERT INTO `courses_video` VALUES (36, ' 5-1 Python之if语句', '2018-04-01 09:59:59', 5, 'http://193.112.138.85/', 130);
INSERT INTO `courses_video` VALUES (37, ' 5-2 Python之 if-else', '2018-04-01 09:59:59', 5, 'http://193.112.138.86/', 133);
INSERT INTO `courses_video` VALUES (38, ' 5-3 Python之 if-elif-else', '2018-04-01 09:59:59', 5, 'http://193.112.138.87/', 136);
INSERT INTO `courses_video` VALUES (39, ' 5-4 Python之 for循环', '2018-04-01 09:59:59', 5, 'http://193.112.138.88/', 139);
INSERT INTO `courses_video` VALUES (40, ' 5-5 Python之 while循环', '2018-04-01 09:59:59', 5, 'http://193.112.138.89/', 142);
INSERT INTO `courses_video` VALUES (41, ' 5-6 Python之 break退出循环', '2018-04-01 09:59:59', 5, 'http://193.112.138.90/', 145);
INSERT INTO `courses_video` VALUES (42, ' 5-7 Python之 continue继续循环', '2018-04-01 09:59:59', 5, 'http://193.112.138.91/', 148);
INSERT INTO `courses_video` VALUES (43, ' 5-8 Python之 多重循环', '2018-04-01 09:59:59', 5, 'http://193.112.138.92/', 120);
INSERT INTO `courses_video` VALUES (44, ' 6-1 Python之什么是dict', '2018-04-01 09:59:59', 6, 'http://193.112.138.93/', 120);
INSERT INTO `courses_video` VALUES (45, ' 6-2 Python之访问dict', '2018-04-01 09:59:59', 6, 'http://193.112.138.94/', 120);
INSERT INTO `courses_video` VALUES (46, ' 6-3 Python中dict的特点', '2018-04-01 09:59:59', 6, 'http://193.112.138.95/', 120);
INSERT INTO `courses_video` VALUES (47, ' 6-4 Python更新dict', '2018-04-01 09:59:59', 6, 'http://193.112.138.96/', 120);
INSERT INTO `courses_video` VALUES (48, ' 6-5 Python之 遍历dict', '2018-04-01 09:59:59', 6, 'http://193.112.138.97/', 120);
INSERT INTO `courses_video` VALUES (49, ' 6-6 Python中什么是set', '2018-04-01 09:59:59', 6, 'http://193.112.138.98/', 120);
INSERT INTO `courses_video` VALUES (50, ' 6-7 Python之 访问set', '2018-04-01 09:59:59', 6, 'http://193.112.138.99/', 120);
INSERT INTO `courses_video` VALUES (51, ' 6-8 Python之 set的特点', '2018-04-01 09:59:59', 6, 'http://193.112.138.100/', 120);
INSERT INTO `courses_video` VALUES (52, ' 6-9 Python之 遍历set', '2018-04-01 09:59:59', 6, 'http://193.112.138.101/', 120);
INSERT INTO `courses_video` VALUES (53, ' 6-10 Python之 更新set', '2018-04-01 09:59:59', 6, 'http://193.112.138.102/', 120);
INSERT INTO `courses_video` VALUES (54, ' 7-1 Python之什么是函数', '2018-04-01 09:59:59', 7, 'http://193.112.138.103/', 120);
INSERT INTO `courses_video` VALUES (55, ' 7-2 Python之调用函数', '2018-04-01 09:59:59', 7, 'http://193.112.138.104/', 120);
INSERT INTO `courses_video` VALUES (56, ' 7-3 Python之编写函数', '2018-04-01 09:59:59', 7, 'http://193.112.138.105/', 120);
INSERT INTO `courses_video` VALUES (57, ' 7-4 Python函数之返回多值', '2018-04-01 09:59:59', 7, 'http://193.112.138.106/', 120);
INSERT INTO `courses_video` VALUES (58, ' 7-5 Python之递归函数', '2018-04-01 09:59:59', 7, 'http://193.112.138.107/', 120);
INSERT INTO `courses_video` VALUES (59, ' 7-6 Python之定义默认参数', '2018-04-01 09:59:59', 7, 'http://193.112.138.108/', 120);
INSERT INTO `courses_video` VALUES (60, ' 7-7 Python之定义可变参数', '2018-04-01 09:59:59', 7, 'http://193.112.138.109/', 120);
INSERT INTO `courses_video` VALUES (61, ' 8-1 对list进行切片', '2018-04-01 09:59:59', 8, 'http://193.112.138.110/', 120);
INSERT INTO `courses_video` VALUES (62, ' 8-2 倒序切片', '2018-04-01 09:59:59', 8, 'http://193.112.138.111/', 120);
INSERT INTO `courses_video` VALUES (63, ' 8-3 对字符串切片', '2018-04-01 09:59:59', 9, 'http://193.112.138.112/', 120);
INSERT INTO `courses_video` VALUES (64, ' 9-1 什么是迭代', '2018-04-01 09:59:59', 9, 'http://193.112.138.113/', 120);
INSERT INTO `courses_video` VALUES (65, ' 9-2 索引迭代', '2018-04-01 09:59:59', 9, 'http://193.112.138.114/', 120);
INSERT INTO `courses_video` VALUES (66, ' 9-3 迭代dict的value', '2018-04-01 09:59:59', 9, 'http://193.112.138.115/', 120);
INSERT INTO `courses_video` VALUES (67, ' 9-4 迭代dict的key和value', '2018-04-01 09:59:59', 9, 'http://193.112.138.116/', 120);
INSERT INTO `courses_video` VALUES (68, ' 10-1 生成列表', '2018-04-01 09:59:59', 10, 'http://193.112.138.117/', 120);
INSERT INTO `courses_video` VALUES (69, ' 10-2 复杂表达式', '2018-04-01 09:59:59', 10, 'http://193.112.138.118/', 120);
INSERT INTO `courses_video` VALUES (70, ' 10-3 条件过滤', '2018-04-01 09:59:59', 10, 'http://193.112.138.119/', 120);
INSERT INTO `courses_video` VALUES (71, ' 10-4 多层表达式', '2018-04-01 09:59:59', 10, 'http://193.112.138.120/', 120);
INSERT INTO `courses_video` VALUES (72, ' 1-1 django初体检课程介绍 (04:32)', '2018-04-01 09:59:59', 16, 'http://193.112.138.121/', 120);
INSERT INTO `courses_video` VALUES (73, ' 1-2 django环境搭建 (09:22)', '2018-04-01 09:59:59', 16, 'http://193.112.138.122/', 120);
INSERT INTO `courses_video` VALUES (74, ' 2-1 django之创建工程及应用（一） (14:12)', '2018-04-01 09:59:59', 17, 'http://193.112.138.123/', 120);
INSERT INTO `courses_video` VALUES (75, ' 2-2 django之创建工程及应用（二） (11:48)', '2018-04-01 09:59:59', 17, 'http://193.112.138.124/', 120);
INSERT INTO `courses_video` VALUES (76, ' 3-1 django初体检 (13:56)开始学习', '2018-04-01 09:59:59', 18, 'http://193.112.138.125/', 120);
INSERT INTO `courses_video` VALUES (77, ' 3-2 课程总结 (02:44)', '2018-04-01 09:59:59', 18, 'http://193.112.138.126/', 120);
INSERT INTO `courses_video` VALUES (78, ' 1-1 课程整体介绍 (01:05)', '2018-04-01 09:59:59', 19, 'http://193.112.138.127/', 120);
INSERT INTO `courses_video` VALUES (79, ' 2-1 anaconda介绍与安装 (02:31)', '2018-04-01 09:59:59', 20, 'http://193.112.138.128/', 120);
INSERT INTO `courses_video` VALUES (80, ' 3-1 jupyter notebook简单教程 (08:02)', '2018-04-01 09:59:59', 21, 'http://193.112.138.129/', 120);
INSERT INTO `courses_video` VALUES (81, ' 4-1 numpy简单教程-数组 (08:14)', '2018-04-01 09:59:59', 22, 'http://193.112.138.130/', 120);
INSERT INTO `courses_video` VALUES (82, ' 4-2 numpy简单教程-索引操作 (07:44)', '2018-04-01 09:59:59', 22, 'http://193.112.138.131/', 120);
INSERT INTO `courses_video` VALUES (83, ' 4-3 numpy简单教程-元素数据类型 (02:42)', '2018-04-01 09:59:59', 22, 'http://193.112.138.132/', 120);
INSERT INTO `courses_video` VALUES (84, ' 4-4 numpy简单教程-数组运算与常用函数 (12:32)', '2018-04-01 09:59:59', 22, 'http://193.112.138.133/', 120);
INSERT INTO `courses_video` VALUES (85, ' 4-5 numpy简单教程-广播 (02:48)', '2018-04-01 09:59:59', 22, 'http://193.112.138.134/', 120);
INSERT INTO `courses_video` VALUES (86, ' 1-1 Java注解概述 (03:23)', '2018-04-01 09:59:59', 23, 'http://193.112.138.135/', 120);
INSERT INTO `courses_video` VALUES (87, ' 2-1 JDK中的注解 (04:33)', '2018-04-01 09:59:59', 24, 'http://193.112.138.136/', 120);
INSERT INTO `courses_video` VALUES (88, ' 2-2 Java第三方注解 (01:34)', '2018-04-01 09:59:59', 24, 'http://193.112.138.137/', 120);
INSERT INTO `courses_video` VALUES (89, ' 3-1 Java注解的分类 (02:34)', '2018-04-01 09:59:59', 25, 'http://193.112.138.138/', 120);
INSERT INTO `courses_video` VALUES (90, ' 4-1 Java自定义注解 (03:48)', '2018-04-01 09:59:59', 26, 'http://193.112.138.139/', 120);
INSERT INTO `courses_video` VALUES (91, ' 4-2 使用自定义注解 (01:09)', '2018-04-01 09:59:59', 26, 'http://193.112.138.140/', 120);
INSERT INTO `courses_video` VALUES (92, ' 4-3 关于自定义注解的代码演示说明 (06:10)', '2018-04-01 09:59:59', 26, 'http://193.112.138.141/', 120);
INSERT INTO `courses_video` VALUES (93, ' 4-4 解析注解 (11:56)', '2018-04-01 09:59:59', 26, 'http://193.112.138.142/', 120);
INSERT INTO `courses_video` VALUES (94, ' 5-1 项目需求 (01:04)', '2018-04-01 09:59:59', 27, 'http://193.112.138.143/', 120);
INSERT INTO `courses_video` VALUES (95, ' 5-2 项目实现（上） (15:59)', '2018-04-01 09:59:59', 27, 'http://193.112.138.144/', 120);
INSERT INTO `courses_video` VALUES (96, ' 5-3 项目实现（下） (12:46)', '2018-04-01 09:59:59', 27, 'http://193.112.138.145/', 120);
INSERT INTO `courses_video` VALUES (97, ' 6-1 课程总结 (01:11)', '2018-04-01 09:59:59', 28, 'http://193.112.138.146/', 120);
INSERT INTO `courses_video` VALUES (98, ' 1-1 .你好Python (04:47)', '2018-04-01 09:59:59', 29, 'http://193.112.138.147/', 120);
INSERT INTO `courses_video` VALUES (99, ' 1-2 .Python中的变量和类型 (04:32)', '2018-04-01 09:59:59', 29, 'http://193.112.138.148/', 120);
INSERT INTO `courses_video` VALUES (100, ' 2-1 .Python中的list (04:14)', '2018-04-01 09:59:59', 30, 'http://193.112.138.149/', 120);
INSERT INTO `courses_video` VALUES (101, ' 2-2 .如何获取Python中list子集 (04:19)', '2018-04-01 09:59:59', 30, 'http://193.112.138.150/', 120);
INSERT INTO `courses_video` VALUES (102, ' 2-3 Python中list操作 (06:13)', '2018-04-01 09:59:59', 30, 'http://193.112.138.151/', 120);
INSERT INTO `courses_video` VALUES (103, ' 3-1 .Python中的函数 (06:00)', '2018-04-01 09:59:59', 31, 'http://193.112.138.152/', 120);
INSERT INTO `courses_video` VALUES (104, ' 3-2 .Python中的方法 (06:57)', '2018-04-01 09:59:59', 31, 'http://193.112.138.153/', 120);
INSERT INTO `courses_video` VALUES (105, ' 3-3 .Python中的包 (06:08)', '2018-04-01 09:59:59', 31, 'http://193.112.138.154/', 120);
INSERT INTO `courses_video` VALUES (106, ' 4-1 .Python中的包-Numpy (07:02)', '2018-04-01 09:59:59', 32, 'http://193.112.138.155/', 120);
INSERT INTO `courses_video` VALUES (107, ' 4-2 .Python-2维Numpy数组 (04:25)', '2018-04-01 09:59:59', 32, 'http://193.112.138.156/', 120);
INSERT INTO `courses_video` VALUES (108, ' 4-3 Python-Numpy的基本统计学 (04:00)', '2018-04-01 09:59:59', 32, 'http://193.112.138.157/', 120);
INSERT INTO `courses_video` VALUES (109, ' 5-1 Python-应用matplotlib来进行基本作图 (04:49)', '2018-04-01 09:59:59', 33, 'http://193.112.138.158/', 120);
INSERT INTO `courses_video` VALUES (110, ' 5-2 Python-直方图 (03:43)', '2018-04-01 09:59:59', 33, 'http://193.112.138.159/', 120);
INSERT INTO `courses_video` VALUES (111, ' 5-3 Python-个性化 (04:27)', '2018-04-01 09:59:59', 33, 'http://193.112.138.160/', 120);
INSERT INTO `courses_video` VALUES (112, ' 6-1 Python-布尔逻辑和控制流 (08:17)', '2018-04-01 09:59:59', 34, 'http://193.112.138.161/', 120);
INSERT INTO `courses_video` VALUES (113, ' 6-2 Python-pandas包 (07:12)', '2018-04-01 09:59:59', 34, 'http://193.112.138.162/', 120);
INSERT INTO `courses_video` VALUES (114, ' 1-1 课程背景 (03:54)', '2018-04-01 09:59:59', 44, 'http://193.112.138.163/', 120);
INSERT INTO `courses_video` VALUES (115, ' 1-2 课程安排 (03:19)', '2018-04-01 09:59:59', 44, 'http://193.112.138.164/', 120);
INSERT INTO `courses_video` VALUES (116, ' 2-1 什么是线性回归 (02:14)', '2018-04-01 09:59:59', 45, 'http://193.112.138.165/', 120);
INSERT INTO `courses_video` VALUES (117, ' 2-2 线性回归的数学表示 (04:07)', '2018-04-01 09:59:59', 45, 'http://193.112.138.166/', 120);
INSERT INTO `courses_video` VALUES (118, ' 2-3 最小二乘法 (03:40)', '2018-04-01 09:59:59', 45, 'http://193.112.138.167/', 120);
INSERT INTO `courses_video` VALUES (119, ' 2-4 梯度下降 (04:59)', '2018-04-01 09:59:59', 45, 'http://193.112.138.168/', 120);
INSERT INTO `courses_video` VALUES (120, ' 3-1 开发准备 (13:18)', '2018-04-01 09:59:59', 46, 'http://193.112.138.169/', 120);
INSERT INTO `courses_video` VALUES (121, ' 3-2 Python实现最小二乘法 (05:17)', '2018-04-01 09:59:59', 46, 'http://193.112.138.170/', 120);
INSERT INTO `courses_video` VALUES (122, ' 3-3 Python实现梯度下降 (05:13)', '2018-04-01 09:59:59', 46, 'http://193.112.138.171/', 120);
INSERT INTO `courses_video` VALUES (123, ' 3-4 回归分析实战 (16:31)', '2018-04-01 09:59:59', 46, 'http://193.112.138.172/', 120);
INSERT INTO `courses_video` VALUES (124, ' 4-1 课程总结 (02:02)', '2018-04-01 09:59:59', 47, 'http://193.112.138.173/', 120);
INSERT INTO `courses_video` VALUES (125, ' 1-1 课程概述 (10:15)', '2018-04-02 09:59:59', 48, 'http://193.112.138.174/', 121);
INSERT INTO `courses_video` VALUES (126, ' 2-1 图的基本概念及存储方式（一) (15:28)', '2018-04-03 09:59:59', 49, 'http://193.112.138.175/', 122);
INSERT INTO `courses_video` VALUES (127, ' 2-2 图的基本概念及存储方式（二） (06:37)', '2018-04-04 09:59:59', 49, 'http://193.112.138.176/', 123);
INSERT INTO `courses_video` VALUES (128, ' 2-3 图的遍历及最小生成树 (14:04)', '2018-04-05 09:59:59', 49, 'http://193.112.138.177/', 124);
INSERT INTO `courses_video` VALUES (129, ' 3-1 图的编码实战-图的编码说明和展示 (18:47)', '2018-04-06 09:59:59', 50, 'http://193.112.138.178/', 125);
INSERT INTO `courses_video` VALUES (130, ' 3-2 图的编码实战-图的基本操作（一） (10:10)', '2018-04-07 09:59:59', 50, 'http://193.112.138.179/', 126);
INSERT INTO `courses_video` VALUES (131, ' 3-4 图的编码实战-图的基本操作（二） (06:53)', '2018-04-08 09:59:59', 50, 'http://193.112.138.180/', 127);
INSERT INTO `courses_video` VALUES (132, ' 3-5 图的编码实战-图的深度优先遍历 (06:36)', '2018-04-09 09:59:59', 50, 'http://193.112.138.181/', 128);
INSERT INTO `courses_video` VALUES (133, ' 3-6 图的编码实战-图的广度优先遍历 (13:16)', '2018-04-10 09:59:59', 50, 'http://193.112.138.182/', 129);
INSERT INTO `courses_video` VALUES (134, ' 3-7 图的编码实战-图的编码阶段检测 (08:52)', '2018-04-11 09:59:59', 50, 'http://193.112.138.183/', 130);
INSERT INTO `courses_video` VALUES (135, ' 4-1 图的编码实战-最小生成树之普利姆算法（一） (09:01)', '2018-04-12 09:59:59', 51, 'http://193.112.138.184/', 131);
INSERT INTO `courses_video` VALUES (136, ' 4-2 图的编码实战-最小生成树之普利姆算法（二） (19:04)', '2018-04-13 09:59:59', 51, 'http://193.112.138.185/', 132);
INSERT INTO `courses_video` VALUES (137, ' 4-3 图的编码实战-最小生成树之普利姆算法（三） (09:01)', '2018-04-14 09:59:59', 51, 'http://193.112.138.186/', 133);
INSERT INTO `courses_video` VALUES (138, ' 4-4 图的编码实战-最小生成树之普利姆算法（四） (08:24)', '2018-04-15 09:59:59', 51, 'http://193.112.138.187/', 134);
INSERT INTO `courses_video` VALUES (139, ' 4-5 图的编码实战-最小生成树之克鲁斯卡尔算法（一） (07:42)', '2018-04-16 09:59:59', 51, 'http://193.112.138.188/', 135);
INSERT INTO `courses_video` VALUES (140, ' 4-6 图的编码实战-最小生成树之克鲁斯卡尔算法（二） (20:10)开始学习', '2018-04-17 09:59:59', 51, 'http://193.112.138.189/', 136);
INSERT INTO `courses_video` VALUES (141, ' 4-7 图的编码实战-最小生成树之克鲁斯卡尔算法（三） (05:10)', '2018-04-18 09:59:59', 51, 'http://193.112.138.190/', 137);
INSERT INTO `courses_video` VALUES (142, ' 4-8 图的编码实战-最小生成树之克鲁斯卡尔算法（四） (05:05)', '2018-04-19 09:59:59', 51, 'http://193.112.138.191/', 138);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(0) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (27, 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (14, 'courses', 'bannercourse');
INSERT INTO `django_content_type` VALUES (10, 'courses', 'course');
INSERT INTO `django_content_type` VALUES (11, 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES (12, 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES (13, 'courses', 'video');
INSERT INTO `django_content_type` VALUES (18, 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES (19, 'operation', 'userask');
INSERT INTO `django_content_type` VALUES (20, 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES (21, 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES (22, 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES (15, 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES (16, 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES (17, 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'users', 'banner');
INSERT INTO `django_content_type` VALUES (8, 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES (9, 'users', 'loginbanner');
INSERT INTO `django_content_type` VALUES (6, 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES (23, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (26, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (24, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (25, 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-04-03 00:17:49');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2018-04-03 00:17:49');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2018-04-03 00:17:49');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2018-04-03 00:17:49');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2018-04-03 00:17:49');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2018-04-03 00:17:49');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2018-04-03 00:17:49');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2018-04-03 00:17:49');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2018-04-03 00:17:49');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2018-04-03 00:17:49');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2018-04-03 00:17:49');
INSERT INTO `django_migrations` VALUES (12, 'users', '0001_initial', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (13, 'admin', '0001_initial', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (14, 'admin', '0002_logentry_remove_auto_add', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (15, 'captcha', '0001_initial', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (16, 'organization', '0001_initial', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (17, 'organization', '0002_auto_20180311_2059', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (18, 'organization', '0003_auto_20180312_1646', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (19, 'organization', '0004_auto_20180313_2105', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (20, 'organization', '0005_auto_20180313_2138', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (21, 'organization', '0006_auto_20180313_2337', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (22, 'organization', '0007_auto_20180313_2341', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (23, 'organization', '0008_auto_20180314_0002', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (24, 'organization', '0009_auto_20180314_1222', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (25, 'organization', '0010_teacher_image', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (26, 'organization', '0011_auto_20180314_2350', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (27, 'organization', '0012_auto_20180315_0003', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (28, 'organization', '0013_auto_20180315_0003', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (29, 'organization', '0014_auto_20180315_0004', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (30, 'courses', '0001_initial', '2018-04-03 00:17:50');
INSERT INTO `django_migrations` VALUES (31, 'courses', '0002_courseresource_lesson_video', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (32, 'courses', '0003_auto_20180311_1657', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (33, 'courses', '0004_auto_20180311_2038', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (34, 'courses', '0005_auto_20180314_1222', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (35, 'courses', '0006_course_category', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (36, 'courses', '0007_auto_20180314_2312', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (37, 'courses', '0008_course_tag', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (38, 'courses', '0009_video_url', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (39, 'courses', '0010_video_learn_times', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (40, 'courses', '0011_course_teacher', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (41, 'courses', '0012_auto_20180315_2150', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (42, 'courses', '0013_course_is_banner', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (43, 'courses', '0014_auto_20180329_1402', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (44, 'courses', '0015_auto_20180330_1055', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (45, 'courses', '0016_auto_20180331_1532', '2018-04-03 00:17:51');
INSERT INTO `django_migrations` VALUES (46, 'operation', '0001_initial', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (47, 'operation', '0002_auto_20180311_1450', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (48, 'operation', '0003_auto_20180312_1646', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (49, 'operation', '0004_auto_20180314_2304', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (50, 'organization', '0015_teacher_age', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (51, 'organization', '0016_auto_20180316_1741', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (52, 'organization', '0017_courseorg_tag', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (53, 'sessions', '0001_initial', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (54, 'users', '0002_banner_eailverifyrecord', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (55, 'users', '0003_auto_20180311_1521', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (56, 'users', '0004_auto_20180311_1649', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (57, 'users', '0005_auto_20180311_1657', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (58, 'users', '0006_auto_20180311_1708', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (59, 'users', '0007_auto_20180311_1709', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (60, 'users', '0008_userprofile_add_time', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (61, 'users', '0009_auto_20180311_2038', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (62, 'users', '0010_auto_20180313_1348', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (63, 'users', '0011_auto_20180313_1417', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (64, 'users', '0012_auto_20180313_1417', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (65, 'users', '0013_auto_20180313_1418', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (66, 'users', '0014_auto_20180313_1418', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (67, 'users', '0015_emailverifyrecord_is_active', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (68, 'users', '0016_auto_20180314_2350', '2018-04-03 00:17:52');
INSERT INTO `django_migrations` VALUES (69, 'users', '0017_auto_20180315_0003', '2018-04-03 00:17:53');
INSERT INTO `django_migrations` VALUES (70, 'users', '0018_auto_20180327_2043', '2018-04-03 00:17:53');
INSERT INTO `django_migrations` VALUES (71, 'users', '0019_auto_20180327_2240', '2018-04-03 00:17:53');
INSERT INTO `django_migrations` VALUES (72, 'users', '0020_auto_20180327_2257', '2018-04-03 00:17:53');
INSERT INTO `django_migrations` VALUES (73, 'users', '0021_auto_20180328_1447', '2018-04-03 00:17:53');
INSERT INTO `django_migrations` VALUES (74, 'users', '0022_loginbanner', '2018-04-03 00:17:53');
INSERT INTO `django_migrations` VALUES (75, 'users', '0023_auto_20180329_1952', '2018-04-03 00:17:53');
INSERT INTO `django_migrations` VALUES (76, 'users', '0024_auto_20180329_1953', '2018-04-03 00:17:53');
INSERT INTO `django_migrations` VALUES (77, 'users', '0025_auto_20180330_0037', '2018-04-03 00:17:53');
INSERT INTO `django_migrations` VALUES (78, 'users', '0026_auto_20180330_0852', '2018-04-03 00:17:53');
INSERT INTO `django_migrations` VALUES (79, 'users', '0027_auto_20180330_1055', '2018-04-03 00:17:53');
INSERT INTO `django_migrations` VALUES (80, 'users', '0028_auto_20180401_2035', '2018-04-03 00:17:53');
INSERT INTO `django_migrations` VALUES (81, 'xadmin', '0001_initial', '2018-04-03 00:17:53');
INSERT INTO `django_migrations` VALUES (82, 'xadmin', '0002_log', '2018-04-03 00:17:53');
INSERT INTO `django_migrations` VALUES (83, 'xadmin', '0003_auto_20160715_0100', '2018-04-03 00:17:53');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(0) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('g0fh5wu64sovtixi91a0e4z5s1t96zfx', 'NjIxMjAzMDYxYmNlMGU5N2ZkMzUwOGY1ZDk1YmQ0M2I3NjZmYmE1ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjEyYjgyNmZmZmMxY2MzMmZjMzJlNzExM2VhYWIxZmMzNzljNmE4MzIiLCJuYXZfbWVudSI6Ilt7XCJ0aXRsZVwiOiBcIlx1NjU1OVx1ODBiMlx1NjczYVx1Njc4NFwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NTdjZVx1NWUwMlwiLCBcInVybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL2NpdHlkaWN0L1wiLCBcImljb25cIjogXCJmYSBmYS1ob21lIFwiLCBcIm9yZGVyXCI6IDEzfSwge1widGl0bGVcIjogXCJcdTY3M2FcdTY3ODRcdTRmZTFcdTYwNmZcIiwgXCJ1cmxcIjogXCIveGFkbWluL29yZ2FuaXphdGlvbi9jb3Vyc2VvcmcvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE0fSwge1widGl0bGVcIjogXCJcdTY1NTlcdTVlMDhcdTRmZTFcdTYwNmZcIiwgXCJ1cmxcIjogXCIveGFkbWluL29yZ2FuaXphdGlvbi90ZWFjaGVyL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNX1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1ob21lIFwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9uL2NpdHlkaWN0L1wifSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTRmZTFcdTYwNmZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTRmZTFcdTYwNmZcIiwgXCJ1cmxcIjogXCIveGFkbWluL3VzZXJzL3VzZXJwcm9maWxlL1wiLCBcImljb25cIjogXCJmYSBmYS11c2VyXCIsIFwib3JkZXJcIjogM30sIHtcInRpdGxlXCI6IFwiXHU4ZjZlXHU2NGFkXHU1NmZlXCIsIFwidXJsXCI6IFwiL3hhZG1pbi91c2Vycy9iYW5uZXIvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDV9LCB7XCJ0aXRsZVwiOiBcIlx1NzY3Ylx1NWY1NVx1OGY2ZVx1NjRhZFx1NTZmZVwiLCBcInVybFwiOiBcIi94YWRtaW4vdXNlcnMvbG9naW5iYW5uZXIvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDZ9LCB7XCJ0aXRsZVwiOiBcIlx1OTBhZVx1N2JiMVx1OWE4Y1x1OGJjMVx1NzgwMVwiLCBcInVybFwiOiBcIi94YWRtaW4vdXNlcnMvZW1haWx2ZXJpZnlyZWNvcmQvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDd9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vdXNlcnMvdXNlcnByb2ZpbGUvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjRjZFx1NGY1Y1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1OGJmZVx1N2EwYlwiLCBcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL3VzZXJjb3Vyc2UvXCIsIFwiaWNvblwiOiBcImZhIGZhLXBlbmNpbCBcIiwgXCJvcmRlclwiOiAxNn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU1NGE4XHU4YmUyXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9vcGVyYXRpb24vdXNlcmFzay9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTd9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1OGJjNFx1OGJiYVwiLCBcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9uL2NvdXJzZWNvbW1lbnRzL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxOH0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NTM2XHU4NWNmXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9vcGVyYXRpb24vdXNlcmZhdm9yaXRlL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxOX0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2ZDg4XHU2MDZmXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9vcGVyYXRpb24vdXNlcm1lc3NhZ2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDIwfV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLXBlbmNpbCBcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL29wZXJhdGlvbi91c2VyY291cnNlL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIveGFkbWluL3hhZG1pbi9sb2cvXCIsIFwiaWNvblwiOiBcImZhIGZhLWNvZ1wiLCBcIm9yZGVyXCI6IDIyfV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWNvZ1wiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4veGFkbWluL2xvZy9cIn0sIHtcInRpdGxlXCI6IFwiXHU4YmE0XHU4YmMxXHU1NDhjXHU2Mzg4XHU2NzQzXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3ZWM0XCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi94YWRtaW4vYXV0aC9wZXJtaXNzaW9uL1wiLCBcImljb25cIjogXCJmYSBmYS1sb2NrXCIsIFwib3JkZXJcIjogNH1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vYXV0aC9ncm91cC9cIn0sIHtcInRpdGxlXCI6IFwiXHU4YmZlXHU3YTBiXHU3YmExXHU3NDA2XCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU4YmZlXHU3YTBiXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9jb3Vyc2VzL2NvdXJzZS9cIiwgXCJpY29uXCI6IFwiZmEgZmEtYm9va1wiLCBcIm9yZGVyXCI6IDh9LCB7XCJ0aXRsZVwiOiBcIlx1N2FlMFx1ODI4MlwiLCBcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy9sZXNzb24vXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDl9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1OGQ0NFx1NmU5MFwiLCBcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy9jb3Vyc2VyZXNvdXJjZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTB9LCB7XCJ0aXRsZVwiOiBcIlx1ODljNlx1OTg5MVwiLCBcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy92aWRlby9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTF9LCB7XCJ0aXRsZVwiOiBcIlx1OGY2ZVx1NjRhZFx1OGJmZVx1N2EwYlwiLCBcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy9iYW5uZXJjb3Vyc2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEyfV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWJvb2tcIiwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL2NvdXJzZXMvY291cnNlL1wifV0iLCJMSVNUX1FVRVJZIjpbWyJvcmdhbml6YXRpb24iLCJjb3Vyc2VvcmciXSwiIl19', '2018-04-17 01:43:25');

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(0) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id`(`course_id`) USING BTREE,
  INDEX `operation_coursecomm_user_id_f5ff70b3_fk_users_use`(`user_id`) USING BTREE,
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(0) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id`(`course_id`) USING BTREE,
  INDEX `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES (1, '2018-04-03 01:48:42', 1, 1);

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(0) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES (1, 8, 2, '2018-04-03 01:40:03', 1);

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------
INSERT INTO `operation_usermessage` VALUES (1, 1, '欢迎注册iLearn!!', 1, '2018-04-03 01:17:21');

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES (1, '北京', '简称“京”，是中华人民共和国的首都、直辖市、国家中心城市、超大城市、国际大都市，全国政治中心、文化中心、国际交往中心、科技创新中心', '2018-03-31 23:03:00');
INSERT INTO `organization_citydict` VALUES (2, '珠海', '广东省地级市，珠江三角洲中心城市之一，东南沿海重要的风景旅游城市', '2018-03-31 23:03:00');
INSERT INTO `organization_citydict` VALUES (3, '深圳', '简称“深”，别称“鹏城”，古称南越、新安、宝安，是中国四大一线城市之一，为广东省省辖市、计划单列市、副省级市、国家区域中心城市、超大城市', '2018-03-31 23:04:00');
INSERT INTO `organization_citydict` VALUES (4, '广州', '简称穗，别称羊城、花城，是广东省省会、副省级市、国家中心城市、超大城市、国际大都市、国际商贸中心、国际综合交通枢纽、国家综合性门户城市，首批沿海开放城市，也是南部战区司令部驻地', '2018-03-31 23:04:00');
INSERT INTO `organization_citydict` VALUES (5, '上海', '简称“沪”或“申”，是中国共产党的诞生地，中华人民共和国直辖市，国家中心城市，超大城市，沪杭甬大湾区核心城市，国际经济、金融、贸易、航运、科技创新中心，首批沿海开放城市', '2018-03-31 23:04:00');
INSERT INTO `organization_citydict` VALUES (6, '杭州', '简称“杭”，浙江省省会，位于中国东南沿海、浙江省北部、钱塘江下游、京杭大运河南端，副省级市，是浙江省的政治、经济、文化、教育、交通和金融中心，长江三角洲城市群中心城市之一', '2018-03-31 23:04:00');
INSERT INTO `organization_citydict` VALUES (7, '武汉', '简称“汉”，别称“江城”，是湖北省省会、中部六省唯一的副省级市和特大城市', '2018-03-31 23:05:00');
INSERT INTO `organization_citydict` VALUES (8, '成都', '成都，简称蓉，别称蓉城、锦城，是四川省省会，西南地区唯一一个副省级市，特大城市，国家重要的高新技术产业基地、商贸物流中心和综合交通枢纽，西部地区重要的中心城市', '2018-03-31 23:05:00');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `add_time` datetime(0) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `address` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organization_courseo_city_id_4a842f85_fk_organizat`(`city_id`) USING BTREE,
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES (1, '清华大学', '清华大学（Tsinghua University），简称“清华”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”、“世界一流大学和一流学科”，', 36, 0, 'org/2018/04/清华_Gonv7um.png', '2018-03-31 23:31:00', 1, 'college', 3, 0, '海淀区清华园', '全国知名');
INSERT INTO `organization_courseorg` VALUES (2, '北京大学', '简称“北大”，诞生于1898年，初名京师大学堂，是中国近代第一所国立大学，也是最早以“大学”之名创办的学校，其成立标志着中国近代高等教育的开端。', 0, 0, 'org/2018/04/北京大学_WKNxqp8.png', '2018-04-01 23:30:59', 1, 'college', 0, 0, '海淀区颐和园路', '名牌大学');
INSERT INTO `organization_courseorg` VALUES (3, '中山大学', '由孙中山先生创办，有着一百多年办学传统，是中国南方科学研究、文化学术与人才培养的重镇。', 0, 0, 'org/2018/04/中山大学_NP6Vx95.png', '2018-04-02 23:30:59', 4, 'college', 0, 0, '海珠区新港西路', '名牌大学');
INSERT INTO `organization_courseorg` VALUES (4, '浙江大学', '坐落于“人间天堂”杭州。前身是1897年创建的求是书院，是中国人自己最早创办的新式高等学校之一。', 0, 0, 'org/2018/04/浙江_5kqB7WH.png', '2018-04-03 23:30:59', 6, 'college', 0, 0, '西湖区余杭塘路', '名牌大学');
INSERT INTO `organization_courseorg` VALUES (5, '武汉大学', '简称“武大”，是一所位于湖北武汉市的中国重点综合研究型大学，其办学源头溯源于清朝末期1893年湖广总督张之洞奏请清政府创办的自强学堂，', 0, 0, 'org/2018/04/武汉大学_nNRl9pZ.png', '2018-04-04 23:30:59', 7, 'college', 0, 0, '市武昌区珞珈山街', '名牌大学');
INSERT INTO `organization_courseorg` VALUES (6, '复旦大学', '简称“复旦”，位于中国上海，由中华人民共和国教育部直属，中央直管副部级建制，位列985工程、211工程、双一流A类，入选“珠峰计划”、“111计划”、“2011计划”、“卓越医生教育培养计划”', 0, 0, 'org/2018/04/复旦大学_sRcmGuv.png', '2018-04-05 23:30:59', 5, 'college', 0, 0, '上海市杨浦区', '名牌大学');
INSERT INTO `organization_courseorg` VALUES (7, '四川大学', '简称“川大”，由中华人民共和国教育部直属，中央直管副部级建制，国家“双一流”A类世界一流大学，“985工程”、“211工程”重点建设的高水平综合性全国重点大学，', 0, 0, 'org/2018/04/四川大学_8fzXeQW.png', '2018-04-06 23:30:59', 8, 'college', 0, 0, '成都市环路南', '名牌大学');
INSERT INTO `organization_courseorg` VALUES (8, 'iLearnOL', 'IT技能学习平台。提供了丰富的移动端开发、php开发、web前端、android开发以及html5等视频教程资源公开课', 2, 1, 'org/2018/04/iLearnOL_zap4UIj.png', '2018-04-07 23:30:59', 2, 'college', 6, 1, '广东珠海香洲区', '全国知名');
INSERT INTO `organization_courseorg` VALUES (9, '武当派', '武当派传说中的开山祖师是元、明之际的张三丰，他的生平众说纷纭，大致说来，他是辽东懿州人，本名是张全一，一名君宝，号三丰，因为不修边幅，又被称为「张邋遢」。他天资聪敏，过目不忘，与人言谈，专以道德、仁义、忠孝为本，并无虚诞欺诳於人，因而修练成「心与神通，神与道一，事事皆有先见之理」的境地。平时行止不定，或穿山走石或铺云卧雪，所以人们视他为神仙中人。', 0, 0, 'org/2018/04/武当_doJ1MhB.png', '2018-04-08 23:30:59', 7, 'agency ', 0, 0, '湖北武当山', '名门正派');
INSERT INTO `organization_courseorg` VALUES (10, '华南理工大学', '华南理工大学（South China University of Technology），简称华南理工，位于广东省广州市，创建于1934年，是中华人民共和国教育部直属的全国重点大学、首批国家“双一流”、“211工程”、“985工程”重点建设院校之一，入选“千人计划”、“111计划”、“卓越工程师教育培养计划”、“卓越法律人才教育培养计划”和“国家双创示范基地”，也是“建筑老八校”、“卓越大学联盟”、“中俄工科大学联盟”、“中欧工程教育平台”、“中英大学工程教育与研究联盟”主要成员。 [1]', 0, 0, 'org/2018/04/华南理工大学_o7K6qqK.png', '2018-04-09 23:30:59', 4, 'college', 0, 0, '广州市天河区', '名牌大学');
INSERT INTO `organization_courseorg` VALUES (11, '少林派', '武林第一门派，无论在历史上还是武侠小说中都被视为中华武学的泰斗。少林寺僧众习武源远流长。早在北魏年间少林建寺初期，即有武装僧众保卫寺庙财产。隋朝末年，天下大乱，群雄混战，割据洛阳的王世充与占据关中的李世民在嵩山一带厮杀。少林寺洞察时局，决定站在李世民一边。寺僧率众以拒伪师，帮了一代英主的大忙。李家天下坐稳后，少林寺“屡被恩宠”，还被特准建立武装僧兵。从此，少林寺形成育经拜佛与练武并重的传统。', 0, 0, 'org/2018/04/少林_LHzf5J2.png', '2018-04-10 23:30:59', 3, 'agency ', 0, 0, '少林寺', '名门正派');
INSERT INTO `organization_courseorg` VALUES (12, '古墓派', '因居住古墓而得名。当年，全真教始祖王重阳举义师反抗金兵，建造了一座石墓存放军粮物资，其中机关众多。义兴起失败后，王重阳愤而隐居古墓，自称“活死人”，意思是虽生犹死，与金人不共戴天。女侠林朝英对他一往情深，叹惜他一副大好身手埋没在坟墓之中，便使激将法将他骗出石墓，二人携手同闯江湖。但王重阳于邦国之仇难以忘怀，常言‘匈奴未灭，何以家为？’对林朝英的深情厚意装痴乔呆，林朝英却以为王重阳瞧她不起，终于在终南山与他比武决胜，以智斗力赢得石墓这个赌注。从此住在墓中，终身未曾复出。', 0, 0, 'org/2018/04/古墓_ouNmag5.png', '2018-04-11 23:30:59', 5, 'agency ', 0, 0, '古墓', '神雕侠侣');
INSERT INTO `organization_courseorg` VALUES (13, '峨眉派', '中国武术流派之一，以四川峨眉山为发祥地。峨眉武术的渊源，尚未考查清楚，据明代一些记载来看，大约是在少林拳术的基础上，结合四川地方自然风物的特点而形成的。在明代，峨眉派武术肯定已经形成了自己的技法和风格。明未有峨眉山僧普恩禅师所传的“峨眉枪法”，后有白眉道人所传的白眉拳、绿鸭道人所传的鸭开拳等。对于峨眉派的源流和技术体系，现代武学界说法不一：有人将四川境内流传的黄林派、余门拳、白眉拳等土生土长的拳术作为峨眉拳的基本内容；另有人将近代以来四川流传的僧、岳、杜、赵、洪、化、字、会等八门，黄林、点易、铁佛、青城、青牛等五派，统归为峨眉派。武侠小说中所描述的峨眉派，早期主要受还珠楼主的影响，基本纳入能吞吐飞剑、上天入地的剑仙系列，后为简略，在一定程度上参阅了今峨眉武功的特点，创造出峨眉剑派、青城剑派等以清秀灵巧或诡异奇崛为特点的武功。', 0, 0, 'org/2018/04/峨眉_DuZPXpB.png', '2018-04-12 23:30:59', 8, 'agency ', 0, 0, '四川峨眉山', '名门正派');
INSERT INTO `organization_courseorg` VALUES (14, '全真教', '道教分支之一。道教系东汉初年张道陵创于终南山，并不曾有武技，直到东晋元帝年间，全真祖师许真人出，始别立门户。许真人俗名青阳，中年出家学道，十八年后道成，开功超凡入圣，曾在黄河连斩蛟龙三条，声名大震。其后，全真教武术一脉放出异采，直到南宁，历凡十七代掌门至清虚散人，约三百年不衰。', 0, 0, 'org/2018/04/全真_j4CBdha.png', '2018-04-13 23:30:59', 1, 'agency ', 0, 0, '重阳宫', '名门正派');
INSERT INTO `organization_courseorg` VALUES (15, '丐帮', '天下第一大武林帮派，由遍布天下的乞丐组成。在武侠小说家构筑的江湖世界里，自唐代迄清代，均有丐帮的存在，绵延达数百上千年，可谓历史悠久。丐帮形似散乱，实则组织十分严密，弟子们十分忠诚，纪律管辖极严。除帮主为一帮之尊外，另设长老数人，分舵多处，其弟子地位高下一般以背负口袋的多少而论，九袋最高，一袋为最低。丐帮主往往武功高强，但又非天下第一。丐帮的最大本领是弟子散布四方，随时随地能够组织起队伍投入战斗，而且跟踪放哨，监视敌情，更是丐帮的过人之处。因此举凡大侠们欲要完成某件功泽武林的大事时，一般都找丐帮协助，而丐帮也向来义薄云天，为了正义和友情不惜抛头颅洒热血。丐帮的级成人员是社会地位最低的人群，但他们个个铮铮硬骨，品格高尚，极少出现卑劣之徒，因此在诸多武侠小说家浩若烟海的作品中，大约唯有丐帮一直作为正面角色出现，方为真正的“名门正派”。其余自少林、武当以降，无不曾被写成难破权欲关的反面形象。这或许表现了武侠小说家们的平民意识：一则热衷于除暴安良、行侠仗义、抑强扶弱的开侠小说创作的作家们，本就天然具有浓烈的平民意识，尊重百姓而蔑视权威；二则丐帮要永远成其为丐帮，自然须一直餐风露宿，行走于荒郊野外街头巷尾，它的存在便决定了它不变的意识。对于丐帮的内组成，不同的小说家说法略异了著名的丐帮帮主可以说是金庸笔下的洪七公和黄蓉（见《射雕英雄传》、《神雕侠侣》）。', 0, 0, 'org/2018/04/丐帮_A6JQDx3.png', '2018-04-14 23:30:59', 7, 'agency ', 0, 0, '太湖之北', '全国知名');
INSERT INTO `organization_courseorg` VALUES (16, '个人', '无', 0, 0, 'org/2018/04/iLearnOL_0Q4WeG6.png', '2018-04-09 23:30:59', 3, 'person', 0, 0, '广东深圳', '个人');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_postion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `points` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(0) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organization_teacher_org_id_cd000a1a_fk_organizat`(`org_id`) USING BTREE,
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES (1, 'MARK', 3, '科技公司', '全栈工程师', '幽默、有趣', 56, 0, '2018-04-01 01:00:00', 8, 'teacher/2018/04/MARK_3oh25TV.jpg', 25);
INSERT INTO `organization_teacher` VALUES (2, 'Emma', 4, '保密', '全栈工程师', '超过4年的python开发经验', 51, 0, '2018-04-02 00:59:59', 1, 'teacher/2018/04/u13734117773992091759fm27gp0_FW6HRXl.jpg', 27);
INSERT INTO `organization_teacher` VALUES (3, 'Hailey', 5, 'Linux系统工程师', 'Linux系统工程师', '互联网公司后端开发攻城狮', 53, 0, '2018-04-03 00:59:59', 8, 'teacher/2018/04/u3085457410713082895fm27gp0_3r0Nkaf.jpg', 28);
INSERT INTO `organization_teacher` VALUES (4, '扬帆远航', 6, '科技公司', '全栈工程师', '10年开发经验', 49, 0, '2018-04-04 00:59:59', 8, 'teacher/2018/04/u20300129861102835514fm200gp0_TO2b1FJ.jpg', 32);
INSERT INTO `organization_teacher` VALUES (5, 'Kenny', 7, '高校', '数据科学家', '作为一个带领拥有20人团队成功完成多个全球项目的leader,', 50, 0, '2018-04-05 00:59:59', 1, 'teacher/2018/04/u31250016292596498572fm27gp0_v3ajz6r.jpg', 28);

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_banner
-- ----------------------------
INSERT INTO `users_banner` VALUES (1, '1', 'banner/2018/04/人工智能_8S1WpIL.jpg', 'http://193.112.138.50/courses/detail/4/', 1, '2018-04-03 01:37:00');
INSERT INTO `users_banner` VALUES (2, '2', 'banner/2018/04/Python_logo_l39au5O.jpg', 'http://193.112.138.50/courses/detail/1/', 2, '2018-04-03 01:38:00');
INSERT INTO `users_banner` VALUES (3, '4', 'banner/2018/04/编程_LL0jyZF.jpg', 'http://193.112.138.50/courses/detail/9/', 4, '2018-04-03 01:38:00');
INSERT INTO `users_banner` VALUES (4, '5', 'banner/2018/04/CoinMeet区块链世界的全新入口-2_LtJsJlm.png', 'http://193.112.138.50/courses/detail/6/', 5, '2018-04-03 01:39:00');
INSERT INTO `users_banner` VALUES (5, '3', 'banner/2018/04/django-allauth_7Ehpvst.png', 'http://193.112.138.50/courses/detail/3/', 1, '2018-04-03 01:40:00');

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `send_time` datetime(0) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES (1, 'E4C11e2xL6l63CN38mnh54QMK8vF2Fpc', '496294776@qq.com', 'register', '2018-04-03 01:17:21', 0);

-- ----------------------------
-- Table structure for users_loginbanner
-- ----------------------------
DROP TABLE IF EXISTS `users_loginbanner`;
CREATE TABLE `users_loginbanner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_loginbanner
-- ----------------------------
INSERT INTO `users_loginbanner` VALUES (1, '1', 'banner/2018/04/code_RVo1wVy.png', 'http://193.112.138.50/org/home/8/', 1, '2018-04-03 01:39:00');
INSERT INTO `users_loginbanner` VALUES (2, '2', 'banner/2018/04/大数据分析平的概念-94008157_WYaXKEK.jpg', 'http://193.112.138.50/courses/detail/6/', 2, '2018-04-03 01:41:00');
INSERT INTO `users_loginbanner` VALUES (3, '3', 'banner/2018/04/octoverse1_YywFyt9.png', 'http://193.112.138.50/org/teacher/detail/1/', 3, '2018-04-03 01:41:00');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(0) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(0) NOT NULL,
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `add_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES (1, 'pbkdf2_sha256$100000$loKUUvaDen6l$9BCFwJfRqnfdd6Z3F3zROWY/2RoEWZWPFNJTZBSoiDk=', '2018-04-03 01:45:07', 1, '496294776@qq.com', '', '', '496294776@qq.com', 1, 1, '2018-04-03 01:17:21', '还没想好名字', NULL, '', '', NULL, 'image/2018/04/default.png', '2018-04-03 01:17:21');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq`(`userprofile_id`, `group_id`) USING BTREE,
  INDEX `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq`(`userprofile_id`, `permission_id`) USING BTREE,
  INDEX `users_userprofile_us_permission_id_393136b6_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_bookmark_content_type_id_60941679_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(0) NOT NULL,
  `ip_addr` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_log_user_id_bb16a176_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES (1, '2018-04-03 01:26:16', '223.73.145.50', '15', '丐帮', 'change', '修改 category 和 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (2, '2018-04-03 01:26:43', '223.73.145.50', '14', '全真教', 'change', '修改 category 和 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (3, '2018-04-03 01:28:26', '223.73.145.50', '13', '峨眉派', 'change', '修改 category 和 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (4, '2018-04-03 01:29:05', '223.73.145.50', '12', '古墓派', 'change', '修改 category 和 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (5, '2018-04-03 01:29:25', '223.73.145.50', '1', '清华大学', 'change', '修改 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (6, '2018-04-03 01:29:35', '223.73.145.50', '11', '少林派', 'change', '修改 category 和 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (7, '2018-04-03 01:29:43', '223.73.145.50', '10', '华南理工大学', 'change', '修改 desc 和 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (8, '2018-04-03 01:29:53', '223.73.145.50', '9', '武当派', 'change', '修改 category 和 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (9, '2018-04-03 01:29:59', '223.73.145.50', '8', 'iLearnOL', 'change', '修改 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (10, '2018-04-03 01:30:11', '223.73.145.50', '7', '四川大学', 'change', '修改 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (11, '2018-04-03 01:30:21', '223.73.145.50', '6', '复旦大学', 'change', '修改 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (12, '2018-04-03 01:30:30', '223.73.145.50', '5', '武汉大学', 'change', '修改 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (13, '2018-04-03 01:30:42', '223.73.145.50', '4', '浙江大学', 'change', '修改 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (14, '2018-04-03 01:30:55', '223.73.145.50', '3', '中山大学', 'change', '修改 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (15, '2018-04-03 01:31:59', '223.73.145.50', '5', 'Kenny老师', 'change', '修改 image', 17, 1);
INSERT INTO `xadmin_log` VALUES (16, '2018-04-03 01:32:12', '223.73.145.50', '1', 'MARK老师', 'change', '修改 image', 17, 1);
INSERT INTO `xadmin_log` VALUES (17, '2018-04-03 01:32:26', '223.73.145.50', '4', '扬帆远航老师', 'change', '修改 image', 17, 1);
INSERT INTO `xadmin_log` VALUES (18, '2018-04-03 01:32:35', '223.73.145.50', '3', 'Hailey老师', 'change', '修改 image', 17, 1);
INSERT INTO `xadmin_log` VALUES (19, '2018-04-03 01:32:45', '223.73.145.50', '2', 'Emma老师', 'change', '修改 image', 17, 1);
INSERT INTO `xadmin_log` VALUES (20, '2018-04-03 01:32:58', '223.73.145.50', '2', 'Emma老师', 'change', '修改 image', 17, 1);
INSERT INTO `xadmin_log` VALUES (21, '2018-04-03 01:38:22', '223.73.145.50', '1', '1', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (22, '2018-04-03 01:38:43', '223.73.145.50', '2', '2', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (23, '2018-04-03 01:39:18', '223.73.145.50', '3', '4', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (24, '2018-04-03 01:40:01', '223.73.145.50', '4', '5', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (25, '2018-04-03 01:41:07', '223.73.145.50', '1', '1', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (26, '2018-04-03 01:41:10', '223.73.145.50', '5', '3', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (27, '2018-04-03 01:41:42', '223.73.145.50', '2', '2', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (28, '2018-04-03 01:42:17', '223.73.145.50', '3', '3', 'create', '已添加。', 9, 1);
INSERT INTO `xadmin_log` VALUES (29, '2018-04-03 01:43:25', '223.73.145.50', '2', '北京大学', 'change', '修改 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (30, '2018-04-03 01:43:25', '223.73.145.50', '2', '北京大学', 'change', '修改 image', 16, 1);
INSERT INTO `xadmin_log` VALUES (31, '2018-04-03 01:46:02', '223.73.145.50', '16', '个人', 'change', '修改 image', 16, 1);

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES (1, 'dashboard:home:pos', '', 1);
INSERT INTO `xadmin_usersettings` VALUES (2, 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', 1);

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `widget_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
