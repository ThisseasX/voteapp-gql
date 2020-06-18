-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: voteapp2
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Current Database: `voteapp2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `voteapp2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `voteapp2`;

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate` (
  `candidate_id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_name` varchar(50) NOT NULL,
  `candidate_surname` varchar(50) NOT NULL,
  PRIMARY KEY (`candidate_id`),
  UNIQUE KEY `candidate_candidate_id_uindex` (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` VALUES (1,'Kwnstantinos','Dekavallas'),(2,'Donald','Trump'),(3,'Adolf','Hitler'),(4,'Jon','Snow'),(5,'Harry','Potter'),(6,'Bruce','Wayne'),(7,'Rick','Astley'),(8,'Homer','Simpson'),(9,'Luke','Skywalker'),(10,'Optimus','Prime');
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `session_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_key` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `voter_id` int(11) NOT NULL,
  `creation` datetime NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `session_voter_voter_id_fk` (`voter_id`),
  CONSTRAINT `session_voter_voter_id_fk` FOREIGN KEY (`voter_id`) REFERENCES `voter` (`voter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `voter_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vote` int(11) NOT NULL,
  PRIMARY KEY (`candidate_id`,`voter_id`),
  KEY `vote_voter_voter_id_fk` (`voter_id`),
  CONSTRAINT `vote_candidate_candidate_id_fk` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`candidate_id`),
  CONSTRAINT `vote_voter_voter_id_fk` FOREIGN KEY (`voter_id`) REFERENCES `voter` (`voter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (1,1,'2019-02-24 20:29:49',1),(123,1,'2018-02-20 19:44:12',1),(112358,1,'2018-02-21 16:23:45',1),(123456,1,'2018-02-20 19:22:59',1),(4234324,1,'2018-02-20 19:42:54',1),(11371137,1,'2018-02-20 19:23:06',1),(123123123,1,'2018-02-20 19:47:15',1),(999888777,1,'2018-02-20 20:15:48',1),(777,2,'2019-04-01 19:12:39',1),(123123123,2,'2018-02-20 19:47:18',1),(999999999,2,'2018-02-20 17:31:24',1),(777,3,'2019-04-01 19:23:06',1),(112358,3,'2018-02-21 16:23:43',-1),(11371137,3,'2018-02-20 19:23:14',1),(123123123,3,'2018-02-20 19:47:20',-1),(123456,5,'2018-02-20 19:23:55',1),(999888777,6,'2018-02-20 20:16:12',1),(777,7,'2019-04-01 19:36:15',1),(999999999,8,'2018-02-20 17:30:59',1),(123456,9,'2018-02-20 19:23:51',1),(999888777,9,'2018-02-20 20:16:26',1),(112358,10,'2018-02-21 16:23:54',1),(11371137,10,'2018-02-20 19:32:23',1);
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voter`
--

DROP TABLE IF EXISTS `voter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voter` (
  `voter_id` int(11) NOT NULL,
  `voter_password` text NOT NULL,
  `voter_name` varchar(50) NOT NULL,
  `voter_surname` varchar(50) NOT NULL,
  PRIMARY KEY (`voter_id`),
  UNIQUE KEY `voter_voter_id_uindex` (`voter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voter`
--

LOCK TABLES `voter` WRITE;
/*!40000 ALTER TABLE `voter` DISABLE KEYS */;
INSERT INTO `voter` VALUES (1,'Hello','HellO','Hello3'),(123,'\' or \'\'=\'','Ggg','Ggg'),(222,'222','A','A'),(234,'234','A','A'),(333,'444','Aaa','Aaa'),(444,'444','A','A'),(555,'555','Aa','Aa'),(777,'777','Zz','Zz'),(1234,'1234','ASD','ASD'),(4335,'asdf','John','Thiss'),(4336,'asdf','John','Thiss'),(4337,'asdf','John','Thiss'),(4338,'123','John','Thiss'),(4654,'asd','John','Thiss'),(4655,'asd','John','Thiss'),(4666,'asd','John','Thiss'),(32452,'123','AASS','DDdd'),(112358,'112358','Kon','Kas'),(123456,'n.1992','Nikolaos','Gkatziouras'),(4234324,'fr','Fr','Fr'),(11371137,'1137','Giorgos','KaraKavleas'),(14125215,'asdf','Damn','Son'),(123123123,'123','Thiss','Xan'),(141252152,'asdf','Damn','asd'),(999888777,'lagg07','Konstantinos','Laggaris'),(999999999,'123456!a','Spiros','Spiros'),(1412521534,'asdf','Damn','asd');
/*!40000 ALTER TABLE `voter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-19  0:26:26
