CREATE DATABASE  IF NOT EXISTS `miliu-devops-tt_DB` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `miliu-devops-tt_DB`;

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `hibernate_sequence` WRITE;

INSERT INTO `hibernate_sequence` VALUES (13),(13);

UNLOCK TABLES;

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `role` WRITE;

INSERT INTO `role` VALUES (1,'ADMIN');

UNLOCK TABLES;

DROP TABLE IF EXISTS `t_account_transaction`;

CREATE TABLE `t_account_transaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATED_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACCOUNT_ID` int(11) NOT NULL COMMENT 'Foreign key to the Account table',
  `ACCOUNT_NUMBER` varchar(45) NOT NULL COMMENT 'Convenience attribute listing the account number',
  `CUSTOMER_NUMBER` varchar(25) NOT NULL COMMENT 'Convenience attribute listing the customer number',
  `TX_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MCC_CODE` varchar(50) NOT NULL,
  `TX_REFERENCE` varchar(25) NOT NULL,
  `TX_DESC` varchar(300) NOT NULL,
  `TX_TYPE` varchar(2) NOT NULL,
  `TX_AMOUNT` double NOT NULL,
  `TX_STATUS_CODE` varchar(20) NOT NULL,
  `AVAILABLE_BALANCE` double NOT NULL,
  `RECIPIENT` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=901336 DEFAULT CHARSET=utf8;

LOCK TABLES `t_account_transaction` WRITE;

INSERT INTO `t_account_transaction` VALUES 
(901326,'2019-06-13 17:33:45','2019-06-13 18:43:53',900112354,'700112354','500112354','2019-06-13 17:33:46','33445','HN7868JH98N','Verizon Phone Bill','2',400,'SUCCESS',2500,'Verizon'),
(901327,'2019-06-13 17:33:45','2019-06-13 18:43:55',900112354,'700112354','500112354','2019-06-12 17:33:46','33444','HN7868JH76Y','Cash ','1',500,'SUCCESS',3000,'John Miller'),
(901328,'2019-06-13 17:33:45','2019-06-13 18:43:53',900112354,'700112354','500112354','2019-06-11 17:33:46','78765','HN7868JH98H','AT&T Internet','2',1000,'SUCCESS',2000,'At&T'),
(901329,'2019-06-13 17:33:45','2019-06-13 18:43:54',900112354,'700112354','500112354','2019-06-10 17:33:46','87462','HN7868JH80K','State government Tax ','2',800,'SUCCESS',1200,'State Government'),
(901330,'2019-06-13 17:33:45','2019-06-13 18:43:54',900112354,'700112354','500112354','2019-06-09 17:33:46','98762','HN7868JH76K','City Electricity Board','2',900,'SUCCESS',300,'EBoard'),
(901331,'2019-06-13 17:33:45','2019-06-13 18:43:56',900112354,'700112354','500112354','2019-06-08 17:33:46','34769','HN7868JH66N','Transfer from friend','1',2500,'SUCCESS',2800,'Duke Brown'),
(901332,'2019-06-13 17:33:45','2019-06-13 18:43:58',900112354,'700112354','500112354','2019-06-07 17:33:46','77664','HN7868JH23L','Shopping to mall','2',1500,'SUCCESS',1300,'H&M'),
(901333,'2019-06-13 17:33:45','2019-06-13 18:43:56',900112354,'700112354','500112354','2019-06-06 17:33:46','98325','HN7868JH11G','UBI Health Insurance ','2',500,'SUCCESS',800,'UBI'),
(901334,'2019-06-13 17:33:45','2019-06-13 18:43:57',900112354,'700112354','500112354','2019-06-05 17:33:46','09091','HN7868JK90B','Salary Credited','1',25000,'SUCCESS',25800,'ECME media'),
(901335,'2019-06-13 17:33:45','2019-06-13 18:43:57',900112354,'700112354','500112354','2019-06-04 17:33:46','87566','HN7868JH98S','Grocery Shopping','2',500,'SUCCESS',25300,'Walmart');

UNLOCK TABLES;

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


LOCK TABLES `user` WRITE;

INSERT INTO `user` VALUES (1,1,'miliu@bfs.com','bfs','miliu','$2a$10$CEjVFISqkZK8nKL6N7e7AuDFplM4ZPGz3IPI4/x.42fNqCs2sAXlW');

UNLOCK TABLES;


DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `user_role` WRITE;

INSERT INTO `user_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1);

UNLOCK TABLES;
