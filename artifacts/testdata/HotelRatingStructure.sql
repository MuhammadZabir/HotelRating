CREATE DATABASE  IF NOT EXISTS `hotel_rate` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hotel_rate`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel_rate
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `hotel_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(200) DEFAULT NULL,
  `hotel_owner` varchar(200) DEFAULT NULL,
  `hotel_location` varchar(200) DEFAULT NULL,
  `hotel_star` int(11) DEFAULT NULL,
  `hotel_description` longtext,
  `hotel_main_image` longtext,
  `hotel_rating_overall` double DEFAULT NULL,
  PRIMARY KEY (`hotel_id`),
  UNIQUE KEY `hotel_name_UNIQUE` (`hotel_name`),
  FULLTEXT KEY `hotel_name` (`hotel_name`),
  FULLTEXT KEY `hotel_description` (`hotel_description`),
  FULLTEXT KEY `hotel_description_2` (`hotel_description`),
  FULLTEXT KEY `hotel_name_2` (`hotel_name`,`hotel_description`),
  FULLTEXT KEY `hotel_name_3` (`hotel_name`,`hotel_description`),
  FULLTEXT KEY `hotel_name_4` (`hotel_name`,`hotel_description`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hotel_image`
--

DROP TABLE IF EXISTS `hotel_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_image` (
  `image_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_hotel` bigint(20) NOT NULL,
  `image_name` varchar(200) NOT NULL,
  `image_url` longtext NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `image_hotel_idx` (`image_hotel`),
  CONSTRAINT `image_hotel` FOREIGN KEY (`image_hotel`) REFERENCES `hotel` (`hotel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rating_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rating_user` bigint(20) NOT NULL,
  `rating_hotel` bigint(20) NOT NULL,
  `rating_rate` int(11) NOT NULL,
  `rating_comment` longtext,
  PRIMARY KEY (`rating_id`),
  KEY `rating_user_idx` (`rating_user`),
  KEY `rating_hotel_idx` (`rating_hotel`),
  CONSTRAINT `rating_hotel` FOREIGN KEY (`rating_hotel`) REFERENCES `hotel` (`hotel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rating_user` FOREIGN KEY (`rating_user`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_type` int(11) DEFAULT NULL,
  `user_role` int(11) DEFAULT NULL,
  `user_fullname` varchar(200) DEFAULT NULL,
  `user_age` int(11) DEFAULT NULL,
  `user_location` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-26 23:15:53
