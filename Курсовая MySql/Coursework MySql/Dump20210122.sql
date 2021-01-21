-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: food_to_go
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clockreck`
--

DROP TABLE IF EXISTS `clockreck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clockreck` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL COMMENT 'время прихода на работу',
  `end_time` datetime NOT NULL COMMENT 'время ухода с работы',
  `lateness` tinyint(1) NOT NULL COMMENT 'признак того, что человек опаздал \n0 - пришел вовремя\n1 - опаздал',
  `delay` time DEFAULT NULL COMMENT 'время, на сколько опаздал сотрудник',
  `empoloyees_id` int unsigned NOT NULL,
  `restaurant_id` int unsigned NOT NULL,
  `shifts_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clockreck_empoloyees1_idx` (`empoloyees_id`),
  KEY `fk_clockreck_restaurant1_idx` (`restaurant_id`),
  KEY `fk_clockreck_shifts1_idx` (`shifts_id`),
  CONSTRAINT `fk_clockreck_empoloyees1` FOREIGN KEY (`empoloyees_id`) REFERENCES `empoloyees` (`id`),
  CONSTRAINT `fk_clockreck_restaurant1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
  CONSTRAINT `fk_clockreck_shifts1` FOREIGN KEY (`shifts_id`) REFERENCES `shifts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Учет рабочего времени';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clockreck`
--

