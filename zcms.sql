﻿# Host: localhost  (Version: 5.5.53)
# Date: 2019-05-09 09:21:12
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "lz_article"
#

CREATE TABLE `lz_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT '50',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `keywords` varchar(200) DEFAULT NULL COMMENT '关键字',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `attr` varchar(50) DEFAULT NULL COMMENT '属性',
  `cate_id` mediumint(9) NOT NULL COMMENT '所属栏目',
  `picture` varchar(250) DEFAULT NULL COMMENT '封面图',
  `reviewed` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核',
  `click` mediumint(9) NOT NULL COMMENT '点击',
  `content` longtext NOT NULL COMMENT '内容',
  `pattern_id` varchar(255) DEFAULT NULL,
  `photos` tinyint(1) DEFAULT '0',
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "lz_article"
#


#
# Structure for table "lz_attr"
#

CREATE TABLE `lz_attr` (
  `attr_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `attr_name` varchar(10) NOT NULL,
  `attr_value` varchar(5) NOT NULL,
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "lz_attr"
#

INSERT INTO `lz_attr` VALUES (1,'推荐','r'),(2,'热门','h'),(3,'头条','t'),(4,'置顶','s');

#
# Structure for table "lz_auth_group"
#

CREATE TABLE `lz_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "lz_auth_group"
#

INSERT INTO `lz_auth_group` VALUES (7,'超级管理员',1,'13,18,20,19,22,37,25,36,35,28,29,30,31,32,33,34'),(8,'网站管理员',1,'13,18,19,31,32,33,34'),(9,'文章管理员',1,'32,34'),(10,'SEO管理',1,'18,20,31,32,34');

#
# Structure for table "lz_auth_group_access"
#

CREATE TABLE `lz_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "lz_auth_group_access"
#

INSERT INTO `lz_auth_group_access` VALUES (1,7),(102,9);

#
# Structure for table "lz_auth_rule"
#

CREATE TABLE `lz_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

#
# Data for table "lz_auth_rule"
#

INSERT INTO `lz_auth_rule` VALUES (13,'admin/User/index','管理员列表',1,''),(18,'admin/System/index','系统列表',1,''),(19,'admin/System/saveSystem','修改系统',1,''),(20,'admin/SiteMap/index','网站地图',1,''),(22,'admin/Rulers/index','权限列表',1,''),(25,'admin/Group/index','权限组列表',1,''),(28,'admin/Group/delete','删除权限组',1,''),(29,'admin/Fore/index','模板选择',1,''),(30,'admin/ConfigField/index','字段管理',1,''),(31,'admin/Conf/index','网站设置',1,''),(32,'admin/Cate/index','栏目管理',1,''),(33,'admin/Backup/index','数据库管理',1,''),(34,'admin/Article/index','文章管理',1,''),(35,'admin/Pattern/index','模型管理',1,''),(36,'admin/Rank/index','百度排名',1,''),(37,'admin/Push/index','百度推送',1,''),(38,'admin/Link/index','友链管理',1,''),(39,'admin/Message/index','留言管理',1,'');

#
# Structure for table "lz_banner"
#

CREATE TABLE `lz_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `banner_img` varchar(200) DEFAULT NULL,
  `banner_link` varchar(200) DEFAULT NULL,
  `cate_id` int(11) NOT NULL,
  `sort` mediumint(9) NOT NULL DEFAULT '50',
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "lz_banner"
#


#
# Structure for table "lz_cate"
#

CREATE TABLE `lz_cate` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(50) NOT NULL COMMENT '栏目名称',
  `seo_cate` varchar(50) DEFAULT NULL COMMENT 'seo标题',
  `cate_keywords` varchar(150) DEFAULT NULL COMMENT '栏目关键词',
  `cate_desc` varchar(255) DEFAULT NULL COMMENT '栏目描述',
  `cate_img` varchar(200) DEFAULT NULL COMMENT '栏目图片',
  `pattern_id` mediumint(9) unsigned DEFAULT NULL,
  `cate_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `cate_pid` mediumint(9) NOT NULL DEFAULT '0' COMMENT '父栏目id',
  `cate_sort` int(5) NOT NULL DEFAULT '50' COMMENT '排序',
  `temp_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '栏目类型1.列表2单页3连接',
  `out_url` varchar(100) DEFAULT NULL,
  `index_temp` varchar(50) NOT NULL COMMENT '单页模板',
  `list_temp` varchar(50) NOT NULL COMMENT '列表模板',
  `article_temp` varchar(50) NOT NULL COMMENT '类别内容模板',
  `page` tinyint(2) DEFAULT '12' COMMENT '分页',
  `list_order` tinyint(1) unsigned DEFAULT '1' COMMENT '1.id 2.时间3.sort',
  `order_by` tinyint(1) unsigned DEFAULT '1' COMMENT '1 升序 2 降序',
  `cate_content` longtext NOT NULL COMMENT '单页内容',
  `copy` mediumint(9) DEFAULT '0' COMMENT '复制栏目次数',
  `create_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `cate_pid` (`cate_pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "lz_cate"
