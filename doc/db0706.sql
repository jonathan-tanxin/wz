CREATE DATABASE  IF NOT EXISTS `wz` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `wz`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 120.77.151.136    Database: wz
-- ------------------------------------------------------
-- Server version	5.5.52-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL COMMENT '用户',
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人',
  `mobile` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
  `province_id` bigint(20) NOT NULL COMMENT '省',
  `city_id` bigint(20) NOT NULL COMMENT '城市',
  `district_id` bigint(20) NOT NULL COMMENT '地区',
  `distributionCenter_id` bigint(20) DEFAULT NULL COMMENT '配送中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收货地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,'大侠','15074921644','麓谷',20,181,1798,1),(2,3,'谭鑫','18508499494','企鹅对方的身上',20,181,1798,2),(3,2,'大侠','15074921231','测试',20,181,1798,2),(4,4,'好','15074926134','的',20,181,1796,2),(5,5,'哥哥','13517402828','长沙市雨花区左家塘',20,181,1800,1),(6,6,'过','15078461321','给',20,181,1796,2),(7,7,'大侠','15074613214','和',20,181,1796,2),(8,8,'客服','13677890987','湖南省长沙市岳麓区性能绝对绝对绝对',20,181,1803,12);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_authority_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_authority_id`),
  CONSTRAINT `parent` FOREIGN KEY (`parent_authority_id`) REFERENCES `authority` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1082 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES (1,NULL,'系统管理','manager'),(101,1,'用户管理','user'),(201,1,'角色管理','manage.role'),(301,1,'权限管理','manage.auth'),(1021,101,'新增用户','user.add'),(1022,NULL,'微信用户管理','customer'),(1023,1022,'查看微信用户','customer.list'),(1024,1022,'新增微信用户','customer.add'),(1025,1022,'修改微信用户','customer.update'),(1026,1022,'删除微信用户','customer.delete'),(1027,NULL,'菜品类别管理','category'),(1028,1027,'查看菜品类别','category.list'),(1029,1027,'新增菜品类别','category.add'),(1030,1027,'修改菜品类别','category.update'),(1031,1027,'删除菜品类别','category.delete'),(1032,NULL,'讲座管理','course'),(1033,1032,'查看讲座','course.list'),(1034,1032,'新增讲座','course.add'),(1035,1032,'修改讲座','course.update'),(1036,1032,'删除讲座','course.delete'),(1037,NULL,'菜品管理','dish'),(1038,1037,'查看菜品','dish.list'),(1039,1037,'新增菜品','dish.add'),(1040,1037,'修改菜品','dish.update'),(1041,1037,'删除菜品','dish.delete'),(1042,NULL,'会员卡管理','card'),(1043,1042,'查看会员卡','card.list'),(1044,1042,'新增会员卡','card.add'),(1045,1042,'修改会员卡','card.update'),(1046,1042,'删除会员卡','card.delete'),(1047,NULL,'用户会员卡管理','customerCard'),(1048,1047,'查看用户会员卡','customerCard.list'),(1049,1047,'新增用户会员卡','customerCard.add'),(1050,1047,'修改用户会员卡','customerCard.update'),(1051,1047,'删除用户会员卡','customerCard.delete'),(1052,NULL,'配送中心管理','distributionCenter'),(1053,1052,'查看配送中心','distributionCenter.list'),(1054,1052,'新增配送中心','distributionCenter.add'),(1055,1052,'修改配送中心','distributionCenter.update'),(1056,1052,'删除配送中心','distributionCenter.delete'),(1057,NULL,'订单管理','order'),(1058,1057,'查看订单','order.list'),(1059,1057,'新增订单','order.add'),(1060,1057,'修改订单','order.update'),(1061,1057,'删除订单','order.delete'),(1062,NULL,'订单明细管理','orderItem'),(1063,1062,'查看订单明细','orderItem.list'),(1064,1062,'新增订单明细','orderItem.add'),(1065,1062,'修改订单明细','orderItem.update'),(1066,1062,'删除订单明细','orderItem.delete'),(1067,NULL,'交易管理','pay'),(1068,1067,'查看交易','pay.list'),(1069,1067,'新增交易','pay.add'),(1070,1067,'修改交易','pay.update'),(1071,1067,'删除交易','pay.delete'),(1072,NULL,'收货地址管理','address'),(1073,1072,'查看收货地址','address.list'),(1074,1072,'新增收货地址','address.add'),(1075,1072,'修改收货地址','address.update'),(1076,1072,'删除收货地址','address.delete'),(1077,NULL,'用户余量详情管理','customerBalanceDetail'),(1078,1077,'查看用户余量详情','customerBalanceDetail.list'),(1079,1077,'新增用户余量详情','customerBalanceDetail.add'),(1080,1077,'修改用户余量详情','customerBalanceDetail.update'),(1081,1077,'删除用户余量详情','customerBalanceDetail.delete');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bizconfig`
--

DROP TABLE IF EXISTS `bizconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bizconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '参数名',
  `value` text COMMENT '参数值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `isRichText` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是富文本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bizconfig`
--