LOCK TABLES `clockreck` WRITE;
/*!40000 ALTER TABLE `clockreck` DISABLE KEYS */;
INSERT INTO `clockreck` VALUES (1,'1974-10-30 02:25:30','2000-09-28 18:02:31',0,'00:00:00',3,1,1),(2,'2003-12-31 16:33:55','1978-07-28 12:25:28',0,'00:00:00',9,3,2),(3,'2013-04-16 04:32:33','1996-09-29 06:18:44',1,'00:15:45',6,2,2),(4,'2007-12-22 19:12:26','1979-05-03 05:18:35',0,'00:00:00',6,2,4),(5,'2004-06-28 15:11:03','2000-10-18 14:34:45',1,'01:18:45',6,2,3),(6,'2007-11-02 17:03:16','1984-06-26 23:27:01',0,'00:00:00',9,3,3),(7,'1991-04-30 08:38:58','2017-07-25 19:59:20',0,'00:00:00',9,3,5),(8,'2010-04-09 04:17:14','1985-06-16 00:14:16',0,'00:00:00',9,3,5),(9,'1972-04-17 07:14:36','1980-11-20 13:53:47',1,'00:58:16',9,3,8),(10,'1990-03-10 07:30:41','1971-03-17 04:47:32',1,'00:20:40',3,1,7),(11,'2009-08-16 04:40:08','1977-10-02 05:13:00',0,'00:00:00',3,1,4),(12,'1989-04-27 13:46:57','1972-03-17 13:42:44',0,'00:00:00',3,1,10),(13,'2002-11-07 07:01:36','1990-10-09 08:59:05',0,'00:00:00',6,2,8),(14,'1994-07-27 15:36:52','1970-08-30 11:55:19',0,'00:00:00',9,3,1),(15,'1990-09-21 07:19:33','1987-11-14 17:39:23',1,'00:05:48',9,3,6);
/*!40000 ALTER TABLE `clockreck` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `food_to_go` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `clockreck_BEFORE_INSERT` BEFORE INSERT ON `clockreck` FOR EACH ROW BEGIN
	IF NEW.start_time > now() THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Err: No new entries';
     END IF;   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `food_to_go` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
ALTER DATABASE `food_to_go` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `clockreck_BEFORE_UPDATE` BEFORE UPDATE ON `clockreck` FOR EACH ROW BEGIN
IF NEW.start_time > now() THEN
		SET NEW.start_time = OLD.start_time;
    END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `food_to_go` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` int unsigned NOT NULL,
  `currency_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Валюта';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,4,'Euro'),(2,2,'Rub'),(3,7,'Dollar');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` int unsigned NOT NULL,
  `discount_name` varchar(100) NOT NULL,
  `percent` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Скидки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,1000043231,'Discount 3%',3),(2,1000073852,'Discount 5%',5),(3,1000038954,'Discount 7%',7),(4,1000066519,'Discount 10%',10),(5,1000089223,'Discount 15%',15),(6,1000001635,'Discount 20%',20),(7,1000073397,'Discount 25%',25),(8,1000048418,'Discount 30%',30),(9,1000091877,'Discount 40%',40),(10,1000035872,'!Discount 50%',50);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` int unsigned NOT NULL,
  `dish_name` varchar(300) NOT NULL,
  `portion_weight` int NOT NULL,
  `composition` json DEFAULT NULL,
  `cookmins` time DEFAULT NULL COMMENT 'среднее время приготовления',
  `instruction` text,
  `commint` text,
  `image` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Блюда';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` VALUES (1,737,'Tequila',131,NULL,'05:29:00','Tempore vitae tempora unde aliquam. Perferendis officiis magni asperiores consequatur. Magnam sunt non enim perspiciatis reiciendis. Id eaque quod et delectus.','Voluptatem at voluptas quam minima quam ut magni. Commodi id ut blanditiis dolore alias itaque id. Vero totam eligendi atque consequatur saepe. Sed animi nostrum doloribus aut aspernatur.',''),(2,377,'Cappuccino coffee',246,NULL,'13:01:00','Delectus voluptas minus veniam exercitationem rerum. Qui dolor deleniti laudantium. Id voluptas placeat harum facere officiis qui. Eveniet rerum et quod non quis excepturi natus aperiam.','Culpa rerum dolorem accusantium voluptatem suscipit in placeat. Porro et magnam ratione. Reiciendis reiciendis fuga nulla autem id asperiores quo.',_binary 'http://lorempixel.com/640/480/'),(3,480,'Cheesecake',274,NULL,'23:26:00','Rem eveniet debitis itaque. Cum odio qui eos alias aspernatur ipsum reprehenderit. Nemo odit hic consequatur omnis officiis omnis eos doloribus.','Qui animi dolorum numquam quam in corrupti quia. Nobis necessitatibus qui inventore. Est eius suscipit vitae. Similique eum consequatur voluptatem laborum quam.',''),(4,845,'Royal Seth',82,NULL,'02:46:00','Rerum et sed eveniet possimus. Esse et ea esse omnis. Placeat aut autem in in.','Minus molestiae reiciendis voluptatum et. Et voluptatibus sunt sunt aut dolor. Rerum modi nesciunt unde ut quo.',''),(5,653,'Big Mac',183,NULL,'09:09:00','Deserunt facere exercitationem consequatur rem dignissimos est. Ratione ipsa autem exercitationem nesciunt facilis. Quo quo iure error quia adipisci ullam tempora.','Distinctio eum repudiandae nobis. Id aut error quibusdam recusandae omnis qui ut non.',_binary 'http://lorempixel.com/640/480/'),(6,679,'Milkshake',190,NULL,'09:39:00','Impedit commodi cupiditate doloribus rerum maiores. Dolores distinctio a dolores totam. Sed soluta assumenda hic. Ratione odio consequatur optio voluptatem facilis.','Non cumque facilis architecto quos est autem nostrum. Dignissimos et qui autem similique sunt molestias. Reprehenderit voluptatem mollitia voluptatem eum.',_binary 'http://lorempixel.com/640/480/'),(7,878,'McFlavor',50,NULL,'23:15:00','Reprehenderit aliquid voluptatibus et quia est odit. Vitae distinctio minus quibusdam. Magni ratione laboriosam saepe et voluptatem animi. Consequatur nihil incidunt in delectus non rerum dolorum enim. Deserunt quis neque vitae culpa assumenda placeat.','Neque fugit quo culpa beatae nisi. Dolores ab ab pariatur perferendis. Nulla totam incidunt cupiditate incidunt qui.',''),(8,629,'French fries',31,NULL,'06:18:00','Quia qui quos voluptatem laudantium. Voluptatibus facere delectus rerum quod rerum. Sint reprehenderit corporis aperiam. Et corporis ratione dolor omnis vitae.','Qui cum quae dolorem. Deserunt exercitationem dolores suscipit non qui veniam sed eius. Doloribus et accusantium mollitia vel quia.',''),(9,368,'Raspberry tea',167,NULL,'16:31:00','Sed ducimus voluptatem omnis et minima cumque at deserunt. Voluptate sit voluptas quas quibusdam quod nostrum. Perferendis et consectetur rerum aut error placeat. Facere fugiat eos consequatur non.','Incidunt eius tempore voluptas qui. Itaque non beatae nam.',_binary 'http://lorempixel.com/640/480/'),(10,788,'Shrimp Roll',299,NULL,'01:17:00','Et nihil deleniti blanditiis voluptatibus dolorem esse. Maiores labore sapiente omnis vitae magnam voluptatem tempora quo. Autem doloremque dolorem id ducimus voluptatibus. Ullam vitae laboriosam quos doloribus.','Natus perspiciatis consequatur laborum nobis sunt placeat. Impedit ut eum a quia nisi. Facere in quaerat consequatur sint suscipit. Laboriosam eos sed quia voluptas ut atque.',_binary 'http://lorempixel.com/640/480/'),(11,194,'Cheese sauce',167,NULL,'01:10:00','Dolorem quaerat perferendis est laboriosam. Eum quia eligendi fugiat deserunt provident. Beatae omnis nam corporis molestiae et repudiandae.','Nobis temporibus qui iste accusantium. Hic quod voluptates voluptatem eveniet. At porro aspernatur est consequatur. Non delectus aut non debitis id quas illum.',''),(12,723,'Sauce \"1000 Islands\"',263,NULL,'01:36:00','Repellendus adipisci dicta praesentium vero temporibus doloremque. Iure nisi qui aut doloremque esse nihil. Accusantium voluptatem laboriosam non officia. Est ut non voluptas animi.','Qui eum dolores accusamus nihil. Mollitia placeat asperiores et quia sapiente. Non repellat qui reprehenderit.',''),(13,453,'McFlurry Tiramisu',66,NULL,'10:45:00','Est voluptatem quia et expedita sed deleniti. Nisi quasi velit est necessitatibus voluptas sed. Reprehenderit nostrum quia quam deserunt repudiandae et ut.','Quos nisi quia et et blanditiis consectetur officia aperiam. Fuga ea esse et officiis. Vitae dignissimos ut tenetur magni. Tenetur dolorem mollitia occaecati mollitia.',_binary 'http://lorempixel.com/640/480/'),(14,182,'Chocolate mousse',64,NULL,'20:43:00','Quisquam ea rerum autem ut voluptas quaerat rem fugiat. Consequatur aut reprehenderit molestiae. Repellat quidem provident vel eum.','Excepturi itaque vero dolor aspernatur ut vel. Voluptatem ut quibusdam voluptatem voluptatem et omnis. Officiis voluptatem sit voluptas vel quis. Voluptas repellat omnis omnis aut cumque.',_binary 'http://lorempixel.com/640/480/'),(15,494,'Cherry pie',119,NULL,'14:42:00','Vel aut sapiente ipsa earum ea nulla sint aut. Similique dolores modi fugiat praesentium ea sed. Natus voluptas rerum ab eius repellat nemo error.','Magni velit corporis dolorum dolor autem velit atque velit. Repellat possimus laboriosam qui qui voluptas corrupti vitae.','');
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empoloyees`
--

DROP TABLE IF EXISTS `empoloyees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empoloyees` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` int unsigned NOT NULL,
  `employee_name` varchar(300) NOT NULL,
  `password_hash` char(65) NOT NULL,
  `phone` bigint unsigned NOT NULL,
  `e-mail` varchar(150) NOT NULL,
  `address` varchar(300) NOT NULL,
  `restaurant_id` int unsigned NOT NULL,
  `positions_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `fk_empoloyees_restaurant_idx` (`restaurant_id`),
  KEY `fk_empoloyees_positions1_idx` (`positions_id`),
  CONSTRAINT `fk_empoloyees_positions1` FOREIGN KEY (`positions_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `fk_empoloyees_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Сотрудники';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empoloyees`
--

LOCK TABLES `empoloyees` WRITE;
/*!40000 ALTER TABLE `empoloyees` DISABLE KEYS */;
INSERT INTO `empoloyees` VALUES (1,716,'Kylee Mills','b785e21896dd5dab7ba07eb049553515b2550375',79425634605,'elias.o\'connell@example.org','7513 Hills Glen Suite 926\nSchuppeshire, OK 90723-7906',1,1),(2,454,'Prof. Anika Olson','906b11cf595329593cf36612d186676fcb5153a0',79534757402,'kaitlyn60@example.org','6355 Tromp Street\nUlisesport, TN 28187',3,2),(3,643,'Helmer Trantow','5850700d30941a020ce07457bc33c0b0e4b2e5a5',79423031075,'dklocko@example.net','0514 Cummerata Light\nWest Laylaville, CA 15031-6037',2,3),(4,559,'Kelton Barton','da9c87b1251fa024643c5a167c28139939cb8dfd',79303393742,'bertha.rowe@example.com','5277 Rodriguez Trafficway Suite 345\nNew Jamel, NY 97907-7612',1,1),(5,787,'Freeman Mueller DVM','765a740359d671471e3e6dcfb3017d16522ad737',79802821223,'lula.senger@example.com','18010 Alexys Shore\nAlejandraview, ID 45361-0548',3,2),(6,255,'Myah Bosco PhD','cb19814d56df126d40293d74c6ed9d675d6e8a34',79804711882,'stehr.abelardo@example.net','768 Helen Fields\nEast Ferminport, WV 87347-9731',1,3),(7,746,'Lurline Pouros','6c34932d7fe9b58c4e7dca1e4b661ca31f7be588',79158653046,'heidenreich.jose@example.net','3898 Hickle Ranch Suite 759\nPort Elinorfort, KY 57058-3167',2,1),(8,604,'Queen Waters','8c0ea2a9b5f63a1f6c77c4ec6e67a375ed5b6108',79089726906,'kirlin.lee@example.org','9552 Omer Crossroad\nMavisstad, AL 31911-8897',1,2),(9,450,'Norma Bartell','2d5b23279555b1d1b37a115514f8d704ba4bf290',79052441046,'jacinto.hirthe@example.org','8599 Darien Rue Apt. 628\nTimothyburgh, ID 20164',3,3),(10,910,'Onie Lindgren','c8b7fd1c675a025fb2930f55683540d0c2622a37',79503758674,'jacobi.diamond@example.org','732 Esteban Drive Apt. 377\nWest Andreberg, AR 80060-2959',2,1);
/*!40000 ALTER TABLE `empoloyees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `orders_id` int unsigned NOT NULL,
  `dishes_id` int unsigned NOT NULL,
  `prices_id` int unsigned NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `psdcards_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  KEY `fk_order_product_orders1_idx` (`orders_id`),
  KEY `fk_order_product_dishes1_idx` (`dishes_id`),
  KEY `fk_order_product_prices1_idx` (`prices_id`),
  KEY `fk_order_product_psdcards1_idx` (`psdcards_id`),
  CONSTRAINT `fk_order_product_dishes1` FOREIGN KEY (`dishes_id`) REFERENCES `dishes` (`id`),
  CONSTRAINT `fk_order_product_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_order_product_prices1` FOREIGN KEY (`prices_id`) REFERENCES `prices` (`id`),
  CONSTRAINT `fk_order_product_psdcards1` FOREIGN KEY (`psdcards_id`) REFERENCES `psdcards` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,1,1,618,1,1),(1,7,7,439,2,3),(3,2,18,943,8,4),(4,15,15,64,1,9),(5,3,3,851,3,1),(6,11,11,276,8,4),(7,1,1,618,10,4),(8,2,18,943,10,3),(11,7,23,812,1,2),(10,7,23,812,2,10),(11,7,23,812,3,8),(12,8,2,355,9,7),(13,10,10,740,4,1),(14,13,13,893,4,6),(15,7,23,812,8,4),(16,5,20,831,1,2),(17,1,1,618,8,9),(18,3,3,851,2,3),(19,5,19,864,1,7),(20,10,10,740,3,10),(1,8,8,355,5,8),(3,2,18,943,7,5),(3,7,17,282,11,4),(3,8,8,355,13,10),(7,5,20,831,14,3),(7,13,13,893,15,10),(7,1,1,618,1,3),(8,11,11,276,6,9),(10,3,3,851,3,6),(1,7,17,282,7,5);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_name` varchar(45) NOT NULL,
  `start_servises` datetime NOT NULL COMMENT 'время начала приготовления заказа',
  `end_servises` datetime NOT NULL COMMENT 'время завершения приготовления заказа',
  `restaurant_id` int unsigned NOT NULL,
  `empoloyees_id` int unsigned NOT NULL,
  `psdcards_id` int unsigned NOT NULL,
  `shifts_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_restaurant1_idx` (`restaurant_id`),
  KEY `fk_orders_empoloyees1_idx` (`empoloyees_id`),
  KEY `fk_orders_psdcards1_idx` (`psdcards_id`),
  KEY `fk_orders_shifts1_idx` (`shifts_id`),
  CONSTRAINT `fk_orders_empoloyees1` FOREIGN KEY (`empoloyees_id`) REFERENCES `empoloyees` (`id`),
  CONSTRAINT `fk_orders_psdcards1` FOREIGN KEY (`psdcards_id`) REFERENCES `psdcards` (`id`),
  CONSTRAINT `fk_orders_restaurant1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
  CONSTRAINT `fk_orders_shifts1` FOREIGN KEY (`shifts_id`) REFERENCES `shifts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Order/1201','1983-07-24 23:14:32','1974-10-29 22:38:23',1,3,1,1),(2,'Order/1202','1986-03-16 23:47:35','1975-07-15 02:33:28',1,3,2,5),(3,'Order/1203','2021-01-09 07:21:45','1970-04-27 18:59:12',2,6,4,3),(4,'Order/1204','1974-12-19 14:20:36','1994-11-13 12:40:27',1,3,4,1),(5,'Order/1205','1982-04-02 19:18:04','2020-01-28 07:10:14',2,6,6,4),(6,'Order/1206','1991-01-18 21:17:32','1988-05-08 12:26:27',3,9,1,10),(7,'Order/1207','1973-05-20 07:42:26','2012-12-05 14:05:14',3,9,2,2),(8,'Order/1208','1992-10-25 10:57:07','1989-10-23 22:19:57',3,9,2,7),(9,'Order/1209','1972-12-26 20:29:11','2004-05-30 07:50:45',3,9,4,6),(10,'Order/1210','1995-05-14 03:25:53','1987-08-30 15:40:59',1,3,11,9),(11,'Order/1211','1995-06-28 02:07:59','1979-08-05 01:38:24',1,3,13,9),(12,'Order/1212','2006-04-14 20:03:52','2008-08-08 12:11:51',1,3,6,9),(13,'Order/1213','2004-04-09 03:14:50','2007-01-18 20:20:19',2,6,2,8),(14,'Order/1214','1989-10-20 21:46:16','1987-07-23 00:39:20',2,6,15,8),(15,'Order/1215','1990-08-27 17:33:18','2003-10-04 11:16:00',3,9,3,10),(16,'Order/1216','1997-12-13 11:23:06','1992-02-17 16:22:23',1,3,7,7),(17,'Order/1217','1991-09-18 14:13:14','1988-09-16 00:58:46',1,3,10,7),(18,'Order/1218','1987-09-30 10:05:49','1982-09-05 15:47:27',3,9,1,10),(19,'Order/1219','1970-05-28 19:58:48','2003-05-30 14:31:40',1,3,5,9),(20,'Order/1220','2005-04-07 22:08:17','1994-07-08 07:16:05',2,6,7,8);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` int unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='должности';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,4,'Cook'),(2,6,'Manager'),(3,1,'Cashier');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(10,0) unsigned NOT NULL,
  `dishes_id` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `currencies_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prices_dishes1_idx` (`dishes_id`),
  KEY `fk_prices_currencies1_idx` (`currencies_id`),
  CONSTRAINT `fk_prices_currencies1` FOREIGN KEY (`currencies_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `fk_prices_dishes1` FOREIGN KEY (`dishes_id`) REFERENCES `dishes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='Цены';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,618,1,'2000-07-10 04:00:00',2),(2,275,2,'2006-01-29 09:06:52',2),(3,851,3,'2010-04-26 00:38:09',2),(4,530,4,'1991-10-24 11:52:19',1),(5,155,5,'1998-09-08 21:28:41',2),(6,337,6,'1993-07-01 03:10:12',3),(7,439,7,'2004-04-13 13:41:49',3),(8,355,8,'1977-08-30 12:17:41',3),(9,581,9,'2018-05-08 10:00:47',2),(10,740,10,'1988-01-09 12:12:58',2),(11,276,11,'1996-07-09 11:12:04',2),(12,244,12,'2004-09-24 23:54:11',1),(13,893,13,'1981-11-06 23:39:58',1),(14,253,14,'1980-07-11 06:24:40',3),(15,64,15,'2020-01-24 18:07:45',2),(16,329,5,'2017-02-15 17:27:56',2),(17,282,7,'2008-11-07 00:12:02',3),(18,943,2,'1992-11-16 23:07:33',1),(19,864,5,'2013-10-18 17:15:11',2),(20,831,5,'1983-12-24 14:13:36',2),(21,628,2,'1973-01-15 07:58:40',3),(22,845,6,'1983-11-05 23:27:03',1),(23,812,7,'2018-12-11 18:20:30',2);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psdcards`
--

DROP TABLE IF EXISTS `psdcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `psdcards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` int unsigned NOT NULL,
  `start_data` date NOT NULL COMMENT 'дата выдачи карты',
  `end_data` date NOT NULL COMMENT 'срок окончания действия карты',
  `locked` tinyint(1) NOT NULL COMMENT 'признак блокировки карты \n0 - активная\n1 - заблокированная',
  `client_name` varchar(300) NOT NULL,
  `phone` bigint unsigned NOT NULL,
  `e-mail` varchar(150) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `gender` enum('f','m') NOT NULL,
  `birthday` date NOT NULL,
  `discounts_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `fk_psdcards_discounts1_idx` (`discounts_id`),
  CONSTRAINT `fk_psdcards_discounts1` FOREIGN KEY (`discounts_id`) REFERENCES `discounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Дисконтные катры (клиенты)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psdcards`
--

LOCK TABLES `psdcards` WRITE;
/*!40000 ALTER TABLE `psdcards` DISABLE KEYS */;
INSERT INTO `psdcards` VALUES (1,1000000678,'2014-01-08','1994-03-21',0,'Ivory Emmerich',79448062207,'rbosco@yahoo.com','623 Goodwin Lodge Apt. 130\nLake Amaliaport, WY 74893','m','1970-01-08',1),(2,1000007428,'2010-07-05','1986-01-02',1,'Jeromy Trantow',79325904743,'durgan.danyka@gmail.com','841 Zieme Villages Suite 076\nWest Tamiabury, SC 70172-7499','m','1998-05-02',1),(3,1000008756,'1993-03-07','1979-06-04',0,'Eugenia Station',79731949046,'myundt@yahoo.com','936 Murazik Trace\nLake Demarcusmouth, SC 18625','f','2014-05-22',10),(4,1000003995,'2019-03-02','1982-05-15',1,'Margaretta Centers',79379012696,'sister.kris@hotmail.com','475 Joyce Expressway Suite 958\nJensenton, PA 39934-1638','f','2018-01-24',2),(5,1000001897,'1983-06-25','2013-06-05',1,'Annalise Hilll',79927236015,'kennedy66@yahoo.com','3100 Nikolaus Place\nNorth Emilieshire, MD 49513','f','2009-07-05',3),(6,1000004685,'2017-06-28','1984-06-08',0,'Kristin Vandervort',79655538338,'fermin54@gmail.com','00450 Huels Lock Apt. 641\nKarichester, NH 51693-0577','f','1970-07-24',8),(7,1000001467,'1986-06-12','1986-01-08',1,'Kelton Barton',79363010331,'elizabeth.gibson@hotmail.com','5161 West Mission Apt. 367\nSouth Darion, PA 12255-8369','f','2003-05-02',1),(8,1000009157,'2002-03-02','2003-05-06',0,'Kylee Mills',79374769964,'sylvia66@hotmail.com','525 Romaguera Ramp\nPort Bonnie, MO 97609','f','2006-04-20',8),(9,1000003809,'2008-02-23','2008-09-15',0,'Norma Bartell',79740010466,'maximus.bogisich@hotmail.com','05649 Ebert Brooks Apt. 725\nNew Shaniatown, MT 16050-0069','m','1987-04-02',9),(10,1000004745,'1975-03-05','2009-02-19',0,'Onie Lindgren',79422493998,'ukertzmann@yahoo.com','8482 Arnoldo Crescent Apt. 206\nElainaborough, IA 69776','m','2013-12-22',10),(11,1000001621,'2014-01-03','1974-01-08',0,'Omer Crossroad',79063500905,'lbechtelar@gmail.com','4447 Adeline Turnpike\nPort Muriel, WI 18362-6106','f','2003-11-29',5),(12,1000000452,'2020-11-28','2010-09-19',0,'Gideon Gleason',79245499094,'collier.alexane@gmail.com','05690 Langworth Vista\nPort Hallechester, OK 08930','m','1980-07-28',1),(13,1000002357,'2016-08-22','1992-02-02',1,'Tromp Street',79400898940,'cbrown@gmail.com','63461 Harris Creek\nTonimouth, MO 72737','f','1973-07-12',4),(14,1000001413,'2013-05-17','2001-03-26',0,'Freeman Mueller',79147666993,'daugherty.johnpaul@hotmail.com','4758 Marco Street Suite 389\nPort Leilani, CA 27770','m','2013-02-24',8),(15,1000001105,'1985-04-22','1973-03-08',0,'Alexys Shore',79469576474,'schultz.hildegard@hotmail.com','642 Bauch Parkways Apt. 176\nLake Kaylee, SC 92907-4713','m','1985-12-01',7);
/*!40000 ALTER TABLE `psdcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` int unsigned NOT NULL,
  `name` varchar(150) NOT NULL,
  `data_open` date NOT NULL COMMENT 'дата открытия',
  `operation_hours` varchar(50) NOT NULL COMMENT 'часы работы',
  `address` varchar(300) NOT NULL,
  `phone` bigint unsigned NOT NULL,
  `location` point DEFAULT NULL COMMENT 'широта',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Рестораны';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,6887,'Food To Go №1','2010-10-07','с 8.00 по 22.00','8113 Toy Terrace\nWymanton, OH 48606',79765692861,_binary '\0\0\0\0\0\0\0I��9mS*��L\�\"R�'),(2,3785,'Food To Go №2','1991-03-21','с 10.00 по 22.00','4708 Schuster River\nVerdahaven, AL 05539-2963',79675799114,_binary '\0\0\0\0\0\0\0�a�\�\�@�\�h\�[X\"@'),(3,7090,'Food To Go №3','2015-08-05','с 9.00 по 22.00','149 Rath Street Suite 336\nD\'Amoreport, OH 53681-6926',79885667965,_binary '\0\0\0\0\0\0\0\�W��O;��F�Q[�');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!50001 DROP VIEW IF EXISTS `sales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales` AS SELECT 
 1 AS `Ресторан`,
 1 AS `Заказ`,
 1 AS `Блюдо`,
 1 AS `Количество_блюд`,
 1 AS `Цена`,
 1 AS `Кассир`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `shift_num` int unsigned NOT NULL,
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'начало смены',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'завершение смены',
  `closed` tinyint(1) NOT NULL COMMENT 'признак закрытия смены \n0 - открыта\n1 - закрыта',
  `empoloyees_id` int unsigned NOT NULL,
  `restaurant_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shifts_empoloyees1_idx` (`empoloyees_id`),
  KEY `fk_shifts_restaurant1_idx` (`restaurant_id`),
  CONSTRAINT `fk_shifts_empoloyees1` FOREIGN KEY (`empoloyees_id`) REFERENCES `empoloyees` (`id`),
  CONSTRAINT `fk_shifts_restaurant1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Смены';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (1,66,'1972-04-13 08:05:12','2014-08-25 02:59:03',1,3,1),(2,94,'2001-02-23 10:06:59','1985-11-02 02:00:08',0,9,3),(3,90,'1976-03-06 02:51:39','1999-08-25 13:03:57',1,6,2),(4,55,'2010-03-10 21:31:55','1983-09-14 02:43:19',1,6,2),(5,46,'1989-10-19 08:34:38','2016-01-02 00:26:12',1,3,1),(6,40,'1986-10-02 15:14:11','1999-07-20 18:43:01',0,9,3),(7,81,'1973-05-30 20:17:22','1984-03-09 23:14:10',1,9,3),(8,54,'2015-12-11 03:23:16','1993-05-16 04:49:25',1,6,2),(9,23,'1991-10-01 15:46:47','2005-11-07 22:33:56',0,3,1),(10,75,'1991-01-19 19:01:43','1995-03-29 16:29:37',0,9,3);
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `work_time`
--

DROP TABLE IF EXISTS `work_time`;
/*!50001 DROP VIEW IF EXISTS `work_time`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `work_time` AS SELECT 
 1 AS `Ресторан`,
 1 AS `Код`,
 1 AS `Сотрудник`,
 1 AS `Телефон`,
 1 AS `Почта`,
 1 AS `Адрес`,
 1 AS `Начало_смены`,
 1 AS `Окончание_смены`,
 1 AS `Время_опаздания`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'food_to_go'
--

--
-- Dumping routines for database 'food_to_go'
--
/*!50003 DROP PROCEDURE IF EXISTS `limit` */;
ALTER DATABASE `food_to_go` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `limit`()
BEGIN
	SELECT 
			psdcards.`code`,
			psdcards.client_name,
			psdcards.phone,
			psdcards.`e-mail`,
			psdcards.address,
			psdcards.`locked`,
			discounts.discount_name,
			discounts.percent
		FROM psdcards
		LEFT JOIN discounts ON psdcards.discounts_id = discounts.id
		WHERE psdcards.`locked` = 1 
        ORDER BY discounts.percent;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `food_to_go` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `limit_psdcards` */;
