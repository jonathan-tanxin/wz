ALTER TABLE `wz`.`card` 
ADD COLUMN `isdel` int NULL COMMENT '是否删除标志' AFTER `amount`;

ALTER TABLE `wz`.`category` 
ADD COLUMN `isdel` int NULL COMMENT '是否删除标志' AFTER `image`;

ALTER TABLE `wz`.`dish` 
ADD COLUMN `isdel` int NULL COMMENT '是否删除标志' AFTER `price`;

ALTER TABLE `wz`.`course` 
ADD COLUMN `isdel` int NULL COMMENT '是否删除标志' AFTER `href`;

ALTER TABLE `wz`.`customer` 
ADD COLUMN `isdel` int NULL COMMENT '是否删除标志' AFTER `setExpertTime`;

ALTER TABLE `wz`.`distributioncenter` 
ADD COLUMN `isdel` int NULL COMMENT '是否删除标志' AFTER `mobile`; 

update  menu set href = 'admin/order/sendList' where id = 326;