LOCK TABLES `bizconfig` WRITE;
/*!40000 ALTER TABLE `bizconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `bizconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '会员卡名称',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `type` int(11) NOT NULL COMMENT '类型，1购菜，2购水',
  `months` int(11) NOT NULL COMMENT '月数（6个月，1年）',
  `money` double NOT NULL COMMENT '购卡金额',
  `amount` double NOT NULL COMMENT '购菜斤数',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,'菜品','1年100斤无公害菜',1,12,3000,100,0),(2,'桶装水','1年40桶桶装水',2,12,3000,100,0),(3,'测试会员卡','6个月，可购买100斤',1,6,0.01,100,0),(4,'测试会员卡2','购水',2,6,0.01,20,0);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类别名称',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `isdel` int(11) NOT NULL COMMENT '是否删除标志',
  `isWater` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是桶装水',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜品类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'农产品','http://n3.image.pg0.cn/T1KLJtB4LM1RCvBVdK.jpg',0,0),(2,'水果','http://n1.image.pg0.cn/T1FVx0Bjd41RCvBVdK.jpg',0,0),(3,'桶装水','http://n3.image.pg0.cn/T11NY_Bsxl1RCvBVdK.jpg',0,1),(4,'水菜','http://7xjd68.com1.z0.glb.clouddn.com/d6e0400d-eacf-43bc-83a5-2727930e4cea',1,0),(5,'水菜','http://7xjd68.com1.z0.glb.clouddn.com/3dc48542-3dfc-43b0-a22f-5eda657b34d7',0,0),(6,'叶子菜','http://7xjd68.com1.z0.glb.clouddn.com/28071a50-3aeb-44dc-9911-894c14251a2e',0,0),(7,'肉','http://7xjd68.com1.z0.glb.clouddn.com/93edfea7-638c-4c2a-b4cb-6041847e0304',0,0),(8,'其它','http://7xjd68.com1.z0.glb.clouddn.com/31f96a48-73d0-4562-81af-27ec1b65d33f',0,0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL COMMENT '名称',
  `province_id` bigint(20) DEFAULT NULL COMMENT '省份',
  `isHot` tinyint(4) DEFAULT '0' COMMENT '是否是热门城市',
  `fullletter` varchar(50) DEFAULT NULL COMMENT '全拼音',
  `letter` varchar(1) DEFAULT NULL COMMENT '首字母',
  `hasCenter` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有配送中心',
  PRIMARY KEY (`id`),
  KEY `province_id_idx` (`province_id`),
  CONSTRAINT `province_id` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'北京市',3,1,NULL,NULL,0),(2,'石家庄市',5,0,NULL,NULL,0),(3,'唐山市',5,1,NULL,NULL,0),(4,'秦皇岛市',5,0,'qinhuangdaoshi','q',0),(5,'邯郸市',5,0,'handanshi','h',0),(6,'邢台市',5,0,'xingtaishi','x',0),(7,'保定市',5,0,'baodingshi','b',0),(8,'张家口市',5,0,'zhangjiakoushi','z',0),(9,'承德市',5,0,'chengdeshi','c',0),(10,'沧州市',5,0,'cangzhoushi','c',0),(11,'廊坊市',5,0,'langfangshi','l',0),(12,'衡水市',5,0,'hengshuishi','h',0),(13,'太原市',6,0,'taiyuanshi','t',0),(14,'大同市',6,0,'datongshi','d',0),(15,'阳泉市',6,0,'yangquanshi','y',0),(16,'长治市',6,0,'zhangzhishi','z',0),(17,'晋城市',6,0,'jinchengshi','j',0),(18,'朔州市',6,0,'shuozhoushi','s',0),(19,'晋中市',6,0,'jinzhongshi','j',0),(20,'运城市',6,0,'yunchengshi','y',0),(21,'忻州市',6,0,'xinzhoushi','x',0),(22,'临汾市',6,0,'linfenshi','l',0),(23,'吕梁市',6,0,'lvliangshi','l',0),(24,'呼和浩特市',7,0,'huhehaoteshi','h',0),(25,'包头市',7,0,'baotoushi','b',0),(26,'乌海市',7,0,'wuhaishi','w',0),(27,'赤峰市',7,0,'chifengshi','c',0),(28,'通辽市',7,0,'tongliaoshi','t',0),(29,'鄂尔多斯市',7,0,'eerduosishi','e',0),(30,'呼伦贝尔市',7,0,'hulunbeiershi','h',0),(31,'巴彦淖尔市',7,0,'bayannaoershi','b',0),(32,'乌兰察布市',7,0,'wulanchabushi','w',0),(33,'兴安盟',7,0,'xinganmeng','x',0),(34,'锡林郭勒盟',7,0,'xilinguolemeng','x',0),(35,'阿拉善盟',7,0,'alashanmeng','a',0),(36,'沈阳市',8,0,'shenyangshi','s',0),(37,'大连市',8,0,'dalianshi','d',0),(38,'鞍山市',8,0,'anshanshi','a',0),(39,'抚顺市',8,0,'fushunshi','f',0),(40,'本溪市',8,0,'benxishi','b',0),(41,'丹东市',8,0,'dandongshi','d',0),(42,'锦州市',8,0,'jinzhoushi','j',0),(43,'营口市',8,0,'yingkoushi','y',0),(44,'阜新市',8,0,'fuxinshi','f',0),(45,'辽阳市',8,0,'liaoyangshi','l',0),(46,'盘锦市',8,0,'panjinshi','p',0),(47,'铁岭市',8,0,'tielingshi','t',0),(48,'朝阳市',8,0,'chaoyangshi','c',0),(49,'葫芦岛市',8,0,'huludaoshi','h',0),(50,'长春市',9,0,'zhangchunshi','z',0),(51,'吉林市',9,0,'jilinshi','j',0),(52,'四平市',9,0,'sipingshi','s',0),(53,'辽源市',9,0,'liaoyuanshi','l',0),(54,'通化市',9,0,'tonghuashi','t',0),(55,'白山市',9,0,'baishanshi','b',0),(56,'松原市',9,0,'songyuanshi','s',0),(57,'白城市',9,0,'baichengshi','b',0),(58,'延边朝鲜族自治州',9,0,'yanbianchaoxianzuzizhizhou','y',0),(59,'哈尔滨市',10,0,'haerbinshi','h',0),(60,'齐齐哈尔市',10,0,'qiqihaershi','q',0),(61,'鸡西市',10,0,'jixishi','j',0),(62,'鹤岗市',10,0,'hegangshi','h',0),(63,'双鸭山市',10,0,'shuangyashanshi','s',0),(64,'大庆市',10,0,'daqingshi','d',0),(65,'伊春市',10,0,'yichunshi','y',0),(66,'佳木斯市',10,0,'jiamusishi','j',0),(67,'七台河市',10,0,'qitaiheshi','q',0),(68,'牡丹江市',10,0,'mudanjiangshi','m',0),(69,'黑河市',10,0,'heiheshi','h',0),(70,'绥化市',10,0,'suihuashi','s',0),(71,'大兴安岭地区',10,0,'daxinganlingdiqu','d',0),(72,'南京市',12,0,'nanjingshi','n',0),(73,'无锡市',12,0,'wuxishi','w',0),(74,'徐州市',12,0,'xuzhoushi','x',0),(75,'常州市',12,0,'changzhoushi','c',0),(76,'苏州市',12,0,'suzhoushi','s',0),(77,'南通市',12,0,'nantongshi','n',0),(78,'连云港市',12,0,'lianyungangshi','l',0),(79,'淮安市',12,0,'huaianshi','h',0),(80,'盐城市',12,0,'yanchengshi','y',0),(81,'扬州市',12,0,'yangzhoushi','y',0),(82,'镇江市',12,0,'zhenjiangshi','z',0),(83,'泰州市',12,0,'taizhoushi','t',0),(84,'宿迁市',12,0,'suqianshi','s',0),(85,'杭州市',13,0,'hangzhoushi','h',0),(86,'宁波市',13,0,'ningboshi','n',0),(87,'温州市',13,0,'wenzhoushi','w',0),(88,'嘉兴市',13,0,'jiaxingshi','j',0),(89,'湖州市',13,0,'huzhoushi','h',0),(90,'绍兴市',13,0,'shaoxingshi','s',0),(91,'金华市',13,0,'jinhuashi','j',0),(92,'衢州市',13,0,'quzhoushi','q',0),(93,'舟山市',13,0,'zhoushanshi','z',0),(94,'台州市',13,0,'taizhoushi','t',0),(95,'丽水市',13,0,'lishuishi','l',0),(96,'合肥市',14,0,'hefeishi','h',0),(97,'芜湖市',14,0,'wuhushi','w',0),(98,'蚌埠市',14,0,'bangbushi','b',0),(99,'淮南市',14,0,'huainanshi','h',0),(100,'马鞍山市',14,0,'maanshanshi','m',0),(101,'淮北市',14,0,'huaibeishi','h',0),(102,'铜陵市',14,0,'tonglingshi','t',0),(103,'安庆市',14,0,'anqingshi','a',0),(104,'黄山市',14,0,'huangshanshi','h',0),(105,'滁州市',14,0,'chuzhoushi','c',0),(106,'阜阳市',14,0,'fuyangshi','f',0),(107,'宿州市',14,0,'suzhoushi','s',0),(108,'巢湖市',14,0,'chaohushi','c',0),(109,'六安市',14,0,'liuanshi','l',0),(110,'亳州市',14,0,'bozhoushi','b',0),(111,'池州市',14,0,'chizhoushi','c',0),(112,'宣城市',14,0,'xuanchengshi','x',0),(113,'福州市',15,0,'fuzhoushi','f',0),(114,'厦门市',15,0,'shamenshi','s',0),(115,'莆田市',15,0,'putianshi','p',0),(116,'三明市',15,0,'sanmingshi','s',0),(117,'泉州市',15,0,'quanzhoushi','q',0),(118,'漳州市',15,0,'zhangzhoushi','z',0),(119,'南平市',15,0,'nanpingshi','n',0),(120,'龙岩市',15,0,'longyanshi','l',0),(121,'宁德市',15,0,'ningdeshi','n',0),(122,'南昌市',16,0,'nanchangshi','n',0),(123,'景德镇市',16,0,'jingdezhenshi','j',0),(124,'萍乡市',16,0,'pingxiangshi','p',0),(125,'九江市',16,0,'jiujiangshi','j',0),(126,'新余市',16,0,'xinyushi','x',0),(127,'鹰潭市',16,0,'yingtanshi','y',0),(128,'赣州市',16,0,'ganzhoushi','g',0),(129,'吉安市',16,0,'jianshi','j',0),(130,'宜春市',16,0,'yichunshi','y',0),(131,'抚州市',16,0,'fuzhoushi','f',0),(132,'上饶市',16,0,'shangraoshi','s',0),(133,'济南市',17,0,'jinanshi','j',0),(134,'青岛市',17,0,'qingdaoshi','q',0),(135,'淄博市',17,0,'ziboshi','z',0),(136,'枣庄市',17,0,'zaozhuangshi','z',0),(137,'东营市',17,0,'dongyingshi','d',0),(138,'烟台市',17,0,'yantaishi','y',0),(139,'潍坊市',17,0,'weifangshi','w',0),(140,'济宁市',17,0,'jiningshi','j',0),(141,'泰安市',17,0,'taianshi','t',0),(142,'威海市',17,0,'weihaishi','w',0),(143,'日照市',17,0,'rizhaoshi','r',0),(144,'莱芜市',17,0,'laiwushi','l',0),(145,'临沂市',17,0,'linyishi','l',0),(146,'德州市',17,0,'dezhoushi','d',0),(147,'聊城市',17,0,'liaochengshi','l',0),(148,'滨州市',17,0,'binzhoushi','b',0),(149,'荷泽市',17,0,'hezeshi','h',0),(150,'郑州市',18,0,'zhengzhoushi','z',0),(151,'开封市',18,0,'kaifengshi','k',0),(152,'洛阳市',18,0,'luoyangshi','l',0),(153,'平顶山市',18,0,'pingdingshanshi','p',0),(154,'安阳市',18,0,'anyangshi','a',0),(155,'鹤壁市',18,0,'hebishi','h',0),(156,'新乡市',18,0,'xinxiangshi','x',0),(157,'焦作市',18,0,'jiaozuoshi','j',0),(158,'濮阳市',18,0,'puyangshi','p',0),(159,'许昌市',18,0,'xuchangshi','x',0),(160,'漯河市',18,0,'luoheshi','l',0),(161,'三门峡市',18,0,'sanmenxiashi','s',0),(162,'南阳市',18,0,'nanyangshi','n',0),(163,'商丘市',18,0,'shangqiushi','s',0),(164,'信阳市',18,0,'xinyangshi','x',0),(165,'周口市',18,0,'zhoukoushi','z',0),(166,'驻马店市',18,0,'zhumadianshi','z',0),(167,'武汉市',19,0,'wuhanshi','w',0),(168,'黄石市',19,0,'huangshishi','h',0),(169,'十堰市',19,0,'shiyanshi','s',0),(170,'宜昌市',19,0,'yichangshi','y',0),(171,'襄樊市',19,0,'xiangfanshi','x',0),(172,'鄂州市',19,0,'ezhoushi','e',0),(173,'荆门市',19,0,'jingmenshi','j',0),(174,'孝感市',19,0,'xiaoganshi','x',0),(175,'荆州市',19,0,'jingzhoushi','j',0),(176,'黄冈市',19,0,'huanggangshi','h',0),(177,'咸宁市',19,0,'xianningshi','x',0),(178,'随州市',19,0,'suizhoushi','s',0),(179,'恩施土家族苗族自治州',19,0,'enshitujiazumiaozuzizhizhou','e',0),(180,'省直辖行政单位',19,0,'shengzhixiaxingzhengdanwei','s',0),(181,'长沙市',20,1,'zhangshashi','z',1),(182,'株洲市',20,1,NULL,NULL,0),(183,'湘潭市',20,0,NULL,NULL,0),(184,'衡阳市',20,0,'hengyangshi','h',0),(185,'邵阳市',20,1,NULL,NULL,0),(186,'岳阳市',20,0,'yueyangshi','y',0),(187,'常德市',20,0,'changdeshi','c',0),(188,'张家界市',20,0,'zhangjiajieshi','z',0),(189,'益阳市',20,0,'yiyangshi','y',0),(190,'郴州市',20,0,'chenzhoushi','c',0),(191,'永州市',20,0,'yongzhoushi','y',0),(192,'怀化市',20,0,'huaihuashi','h',0),(193,'娄底市',20,0,'loudishi','l',0),(194,'湘西土家族苗族自治州',20,0,'xiangxitujiazumiaozuzizhizhou','x',0),(195,'广州市',21,0,'guangzhoushi','g',0),(196,'韶关市',21,0,'shaoguanshi','s',0),(197,'深圳市',21,0,'shenzhenshi','s',0),(198,'珠海市',21,0,'zhuhaishi','z',0),(199,'汕头市',21,0,'shantoushi','s',0),(200,'佛山市',21,0,'foshanshi','f',0),(201,'江门市',21,0,'jiangmenshi','j',0),(202,'湛江市',21,0,'zhanjiangshi','z',0),(203,'茂名市',21,0,'maomingshi','m',0),(204,'肇庆市',21,0,'zhaoqingshi','z',0),(205,'惠州市',21,0,'huizhoushi','h',0),(206,'梅州市',21,0,'meizhoushi','m',0),(207,'汕尾市',21,0,'shanweishi','s',0),(208,'河源市',21,0,'heyuanshi','h',0),(209,'阳江市',21,0,'yangjiangshi','y',0),(210,'清远市',21,0,'qingyuanshi','q',0),(211,'东莞市',21,0,'dongguanshi','d',0),(212,'中山市',21,0,'zhongshanshi','z',0),(213,'潮州市',21,0,'chaozhoushi','c',0),(214,'揭阳市',21,0,'jieyangshi','j',0),(215,'云浮市',21,0,'yunfushi','y',0),(216,'南宁市',22,0,'nanningshi','n',0),(217,'柳州市',22,0,'liuzhoushi','l',0),(218,'桂林市',22,0,'guilinshi','g',0),(219,'梧州市',22,0,'wuzhoushi','w',0),(220,'北海市',22,0,'beihaishi','b',0),(221,'防城港市',22,0,'fangchenggangshi','f',0),(222,'钦州市',22,0,'qinzhoushi','q',0),(223,'贵港市',22,0,'guigangshi','g',0),(224,'玉林市',22,0,'yulinshi','y',0),(225,'百色市',22,0,'baiseshi','b',0),(226,'贺州市',22,0,'hezhoushi','h',0),(227,'河池市',22,0,'hechishi','h',0),(228,'来宾市',22,0,'laibinshi','l',0),(229,'崇左市',22,0,'chongzuoshi','c',0),(230,'海口市',23,0,'haikoushi','h',0),(231,'三亚市',23,0,'sanyashi','s',0),(232,'省直辖县级行政单位',23,0,'shengzhixiaxianjixingzhengdanwei','s',0),(233,'成都市',25,0,'chengdoushi','c',0),(234,'自贡市',25,0,'zigongshi','z',0),(235,'攀枝花市',25,0,'panzhihuashi','p',0),(236,'泸州市',25,0,'luzhoushi','l',0),(237,'德阳市',25,0,'deyangshi','d',0),(238,'绵阳市',25,0,'mianyangshi','m',0),(239,'广元市',25,0,'guangyuanshi','g',0),(240,'遂宁市',25,0,'suiningshi','s',0),(241,'内江市',25,0,'neijiangshi','n',0),(242,'乐山市',25,0,'leshanshi','l',0),(243,'南充市',25,0,'nanchongshi','n',0),(244,'眉山市',25,0,'meishanshi','m',0),(245,'宜宾市',25,0,'yibinshi','y',0),(246,'广安市',25,0,'guanganshi','g',0),(247,'达州市',25,0,'dazhoushi','d',0),(248,'雅安市',25,0,'yaanshi','y',0),(249,'巴中市',25,0,'bazhongshi','b',0),(250,'资阳市',25,0,'ziyangshi','z',0),(251,'阿坝藏族羌族自治州',25,0,'abazangzuqiangzuzizhizhou','a',0),(252,'甘孜藏族自治州',25,0,'ganzizangzuzizhizhou','g',0),(253,'凉山彝族自治州',25,0,'liangshanyizuzizhizhou','l',0),(254,'贵阳市',26,0,'guiyangshi','g',0),(255,'六盘水市',26,0,'liupanshuishi','l',0),(256,'遵义市',26,0,'zunyishi','z',0),(257,'安顺市',26,0,'anshunshi','a',0),(258,'铜仁地区',26,0,'tongrendiqu','t',0),(259,'黔西南布依族苗族自治',26,0,'qianxinanbuyizumiaozuzizhi','q',0),(260,'毕节地区',26,0,'bijiediqu','b',0),(261,'黔东南苗族侗族自治州',26,0,'qiandongnanmiaozudongzuzizhizhou','q',0),(262,'黔南布依族苗族自治州',26,0,'qiannanbuyizumiaozuzizhizhou','q',0),(263,'昆明市',27,0,'kunmingshi','k',0),(264,'曲靖市',27,0,'qujingshi','q',0),(265,'玉溪市',27,0,'yuxishi','y',0),(266,'保山市',27,0,'baoshanshi','b',0),(267,'昭通市',27,0,'zhaotongshi','z',0),(268,'丽江市',27,0,'lijiangshi','l',0),(269,'思茅市',27,0,'simaoshi','s',0),(270,'临沧市',27,0,'lincangshi','l',0),(271,'楚雄彝族自治州',27,0,'chuxiongyizuzizhizhou','c',0),(272,'红河哈尼族彝族自治州',27,0,'honghehanizuyizuzizhizhou','h',0),(273,'文山壮族苗族自治州',27,0,'wenshanzhuangzumiaozuzizhizhou','w',0),(274,'西双版纳傣族自治州',27,0,'xishuangbannadaizuzizhizhou','x',0),(275,'大理白族自治州',27,0,'dalibaizuzizhizhou','d',0),(276,'德宏傣族景颇族自治州',27,0,'dehongdaizujingpozuzizhizhou','d',0),(277,'怒江傈僳族自治州',27,0,'nujianglisuzuzizhizhou','n',0),(278,'迪庆藏族自治州',27,0,'diqingzangzuzizhizhou','d',0),(279,'拉萨市',28,0,'lasashi','l',0),(280,'昌都地区',28,0,'changdoudiqu','c',0),(281,'山南地区',28,0,'shannandiqu','s',0),(282,'日喀则地区',28,0,'rikazediqu','r',0),(283,'那曲地区',28,0,'neiqudiqu','n',0),(284,'阿里地区',28,0,'alidiqu','a',0),(285,'林芝地区',28,0,'linzhidiqu','l',0),(286,'西安市',29,0,'xianshi','x',0),(287,'铜川市',29,0,'tongchuanshi','t',0),(288,'宝鸡市',29,0,'baojishi','b',0),(289,'咸阳市',29,0,'xianyangshi','x',0),(290,'渭南市',29,0,'weinanshi','w',0),(291,'延安市',29,0,'yananshi','y',0),(292,'汉中市',29,0,'hanzhongshi','h',0),(293,'榆林市',29,0,'yulinshi','y',0),(294,'安康市',29,0,'ankangshi','a',0),(295,'商洛市',29,0,'shangluoshi','s',0),(296,'兰州市',30,0,'lanzhoushi','l',0),(297,'嘉峪关市',30,0,'jiayuguanshi','j',0),(298,'金昌市',30,0,'jinchangshi','j',0),(299,'白银市',30,0,'baiyinshi','b',0),(300,'天水市',30,0,'tianshuishi','t',0),(301,'武威市',30,0,'wuweishi','w',0),(302,'张掖市',30,0,'zhangyeshi','z',0),(303,'平凉市',30,0,'pingliangshi','p',0),(304,'酒泉市',30,0,'jiuquanshi','j',0),(305,'庆阳市',30,0,'qingyangshi','q',0),(306,'定西市',30,0,'dingxishi','d',0),(307,'陇南市',30,0,'longnanshi','l',0),(308,'临夏回族自治州',30,0,'linxiahuizuzizhizhou','l',0),(309,'甘南藏族自治州',30,0,'gannanzangzuzizhizhou','g',0),(310,'西宁市',31,0,'xiningshi','x',0),(311,'海东地区',31,0,'haidongdiqu','h',0),(312,'海北藏族自治州',31,0,'haibeizangzuzizhizhou','h',0),(313,'黄南藏族自治州',31,0,'huangnanzangzuzizhizhou','h',0),(314,'海南藏族自治州',31,0,'hainanzangzuzizhizhou','h',0),(315,'果洛藏族自治州',31,0,'guoluozangzuzizhizhou','g',0),(316,'玉树藏族自治州',31,0,'yushuzangzuzizhizhou','y',0),(317,'海西蒙古族藏族自治州',31,0,'haiximengguzuzangzuzizhizhou','h',0),(318,'银川市',32,0,'yinchuanshi','y',0),(319,'石嘴山市',32,0,'shizuishanshi','s',0),(320,'吴忠市',32,0,'wuzhongshi','w',0),(321,'固原市',32,0,'guyuanshi','g',0),(322,'中卫市',32,0,'zhongweishi','z',0),(323,'乌鲁木齐市',33,0,'wulumuqishi','w',0),(324,'克拉玛依市',33,0,'kelamayishi','k',0),(325,'吐鲁番地区',33,0,'tulufandiqu','t',0),(326,'哈密地区',33,0,'hamidiqu','h',0),(327,'昌吉回族自治州',33,0,'changjihuizuzizhizhou','c',0),(328,'博尔塔拉蒙古自治州',33,0,'boertalamengguzizhizhou','b',0),(329,'巴音郭楞蒙古自治州',33,0,'bayinguolengmengguzizhizhou','b',0),(330,'阿克苏地区',33,0,'akesudiqu','a',0),(331,'克孜勒苏柯尔克孜自治',33,0,'kezilesukeerkezizizhi','k',0),(332,'喀什地区',33,0,'kashendiqu','k',0),(333,'和田地区',33,0,'hetiandiqu','h',0),(334,'伊犁哈萨克自治州',33,0,'yilihasakezizhizhou','y',0),(335,'塔城地区',33,0,'tachengdiqu','t',0),(336,'阿勒泰地区',33,0,'aletaidiqu','a',0),(337,'省直辖行政单位',33,0,'shengzhixiaxingzhengdanwei','s',0),(338,'天津市',4,0,'tianjinshi','t',0),(339,'上海市',11,0,NULL,NULL,0),(340,'重庆市',24,0,'zhongqingshi','z',0);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主讲人',
  `date` datetime NOT NULL COMMENT '日期',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `href` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链接',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='讲座';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'国生开奖','http://n5.image.pg0.cn/T1T.xgBvJf1RCvBVdK.jpg','大侠','2017-02-03 00:00:00',1,'http://www.baidu.com',0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickName` varchar(45) NOT NULL COMMENT '昵称',
  `headImage` varchar(255) NOT NULL COMMENT '头像',
  `openid` varchar(255) NOT NULL COMMENT 'opened',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `lastUpdateTime` datetime NOT NULL COMMENT '最后更新时间',
  `isDishMember` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是菜品会员',
  `isWaterMember` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是桶装水会员',
  `dishLeft` int(11) NOT NULL DEFAULT '0' COMMENT '菜品剩余可购',
  `waterLeft` int(11) NOT NULL COMMENT '桶装水剩余可购',
  `inviteCode` varchar(45) NOT NULL COMMENT '邀请码',
  `isExpert` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是专家',
  `setExpertTime` datetime DEFAULT NULL COMMENT '被设置为专家的时间',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除标志',
  `recCustomer_id` bigint(20) DEFAULT NULL COMMENT '推荐人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'大侠','http://n4.image.pg0.cn/T1WwDIB5Wq1RCvBVdK.jpg','123','2015-02-02 00:00:00','2015-02-02 00:00:00',1,1,96,198,'1',1,'2015-02-02 00:00:00',0,NULL),(2,'222','http://wx.qlogo.cn/mmopen/ZwicjRxZRDiaJ5WiaTWqlwI0fAfH6mlypWSA6lrggAoiaRoLCCnkjAwzJWkfpfWRT9vgkTo1qwqLRLHRl7NoQIm53s6KEvSyTjAj/0','o4aAjws4qR8QgruupnbH7zibrHxY22222','2017-06-29 12:16:32','2017-06-29 12:16:32',0,0,0,0,'10002',0,NULL,0,NULL),(3,'谭鑫（软件外包定制服务）','http://wx.qlogo.cn/mmopen/Q3auHgzwzM6uopThrpq2ugxKFwkmPqRgiaF9qXLBPnpho7yicqPuutDPRcCXAtbJS326BYeAChU2viapa8VUYXpVubYjfmseIAUGUQhJsMZuGM/0','o4aAjwvZHw8PzV7ZpWeCWJhigDpY23','2017-06-29 12:25:39','2017-06-29 12:25:39',0,0,91,0,'10003',0,NULL,0,NULL),(4,'科文大侠','http://wx.qlogo.cn/mmopen/ZwicjRxZRDiaJ5WiaTWqlwI0fAfH6mlypWSA6lrggAoiaRoLCCnkjAwzJWkfpfWRT9vgkTo1qwqLRLHRl7NoQIm53s6KEvSyTjAj/0','o4aAjws4qR8QgruupnbH7zibrHxYxx','2017-06-30 03:43:56','2017-06-30 03:43:56',0,0,94,20,'10004',0,NULL,0,NULL),(5,'(家家农场)富硒蔬菜基地','http://wx.qlogo.cn/mmopen/KsFm3VPD7eIChShrnP7KMibaBgbmkZledXFvLSrtjyaCbgjCrEXnT2CQLdtuj0rc8EYPvdIhGXnCZb5G0Q5YWOspvT0L8eXME/0','o4aAjwjAhWmhBuMi93hwMdiIeev423','2017-07-01 05:24:58','2017-07-01 05:24:58',0,0,0,60,'10005',0,NULL,0,NULL),(6,'科文大侠','http://wx.qlogo.cn/mmopen/ZwicjRxZRDiaJ5WiaTWqlwI0fAfH6mlypWSA6lrggAoiaRoLCCnkjAwzJWkfpfWRT9vgkTo1qwqLRLHRl7NoQIm53s6KEvSyTjAj/0','o4aAjws4qR8QgruupnbH7zibrHxY5','2017-07-02 20:14:01','2017-07-02 20:14:01',0,0,300,20,'10006',0,NULL,0,NULL),(7,'科文大侠','http://wx.qlogo.cn/mmopen/ZwicjRxZRDiaJ5WiaTWqlwI0fAfH6mlypWSA6lrggAoiaRoLCCnkjAwzJWkfpfWRT9vgkTo1qwqLRLHRl7NoQIm53s6KEvSyTjAj/0','o4aAjws4qR8QgruupnbH7zibrHxY','2017-07-03 10:43:33','2017-07-03 10:43:33',0,0,200,80,'10007',0,NULL,0,NULL),(8,'谭鑫（软件外包定制服务）','http://wx.qlogo.cn/mmopen/Q3auHgzwzM6uopThrpq2ugxKFwkmPqRgiaF9qXLBPnpho7yicqPuutDPRcCXAtbJS326BYeAChU2viapa8VUYXpVubYjfmseIAUGUQhJsMZuGM/0','o4aAjwvZHw8PzV7ZpWeCWJhigDpY','2017-07-03 22:23:54','2017-07-03 22:23:54',0,0,193,60,'10008',0,NULL,0,NULL),(9,'(家家农场)富硒蔬菜基地','http://wx.qlogo.cn/mmopen/KsFm3VPD7eIChShrnP7KMibaBgbmkZledXFvLSrtjyaCbgjCrEXnT2CQLdtuj0rc8EYPvdIhGXnCZb5G0Q5YWOspvT0L8eXME/0','o4aAjwjAhWmhBuMi93hwMdiIeev4','2017-07-03 23:06:40','2017-07-03 23:06:40',0,0,0,0,'10009',0,NULL,0,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerbalancedetail`
--

DROP TABLE IF EXISTS `customerbalancedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerbalancedetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL COMMENT '用户',
  `balanceBefore` double NOT NULL COMMENT '变化前',
  `amount` double NOT NULL COMMENT '变化量',
  `balanceAfter` double NOT NULL COMMENT '变化后',
  `order_id` bigint(20) DEFAULT NULL COMMENT '关联订单',
  `time` datetime NOT NULL COMMENT '时间',
  `type` int(11) NOT NULL COMMENT '类型，1：菜品，2：桶装水',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户余量详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerbalancedetail`
--

LOCK TABLES `customerbalancedetail` WRITE;
/*!40000 ALTER TABLE `customerbalancedetail` DISABLE KEYS */;
INSERT INTO `customerbalancedetail` VALUES (1,1,100,2,98,1,'2017-06-07 07:13:46',1),(2,1,200,1,199,1,'2017-06-07 07:13:46',2),(3,1,98,2,96,2,'2017-06-07 07:13:48',1),(4,1,199,1,198,2,'2017-06-07 07:13:48',2),(5,4,100,4,96,11,'2017-06-30 03:47:01',1),(6,4,96,2,94,12,'2017-06-30 03:48:33',1),(7,3,100,2,98,16,'2017-06-30 07:53:50',1),(8,3,98,5,93,17,'2017-06-30 07:54:22',1),(9,3,93,2,91,20,'2017-07-02 01:26:23',1),(10,8,300,7,293,24,'2017-07-03 22:26:47',1),(11,8,293,1,292,26,'2017-07-04 00:06:02',1),(12,8,292,4,288,27,'2017-07-04 00:06:09',1),(13,8,288,195,93,28,'2017-07-04 00:06:23',1);
/*!40000 ALTER TABLE `customerbalancedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customercard`
--

DROP TABLE IF EXISTS `customercard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customercard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL COMMENT '用户',
  `card_id` bigint(20) NOT NULL COMMENT '会员卡',
  `money` double NOT NULL COMMENT '购买金额',
  `startTime` datetime NOT NULL COMMENT '开始时间',
  `endTime` datetime NOT NULL COMMENT '结束时间',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户和会员卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customercard`
--

LOCK TABLES `customercard` WRITE;
/*!40000 ALTER TABLE `customercard` DISABLE KEYS */;
INSERT INTO `customercard` VALUES (1,2,3,0,'2017-06-30 03:32:23','2018-06-30 03:32:23','2017-06-30 03:32:23'),(2,2,4,0,'2017-06-30 03:36:37','2018-06-30 03:36:37','2017-06-30 03:36:37'),(3,4,3,0,'2017-06-30 03:44:38','2018-06-30 03:44:38','2017-06-30 03:44:38'),(4,4,4,0,'2017-06-30 03:48:16','2018-06-30 03:48:16','2017-06-30 03:48:16'),(5,3,3,0,'2017-06-30 07:53:35','2018-06-30 07:53:35','2017-06-30 07:53:35'),(6,5,4,0,'2017-07-01 05:33:05','2018-07-01 05:33:05','2017-07-01 05:33:05'),(7,5,4,0,'2017-07-01 05:33:15','2018-07-01 05:33:15','2017-07-01 05:33:15'),(8,5,4,0,'2017-07-01 05:33:18','2018-07-01 05:33:18','2017-07-01 05:33:18'),(15,7,3,0,'2017-07-03 10:58:02','2018-07-03 10:58:02','2017-07-03 10:58:02'),(16,7,4,0,'2017-07-03 11:04:28','2018-07-03 11:04:28','2017-07-03 11:04:28'),(17,7,4,0,'2017-07-03 11:06:10','2018-07-03 11:06:10','2017-07-03 11:06:10'),(18,7,4,0,'2017-07-03 11:07:13','2018-07-03 11:07:13','2017-07-03 11:07:13'),(19,8,3,0,'2017-07-03 22:26:12','2018-07-03 22:26:12','2017-07-03 22:26:12'),(20,8,3,0,'2017-07-03 22:26:22','2018-07-03 22:26:22','2017-07-03 22:26:22'),(21,8,3,0,'2017-07-03 22:26:26','2018-07-03 22:26:26','2017-07-03 22:26:26'),(22,8,3,0,'2017-07-04 20:57:17','2018-07-04 20:57:17','2017-07-04 20:57:17'),(23,8,4,0,'2017-07-06 00:33:00','2018-07-06 00:33:00','2017-07-06 00:33:00'),(24,8,4,0,'2017-07-06 00:40:43','2018-07-06 00:40:43','2017-07-06 00:40:43'),(25,8,4,0,'2017-07-06 00:42:56','2018-07-06 00:42:56','2017-07-06 00:42:56');
/*!40000 ALTER TABLE `customercard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dish` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL COMMENT '菜品类别',
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜品名',
  `unit` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单位',
  `stock` double NOT NULL COMMENT '库存',
  `listImage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '列表页的图片',
  `images` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '图片',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `stars` int(11) NOT NULL DEFAULT '0' COMMENT '星级',
  `totalSold` int(11) NOT NULL DEFAULT '0' COMMENT '总销量',
  `monthSold` int(11) NOT NULL DEFAULT '0' COMMENT '月销量',
  `price` double NOT NULL DEFAULT '0' COMMENT '价格',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除标志',
  `isCustomerOwner` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否属于会员',
  `dishDesc` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜品介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,2,'苹果','斤',0,'http://n6.image.pg0.cn/T1puLLBQxO1RCvBVdK.jpg','http://n4.image.pg0.cn/T1dtK0BgVT1RCvBVdK.jpg,http://n2.image.pg0.cn/T1BBEPBThk1RCvBVdK.jpg','2017-02-02 00:00:00',0,100,20,230,0,0,'描述1'),(2,3,'硒水','桶',200,'http://n3.image.pg0.cn/T11NY_Bsxl1RCvBVdK.jpg','http://n3.image.pg0.cn/T11NY_Bsxl1RCvBVdK.jpg','2017-02-02 00:00:00',0,2,2,120,0,1,'描述2'),(3,6,'1','斤',0,'http://7xjd68.com1.z0.glb.clouddn.com/ddeb1aeb-d3f3-42bf-888a-92b9f4dc69d0','http://7xjd68.com1.z0.glb.clouddn.com/b8006c0d-4b92-4d13-a531-f42e2300c28b','2017-06-29 15:06:39',0,100,100,15,0,1,'描述3'),(4,7,'2','斤',0,'http://7xjd68.com1.z0.glb.clouddn.com/58934ecc-5d6b-490c-ae09-3f75c4e1a2ca','http://7xjd68.com1.z0.glb.clouddn.com/3dd0df8c-90cd-42d8-80a8-9baafef2c092','2017-06-29 15:07:09',0,100,100,16,0,1,'skdfjklsdjfkldsjflkdsjklfjdskljfkldjslfkjdslkjflkdsjfdsfds'),(5,7,'22','斤',10,'http://7xjd68.com1.z0.glb.clouddn.com/62e02d97-b11c-49c0-9a20-022cebdbd393','http://7xjd68.com1.z0.glb.clouddn.com/ea760a60-036b-4e24-8714-007698f8bbe2','2017-07-02 01:13:59',0,10,10,10,0,0,NULL),(6,5,'水菜','斤',10,'http://7xjd68.com1.z0.glb.clouddn.com/b7280195-1d05-478c-a469-09ea103e4694','http://7xjd68.com1.z0.glb.clouddn.com/76dc59c6-17f1-41f2-baf4-98a291f233b8','2017-07-04 10:00:43',0,10,2,15,1,1,'水菜很好吃'),(7,5,'水菜2','斤',10,'http://7xjd68.com1.z0.glb.clouddn.com/a9b38898-361e-4367-8a17-91f5a2b18548','http://7xjd68.com1.z0.glb.clouddn.com/6b82bf5e-b618-47fc-8ce9-03afbb416ca5','2017-07-04 16:20:39',0,10,10,15,0,1,'是发送到发送到'),(8,1,'鸡','只',10,'http://7xjd68.com1.z0.glb.clouddn.com/6b5dd99d-136c-4c98-9b46-7d9b377ffef6','http://7xjd68.com1.z0.glb.clouddn.com/f188f50a-4a18-41fe-9fda-04c392fbed3b','2017-07-05 13:50:45',1,10,100,150,0,0,'');
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributioncenter`
--

DROP TABLE IF EXISTS `distributioncenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributioncenter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL COMMENT '关联用户',
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
  `leader` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '负责人',
  `mobile` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话',
  `isdel` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除标志',
  `district_id` bigint(20) DEFAULT NULL COMMENT '地区',
  `province_id` bigint(20) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='配送中心';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributioncenter`
--

LOCK TABLES `distributioncenter` WRITE;
/*!40000 ALTER TABLE `distributioncenter` DISABLE KEYS */;
INSERT INTO `distributioncenter` VALUES (1,1,'长沙河西配送中心','长沙市','小朱','150',0,1798,20,181),(2,2,'测试配送中心','111111','科文','13541256398',0,1796,20,181),(6,5,'测试配送中心','很好进口环节考核及客户即可','范','12312312312',0,1818,20,183),(7,5,'家家农场测试','的发送到发送到发送到','的首付款','2345678',0,1,3,1),(8,5,'家家农场测试','的发送到发送到发送到','的首付款','2345678',1,1,3,1),(9,5,'家家农场测试','的发送到发送到发送到','的首付款','2345678',1,1,3,1),(12,8,'232','123','2','073188683088',0,NULL,20,181),(13,1,'sdfsfd','sdfdsfdsfdsfdsf','sdfdsfd','231234322',0,NULL,3,1);
/*!40000 ALTER TABLE `distributioncenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL COMMENT '地区名称',
  `city_id` bigint(20) NOT NULL COMMENT '城市',
  `letter` varchar(1) DEFAULT NULL COMMENT '字母',
  `fullletter` varchar(50) DEFAULT NULL COMMENT '全拼音',
  PRIMARY KEY (`id`),
  KEY `city_idx` (`city_id`),
  CONSTRAINT `city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3178 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'东城区',1,'d','dongchengqu'),(2,'西城区',1,'x','xichengqu'),(3,'崇文区',1,'c','chongwenqu'),(4,'宣武区',1,'x','xuanwuqu'),(5,'朝阳区',1,'c','chaoyangqu'),(6,'丰台区',1,'f','fengtaiqu'),(7,'石景山区',1,'s','shijingshanqu'),(8,'海淀区',1,'h','haidianqu'),(9,'门头沟区',1,'m','mentougouqu'),(10,'房山区',1,'f','fangshanqu'),(11,'通州区',1,'t','tongzhouqu'),(12,'顺义区',1,'s','shunyiqu'),(13,'昌平区',1,'c','changpingqu'),(14,'大兴区',1,'d','daxingqu'),(15,'怀柔区',1,'h','huairouqu'),(16,'平谷区',1,'p','pingguqu'),(19,'和平区',338,'h','hepingqu'),(20,'河东区',338,'h','hedongqu'),(21,'河西区',338,'h','hexiqu'),(22,'南开区',338,'n','nankaiqu'),(23,'河北区',338,'h','hebeiqu'),(24,'红桥区',338,'h','hongqiaoqu'),(25,'塘沽区',338,'t','tangguqu'),(26,'汉沽区',338,'h','hanguqu'),(27,'大港区',338,'d','dagangqu'),(28,'东丽区',338,'d','dongliqu'),(29,'西青区',338,'x','xiqingqu'),(30,'津南区',338,'j','jinnanqu'),(31,'北辰区',338,'b','beichenqu'),(32,'武清区',338,'w','wuqingqu'),(33,'宝坻区',338,'b','baochiqu'),(38,'长安区',2,'z','zhanganqu'),(39,'桥东区',2,'q','qiaodongqu'),(40,'桥西区',2,'q','qiaoxiqu'),(41,'新华区',2,'x','xinhuaqu'),(42,'井陉矿区',2,'j','jingxingkuangqu'),(43,'裕华区',2,'y','yuhuaqu'),(44,'井陉县',2,'j','jingxingxian'),(45,'正定县',2,'z','zhengdingxian'),(46,'栾城县',2,'l','luanchengxian'),(47,'行唐县',2,'x','xingtangxian'),(48,'灵寿县',2,'l','lingshouxian'),(49,'高邑县',2,'g','gaoyixian'),(50,'深泽县',2,'s','shenzexian'),(51,'赞皇县',2,'z','zanhuangxian'),(52,'无极县',2,'w','wujixian'),(53,'平山县',2,'p','pingshanxian'),(54,'元氏县',2,'y','yuanshixian'),(55,'赵县',2,'z','zhaoxian'),(56,'辛集市',2,'x','xinjishi'),(57,'藁城市',2,'g','gaochengshi'),(58,'晋州市',2,'j','jinzhoushi'),(59,'新乐市',2,'x','xinleshi'),(60,'鹿泉市',2,'l','luquanshi'),(62,'路南区',3,'l','lunanqu'),(63,'路北区',3,'l','lubeiqu'),(64,'古冶区',3,'g','guyequ'),(65,'开平区',3,'k','kaipingqu'),(66,'丰南区',3,'f','fengnanqu'),(67,'丰润区',3,'f','fengrunqu'),(68,'滦县',3,'l','luanxian'),(69,'滦南县',3,'l','luannanxian'),(70,'乐亭县',3,'l','letingxian'),(71,'迁西县',3,'q','qianxixian'),(72,'玉田县',3,'y','yutianxian'),(73,'唐海县',3,'t','tanghaixian'),(74,'遵化市',3,'z','zunhuashi'),(75,'迁安市',3,'q','qiananshi'),(77,'海港区',4,'h','haigangqu'),(78,'山海关区',4,'s','shanhaiguanqu'),(79,'北戴河区',4,'b','beidaihequ'),(80,'青龙满族自治县',4,'q','qinglongmanzuzizhixian'),(81,'昌黎县',4,'c','changlixian'),(82,'抚宁县',4,'f','funingxian'),(83,'卢龙县',4,'l','lulongxian'),(85,'邯山区',5,'h','hanshanqu'),(86,'丛台区',5,'c','congtaiqu'),(87,'复兴区',5,'f','fuxingqu'),(88,'峰峰矿区',5,'f','fengfengkuangqu'),(89,'邯郸县',5,'h','handanxian'),(90,'临漳县',5,'l','linzhangxian'),(91,'成安县',5,'c','chenganxian'),(92,'大名县',5,'d','damingxian'),(93,'涉县',5,'s','shexian'),(94,'磁县',5,'c','cixian'),(95,'肥乡县',5,'f','feixiangxian'),(96,'永年县',5,'y','yongnianxian'),(97,'邱县',5,'q','qiuxian'),(98,'鸡泽县',5,'j','jizexian'),(99,'广平县',5,'g','guangpingxian'),(100,'馆陶县',5,'g','guantaoxian'),(101,'魏县',5,'w','weixian'),(102,'曲周县',5,'q','quzhouxian'),(103,'武安市',5,'w','wuanshi'),(105,'桥东区',6,'q','qiaodongqu'),(106,'桥西区',6,'q','qiaoxiqu'),(107,'邢台县',6,'x','xingtaixian'),(108,'临城县',6,'l','linchengxian'),(109,'内丘县',6,'n','neiqiuxian'),(110,'柏乡县',6,'b','boxiangxian'),(111,'隆尧县',6,'l','longyaoxian'),(112,'任县',6,'r','renxian'),(113,'南和县',6,'n','nanhexian'),(114,'宁晋县',6,'n','ningjinxian'),(115,'巨鹿县',6,'j','juluxian'),(116,'新河县',6,'x','xinhexian'),(117,'广宗县',6,'g','guangzongxian'),(118,'平乡县',6,'p','pingxiangxian'),(119,'威县',6,'w','weixian'),(120,'清河县',6,'q','qinghexian'),(121,'临西县',6,'l','linxixian'),(122,'南宫市',6,'n','nangongshi'),(123,'沙河市',6,'s','shaheshi'),(125,'新市区',7,'x','xinshiqu'),(126,'北市区',7,'b','beishiqu'),(127,'南市区',7,'n','nanshiqu'),(128,'满城县',7,'m','manchengxian'),(129,'清苑县',7,'q','qingyuanxian'),(130,'涞水县',7,'l','laishuixian'),(131,'阜平县',7,'f','fupingxian'),(132,'徐水县',7,'x','xushuixian'),(133,'定兴县',7,'d','dingxingxian'),(134,'唐县',7,'t','tangxian'),(135,'高阳县',7,'g','gaoyangxian'),(136,'容城县',7,'r','rongchengxian'),(137,'涞源县',7,'l','laiyuanxian'),(138,'望都县',7,'w','wangdouxian'),(139,'安新县',7,'a','anxinxian'),(140,'易县',7,'y','yixian'),(141,'曲阳县',7,'q','quyangxian'),(142,'蠡县',7,'l','lixian'),(143,'顺平县',7,'s','shunpingxian'),(144,'博野县',7,'b','boyexian'),(145,'雄县',7,'x','xiongxian'),(146,'涿州市',7,'z','zhuozhoushi'),(147,'定州市',7,'d','dingzhoushi'),(148,'安国市',7,'a','anguoshi'),(149,'高碑店市',7,'g','gaobeidianshi'),(151,'桥东区',8,'q','qiaodongqu'),(152,'桥西区',8,'q','qiaoxiqu'),(153,'宣化区',8,'x','xuanhuaqu'),(154,'下花园区',8,'x','xiahuayuanqu'),(155,'宣化县',8,'x','xuanhuaxian'),(156,'张北县',8,'z','zhangbeixian'),(157,'康保县',8,'k','kangbaoxian'),(158,'沽源县',8,'g','guyuanxian'),(159,'尚义县',8,'s','shangyixian'),(160,'蔚县',8,'y','yuxian'),(161,'阳原县',8,'y','yangyuanxian'),(162,'怀安县',8,'h','huaianxian'),(163,'万全县',8,'w','wanquanxian'),(164,'怀来县',8,'h','huailaixian'),(165,'涿鹿县',8,'z','zhuoluxian'),(166,'赤城县',8,'c','chichengxian'),(167,'崇礼县',8,'c','chonglixian'),(169,'双桥区',9,'s','shuangqiaoqu'),(170,'双滦区',9,'s','shuangluanqu'),(171,'鹰手营子矿区',9,'y','yingshouyingzikuangqu'),(172,'承德县',9,'c','chengdexian'),(173,'兴隆县',9,'x','xinglongxian'),(174,'平泉县',9,'p','pingquanxian'),(175,'滦平县',9,'l','luanpingxian'),(176,'隆化县',9,'l','longhuaxian'),(177,'丰宁满族自治县',9,'f','fengningmanzuzizhixian'),(178,'宽城满族自治县',9,'k','kuanchengmanzuzizhixian'),(179,'围场满族蒙古族自治县',9,'w','weichangmanzumengguzuzizhixian'),(181,'新华区',10,'x','xinhuaqu'),(182,'运河区',10,'y','yunhequ'),(183,'沧县',10,'c','cangxian'),(184,'青县',10,'q','qingxian'),(185,'东光县',10,'d','dongguangxian'),(186,'海兴县',10,'h','haixingxian'),(187,'盐山县',10,'y','yanshanxian'),(188,'肃宁县',10,'s','suningxian'),(189,'南皮县',10,'n','nanpixian'),(190,'吴桥县',10,'w','wuqiaoxian'),(191,'献县',10,'x','xianxian'),(192,'孟村回族自治县',10,'m','mengcunhuizuzizhixian'),(193,'泊头市',10,'b','botoushi'),(194,'任丘市',10,'r','renqiushi'),(195,'黄骅市',10,'h','huanghuashi'),(196,'河间市',10,'h','hejianshi'),(198,'安次区',11,'a','anciqu'),(199,'广阳区',11,'g','guangyangqu'),(200,'固安县',11,'g','guanxian'),(201,'永清县',11,'y','yongqingxian'),(202,'香河县',11,'x','xianghexian'),(203,'大城县',11,'d','dachengxian'),(204,'文安县',11,'w','wenanxian'),(205,'大厂回族自治县',11,'d','dachanghuizuzizhixian'),(206,'霸州市',11,'b','bazhoushi'),(207,'三河市',11,'s','sanheshi'),(209,'桃城区',12,'t','taochengqu'),(210,'枣强县',12,'z','zaoqiangxian'),(211,'武邑县',12,'w','wuyixian'),(212,'武强县',12,'w','wuqiangxian'),(213,'饶阳县',12,'r','raoyangxian'),(214,'安平县',12,'a','anpingxian'),(215,'故城县',12,'g','guchengxian'),(216,'景县',12,'j','jingxian'),(217,'阜城县',12,'f','fuchengxian'),(218,'冀州市',12,'j','jizhoushi'),(219,'深州市',12,'s','shenzhoushi'),(221,'小店区',13,'x','xiaodianqu'),(222,'迎泽区',13,'y','yingzequ'),(223,'杏花岭区',13,'x','xinghualingqu'),(224,'尖草坪区',13,'j','jiancaopingqu'),(225,'万柏林区',13,'w','wanbolinqu'),(226,'晋源区',13,'j','jinyuanqu'),(227,'清徐县',13,'q','qingxuxian'),(228,'阳曲县',13,'y','yangquxian'),(229,'娄烦县',13,'l','loufanxian'),(230,'古交市',13,'g','gujiaoshi'),(232,'城区',14,'c','chengqu'),(233,'矿区',14,'k','kuangqu'),(234,'南郊区',14,'n','nanjiaoqu'),(235,'新荣区',14,'x','xinrongqu'),(236,'阳高县',14,'y','yanggaoxian'),(237,'天镇县',14,'t','tianzhenxian'),(238,'广灵县',14,'g','guanglingxian'),(239,'灵丘县',14,'l','lingqiuxian'),(240,'浑源县',14,'h','hunyuanxian'),(241,'左云县',14,'z','zuoyunxian'),(242,'大同县',14,'d','datongxian'),(244,'城区',15,'c','chengqu'),(245,'矿区',15,'k','kuangqu'),(246,'郊区',15,'j','jiaoqu'),(247,'平定县',15,'p','pingdingxian'),(248,'盂县',15,'y','yuxian'),(250,'城区',16,'c','chengqu'),(251,'郊区',16,'j','jiaoqu'),(252,'长治县',16,'z','zhangzhixian'),(253,'襄垣县',16,'x','xiangyuanxian'),(254,'屯留县',16,'t','tunliuxian'),(255,'平顺县',16,'p','pingshunxian'),(256,'黎城县',16,'l','lichengxian'),(257,'壶关县',16,'h','huguanxian'),(258,'长子县',16,'z','zhangzixian'),(259,'武乡县',16,'w','wuxiangxian'),(260,'沁县',16,'q','qinxian'),(261,'沁源县',16,'q','qinyuanxian'),(262,'潞城市',16,'l','luchengshi'),(264,'城区',17,'c','chengqu'),(265,'沁水县',17,'q','qinshuixian'),(266,'阳城县',17,'y','yangchengxian'),(267,'陵川县',17,'l','lingchuanxian'),(268,'泽州县',17,'z','zezhouxian'),(269,'高平市',17,'g','gaopingshi'),(271,'朔城区',18,'s','shuochengqu'),(272,'平鲁区',18,'p','pingluqu'),(273,'山阴县',18,'s','shanyinxian'),(274,'应县',18,'y','yingxian'),(275,'右玉县',18,'y','youyuxian'),(276,'怀仁县',18,'h','huairenxian'),(278,'榆次区',19,'y','yuciqu'),(279,'榆社县',19,'y','yushexian'),(280,'左权县',19,'z','zuoquanxian'),(281,'和顺县',19,'h','heshunxian'),(282,'昔阳县',19,'x','xiyangxian'),(283,'寿阳县',19,'s','shouyangxian'),(284,'太谷县',19,'t','taiguxian'),(285,'祁县',19,'q','qixian'),(286,'平遥县',19,'p','pingyaoxian'),(287,'灵石县',19,'l','lingshixian'),(288,'介休市',19,'j','jiexiushi'),(290,'盐湖区',20,'y','yanhuqu'),(291,'临猗县',20,'l','linyixian'),(292,'万荣县',20,'w','wanrongxian'),(293,'闻喜县',20,'w','wenxixian'),(294,'稷山县',20,'j','jishanxian'),(295,'新绛县',20,'x','xinjiangxian'),(296,'绛县',20,'j','jiangxian'),(297,'垣曲县',20,'y','yuanquxian'),(298,'夏县',20,'x','xiaxian'),(299,'平陆县',20,'p','pingluxian'),(300,'芮城县',20,'r','ruichengxian'),(301,'永济市',20,'y','yongjishi'),(302,'河津市',20,'h','hejinshi'),(304,'忻府区',21,'x','xinfuqu'),(305,'定襄县',21,'d','dingxiangxian'),(306,'五台县',21,'w','wutaixian'),(307,'代县',21,'d','daixian'),(308,'繁峙县',21,'f','fanzhixian'),(309,'宁武县',21,'n','ningwuxian'),(310,'静乐县',21,'j','jinglexian'),(311,'神池县',21,'s','shenchixian'),(312,'五寨县',21,'w','wuzhaixian'),(313,'岢岚县',21,'k','kelanxian'),(314,'河曲县',21,'h','hequxian'),(315,'保德县',21,'b','baodexian'),(316,'偏关县',21,'p','pianguanxian'),(317,'原平市',21,'y','yuanpingshi'),(319,'尧都区',22,'y','yaodouqu'),(320,'曲沃县',22,'q','quwoxian'),(321,'翼城县',22,'y','yichengxian'),(322,'襄汾县',22,'x','xiangfenxian'),(323,'洪洞县',22,'h','hongdongxian'),(324,'古县',22,'g','guxian'),(325,'安泽县',22,'a','anzexian'),(326,'浮山县',22,'f','fushanxian'),(327,'吉县',22,'j','jixian'),(328,'乡宁县',22,'x','xiangningxian'),(329,'大宁县',22,'d','daningxian'),(330,'隰县',22,'x','xixian'),(331,'永和县',22,'y','yonghexian'),(332,'蒲县',22,'p','puxian'),(333,'汾西县',22,'f','fenxixian'),(334,'侯马市',22,'h','houmashi'),(335,'霍州市',22,'h','huozhoushi'),(337,'离石区',23,'l','lishiqu'),(338,'文水县',23,'w','wenshuixian'),(339,'交城县',23,'j','jiaochengxian'),(340,'兴县',23,'x','xingxian'),(341,'临县',23,'l','linxian'),(342,'柳林县',23,'l','liulinxian'),(343,'石楼县',23,'s','shilouxian'),(344,'岚县',23,'l','lanxian'),(345,'方山县',23,'f','fangshanxian'),(346,'中阳县',23,'z','zhongyangxian'),(347,'交口县',23,'j','jiaokouxian'),(348,'孝义市',23,'x','xiaoyishi'),(349,'汾阳市',23,'f','fenyangshi'),(351,'新城区',24,'x','xinchengqu'),(352,'回民区',24,'h','huiminqu'),(353,'玉泉区',24,'y','yuquanqu'),(354,'赛罕区',24,'s','saihanqu'),(355,'土默特左旗',24,'t','tumotezuoqi'),(356,'托克托县',24,'t','tuoketuoxian'),(357,'和林格尔县',24,'h','helingeerxian'),(358,'清水河县',24,'q','qingshuihexian'),(359,'武川县',24,'w','wuchuanxian'),(361,'东河区',25,'d','donghequ'),(362,'昆都仑区',25,'k','kundoulunqu'),(363,'青山区',25,'q','qingshanqu'),(364,'石拐区',25,'s','shiguaiqu'),(365,'白云矿区',25,'b','baiyunkuangqu'),(366,'九原区',25,'j','jiuyuanqu'),(367,'土默特右旗',25,'t','tumoteyouqi'),(368,'固阳县',25,'g','guyangxian'),(369,'达尔罕茂明安联合旗',25,'d','daerhanmaominganlianheqi'),(371,'海勃湾区',26,'h','haibowanqu'),(372,'海南区',26,'h','hainanqu'),(373,'乌达区',26,'w','wudaqu'),(375,'红山区',27,'h','hongshanqu'),(376,'元宝山区',27,'y','yuanbaoshanqu'),(377,'松山区',27,'s','songshanqu'),(378,'阿鲁科尔沁旗',27,'a','alukeerqinqi'),(379,'巴林左旗',27,'b','balinzuoqi'),(380,'巴林右旗',27,'b','balinyouqi'),(381,'林西县',27,'l','linxixian'),(382,'克什克腾旗',27,'k','keshenketengqi'),(383,'翁牛特旗',27,'w','wengniuteqi'),(384,'喀喇沁旗',27,'k','kalaqinqi'),(385,'宁城县',27,'n','ningchengxian'),(386,'敖汉旗',27,'a','aohanqi'),(388,'科尔沁区',28,'k','keerqinqu'),(389,'科尔沁左翼中旗',28,'k','keerqinzuoyizhongqi'),(390,'科尔沁左翼后旗',28,'k','keerqinzuoyihouqi'),(391,'开鲁县',28,'k','kailuxian'),(392,'库伦旗',28,'k','kulunqi'),(393,'奈曼旗',28,'n','naimanqi'),(394,'扎鲁特旗',28,'z','zhaluteqi'),(395,'霍林郭勒市',28,'h','huolinguoleshi'),(396,'东胜区',29,'d','dongshengqu'),(397,'达拉特旗',29,'d','dalateqi'),(398,'准格尔旗',29,'z','zhungeerqi'),(399,'鄂托克前旗',29,'e','etuokeqianqi'),(400,'鄂托克旗',29,'e','etuokeqi'),(401,'杭锦旗',29,'h','hangjinqi'),(402,'乌审旗',29,'w','wushenqi'),(403,'伊金霍洛旗',29,'y','yijinhuoluoqi'),(405,'海拉尔区',30,'h','hailaerqu'),(406,'阿荣旗',30,'a','arongqi'),(407,'莫力达瓦达斡尔族自治',30,'m','molidawadawoerzuzizhi'),(408,'鄂伦春自治旗',30,'e','elunchunzizhiqi'),(409,'鄂温克族自治旗',30,'e','ewenkezuzizhiqi'),(410,'陈巴尔虎旗',30,'c','chenbaerhuqi'),(411,'新巴尔虎左旗',30,'x','xinbaerhuzuoqi'),(412,'新巴尔虎右旗',30,'x','xinbaerhuyouqi'),(413,'满洲里市',30,'m','manzhoulishi'),(414,'牙克石市',30,'y','yakeshishi'),(415,'扎兰屯市',30,'z','zhalantunshi'),(416,'额尔古纳市',30,'e','eergunashi'),(417,'根河市',30,'g','genheshi'),(419,'临河区',31,'l','linhequ'),(420,'五原县',31,'w','wuyuanxian'),(421,'磴口县',31,'d','dengkouxian'),(422,'乌拉特前旗',31,'w','wulateqianqi'),(423,'乌拉特中旗',31,'w','wulatezhongqi'),(424,'乌拉特后旗',31,'w','wulatehouqi'),(425,'杭锦后旗',31,'h','hangjinhouqi'),(427,'集宁区',32,'j','jiningqu'),(428,'卓资县',32,'z','zhuozixian'),(429,'化德县',32,'h','huadexian'),(430,'商都县',32,'s','shangdouxian'),(431,'兴和县',32,'x','xinghexian'),(432,'凉城县',32,'l','liangchengxian'),(433,'察哈尔右翼前旗',32,'c','chahaeryouyiqianqi'),(434,'察哈尔右翼中旗',32,'c','chahaeryouyizhongqi'),(435,'察哈尔右翼后旗',32,'c','chahaeryouyihouqi'),(436,'四子王旗',32,'s','siziwangqi'),(437,'丰镇市',32,'f','fengzhenshi'),(438,'乌兰浩特市',33,'w','wulanhaoteshi'),(439,'阿尔山市',33,'a','aershanshi'),(440,'科尔沁右翼前旗',33,'k','keerqinyouyiqianqi'),(441,'科尔沁右翼中旗',33,'k','keerqinyouyizhongqi'),(442,'扎赉特旗',33,'z','zhalaiteqi'),(443,'突泉县',33,'t','tuquanxian'),(444,'二连浩特市',34,'e','erlianhaoteshi'),(445,'锡林浩特市',34,'x','xilinhaoteshi'),(446,'阿巴嘎旗',34,'a','abagaqi'),(447,'苏尼特左旗',34,'s','sunitezuoqi'),(448,'苏尼特右旗',34,'s','suniteyouqi'),(449,'东乌珠穆沁旗',34,'d','dongwuzhumuqinqi'),(450,'西乌珠穆沁旗',34,'x','xiwuzhumuqinqi'),(451,'太仆寺旗',34,'t','taipusiqi'),(452,'镶黄旗',34,'x','xianghuangqi'),(453,'正镶白旗',34,'z','zhengxiangbaiqi'),(454,'正蓝旗',34,'z','zhenglanqi'),(455,'多伦县',34,'d','duolunxian'),(456,'阿拉善左旗',35,'a','alashanzuoqi'),(457,'阿拉善右旗',35,'a','alashanyouqi'),(458,'额济纳旗',35,'e','ejinaqi'),(460,'和平区',36,'h','hepingqu'),(461,'沈河区',36,'s','shenhequ'),(462,'大东区',36,'d','dadongqu'),(463,'皇姑区',36,'h','huangguqu'),(464,'铁西区',36,'t','tiexiqu'),(465,'苏家屯区',36,'s','sujiatunqu'),(466,'东陵区',36,'d','donglingqu'),(467,'新城子区',36,'x','xinchengziqu'),(468,'于洪区',36,'y','yuhongqu'),(469,'辽中县',36,'l','liaozhongxian'),(470,'康平县',36,'k','kangpingxian'),(471,'法库县',36,'f','fakuxian'),(472,'新民市',36,'x','xinminshi'),(474,'中山区',37,'z','zhongshanqu'),(475,'西岗区',37,'x','xigangqu'),(476,'沙河口区',37,'s','shahekouqu'),(477,'甘井子区',37,'g','ganjingziqu'),(478,'旅顺口区',37,'l','lvshunkouqu'),(479,'金州区',37,'j','jinzhouqu'),(480,'长海县',37,'z','zhanghaixian'),(481,'瓦房店市',37,'w','wafangdianshi'),(482,'普兰店市',37,'p','pulandianshi'),(483,'庄河市',37,'z','zhuangheshi'),(485,'铁东区',38,'t','tiedongqu'),(486,'铁西区',38,'t','tiexiqu'),(487,'立山区',38,'l','lishanqu'),(488,'千山区',38,'q','qianshanqu'),(489,'台安县',38,'t','taianxian'),(490,'岫岩满族自治县',38,'x','xiuyanmanzuzizhixian'),(491,'海城市',38,'h','haichengshi'),(493,'新抚区',39,'x','xinfuqu'),(494,'东洲区',39,'d','dongzhouqu'),(495,'望花区',39,'w','wanghuaqu'),(496,'顺城区',39,'s','shunchengqu'),(497,'抚顺县',39,'f','fushunxian'),(498,'新宾满族自治县',39,'x','xinbinmanzuzizhixian'),(499,'清原满族自治县',39,'q','qingyuanmanzuzizhixian'),(501,'平山区',40,'p','pingshanqu'),(502,'溪湖区',40,'x','xihuqu'),(503,'明山区',40,'m','mingshanqu'),(504,'南芬区',40,'n','nanfenqu'),(505,'本溪满族自治县',40,'b','benximanzuzizhixian'),(506,'桓仁满族自治县',40,'h','huanrenmanzuzizhixian'),(508,'元宝区',41,'y','yuanbaoqu'),(509,'振兴区',41,'z','zhenxingqu'),(510,'振安区',41,'z','zhenanqu'),(511,'宽甸满族自治县',41,'k','kuandianmanzuzizhixian'),(512,'东港市',41,'d','donggangshi'),(513,'凤城市',41,'f','fengchengshi'),(515,'古塔区',42,'g','gutaqu'),(516,'凌河区',42,'l','linghequ'),(517,'太和区',42,'t','taihequ'),(518,'黑山县',42,'h','heishanxian'),(519,'义县',42,'y','yixian'),(520,'凌海市',42,'l','linghaishi'),(521,'北宁市',42,'b','beiningshi'),(523,'站前区',43,'z','zhanqianqu'),(524,'西市区',43,'x','xishiqu'),(525,'鲅鱼圈区',43,'b','bayuquanqu'),(526,'老边区',43,'l','laobianqu'),(527,'盖州市',43,'g','gaizhoushi'),(528,'大石桥市',43,'d','dashiqiaoshi'),(530,'海州区',44,'h','haizhouqu'),(531,'新邱区',44,'x','xinqiuqu'),(532,'太平区',44,'t','taipingqu'),(533,'清河门区',44,'q','qinghemenqu'),(534,'细河区',44,'x','xihequ'),(535,'阜新蒙古族自治县',44,'f','fuxinmengguzuzizhixian'),(536,'彰武县',44,'z','zhangwuxian'),(538,'白塔区',45,'b','baitaqu'),(539,'文圣区',45,'w','wenshengqu'),(540,'宏伟区',45,'h','hongweiqu'),(541,'弓长岭区',45,'g','gongzhanglingqu'),(542,'太子河区',45,'t','taizihequ'),(543,'辽阳县',45,'l','liaoyangxian'),(544,'灯塔市',45,'d','dengtashi'),(546,'双台子区',46,'s','shuangtaiziqu'),(547,'兴隆台区',46,'x','xinglongtaiqu'),(548,'大洼县',46,'d','dawaxian'),(549,'盘山县',46,'p','panshanxian'),(551,'银州区',47,'y','yinzhouqu'),(552,'清河区',47,'q','qinghequ'),(553,'铁岭县',47,'t','tielingxian'),(554,'西丰县',47,'x','xifengxian'),(555,'昌图县',47,'c','changtuxian'),(556,'调兵山市',47,'d','diaobingshanshi'),(557,'开原市',47,'k','kaiyuanshi'),(559,'双塔区',48,'s','shuangtaqu'),(560,'龙城区',48,'l','longchengqu'),(561,'朝阳县',48,'c','chaoyangxian'),(562,'建平县',48,'j','jianpingxian'),(563,'喀喇沁左翼蒙古族自治',48,'k','kalaqinzuoyimengguzuzizhi'),(564,'北票市',48,'b','beipiaoshi'),(565,'凌源市',48,'l','lingyuanshi'),(567,'连山区',49,'l','lianshanqu'),(568,'龙港区',49,'l','longgangqu'),(569,'南票区',49,'n','nanpiaoqu'),(570,'绥中县',49,'s','suizhongxian'),(571,'建昌县',49,'j','jianchangxian'),(572,'兴城市',49,'x','xingchengshi'),(574,'南关区',50,'n','nanguanqu'),(575,'宽城区',50,'k','kuanchengqu'),(576,'朝阳区',50,'c','chaoyangqu'),(577,'二道区',50,'e','erdaoqu'),(578,'绿园区',50,'l','lvyuanqu'),(579,'双阳区',50,'s','shuangyangqu'),(580,'农安县',50,'n','nonganxian'),(581,'九台市',50,'j','jiutaishi'),(582,'榆树市',50,'y','yushushi'),(583,'德惠市',50,'d','dehuishi'),(585,'昌邑区',51,'c','changyiqu'),(586,'龙潭区',51,'l','longtanqu'),(587,'船营区',51,'c','chuanyingqu'),(588,'丰满区',51,'f','fengmanqu'),(589,'永吉县',51,'y','yongjixian'),(590,'蛟河市',51,'j','jiaoheshi'),(591,'桦甸市',51,'h','huadianshi'),(592,'舒兰市',51,'s','shulanshi'),(593,'磐石市',51,'p','panshishi'),(595,'铁西区',52,'t','tiexiqu'),(596,'铁东区',52,'t','tiedongqu'),(597,'梨树县',52,'l','lishuxian'),(598,'伊通满族自治县',52,'y','yitongmanzuzizhixian'),(599,'公主岭市',52,'g','gongzhulingshi'),(600,'双辽市',52,'s','shuangliaoshi'),(602,'龙山区',53,'l','longshanqu'),(603,'西安区',53,'x','xianqu'),(604,'东丰县',53,'d','dongfengxian'),(605,'东辽县',53,'d','dongliaoxian'),(607,'东昌区',54,'d','dongchangqu'),(608,'二道江区',54,'e','erdaojiangqu'),(609,'通化县',54,'t','tonghuaxian'),(610,'辉南县',54,'h','huinanxian'),(611,'柳河县',54,'l','liuhexian'),(612,'梅河口市',54,'m','meihekoushi'),(613,'集安市',54,'j','jianshi'),(615,'八道江区',55,'b','badaojiangqu'),(616,'抚松县',55,'f','fusongxian'),(617,'靖宇县',55,'j','jingyuxian'),(618,'长白朝鲜族自治县',55,'z','zhangbaichaoxianzuzizhixian'),(619,'江源县',55,'j','jiangyuanxian'),(620,'临江市',55,'l','linjiangshi'),(622,'宁江区',56,'n','ningjiangqu'),(623,'前郭尔罗斯蒙古族自治',56,'q','qianguoerluosimengguzuzizhi'),(624,'长岭县',56,'z','zhanglingxian'),(625,'乾安县',56,'q','qiananxian'),(626,'扶余县',56,'f','fuyuxian'),(628,'洮北区',57,'t','taobeiqu'),(629,'镇赉县',57,'z','zhenlaixian'),(630,'通榆县',57,'t','tongyuxian'),(631,'洮南市',57,'t','taonanshi'),(632,'大安市',57,'d','daanshi'),(633,'延吉市',58,'y','yanjishi'),(634,'图们市',58,'t','tumenshi'),(635,'敦化市',58,'d','dunhuashi'),(636,'珲春市',58,'h','hunchunshi'),(637,'龙井市',58,'l','longjingshi'),(638,'和龙市',58,'h','helongshi'),(639,'汪清县',58,'w','wangqingxian'),(640,'安图县',58,'a','antuxian'),(642,'道里区',59,'d','daoliqu'),(643,'南岗区',59,'n','nangangqu'),(644,'道外区',59,'d','daowaiqu'),(645,'香坊区',59,'x','xiangfangqu'),(646,'动力区',59,'d','dongliqu'),(647,'平房区',59,'p','pingfangqu'),(648,'松北区',59,'s','songbeiqu'),(649,'呼兰区',59,'h','hulanqu'),(650,'依兰县',59,'y','yilanxian'),(651,'方正县',59,'f','fangzhengxian'),(652,'宾县',59,'b','binxian'),(653,'巴彦县',59,'b','bayanxian'),(654,'木兰县',59,'m','mulanxian'),(655,'通河县',59,'t','tonghexian'),(656,'延寿县',59,'y','yanshouxian'),(657,'阿城市',59,'a','achengshi'),(658,'双城市',59,'s','shuangchengshi'),(659,'尚志市',59,'s','shangzhishi'),(660,'五常市',59,'w','wuchangshi'),(662,'龙沙区',60,'l','longshaqu'),(663,'建华区',60,'j','jianhuaqu'),(664,'铁锋区',60,'t','tiefengqu'),(665,'昂昂溪区',60,'a','angangxiqu'),(666,'富拉尔基区',60,'f','fulaerjiqu'),(667,'碾子山区',60,'n','nianzishanqu'),(668,'梅里斯达斡尔族区',60,'m','meilisidawoerzuqu'),(669,'龙江县',60,'l','longjiangxian'),(670,'依安县',60,'y','yianxian'),(671,'泰来县',60,'t','tailaixian'),(672,'甘南县',60,'g','gannanxian'),(673,'富裕县',60,'f','fuyuxian'),(674,'克山县',60,'k','keshanxian'),(675,'克东县',60,'k','kedongxian'),(676,'拜泉县',60,'b','baiquanxian'),(677,'讷河市',60,'n','neheshi'),(679,'鸡冠区',61,'j','jiguanqu'),(680,'恒山区',61,'h','hengshanqu'),(681,'滴道区',61,'d','didaoqu'),(682,'梨树区',61,'l','lishuqu'),(683,'城子河区',61,'c','chengzihequ'),(684,'麻山区',61,'m','mashanqu'),(685,'鸡东县',61,'j','jidongxian'),(686,'虎林市',61,'h','hulinshi'),(687,'密山市',61,'m','mishanshi'),(689,'向阳区',62,'x','xiangyangqu'),(690,'工农区',62,'g','gongnongqu'),(691,'南山区',62,'n','nanshanqu'),(692,'兴安区',62,'x','xinganqu'),(693,'东山区',62,'d','dongshanqu'),(694,'兴山区',62,'x','xingshanqu'),(695,'萝北县',62,'l','luobeixian'),(696,'绥滨县',62,'s','suibinxian'),(698,'尖山区',63,'j','jianshanqu'),(699,'岭东区',63,'l','lingdongqu'),(700,'四方台区',63,'s','sifangtaiqu'),(701,'宝山区',63,'b','baoshanqu'),(702,'集贤县',63,'j','jixianxian'),(703,'友谊县',63,'y','youyixian'),(704,'宝清县',63,'b','baoqingxian'),(705,'饶河县',63,'r','raohexian'),(707,'萨尔图区',64,'s','saertuqu'),(708,'龙凤区',64,'l','longfengqu'),(709,'让胡路区',64,'r','ranghuluqu'),(710,'红岗区',64,'h','honggangqu'),(711,'大同区',64,'d','datongqu'),(712,'肇州县',64,'z','zhaozhouxian'),(713,'肇源县',64,'z','zhaoyuanxian'),(714,'林甸县',64,'l','lindianxian'),(715,'杜尔伯特蒙古族自治县',64,'d','duerbotemengguzuzizhixian'),(717,'伊春区',65,'y','yichunqu'),(718,'南岔区',65,'n','nanchaqu'),(719,'友好区',65,'y','youhaoqu'),(720,'西林区',65,'x','xilinqu'),(721,'翠峦区',65,'c','cuiluanqu'),(722,'新青区',65,'x','xinqingqu'),(723,'美溪区',65,'m','meixiqu'),(724,'金山屯区',65,'j','jinshantunqu'),(725,'五营区',65,'w','wuyingqu'),(726,'乌马河区',65,'w','wumahequ'),(727,'汤旺河区',65,'t','tangwanghequ'),(728,'带岭区',65,'d','dailingqu'),(729,'乌伊岭区',65,'w','wuyilingqu'),(730,'红星区',65,'h','hongxingqu'),(731,'上甘岭区',65,'s','shangganlingqu'),(732,'嘉荫县',65,'j','jiayinxian'),(733,'铁力市',65,'t','tielishi'),(735,'永红区',66,'y','yonghongqu'),(736,'向阳区',66,'x','xiangyangqu'),(737,'前进区',66,'q','qianjinqu'),(738,'东风区',66,'d','dongfengqu'),(739,'郊区',66,'j','jiaoqu'),(740,'桦南县',66,'h','huananxian'),(741,'桦川县',66,'h','huachuanxian'),(742,'汤原县',66,'t','tangyuanxian'),(743,'抚远县',66,'f','fuyuanxian'),(744,'同江市',66,'t','tongjiangshi'),(745,'富锦市',66,'f','fujinshi'),(747,'新兴区',67,'x','xinxingqu'),(748,'桃山区',67,'t','taoshanqu'),(749,'茄子河区',67,'q','qiezihequ'),(750,'勃利县',67,'b','bolixian'),(752,'东安区',68,'d','donganqu'),(753,'阳明区',68,'y','yangmingqu'),(754,'爱民区',68,'a','aiminqu'),(755,'西安区',68,'x','xianqu'),(756,'东宁县',68,'d','dongningxian'),(757,'林口县',68,'l','linkouxian'),(758,'绥芬河市',68,'s','suifenheshi'),(759,'海林市',68,'h','hailinshi'),(760,'宁安市',68,'n','ninganshi'),(761,'穆棱市',68,'m','mulengshi'),(763,'爱辉区',69,'a','aihuiqu'),(764,'嫩江县',69,'n','nenjiangxian'),(765,'逊克县',69,'x','xunkexian'),(766,'孙吴县',69,'s','sunwuxian'),(767,'北安市',69,'b','beianshi'),(768,'五大连池市',69,'w','wudalianchishi'),(770,'北林区',70,'b','beilinqu'),(771,'望奎县',70,'w','wangkuixian'),(772,'兰西县',70,'l','lanxixian'),(773,'青冈县',70,'q','qinggangxian'),(774,'庆安县',70,'q','qinganxian'),(775,'明水县',70,'m','mingshuixian'),(776,'绥棱县',70,'s','suilengxian'),(777,'安达市',70,'a','andashi'),(778,'肇东市',70,'z','zhaodongshi'),(779,'海伦市',70,'h','hailunshi'),(780,'呼玛县',71,'h','humaxian'),(781,'塔河县',71,'t','tahexian'),(782,'漠河县',71,'m','mohexian'),(783,'黄浦区',339,'h','huangpuqu'),(784,'卢湾区',339,'l','luwanqu'),(785,'徐汇区',339,'x','xuhuiqu'),(786,'长宁区',339,'z','zhangningqu'),(787,'静安区',339,'j','jinganqu'),(788,'普陀区',339,'p','putuoqu'),(789,'闸北区',339,'z','zhabeiqu'),(790,'虹口区',339,'h','hongkouqu'),(791,'杨浦区',339,'y','yangpuqu'),(792,'闵行区',339,'m','minxingqu'),(793,'宝山区',339,'b','baoshanqu'),(794,'嘉定区',339,'j','jiadingqu'),(795,'浦东新区',339,'p','pudongxinqu'),(796,'金山区',339,'j','jinshanqu'),(797,'松江区',339,'s','songjiangqu'),(798,'青浦区',339,'q','qingpuqu'),(799,'南汇区',339,'n','nanhuiqu'),(800,'奉贤区',339,'f','fengxianqu'),(803,'玄武区',72,'x','xuanwuqu'),(804,'白下区',72,'b','baixiaqu'),(805,'秦淮区',72,'q','qinhuaiqu'),(806,'建邺区',72,'j','jianyequ'),(807,'鼓楼区',72,'g','gulouqu'),(808,'下关区',72,'x','xiaguanqu'),(809,'浦口区',72,'p','pukouqu'),(810,'栖霞区',72,'q','qixiaqu'),(811,'雨花台区',72,'y','yuhuataiqu'),(812,'江宁区',72,'j','jiangningqu'),(813,'六合区',72,'l','liuhequ'),(814,'溧水县',72,'l','lishuixian'),(815,'高淳县',72,'g','gaochunxian'),(817,'崇安区',73,'c','chonganqu'),(818,'南长区',73,'n','nanzhangqu'),(819,'北塘区',73,'b','beitangqu'),(820,'锡山区',73,'x','xishanqu'),(821,'惠山区',73,'h','huishanqu'),(822,'滨湖区',73,'b','binhuqu'),(823,'江阴市',73,'j','jiangyinshi'),(824,'宜兴市',73,'y','yixingshi'),(826,'鼓楼区',74,'g','gulouqu'),(827,'云龙区',74,'y','yunlongqu'),(828,'九里区',74,'j','jiuliqu'),(829,'贾汪区',74,'j','jiawangqu'),(830,'泉山区',74,'q','quanshanqu'),(831,'丰县',74,'f','fengxian'),(832,'沛县',74,'p','peixian'),(833,'铜山县',74,'t','tongshanxian'),(834,'睢宁县',74,'s','suiningxian'),(835,'新沂市',74,'x','xinyishi'),(836,'邳州市',74,'p','pizhoushi'),(838,'天宁区',75,'t','tianningqu'),(839,'钟楼区',75,'z','zhonglouqu'),(840,'戚墅堰区',75,'q','qishuyanqu'),(841,'新北区',75,'x','xinbeiqu'),(842,'武进区',75,'w','wujinqu'),(843,'溧阳市',75,'l','liyangshi'),(844,'金坛市',75,'j','jintanshi'),(846,'沧浪区',76,'c','canglangqu'),(847,'平江区',76,'p','pingjiangqu'),(848,'金阊区',76,'j','jinchangqu'),(849,'虎丘区',76,'h','huqiuqu'),(850,'吴中区',76,'w','wuzhongqu'),(851,'相城区',76,'x','xiangchengqu'),(852,'常熟市',76,'c','changshushi'),(853,'张家港市',76,'z','zhangjiagangshi'),(854,'昆山市',76,'k','kunshanshi'),(855,'吴江市',76,'w','wujiangshi'),(856,'太仓市',76,'t','taicangshi'),(858,'崇川区',77,'c','chongchuanqu'),(859,'港闸区',77,'g','gangzhaqu'),(860,'海安县',77,'h','haianxian'),(861,'如东县',77,'r','rudongxian'),(862,'启东市',77,'q','qidongshi'),(863,'如皋市',77,'r','rugaoshi'),(864,'通州市',77,'t','tongzhoushi'),(865,'海门市',77,'h','haimenshi'),(867,'连云区',78,'l','lianyunqu'),(868,'新浦区',78,'x','xinpuqu'),(869,'海州区',78,'h','haizhouqu'),(870,'赣榆县',78,'g','ganyuxian'),(871,'东海县',78,'d','donghaixian'),(872,'灌云县',78,'g','guanyunxian'),(873,'灌南县',78,'g','guannanxian'),(875,'清河区',79,'q','qinghequ'),(876,'楚州区',79,'c','chuzhouqu'),(877,'淮阴区',79,'h','huaiyinqu'),(878,'清浦区',79,'q','qingpuqu'),(879,'涟水县',79,'l','lianshuixian'),(880,'洪泽县',79,'h','hongzexian'),(881,'盱眙县',79,'x','xuyixian'),(882,'金湖县',79,'j','jinhuxian'),(884,'亭湖区',80,'t','tinghuqu'),(885,'盐都区',80,'y','yandouqu'),(886,'响水县',80,'x','xiangshuixian'),(887,'滨海县',80,'b','binhaixian'),(888,'阜宁县',80,'f','funingxian'),(889,'射阳县',80,'s','sheyangxian'),(890,'建湖县',80,'j','jianhuxian'),(891,'东台市',80,'d','dongtaishi'),(892,'大丰市',80,'d','dafengshi'),(894,'广陵区',81,'g','guanglingqu'),(895,'邗江区',81,'h','hanjiangqu'),(896,'郊区',81,'j','jiaoqu'),(897,'宝应县',81,'b','baoyingxian'),(898,'仪征市',81,'y','yizhengshi'),(899,'高邮市',81,'g','gaoyoushi'),(900,'江都市',81,'j','jiangdoushi'),(902,'京口区',82,'j','jingkouqu'),(903,'润州区',82,'r','runzhouqu'),(904,'丹徒区',82,'d','dantuqu'),(905,'丹阳市',82,'d','danyangshi'),(906,'扬中市',82,'y','yangzhongshi'),(907,'句容市',82,'j','jurongshi'),(909,'海陵区',83,'h','hailingqu'),(910,'高港区',83,'g','gaogangqu'),(911,'兴化市',83,'x','xinghuashi'),(912,'靖江市',83,'j','jingjiangshi'),(913,'泰兴市',83,'t','taixingshi'),(914,'姜堰市',83,'j','jiangyanshi'),(916,'宿城区',84,'s','suchengqu'),(917,'宿豫区',84,'s','suyuqu'),(918,'沭阳县',84,'s','shuyangxian'),(919,'泗阳县',84,'s','siyangxian'),(920,'泗洪县',84,'s','sihongxian'),(922,'上城区',85,'s','shangchengqu'),(923,'下城区',85,'x','xiachengqu'),(924,'江干区',85,'j','jiangganqu'),(925,'拱墅区',85,'g','gongshuqu'),(926,'西湖区',85,'x','xihuqu'),(927,'滨江区',85,'b','binjiangqu'),(928,'萧山区',85,'x','xiaoshanqu'),(929,'余杭区',85,'y','yuhangqu'),(930,'桐庐县',85,'t','tongluxian'),(931,'淳安县',85,'c','chunanxian'),(932,'建德市',85,'j','jiandeshi'),(933,'富阳市',85,'f','fuyangshi'),(934,'临安市',85,'l','linanshi'),(936,'海曙区',86,'h','haishuqu'),(937,'江东区',86,'j','jiangdongqu'),(938,'江北区',86,'j','jiangbeiqu'),(939,'北仑区',86,'b','beilunqu'),(940,'镇海区',86,'z','zhenhaiqu'),(941,'鄞州区',86,'y','yinzhouqu'),(942,'象山县',86,'x','xiangshanxian'),(943,'宁海县',86,'n','ninghaixian'),(944,'余姚市',86,'y','yuyaoshi'),(945,'慈溪市',86,'c','cixishi'),(946,'奉化市',86,'f','fenghuashi'),(948,'鹿城区',87,'l','luchengqu'),(949,'龙湾区',87,'l','longwanqu'),(950,'瓯海区',87,'o','ouhaiqu'),(951,'洞头县',87,'d','dongtouxian'),(952,'永嘉县',87,'y','yongjiaxian'),(953,'平阳县',87,'p','pingyangxian'),(954,'苍南县',87,'c','cangnanxian'),(955,'文成县',87,'w','wenchengxian'),(956,'泰顺县',87,'t','taishunxian'),(957,'瑞安市',87,'r','ruianshi'),(958,'乐清市',87,'l','leqingshi'),(960,'秀城区',88,'x','xiuchengqu'),(961,'秀洲区',88,'x','xiuzhouqu'),(962,'嘉善县',88,'j','jiashanxian'),(963,'海盐县',88,'h','haiyanxian'),(964,'海宁市',88,'h','hainingshi'),(965,'平湖市',88,'p','pinghushi'),(966,'桐乡市',88,'t','tongxiangshi'),(968,'吴兴区',89,'w','wuxingqu'),(969,'南浔区',89,'n','nanxunqu'),(970,'德清县',89,'d','deqingxian'),(971,'长兴县',89,'z','zhangxingxian'),(972,'安吉县',89,'a','anjixian'),(974,'越城区',90,'y','yuechengqu'),(975,'绍兴县',90,'s','shaoxingxian'),(976,'新昌县',90,'x','xinchangxian'),(977,'诸暨市',90,'z','zhujishi'),(978,'上虞市',90,'s','shangyushi'),(979,'嵊州市',90,'s','shengzhoushi'),(981,'婺城区',91,'w','wuchengqu'),(982,'金东区',91,'j','jindongqu'),(983,'武义县',91,'w','wuyixian'),(984,'浦江县',91,'p','pujiangxian'),(985,'磐安县',91,'p','pananxian'),(986,'兰溪市',91,'l','lanxishi'),(987,'义乌市',91,'y','yiwushi'),(988,'东阳市',91,'d','dongyangshi'),(989,'永康市',91,'y','yongkangshi'),(991,'柯城区',92,'k','kechengqu'),(992,'衢江区',92,'q','qujiangqu'),(993,'常山县',92,'c','changshanxian'),(994,'开化县',92,'k','kaihuaxian'),(995,'龙游县',92,'l','longyouxian'),(996,'江山市',92,'j','jiangshanshi'),(998,'定海区',93,'d','dinghaiqu'),(999,'普陀区',93,'p','putuoqu'),(1000,'岱山县',93,'d','daishanxian'),(1001,'嵊泗县',93,'s','shengsixian'),(1003,'椒江区',94,'j','jiaojiangqu'),(1004,'黄岩区',94,'h','huangyanqu'),(1005,'路桥区',94,'l','luqiaoqu'),(1006,'玉环县',94,'y','yuhuanxian'),(1007,'三门县',94,'s','sanmenxian'),(1008,'天台县',94,'t','tiantaixian'),(1009,'仙居县',94,'x','xianjuxian'),(1010,'温岭市',94,'w','wenlingshi'),(1011,'临海市',94,'l','linhaishi'),(1013,'莲都区',95,'l','liandouqu'),(1014,'青田县',95,'q','qingtianxian'),(1015,'缙云县',95,'j','jinyunxian'),(1016,'遂昌县',95,'s','suichangxian'),(1017,'松阳县',95,'s','songyangxian'),(1018,'云和县',95,'y','yunhexian'),(1019,'庆元县',95,'q','qingyuanxian'),(1020,'景宁畲族自治县',95,'j','jingningshezuzizhixian'),(1021,'龙泉市',95,'l','longquanshi'),(1023,'瑶海区',96,'y','yaohaiqu'),(1024,'庐阳区',96,'l','luyangqu'),(1025,'蜀山区',96,'s','shushanqu'),(1026,'包河区',96,'b','baohequ'),(1027,'长丰县',96,'z','zhangfengxian'),(1028,'肥东县',96,'f','feidongxian'),(1029,'肥西县',96,'f','feixixian'),(1031,'镜湖区',97,'j','jinghuqu'),(1032,'马塘区',97,'m','matangqu'),(1033,'新芜区',97,'x','xinwuqu'),(1034,'鸠江区',97,'j','jiujiangqu'),(1035,'芜湖县',97,'w','wuhuxian'),(1036,'繁昌县',97,'f','fanchangxian'),(1037,'南陵县',97,'n','nanlingxian'),(1039,'龙子湖区',98,'l','longzihuqu'),(1040,'蚌山区',98,'b','bangshanqu'),(1041,'禹会区',98,'y','yuhuiqu'),(1042,'淮上区',98,'h','huaishangqu'),(1043,'怀远县',98,'h','huaiyuanxian'),(1044,'五河县',98,'w','wuhexian'),(1045,'固镇县',98,'g','guzhenxian'),(1047,'大通区',99,'d','datongqu'),(1048,'田家庵区',99,'t','tianjiaanqu'),(1049,'谢家集区',99,'x','xiejiajiqu'),(1050,'八公山区',99,'b','bagongshanqu'),(1051,'潘集区',99,'p','panjiqu'),(1052,'凤台县',99,'f','fengtaixian'),(1054,'金家庄区',100,'j','jinjiazhuangqu'),(1055,'花山区',100,'h','huashanqu'),(1056,'雨山区',100,'y','yushanqu'),(1057,'当涂县',100,'d','dangtuxian'),(1059,'杜集区',101,'d','dujiqu'),(1060,'相山区',101,'x','xiangshanqu'),(1061,'烈山区',101,'l','lieshanqu'),(1062,'濉溪县',101,'s','suixixian'),(1064,'铜官山区',102,'t','tongguanshanqu'),(1065,'狮子山区',102,'s','shizishanqu'),(1066,'郊区',102,'j','jiaoqu'),(1067,'铜陵县',102,'t','tonglingxian'),(1069,'迎江区',103,'y','yingjiangqu'),(1070,'大观区',103,'d','daguanqu'),(1071,'郊区',103,'j','jiaoqu'),(1072,'怀宁县',103,'h','huainingxian'),(1073,'枞阳县',103,'z','zongyangxian'),(1074,'潜山县',103,'q','qianshanxian'),(1075,'太湖县',103,'t','taihuxian'),(1076,'宿松县',103,'s','susongxian'),(1077,'望江县',103,'w','wangjiangxian'),(1078,'岳西县',103,'y','yuexixian'),(1079,'桐城市',103,'t','tongchengshi'),(1081,'屯溪区',104,'t','tunxiqu'),(1082,'黄山区',104,'h','huangshanqu'),(1083,'徽州区',104,'h','huizhouqu'),(1084,'歙县',104,'s','shexian'),(1085,'休宁县',104,'x','xiuningxian'),(1086,'黟县',104,'y','yixian'),(1087,'祁门县',104,'q','qimenxian'),(1089,'琅琊区',105,'l','langyaqu'),(1090,'南谯区',105,'n','nanqiaoqu'),(1091,'来安县',105,'l','laianxian'),(1092,'全椒县',105,'q','quanjiaoxian'),(1093,'定远县',105,'d','dingyuanxian'),(1094,'凤阳县',105,'f','fengyangxian'),(1095,'天长市',105,'t','tianzhangshi'),(1096,'明光市',105,'m','mingguangshi'),(1098,'颍州区',106,'y','yingzhouqu'),(1099,'颍东区',106,'y','yingdongqu'),(1100,'颍泉区',106,'y','yingquanqu'),(1101,'临泉县',106,'l','linquanxian'),(1102,'太和县',106,'t','taihexian'),(1103,'阜南县',106,'f','funanxian'),(1104,'颍上县',106,'y','yingshangxian'),(1105,'界首市',106,'j','jieshoushi'),(1107,'墉桥区',107,'y','yongqiaoqu'),(1108,'砀山县',107,'d','dangshanxian'),(1109,'萧县',107,'x','xiaoxian'),(1110,'灵璧县',107,'l','lingbixian'),(1111,'泗县',107,'s','sixian'),(1113,'居巢区',108,'j','juchaoqu'),(1114,'庐江县',108,'l','lujiangxian'),(1115,'无为县',108,'w','wuweixian'),(1116,'含山县',108,'h','hanshanxian'),(1117,'和县',108,'h','hexian'),(1119,'金安区',109,'j','jinanqu'),(1120,'裕安区',109,'y','yuanqu'),(1121,'寿县',109,'s','shouxian'),(1122,'霍邱县',109,'h','huoqiuxian'),(1123,'舒城县',109,'s','shuchengxian'),(1124,'金寨县',109,'j','jinzhaixian'),(1125,'霍山县',109,'h','huoshanxian'),(1127,'谯城区',110,'q','qiaochengqu'),(1128,'涡阳县',110,'w','woyangxian'),(1129,'蒙城县',110,'m','mengchengxian'),(1130,'利辛县',110,'l','lixinxian'),(1132,'贵池区',111,'g','guichiqu'),(1133,'东至县',111,'d','dongzhixian'),(1134,'石台县',111,'s','shitaixian'),(1135,'青阳县',111,'q','qingyangxian'),(1137,'宣州区',112,'x','xuanzhouqu'),(1138,'郎溪县',112,'l','langxixian'),(1139,'广德县',112,'g','guangdexian'),(1140,'泾县',112,'j','jingxian'),(1141,'绩溪县',112,'j','jixixian'),(1142,'旌德县',112,'j','jingdexian'),(1143,'宁国市',112,'n','ningguoshi'),(1145,'鼓楼区',113,'g','gulouqu'),(1146,'台江区',113,'t','taijiangqu'),(1147,'仓山区',113,'c','cangshanqu'),(1148,'马尾区',113,'m','maweiqu'),(1149,'晋安区',113,'j','jinanqu'),(1150,'闽侯县',113,'m','minhouxian'),(1151,'连江县',113,'l','lianjiangxian'),(1152,'罗源县',113,'l','luoyuanxian'),(1153,'闽清县',113,'m','minqingxian'),(1154,'永泰县',113,'y','yongtaixian'),(1155,'平潭县',113,'p','pingtanxian'),(1156,'福清市',113,'f','fuqingshi'),(1157,'长乐市',113,'z','zhangleshi'),(1159,'思明区',114,'s','simingqu'),(1160,'海沧区',114,'h','haicangqu'),(1161,'湖里区',114,'h','huliqu'),(1162,'集美区',114,'j','jimeiqu'),(1163,'同安区',114,'t','tonganqu'),(1164,'翔安区',114,'x','xianganqu'),(1166,'城厢区',115,'c','chengxiangqu'),(1167,'涵江区',115,'h','hanjiangqu'),(1168,'荔城区',115,'l','lichengqu'),(1169,'秀屿区',115,'x','xiuyuqu'),(1170,'仙游县',115,'x','xianyouxian'),(1172,'梅列区',116,'m','meiliequ'),(1173,'三元区',116,'s','sanyuanqu'),(1174,'明溪县',116,'m','mingxixian'),(1175,'清流县',116,'q','qingliuxian'),(1176,'宁化县',116,'n','ninghuaxian'),(1177,'大田县',116,'d','datianxian'),(1178,'尤溪县',116,'y','youxixian'),(1179,'沙县',116,'s','shaxian'),(1180,'将乐县',116,'j','jianglexian'),(1181,'泰宁县',116,'t','tainingxian'),(1182,'建宁县',116,'j','jianningxian'),(1183,'永安市',116,'y','yonganshi'),(1185,'鲤城区',117,'l','lichengqu'),(1186,'丰泽区',117,'f','fengzequ'),(1187,'洛江区',117,'l','luojiangqu'),(1188,'泉港区',117,'q','quangangqu'),(1189,'惠安县',117,'h','huianxian'),(1190,'安溪县',117,'a','anxixian'),(1191,'永春县',117,'y','yongchunxian'),(1192,'德化县',117,'d','dehuaxian'),(1193,'金门县',117,'j','jinmenxian'),(1194,'石狮市',117,'s','shishishi'),(1195,'晋江市',117,'j','jinjiangshi'),(1196,'南安市',117,'n','nananshi'),(1198,'芗城区',118,'x','xiangchengqu'),(1199,'龙文区',118,'l','longwenqu'),(1200,'云霄县',118,'y','yunxiaoxian'),(1201,'漳浦县',118,'z','zhangpuxian'),(1202,'诏安县',118,'z','zhaoanxian'),(1203,'长泰县',118,'z','zhangtaixian'),(1204,'东山县',118,'d','dongshanxian'),(1205,'南靖县',118,'n','nanjingxian'),(1206,'平和县',118,'p','pinghexian'),(1207,'华安县',118,'h','huaanxian'),(1208,'龙海市',118,'l','longhaishi'),(1210,'延平区',119,'y','yanpingqu'),(1211,'顺昌县',119,'s','shunchangxian'),(1212,'浦城县',119,'p','puchengxian'),(1213,'光泽县',119,'g','guangzexian'),(1214,'松溪县',119,'s','songxixian'),(1215,'政和县',119,'z','zhenghexian'),(1216,'邵武市',119,'s','shaowushi'),(1217,'武夷山市',119,'w','wuyishanshi'),(1218,'建瓯市',119,'j','jianoushi'),(1219,'建阳市',119,'j','jianyangshi'),(1221,'新罗区',120,'x','xinluoqu'),(1222,'长汀县',120,'z','zhangtingxian'),(1223,'永定县',120,'y','yongdingxian'),(1224,'上杭县',120,'s','shanghangxian'),(1225,'武平县',120,'w','wupingxian'),(1226,'连城县',120,'l','lianchengxian'),(1227,'漳平市',120,'z','zhangpingshi'),(1229,'蕉城区',121,'j','jiaochengqu'),(1230,'霞浦县',121,'x','xiapuxian'),(1231,'古田县',121,'g','gutianxian'),(1232,'屏南县',121,'p','pingnanxian'),(1233,'寿宁县',121,'s','shouningxian'),(1234,'周宁县',121,'z','zhouningxian'),(1235,'柘荣县',121,'z','zherongxian'),(1236,'福安市',121,'f','fuanshi'),(1237,'福鼎市',121,'f','fudingshi'),(1239,'东湖区',122,'d','donghuqu'),(1240,'西湖区',122,'x','xihuqu'),(1241,'青云谱区',122,'q','qingyunpuqu'),(1242,'湾里区',122,'w','wanliqu'),(1243,'青山湖区',122,'q','qingshanhuqu'),(1244,'南昌县',122,'n','nanchangxian'),(1245,'新建县',122,'x','xinjianxian'),(1246,'安义县',122,'a','anyixian'),(1247,'进贤县',122,'j','jinxianxian'),(1249,'昌江区',123,'c','changjiangqu'),(1250,'珠山区',123,'z','zhushanqu'),(1251,'浮梁县',123,'f','fuliangxian'),(1252,'乐平市',123,'l','lepingshi'),(1254,'安源区',124,'a','anyuanqu'),(1255,'湘东区',124,'x','xiangdongqu'),(1256,'莲花县',124,'l','lianhuaxian'),(1257,'上栗县',124,'s','shanglixian'),(1258,'芦溪县',124,'l','luxixian'),(1260,'庐山区',125,'l','lushanqu'),(1261,'浔阳区',125,'x','xunyangqu'),(1262,'九江县',125,'j','jiujiangxian'),(1263,'武宁县',125,'w','wuningxian'),(1264,'修水县',125,'x','xiushuixian'),(1265,'永修县',125,'y','yongxiuxian'),(1266,'德安县',125,'d','deanxian'),(1267,'星子县',125,'x','xingzixian'),(1268,'都昌县',125,'d','douchangxian'),(1269,'湖口县',125,'h','hukouxian'),(1270,'彭泽县',125,'p','pengzexian'),(1271,'瑞昌市',125,'r','ruichangshi'),(1273,'渝水区',126,'y','yushuiqu'),(1274,'分宜县',126,'f','fenyixian'),(1276,'月湖区',127,'y','yuehuqu'),(1277,'余江县',127,'y','yujiangxian'),(1278,'贵溪市',127,'g','guixishi'),(1280,'章贡区',128,'z','zhanggongqu'),(1281,'赣县',128,'g','ganxian'),(1282,'信丰县',128,'x','xinfengxian'),(1283,'大余县',128,'d','dayuxian'),(1284,'上犹县',128,'s','shangyouxian'),(1285,'崇义县',128,'c','chongyixian'),(1286,'安远县',128,'a','anyuanxian'),(1287,'龙南县',128,'l','longnanxian'),(1288,'定南县',128,'d','dingnanxian'),(1289,'全南县',128,'q','quannanxian'),(1290,'宁都县',128,'n','ningdouxian'),(1291,'于都县',128,'y','yudouxian'),(1292,'兴国县',128,'x','xingguoxian'),(1293,'会昌县',128,'h','huichangxian'),(1294,'寻乌县',128,'x','xunwuxian'),(1295,'石城县',128,'s','shichengxian'),(1296,'瑞金市',128,'r','ruijinshi'),(1297,'南康市',128,'n','nankangshi'),(1299,'吉州区',129,'j','jizhouqu'),(1300,'青原区',129,'q','qingyuanqu'),(1301,'吉安县',129,'j','jianxian'),(1302,'吉水县',129,'j','jishuixian'),(1303,'峡江县',129,'x','xiajiangxian'),(1304,'新干县',129,'x','xinganxian'),(1305,'永丰县',129,'y','yongfengxian'),(1306,'泰和县',129,'t','taihexian'),(1307,'遂川县',129,'s','suichuanxian'),(1308,'万安县',129,'w','wananxian'),(1309,'安福县',129,'a','anfuxian'),(1310,'永新县',129,'y','yongxinxian'),(1311,'井冈山市',129,'j','jinggangshanshi'),(1313,'袁州区',130,'y','yuanzhouqu'),(1314,'奉新县',130,'f','fengxinxian'),(1315,'万载县',130,'w','wanzaixian'),(1316,'上高县',130,'s','shanggaoxian'),(1317,'宜丰县',130,'y','yifengxian'),(1318,'靖安县',130,'j','jinganxian'),(1319,'铜鼓县',130,'t','tongguxian'),(1320,'丰城市',130,'f','fengchengshi'),(1321,'樟树市',130,'z','zhangshushi'),(1322,'高安市',130,'g','gaoanshi'),(1324,'临川区',131,'l','linchuanqu'),(1325,'南城县',131,'n','nanchengxian'),(1326,'黎川县',131,'l','lichuanxian'),(1327,'南丰县',131,'n','nanfengxian'),(1328,'崇仁县',131,'c','chongrenxian'),(1329,'乐安县',131,'l','leanxian'),(1330,'宜黄县',131,'y','yihuangxian'),(1331,'金溪县',131,'j','jinxixian'),(1332,'资溪县',131,'z','zixixian'),(1333,'东乡县',131,'d','dongxiangxian'),(1334,'广昌县',131,'g','guangchangxian'),(1336,'信州区',132,'x','xinzhouqu'),(1337,'上饶县',132,'s','shangraoxian'),(1338,'广丰县',132,'g','guangfengxian'),(1339,'玉山县',132,'y','yushanxian'),(1340,'铅山县',132,'q','qianshanxian'),(1341,'横峰县',132,'h','hengfengxian'),(1342,'弋阳县',132,'y','yiyangxian'),(1343,'余干县',132,'y','yuganxian'),(1344,'鄱阳县',132,'p','poyangxian'),(1345,'万年县',132,'w','wannianxian'),(1346,'婺源县',132,'w','wuyuanxian'),(1347,'德兴市',132,'d','dexingshi'),(1349,'历下区',133,'l','lixiaqu'),(1350,'市中区',133,'s','shizhongqu'),(1351,'槐荫区',133,'h','huaiyinqu'),(1352,'天桥区',133,'t','tianqiaoqu'),(1353,'历城区',133,'l','lichengqu'),(1354,'长清区',133,'z','zhangqingqu'),(1355,'平阴县',133,'p','pingyinxian'),(1356,'济阳县',133,'j','jiyangxian'),(1357,'商河县',133,'s','shanghexian'),(1358,'章丘市',133,'z','zhangqiushi'),(1360,'市南区',134,'s','shinanqu'),(1361,'市北区',134,'s','shibeiqu'),(1362,'四方区',134,'s','sifangqu'),(1363,'黄岛区',134,'h','huangdaoqu'),(1364,'崂山区',134,'l','laoshanqu'),(1365,'李沧区',134,'l','licangqu'),(1366,'城阳区',134,'c','chengyangqu'),(1367,'胶州市',134,'j','jiaozhoushi'),(1368,'即墨市',134,'j','jimoshi'),(1369,'平度市',134,'p','pingdushi'),(1370,'胶南市',134,'j','jiaonanshi'),(1371,'莱西市',134,'l','laixishi'),(1373,'淄川区',135,'z','zichuanqu'),(1374,'张店区',135,'z','zhangdianqu'),(1375,'博山区',135,'b','boshanqu'),(1376,'临淄区',135,'l','linziqu'),(1377,'周村区',135,'z','zhoucunqu'),(1378,'桓台县',135,'h','huantaixian'),(1379,'高青县',135,'g','gaoqingxian'),(1380,'沂源县',135,'y','yiyuanxian'),(1382,'市中区',136,'s','shizhongqu'),(1383,'薛城区',136,'x','xuechengqu'),(1384,'峄城区',136,'y','yichengqu'),(1385,'台儿庄区',136,'t','taierzhuangqu'),(1386,'山亭区',136,'s','shantingqu'),(1387,'滕州市',136,'t','tengzhoushi'),(1389,'东营区',137,'d','dongyingqu'),(1390,'河口区',137,'h','hekouqu'),(1391,'垦利县',137,'k','kenlixian'),(1392,'利津县',137,'l','lijinxian'),(1393,'广饶县',137,'g','guangraoxian'),(1395,'芝罘区',138,'z','zhifuqu'),(1396,'福山区',138,'f','fushanqu'),(1397,'牟平区',138,'m','moupingqu'),(1398,'莱山区',138,'l','laishanqu'),(1399,'长岛县',138,'z','zhangdaoxian'),(1400,'龙口市',138,'l','longkoushi'),(1401,'莱阳市',138,'l','laiyangshi'),(1402,'莱州市',138,'l','laizhoushi'),(1403,'蓬莱市',138,'p','penglaishi'),(1404,'招远市',138,'z','zhaoyuanshi'),(1405,'栖霞市',138,'q','qixiashi'),(1406,'海阳市',138,'h','haiyangshi'),(1408,'潍城区',139,'w','weichengqu'),(1409,'寒亭区',139,'h','hantingqu'),(1410,'坊子区',139,'f','fangziqu'),(1411,'奎文区',139,'k','kuiwenqu'),(1412,'临朐县',139,'l','linquxian'),(1413,'昌乐县',139,'c','changlexian'),(1414,'青州市',139,'q','qingzhoushi'),(1415,'诸城市',139,'z','zhuchengshi'),(1416,'寿光市',139,'s','shouguangshi'),(1417,'安丘市',139,'a','anqiushi'),(1418,'高密市',139,'g','gaomishi'),(1419,'昌邑市',139,'c','changyishi'),(1421,'市中区',140,'s','shizhongqu'),(1422,'任城区',140,'r','renchengqu'),(1423,'微山县',140,'w','weishanxian'),(1424,'鱼台县',140,'y','yutaixian'),(1425,'金乡县',140,'j','jinxiangxian'),(1426,'嘉祥县',140,'j','jiaxiangxian'),(1427,'汶上县',140,'w','wenshangxian'),(1428,'泗水县',140,'s','sishuixian'),(1429,'梁山县',140,'l','liangshanxian'),(1430,'曲阜市',140,'q','qufushi'),(1431,'兖州市',140,'y','yanzhoushi'),(1432,'邹城市',140,'z','zouchengshi'),(1434,'泰山区',141,'t','taishanqu'),(1435,'岱岳区',141,'d','daiyuequ'),(1436,'宁阳县',141,'n','ningyangxian'),(1437,'东平县',141,'d','dongpingxian'),(1438,'新泰市',141,'x','xintaishi'),(1439,'肥城市',141,'f','feichengshi'),(1441,'环翠区',142,'h','huancuiqu'),(1442,'文登市',142,'w','wendengshi'),(1443,'荣成市',142,'r','rongchengshi'),(1444,'乳山市',142,'r','rushanshi'),(1446,'东港区',143,'d','donggangqu'),(1447,'岚山区',143,'l','lanshanqu'),(1448,'五莲县',143,'w','wulianxian'),(1449,'莒县',143,'j','juxian'),(1451,'莱城区',144,'l','laichengqu'),(1452,'钢城区',144,'g','gangchengqu'),(1454,'兰山区',145,'l','lanshanqu'),(1455,'罗庄区',145,'l','luozhuangqu'),(1456,'河东区',145,'h','hedongqu'),(1457,'沂南县',145,'y','yinanxian'),(1458,'郯城县',145,'t','tanchengxian'),(1459,'沂水县',145,'y','yishuixian'),(1460,'苍山县',145,'c','cangshanxian'),(1461,'费县',145,'f','feixian'),(1462,'平邑县',145,'p','pingyixian'),(1463,'莒南县',145,'j','junanxian'),(1464,'蒙阴县',145,'m','mengyinxian'),(1465,'临沭县',145,'l','linshuxian'),(1467,'德城区',146,'d','dechengqu'),(1468,'陵县',146,'l','lingxian'),(1469,'宁津县',146,'n','ningjinxian'),(1470,'庆云县',146,'q','qingyunxian'),(1471,'临邑县',146,'l','linyixian'),(1472,'齐河县',146,'q','qihexian'),(1473,'平原县',146,'p','pingyuanxian'),(1474,'夏津县',146,'x','xiajinxian'),(1475,'武城县',146,'w','wuchengxian'),(1476,'乐陵市',146,'l','lelingshi'),(1477,'禹城市',146,'y','yuchengshi'),(1479,'东昌府区',147,'d','dongchangfuqu'),(1480,'阳谷县',147,'y','yangguxian'),(1481,'莘县',147,'x','xinxian'),(1482,'茌平县',147,'c','chipingxian'),(1483,'东阿县',147,'d','dongaxian'),(1484,'冠县',147,'g','guanxian'),(1485,'高唐县',147,'g','gaotangxian'),(1486,'临清市',147,'l','linqingshi'),(1488,'滨城区',148,'b','binchengqu'),(1489,'惠民县',148,'h','huiminxian'),(1490,'阳信县',148,'y','yangxinxian'),(1491,'无棣县',148,'w','wudixian'),(1492,'沾化县',148,'z','zhanhuaxian'),(1493,'博兴县',148,'b','boxingxian'),(1494,'邹平县',148,'z','zoupingxian'),(1496,'牡丹区',149,'m','mudanqu'),(1497,'曹县',149,'c','caoxian'),(1498,'单县',149,'d','danxian'),(1499,'成武县',149,'c','chengwuxian'),(1500,'巨野县',149,'j','juyexian'),(1501,'郓城县',149,'y','yunchengxian'),(1502,'鄄城县',149,'j','juanchengxian'),(1503,'定陶县',149,'d','dingtaoxian'),(1504,'东明县',149,'d','dongmingxian'),(1506,'中原区',150,'z','zhongyuanqu'),(1507,'二七区',150,'e','erqiqu'),(1508,'管城回族区',150,'g','guanchenghuizuqu'),(1509,'金水区',150,'j','jinshuiqu'),(1510,'上街区',150,'s','shangjiequ'),(1511,'邙山区',150,'m','mangshanqu'),(1512,'中牟县',150,'z','zhongmouxian'),(1513,'巩义市',150,'g','gongyishi'),(1514,'荥阳市',150,'y','yingyangshi'),(1515,'新密市',150,'x','xinmishi'),(1516,'新郑市',150,'x','xinzhengshi'),(1517,'登封市',150,'d','dengfengshi'),(1519,'龙亭区',151,'l','longtingqu'),(1520,'顺河回族区',151,'s','shunhehuizuqu'),(1521,'鼓楼区',151,'g','gulouqu'),(1522,'南关区',151,'n','nanguanqu'),(1523,'郊区',151,'j','jiaoqu'),(1524,'杞县',151,'q','qixian'),(1525,'通许县',151,'t','tongxuxian'),(1526,'尉氏县',151,'w','weishixian'),(1527,'开封县',151,'k','kaifengxian'),(1528,'兰考县',151,'l','lankaoxian'),(1530,'老城区',152,'l','laochengqu'),(1531,'西工区',152,'x','xigongqu'),(1532,'廛河回族区',152,'c','chanhehuizuqu'),(1533,'涧西区',152,'j','jianxiqu'),(1534,'吉利区',152,'j','jiliqu'),(1535,'洛龙区',152,'l','luolongqu'),(1536,'孟津县',152,'m','mengjinxian'),(1537,'新安县',152,'x','xinanxian'),(1538,'栾川县',152,'l','luanchuanxian'),(1539,'嵩县',152,'s','songxian'),(1540,'汝阳县',152,'r','ruyangxian'),(1541,'宜阳县',152,'y','yiyangxian'),(1542,'洛宁县',152,'l','luoningxian'),(1543,'伊川县',152,'y','yichuanxian'),(1544,'偃师市',152,'y','yanshishi'),(1546,'新华区',153,'x','xinhuaqu'),(1547,'卫东区',153,'w','weidongqu'),(1548,'石龙区',153,'s','shilongqu'),(1549,'湛河区',153,'z','zhanhequ'),(1550,'宝丰县',153,'b','baofengxian'),(1551,'叶县',153,'y','yexian'),(1552,'鲁山县',153,'l','lushanxian'),(1553,'郏县',153,'j','jiaxian'),(1554,'舞钢市',153,'w','wugangshi'),(1555,'汝州市',153,'r','ruzhoushi'),(1557,'文峰区',154,'w','wenfengqu'),(1558,'北关区',154,'b','beiguanqu'),(1559,'殷都区',154,'y','yindouqu'),(1560,'龙安区',154,'l','longanqu'),(1561,'安阳县',154,'a','anyangxian'),(1562,'汤阴县',154,'t','tangyinxian'),(1563,'滑县',154,'h','huaxian'),(1564,'内黄县',154,'n','neihuangxian'),(1565,'林州市',154,'l','linzhoushi'),(1567,'鹤山区',155,'h','heshanqu'),(1568,'山城区',155,'s','shanchengqu'),(1569,'淇滨区',155,'q','qibinqu'),(1570,'浚县',155,'j','junxian'),(1571,'淇县',155,'q','qixian'),(1573,'红旗区',156,'h','hongqiqu'),(1574,'卫滨区',156,'w','weibinqu'),(1575,'凤泉区',156,'f','fengquanqu'),(1576,'牧野区',156,'m','muyequ'),(1577,'新乡县',156,'x','xinxiangxian'),(1578,'获嘉县',156,'h','huojiaxian'),(1579,'原阳县',156,'y','yuanyangxian'),(1580,'延津县',156,'y','yanjinxian'),(1581,'封丘县',156,'f','fengqiuxian'),(1582,'长垣县',156,'z','zhangyuanxian'),(1583,'卫辉市',156,'w','weihuishi'),(1584,'辉县市',156,'h','huixianshi'),(1586,'解放区',157,'j','jiefangqu'),(1587,'中站区',157,'z','zhongzhanqu'),(1588,'马村区',157,'m','macunqu'),(1589,'山阳区',157,'s','shanyangqu'),(1590,'修武县',157,'x','xiuwuxian'),(1591,'博爱县',157,'b','boaixian'),(1592,'武陟县',157,'w','wuzhixian'),(1593,'温县',157,'w','wenxian'),(1594,'济源市',157,'j','jiyuanshi'),(1595,'沁阳市',157,'q','qinyangshi'),(1596,'孟州市',157,'m','mengzhoushi'),(1598,'华龙区',158,'h','hualongqu'),(1599,'清丰县',158,'q','qingfengxian'),(1600,'南乐县',158,'n','nanlexian'),(1601,'范县',158,'f','fanxian'),(1602,'台前县',158,'t','taiqianxian'),(1603,'濮阳县',158,'p','puyangxian'),(1605,'魏都区',159,'w','weidouqu'),(1606,'许昌县',159,'x','xuchangxian'),(1607,'鄢陵县',159,'y','yanlingxian'),(1608,'襄城县',159,'x','xiangchengxian'),(1609,'禹州市',159,'y','yuzhoushi'),(1610,'长葛市',159,'z','zhanggeshi'),(1612,'源汇区',160,'y','yuanhuiqu'),(1613,'郾城区',160,'y','yanchengqu'),(1614,'召陵区',160,'z','zhaolingqu'),(1615,'舞阳县',160,'w','wuyangxian'),(1616,'临颍县',160,'l','linyingxian'),(1618,'湖滨区',161,'h','hubinqu'),(1619,'渑池县',161,'m','mianchixian'),(1620,'陕县',161,'s','shanxian'),(1621,'卢氏县',161,'l','lushixian'),(1622,'义马市',161,'y','yimashi'),(1623,'灵宝市',161,'l','lingbaoshi'),(1625,'宛城区',162,'w','wanchengqu'),(1626,'卧龙区',162,'w','wolongqu'),(1627,'南召县',162,'n','nanzhaoxian'),(1628,'方城县',162,'f','fangchengxian'),(1629,'西峡县',162,'x','xixiaxian'),(1630,'镇平县',162,'z','zhenpingxian'),(1631,'内乡县',162,'n','neixiangxian'),(1632,'淅川县',162,'x','xichuanxian'),(1633,'社旗县',162,'s','sheqixian'),(1634,'唐河县',162,'t','tanghexian'),(1635,'新野县',162,'x','xinyexian'),(1636,'桐柏县',162,'t','tongboxian'),(1637,'邓州市',162,'d','dengzhoushi'),(1639,'梁园区',163,'l','liangyuanqu'),(1640,'睢阳区',163,'s','suiyangqu'),(1641,'民权县',163,'m','minquanxian'),(1642,'睢县',163,'s','suixian'),(1643,'宁陵县',163,'n','ninglingxian'),(1644,'柘城县',163,'z','zhechengxian'),(1645,'虞城县',163,'y','yuchengxian'),(1646,'夏邑县',163,'x','xiayixian'),(1647,'永城市',163,'y','yongchengshi'),(1649,'师河区',164,'s','shihequ'),(1650,'平桥区',164,'p','pingqiaoqu'),(1651,'罗山县',164,'l','luoshanxian'),(1652,'光山县',164,'g','guangshanxian'),(1653,'新县',164,'x','xinxian'),(1654,'商城县',164,'s','shangchengxian'),(1655,'固始县',164,'g','gushixian'),(1656,'潢川县',164,'h','huangchuanxian'),(1657,'淮滨县',164,'h','huaibinxian'),(1658,'息县',164,'x','xixian'),(1660,'川汇区',165,'c','chuanhuiqu'),(1661,'扶沟县',165,'f','fugouxian'),(1662,'西华县',165,'x','xihuaxian'),(1663,'商水县',165,'s','shangshuixian'),(1664,'沈丘县',165,'s','shenqiuxian'),(1665,'郸城县',165,'d','danchengxian'),(1666,'淮阳县',165,'h','huaiyangxian'),(1667,'太康县',165,'t','taikangxian'),(1668,'鹿邑县',165,'l','luyixian'),(1669,'项城市',165,'x','xiangchengshi'),(1671,'驿城区',166,'y','yichengqu'),(1672,'西平县',166,'x','xipingxian'),(1673,'上蔡县',166,'s','shangcaixian'),(1674,'平舆县',166,'p','pingyuxian'),(1675,'正阳县',166,'z','zhengyangxian'),(1676,'确山县',166,'q','queshanxian'),(1677,'泌阳县',166,'m','miyangxian'),(1678,'汝南县',166,'r','runanxian'),(1679,'遂平县',166,'s','suipingxian'),(1680,'新蔡县',166,'x','xincaixian'),(1682,'江岸区',167,'j','jianganqu'),(1683,'江汉区',167,'j','jianghanqu'),(1684,'乔口区',167,'q','qiaokouqu'),(1685,'汉阳区',167,'h','hanyangqu'),(1686,'武昌区',167,'w','wuchangqu'),(1687,'青山区',167,'q','qingshanqu'),(1688,'洪山区',167,'h','hongshanqu'),(1689,'东西湖区',167,'d','dongxihuqu'),(1690,'汉南区',167,'h','hannanqu'),(1691,'蔡甸区',167,'c','caidianqu'),(1692,'江夏区',167,'j','jiangxiaqu'),(1693,'黄陂区',167,'h','huangpoqu'),(1694,'新洲区',167,'x','xinzhouqu'),(1696,'黄石港区',168,'h','huangshigangqu'),(1697,'西塞山区',168,'x','xisaishanqu'),(1698,'下陆区',168,'x','xialuqu'),(1699,'铁山区',168,'t','tieshanqu'),(1700,'阳新县',168,'y','yangxinxian'),(1701,'大冶市',168,'d','dayeshi'),(1703,'茅箭区',169,'m','maojianqu'),(1704,'张湾区',169,'z','zhangwanqu'),(1705,'郧县',169,'y','yunxian'),(1706,'郧西县',169,'y','yunxixian'),(1707,'竹山县',169,'z','zhushanxian'),(1708,'竹溪县',169,'z','zhuxixian'),(1709,'房县',169,'f','fangxian'),(1710,'丹江口市',169,'d','danjiangkoushi'),(1712,'西陵区',170,'x','xilingqu'),(1713,'伍家岗区',170,'w','wujiagangqu'),(1714,'点军区',170,'d','dianjunqu'),(1715,'猇亭区',170,'y','yaotingqu'),(1716,'夷陵区',170,'y','yilingqu'),(1717,'远安县',170,'y','yuananxian'),(1718,'兴山县',170,'x','xingshanxian'),(1719,'秭归县',170,'z','ziguixian'),(1720,'长阳土家族自治县',170,'z','zhangyangtujiazuzizhixian'),(1721,'五峰土家族自治县',170,'w','wufengtujiazuzizhixian'),(1722,'宜都市',170,'y','yidoushi'),(1723,'当阳市',170,'d','dangyangshi'),(1724,'枝江市',170,'z','zhijiangshi'),(1726,'襄城区',171,'x','xiangchengqu'),(1727,'樊城区',171,'f','fanchengqu'),(1728,'襄阳区',171,'x','xiangyangqu'),(1729,'南漳县',171,'n','nanzhangxian'),(1730,'谷城县',171,'g','guchengxian'),(1731,'保康县',171,'b','baokangxian'),(1732,'老河口市',171,'l','laohekoushi'),(1733,'枣阳市',171,'z','zaoyangshi'),(1734,'宜城市',171,'y','yichengshi'),(1736,'梁子湖区',172,'l','liangzihuqu'),(1737,'华容区',172,'h','huarongqu'),(1738,'鄂城区',172,'e','echengqu'),(1740,'东宝区',173,'d','dongbaoqu'),(1741,'掇刀区',173,'d','duodaoqu'),(1742,'京山县',173,'j','jingshanxian'),(1743,'沙洋县',173,'s','shayangxian'),(1744,'钟祥市',173,'z','zhongxiangshi'),(1746,'孝南区',174,'x','xiaonanqu'),(1747,'孝昌县',174,'x','xiaochangxian'),(1748,'大悟县',174,'d','dawuxian'),(1749,'云梦县',174,'y','yunmengxian'),(1750,'应城市',174,'y','yingchengshi'),(1751,'安陆市',174,'a','anlushi'),(1752,'汉川市',174,'h','hanchuanshi'),(1754,'沙市区',175,'s','shashiqu'),(1755,'荆州区',175,'j','jingzhouqu'),(1756,'公安县',175,'g','gonganxian'),(1757,'监利县',175,'j','jianlixian'),(1758,'江陵县',175,'j','jianglingxian'),(1759,'石首市',175,'s','shishoushi'),(1760,'洪湖市',175,'h','honghushi'),(1761,'松滋市',175,'s','songzishi'),(1763,'黄州区',176,'h','huangzhouqu'),(1764,'团风县',176,'t','tuanfengxian'),(1765,'红安县',176,'h','honganxian'),(1766,'罗田县',176,'l','luotianxian'),(1767,'英山县',176,'y','yingshanxian'),(1768,'浠水县',176,'x','xishuixian'),(1769,'蕲春县',176,'q','qichunxian'),(1770,'黄梅县',176,'h','huangmeixian'),(1771,'麻城市',176,'m','machengshi'),(1772,'武穴市',176,'w','wuxueshi'),(1774,'咸安区',177,'x','xiananqu'),(1775,'嘉鱼县',177,'j','jiayuxian'),(1776,'通城县',177,'t','tongchengxian'),(1777,'崇阳县',177,'c','chongyangxian'),(1778,'通山县',177,'t','tongshanxian'),(1779,'赤壁市',177,'c','chibishi'),(1781,'曾都区',178,'c','cengdouqu'),(1782,'广水市',178,'g','guangshuishi'),(1783,'恩施市',179,'e','enshishi'),(1784,'利川市',179,'l','lichuanshi'),(1785,'建始县',179,'j','jianshixian'),(1786,'巴东县',179,'b','badongxian'),(1787,'宣恩县',179,'x','xuanenxian'),(1788,'咸丰县',179,'x','xianfengxian'),(1789,'来凤县',179,'l','laifengxian'),(1790,'鹤峰县',179,'h','hefengxian'),(1791,'仙桃市',180,'x','xiantaoshi'),(1792,'潜江市',180,'q','qianjiangshi'),(1793,'天门市',180,'t','tianmenshi'),(1794,'神农架林区',180,'s','shennongjialinqu'),(1796,'芙蓉区',181,'f','furongqu'),(1797,'天心区',181,'t','tianxinqu'),(1798,'岳麓区',181,'y','yueluqu'),(1799,'开福区',181,'k','kaifuqu'),(1800,'雨花区',181,'y','yuhuaqu'),(1801,'长沙县',181,'z','zhangshaxian'),(1802,'望城县',181,'w','wangchengxian'),(1803,'宁乡县',181,'n','ningxiangxian'),(1804,'浏阳市',181,'l','liuyangshi'),(1806,'荷塘区',182,'h','hetangqu'),(1807,'芦淞区',182,'l','lusongqu'),(1808,'石峰区',182,'s','shifengqu'),(1809,'天元区',182,'t','tianyuanqu'),(1810,'株洲县',182,'z','zhuzhouxian'),(1811,'攸县',182,'y','youxian'),(1812,'茶陵县',182,'c','chalingxian'),(1813,'炎陵县',182,'y','yanlingxian'),(1814,'醴陵市',182,'l','lilingshi'),(1816,'雨湖区',183,'y','yuhuqu'),(1817,'岳塘区',183,'y','yuetangqu'),(1818,'湘潭县',183,'x','xiangtanxian'),(1819,'湘乡市',183,'x','xiangxiangshi'),(1820,'韶山市',183,'s','shaoshanshi'),(1822,'珠晖区',184,'z','zhuhuiqu'),(1823,'雁峰区',184,'y','yanfengqu'),(1824,'石鼓区',184,'s','shiguqu'),(1825,'蒸湘区',184,'z','zhengxiangqu'),(1826,'南岳区',184,'n','nanyuequ'),(1827,'衡阳县',184,'h','hengyangxian'),(1828,'衡南县',184,'h','hengnanxian'),(1829,'衡山县',184,'h','hengshanxian'),(1830,'衡东县',184,'h','hengdongxian'),(1831,'祁东县',184,'q','qidongxian'),(1832,'耒阳市',184,'l','leiyangshi'),(1833,'常宁市',184,'c','changningshi'),(1835,'双清区',185,'s','shuangqingqu'),(1836,'大祥区',185,'d','daxiangqu'),(1837,'北塔区',185,'b','beitaqu'),(1838,'邵东县',185,'s','shaodongxian'),(1839,'新邵县',185,'x','xinshaoxian'),(1840,'邵阳县',185,'s','shaoyangxian'),(1841,'隆回县',185,'l','longhuixian'),(1842,'洞口县',185,'d','dongkouxian'),(1843,'绥宁县',185,'s','suiningxian'),(1844,'新宁县',185,'x','xinningxian'),(1845,'城步苗族自治县',185,'c','chengbumiaozuzizhixian'),(1846,'武冈市',185,'w','wugangshi'),(1848,'岳阳楼区',186,'y','yueyanglouqu'),(1849,'云溪区',186,'y','yunxiqu'),(1850,'君山区',186,'j','junshanqu'),(1851,'岳阳县',186,'y','yueyangxian'),(1852,'华容县',186,'h','huarongxian'),(1853,'湘阴县',186,'x','xiangyinxian'),(1854,'平江县',186,'p','pingjiangxian'),(1855,'汨罗市',186,'m','miluoshi'),(1856,'临湘市',186,'l','linxiangshi'),(1858,'武陵区',187,'w','wulingqu'),(1859,'鼎城区',187,'d','dingchengqu'),(1860,'安乡县',187,'a','anxiangxian'),(1861,'汉寿县',187,'h','hanshouxian'),(1862,'澧县',187,'l','lixian'),(1863,'临澧县',187,'l','linlixian'),(1864,'桃源县',187,'t','taoyuanxian'),(1865,'石门县',187,'s','shimenxian'),(1866,'津市市',187,'j','jinshishi'),(1868,'永定区',188,'y','yongdingqu'),(1869,'武陵源区',188,'w','wulingyuanqu'),(1870,'慈利县',188,'c','cilixian'),(1871,'桑植县',188,'s','sangzhixian'),(1873,'资阳区',189,'z','ziyangqu'),(1874,'赫山区',189,'h','heshanqu'),(1875,'南县',189,'n','nanxian'),(1876,'桃江县',189,'t','taojiangxian'),(1877,'安化县',189,'a','anhuaxian'),(1878,'沅江市',189,'y','yuanjiangshi'),(1880,'北湖区',190,'b','beihuqu'),(1881,'苏仙区',190,'s','suxianqu'),(1882,'桂阳县',190,'g','guiyangxian'),(1883,'宜章县',190,'y','yizhangxian'),(1884,'永兴县',190,'y','yongxingxian'),(1885,'嘉禾县',190,'j','jiahexian'),(1886,'临武县',190,'l','linwuxian'),(1887,'汝城县',190,'r','ruchengxian'),(1888,'桂东县',190,'g','guidongxian'),(1889,'安仁县',190,'a','anrenxian'),(1890,'资兴市',190,'z','zixingshi'),(1892,'芝山区',191,'z','zhishanqu'),(1893,'冷水滩区',191,'l','lengshuitanqu'),(1894,'祁阳县',191,'q','qiyangxian'),(1895,'东安县',191,'d','donganxian'),(1896,'双牌县',191,'s','shuangpaixian'),(1897,'道县',191,'d','daoxian'),(1898,'江永县',191,'j','jiangyongxian'),(1899,'宁远县',191,'n','ningyuanxian'),(1900,'蓝山县',191,'l','lanshanxian'),(1901,'新田县',191,'x','xintianxian'),(1902,'江华瑶族自治县',191,'j','jianghuayaozuzizhixian'),(1904,'鹤城区',192,'h','hechengqu'),(1905,'中方县',192,'z','zhongfangxian'),(1906,'沅陵县',192,'y','yuanlingxian'),(1907,'辰溪县',192,'c','chenxixian'),(1908,'溆浦县',192,'x','xupuxian'),(1909,'会同县',192,'h','huitongxian'),(1910,'麻阳苗族自治县',192,'m','mayangmiaozuzizhixian'),(1911,'新晃侗族自治县',192,'x','xinhuangdongzuzizhixian'),(1912,'芷江侗族自治县',192,'z','zhijiangdongzuzizhixian'),(1913,'靖州苗族侗族自治县',192,'j','jingzhoumiaozudongzuzizhixian'),(1914,'通道侗族自治县',192,'t','tongdaodongzuzizhixian'),(1915,'洪江市',192,'h','hongjiangshi'),(1917,'娄星区',193,'l','louxingqu'),(1918,'双峰县',193,'s','shuangfengxian'),(1919,'新化县',193,'x','xinhuaxian'),(1920,'冷水江市',193,'l','lengshuijiangshi'),(1921,'涟源市',193,'l','lianyuanshi'),(1922,'吉首市',194,'j','jishoushi'),(1923,'泸溪县',194,'l','luxixian'),(1924,'凤凰县',194,'f','fenghuangxian'),(1925,'花垣县',194,'h','huayuanxian'),(1926,'保靖县',194,'b','baojingxian'),(1927,'古丈县',194,'g','guzhangxian'),(1928,'永顺县',194,'y','yongshunxian'),(1929,'龙山县',194,'l','longshanxian'),(1931,'东山区',195,'d','dongshanqu'),(1932,'荔湾区',195,'l','liwanqu'),(1933,'越秀区',195,'y','yuexiuqu'),(1934,'海珠区',195,'h','haizhuqu'),(1935,'天河区',195,'t','tianhequ'),(1936,'芳村区',195,'f','fangcunqu'),(1937,'白云区',195,'b','baiyunqu'),(1938,'黄埔区',195,'h','huangpuqu'),(1939,'番禺区',195,'f','fanyuqu'),(1940,'花都区',195,'h','huadouqu'),(1941,'增城市',195,'z','zengchengshi'),(1942,'从化市',195,'c','conghuashi'),(1944,'武江区',196,'w','wujiangqu'),(1945,'浈江区',196,'z','zhenjiangqu'),(1946,'曲江区',196,'q','qujiangqu'),(1947,'始兴县',196,'s','shixingxian'),(1948,'仁化县',196,'r','renhuaxian'),(1949,'翁源县',196,'w','wengyuanxian'),(1950,'乳源瑶族自治县',196,'r','ruyuanyaozuzizhixian'),(1951,'新丰县',196,'x','xinfengxian'),(1952,'乐昌市',196,'l','lechangshi'),(1953,'南雄市',196,'n','nanxiongshi'),(1955,'罗湖区',197,'l','luohuqu'),(1956,'福田区',197,'f','futianqu'),(1957,'南山区',197,'n','nanshanqu'),(1958,'宝安区',197,'b','baoanqu'),(1959,'龙岗区',197,'l','longgangqu'),(1960,'盐田区',197,'y','yantianqu'),(1962,'香洲区',198,'x','xiangzhouqu'),(1963,'斗门区',198,'d','doumenqu'),(1964,'金湾区',198,'j','jinwanqu'),(1966,'龙湖区',199,'l','longhuqu'),(1967,'金平区',199,'j','jinpingqu'),(1968,'濠江区',199,'h','haojiangqu'),(1969,'潮阳区',199,'c','chaoyangqu'),(1970,'潮南区',199,'c','chaonanqu'),(1971,'澄海区',199,'c','chenghaiqu'),(1972,'南澳县',199,'n','nanaoxian'),(1974,'禅城区',200,'s','shanchengqu'),(1975,'南海区',200,'n','nanhaiqu'),(1976,'顺德区',200,'s','shundequ'),(1977,'三水区',200,'s','sanshuiqu'),(1978,'高明区',200,'g','gaomingqu'),(1980,'蓬江区',201,'p','pengjiangqu'),(1981,'江海区',201,'j','jianghaiqu'),(1982,'新会区',201,'x','xinhuiqu'),(1983,'台山市',201,'t','taishanshi'),(1984,'开平市',201,'k','kaipingshi'),(1985,'鹤山市',201,'h','heshanshi'),(1986,'恩平市',201,'e','enpingshi'),(1988,'赤坎区',202,'c','chikanqu'),(1989,'霞山区',202,'x','xiashanqu'),(1990,'坡头区',202,'p','potouqu'),(1991,'麻章区',202,'m','mazhangqu'),(1992,'遂溪县',202,'s','suixixian'),(1993,'徐闻县',202,'x','xuwenxian'),(1994,'廉江市',202,'l','lianjiangshi'),(1995,'雷州市',202,'l','leizhoushi'),(1996,'吴川市',202,'w','wuchuanshi'),(1998,'茂南区',203,'m','maonanqu'),(1999,'茂港区',203,'m','maogangqu'),(2000,'电白县',203,'d','dianbaixian'),(2001,'高州市',203,'g','gaozhoushi'),(2002,'化州市',203,'h','huazhoushi'),(2003,'信宜市',203,'x','xinyishi'),(2005,'端州区',204,'d','duanzhouqu'),(2006,'鼎湖区',204,'d','dinghuqu'),(2007,'广宁县',204,'g','guangningxian'),(2008,'怀集县',204,'h','huaijixian'),(2009,'封开县',204,'f','fengkaixian'),(2010,'德庆县',204,'d','deqingxian'),(2011,'高要市',204,'g','gaoyaoshi'),(2012,'四会市',204,'s','sihuishi'),(2014,'惠城区',205,'h','huichengqu'),(2015,'惠阳区',205,'h','huiyangqu'),(2016,'博罗县',205,'b','boluoxian'),(2017,'惠东县',205,'h','huidongxian'),(2018,'龙门县',205,'l','longmenxian'),(2020,'梅江区',206,'m','meijiangqu'),(2021,'梅县',206,'m','meixian'),(2022,'大埔县',206,'d','dapuxian'),(2023,'丰顺县',206,'f','fengshunxian'),(2024,'五华县',206,'w','wuhuaxian'),(2025,'平远县',206,'p','pingyuanxian'),(2026,'蕉岭县',206,'j','jiaolingxian'),(2027,'兴宁市',206,'x','xingningshi'),(2029,'城区',207,'c','chengqu'),(2030,'海丰县',207,'h','haifengxian'),(2031,'陆河县',207,'l','luhexian'),(2032,'陆丰市',207,'l','lufengshi'),(2034,'源城区',208,'y','yuanchengqu'),(2035,'紫金县',208,'z','zijinxian'),(2036,'龙川县',208,'l','longchuanxian'),(2037,'连平县',208,'l','lianpingxian'),(2038,'和平县',208,'h','hepingxian'),(2039,'东源县',208,'d','dongyuanxian'),(2041,'江城区',209,'j','jiangchengqu'),(2042,'阳西县',209,'y','yangxixian'),(2043,'阳东县',209,'y','yangdongxian'),(2044,'阳春市',209,'y','yangchunshi'),(2046,'清城区',210,'q','qingchengqu'),(2047,'佛冈县',210,'f','fogangxian'),(2048,'阳山县',210,'y','yangshanxian'),(2049,'连山壮族瑶族自治县',210,'l','lianshanzhuangzuyaozuzizhixian'),(2050,'连南瑶族自治县',210,'l','liannanyaozuzizhixian'),(2051,'清新县',210,'q','qingxinxian'),(2052,'英德市',210,'y','yingdeshi'),(2053,'连州市',210,'l','lianzhoushi'),(2055,'湘桥区',213,'x','xiangqiaoqu'),(2056,'潮安县',213,'c','chaoanxian'),(2057,'饶平县',213,'r','raopingxian'),(2059,'榕城区',214,'r','rongchengqu'),(2060,'揭东县',214,'j','jiedongxian'),(2061,'揭西县',214,'j','jiexixian'),(2062,'惠来县',214,'h','huilaixian'),(2063,'普宁市',214,'p','puningshi'),(2065,'云城区',215,'y','yunchengqu'),(2066,'新兴县',215,'x','xinxingxian'),(2067,'郁南县',215,'y','yunanxian'),(2068,'云安县',215,'y','yunanxian'),(2069,'罗定市',215,'l','luodingshi'),(2071,'兴宁区',216,'x','xingningqu'),(2072,'青秀区',216,'q','qingxiuqu'),(2073,'江南区',216,'j','jiangnanqu'),(2074,'西乡塘区',216,'x','xixiangtangqu'),(2075,'良庆区',216,'l','liangqingqu'),(2076,'邕宁区',216,'y','yongningqu'),(2077,'武鸣县',216,'w','wumingxian'),(2078,'隆安县',216,'l','longanxian'),(2079,'马山县',216,'m','mashanxian'),(2080,'上林县',216,'s','shanglinxian'),(2081,'宾阳县',216,'b','binyangxian'),(2082,'横县',216,'h','hengxian'),(2084,'城中区',217,'c','chengzhongqu'),(2085,'鱼峰区',217,'y','yufengqu'),(2086,'柳南区',217,'l','liunanqu'),(2087,'柳北区',217,'l','liubeiqu'),(2088,'柳江县',217,'l','liujiangxian'),(2089,'柳城县',217,'l','liuchengxian'),(2090,'鹿寨县',217,'l','luzhaixian'),(2091,'融安县',217,'r','ronganxian'),(2092,'融水苗族自治县',217,'r','rongshuimiaozuzizhixian'),(2093,'三江侗族自治县',217,'s','sanjiangdongzuzizhixian'),(2095,'秀峰区',218,'x','xiufengqu'),(2096,'叠彩区',218,'d','diecaiqu'),(2097,'象山区',218,'x','xiangshanqu'),(2098,'七星区',218,'q','qixingqu'),(2099,'雁山区',218,'y','yanshanqu'),(2100,'阳朔县',218,'y','yangshuoxian'),(2101,'临桂县',218,'l','linguixian'),(2102,'灵川县',218,'l','lingchuanxian'),(2103,'全州县',218,'q','quanzhouxian'),(2104,'兴安县',218,'x','xinganxian'),(2105,'永福县',218,'y','yongfuxian'),(2106,'灌阳县',218,'g','guanyangxian'),(2107,'龙胜各族自治县',218,'l','longshenggezuzizhixian'),(2108,'资源县',218,'z','ziyuanxian'),(2109,'平乐县',218,'p','pinglexian'),(2110,'荔蒲县',218,'l','lipuxian'),(2111,'恭城瑶族自治县',218,'g','gongchengyaozuzizhixian'),(2113,'万秀区',219,'w','wanxiuqu'),(2114,'蝶山区',219,'d','dieshanqu'),(2115,'长洲区',219,'z','zhangzhouqu'),(2116,'苍梧县',219,'c','cangwuxian'),(2117,'藤县',219,'t','tengxian'),(2118,'蒙山县',219,'m','mengshanxian'),(2119,'岑溪市',219,'c','cenxishi'),(2121,'海城区',220,'h','haichengqu'),(2122,'银海区',220,'y','yinhaiqu'),(2123,'铁山港区',220,'t','tieshangangqu'),(2124,'合浦县',220,'h','hepuxian'),(2126,'港口区',221,'g','gangkouqu'),(2127,'防城区',221,'f','fangchengqu'),(2128,'上思县',221,'s','shangsixian'),(2129,'东兴市',221,'d','dongxingshi'),(2131,'钦南区',222,'q','qinnanqu'),(2132,'钦北区',222,'q','qinbeiqu'),(2133,'灵山县',222,'l','lingshanxian'),(2134,'浦北县',222,'p','pubeixian'),(2136,'港北区',223,'g','gangbeiqu'),(2137,'港南区',223,'g','gangnanqu'),(2138,'覃塘区',223,'t','tantangqu'),(2139,'平南县',223,'p','pingnanxian'),(2140,'桂平市',223,'g','guipingshi'),(2142,'玉州区',224,'y','yuzhouqu'),(2143,'容县',224,'r','rongxian'),(2144,'陆川县',224,'l','luchuanxian'),(2145,'博白县',224,'b','bobaixian'),(2146,'兴业县',224,'x','xingyexian'),(2147,'北流市',224,'b','beiliushi'),(2149,'右江区',225,'y','youjiangqu'),(2150,'田阳县',225,'t','tianyangxian'),(2151,'田东县',225,'t','tiandongxian'),(2152,'平果县',225,'p','pingguoxian'),(2153,'德保县',225,'d','debaoxian'),(2154,'靖西县',225,'j','jingxixian'),(2155,'那坡县',225,'n','neipoxian'),(2156,'凌云县',225,'l','lingyunxian'),(2157,'乐业县',225,'l','leyexian'),(2158,'田林县',225,'t','tianlinxian'),(2159,'西林县',225,'x','xilinxian'),(2160,'隆林各族自治县',225,'l','longlingezuzizhixian'),(2162,'八步区',226,'b','babuqu'),(2163,'昭平县',226,'z','zhaopingxian'),(2164,'钟山县',226,'z','zhongshanxian'),(2165,'富川瑶族自治县',226,'f','fuchuanyaozuzizhixian'),(2167,'金城江区',227,'j','jinchengjiangqu'),(2168,'南丹县',227,'n','nandanxian'),(2169,'天峨县',227,'t','tianexian'),(2170,'凤山县',227,'f','fengshanxian'),(2171,'东兰县',227,'d','donglanxian'),(2172,'罗城仫佬族自治县',227,'l','luochengmulaozuzizhixian'),(2173,'环江毛南族自治县',227,'h','huanjiangmaonanzuzizhixian'),(2174,'巴马瑶族自治县',227,'b','bamayaozuzizhixian'),(2175,'都安瑶族自治县',227,'d','douanyaozuzizhixian'),(2176,'大化瑶族自治县',227,'d','dahuayaozuzizhixian'),(2177,'宜州市',227,'y','yizhoushi'),(2179,'兴宾区',228,'x','xingbinqu'),(2180,'忻城县',228,'x','xinchengxian'),(2181,'象州县',228,'x','xiangzhouxian'),(2182,'武宣县',228,'w','wuxuanxian'),(2183,'金秀瑶族自治县',228,'j','jinxiuyaozuzizhixian'),(2184,'合山市',228,'h','heshanshi'),(2186,'江洲区',229,'j','jiangzhouqu'),(2187,'扶绥县',229,'f','fusuixian'),(2188,'宁明县',229,'n','ningmingxian'),(2189,'龙州县',229,'l','longzhouxian'),(2190,'大新县',229,'d','daxinxian'),(2191,'天等县',229,'t','tiandengxian'),(2192,'凭祥市',229,'p','pingxiangshi'),(2194,'秀英区',230,'x','xiuyingqu'),(2195,'龙华区',230,'l','longhuaqu'),(2196,'琼山区',230,'q','qiongshanqu'),(2197,'美兰区',230,'m','meilanqu'),(2199,'五指山市',232,'w','wuzhishanshi'),(2200,'琼海市',232,'q','qionghaishi'),(2201,'儋州市',232,'d','danzhoushi'),(2202,'文昌市',232,'w','wenchangshi'),(2203,'万宁市',232,'w','wanningshi'),(2204,'东方市',232,'d','dongfangshi'),(2205,'定安县',232,'d','dinganxian'),(2206,'屯昌县',232,'t','tunchangxian'),(2207,'澄迈县',232,'c','chengmaixian'),(2208,'临高县',232,'l','lingaoxian'),(2209,'白沙黎族自治县',232,'b','baishalizuzizhixian'),(2210,'昌江黎族自治县',232,'c','changjianglizuzizhixian'),(2211,'乐东黎族自治县',232,'l','ledonglizuzizhixian'),(2212,'陵水黎族自治县',232,'l','lingshuilizuzizhixian'),(2213,'保亭黎族苗族自治县',232,'b','baotinglizumiaozuzizhixian'),(2214,'琼中黎族苗族自治县',232,'q','qiongzhonglizumiaozuzizhixian'),(2215,'西沙群岛',232,'x','xishaqundao'),(2216,'南沙群岛',232,'n','nanshaqundao'),(2217,'中沙群岛的岛礁及其海',232,'z','zhongshaqundaodedaojiaojiqihai'),(2218,'万州区',340,'w','wanzhouqu'),(2219,'涪陵区',340,'f','fulingqu'),(2220,'渝中区',340,'y','yuzhongqu'),(2221,'大渡口区',340,'d','dadukouqu'),(2222,'江北区',340,'j','jiangbeiqu'),(2223,'沙坪坝区',340,'s','shapingbaqu'),(2224,'九龙坡区',340,'j','jiulongpoqu'),(2225,'南岸区',340,'n','nananqu'),(2226,'北碚区',340,'b','beibeiqu'),(2227,'万盛区',340,'w','wanshengqu'),(2228,'双桥区',340,'s','shuangqiaoqu'),(2229,'渝北区',340,'y','yubeiqu'),(2230,'巴南区',340,'b','bananqu'),(2231,'黔江区',340,'q','qianjiangqu'),(2232,'长寿区',340,'z','zhangshouqu'),(2259,'锦江区',233,'j','jinjiangqu'),(2260,'青羊区',233,'q','qingyangqu'),(2261,'金牛区',233,'j','jinniuqu'),(2262,'武侯区',233,'w','wuhouqu'),(2263,'成华区',233,'c','chenghuaqu'),(2264,'龙泉驿区',233,'l','longquanyiqu'),(2265,'青白江区',233,'q','qingbaijiangqu'),(2266,'新都区',233,'x','xindouqu'),(2267,'温江区',233,'w','wenjiangqu'),(2268,'金堂县',233,'j','jintangxian'),(2269,'双流县',233,'s','shuangliuxian'),(2270,'郫县',233,'p','pixian'),(2271,'大邑县',233,'d','dayixian'),(2272,'蒲江县',233,'p','pujiangxian'),(2273,'新津县',233,'x','xinjinxian'),(2274,'都江堰市',233,'d','doujiangyanshi'),(2275,'彭州市',233,'p','pengzhoushi'),(2276,'邛崃市',233,'q','qionglaishi'),(2277,'崇州市',233,'c','chongzhoushi'),(2279,'自流井区',234,'z','ziliujingqu'),(2280,'贡井区',234,'g','gongjingqu'),(2281,'大安区',234,'d','daanqu'),(2282,'沿滩区',234,'y','yantanqu'),(2283,'荣县',234,'r','rongxian'),(2284,'富顺县',234,'f','fushunxian'),(2286,'东区',235,'d','dongqu'),(2287,'西区',235,'x','xiqu'),(2288,'仁和区',235,'r','renhequ'),(2289,'米易县',235,'m','miyixian'),(2290,'盐边县',235,'y','yanbianxian'),(2292,'江阳区',236,'j','jiangyangqu'),(2293,'纳溪区',236,'n','naxiqu'),(2294,'龙马潭区',236,'l','longmatanqu'),(2295,'泸县',236,'l','luxian'),(2296,'合江县',236,'h','hejiangxian'),(2297,'叙永县',236,'x','xuyongxian'),(2298,'古蔺县',236,'g','gulinxian'),(2300,'旌阳区',237,'j','jingyangqu'),(2301,'中江县',237,'z','zhongjiangxian'),(2302,'罗江县',237,'l','luojiangxian'),(2303,'广汉市',237,'g','guanghanshi'),(2304,'什邡市',237,'s','shenfangshi'),(2305,'绵竹市',237,'m','mianzhushi'),(2307,'涪城区',238,'f','fuchengqu'),(2308,'游仙区',238,'y','youxianqu'),(2309,'三台县',238,'s','santaixian'),(2310,'盐亭县',238,'y','yantingxian'),(2311,'安县',238,'a','anxian'),(2312,'梓潼县',238,'z','zitongxian'),(2313,'北川羌族自治县',238,'b','beichuanqiangzuzizhixian'),(2314,'平武县',238,'p','pingwuxian'),(2315,'江油市',238,'j','jiangyoushi'),(2317,'市中区',239,'s','shizhongqu'),(2318,'元坝区',239,'y','yuanbaqu'),(2319,'朝天区',239,'c','chaotianqu'),(2320,'旺苍县',239,'w','wangcangxian'),(2321,'青川县',239,'q','qingchuanxian'),(2322,'剑阁县',239,'j','jiangexian'),(2323,'苍溪县',239,'c','cangxixian'),(2325,'船山区',240,'c','chuanshanqu'),(2326,'安居区',240,'a','anjuqu'),(2327,'蓬溪县',240,'p','pengxixian'),(2328,'射洪县',240,'s','shehongxian'),(2329,'大英县',240,'d','dayingxian'),(2331,'市中区',241,'s','shizhongqu'),(2332,'东兴区',241,'d','dongxingqu'),(2333,'威远县',241,'w','weiyuanxian'),(2334,'资中县',241,'z','zizhongxian'),(2335,'隆昌县',241,'l','longchangxian'),(2337,'市中区',242,'s','shizhongqu'),(2338,'沙湾区',242,'s','shawanqu'),(2339,'五通桥区',242,'w','wutongqiaoqu'),(2340,'金口河区',242,'j','jinkouhequ'),(2341,'犍为县',242,'j','jianweixian'),(2342,'井研县',242,'j','jingyanxian'),(2343,'夹江县',242,'j','jiajiangxian'),(2344,'沐川县',242,'m','muchuanxian'),(2345,'峨边彝族自治县',242,'e','ebianyizuzizhixian'),(2346,'马边彝族自治县',242,'m','mabianyizuzizhixian'),(2347,'峨眉山市',242,'e','emeishanshi'),(2349,'顺庆区',243,'s','shunqingqu'),(2350,'高坪区',243,'g','gaopingqu'),(2351,'嘉陵区',243,'j','jialingqu'),(2352,'南部县',243,'n','nanbuxian'),(2353,'营山县',243,'y','yingshanxian'),(2354,'蓬安县',243,'p','penganxian'),(2355,'仪陇县',243,'y','yilongxian'),(2356,'西充县',243,'x','xichongxian'),(2357,'阆中市',243,'l','langzhongshi'),(2359,'东坡区',244,'d','dongpoqu'),(2360,'仁寿县',244,'r','renshouxian'),(2361,'彭山县',244,'p','pengshanxian'),(2362,'洪雅县',244,'h','hongyaxian'),(2363,'丹棱县',244,'d','danlengxian'),(2364,'青神县',244,'q','qingshenxian'),(2366,'翠屏区',245,'c','cuipingqu'),(2367,'宜宾县',245,'y','yibinxian'),(2368,'南溪县',245,'n','nanxixian'),(2369,'江安县',245,'j','jianganxian'),(2370,'长宁县',245,'z','zhangningxian'),(2371,'高县',245,'g','gaoxian'),(2372,'珙县',245,'g','gongxian'),(2373,'筠连县',245,'y','yunlianxian'),(2374,'兴文县',245,'x','xingwenxian'),(2375,'屏山县',245,'p','pingshanxian'),(2377,'广安区',246,'g','guanganqu'),(2378,'岳池县',246,'y','yuechixian'),(2379,'武胜县',246,'w','wushengxian'),(2380,'邻水县',246,'l','linshuixian'),(2381,'华莹市',246,'h','huayingshi'),(2383,'通川区',247,'t','tongchuanqu'),(2384,'达县',247,'d','daxian'),(2385,'宣汉县',247,'x','xuanhanxian'),(2386,'开江县',247,'k','kaijiangxian'),(2387,'大竹县',247,'d','dazhuxian'),(2388,'渠县',247,'q','quxian'),(2389,'万源市',247,'w','wanyuanshi'),(2391,'雨城区',248,'y','yuchengqu'),(2392,'名山县',248,'m','mingshanxian'),(2393,'荥经县',248,'y','yingjingxian'),(2394,'汉源县',248,'h','hanyuanxian'),(2395,'石棉县',248,'s','shimianxian'),(2396,'天全县',248,'t','tianquanxian'),(2397,'芦山县',248,'l','lushanxian'),(2398,'宝兴县',248,'b','baoxingxian'),(2400,'巴州区',249,'b','bazhouqu'),(2401,'通江县',249,'t','tongjiangxian'),(2402,'南江县',249,'n','nanjiangxian'),(2403,'平昌县',249,'p','pingchangxian'),(2405,'雁江区',250,'y','yanjiangqu'),(2406,'安岳县',250,'a','anyuexian'),(2407,'乐至县',250,'l','lezhixian'),(2408,'简阳市',250,'j','jianyangshi'),(2409,'汶川县',251,'w','wenchuanxian'),(2410,'理县',251,'l','lixian'),(2411,'茂县',251,'m','maoxian'),(2412,'松潘县',251,'s','songpanxian'),(2413,'九寨沟县',251,'j','jiuzhaigouxian'),(2414,'金川县',251,'j','jinchuanxian'),(2415,'小金县',251,'x','xiaojinxian'),(2416,'黑水县',251,'h','heishuixian'),(2417,'马尔康县',251,'m','maerkangxian'),(2418,'壤塘县',251,'r','rangtangxian'),(2419,'阿坝县',251,'a','abaxian'),(2420,'若尔盖县',251,'r','ruoergaixian'),(2421,'红原县',251,'h','hongyuanxian'),(2422,'康定县',252,'k','kangdingxian'),(2423,'泸定县',252,'l','ludingxian'),(2424,'丹巴县',252,'d','danbaxian'),(2425,'九龙县',252,'j','jiulongxian'),(2426,'雅江县',252,'y','yajiangxian'),(2427,'道孚县',252,'d','daofuxian'),(2428,'炉霍县',252,'l','luhuoxian'),(2429,'甘孜县',252,'g','ganzixian'),(2430,'新龙县',252,'x','xinlongxian'),(2431,'德格县',252,'d','degexian'),(2432,'白玉县',252,'b','baiyuxian'),(2433,'石渠县',252,'s','shiquxian'),(2434,'色达县',252,'s','sedaxian'),(2435,'理塘县',252,'l','litangxian'),(2436,'巴塘县',252,'b','batangxian'),(2437,'乡城县',252,'x','xiangchengxian'),(2438,'稻城县',252,'d','daochengxian'),(2439,'得荣县',252,'d','derongxian'),(2440,'西昌市',253,'x','xichangshi'),(2441,'木里藏族自治县',253,'m','mulizangzuzizhixian'),(2442,'盐源县',253,'y','yanyuanxian'),(2443,'德昌县',253,'d','dechangxian'),(2444,'会理县',253,'h','huilixian'),(2445,'会东县',253,'h','huidongxian'),(2446,'宁南县',253,'n','ningnanxian'),(2447,'普格县',253,'p','pugexian'),(2448,'布拖县',253,'b','butuoxian'),(2449,'金阳县',253,'j','jinyangxian'),(2450,'昭觉县',253,'z','zhaojuexian'),(2451,'喜德县',253,'x','xidexian'),(2452,'冕宁县',253,'m','mianningxian'),(2453,'越西县',253,'y','yuexixian'),(2454,'甘洛县',253,'g','ganluoxian'),(2455,'美姑县',253,'m','meiguxian'),(2456,'雷波县',253,'l','leiboxian'),(2458,'南明区',254,'n','nanmingqu'),(2459,'云岩区',254,'y','yunyanqu'),(2460,'花溪区',254,'h','huaxiqu'),(2461,'乌当区',254,'w','wudangqu'),(2462,'白云区',254,'b','baiyunqu'),(2463,'小河区',254,'x','xiaohequ'),(2464,'开阳县',254,'k','kaiyangxian'),(2465,'息烽县',254,'x','xifengxian'),(2466,'修文县',254,'x','xiuwenxian'),(2467,'清镇市',254,'q','qingzhenshi'),(2468,'钟山区',255,'z','zhongshanqu'),(2469,'六枝特区',255,'l','liuzhitequ'),(2470,'水城县',255,'s','shuichengxian'),(2471,'盘县',255,'p','panxian'),(2473,'红花岗区',256,'h','honghuagangqu'),(2474,'汇川区',256,'h','huichuanqu'),(2475,'遵义县',256,'z','zunyixian'),(2476,'桐梓县',256,'t','tongzixian'),(2477,'绥阳县',256,'s','suiyangxian'),(2478,'正安县',256,'z','zhenganxian'),(2479,'道真仡佬族苗族自治县',256,'d','daozhengelaozumiaozuzizhixian'),(2480,'务川仡佬族苗族自治县',256,'w','wuchuangelaozumiaozuzizhixian'),(2481,'凤冈县',256,'f','fenggangxian'),(2482,'湄潭县',256,'m','meitanxian'),(2483,'余庆县',256,'y','yuqingxian'),(2484,'习水县',256,'x','xishuixian'),(2485,'赤水市',256,'c','chishuishi'),(2486,'仁怀市',256,'r','renhuaishi'),(2488,'西秀区',257,'x','xixiuqu'),(2489,'平坝县',257,'p','pingbaxian'),(2490,'普定县',257,'p','pudingxian'),(2491,'镇宁布依族苗族自治县',257,'z','zhenningbuyizumiaozuzizhixian'),(2492,'关岭布依族苗族自治县',257,'g','guanlingbuyizumiaozuzizhixian'),(2493,'紫云苗族布依族自治县',257,'z','ziyunmiaozubuyizuzizhixian'),(2494,'铜仁市',258,'t','tongrenshi'),(2495,'江口县',258,'j','jiangkouxian'),(2496,'玉屏侗族自治县',258,'y','yupingdongzuzizhixian'),(2497,'石阡县',258,'s','shiqianxian'),(2498,'思南县',258,'s','sinanxian'),(2499,'印江土家族苗族自治县',258,'y','yinjiangtujiazumiaozuzizhixian'),(2500,'德江县',258,'d','dejiangxian'),(2501,'沿河土家族自治县',258,'y','yanhetujiazuzizhixian'),(2502,'松桃苗族自治县',258,'s','songtaomiaozuzizhixian'),(2503,'万山特区',258,'w','wanshantequ'),(2504,'兴义市',259,'x','xingyishi'),(2505,'兴仁县',259,'x','xingrenxian'),(2506,'普安县',259,'p','puanxian'),(2507,'晴隆县',259,'q','qinglongxian'),(2508,'贞丰县',259,'z','zhenfengxian'),(2509,'望谟县',259,'w','wangmoxian'),(2510,'册亨县',259,'c','cehengxian'),(2511,'安龙县',259,'a','anlongxian'),(2512,'毕节市',260,'b','bijieshi'),(2513,'大方县',260,'d','dafangxian'),(2514,'黔西县',260,'q','qianxixian'),(2515,'金沙县',260,'j','jinshaxian'),(2516,'织金县',260,'z','zhijinxian'),(2517,'纳雍县',260,'n','nayongxian'),(2518,'威宁彝族回族苗族自治',260,'w','weiningyizuhuizumiaozuzizhi'),(2519,'赫章县',260,'h','hezhangxian'),(2520,'凯里市',261,'k','kailishi'),(2521,'黄平县',261,'h','huangpingxian'),(2522,'施秉县',261,'s','shibingxian'),(2523,'三穗县',261,'s','sansuixian'),(2524,'镇远县',261,'z','zhenyuanxian'),(2525,'岑巩县',261,'c','cengongxian'),(2526,'天柱县',261,'t','tianzhuxian'),(2527,'锦屏县',261,'j','jinpingxian'),(2528,'剑河县',261,'j','jianhexian'),(2529,'台江县',261,'t','taijiangxian'),(2530,'黎平县',261,'l','lipingxian'),(2531,'榕江县',261,'r','rongjiangxian'),(2532,'从江县',261,'c','congjiangxian'),(2533,'雷山县',261,'l','leishanxian'),(2534,'麻江县',261,'m','majiangxian'),(2535,'丹寨县',261,'d','danzhaixian'),(2536,'都匀市',262,'d','douyunshi'),(2537,'福泉市',262,'f','fuquanshi'),(2538,'荔波县',262,'l','liboxian'),(2539,'贵定县',262,'g','guidingxian'),(2540,'瓮安县',262,'w','wenganxian'),(2541,'独山县',262,'d','dushanxian'),(2542,'平塘县',262,'p','pingtangxian'),(2543,'罗甸县',262,'l','luodianxian'),(2544,'长顺县',262,'z','zhangshunxian'),(2545,'龙里县',262,'l','longlixian'),(2546,'惠水县',262,'h','huishuixian'),(2547,'三都水族自治县',262,'s','sandoushuizuzizhixian'),(2549,'五华区',263,'w','wuhuaqu'),(2550,'盘龙区',263,'p','panlongqu'),(2551,'官渡区',263,'g','guanduqu'),(2552,'西山区',263,'x','xishanqu'),(2553,'东川区',263,'d','dongchuanqu'),(2554,'呈贡县',263,'c','chenggongxian'),(2555,'晋宁县',263,'j','jinningxian'),(2556,'富民县',263,'f','fuminxian'),(2557,'宜良县',263,'y','yiliangxian'),(2558,'石林彝族自治县',263,'s','shilinyizuzizhixian'),(2559,'嵩明县',263,'s','songmingxian'),(2560,'禄劝彝族苗族自治县',263,'l','luquanyizumiaozuzizhixian'),(2561,'寻甸回族彝族自治县',263,'x','xundianhuizuyizuzizhixian'),(2562,'安宁市',263,'a','anningshi'),(2564,'麒麟区',264,'q','qilinqu'),(2565,'马龙县',264,'m','malongxian'),(2566,'陆良县',264,'l','luliangxian'),(2567,'师宗县',264,'s','shizongxian'),(2568,'罗平县',264,'l','luopingxian'),(2569,'富源县',264,'f','fuyuanxian'),(2570,'会泽县',264,'h','huizexian'),(2571,'沾益县',264,'z','zhanyixian'),(2572,'宣威市',264,'x','xuanweishi'),(2574,'红塔区',265,'h','hongtaqu'),(2575,'江川县',265,'j','jiangchuanxian'),(2576,'澄江县',265,'c','chengjiangxian'),(2577,'通海县',265,'t','tonghaixian'),(2578,'华宁县',265,'h','huaningxian'),(2579,'易门县',265,'y','yimenxian'),(2580,'峨山彝族自治县',265,'e','eshanyizuzizhixian'),(2581,'新平彝族傣族自治县',265,'x','xinpingyizudaizuzizhixian'),(2582,'元江哈尼族彝族傣族自',265,'y','yuanjianghanizuyizudaizuzi'),(2584,'隆阳区',266,'l','longyangqu'),(2585,'施甸县',266,'s','shidianxian'),(2586,'腾冲县',266,'t','tengchongxian'),(2587,'龙陵县',266,'l','longlingxian'),(2588,'昌宁县',266,'c','changningxian'),(2590,'昭阳区',267,'z','zhaoyangqu'),(2591,'鲁甸县',267,'l','ludianxian'),(2592,'巧家县',267,'q','qiaojiaxian'),(2593,'盐津县',267,'y','yanjinxian'),(2594,'大关县',267,'d','daguanxian'),(2595,'永善县',267,'y','yongshanxian'),(2596,'绥江县',267,'s','suijiangxian'),(2597,'镇雄县',267,'z','zhenxiongxian'),(2598,'彝良县',267,'y','yiliangxian'),(2599,'威信县',267,'w','weixinxian'),(2600,'水富县',267,'s','shuifuxian'),(2602,'古城区',268,'g','guchengqu'),(2603,'玉龙纳西族自治县',268,'y','yulongnaxizuzizhixian'),(2604,'永胜县',268,'y','yongshengxian'),(2605,'华坪县',268,'h','huapingxian'),(2606,'宁蒗彝族自治县',268,'n','ninglangyizuzizhixian'),(2608,'翠云区',269,'c','cuiyunqu'),(2609,'普洱哈尼族彝族自治县',269,'p','puerhanizuyizuzizhixian'),(2610,'墨江哈尼族自治县',269,'m','mojianghanizuzizhixian'),(2611,'景东彝族自治县',269,'j','jingdongyizuzizhixian'),(2612,'景谷傣族彝族自治县',269,'j','jinggudaizuyizuzizhixian'),(2613,'镇沅彝族哈尼族拉祜族',269,'z','zhenyuanyizuhanizulahuzu'),(2614,'江城哈尼族彝族自治县',269,'j','jiangchenghanizuyizuzizhixian'),(2615,'孟连傣族拉祜族佤族自',269,'m','mengliandaizulahuzuwazuzi'),(2616,'澜沧拉祜族自治县',269,'l','lancanglahuzuzizhixian'),(2617,'西盟佤族自治县',269,'x','ximengwazuzizhixian'),(2619,'临翔区',270,'l','linxiangqu'),(2620,'凤庆县',270,'f','fengqingxian'),(2621,'云县',270,'y','yunxian'),(2622,'永德县',270,'y','yongdexian'),(2623,'镇康县',270,'z','zhenkangxian'),(2624,'双江拉祜族佤族布朗族',270,'s','shuangjianglahuzuwazubulangzu'),(2625,'耿马傣族佤族自治县',270,'g','gengmadaizuwazuzizhixian'),(2626,'沧源佤族自治县',270,'c','cangyuanwazuzizhixian'),(2627,'楚雄市',271,'c','chuxiongshi'),(2628,'双柏县',271,'s','shuangboxian'),(2629,'牟定县',271,'m','moudingxian'),(2630,'南华县',271,'n','nanhuaxian'),(2631,'姚安县',271,'y','yaoanxian'),(2632,'大姚县',271,'d','dayaoxian'),(2633,'永仁县',271,'y','yongrenxian'),(2634,'元谋县',271,'y','yuanmouxian'),(2635,'武定县',271,'w','wudingxian'),(2636,'禄丰县',271,'l','lufengxian'),(2637,'个旧市',272,'g','gejiushi'),(2638,'开远市',272,'k','kaiyuanshi'),(2639,'蒙自县',272,'m','mengzixian'),(2640,'屏边苗族自治县',272,'p','pingbianmiaozuzizhixian'),(2641,'建水县',272,'j','jianshuixian'),(2642,'石屏县',272,'s','shipingxian'),(2643,'弥勒县',272,'m','milexian'),(2644,'泸西县',272,'l','luxixian'),(2645,'元阳县',272,'y','yuanyangxian'),(2646,'红河县',272,'h','honghexian'),(2647,'金平苗族瑶族傣族自治',272,'j','jinpingmiaozuyaozudaizuzizhi'),(2648,'绿春县',272,'l','lvchunxian'),(2649,'河口瑶族自治县',272,'h','hekouyaozuzizhixian'),(2650,'文山县',273,'w','wenshanxian'),(2651,'砚山县',273,'y','yanshanxian'),(2652,'西畴县',273,'x','xichouxian'),(2653,'麻栗坡县',273,'m','malipoxian'),(2654,'马关县',273,'m','maguanxian'),(2655,'丘北县',273,'q','qiubeixian'),(2656,'广南县',273,'g','guangnanxian'),(2657,'富宁县',273,'f','funingxian'),(2658,'景洪市',274,'j','jinghongshi'),(2659,'勐海县',274,'m','menghaixian'),(2660,'勐腊县',274,'m','menglaxian'),(2661,'大理市',275,'d','dalishi'),(2662,'漾濞彝族自治县',275,'y','yangbiyizuzizhixian'),(2663,'祥云县',275,'x','xiangyunxian'),(2664,'宾川县',275,'b','binchuanxian'),(2665,'弥渡县',275,'m','miduxian'),(2666,'南涧彝族自治县',275,'n','nanjianyizuzizhixian'),(2667,'巍山彝族回族自治县',275,'w','weishanyizuhuizuzizhixian'),(2668,'永平县',275,'y','yongpingxian'),(2669,'云龙县',275,'y','yunlongxian'),(2670,'洱源县',275,'e','eryuanxian'),(2671,'剑川县',275,'j','jianchuanxian'),(2672,'鹤庆县',275,'h','heqingxian'),(2673,'瑞丽市',276,'r','ruilishi'),(2674,'潞西市',276,'l','luxishi'),(2675,'梁河县',276,'l','lianghexian'),(2676,'盈江县',276,'y','yingjiangxian'),(2677,'陇川县',276,'l','longchuanxian'),(2678,'泸水县',277,'l','lushuixian'),(2679,'福贡县',277,'f','fugongxian'),(2680,'贡山独龙族怒族自治县',277,'g','gongshandulongzunuzuzizhixian'),(2681,'兰坪白族普米族自治县',277,'l','lanpingbaizupumizuzizhixian'),(2682,'香格里拉县',278,'x','xianggelilaxian'),(2683,'德钦县',278,'d','deqinxian'),(2684,'维西傈僳族自治县',278,'w','weixilisuzuzizhixian'),(2686,'城关区',279,'c','chengguanqu'),(2687,'林周县',279,'l','linzhouxian'),(2688,'当雄县',279,'d','dangxiongxian'),(2689,'尼木县',279,'n','nimuxian'),(2690,'曲水县',279,'q','qushuixian'),(2691,'堆龙德庆县',279,'d','duilongdeqingxian'),(2692,'达孜县',279,'d','dazixian'),(2693,'墨竹工卡县',279,'m','mozhugongkaxian'),(2694,'昌都县',280,'c','changdouxian'),(2695,'江达县',280,'j','jiangdaxian'),(2696,'贡觉县',280,'g','gongjuexian'),(2697,'类乌齐县',280,'l','leiwuqixian'),(2698,'丁青县',280,'d','dingqingxian'),(2699,'察雅县',280,'c','chayaxian'),(2700,'八宿县',280,'b','basuxian'),(2701,'左贡县',280,'z','zuogongxian'),(2702,'芒康县',280,'m','mangkangxian'),(2703,'洛隆县',280,'l','luolongxian'),(2704,'边坝县',280,'b','bianbaxian'),(2705,'乃东县',281,'n','naidongxian'),(2706,'扎囊县',281,'z','zhanangxian'),(2707,'贡嘎县',281,'g','gonggaxian'),(2708,'桑日县',281,'s','sangrixian'),(2709,'琼结县',281,'q','qiongjiexian'),(2710,'曲松县',281,'q','qusongxian'),(2711,'措美县',281,'c','cuomeixian'),(2712,'洛扎县',281,'l','luozhaxian'),(2713,'加查县',281,'j','jiachaxian'),(2714,'隆子县',281,'l','longzixian'),(2715,'错那县',281,'c','cuoneixian'),(2716,'浪卡子县',281,'l','langkazixian'),(2717,'日喀则市',282,'r','rikazeshi'),(2718,'南木林县',282,'n','nanmulinxian'),(2719,'江孜县',282,'j','jiangzixian'),(2720,'定日县',282,'d','dingrixian'),(2721,'萨迦县',282,'s','sajiaxian'),(2722,'拉孜县',282,'l','lazixian'),(2723,'昂仁县',282,'a','angrenxian'),(2724,'谢通门县',282,'x','xietongmenxian'),(2725,'白朗县',282,'b','bailangxian'),(2726,'仁布县',282,'r','renbuxian'),(2727,'康马县',282,'k','kangmaxian'),(2728,'定结县',282,'d','dingjiexian'),(2729,'仲巴县',282,'z','zhongbaxian'),(2730,'亚东县',282,'y','yadongxian'),(2731,'吉隆县',282,'j','jilongxian'),(2732,'聂拉木县',282,'n','nielamuxian'),(2733,'萨嘎县',282,'s','sagaxian'),(2734,'岗巴县',282,'g','gangbaxian'),(2735,'那曲县',283,'n','neiquxian'),(2736,'嘉黎县',283,'j','jialixian'),(2737,'比如县',283,'b','biruxian'),(2738,'聂荣县',283,'n','nierongxian'),(2739,'安多县',283,'a','anduoxian'),(2740,'申扎县',283,'s','shenzhaxian'),(2741,'索县',283,'s','suoxian'),(2742,'班戈县',283,'b','bangexian'),(2743,'巴青县',283,'b','baqingxian'),(2744,'尼玛县',283,'n','nimaxian'),(2745,'普兰县',284,'p','pulanxian'),(2746,'札达县',284,'z','zhadaxian'),(2747,'噶尔县',284,'g','gaerxian'),(2748,'日土县',284,'r','rituxian'),(2749,'革吉县',284,'g','gejixian'),(2750,'改则县',284,'g','gaizexian'),(2751,'措勤县',284,'c','cuoqinxian'),(2752,'林芝县',285,'l','linzhixian'),(2753,'工布江达县',285,'g','gongbujiangdaxian'),(2754,'米林县',285,'m','milinxian'),(2755,'墨脱县',285,'m','motuoxian'),(2756,'波密县',285,'b','bomixian'),(2757,'察隅县',285,'c','chayuxian'),(2758,'朗县',285,'l','langxian'),(2760,'新城区',286,'x','xinchengqu'),(2761,'碑林区',286,'b','beilinqu'),(2762,'莲湖区',286,'l','lianhuqu'),(2763,'灞桥区',286,'b','baqiaoqu'),(2764,'未央区',286,'w','weiyangqu'),(2765,'雁塔区',286,'y','yantaqu'),(2766,'阎良区',286,'y','yanliangqu'),(2767,'临潼区',286,'l','lintongqu'),(2768,'长安区',286,'z','zhanganqu'),(2769,'蓝田县',286,'l','lantianxian'),(2770,'周至县',286,'z','zhouzhixian'),(2771,'户县',286,'h','huxian'),(2772,'高陵县',286,'g','gaolingxian'),(2774,'王益区',287,'w','wangyiqu'),(2775,'印台区',287,'y','yintaiqu'),(2776,'耀州区',287,'y','yaozhouqu'),(2777,'宜君县',287,'y','yijunxian'),(2779,'渭滨区',288,'w','weibinqu'),(2780,'金台区',288,'j','jintaiqu'),(2781,'陈仓区',288,'c','chencangqu'),(2782,'凤翔县',288,'f','fengxiangxian'),(2783,'岐山县',288,'q','qishanxian'),(2784,'扶风县',288,'f','fufengxian'),(2785,'眉县',288,'m','meixian'),(2786,'陇县',288,'l','longxian'),(2787,'千阳县',288,'q','qianyangxian'),(2788,'麟游县',288,'l','linyouxian'),(2789,'凤县',288,'f','fengxian'),(2790,'太白县',288,'t','taibaixian'),(2792,'秦都区',289,'q','qindouqu'),(2793,'杨凌区',289,'y','yanglingqu'),(2794,'渭城区',289,'w','weichengqu'),(2795,'三原县',289,'s','sanyuanxian'),(2796,'泾阳县',289,'j','jingyangxian'),(2797,'乾县',289,'q','qianxian'),(2798,'礼泉县',289,'l','liquanxian'),(2799,'永寿县',289,'y','yongshouxian'),(2800,'彬县',289,'b','binxian'),(2801,'长武县',289,'z','zhangwuxian'),(2802,'旬邑县',289,'x','xunyixian'),(2803,'淳化县',289,'c','chunhuaxian'),(2804,'武功县',289,'w','wugongxian'),(2805,'兴平市',289,'x','xingpingshi'),(2807,'临渭区',290,'l','linweiqu'),(2808,'华县',290,'h','huaxian'),(2809,'潼关县',290,'t','tongguanxian'),(2810,'大荔县',290,'d','dalixian'),(2811,'合阳县',290,'h','heyangxian'),(2812,'澄城县',290,'c','chengchengxian'),(2813,'蒲城县',290,'p','puchengxian'),(2814,'白水县',290,'b','baishuixian'),(2815,'富平县',290,'f','fupingxian'),(2816,'韩城市',290,'h','hanchengshi'),(2817,'华阴市',290,'h','huayinshi'),(2819,'宝塔区',291,'b','baotaqu'),(2820,'延长县',291,'y','yanzhangxian'),(2821,'延川县',291,'y','yanchuanxian'),(2822,'子长县',291,'z','zizhangxian'),(2823,'安塞县',291,'a','ansaixian'),(2824,'志丹县',291,'z','zhidanxian'),(2825,'吴旗县',291,'w','wuqixian'),(2826,'甘泉县',291,'g','ganquanxian'),(2827,'富县',291,'f','fuxian'),(2828,'洛川县',291,'l','luochuanxian'),(2829,'宜川县',291,'y','yichuanxian'),(2830,'黄龙县',291,'h','huanglongxian'),(2831,'黄陵县',291,'h','huanglingxian'),(2833,'汉台区',292,'h','hantaiqu'),(2834,'南郑县',292,'n','nanzhengxian'),(2835,'城固县',292,'c','chengguxian'),(2836,'洋县',292,'y','yangxian'),(2837,'西乡县',292,'x','xixiangxian'),(2838,'勉县',292,'m','mianxian'),(2839,'宁强县',292,'n','ningqiangxian'),(2840,'略阳县',292,'l','lveyangxian'),(2841,'镇巴县',292,'z','zhenbaxian'),(2842,'留坝县',292,'l','liubaxian'),(2843,'佛坪县',292,'f','fopingxian'),(2845,'榆阳区',293,'y','yuyangqu'),(2846,'神木县',293,'s','shenmuxian'),(2847,'府谷县',293,'f','fuguxian'),(2848,'横山县',293,'h','hengshanxian'),(2849,'靖边县',293,'j','jingbianxian'),(2850,'定边县',293,'d','dingbianxian'),(2851,'绥德县',293,'s','suidexian'),(2852,'米脂县',293,'m','mizhixian'),(2853,'佳县',293,'j','jiaxian'),(2854,'吴堡县',293,'w','wubaoxian'),(2855,'清涧县',293,'q','qingjianxian'),(2856,'子洲县',293,'z','zizhouxian'),(2858,'汉滨区',294,'h','hanbinqu'),(2859,'汉阴县',294,'h','hanyinxian'),(2860,'石泉县',294,'s','shiquanxian'),(2861,'宁陕县',294,'n','ningshanxian'),(2862,'紫阳县',294,'z','ziyangxian'),(2863,'岚皋县',294,'l','langaoxian'),(2864,'平利县',294,'p','pinglixian'),(2865,'镇坪县',294,'z','zhenpingxian'),(2866,'旬阳县',294,'x','xunyangxian'),(2867,'白河县',294,'b','baihexian'),(2869,'商州区',295,'s','shangzhouqu'),(2870,'洛南县',295,'l','luonanxian'),(2871,'丹凤县',295,'d','danfengxian'),(2872,'商南县',295,'s','shangnanxian'),(2873,'山阳县',295,'s','shanyangxian'),(2874,'镇安县',295,'z','zhenanxian'),(2875,'柞水县',295,'z','zuoshuixian'),(2877,'城关区',296,'c','chengguanqu'),(2878,'七里河区',296,'q','qilihequ'),(2879,'西固区',296,'x','xiguqu'),(2880,'安宁区',296,'a','anningqu'),(2881,'红古区',296,'h','hongguqu'),(2882,'永登县',296,'y','yongdengxian'),(2883,'皋兰县',296,'g','gaolanxian'),(2884,'榆中县',296,'y','yuzhongxian'),(2887,'金川区',298,'j','jinchuanqu'),(2888,'永昌县',298,'y','yongchangxian'),(2890,'白银区',299,'b','baiyinqu'),(2891,'平川区',299,'p','pingchuanqu'),(2892,'靖远县',299,'j','jingyuanxian'),(2893,'会宁县',299,'h','huiningxian'),(2894,'景泰县',299,'j','jingtaixian'),(2896,'秦城区',300,'q','qinchengqu'),(2897,'北道区',300,'b','beidaoqu'),(2898,'清水县',300,'q','qingshuixian'),(2899,'秦安县',300,'q','qinanxian'),(2900,'甘谷县',300,'g','ganguxian'),(2901,'武山县',300,'w','wushanxian'),(2902,'张家川回族自治县',300,'z','zhangjiachuanhuizuzizhixian'),(2904,'凉州区',301,'l','liangzhouqu'),(2905,'民勤县',301,'m','minqinxian'),(2906,'古浪县',301,'g','gulangxian'),(2907,'天祝藏族自治县',301,'t','tianzhuzangzuzizhixian'),(2909,'甘州区',302,'g','ganzhouqu'),(2910,'肃南裕固族自治县',302,'s','sunanyuguzuzizhixian'),(2911,'民乐县',302,'m','minlexian'),(2912,'临泽县',302,'l','linzexian'),(2913,'高台县',302,'g','gaotaixian'),(2914,'山丹县',302,'s','shandanxian'),(2916,'崆峒区',303,'k','kongtongqu'),(2917,'泾川县',303,'j','jingchuanxian'),(2918,'灵台县',303,'l','lingtaixian'),(2919,'崇信县',303,'c','chongxinxian'),(2920,'华亭县',303,'h','huatingxian'),(2921,'庄浪县',303,'z','zhuanglangxian'),(2922,'静宁县',303,'j','jingningxian'),(2924,'肃州区',304,'s','suzhouqu'),(2925,'金塔县',304,'j','jintaxian'),(2926,'安西县',304,'a','anxixian'),(2927,'肃北蒙古族自治县',304,'s','subeimengguzuzizhixian'),(2928,'阿克塞哈萨克族自治县',304,'a','akesaihasakezuzizhixian'),(2929,'玉门市',304,'y','yumenshi'),(2930,'敦煌市',304,'d','dunhuangshi'),(2932,'西峰区',305,'x','xifengqu'),(2933,'庆城县',305,'q','qingchengxian'),(2934,'环县',305,'h','huanxian'),(2935,'华池县',305,'h','huachixian'),(2936,'合水县',305,'h','heshuixian'),(2937,'正宁县',305,'z','zhengningxian'),(2938,'宁县',305,'n','ningxian'),(2939,'镇原县',305,'z','zhenyuanxian'),(2941,'安定区',306,'a','andingqu'),(2942,'通渭县',306,'t','tongweixian'),(2943,'陇西县',306,'l','longxixian'),(2944,'渭源县',306,'w','weiyuanxian'),(2945,'临洮县',306,'l','lintaoxian'),(2946,'漳县',306,'z','zhangxian'),(2947,'岷县',306,'m','minxian'),(2949,'武都区',307,'w','wudouqu'),(2950,'成县',307,'c','chengxian'),(2951,'文县',307,'w','wenxian'),(2952,'宕昌县',307,'d','dangchangxian'),(2953,'康县',307,'k','kangxian'),(2954,'西和县',307,'x','xihexian'),(2955,'礼县',307,'l','lixian'),(2956,'徽县',307,'h','huixian'),(2957,'两当县',307,'l','liangdangxian'),(2958,'临夏市',308,'l','linxiashi'),(2959,'临夏县',308,'l','linxiaxian'),(2960,'康乐县',308,'k','kanglexian'),(2961,'永靖县',308,'y','yongjingxian'),(2962,'广河县',308,'g','guanghexian'),(2963,'和政县',308,'h','hezhengxian'),(2964,'东乡族自治县',308,'d','dongxiangzuzizhixian'),(2965,'积石山保安族东乡族撒',308,'j','jishishanbaoanzudongxiangzusa'),(2966,'合作市',309,'h','hezuoshi'),(2967,'临潭县',309,'l','lintanxian'),(2968,'卓尼县',309,'z','zhuonixian'),(2969,'舟曲县',309,'z','zhouquxian'),(2970,'迭部县',309,'d','diebuxian'),(2971,'玛曲县',309,'m','maquxian'),(2972,'碌曲县',309,'l','liuquxian'),(2973,'夏河县',309,'x','xiahexian'),(2975,'城东区',310,'c','chengdongqu'),(2976,'城中区',310,'c','chengzhongqu'),(2977,'城西区',310,'c','chengxiqu'),(2978,'城北区',310,'c','chengbeiqu'),(2979,'大通回族土族自治县',310,'d','datonghuizutuzuzizhixian'),(2980,'湟中县',310,'h','huangzhongxian'),(2981,'湟源县',310,'h','huangyuanxian'),(2982,'平安县',311,'p','pinganxian'),(2983,'民和回族土族自治县',311,'m','minhehuizutuzuzizhixian'),(2984,'乐都县',311,'l','ledouxian'),(2985,'互助土族自治县',311,'h','huzhutuzuzizhixian'),(2986,'化隆回族自治县',311,'h','hualonghuizuzizhixian'),(2987,'循化撒拉族自治县',311,'x','xunhuasalazuzizhixian'),(2988,'门源回族自治县',312,'m','menyuanhuizuzizhixian'),(2989,'祁连县',312,'q','qilianxian'),(2990,'海晏县',312,'h','haiyanxian'),(2991,'刚察县',312,'g','gangchaxian'),(2992,'同仁县',313,'t','tongrenxian'),(2993,'尖扎县',313,'j','jianzhaxian'),(2994,'泽库县',313,'z','zekuxian'),(2995,'河南蒙古族自治县',313,'h','henanmengguzuzizhixian'),(2996,'共和县',314,'g','gonghexian'),(2997,'同德县',314,'t','tongdexian'),(2998,'贵德县',314,'g','guidexian'),(2999,'兴海县',314,'x','xinghaixian'),(3000,'贵南县',314,'g','guinanxian'),(3001,'玛沁县',315,'m','maqinxian'),(3002,'班玛县',315,'b','banmaxian'),(3003,'甘德县',315,'g','gandexian'),(3004,'达日县',315,'d','darixian'),(3005,'久治县',315,'j','jiuzhixian'),(3006,'玛多县',315,'m','maduoxian'),(3007,'玉树县',316,'y','yushuxian'),(3008,'杂多县',316,'z','zaduoxian'),(3009,'称多县',316,'c','chengduoxian'),(3010,'治多县',316,'z','zhiduoxian'),(3011,'囊谦县',316,'n','nangqianxian'),(3012,'曲麻莱县',316,'q','qumalaixian'),(3013,'格尔木市',317,'g','geermushi'),(3014,'德令哈市',317,'d','delinghashi'),(3015,'乌兰县',317,'w','wulanxian'),(3016,'都兰县',317,'d','doulanxian'),(3017,'天峻县',317,'t','tianjunxian'),(3019,'兴庆区',318,'x','xingqingqu'),(3020,'西夏区',318,'x','xixiaqu'),(3021,'金凤区',318,'j','jinfengqu'),(3022,'永宁县',318,'y','yongningxian'),(3023,'贺兰县',318,'h','helanxian'),(3024,'灵武市',318,'l','lingwushi'),(3026,'大武口区',319,'d','dawukouqu'),(3027,'惠农区',319,'h','huinongqu'),(3028,'平罗县',319,'p','pingluoxian'),(3030,'利通区',320,'l','litongqu'),(3031,'盐池县',320,'y','yanchixian'),(3032,'同心县',320,'t','tongxinxian'),(3033,'青铜峡市',320,'q','qingtongxiashi'),(3035,'原州区',321,'y','yuanzhouqu'),(3036,'西吉县',321,'x','xijixian'),(3037,'隆德县',321,'l','longdexian'),(3038,'泾源县',321,'j','jingyuanxian'),(3039,'彭阳县',321,'p','pengyangxian'),(3041,'沙坡头区',322,'s','shapotouqu'),(3042,'中宁县',322,'z','zhongningxian'),(3043,'海原县',322,'h','haiyuanxian'),(3045,'天山区',323,'t','tianshanqu'),(3046,'沙依巴克区',323,'s','shayibakequ'),(3047,'新市区',323,'x','xinshiqu'),(3048,'水磨沟区',323,'s','shuimogouqu'),(3049,'头屯河区',323,'t','toutunhequ'),(3050,'达坂城区',323,'d','dabanchengqu'),(3051,'东山区',323,'d','dongshanqu'),(3052,'乌鲁木齐县',323,'w','wulumuqixian'),(3054,'独山子区',324,'d','dushanziqu'),(3055,'克拉玛依区',324,'k','kelamayiqu'),(3056,'白碱滩区',324,'b','baijiantanqu'),(3057,'乌尔禾区',324,'w','wuerhequ'),(3058,'吐鲁番市',325,'t','tulufanshi'),(3059,'鄯善县',325,'s','shanshanxian'),(3060,'托克逊县',325,'t','tuokexunxian'),(3061,'哈密市',326,'h','hamishi'),(3062,'巴里坤哈萨克自治县',326,'b','balikunhasakezizhixian'),(3063,'伊吾县',326,'y','yiwuxian'),(3064,'昌吉市',327,'c','changjishi'),(3065,'阜康市',327,'f','fukangshi'),(3066,'米泉市',327,'m','miquanshi'),(3067,'呼图壁县',327,'h','hutubixian'),(3068,'玛纳斯县',327,'m','manasixian'),(3069,'奇台县',327,'q','qitaixian'),(3070,'吉木萨尔县',327,'j','jimusaerxian'),(3071,'木垒哈萨克自治县',327,'m','muleihasakezizhixian'),(3072,'博乐市',328,'b','boleshi'),(3073,'精河县',328,'j','jinghexian'),(3074,'温泉县',328,'w','wenquanxian'),(3075,'库尔勒市',329,'k','kuerleshi'),(3076,'轮台县',329,'l','luntaixian'),(3077,'尉犁县',329,'w','weilixian'),(3078,'若羌县',329,'r','ruoqiangxian'),(3079,'且末县',329,'q','qiemoxian'),(3080,'焉耆回族自治县',329,'y','yanqihuizuzizhixian'),(3081,'和静县',329,'h','hejingxian'),(3082,'和硕县',329,'h','heshuoxian'),(3083,'博湖县',329,'b','bohuxian'),(3084,'阿克苏市',330,'a','akesushi'),(3085,'温宿县',330,'w','wensuxian'),(3086,'库车县',330,'k','kuchexian'),(3087,'沙雅县',330,'s','shayaxian'),(3088,'新和县',330,'x','xinhexian'),(3089,'拜城县',330,'b','baichengxian'),(3090,'乌什县',330,'w','wushenxian'),(3091,'阿瓦提县',330,'a','awatixian'),(3092,'柯坪县',330,'k','kepingxian'),(3093,'阿图什市',331,'a','atushenshi'),(3094,'阿克陶县',331,'a','aketaoxian'),(3095,'阿合奇县',331,'a','aheqixian'),(3096,'乌恰县',331,'w','wuqiaxian'),(3097,'喀什市',332,'k','kashenshi'),(3098,'疏附县',332,'s','shufuxian'),(3099,'疏勒县',332,'s','shulexian'),(3100,'英吉沙县',332,'y','yingjishaxian'),(3101,'泽普县',332,'z','zepuxian'),(3102,'莎车县',332,'s','shachexian'),(3103,'叶城县',332,'y','yechengxian'),(3104,'麦盖提县',332,'m','maigaitixian'),(3105,'岳普湖县',332,'y','yuepuhuxian'),(3106,'伽师县',332,'j','jiashixian'),(3107,'巴楚县',332,'b','bachuxian'),(3108,'塔什库尔干塔吉克自治',332,'t','tashenkuergantajikezizhi'),(3109,'和田市',333,'h','hetianshi'),(3110,'和田县',333,'h','hetianxian'),(3111,'墨玉县',333,'m','moyuxian'),(3112,'皮山县',333,'p','pishanxian'),(3113,'洛浦县',333,'l','luopuxian'),(3114,'策勒县',333,'c','celexian'),(3115,'于田县',333,'y','yutianxian'),(3116,'民丰县',333,'m','minfengxian'),(3117,'伊宁市',334,'y','yiningshi'),(3118,'奎屯市',334,'k','kuitunshi'),(3119,'伊宁县',334,'y','yiningxian'),(3120,'察布查尔锡伯自治县',334,'c','chabuchaerxibozizhixian'),(3121,'霍城县',334,'h','huochengxian'),(3122,'巩留县',334,'g','gongliuxian'),(3123,'新源县',334,'x','xinyuanxian'),(3124,'昭苏县',334,'z','zhaosuxian'),(3125,'特克斯县',334,'t','tekesixian'),(3126,'尼勒克县',334,'n','nilekexian'),(3127,'塔城市',335,'t','tachengshi'),(3128,'乌苏市',335,'w','wusushi'),(3129,'额敏县',335,'e','eminxian'),(3130,'沙湾县',335,'s','shawanxian'),(3131,'托里县',335,'t','tuolixian'),(3132,'裕民县',335,'y','yuminxian'),(3133,'和布克赛尔蒙古自治县',335,'h','hebukesaiermengguzizhixian'),(3134,'阿勒泰市',336,'a','aletaishi'),(3135,'布尔津县',336,'b','buerjinxian'),(3136,'富蕴县',336,'f','fuyunxian'),(3137,'福海县',336,'f','fuhaixian'),(3138,'哈巴河县',336,'h','habahexian'),(3139,'青河县',336,'q','qinghexian'),(3140,'吉木乃县',336,'j','jimunaixian'),(3141,'石河子市',337,'s','shihezishi'),(3142,'阿拉尔市',337,'a','alaershi'),(3143,'图木舒克市',337,'t','tumushukeshi'),(3144,'五家渠市',337,'w','wujiaqushi'),(3145,'中堂镇',211,'z',NULL),(3146,'东坑镇',211,'d',NULL),(3147,'道滘镇',211,'d',NULL),(3148,'沙田镇',211,'s',NULL),(3149,'高埗镇',211,'g',NULL),(3150,'石龙镇',211,'s',NULL),(3151,'石排镇',211,'s',NULL),(3152,'企石镇',211,'q',NULL),(3153,'石碣镇',211,'s',NULL),(3154,'洪梅镇',211,'h',NULL),(3155,'麻涌镇',211,'m',NULL),(3156,'桥头镇',211,'q',NULL),(3157,'望牛墩镇',211,'w',NULL),(3158,'茶山镇',211,'c',NULL),(3159,'谢岗镇',211,'x',NULL),(3160,'松山湖',211,'s',NULL),(3161,'莞城区',211,'g',NULL),(3162,'南城区',211,'n',NULL),(3163,'长安镇',211,'c',NULL),(3164,'寮步镇',211,'l',NULL),(3165,'大岭山镇',211,'d',NULL),(3166,'常平镇',211,'c',NULL),(3167,'厚街镇',211,'h',NULL),(3168,'万江区',211,'w',NULL),(3169,'樟木头镇',211,'z',NULL),(3170,'大朗镇',211,'d',NULL),(3171,'塘厦镇',211,'t',NULL),(3172,'凤岗镇',211,'f',NULL),(3173,'清溪镇',211,'q',NULL),(3174,'横沥镇',211,'h',NULL),(3175,'东城区',211,'d',NULL),(3176,'黄江镇',211,'h',NULL),(3177,'虎门镇',211,'h',NULL);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `example`
--

DROP TABLE IF EXISTS `example`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `example` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `createdate` datetime DEFAULT NULL,
  `myname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `example`
--

LOCK TABLES `example` WRITE;
/*!40000 ALTER TABLE `example` DISABLE KEYS */;
INSERT INTO `example` VALUES (8,'world2333','2013-12-27 10:04:34',NULL),(9,'hello',NULL,NULL),(10,'工','2013-12-18 10:10:35',NULL),(11,'a','2013-12-03 11:46:05',NULL);
/*!40000 ALTER TABLE `example` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `href` varchar(200) DEFAULT NULL,
  `rel` varchar(200) DEFAULT NULL,
  `parent_id` bigint(11) DEFAULT NULL,
  `authority_id` bigint(11) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `show` tinyint(1) DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`id`),
  KEY `a` (`authority_id`),
  KEY `parent` (`parent_id`),
  CONSTRAINT `fk_authority` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_parent` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'1','系统配置','#',NULL,6,1,1,1),(5,'2','菜单管理','admin/menu/list',NULL,1,NULL,NULL,0),(6,'0','主菜单',NULL,NULL,NULL,NULL,1,1),(225,'2','示例管理','admin/example/list','1',1,NULL,2,0),(263,'2','角色管理','admin/role/list',NULL,1,301,0,0),(264,'1','用户管理','#',NULL,6,NULL,4,1),(303,'2','登录用户管理','admin/customer/list',NULL,264,NULL,1,1),(305,'2','权限管理','admin/authority/list',NULL,1,201,-3,0),(306,'2','微信用户管理','admin/customer/list',NULL,1,1022,0,0),(307,'2','菜品类别管理','admin/category/list',NULL,319,1027,2,1),(308,'2','健康讲座管理','admin/course/list',NULL,319,1032,4,1),(309,'2','菜品管理','admin/dish/list',NULL,319,1037,3,1),(310,'2','会员卡管理','admin/card/list',NULL,319,1042,1,1),(311,'2','用户会员卡管理','admin/customerCard/list',NULL,1,1047,0,0),(312,'2','配送中心管理','admin/distributionCenter/list',NULL,321,1052,0,1),(313,'2','订单管理','admin/order/list',NULL,318,1057,1,1),(314,'2','订单明细管理','admin/orderItem/list',NULL,1,1062,0,0),(315,'2','交易管理','admin/pay/list',NULL,318,1067,2,1),(318,'1','运营管理','',NULL,6,NULL,3,1),(319,'1','基础模块','',NULL,6,NULL,2,1),(320,'1','【删】用户模块','',NULL,6,NULL,3,0),(321,'1','配送管理','',NULL,6,NULL,5,1),(322,'2','会员用户管理','admin/customer/memberList',NULL,264,NULL,2,1),(323,'2','邀新返利管理','admin/profit/list',NULL,264,NULL,3,1),(324,'2','【删】专家管理','admin/customer/expertList',NULL,264,NULL,3,0),(325,'2','专家列表','admin/customer/expertList',NULL,330,NULL,1,1),(326,'2','配送管理','admin/order/sendList',NULL,321,NULL,2,1),(327,'2','会员收货地址管理','admin/address/list',NULL,264,1072,4,1),(328,'2','用户余量详情管理','admin/customerBalanceDetail/list',NULL,1,1077,0,1),(329,'1','【删】专家管理','#',NULL,6,NULL,6,0),(330,'1','专家管理','#',NULL,6,NULL,6,1),(331,'2','配送地区设置','admin/city/list',NULL,319,NULL,5,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL COMMENT '用户',
  `orderNo` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `status` int(11) NOT NULL COMMENT '状态',
  `totalAmount` double NOT NULL COMMENT '订单总额',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `distributeStatus` int(11) NOT NULL DEFAULT '0' COMMENT '配送状态',
  `dishLeft` double NOT NULL COMMENT '完成这单后菜剩余可购',
  `waterLeft` int(11) NOT NULL COMMENT '完成这单后水剩余可购',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'1496790826669',0,580,'2017-06-07 07:13:46',1,98,199),(2,1,'1496790828100',0,580,'2017-06-07 07:13:48',1,96,198),(11,4,'1498765621735',0,0,'2017-06-30 03:47:01',1,96,0),(12,4,'1498765713334',0,0,'2017-06-30 03:48:33',1,94,20),(16,3,'1498780430712',0,0,'2017-06-30 07:53:50',1,98,0),(17,3,'1498780462294',0,0,'2017-06-30 07:54:22',1,93,0),(20,3,'1498929983952',0,32,'2017-07-02 01:26:23',1,91,0),(24,8,'1499092007167',0,110,'2017-07-03 22:26:47',1,293,0),(26,8,'1499097962221',0,15,'2017-07-04 00:06:02',1,292,0),(27,8,'1499097969187',0,60,'2017-07-04 00:06:09',1,288,0),(28,8,'1499097983841',0,2925,'2017-07-04 00:06:23',1,93,0);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单',
  `dish_id` bigint(20) DEFAULT NULL COMMENT '菜品',
  `amount` double NOT NULL COMMENT '数量',
  `type` int(11) NOT NULL COMMENT '1，菜品，2：桶装水',
  `num` double NOT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,1,2,120,2,1),(2,1,1,460,1,2),(3,2,2,120,2,1),(4,2,1,460,1,2),(7,11,4,0,1,4),(8,12,3,0,1,2),(9,16,4,0,1,2),(10,17,4,0,1,2),(11,17,3,0,1,3),(12,20,4,32,1,2),(13,24,4,80,1,5),(14,24,3,30,1,2),(15,26,3,15,1,1),(16,27,3,60,1,4),(17,28,3,2925,1,195);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay`
--

DROP TABLE IF EXISTS `pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL COMMENT '用户',
  `payNO` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '系统内编号',
  `wxPayNo` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信交易流水号',
  `amount` double NOT NULL COMMENT '应付金额',
  `actualPayAmount` double NOT NULL COMMENT '实付金额',
  `type` int(11) NOT NULL COMMENT '交易类型，1购买菜品会员卡，2购买桶装水会员卡',
  `card_id` bigint(20) DEFAULT NULL COMMENT '关联会员卡id',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `payUpdateTime` datetime DEFAULT NULL COMMENT '支付更新时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态，0未支付，1，支付成功，2支付失败',
  `prepayId` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='交易';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay`
--

LOCK TABLES `pay` WRITE;
/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
INSERT INTO `pay` VALUES (1,2,'tes1231498764740056',NULL,100,0,0,3,'2017-06-30 03:32:20','2017-06-30 03:32:20',1,'f232f609-0686-46b1-b673-fe57afc19861'),(2,2,'tes1231498764993970',NULL,20,0,0,4,'2017-06-30 03:36:33','2017-06-30 03:36:33',1,'1151609b-9cae-4167-9d89-baf027e9d51b'),(3,4,'tes1231498765476040',NULL,100,0,0,3,'2017-06-30 03:44:36','2017-06-30 03:44:36',1,'5bfd125e-c9a1-4b52-b646-301b16e0345c'),(4,4,'tes1231498765694508',NULL,20,0,0,4,'2017-06-30 03:48:14','2017-06-30 03:48:14',1,'fb54706e-fe2c-4459-a2cf-88ed8a56544c'),(5,3,'tes1231498780397398',NULL,100,0,0,3,'2017-06-30 07:53:17','2017-06-30 07:53:17',1,'0bbeb489-fc9f-491b-9cbe-951edaecfe83'),(6,5,'tes1231498858364021',NULL,20,0,0,4,'2017-07-01 05:32:44','2017-07-01 05:32:44',1,'3f433146-6029-450d-8e94-b5752dc7e70e'),(7,3,'tes1231498930810885',NULL,20,0,0,4,'2017-07-02 01:40:10','2017-07-02 01:40:10',0,'a576f7a4-e153-4f71-b34f-affe96bdf42c'),(8,6,'tes1231498997677647',NULL,100,0,0,1,'2017-07-02 20:14:37','2017-07-02 20:14:37',1,'e7c68e65-3e8a-463e-9d84-0144b5d595af'),(9,6,'tes1231499049714330',NULL,20,0,0,4,'2017-07-03 10:41:54','2017-07-03 10:41:54',1,'wx201707031041544b979c6f8b0074538943'),(10,7,'tes1231499049848223',NULL,100,0,0,3,'2017-07-03 10:44:08','2017-07-03 10:44:08',1,'wx20170703104408095b0072310416376710'),(11,7,'tes1231499050086059',NULL,20,0,0,4,'2017-07-03 10:48:06','2017-07-03 10:48:06',1,'wx20170703104806a43082189d0407639177'),(12,7,'tes1231499050673511',NULL,100,0,0,3,'2017-07-03 10:57:54','2017-07-03 10:57:54',1,'wx2017070310575421d232862b0485687363'),(13,7,'tes1231499050743804',NULL,20,0,0,4,'2017-07-03 10:59:04','2017-07-03 10:59:04',0,'wx2017070310590468898872cd0942788664'),(14,7,'tes1231499050861309',NULL,20,0,0,4,'2017-07-03 11:01:01','2017-07-03 11:01:01',0,'wx20170703110101f8b7a603020730436288'),(15,7,'tes1231499050890532',NULL,20,0,0,4,'2017-07-03 11:01:30','2017-07-03 11:01:30',0,'wx2017070311013030c91c82dd0543215902'),(16,7,'tes1231499051054944',NULL,20,0,0,4,'2017-07-03 11:04:15','2017-07-03 11:04:15',1,'wx201707031104157c139e76300124269517'),(17,8,'tes1231499091951409',NULL,100,0,0,3,'2017-07-03 22:25:51','2017-07-03 22:25:51',1,'wx20170703222551ea34227d970217049436'),(18,8,'tes1231499272363126',NULL,0.01,0,0,4,'2017-07-06 00:32:43','2017-07-06 00:32:43',1,'wx201707060032430cd58931460681838088');
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profit`
--

DROP TABLE IF EXISTS `profit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profitCustomer_id` bigint(20) NOT NULL COMMENT '受益用户',
  `inviteeCustomer_id` bigint(20) NOT NULL COMMENT '被邀用户',
  `totalPhases` int(11) NOT NULL COMMENT '总期数',
  `profitPerMonth` double NOT NULL COMMENT '月返利金额',
  `totalProfit` double NOT NULL COMMENT '反利总额',
  `notProfitPhases` int(11) NOT NULL COMMENT '未返期数',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `lastUpdateTime` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='返利';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profit`
--

LOCK TABLES `profit` WRITE;
/*!40000 ALTER TABLE `profit` DISABLE KEYS */;
/*!40000 ALTER TABLE `profit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL COMMENT '名称',
  `letter` varchar(10) DEFAULT NULL COMMENT '字母',
  `isHot` tinyint(4) DEFAULT '0' COMMENT '是否是热门城市',
  `fullletter` varchar(50) DEFAULT NULL COMMENT '全拼音',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (3,'北京市',NULL,1,NULL),(4,'天津市','t',0,'tianjinshi'),(5,'河北省',NULL,1,NULL),(6,'山西省','s',0,'shanxisheng'),(7,'内蒙古自治区','n',0,'neimengguzizhiqu'),(8,'辽宁省','l',0,'liaoningsheng'),(9,'吉林省','j',0,'jilinsheng'),(10,'黑龙江','h',0,'heilongjiang'),(11,'上海市','s',0,'shanghaishi'),(12,'江苏省','j',0,'jiangsusheng'),(13,'浙江省','z',0,'zhejiangsheng'),(14,'安徽省','a',0,'anhuisheng'),(15,'福建省','f',0,'fujiansheng'),(16,'江西省','j',0,'jiangxisheng'),(17,'山东省','s',0,'shandongsheng'),(18,'河南省','h',0,'henansheng'),(19,'湖北省','h',0,'hubeisheng'),(20,'湖南省','h',1,'hunansheng'),(21,'广东省','g',0,'guangdongsheng'),(22,'广西壮族自治区','g',0,'guangxizhuangzuzizhiqu'),(23,'海南省','h',0,'hainansheng'),(24,'重庆市','z',0,'zhongqingshi'),(25,'四川省','s',0,'sichuansheng'),(26,'贵州省','g',0,'guizhousheng'),(27,'云南省','y',0,'yunnansheng'),(28,'西藏自治区','x',0,'xizangzizhiqu'),(29,'陕西省','s',0,'shanxisheng'),(30,'甘肃省','g',0,'gansusheng'),(31,'青海省','q',0,'qinghaisheng'),(32,'宁夏回族自治区','n',0,'ningxiahuizuzizhiqu'),(33,'新疆维吾尔自治区','x',0,'xinjiangweiwuerzizhiqu'),(34,'台湾省','t',0,'taiwansheng'),(35,'香港特别行政区','x',0,'xianggangtebiexingzhengqu'),(36,'澳门特别行政区','a',0,'aomentebiexingzhengqu');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '角色',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `code` varchar(45) DEFAULT NULL COMMENT '编码',
  `editable` tinyint(1) DEFAULT '1' COMMENT '是否可编辑',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'管理员',NULL,'admin',0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleauthority`
--

DROP TABLE IF EXISTS `roleauthority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleauthority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(20) NOT NULL,
  `authorityid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`roleid`),
  KEY `authority` (`authorityid`),
  CONSTRAINT `fk_authorityid` FOREIGN KEY (`authorityid`) REFERENCES `authority` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_roleid` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6698 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleauthority`
--

LOCK TABLES `roleauthority` WRITE;
/*!40000 ALTER TABLE `roleauthority` DISABLE KEYS */;
INSERT INTO `roleauthority` VALUES (6555,1,1),(6634,1,1021),(6635,1,201),(6636,1,301),(6637,1,101),(6638,1,1022),(6639,1,1023),(6640,1,1024),(6641,1,1025),(6642,1,1026),(6643,1,1027),(6644,1,1028),(6645,1,1029),(6646,1,1030),(6647,1,1031),(6648,1,1032),(6649,1,1033),(6650,1,1034),(6651,1,1035),(6652,1,1036),(6653,1,1037),(6654,1,1038),(6655,1,1039),(6656,1,1040),(6657,1,1041),(6658,1,1042),(6659,1,1043),(6660,1,1044),(6661,1,1045),(6662,1,1046),(6663,1,1047),(6664,1,1048),(6665,1,1049),(6666,1,1050),(6667,1,1051),(6668,1,1052),(6669,1,1053),(6670,1,1054),(6671,1,1055),(6672,1,1056),(6673,1,1057),(6674,1,1058),(6675,1,1059),(6676,1,1060),(6677,1,1061),(6678,1,1062),(6679,1,1063),(6680,1,1064),(6681,1,1065),(6682,1,1066),(6683,1,1067),(6684,1,1068),(6685,1,1069),(6686,1,1070),(6687,1,1071),(6688,1,1072),(6689,1,1073),(6690,1,1074),(6691,1,1075),(6692,1,1076),(6693,1,1077),(6694,1,1078),(6695,1,1079),(6696,1,1080),(6697,1,1081);
/*!40000 ALTER TABLE `roleauthority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemconfig`
--

DROP TABLE IF EXISTS `systemconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` text COMMENT 'value',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `key` (`_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数配置(如地图信息之类的也会存在这里)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemconfig`
--

LOCK TABLES `systemconfig` WRITE;
/*!40000 ALTER TABLE `systemconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemlog`
--

DROP TABLE IF EXISTS `systemlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  `module` varchar(50) DEFAULT NULL COMMENT '模块',
  `operation` varchar(50) DEFAULT NULL COMMENT '操作',
  `params` text COMMENT '参数',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `url` varchar(255) DEFAULT NULL COMMENT 'url',
  `issuccess` tinyint(1) DEFAULT NULL COMMENT '是否成功',
  `errorMessage` text COMMENT '错误消息',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP',
  `requestMethod` varchar(20) DEFAULT NULL COMMENT '请求方式',
  `ua` varchar(255) DEFAULT NULL COMMENT 'UserAgent',
  `headers` varchar(5555) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_userid_idx` (`user_id`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemlog`
--

LOCK TABLES `systemlog` WRITE;
/*!40000 ALTER TABLE `systemlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(60) DEFAULT NULL COMMENT '密码',
  `nickName` varchar(255) DEFAULT NULL COMMENT '昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `deleted` tinyint(1) DEFAULT NULL COMMENT '推荐人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','aa7b043b818888f5868936482a6f08be',NULL,NULL,1,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userauthority`
--

DROP TABLE IF EXISTS `userauthority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userauthority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL,
  `authorityid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_userid_idx` (`userid`),
  KEY `fk_fk_userid_idx` (`userid`),
  KEY `fk_fk_authority_idx` (`authorityid`),
  CONSTRAINT `fk_fk_authority` FOREIGN KEY (`authorityid`) REFERENCES `authority` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fk_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userauthority`
--

LOCK TABLES `userauthority` WRITE;
/*!40000 ALTER TABLE `userauthority` DISABLE KEYS */;
/*!40000 ALTER TABLE `userauthority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrole` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(20) NOT NULL COMMENT '角色',
  `userid` bigint(20) NOT NULL COMMENT '用户',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `fk_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='用户-角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (40,1,1);
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-06  1:03:34
