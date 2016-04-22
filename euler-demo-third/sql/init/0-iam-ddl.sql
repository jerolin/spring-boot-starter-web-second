
CREATE TABLE `DEMO_PRODUCT` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `update_by_id` bigint(20) NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `display_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;


CREATE TABLE `DEMO_SALES_ITEM` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `update_by_id` bigint(20) NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `type` varchar(64) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `DEMO_JSON_TEMPLATE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by_id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `update_by_id` bigint(20) NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `template_key` varchar(64) DEFAULT NULL,
  `template_value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

alter table `DEMO_SALES_ITEM` add constraint FK_ID foreign key(`product_id`) REFERENCES `DEMO_PRODUCT`(`id`);

