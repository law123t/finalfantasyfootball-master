-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ind_proj
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `player_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `player_position` int(11) NOT NULL,
  `total_yards` int(11) NOT NULL,
  `passing_yards` int(11) NOT NULL,
  `rushing_yards` int(11) NOT NULL,
  `receiving_yards` int(11) NOT NULL,
  `touchdowns` int(11) NOT NULL,
  `sacks` int(11) NOT NULL,
  `interceptions` int(11) NOT NULL,
  PRIMARY KEY (`player_id`),
  KEY `fk_player_playerposition_inx` (`player_position`),
  CONSTRAINT `fk_player_playerposition` FOREIGN KEY (`player_position`) REFERENCES `player_position` (`playerposition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'Aaron','Rodgers',1,4797,4428,369,0,44,0,0),(2,'Le\'Veon','Bell',2,1884,0,1268,616,9,0,0),(3,'Demarco','Murray',2,1664,0,1287,377,12,0,0),(4,'Ty','Montgomery',2,805,0,457,348,0,0,0),(5,'Davante','Adams',3,997,0,0,997,12,0,0),(6,'Jordy','Nelson',3,1257,0,0,1257,14,0,0),(7,'Odell','Beckham',3,1376,0,9,1367,10,0,0),(8,'Atlanta','Falcons',4,0,0,0,0,3,34,29);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_position`
--

DROP TABLE IF EXISTS `player_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_position` (
  `playerposition_id` int(11) NOT NULL,
  `position_name` varchar(255) NOT NULL,
  PRIMARY KEY (`playerposition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_position`
--

LOCK TABLES `player_position` WRITE;
/*!40000 ALTER TABLE `player_position` DISABLE KEYS */;
INSERT INTO `player_position` VALUES (1,'QB'),(2,'RB'),(3,'WR'),(4,'DEF');
/*!40000 ALTER TABLE `player_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `userrole_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(15) NOT NULL,
  `role_name` varchar(15) NOT NULL,
  PRIMARY KEY (`userrole_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'admin','administrator');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_team`
--

DROP TABLE IF EXISTS `user_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_team` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(255) NOT NULL,
  `playerone_player_id` int(11) DEFAULT NULL,
  `playertwo_player_id` int(11) DEFAULT NULL,
  `playerthree_player_id` int(11) DEFAULT NULL,
  `playerfour_player_id` int(11) DEFAULT NULL,
  `playerfive_player_id` int(11) DEFAULT NULL,
  `playersix_player_id` int(11) DEFAULT NULL,
  `playerseven_player_id` int(11) DEFAULT NULL,
  `playereight_player_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  KEY `fk_player_one_inx` (`playerone_player_id`),
  KEY `fk_player_two_inx` (`playertwo_player_id`),
  KEY `fk_player_three_inx` (`playerthree_player_id`),
  KEY `fk_player_four_inx` (`playerfour_player_id`),
  KEY `fk_player_five_inx` (`playerfive_player_id`),
  KEY `fk_player_six_inx` (`playersix_player_id`),
  KEY `fk_player_seven_inx` (`playerseven_player_id`),
  KEY `fk_player_eight_inx` (`playereight_player_id`),
  CONSTRAINT `fk_player_eight` FOREIGN KEY (`playereight_player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `fk_player_five` FOREIGN KEY (`playerfive_player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `fk_player_four` FOREIGN KEY (`playerfour_player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `fk_player_one` FOREIGN KEY (`playerone_player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `fk_player_seven` FOREIGN KEY (`playerseven_player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `fk_player_six` FOREIGN KEY (`playersix_player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `fk_player_three` FOREIGN KEY (`playerthree_player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `fk_player_two` FOREIGN KEY (`playertwo_player_id`) REFERENCES `player` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_team`
--

LOCK TABLES `user_team` WRITE;
/*!40000 ALTER TABLE `user_team` DISABLE KEYS */;
INSERT INTO `user_team` VALUES (1,'',1,3,2,7,6,5,4,8),(2,'my first team',1,3,2,7,6,5,4,8),(3,'my first team',1,3,2,7,6,5,4,8),(4,'second launch',1,2,3,5,6,7,4,8),(5,'my first team',1,2,3,7,6,4,5,8),(6,'second launch',1,2,3,7,6,5,4,8),(7,'second launch',1,2,3,5,6,7,4,8),(8,'my first team',1,3,2,5,7,6,4,8),(9,'fin',1,2,3,7,6,4,5,8),(10,'my first team',1,2,3,7,6,4,5,8);
/*!40000 ALTER TABLE `user_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(15) NOT NULL,
  `user_pass` varchar(15) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','','','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-11 17:38:14
