
-- ----------------------------
--  Table structure for `profit_set`
-- ----------------------------
DROP TABLE IF EXISTS `profit_set`;
CREATE TABLE `profit_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `profit_ratio` int(11) NOT NULL DEFAULT '0' COMMENT '返利比例',
  `profit_count` int(5) NOT NULL DEFAULT '0' COMMENT '返利期数',
  `is_auto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否自动返利',
  `profit_desc` varchar(1000) DEFAULT NULL COMMENT '邀新返利说明文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