ALTER DATABASE `food_to_go` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `limit_psdcards`()
BEGIN
	SELECT 
			psdcards.`code`,
			psdcards.client_name,
			psdcards.phone,
			psdcards.`e-mail`,
			psdcards.address,
			psdcards.`locked`,
			discounts.discount_name,
			discounts.percent
		FROM psdcards
		LEFT JOIN discounts ON psdcards.discounts_id = discounts.id
		WHERE psdcards.`locked` = 1 
        ORDER BY discounts.percent;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `food_to_go` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `psdcards` */;
ALTER DATABASE `food_to_go` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `psdcards`()
BEGIN
	SELECT 
		psdcards.`code`,
		psdcards.client_name,
		psdcards.phone,
		psdcards.`e-mail`,
		psdcards.address,
		psdcards.`locked`,
		discounts.discount_name,
		discounts.percent
	FROM psdcards
	LEFT JOIN discounts ON psdcards.discounts_id = discounts.id
	WHERE psdcards.`locked` = 0 
	ORDER BY rand()
	LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `food_to_go` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

--
-- Final view structure for view `sales`
--

/*!50001 DROP VIEW IF EXISTS `sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales` AS select `r`.`name` AS `Ресторан`,`o`.`order_name` AS `Заказ`,`d`.`dish_name` AS `Блюдо`,`op`.`quantity` AS `Количество_блюд`,`op`.`price` AS `Цена`,`e`.`employee_name` AS `Кассир` from ((((`orders` `o` left join `restaurant` `r` on((`o`.`restaurant_id` = `r`.`id`))) join `order_product` `op` on((`o`.`id` = `op`.`orders_id`))) left join `dishes` `d` on((`op`.`dishes_id` = `d`.`id`))) join `empoloyees` `e` on((`o`.`empoloyees_id` = `e`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `work_time`
--

/*!50001 DROP VIEW IF EXISTS `work_time`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `work_time` AS select `r`.`name` AS `Ресторан`,`e`.`code` AS `Код`,`e`.`employee_name` AS `Сотрудник`,`e`.`phone` AS `Телефон`,`e`.`e-mail` AS `Почта`,`e`.`address` AS `Адрес`,`c`.`start_time` AS `Начало_смены`,`c`.`end_time` AS `Окончание_смены`,`c`.`delay` AS `Время_опаздания` from ((`clockreck` `c` left join `empoloyees` `e` on((`c`.`empoloyees_id` = `e`.`id`))) left join `restaurant` `r` on((`c`.`restaurant_id` = `r`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-22  2:08:46