#


#
# Structure for table "lz_config_field"
#

CREATE TABLE `lz_config_field` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cn_name` varchar(30) DEFAULT NULL COMMENT '中文名',
  `en_name` varchar(30) DEFAULT NULL COMMENT '英文名',
  `value` varchar(200) DEFAULT NULL COMMENT '默认值',
  `values` varchar(255) NOT NULL COMMENT '可选值 用于select checkbox',
  `field_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.输入框2.单选3.复选4.下拉菜单5.文本域6.文件',
  `flexd` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.可删除，0.不可删除',
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_type` (`field_type`),
  KEY `en_name` (`en_name`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

#
# Data for table "lz_config_field"
#

INSERT INTO `lz_config_field` VALUES (55,'网站名称','web_name','网站名称','',1,1,1555310574),(65,'关键字','keywords','','',1,1,1555319975),(66,'描述','desc','','',5,1,1555319992),(67,'网站logo','logo','','',6,1,1555320009),(68,'备案号','beian','','',1,1,1555320043),(69,'版权','copy_right','','',1,1,1555320062),(70,'电话','phone','','',1,1,1555320074),(71,'地址','address','','',1,1,1555320084);

#
# Structure for table "lz_fore"
#

CREATE TABLE `lz_fore` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `fore` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "lz_fore"
#

INSERT INTO `lz_fore` VALUES (1,'moban');

#
# Structure for table "lz_link"
#

CREATE TABLE `lz_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(50) DEFAULT NULL,
  `link_href` varchar(200) DEFAULT NULL,
  `open_type` tinyint(1) DEFAULT '1',
  `no_follow` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "lz_link"
#

INSERT INTO `lz_link` VALUES (2,'百度','https://www.baidu.com',1,1);

#
# Structure for table "lz_message"
#

CREATE TABLE `lz_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `content` text,
  `type_id` tinyint(1) NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "lz_message"
#


#
# Structure for table "lz_movie"
#

CREATE TABLE `lz_movie` (
  `art_id` mediumint(9) DEFAULT NULL,
  `movieType` varchar(250) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `cptime` varchar(250) DEFAULT NULL,
  `longtime` varchar(10) DEFAULT NULL,
  `xcbanner` varchar(250) DEFAULT NULL,
  `downpath` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "lz_movie"
#


#
# Structure for table "lz_movie_field"
#

CREATE TABLE `lz_movie_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `en_name` varchar(20) DEFAULT NULL,
  `cn_name` varchar(20) DEFAULT NULL,
  `value` text,
  `values` text,
  `length` smallint(6) DEFAULT NULL,
  `sort` mediumint(6) DEFAULT '12',
  `create_time` int(10) DEFAULT NULL,
  `field_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "lz_movie_field"
#

INSERT INTO `lz_movie_field` VALUES (1,'movieType','影片类型','大陆','大陆,港台,日韩,欧美',250,12,1555573431,2),(2,'company','出品公司','','',100,12,1555573458,1),(3,'cptime','出品时间','','',250,12,1555573478,8),(4,'longtime','影片时长','','',10,12,1555573505,1),(5,'xcbanner','宣传海报','','',250,12,1555573536,6),(6,'downpath','下载地址','','',300,12,1555573581,1);

#
# Structure for table "lz_news"
#

CREATE TABLE `lz_news` (
  `art_id` mediumint(9) DEFAULT NULL,
  `auth` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "lz_news"
#


#
# Structure for table "lz_news_field"
#

CREATE TABLE `lz_news_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `en_name` varchar(20) DEFAULT NULL,
  `cn_name` varchar(20) DEFAULT NULL,
  `value` text,
  `values` text,
  `length` smallint(6) DEFAULT NULL,
  `sort` mediumint(6) DEFAULT '12',
  `create_time` int(10) DEFAULT NULL,
  `field_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "lz_news_field"
#

INSERT INTO `lz_news_field` VALUES (1,'auth','作者','admin','',50,12,1555573224,1);

#
# Structure for table "lz_pattern"
#

CREATE TABLE `lz_pattern` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `table_name` varchar(20) DEFAULT NULL,
  `add_table` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `selected` tinyint(3) DEFAULT '0' COMMENT '1 默认 2 非默认',
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "lz_pattern"
#

INSERT INTO `lz_pattern` VALUES (1,'新闻模型','news','news_field',1,1,1555573131),(2,'电影模型','movie','movie_field',1,0,1555573192),(3,'商城模型','shop','shop_field',1,0,1555573723);

#
# Structure for table "lz_photos"
#

CREATE TABLE `lz_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  `art_id` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

