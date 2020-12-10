-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: vk
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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(145) NOT NULL,
  `desc` varchar(245) DEFAULT NULL,
  `admin_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_communitis_users1_idx` (`admin_id`),
  CONSTRAINT `fk_communitis_users1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `frend_request`
--

DROP TABLE IF EXISTS `frend_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frend_request` (
  `from_users_id` int unsigned NOT NULL,
  `to_users_id` int unsigned NOT NULL,
  `status` smallint NOT NULL COMMENT '-1 - отклонен\n0 - запрос\n1 - принят',
  PRIMARY KEY (`from_users_id`,`to_users_id`),
  KEY `fk_frend_request_users1_idx` (`from_users_id`),
  KEY `fk_frend_request_users2_idx` (`to_users_id`),
  CONSTRAINT `fk_frend_request_users1` FOREIGN KEY (`from_users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_frend_request_users2` FOREIGN KEY (`to_users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `users_id` int unsigned NOT NULL,
  `messages_id` int unsigned DEFAULT NULL,
  `media_id` int unsigned DEFAULT NULL,
  `posts_id` int unsigned DEFAULT NULL,
  UNIQUE KEY `index1` (`users_id`,`messages_id`) /*!80000 INVISIBLE */,
  UNIQUE KEY `index2` (`users_id`,`media_id`) /*!80000 INVISIBLE */,
  UNIQUE KEY `index3` (`users_id`,`posts_id`),
  KEY `fk_likes_users1_idx` (`users_id`),
  KEY `fk_likes_media1_idx` (`media_id`),
  KEY `fk_likes_posts1_idx` (`posts_id`),
  KEY `fk_likes_messages1_idx` (`messages_id`),
  CONSTRAINT `fk_likes_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_likes_messages1` FOREIGN KEY (`messages_id`) REFERENCES `messages` (`id`),
  CONSTRAINT `fk_likes_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_likes_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL,
  `media_types_id` int unsigned NOT NULL,
  `file` varchar(245) DEFAULT NULL,
  `blob` blob,
  `size` bigint DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_media_types1_idx` (`media_types_id`),
  KEY `fk_media_users1_idx` (`users_id`),
  CONSTRAINT `fk_media_media_types1` FOREIGN KEY (`media_types_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `fk_media_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `created_it` datetime DEFAULT CURRENT_TIMESTAMP,
  `from_user_id` int unsigned NOT NULL,
  `to_user_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_messages_users1_idx` (`from_user_id`),
  KEY `fk_messages_users2_idx` (`to_user_id`),
  CONSTRAINT `fk_messages_users1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_users2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL,
  `communities_id` int unsigned DEFAULT NULL,
  `media_id` int unsigned DEFAULT NULL,
  `text` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_posts_users1_idx` (`users_id`),
  KEY `fk_posts_communities1_idx` (`communities_id`),
  KEY `fk_posts_media1_idx` (`media_id`),
  CONSTRAINT `fk_posts_communities1` FOREIGN KEY (`communities_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_posts_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_posts_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `users_id` int unsigned NOT NULL,
  `gender` enum('f','m','x') NOT NULL,
  `birthday` date NOT NULL,
  `adress` varchar(245) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_id`),
  KEY `fk_profiles_users_idx` (`users_id`),
  CONSTRAINT `fk_profiles_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='профили пользователей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(145) NOT NULL,
  `lastname` varchar(145) NOT NULL,
  `email` varchar(145) NOT NULL,
  `phone` bigint unsigned NOT NULL,
  `password_hash` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_communities` (
  `communitis_id` int unsigned NOT NULL,
  `users_id` int unsigned NOT NULL,
  PRIMARY KEY (`communitis_id`,`users_id`),
  KEY `fk_users_communities_communitis1_idx` (`communitis_id`),
  KEY `fk_users_communities_users1_idx` (`users_id`),
  CONSTRAINT `fk_users_communities_communitis1` FOREIGN KEY (`communitis_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_users_communities_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-09  2:37:53
