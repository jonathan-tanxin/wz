INSERT INTO `wz`.`dish` (`category_id`, `name`, `unit`, `stock`, `listImage`, `images`, `createTime`, `stars`, `totalSold`, `monthSold`) VALUES ('1', '苹果', '斤', '100', 'http://n6.image.pg0.cn/T1puLLBQxO1RCvBVdK.jpg', 'http://n4.image.pg0.cn/T1dtK0BgVT1RCvBVdK.jpg,http://n2.image.pg0.cn/T1BBEPBThk1RCvBVdK.jpg', '2017-02-02 00:00:00', '4', '100', '20');

UPDATE `wz`.`dish` SET `category_id`='2' WHERE `id`='1';


ALTER TABLE `wz`.`dish` 
ADD COLUMN `price` DOUBLE NULL COMMENT '价格' AFTER `monthSold`;

UPDATE `wz`.`dish` SET `price`='230' WHERE `id`='1';

INSERT INTO `wz`.`course` (`title`, `image`, `host`, `date`, `status`, `href`) VALUES ('国生开奖', 'http://n5.image.pg0.cn/T1T.xgBvJf1RCvBVdK.jpg', '大侠', '2017-02-03 00:00:00', '1', 'http://www.baidu.com');

INSERT INTO `wz`.`customer` (`nickName`, `headImage`, `openid`, `createTime`, `lastUpdateTime`, `isDishMember`, `isWaterMember`, `dishLeft`, `waterLeft`, `inviteCode`, `isExpert`, `setExpertTime`) VALUES ('大侠', 'http://n4.image.pg0.cn/T1WwDIB5Wq1RCvBVdK.jpg', '123', '2015-02-02 00:00:00', '2015-02-02 00:00:00', '1', '1', '100', '200', '1', '1', '2015-02-02 00:00:00');

ALTER TABLE `wz`.`address` 
ADD COLUMN `distributionCenter_id` BIGINT(20) NULL COMMENT '配送中心' AFTER `district_id`;

ALTER TABLE `wz`.`address` 
CHANGE COLUMN `city_id` `city_id` BIGINT(20) NOT NULL COMMENT '城市' ,
CHANGE COLUMN `district_id` `district_id` BIGINT(20) NOT NULL COMMENT '地区' ;