#
# Data for table "lz_photos"
#


#
# Structure for table "lz_shop"
#

CREATE TABLE `lz_shop` (
  `art_id` mediumint(9) DEFAULT NULL,
  `productno` varchar(50) DEFAULT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `unit` varchar(250) DEFAULT NULL,
  `weight` varchar(10) DEFAULT NULL,
  `marketprice` varchar(10) DEFAULT NULL,
  `shopprice` varchar(10) DEFAULT NULL,
  `psalenum` varchar(10) DEFAULT NULL,
  `pay` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "lz_shop"
#


#
# Structure for table "lz_shop_field"
#

CREATE TABLE `lz_shop_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `en_name` varchar(20) DEFAULT NULL,
  `cn_name` varchar(20) DEFAULT NULL,
  `value` text,
  `values` text,
  `length` smallint(6) DEFAULT NULL,
  `sort` mediumint(6) DEFAULT '12',
  `create_time` int(10) DEFAULT NULL,
  `field_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Data for table "lz_shop_field"
#

INSERT INTO `lz_shop_field` VALUES (1,'productno','商品编号','','',50,12,1555573755,1),(2,'brand','品牌','','',20,12,1555573780,1),(3,'unit','计量单位','kg','k,kg',250,12,1555634989,4),(4,'weight','单位重量','','',10,12,1555573848,1),(5,'marketprice','市场价','','',10,12,1555573921,1),(6,'shopprice','商城价','','',10,12,1555573914,1),(7,'psalenum','销售量','','',10,12,1555573948,1),(8,'pay','支付方式','','微信,支付宝,银联,汇款,线下',50,12,1555574017,3);

#
# Structure for table "lz_system"
#

CREATE TABLE `lz_system` (
  `id` smallint(6) NOT NULL,
  `image_type` varchar(100) NOT NULL DEFAULT '' COMMENT '图片类型',
  `image_size` int(11) NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_type` varchar(100) DEFAULT NULL COMMENT '文件类型',
  `file_size` int(11) DEFAULT NULL COMMENT '文件大小',
  `is_code` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0.关闭1.图片水印 2文字水印 ',
  `image_code` varchar(200) NOT NULL COMMENT '图片水印地址',
  `text_code` varchar(50) NOT NULL COMMENT '文字水印信息',
  `code_south` tinyint(4) NOT NULL DEFAULT '1' COMMENT '水印方位',
  `image_issue` int(11) NOT NULL DEFAULT '100' COMMENT '水印透明度',
  `text_color` varchar(20) NOT NULL COMMENT '文字水印颜色',
  `text_size` mediumint(9) NOT NULL COMMENT '文字水印大小',
  `article_order` tinyint(1) DEFAULT '1' COMMENT '1.时间排序 2.自定义排序',
  `order_by` tinyint(1) DEFAULT '1' COMMENT '1.升序2.降序',
  `baidu` varchar(100) DEFAULT NULL,
  `login_site` tinyint(1) DEFAULT '0' COMMENT '是否允许多地登录0不允许1允许',
  `cache` mediumint(9) DEFAULT '0' COMMENT '0无限制时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "lz_system"
#

INSERT INTO `lz_system` VALUES (1,'jpg,png,gif',10000000,'pdf,docx',5000000,0,'uploads/water/20190416/53ef9b047316331a8c0d5094dbd4b7cd.png','Z-CMS',5,100,'#7c8d99',15,1,1,'Uh3bPqonA9eApDQv',1,0);

#
# Structure for table "lz_user"
#

CREATE TABLE `lz_user` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `pass` varchar(40) DEFAULT NULL,
  `login_ip` varchar(20) DEFAULT NULL,
  `login_count` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '1' COMMENT '1 正常 0 禁用',
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "lz_user"
#

INSERT INTO `lz_user` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','127.0.0.1','11','1',1555049421);
