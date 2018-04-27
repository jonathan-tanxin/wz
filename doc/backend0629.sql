ALTER TABLE `wz`.`dish` 
ADD COLUMN `isCustomerOwner` tinyint NULL COMMENT '是否属于会员' AFTER `isdel`;