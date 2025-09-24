-- MySQL dump 10.19  Distrib 10.3.39-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: middleot-server
-- ------------------------------------------------------
-- Server version	10.3.39-MariaDB-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_ban_history`
--

DROP TABLE IF EXISTS `account_ban_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_ban_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `banned_by` (`banned_by`),
  KEY `account_id_2` (`account_id`),
  KEY `account_id_3` (`account_id`),
  KEY `account_id_4` (`account_id`),
  KEY `account_id_5` (`account_id`),
  KEY `account_id_6` (`account_id`),
  CONSTRAINT `account_ban_history_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_ban_history_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_ban_history_ibfk_4` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_ban_history_ibfk_5` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_ban_history_ibfk_6` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_ban_history_ibfk_7` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_ban_history`
--

LOCK TABLES `account_ban_history` WRITE;
/*!40000 ALTER TABLE `account_ban_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_ban_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_bans`
--

DROP TABLE IF EXISTS `account_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `banned_by` (`banned_by`),
  CONSTRAINT `account_bans_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_bans_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_bans`
--

LOCK TABLES `account_bans` WRITE;
/*!40000 ALTER TABLE `account_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_character_sale`
--

DROP TABLE IF EXISTS `account_character_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_character_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_account` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `price_type` tinyint(4) NOT NULL,
  `price_coins` int(11) DEFAULT NULL,
  `price_gold` int(11) DEFAULT NULL,
  `dta_insert` datetime NOT NULL,
  `dta_valid` datetime NOT NULL,
  `dta_sale` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_player_UNIQUE` (`id_player`),
  KEY `account_character_sale_ibfk_2` (`id_account`),
  CONSTRAINT `account_character_sale_ibfk_1` FOREIGN KEY (`id_player`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_character_sale_ibfk_2` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=563 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_character_sale`
--

LOCK TABLES `account_character_sale` WRITE;
/*!40000 ALTER TABLE `account_character_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_character_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_viplist`
--

DROP TABLE IF EXISTS `account_viplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `notify` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE KEY `account_player_index` (`account_id`,`player_id`),
  KEY `account_id` (`account_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_viplist`
--

LOCK TABLES `account_viplist` WRITE;
/*!40000 ALTER TABLE `account_viplist` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_viplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `secret` char(16) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `premdays` int(11) NOT NULL DEFAULT 0,
  `coins` int(11) NOT NULL DEFAULT 0,
  `lastday` bigint(20) unsigned NOT NULL DEFAULT 0,
  `vipdays` int(11) NOT NULL DEFAULT 0,
  `viplastday` int(11) NOT NULL DEFAULT 0,
  `proxy_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT 0,
  `creation` bigint(20) NOT NULL DEFAULT 0,
  `vote` int(11) NOT NULL DEFAULT 0,
  `key` varchar(64) NOT NULL DEFAULT '',
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT 0,
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(3) NOT NULL DEFAULT '',
  `web_lastlogin` int(11) NOT NULL DEFAULT 0,
  `web_flags` int(11) NOT NULL DEFAULT 0,
  `email_hash` varchar(32) NOT NULL DEFAULT '',
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `page_access` int(11) NOT NULL DEFAULT 0,
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `email_next` int(11) NOT NULL DEFAULT 0,
  `premium_points` int(11) NOT NULL DEFAULT 0,
  `create_date` bigint(20) NOT NULL DEFAULT 0,
  `create_ip` bigint(20) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `flag` varchar(80) NOT NULL DEFAULT '',
  `vip_time` int(11) NOT NULL DEFAULT 0,
  `guild_points` int(11) NOT NULL DEFAULT 0,
  `guild_points_stats` int(11) NOT NULL DEFAULT 0,
  `passed` int(11) NOT NULL DEFAULT 0,
  `block` int(11) NOT NULL DEFAULT 0,
  `refresh` int(11) NOT NULL DEFAULT 0,
  `birth_date` varchar(50) NOT NULL DEFAULT '',
  `gender` varchar(20) NOT NULL DEFAULT '',
  `loyalty_points` bigint(20) NOT NULL DEFAULT 0,
  `authToken` varchar(100) NOT NULL DEFAULT '',
  `player_sell_bank` int(11) DEFAULT 0,
  `secret_status` tinyint(1) NOT NULL DEFAULT 0,
  `tournamentBalance` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `name_3` (`name`),
  UNIQUE KEY `name_4` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8448 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'1','2924ec278f5bbaf9cb9b061f632dc3ab3a84092a',NULL,5,0,0,0,0,0,0,'god@god',0,0,0,'0','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',1594492196,0,0,0,0,0,'','',0,'',0,0,0),(8422,'zllcapiroto','db73770fb465a9f9d06569164e1f8b77a7ac7343','',6,30,4600,1756302249,0,0,0,'joninhac10@gmail.com',1708004327,0,0,'','',0,'','','us',1756262132,3,'',0,0,'',0,0,0,0,0,'',1708263854,0,0,0,0,0,'','',0,'',0,0,0),(8427,'290901','75ca90b17d5db4dfed2bb02b910d85fc3d85e65c',NULL,1,3,0,1756261150,0,0,0,'yurixavieralmeida@gmail.com',1756261150,0,0,'','',0,'','','br',1756262191,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8428,'290902','75ca90b17d5db4dfed2bb02b910d85fc3d85e65c',NULL,1,3,0,1756261744,0,0,0,'yurixavieralmeida01@gmail.com',1756261744,0,0,'','',0,'','','br',1756263314,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8429,'4527057','25131ad57472470d29d7db281a1817dfe83daeb1',NULL,1,3,0,1756262068,0,0,0,'dieguitos4527@gmail.com',1756262068,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8430,'carlosneto','36fad1935563e8ec4801a8850d97357e49abe0c6',NULL,1,3,0,1756262175,0,0,0,'carlos_neto10@icloud.com',1756262175,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8431,'carlosneto1','36fad1935563e8ec4801a8850d97357e49abe0c6',NULL,1,3,0,1756262484,0,0,0,'carlos_neto10@live.com',1756262484,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8432,'malino2233','68e61d23423db21bf2d450af7795a0efb49932de',NULL,1,3,0,1756263165,0,0,0,'malinosantos43@gmail.com',1756263165,0,0,'','',0,'','','',1756263191,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8433,'rYanzZRNfJBC','4388a9d34c73d278d2f9599a7a0e73dc61cd0a17',NULL,1,3,0,1756265492,0,0,0,'deperubomoxi91@gmail.com',1756265492,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8434,'daniele','3405fb603e3e805743e0d6c8a915d81e72347251',NULL,1,3,0,1756266439,0,0,0,'daniele@hotmail.com',1756266439,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8435,'jotaver','c21fdebdd8436540b3021c4c28551fb28d4f3981',NULL,1,3,0,1756267098,0,0,0,'vitor.araujo195@gmail.com',1756267098,0,0,'','',0,'','','',1756302536,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8436,'wvWPQnpMXdQFlS','29d80253675076e9ed35512e79f2f19f2b9c6fb9',NULL,1,3,0,1756267181,0,0,0,'avizuvi145@gmail.com',1756267181,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8437,'wENrzTdNFYqTv','9ad4c8a3f3d263c7f4ecd0eb05653d0f8e50a4d5',NULL,1,3,0,1756280119,0,0,0,'bevicimigib336@gmail.com',1756280119,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8438,'MMLxlojKKqL','0ca799d83bc4ff7887759f37080b8e2d5ee8502d',NULL,1,3,0,1756285943,0,0,0,'tifemec187@gmail.com',1756285943,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8439,'capytan','c025c4cc5d7c90e4588ea4da933c85cb3bd61ee2',NULL,1,3,0,1756295300,0,0,0,'igorvaliati2@gmail.com',1756295300,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8440,'9699','e29ce2b6fae41b77c9200cdc05a69e5c7fafddd3',NULL,1,3,0,1756296418,0,0,0,'Wkaiperr@gmail.com',1756296418,0,0,'','',0,'','','',1756308753,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8441,'10100','6ef9806066e460f8aa0570d1bcc38d0f33dcf155',NULL,1,3,0,1756302672,0,0,0,'jonathanbolado@hotmail.com',1756302672,0,0,'','',0,'','','',1756302704,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8442,'86671030','9882a3e4026a72145875a703ea473600b492d09e',NULL,1,3,0,1756303610,0,0,0,'neymarcarlinho9@gmail.com',1756303610,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8443,'orcmde4414','e049f857bc8a8ffdd87680c0f09cf9efc723f6fa',NULL,1,3,0,1756309007,0,0,0,'ramon._st@hotmail.com',1756309007,0,0,'','',0,'','','',1756309918,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8444,'mmmmde4414','67406402a3affcb7d13d1cd486cf102a89b097a9',NULL,1,3,0,1756309055,0,0,0,'ramontube123@gmail.com',1756309055,0,0,'','',0,'','','',1756309067,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8445,'aaamde4414','e7a8957dbdfde61feda98d011117cacc8508a036',NULL,1,3,0,1756309133,0,0,0,'fagaoujo@gmail.com',1756309133,0,0,'','',0,'','','',1756309203,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8446,'vjMYJnBDaAFZ','fd252e5943752de3e701fe3068138fff4ebcb577',NULL,1,3,0,1756310801,0,0,0,'iyefineqi82@gmail.com',1756310801,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8447,'FOUaSucVANHmBM','670366434396141cee672cf7f407d0e9e6b6288e',NULL,1,3,0,1756312025,0,0,0,'saterthaja1972@yahoo.com',1756312025,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_storage`
--

DROP TABLE IF EXISTS `accounts_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_storage` (
  `account_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) unsigned NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`account_id`,`key`),
  CONSTRAINT `accounts_storage_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_storage`
--

LOCK TABLES `accounts_storage` WRITE;
/*!40000 ALTER TABLE `accounts_storage` DISABLE KEYS */;
INSERT INTO `accounts_storage` VALUES (8422,2,1708004654);
/*!40000 ALTER TABLE `accounts_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_loot_list`
--

DROP TABLE IF EXISTS `auto_loot_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_loot_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `auto_loot_list_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_loot_list`
--

LOCK TABLES `auto_loot_list` WRITE;
/*!40000 ALTER TABLE `auto_loot_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_loot_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blessings_history`
--

DROP TABLE IF EXISTS `blessings_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blessings_history` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `blessing` tinyint(4) NOT NULL,
  `loss` tinyint(1) NOT NULL,
  `timestamp` int(11) NOT NULL,
  KEY `blessings_history_ibfk_1` (`player_id`),
  CONSTRAINT `blessings_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blessings_history`
--

LOCK TABLES `blessings_history` WRITE;
/*!40000 ALTER TABLE `blessings_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `blessings_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boost_creature`
--

DROP TABLE IF EXISTS `boost_creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boost_creature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `exp` int(11) NOT NULL DEFAULT 0,
  `loot` int(11) NOT NULL DEFAULT 0,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=950 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boost_creature`
--

LOCK TABLES `boost_creature` WRITE;
/*!40000 ALTER TABLE `boost_creature` DISABLE KEYS */;
INSERT INTO `boost_creature` VALUES (946,'normal','Bandit',30,20,NULL),(947,'boss','Morgomir',30,15,NULL),(948,'second','Crypt shambler',30,20,NULL),(949,'third','Terminator',30,20,NULL);
/*!40000 ALTER TABLE `boost_creature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_reward_history`
--

DROP TABLE IF EXISTS `daily_reward_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_reward_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `streak` smallint(6) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL,
  `time` bigint(20) NOT NULL,
  `event` varchar(255) DEFAULT NULL,
  `instant` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75041 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_reward_history`
--

LOCK TABLES `daily_reward_history` WRITE;
/*!40000 ALTER TABLE `daily_reward_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_reward_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `free_pass`
--

DROP TABLE IF EXISTS `free_pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `free_pass` (
  `player_id` int(11) NOT NULL,
  KEY `free_pass_ibfk_1` (`player_id`),
  CONSTRAINT `free_pass_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `free_pass`
--

LOCK TABLES `free_pass` WRITE;
/*!40000 ALTER TABLE `free_pass` DISABLE KEYS */;
/*!40000 ALTER TABLE `free_pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh`
--

DROP TABLE IF EXISTS `gh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gh` (
  `id` int(11) NOT NULL,
  `guild` int(11) NOT NULL DEFAULT 0,
  `nomeguild` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0,
  `domination_time` int(10) unsigned NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh`
--

LOCK TABLES `gh` WRITE;
/*!40000 ALTER TABLE `gh` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_storage`
--

DROP TABLE IF EXISTS `global_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL,
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_storage`
--

LOCK TABLES `global_storage` WRITE;
/*!40000 ALTER TABLE `global_storage` DISABLE KEYS */;
INSERT INTO `global_storage` VALUES ('69798','1756312621'),('69799','1716248993');
/*!40000 ALTER TABLE `global_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_actions_h`
--

DROP TABLE IF EXISTS `guild_actions_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_actions_h` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) DEFAULT NULL,
  `player_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `date` bigint(20) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_actions_h`
--

LOCK TABLES `guild_actions_h` WRITE;
/*!40000 ALTER TABLE `guild_actions_h` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_actions_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_invitations`
--

DROP TABLE IF EXISTS `guild_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_invitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_invitations`
--

LOCK TABLES `guild_invitations` WRITE;
/*!40000 ALTER TABLE `guild_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_invites`
--

DROP TABLE IF EXISTS `guild_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `guild_id` int(11) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`guild_id`),
  KEY `guild_id` (`guild_id`),
  CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_invites`
--

LOCK TABLES `guild_invites` WRITE;
/*!40000 ALTER TABLE `guild_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_membership`
--

DROP TABLE IF EXISTS `guild_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`player_id`),
  KEY `guild_id` (`guild_id`),
  KEY `rank_id` (`rank_id`),
  CONSTRAINT `guild_membership_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_membership`
--

LOCK TABLES `guild_membership` WRITE;
/*!40000 ALTER TABLE `guild_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_ranks`
--

DROP TABLE IF EXISTS `guild_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`),
  CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_ranks`
--

LOCK TABLES `guild_ranks` WRITE;
/*!40000 ALTER TABLE `guild_ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_transfer_h`
--

DROP TABLE IF EXISTS `guild_transfer_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_transfer_h` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `from_guild_id` int(11) NOT NULL,
  `to_guild_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_transfer_h`
--

LOCK TABLES `guild_transfer_h` WRITE;
/*!40000 ALTER TABLE `guild_transfer_h` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_transfer_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_wars`
--

DROP TABLE IF EXISTS `guild_wars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild1` int(11) NOT NULL DEFAULT 0,
  `guild2` int(11) NOT NULL DEFAULT 0,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `started` bigint(20) NOT NULL DEFAULT 0,
  `ended` bigint(20) NOT NULL DEFAULT 0,
  `frags_limit` int(11) DEFAULT 20,
  PRIMARY KEY (`id`),
  KEY `guild1` (`guild1`),
  KEY `guild2` (`guild2`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_wars`
--

LOCK TABLES `guild_wars` WRITE;
/*!40000 ALTER TABLE `guild_wars` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_wars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guilds`
--

DROP TABLE IF EXISTS `guilds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` bigint(20) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `residence` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `guild_logo` mediumblob DEFAULT NULL,
  `create_ip` bigint(20) NOT NULL DEFAULT 0,
  `balance` bigint(20) unsigned NOT NULL DEFAULT 0,
  `last_execute_points` bigint(20) NOT NULL DEFAULT 0,
  `logo_name` varchar(255) NOT NULL DEFAULT 'default.gif',
  `level` int(11) DEFAULT 1,
  `points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `ownerid` (`ownerid`),
  CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guilds`
--

LOCK TABLES `guilds` WRITE;
/*!40000 ALTER TABLE `guilds` DISABLE KEYS */;
/*!40000 ALTER TABLE `guilds` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`otadmin`@`localhost`*/ /*!50003 TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
    INSERT INTO guild_ranks (name, level, guild_id) VALUES ('the Leader', 3, NEW.id);
    INSERT INTO guild_ranks (name, level, guild_id) VALUES ('a Vice-Leader', 2, NEW.id);
    INSERT INTO guild_ranks (name, level, guild_id) VALUES ('a Member', 1, NEW.id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `guildwar_kills`
--

DROP TABLE IF EXISTS `guildwar_kills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT 0,
  `targetguild` int(11) NOT NULL DEFAULT 0,
  `warid` int(11) NOT NULL DEFAULT 0,
  `time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `warid` (`warid`)
) ENGINE=InnoDB AUTO_INCREMENT=667 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guildwar_kills`
--

LOCK TABLES `guildwar_kills` WRITE;
/*!40000 ALTER TABLE `guildwar_kills` DISABLE KEYS */;
/*!40000 ALTER TABLE `guildwar_kills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_lists`
--

DROP TABLE IF EXISTS `house_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL,
  KEY `house_id` (`house_id`),
  CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_lists`
--

LOCK TABLES `house_lists` WRITE;
/*!40000 ALTER TABLE `house_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `houses`
--

DROP TABLE IF EXISTS `houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `paid` int(10) unsigned NOT NULL DEFAULT 0,
  `warnings` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `bid` int(11) NOT NULL DEFAULT 0,
  `bid_end` int(11) NOT NULL DEFAULT 0,
  `last_bid` int(11) NOT NULL DEFAULT 0,
  `highest_bidder` int(11) NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL DEFAULT 0,
  `guildid` int(11) DEFAULT NULL,
  `beds` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `town_id` (`town_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2501 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `houses`
--

LOCK TABLES `houses` WRITE;
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
INSERT INTO `houses` VALUES (1,0,0,0,'Baixa 1',3000,1,0,0,0,0,20,NULL,1),(2,0,0,0,'Baixa 2',1200,1,0,0,0,0,12,NULL,1),(3,0,0,0,'Baixa 3',10000,1,0,0,0,0,24,NULL,1),(4,0,0,0,'Baixa 4',7000,1,0,0,0,0,30,NULL,1),(5,0,0,0,'Baixa 5',1700,1,0,0,0,0,25,NULL,1),(6,0,0,0,'Baixa 6',2000,1,0,0,0,0,30,NULL,1),(7,0,0,0,'Baixa 7',1300,1,0,0,0,0,20,NULL,1),(8,0,0,0,'Elite 1',30000,1,0,0,0,0,51,NULL,2),(9,0,0,0,'Elite 2',35000,1,0,0,0,0,74,NULL,3),(10,0,0,0,'Elite 3',20000,1,0,0,0,0,45,NULL,2),(11,0,0,0,'Elite 4',15000,1,0,0,0,0,55,NULL,3),(12,0,0,0,'Elite 5',15000,1,0,0,0,0,64,NULL,2),(13,0,0,0,'Depot 1',22000,1,0,0,0,0,30,NULL,1),(14,0,0,0,'Depot 2',20000,1,0,0,0,0,33,NULL,2),(15,0,0,0,'Depot 3',24000,1,0,0,0,0,25,NULL,1),(16,0,0,0,'Depot 4',25000,1,0,0,0,0,29,NULL,1),(17,0,0,0,'Depot 5',20000,1,0,0,0,0,30,NULL,1),(18,0,0,0,'Oeste 1',1800,1,0,0,0,0,20,NULL,1),(19,0,0,0,'Oeste 2',2000,1,0,0,0,0,24,NULL,1),(20,0,0,0,'Oeste 3',2900,1,0,0,0,0,33,NULL,2),(21,0,0,0,'Baixa 8',8000,1,0,0,0,0,25,NULL,1),(22,0,0,0,'Baixa 9',1500,1,0,0,0,0,21,NULL,1),(23,0,0,0,'Baixa 10',1400,1,0,0,0,0,18,NULL,1),(24,0,0,0,'Baixa 11',900,1,0,0,0,0,12,NULL,1),(25,0,0,0,'Elite 6',15000,1,0,0,0,0,57,NULL,2),(26,0,0,0,'Cima 1',3500,1,0,0,0,0,39,NULL,2),(27,0,0,0,'Leste 1',800,1,0,0,0,0,11,NULL,1),(28,0,0,0,'Leste 2',800,1,0,0,0,0,12,NULL,1),(29,0,0,0,'Leste 3',1100,1,0,0,0,0,15,NULL,1),(30,0,0,0,'Leste 4',1400,1,0,0,0,0,18,NULL,1),(31,0,0,0,'Leste 5',2000,1,0,0,0,0,22,NULL,1),(32,0,0,0,'Leste 6',1200,1,0,0,0,0,16,NULL,1),(33,0,0,0,'Leste 7',1200,1,0,0,0,0,15,NULL,1),(34,0,0,0,'Leste 8',800,1,0,0,0,0,9,NULL,1),(35,0,0,0,'Leste 9',1600,1,0,0,0,0,20,NULL,1),(36,0,0,0,'Leste 10',2000,1,0,0,0,0,22,NULL,1),(37,0,0,0,'Leste 11',2000,1,0,0,0,0,22,NULL,1),(38,0,0,0,'Leste 12',2500,1,0,0,0,0,29,NULL,1),(39,0,0,0,'Leste 13',1600,1,0,0,0,0,20,NULL,1),(40,0,0,0,'Leste 14',1200,1,0,0,0,0,15,NULL,1),(41,0,0,0,'Leste 15',1400,1,0,0,0,0,18,NULL,1),(42,0,0,0,'Leste 18',500,1,0,0,0,0,9,NULL,1),(43,0,0,0,'Leste 16',900,1,0,0,0,0,12,NULL,1),(44,0,0,0,'Leste 17',1500,1,0,0,0,0,20,NULL,1),(45,0,0,0,'Sul 1',1100,1,0,0,0,0,15,NULL,1),(46,0,0,0,'Sul 2',1100,1,0,0,0,0,15,NULL,1),(47,0,0,0,'Sul 3',800,1,0,0,0,0,12,NULL,1),(48,0,0,0,'Sul 4',1600,1,0,0,0,0,20,NULL,1),(49,0,0,0,'Sul 5',1100,1,0,0,0,0,16,NULL,1),(50,0,0,0,'Sul 6',1200,1,0,0,0,0,16,NULL,1),(51,0,0,0,'Sul 7',1500,1,0,0,0,0,20,NULL,1),(52,0,0,0,'Sul 8',1100,1,0,0,0,0,15,NULL,1),(53,0,0,0,'Rohirrims 1',3200,1,0,0,0,0,36,NULL,2),(54,0,0,0,'Sul 10',1200,1,0,0,0,0,15,NULL,1),(55,0,0,0,'Sul 11',900,1,0,0,0,0,12,NULL,1),(56,0,0,0,'Sul 12',800,1,0,0,0,0,12,NULL,1),(57,0,0,0,'Sul 13',1500,1,0,0,0,0,20,NULL,1),(58,0,0,0,'Sul 14',2200,1,0,0,0,0,29,NULL,1),(59,0,0,0,'Sul 15',1800,1,0,0,0,0,24,NULL,1),(60,0,0,0,'Sul 16',1500,1,0,0,0,0,20,NULL,1),(61,0,0,0,'Sul 17',1200,1,0,0,0,0,16,NULL,1),(62,0,0,0,'Sul 18',1500,1,0,0,0,0,19,NULL,1),(63,0,0,0,'Sul 19',1200,1,0,0,0,0,15,NULL,1),(64,0,0,0,'Sul 20',1500,1,0,0,0,0,20,NULL,1),(65,0,0,0,'Sul 21',1900,1,0,0,0,0,24,NULL,1),(66,0,0,0,'Sul 22',1700,1,0,0,0,0,24,NULL,1),(67,0,0,0,'Sul 23',1000,1,0,0,0,0,15,NULL,1),(68,0,0,0,'Sul 24',1200,1,0,0,0,0,15,NULL,1),(69,0,0,0,'Sul 25',1200,1,0,0,0,0,15,NULL,1),(70,0,0,0,'Sul 26',1200,1,0,0,0,0,15,NULL,1),(71,0,0,0,'Sul 27',1100,1,0,0,0,0,15,NULL,1),(72,0,0,0,'Sul 28',700,1,0,0,0,0,10,NULL,1),(73,0,0,0,'Sul 29',1200,1,0,0,0,0,14,NULL,1),(74,0,0,0,'Sul 30',1200,1,0,0,0,0,16,NULL,1),(75,0,0,0,'Oeste 4',1200,1,0,0,0,0,14,NULL,1),(76,0,0,0,'Oeste 5',1100,1,0,0,0,0,15,NULL,1),(77,0,0,0,'Oeste 6',800,1,0,0,0,0,12,NULL,1),(78,0,0,0,'Oeste 7',1600,1,0,0,0,0,18,NULL,1),(79,0,0,0,'Oeste 8',800,1,0,0,0,0,12,NULL,1),(80,0,0,0,'Oeste 9',2400,1,0,0,0,0,26,NULL,2),(81,0,0,0,'Oeste 10',800,1,0,0,0,0,12,NULL,1),(82,0,0,0,'Oeste 11',500,1,0,0,0,0,9,NULL,1),(83,0,0,0,'Fazenda 9',1600,1,0,0,0,0,17,NULL,0),(84,0,0,0,'Sul 31',1400,1,0,0,0,0,16,NULL,1),(85,0,0,0,'Fazenda 1',1400,1,0,0,0,0,18,NULL,1),(86,0,0,0,'Fazenda 2',1400,1,0,0,0,0,17,NULL,1),(87,0,0,0,'Fazenda 3',1400,1,0,0,0,0,17,NULL,1),(88,0,0,0,'Fazenda 4',2700,1,0,0,0,0,30,NULL,1),(89,0,0,0,'Fazenda 5',1100,1,0,0,0,0,14,NULL,1),(90,0,0,0,'Fazenda 6',1900,1,0,0,0,0,22,NULL,1),(91,0,0,0,'Fazenda 7',1100,1,0,0,0,0,14,NULL,1),(92,0,0,0,'Fazenda 8',1100,1,0,0,0,0,14,NULL,1),(93,0,0,0,'Corredor 1',3000,2,0,0,0,0,15,NULL,1),(94,0,0,0,'Corredor 2',3000,2,0,0,0,0,13,NULL,1),(95,0,0,0,'Corredor 3',3000,2,0,0,0,0,13,NULL,1),(96,0,0,0,'Corredor 4',3000,2,0,0,0,0,13,NULL,1),(97,0,0,0,'Corredor 5',3000,2,0,0,0,0,13,NULL,1),(98,0,0,0,'Corredor 6',2000,2,0,0,0,0,15,NULL,1),(99,0,0,0,'Corredor 7',2000,2,0,0,0,0,10,NULL,1),(100,0,0,0,'Corredor 8',2000,2,0,0,0,0,10,NULL,1),(101,0,0,0,'Corredor 9',2000,2,0,0,0,0,10,NULL,1),(102,0,0,0,'Corredor 10',3000,2,0,0,0,0,10,NULL,1),(103,0,0,0,'Stronghold 1',3000,2,0,0,0,0,19,NULL,1),(104,0,0,0,'Stronghold 2',1400,2,0,0,0,0,19,NULL,1),(105,0,0,0,'Stronghold 3',2700,2,0,0,0,0,29,NULL,1),(106,0,0,0,'Rohirrims 2',3200,1,0,0,0,0,36,NULL,2),(107,0,0,0,'Stronghold 5',900,2,0,0,0,0,13,NULL,1),(108,0,0,0,'Stronghold 6',1000,2,0,0,0,0,17,NULL,2),(109,0,0,0,'Stronghold 7',1200,2,0,0,0,0,17,NULL,1),(110,0,0,0,'Stronghold 8',2000,2,0,0,0,0,29,NULL,2),(111,0,0,0,'Rohirrims 3',2900,1,0,0,0,0,31,NULL,1),(112,0,0,0,'Stronghold 10',1100,2,0,0,0,0,13,NULL,1),(113,0,0,0,'Stronghold 11',1100,2,0,0,0,0,13,NULL,1),(114,0,0,0,'Stronghold 12',1100,2,0,0,0,0,13,NULL,1),(115,0,0,0,'Cima 2',1500,1,0,0,0,0,17,NULL,1),(116,0,0,0,'Cima 3',2300,1,0,0,0,0,27,NULL,1),(117,0,0,0,'Cima 4',1700,1,0,0,0,0,19,NULL,1),(118,0,0,0,'Elvenpath 1',3500,3,0,0,0,0,10,NULL,1),(119,0,0,0,'Elvenpath 2',3000,3,0,0,0,0,13,NULL,1),(120,0,0,0,'Elvenpath 3',1400,3,0,0,0,0,16,NULL,1),(121,0,0,0,'Elvenpath 4',1100,3,0,0,0,0,13,NULL,1),(122,0,0,0,'Elvenpath 5',1100,3,0,0,0,0,13,NULL,1),(123,0,0,0,'Elvenpath 6',800,3,0,0,0,0,10,NULL,1),(124,0,0,0,'Elvenpath 7',800,3,0,0,0,0,10,NULL,1),(125,0,0,0,'Elvenpath 8',800,3,0,0,0,0,10,NULL,1),(126,0,0,0,'Elvenpath 9',800,3,0,0,0,0,10,NULL,1),(127,0,0,0,'Elvenpath 10',1400,3,0,0,0,0,16,NULL,1),(128,0,0,0,'Elvenpath 11',1400,3,0,0,0,0,16,NULL,1),(129,0,0,0,'Elvenpath 12',1400,3,0,0,0,0,16,NULL,1),(130,0,0,0,'Elvenpath 13',1400,3,0,0,0,0,16,NULL,1),(131,0,0,0,'Elvenpath 14',1100,3,0,0,0,0,13,NULL,1),(132,0,0,0,'Elvenpath 15',2500,3,0,0,0,0,29,NULL,2),(133,0,0,0,'Elvenpath 16',1500,3,0,0,0,0,17,NULL,1),(134,0,0,0,'Elvenpath 17',1700,3,0,0,0,0,19,NULL,1),(135,0,0,0,'Elvenpath 18',4000,3,0,0,0,0,42,NULL,1),(136,0,0,0,'Elvenpath 19',3500,3,0,0,0,0,37,NULL,1),(137,0,0,0,'Elvenpath 20',3500,3,0,0,0,0,26,NULL,1),(138,0,0,0,'Elvenpath 21',1900,3,0,0,0,0,21,NULL,1),(139,0,0,0,'Elvenpath 22',2900,3,0,0,0,0,31,NULL,1),(140,0,0,0,'Elvenpath 23',1500,3,0,0,0,0,17,NULL,1),(141,0,0,0,'Elvenpath 24',1700,3,0,0,0,0,19,NULL,1),(142,0,0,0,'Elvenpath 25',1500,3,0,0,0,0,17,NULL,1),(143,0,0,0,'Elvenpath 26',1900,3,0,0,0,0,21,NULL,1),(144,0,0,0,'Elvenpath 27',3600,3,0,0,0,0,21,NULL,1),(145,0,0,0,'Elvenpath 28',3500,3,0,0,0,0,13,NULL,1),(146,0,0,0,'Elvenpath 29',1900,3,0,0,0,0,21,NULL,1),(147,0,0,0,'Elvenpath 30',2300,3,0,0,0,0,25,NULL,1),(148,0,0,0,'Elvenpath 31',1900,3,0,0,0,0,21,NULL,1),(149,0,0,0,'Elvenpath 32',1400,3,0,0,0,0,16,NULL,1),(150,0,0,0,'Elvenpath 33',1900,3,0,0,0,0,21,NULL,1),(151,0,0,0,'Elvenpath 34',2900,3,0,0,0,0,31,NULL,1),(152,0,0,0,'Elvenpath 35',1700,3,0,0,0,0,19,NULL,1),(153,0,0,0,'Elvenpath 36',1100,3,0,0,0,0,13,NULL,1),(154,0,0,0,'Elvenpath 37',2300,3,0,0,0,0,25,NULL,1),(155,0,0,0,'Elvenpath 38',1100,3,0,0,0,0,13,NULL,1),(156,0,0,0,'Elvenpath 39',6000,3,0,0,0,0,29,NULL,1),(157,0,0,0,'Elvenpath 40',1900,3,0,0,0,0,21,NULL,1),(158,0,0,0,'Elvenpath 41',2400,3,0,0,0,0,26,NULL,1),(159,0,0,0,'Elvenpath 42',2700,3,0,0,0,0,29,NULL,1),(160,0,0,0,'Elvenpath 43',2000,3,0,0,0,0,22,NULL,1),(161,0,0,0,'Elvenpath 44',3200,3,0,0,0,0,36,NULL,2),(162,0,0,0,'Elvenpath 45',2400,3,0,0,0,0,26,NULL,1),(163,0,0,0,'Elvenpath 46',1100,3,0,0,0,0,13,NULL,1),(164,0,0,0,'Elvenpath 47',1100,3,0,0,0,0,13,NULL,1),(165,0,0,0,'Elvenpath 48',4500,3,0,0,0,0,25,NULL,1),(166,0,0,0,'Elvenpath 49',1500,3,0,0,0,0,17,NULL,1),(167,0,0,0,'Elvenpath 50',1400,3,0,0,0,0,16,NULL,1),(168,0,0,0,'Depot Square 1',18000,4,0,0,0,0,29,NULL,2),(169,0,0,0,'Depot Square 2',12000,4,0,0,0,0,22,NULL,2),(170,0,0,0,'Depot Square 3',10000,4,0,0,0,0,31,NULL,2),(171,0,0,0,'Depot Square 4',3000,4,0,0,0,0,25,NULL,2),(172,0,0,0,'Depot Square 5',13000,4,0,0,0,0,21,NULL,2),(173,0,0,0,'Depot Square 6',13000,4,0,0,0,0,26,NULL,2),(174,0,0,0,'Depot Square 7',12000,4,0,0,0,0,19,NULL,1),(175,0,0,0,'Depot Square 8',12000,4,0,0,0,0,22,NULL,1),(176,0,0,0,'Depot Square 9',14000,4,0,0,0,0,29,NULL,1),(177,0,0,0,'Depot Square 10',30000,4,0,0,0,0,51,NULL,4),(178,0,0,0,'Depot Square 11',12000,4,0,0,0,0,26,NULL,2),(179,0,0,0,'Av Elendil 1',1050,4,0,0,0,0,25,NULL,2),(180,0,0,0,'Av Elendil 2',700,4,0,0,0,0,16,NULL,1),(181,0,0,0,'Av Elendil 3',700,4,0,0,0,0,16,NULL,1),(182,0,0,0,'Av Elendil 4',450,4,0,0,0,0,11,NULL,1),(183,0,0,0,'Av Elendil 5',450,4,0,0,0,0,11,NULL,1),(184,0,0,0,'Av Elendil 6',550,4,0,0,0,0,13,NULL,1),(185,0,0,0,'Fazenda 10',1000,1,0,0,0,0,20,NULL,1),(186,0,0,0,'Av Elendil 8',1150,4,0,0,0,0,25,NULL,1),(187,0,0,0,'Av Elendil 9',850,4,0,0,0,0,19,NULL,1),(188,0,0,0,'Av Elendil 10',1750,4,0,0,0,0,43,NULL,4),(189,0,0,0,'Av Elendil 11',1050,4,0,0,0,0,25,NULL,2),(190,0,0,0,'Av Elendil 12',1050,4,0,0,0,0,25,NULL,2),(191,0,0,0,'Av Elendil 13',1550,4,0,0,0,0,37,NULL,3),(192,0,0,0,'Av Elendil 14',1500,4,0,0,0,0,36,NULL,3),(193,0,0,0,'Eriador 1',1100,4,0,0,0,0,26,NULL,2),(194,0,0,0,'Eriador 2',1350,4,0,0,0,0,31,NULL,2),(195,0,0,0,'Dark Woods 1',1000,2,0,0,0,0,29,NULL,2),(196,0,0,0,'Eriador 4',550,4,0,0,0,0,13,NULL,1),(197,0,0,0,'Eriador 5',550,4,0,0,0,0,13,NULL,1),(198,0,0,0,'Eriador 6',1100,4,0,0,0,0,26,NULL,2),(199,0,0,0,'Eriador 7',1250,4,0,0,0,0,31,NULL,3),(200,0,0,0,'Eriador 8',1150,4,0,0,0,0,25,NULL,1),(201,0,0,0,'Everdim 1',1500,4,0,0,0,0,36,NULL,3),(202,0,0,0,'Everdim 2',650,4,0,0,0,0,17,NULL,2),(203,0,0,0,'Everdim 3',1050,4,0,0,0,0,25,NULL,2),(204,0,0,0,'Everdim 4',1050,4,0,0,0,0,25,NULL,2),(205,0,0,0,'Everdim 5',1050,4,0,0,0,0,25,NULL,2),(206,0,0,0,'Everdim 6',750,4,0,0,0,0,19,NULL,2),(207,0,0,0,'Everdim 7',1100,4,0,0,0,0,26,NULL,2),(208,0,0,0,'Everdim 8',2200,4,0,0,0,0,50,NULL,3),(209,0,0,0,'Everdim 9',1150,4,0,0,0,0,25,NULL,1),(210,0,0,0,'Everdim 10',1550,4,0,0,0,0,33,NULL,1),(211,0,0,0,'Everdim 11',1600,4,0,0,0,0,36,NULL,2),(212,0,0,0,'Everdim 12',950,4,0,0,0,0,21,NULL,1),(213,0,0,0,'Everdim 13',950,4,0,0,0,0,21,NULL,1),(214,0,0,0,'Everdim 14',1850,4,0,0,0,0,43,NULL,3),(215,0,0,0,'Everdim 15',1100,4,0,0,0,0,26,NULL,2),(216,0,0,0,'Dark Woods 2',1250,2,0,0,0,0,29,NULL,2),(217,0,0,0,'Dark Woods 3',850,2,0,0,0,0,21,NULL,2),(218,0,0,0,'Dark Woods 4',1250,2,0,0,0,0,17,NULL,1),(219,0,0,0,'Dark Woods ',1250,2,0,0,0,0,17,NULL,1),(220,0,0,0,'Lake Town 1',140,5,0,0,0,0,7,NULL,1),(221,0,0,0,'Lake Town 2',180,5,0,0,0,0,9,NULL,1),(222,0,0,0,'Lake Town 3',140,5,0,0,0,0,7,NULL,1),(223,0,0,0,'Lake Town 4',260,5,0,0,0,0,13,NULL,1),(224,0,0,0,'Lake Town 5',200,5,0,0,0,0,10,NULL,1),(225,0,0,0,'Lake Town 6',260,5,0,0,0,0,13,NULL,1),(226,0,0,0,'Lake Town 7',260,5,0,0,0,0,13,NULL,1),(227,0,0,0,'Lake Town 8',140,5,0,0,0,0,7,NULL,1),(228,0,0,0,'Lake Town 9',200,5,0,0,0,0,10,NULL,1),(229,0,0,0,'Lake Town 10',200,5,0,0,0,0,10,NULL,1),(230,0,0,0,'Lake Town 11',180,5,0,0,0,0,9,NULL,1),(231,0,0,0,'Lake Town 12',260,5,0,0,0,0,13,NULL,1),(232,0,0,0,'Lake Town 13',180,5,0,0,0,0,9,NULL,1),(233,0,0,0,'Lake Town 14',140,5,0,0,0,0,7,NULL,1),(234,0,0,0,'Lake Town 15',320,5,0,0,0,0,16,NULL,1),(235,0,0,0,'Lake Town 16',220,5,0,0,0,0,11,NULL,1),(236,0,0,0,'Lake Town 17',260,5,0,0,0,0,13,NULL,1),(237,0,0,0,'Lake Town 18',260,5,0,0,0,0,13,NULL,1),(238,0,0,0,'Lake Town 19',320,5,0,0,0,0,16,NULL,1),(239,0,0,0,'Lake Town 20',320,5,0,0,0,0,16,NULL,1),(240,0,0,0,'Lake Town 21',260,5,0,0,0,0,13,NULL,1),(241,0,0,0,'Lake Town 22',180,5,0,0,0,0,9,NULL,1),(242,0,0,0,'Lake Town 23',180,5,0,0,0,0,9,NULL,1),(243,0,0,0,'Lake Town 24',260,5,0,0,0,0,13,NULL,1),(244,0,0,0,'Rohirrims 4',2500,1,0,0,0,0,29,NULL,2),(245,0,0,0,'Mordor 1',220,12,0,0,0,0,26,NULL,2),(246,0,0,0,'Ship 1',700,6,0,0,0,0,37,NULL,1),(247,0,0,0,'Ship 2',780,6,0,0,0,0,43,NULL,2),(248,0,0,0,'Ship 3',660,6,0,0,0,0,37,NULL,2),(249,0,0,0,'Ship 4',780,6,0,0,0,0,43,NULL,2),(250,0,0,0,'Ship 5',780,6,0,0,0,0,43,NULL,2),(251,0,0,0,'Ship 6',540,6,0,0,0,0,31,NULL,2),(252,0,0,0,'Ship 7',540,6,0,0,0,0,31,NULL,2),(253,0,0,0,'Ship 8',820,6,0,0,0,0,43,NULL,1),(254,0,0,0,'Ship 9',780,6,0,0,0,0,43,NULL,2),(255,0,0,0,'Ship 10',660,6,0,0,0,0,37,NULL,2),(256,0,0,0,'Ship 11',780,6,0,0,0,0,43,NULL,2),(257,0,0,0,'Ship 12',700,6,0,0,0,0,37,NULL,1),(258,0,0,0,'Argond 1',2400,7,0,0,0,0,43,NULL,1),(259,0,0,0,'Argond 2',1500,7,0,0,0,0,17,NULL,1),(260,0,0,0,'Argond 3',1600,7,0,0,0,0,72,NULL,1),(261,0,0,0,'Argond 4',4000,7,0,0,0,0,80,NULL,1),(262,0,0,0,'Argond 5',2500,7,0,0,0,0,37,NULL,1),(263,0,0,0,'Argond 6',2500,7,0,0,0,0,77,NULL,1),(264,0,0,0,'Argond 7',2000,7,0,0,0,0,80,NULL,1),(265,0,0,0,'Argond 8',2400,7,0,0,0,0,81,NULL,1),(266,0,0,0,'Argond 9',2400,7,0,0,0,0,56,NULL,1),(267,0,0,0,'Argond 10',2400,7,0,0,0,0,55,NULL,1),(268,0,0,0,'Argond 11',4200,7,0,0,0,0,71,NULL,1),(269,0,0,0,'Argond 12',5000,7,0,0,0,0,118,NULL,1),(270,0,0,0,'Minas 1',15000,13,0,0,0,0,81,NULL,2),(271,0,0,0,'Minas 2',12000,13,0,0,0,0,38,NULL,1),(272,0,0,0,'Minas 3',16000,13,0,0,0,0,85,NULL,2),(273,0,0,0,'Minas 4',14000,13,0,0,0,0,54,NULL,2),(274,0,0,0,'Treetop 8',800,5,0,0,0,0,23,NULL,1),(275,0,0,0,'Minas 5',13000,13,0,0,0,0,34,NULL,1),(276,0,0,0,'Minas 6',15000,13,0,0,0,0,64,NULL,3),(277,0,0,0,'Minas 7',25000,13,0,0,0,0,134,NULL,2),(278,0,0,0,'Minas Depot 1',1500,13,0,0,0,0,22,NULL,2),(279,0,0,0,'Minas Depot 2',1500,13,0,0,0,0,16,NULL,2),(280,0,0,0,'Minas Depot 3',1500,13,0,0,0,0,21,NULL,2),(281,0,0,0,'Minas Depot 4',1500,13,0,0,0,0,16,NULL,2),(282,0,0,0,'Minas Depot 5',1500,13,0,0,0,0,25,NULL,2),(283,0,0,0,'Minas Depot 6',1500,13,0,0,0,0,19,NULL,2),(284,0,0,0,'Minas Depot 7',1500,13,0,0,0,0,26,NULL,2),(285,0,0,0,'Minas Depot 8',1500,13,0,0,0,0,19,NULL,2),(286,0,0,0,'Minas Depot 9',1500,13,0,0,0,0,56,NULL,2),(287,0,0,0,'Minas Depot 10',1500,13,0,0,0,0,29,NULL,2),(288,0,0,0,'Minas Depot 11',1500,13,0,0,0,0,32,NULL,1),(289,0,0,0,'Shire 1',1600,4,0,0,0,0,175,NULL,1),(290,0,0,0,'Shire 2',1600,4,0,0,0,0,158,NULL,1),(291,0,0,0,'Shire 3',1600,4,0,0,0,0,147,NULL,1),(292,0,0,0,'Shire 4',1600,4,0,0,0,0,198,NULL,1),(294,0,0,0,'Mines 1',300,10,0,0,0,0,17,NULL,1),(295,0,0,0,'Mines 2',300,10,0,0,0,0,17,NULL,1),(296,0,0,0,'Mines 3',300,10,0,0,0,0,17,NULL,1),(297,0,0,0,'Mines 4',300,10,0,0,0,0,17,NULL,1),(298,0,0,0,'Mines 5',300,10,0,0,0,0,17,NULL,1),(299,0,0,0,'Mines 6',260,10,0,0,0,0,17,NULL,2),(300,0,0,0,'Mines 7',300,10,0,0,0,0,17,NULL,1),(301,0,0,0,'Mines 8',300,10,0,0,0,0,17,NULL,1),(302,0,0,0,'Mines 9',300,10,0,0,0,0,17,NULL,1),(303,0,0,0,'Mines 10',300,10,0,0,0,0,17,NULL,1),(304,0,0,0,'Mines 11',300,10,0,0,0,0,17,NULL,1),(305,0,0,0,'Mines 12',300,10,0,0,0,0,17,NULL,1),(306,0,0,0,'Mines 13',300,10,0,0,0,0,17,NULL,1),(307,0,0,0,'Mines 14',300,10,0,0,0,0,17,NULL,1),(308,0,0,0,'Mines 15',300,10,0,0,0,0,17,NULL,1),(309,0,0,0,'Mines 16',300,10,0,0,0,0,17,NULL,1),(310,0,0,0,'Mines 18',300,10,0,0,0,0,17,NULL,1),(311,0,0,0,'Mines 19',300,10,0,0,0,0,17,NULL,1),(312,0,0,0,'Mines 20',300,10,0,0,0,0,17,NULL,1),(313,0,0,0,'Mines 21',260,10,0,0,0,0,17,NULL,2),(314,0,0,0,'Mines 22',300,10,0,0,0,0,17,NULL,1),(315,0,0,0,'Mines 23',300,10,0,0,0,0,17,NULL,1),(316,0,0,0,'Mines 24',300,10,0,0,0,0,17,NULL,1),(317,0,0,0,'Mines 25',300,10,0,0,0,0,17,NULL,1),(318,0,0,0,'Mines 26',300,10,0,0,0,0,17,NULL,1),(319,0,0,0,'Mines 27',300,10,0,0,0,0,17,NULL,1),(320,0,0,0,'Mines 28',300,10,0,0,0,0,17,NULL,1),(321,0,0,0,'Mines 29',300,10,0,0,0,0,17,NULL,1),(322,0,0,0,'Mines 30',300,10,0,0,0,0,17,NULL,1),(323,0,0,0,'Mines 31',300,10,0,0,0,0,17,NULL,1),(324,0,0,0,'Mines 32',300,10,0,0,0,0,17,NULL,1),(325,0,0,0,'Mines 33',300,10,0,0,0,0,17,NULL,1),(326,0,0,0,'Mines 34',300,10,0,0,0,0,17,NULL,1),(327,0,0,0,'Mines 35',300,10,0,0,0,0,17,NULL,1),(328,0,0,0,'Mines 36',260,10,0,0,0,0,17,NULL,2),(329,0,0,0,'Mines 37',260,10,0,0,0,0,17,NULL,2),(330,0,0,0,'Mines 38',260,10,0,0,0,0,17,NULL,2),(331,0,0,0,'Mines 39',300,10,0,0,0,0,17,NULL,1),(332,0,0,0,'Mines 40',300,10,0,0,0,0,17,NULL,1),(333,0,0,0,'Mines 41',300,10,0,0,0,0,17,NULL,1),(334,0,0,0,'Mines 42',300,10,0,0,0,0,17,NULL,1),(335,0,0,0,'Mines 43',300,10,0,0,0,0,17,NULL,1),(336,0,0,0,'Mines 44',300,10,0,0,0,0,17,NULL,1),(337,0,0,0,'Mines 45',300,10,0,0,0,0,17,NULL,1),(338,0,0,0,'Dwarf Square',17000,10,0,0,0,0,35,NULL,2),(339,0,0,0,'Fazenda Dwarf 1',550,10,0,0,0,0,11,NULL,0),(340,0,0,0,'Fazenda Dwarf 2',700,10,0,0,0,0,14,NULL,0),(341,0,0,0,'Fazenda Dwarf 3',350,10,0,0,0,0,8,NULL,0),(342,0,0,0,'Fazenda Dwarf 4',500,10,0,0,0,0,11,NULL,0),(343,0,0,0,'Fazenda Dwarf 5',450,10,0,0,0,0,10,NULL,0),(344,0,0,0,'Lower Village 1',480,10,0,0,0,0,26,NULL,1),(345,0,0,0,'Lower Village 2',480,10,0,0,0,0,26,NULL,1),(346,0,0,0,'Lower Village 3',480,10,0,0,0,0,26,NULL,1),(347,0,0,0,'Lower Village 4',480,10,0,0,0,0,26,NULL,1),(348,0,0,0,'Lower Village 5',480,10,0,0,0,0,26,NULL,1),(349,0,0,0,'Lower Village 6',480,10,0,0,0,0,26,NULL,1),(350,0,0,0,'Lower Village 7',480,10,0,0,0,0,26,NULL,1),(351,0,0,0,'Lower Village 8',480,10,0,0,0,0,26,NULL,1),(352,0,0,0,'Lower Village 9',480,10,0,0,0,0,26,NULL,1),(353,0,0,0,'Lower Village 10',480,10,0,0,0,0,26,NULL,1),(354,0,0,0,'Lower Village 11',220,10,0,0,0,0,13,NULL,1),(355,0,0,0,'Lower Village 12',220,10,0,0,0,0,13,NULL,1),(356,0,0,0,'Lower Village 13',220,10,0,0,0,0,13,NULL,1),(357,0,0,0,'Lower Village 14',220,10,0,0,0,0,13,NULL,1),(358,0,0,0,'Lower Village 15',220,10,0,0,0,0,13,NULL,1),(359,0,0,0,'Lower Village 16',420,10,0,0,0,0,25,NULL,2),(360,0,0,0,'Lower Village 17',420,10,0,0,0,0,25,NULL,2),(361,0,0,0,'Lower Village 18',220,10,0,0,0,0,13,NULL,1),(362,0,0,0,'Lower Village 19',220,10,0,0,0,0,13,NULL,1),(363,0,0,0,'Lower Village 20',220,10,0,0,0,0,13,NULL,1),(364,0,0,0,'Lower Village 21',220,10,0,0,0,0,13,NULL,1),(365,0,0,0,'Lower Village 22',220,10,0,0,0,0,12,NULL,1),(366,0,0,0,'Lower Village 23',220,10,0,0,0,0,13,NULL,1),(367,0,0,0,'Lower Village 24',140,10,0,0,0,0,9,NULL,1),(368,0,0,0,'Lower Village 25',140,10,0,0,0,0,9,NULL,1),(369,0,0,0,'Lower Village 26',140,10,0,0,0,0,9,NULL,1),(370,0,0,0,'Lower Village 27',140,10,0,0,0,0,9,NULL,1),(371,0,0,0,'Lower Village 28',220,10,0,0,0,0,13,NULL,1),(372,0,0,0,'Dwarven Elite 1',4500,10,0,0,0,0,71,NULL,1),(373,0,0,0,'Dwarven Elite 2',4500,10,0,0,0,0,71,NULL,1),(374,0,0,0,'Dwarven Elite 3',4500,10,0,0,0,0,71,NULL,1),(375,0,0,0,'Dwarven Elite 4',4500,10,0,0,0,0,71,NULL,1),(376,0,0,0,'Capial 1',400,4,0,0,0,0,8,NULL,0),(377,0,0,0,'Capial 2',400,4,0,0,0,0,9,NULL,0),(378,0,0,0,'Mordor 2',150,12,0,0,0,0,17,NULL,1),(379,0,0,0,'Forod 1',280,11,0,0,0,0,16,NULL,1),(380,0,0,0,'Forod 2',280,11,0,0,0,0,16,NULL,1),(381,0,0,0,'Forod 3',220,11,0,0,0,0,13,NULL,1),(382,0,0,0,'Forod 4',160,11,0,0,0,0,10,NULL,1),(383,0,0,0,'Forod 5',220,11,0,0,0,0,13,NULL,1),(384,0,0,0,'Forod 6',300,11,0,0,0,0,19,NULL,2),(385,0,0,0,'Forod 7',220,11,0,0,0,0,13,NULL,1),(386,0,0,0,'Forod 8',280,11,0,0,0,0,16,NULL,1),(387,0,0,0,'Forod 10',300,11,0,0,0,0,17,NULL,1),(388,0,0,0,'Forod 11',180,11,0,0,0,0,11,NULL,1),(389,0,0,0,'Forod 12',220,11,0,0,0,0,15,NULL,2),(390,0,0,0,'Ice 1',280,11,0,0,0,0,16,NULL,1),(391,0,0,0,'Ice 2',220,11,0,0,0,0,13,NULL,1),(392,0,0,0,'Ice 3',340,11,0,0,0,0,19,NULL,1),(393,0,0,0,'Forod 13',200,11,0,0,0,0,13,NULL,1),(394,0,0,0,'Forod 14',280,11,0,0,0,0,16,NULL,1),(395,0,0,0,'Forod 15',180,11,0,0,0,0,11,NULL,1),(396,0,0,0,'Forod 16',320,11,0,0,0,0,18,NULL,1),(397,0,0,0,'Forod 17',320,11,0,0,0,0,18,NULL,1),(398,0,0,0,'Forod 18',240,11,0,0,0,0,16,NULL,2),(399,0,0,0,'Forod 19',220,11,0,0,0,0,13,NULL,1),(400,0,0,0,'Forod 20',740,11,0,0,0,0,54,NULL,3),(401,0,0,0,'Forod 21',280,11,0,0,0,0,16,NULL,1),(402,0,0,0,'Forod 22',220,11,0,0,0,0,13,NULL,1),(403,0,0,0,'Forod 23',160,11,0,0,0,0,10,NULL,1),(404,0,0,0,'Forod 24',220,11,0,0,0,0,13,NULL,1),(405,0,0,0,'Forod 25',300,11,0,0,0,0,19,NULL,2),(406,0,0,0,'Forod 26',240,11,0,0,0,0,14,NULL,1),(407,0,0,0,'Forod 27',320,11,0,0,0,0,18,NULL,1),(408,0,0,0,'Forod 28',320,11,0,0,0,0,18,NULL,1),(409,0,0,0,'Forod 29',300,11,0,0,0,0,17,NULL,1),(410,0,0,0,'Forod 30',300,11,0,0,0,0,17,NULL,1),(411,0,0,0,'Ice 4',220,11,0,0,0,0,13,NULL,1),(412,0,0,0,'Ice 5',280,11,0,0,0,0,17,NULL,1),(413,0,0,0,'Ice 6',220,11,0,0,0,0,13,NULL,1),(414,0,0,0,'Top',220,11,0,0,0,0,13,NULL,1),(415,0,0,0,'Mordor 3',150,12,0,0,0,0,17,NULL,1),(416,0,0,0,'Mordor 4',330,12,0,0,0,0,37,NULL,2),(417,0,0,0,'Mordor 5',220,12,0,0,0,0,26,NULL,2),(418,0,0,0,'Mordor 6',330,12,0,0,0,0,37,NULL,2),(419,0,0,0,'Mordor 7',150,12,0,0,0,0,17,NULL,1),(420,0,0,0,'Mordor 8',150,12,0,0,0,0,17,NULL,1),(421,0,0,0,'Mordor 9',150,12,0,0,0,0,17,NULL,1),(422,0,0,0,'Mordor 10',210,12,0,0,0,0,25,NULL,2),(423,0,0,0,'Mordor 11',210,12,0,0,0,0,25,NULL,2),(424,0,0,0,'Mordor 13',210,12,0,0,0,0,29,NULL,2),(425,0,0,0,'Mordor 14',200,12,0,0,0,0,22,NULL,1),(426,0,0,0,'Mordor 15',150,12,0,0,0,0,17,NULL,1),(427,0,0,0,'Mordor 16',110,12,0,0,0,0,13,NULL,1),(428,0,0,0,'Mordor 17',150,12,0,0,0,0,17,NULL,1),(429,0,0,0,'Mordor 18',110,12,0,0,0,0,13,NULL,1),(430,0,0,0,'Mordor 19',290,12,0,0,0,0,33,NULL,2),(431,0,0,0,'Mordor 20',290,12,0,0,0,0,33,NULL,2),(432,0,0,0,'Mordor 21',270,12,0,0,0,0,31,NULL,2),(433,0,0,0,'Mordor 22',270,12,0,0,0,0,31,NULL,2),(434,0,0,0,'Mordor 23',290,12,0,0,0,0,33,NULL,2),(435,0,0,0,'Mordor 24',290,12,0,0,0,0,33,NULL,2),(436,0,0,0,'Mordor 25',290,12,0,0,0,0,33,NULL,2),(437,0,0,0,'Mordor 26',290,12,0,0,0,0,33,NULL,2),(438,0,0,0,'Mordor 27',270,12,0,0,0,0,31,NULL,2),(439,0,0,0,'Mordor 28',520,12,0,0,0,0,58,NULL,3),(440,0,0,0,'Mordor 29',270,12,0,0,0,0,31,NULL,2),(441,0,0,0,'Mordor 30',250,12,0,0,0,0,29,NULL,2),(442,0,0,0,'Mordor 31',250,12,0,0,0,0,29,NULL,2),(443,0,0,0,'Mordor 32',150,12,0,0,0,0,17,NULL,1),(444,0,0,0,'Mordor 33',150,12,0,0,0,0,17,NULL,1),(445,0,0,0,'Mordor 34',150,12,0,0,0,0,17,NULL,1),(446,0,0,0,'Mordor 35',150,12,0,0,0,0,17,NULL,1),(447,0,0,0,'Mordor 36',140,11,0,0,0,0,16,NULL,1),(448,0,0,0,'Mordor 37',210,12,0,0,0,0,25,NULL,2),(449,0,0,0,'Mordor 38',210,12,0,0,0,0,25,NULL,2),(450,0,0,0,'Mordor 39',210,12,0,0,0,0,25,NULL,2),(451,0,0,0,'Mordor 40',210,12,0,0,0,0,25,NULL,2),(452,0,0,0,'Mordor 41',270,12,0,0,0,0,31,NULL,2),(453,0,0,0,'Mordor 42',190,12,0,0,0,0,21,NULL,1),(454,0,0,0,'Mordor 43',190,12,0,0,0,0,21,NULL,1),(455,0,0,0,'Mordor 44',380,12,0,0,0,0,42,NULL,2),(456,0,0,0,'Mordor 45',230,12,0,0,0,0,25,NULL,1),(457,0,0,0,'Mordor 46',250,12,0,0,0,0,25,NULL,0),(458,0,0,0,'Minas Depot 12',1000,13,0,0,0,0,30,NULL,2),(459,0,0,0,'Minas Depot 13',1000,13,0,0,0,0,31,NULL,2),(460,0,0,0,'Minas Depot 14',1000,13,0,0,0,0,17,NULL,2),(461,0,0,0,'Minas Top 1',1000,13,0,0,0,0,37,NULL,1),(462,0,0,0,'Minas Top 2',1000,13,0,0,0,0,24,NULL,1),(463,0,0,0,'Minas Top 3',1000,13,0,0,0,0,31,NULL,1),(464,0,0,0,'Minas Top 4',1000,13,0,0,0,0,37,NULL,2),(465,0,0,0,'Minas Top 5',1000,13,0,0,0,0,56,NULL,3),(466,0,0,0,'Minas Top 6',1000,13,0,0,0,0,61,NULL,3),(467,0,0,0,'Minas Top 7',1000,13,0,0,0,0,41,NULL,3),(468,0,0,0,'Minas Mirante',1000,13,0,0,0,0,33,NULL,2),(469,0,0,0,'Darashia 2, Flat 07',1000,10,0,0,0,0,48,NULL,1),(470,0,0,0,'Anubis 1',500,14,0,0,0,0,13,NULL,1),(471,0,0,0,'Anubis 2',500,14,0,0,0,0,13,NULL,1),(472,0,0,0,'Anubis 3',550,14,0,0,0,0,17,NULL,1),(473,0,0,0,'Anubis 4',550,14,0,0,0,0,17,NULL,1),(474,0,0,0,'Anubis 5',520,14,0,0,0,0,13,NULL,1),(475,0,0,0,'Anubis 6',520,14,0,0,0,0,13,NULL,1),(476,0,0,0,'Anubis 7',550,14,0,0,0,0,17,NULL,1),(477,0,0,0,'Anubis 8',540,14,0,0,0,0,17,NULL,1),(478,0,0,0,'Anubis 9',530,14,0,0,0,0,17,NULL,1),(479,0,0,0,'Anubis 10',580,14,0,0,0,0,17,NULL,1),(480,0,0,0,'Anubis 11',520,14,0,0,0,0,17,NULL,1),(481,0,0,0,'Anubis 12',520,14,0,0,0,0,17,NULL,1),(482,0,0,0,'Anubis 13',520,14,0,0,0,0,17,NULL,1),(483,0,0,0,'Horus 1',600,14,0,0,0,0,17,NULL,1),(484,0,0,0,'Horus 2',600,14,0,0,0,0,17,NULL,1),(485,0,0,0,'Horus 3',600,14,0,0,0,0,17,NULL,1),(486,0,0,0,'Horus 4',700,14,0,0,0,0,17,NULL,1),(487,0,0,0,'Horus 5',1200,14,0,0,0,0,73,NULL,2),(488,0,0,0,'Horus 6',700,14,0,0,0,0,19,NULL,1),(489,0,0,0,'Horus 7',700,14,0,0,0,0,19,NULL,1),(490,0,0,0,'Horus 8',1100,14,0,0,0,0,49,NULL,1),(491,0,0,0,'Horus 9',1200,14,0,0,0,0,55,NULL,1),(492,0,0,0,'Horus 10',700,14,0,0,0,0,25,NULL,1),(493,0,0,0,'Horus 11',750,14,0,0,0,0,31,NULL,2),(494,0,0,0,'Horus 12',700,14,0,0,0,0,25,NULL,1),(495,0,0,0,'Horus 13',700,14,0,0,0,0,19,NULL,1),(496,0,0,0,'Horus 14',750,14,0,0,0,0,25,NULL,1),(497,0,0,0,'Horus 15',650,14,0,0,0,0,25,NULL,1),(498,0,0,0,'Horus 16',650,14,0,0,0,0,19,NULL,1),(499,0,0,0,'Horus 17',650,14,0,0,0,0,25,NULL,1),(500,0,0,0,'Horus 18',750,14,0,0,0,0,16,NULL,1),(501,0,0,0,'Horus 19',700,14,0,0,0,0,13,NULL,1),(502,0,0,0,'Horus 20',700,14,0,0,0,0,21,NULL,1),(503,0,0,0,'Horus 21',700,14,0,0,0,0,21,NULL,1),(504,0,0,0,'Piramide 1',800,14,0,0,0,0,21,NULL,1),(505,0,0,0,'Piramide 2',600,14,0,0,0,0,9,NULL,1),(506,0,0,0,'Piramide 3',850,14,0,0,0,0,25,NULL,1),(507,0,0,0,'Piramide 4',750,14,0,0,0,0,21,NULL,1),(508,0,0,0,'Piramide 5',750,14,0,0,0,0,21,NULL,1),(509,0,0,0,'Piramide 6',700,14,0,0,0,0,21,NULL,1),(510,0,0,0,'Piramide 7',700,14,0,0,0,0,21,NULL,1),(511,0,0,0,'Piramide 8',650,14,0,0,0,0,13,NULL,1),(512,0,0,0,'Piramide 9',650,14,0,0,0,0,13,NULL,1),(513,0,0,0,'Piramide 10',800,14,0,0,0,0,29,NULL,2),(514,0,0,0,'Osiris 1',800,14,0,0,0,0,21,NULL,1),(515,0,0,0,'Osiris 2',800,14,0,0,0,0,21,NULL,1),(516,0,0,0,'Osiris 3',750,14,0,0,0,0,21,NULL,1),(517,0,0,0,'Osiris 4',750,14,0,0,0,0,21,NULL,1),(518,0,0,0,'Osiris 5',700,14,0,0,0,0,26,NULL,1),(519,0,0,0,'Seth 1',3000,14,0,0,0,0,33,NULL,1),(520,0,0,0,'Seth 2',3000,14,0,0,0,0,33,NULL,1),(521,0,0,0,'Seth 3',3000,14,0,0,0,0,33,NULL,1),(522,0,0,0,'Seth 4',3000,14,0,0,0,0,49,NULL,1),(523,0,0,0,'Seth 5',3000,14,0,0,0,0,55,NULL,1),(524,0,0,0,'Seth 6',3000,14,0,0,0,0,49,NULL,1),(525,0,0,0,'Seth 7',3000,14,0,0,0,0,25,NULL,1),(526,0,0,0,'Isis 1',600,14,0,0,0,0,11,NULL,1),(527,0,0,0,'Isis 2',600,14,0,0,0,0,11,NULL,1),(528,0,0,0,'Isis 3',550,14,0,0,0,0,11,NULL,1),(529,0,0,0,'Isis 4',550,14,0,0,0,0,11,NULL,1),(530,0,0,0,'Isis 5',550,14,0,0,0,0,13,NULL,1),(531,0,0,0,'Isis 6',550,14,0,0,0,0,13,NULL,1),(532,0,0,0,'Isis 7',500,14,0,0,0,0,13,NULL,1),(533,0,0,0,'Isis 8',500,14,0,0,0,0,13,NULL,1),(534,0,0,0,'Ra 1',15000,14,0,0,0,0,37,NULL,2),(535,0,0,0,'Ra 2',15000,14,0,0,0,0,37,NULL,2),(536,0,0,0,'Ra 3',15000,14,0,0,0,0,37,NULL,2),(537,0,0,0,'Ra 4',15000,14,0,0,0,0,37,NULL,2),(541,0,0,0,'Darashia 8, Flat 11',1990,10,0,0,0,0,66,NULL,2),(542,0,0,0,'Ra 5 ',25000,14,0,0,0,0,66,NULL,2),(543,0,0,0,'Anfallas 1',850,15,0,0,0,0,21,NULL,1),(544,0,0,0,'Anfallas 2',850,15,0,0,0,0,25,NULL,2),(545,0,0,0,'Anfallas 3',800,15,0,0,0,0,22,NULL,2),(546,0,0,0,'Anfallas 4',650,15,0,0,0,0,10,NULL,1),(547,0,0,0,'Anfallas 5',850,15,0,0,0,0,19,NULL,1),(548,0,0,0,'Anfallas 6',900,15,0,0,0,0,22,NULL,2),(549,0,0,0,'Anfallas 7',850,15,0,0,0,0,43,NULL,2),(550,0,0,0,'Anfallas 8',650,15,0,0,0,0,22,NULL,1),(551,0,0,0,'Anfallas 9',600,15,0,0,0,0,13,NULL,1),(552,0,0,0,'Anfallas 10',550,15,0,0,0,0,13,NULL,1),(553,0,0,0,'Anfallas 11',700,15,0,0,0,0,29,NULL,1),(554,0,0,0,'Anfallas 12',450,15,0,0,0,0,9,NULL,1),(555,0,0,0,'Anfallas 13',600,15,0,0,0,0,19,NULL,1),(556,0,0,0,'Anfallas 14',750,15,0,0,0,0,31,NULL,2),(557,0,0,0,'Anfallas 15',700,15,0,0,0,0,26,NULL,1),(558,0,0,0,'Anfallas Top 1',900,15,0,0,0,0,21,NULL,1),(559,0,0,0,'Anfallas Top 2',650,15,0,0,0,0,10,NULL,1),(560,0,0,0,'Anfallas Top 3',850,15,0,0,0,0,19,NULL,1),(561,0,0,0,'Anfallas Top 4',950,15,0,0,0,0,22,NULL,1),(562,0,0,0,'Anfallas Top 5',800,15,0,0,0,0,43,NULL,2),(563,0,0,0,'Anfallas Top 6 ',750,15,0,0,0,0,25,NULL,1),(564,0,0,0,'Anfallas Top 7',650,15,0,0,0,0,22,NULL,1),(565,0,0,0,'Anfallas Top 8',600,15,0,0,0,0,13,NULL,1),(566,0,0,0,'Anfallas Top 9',550,15,0,0,0,0,13,NULL,1),(567,0,0,0,'Anfallas Top 10',700,15,0,0,0,0,19,NULL,1),(568,0,0,0,'Anfallas Top 11',800,15,0,0,0,0,31,NULL,1),(569,0,0,0,'Anfallas Top 12',800,15,0,0,0,0,26,NULL,1),(570,0,0,0,'Umbar#01',0,0,0,0,0,0,143,NULL,3),(571,0,0,0,'Umbar#02',0,0,0,0,0,0,95,NULL,2),(572,0,0,0,'Umbar#03',0,0,0,0,0,0,162,NULL,4),(573,0,0,0,'Umbar#04',0,0,0,0,0,0,277,NULL,7),(574,0,0,0,'Umbar#05',0,0,0,0,0,0,128,NULL,2),(575,0,0,0,'Umbar#06',0,0,0,0,0,0,63,NULL,1),(576,0,0,0,'Umbar#07',0,0,0,0,0,0,48,NULL,2),(577,0,0,0,'Umbar#08',0,0,0,0,0,0,89,NULL,2),(578,0,0,0,'Umbar#10',0,0,0,0,0,0,51,NULL,0),(579,0,0,0,'Umbar#09',0,0,0,0,0,0,66,NULL,1),(580,0,0,0,'Umbar#11',0,0,0,0,0,0,149,NULL,2),(581,0,0,0,'Umbar#12',0,0,0,0,0,0,118,NULL,2),(582,0,0,0,'Umbar#13',0,0,0,0,0,0,115,NULL,2),(583,0,0,0,'Umbar#14',0,0,0,0,0,0,154,NULL,2),(584,0,0,0,'Umbar#15',0,0,0,0,0,0,95,NULL,2),(585,0,0,0,'Umbar#16',0,0,0,0,0,0,101,NULL,3),(586,0,0,0,'Umbar#17',0,0,0,0,0,0,134,NULL,5),(587,0,0,0,'Umbar#18',0,0,0,0,0,0,162,NULL,2),(588,0,0,0,'Umbar#19',0,0,0,0,0,0,110,NULL,4),(589,0,0,0,'Umbar#20',0,0,0,0,0,0,228,NULL,0),(590,0,0,0,'Umbar#21',0,0,0,0,0,0,288,NULL,2),(591,0,0,0,'Umbar#22',0,0,0,0,0,0,207,NULL,2),(592,0,0,0,'Umbar#23',0,0,0,0,0,0,293,NULL,6),(593,0,0,0,'Umbar#24',0,0,0,0,0,0,167,NULL,4),(594,0,0,0,'Umbar#001',0,18,0,0,0,0,51,NULL,1),(595,0,0,0,'Umbar#002',0,18,0,0,0,0,59,NULL,1),(596,0,0,0,'Thanah II d',350,9,0,0,0,0,16,NULL,1),(597,0,0,0,'Thanah II e',350,9,0,0,0,0,12,NULL,1),(599,0,0,0,'Thanah II a',850,9,0,0,0,0,37,NULL,1),(600,0,0,0,'Thrarhor I c (Shop)',1050,9,0,0,0,0,28,NULL,1),(601,0,0,0,'Thrarhor I d (Shop)',1050,9,0,0,0,0,21,NULL,1),(602,0,0,0,'Thrarhor I a (Shop)',1050,9,0,0,0,0,32,NULL,1),(603,0,0,0,'Thrarhor I b (Shop)',1050,9,0,0,0,0,24,NULL,1),(604,0,0,0,'Thanah I c',3250,9,0,0,0,0,91,NULL,3),(605,0,0,0,'Thanah I d',2900,9,0,0,0,0,80,NULL,4),(606,0,0,0,'Thanah I b',3000,9,0,0,0,0,84,NULL,3),(607,0,0,0,'Thanah I a',850,9,0,0,0,0,27,NULL,1),(608,0,0,0,'Harrah I',5740,9,0,0,0,0,190,NULL,10),(609,0,0,0,'Charsirakh I b',1580,9,0,0,0,0,51,NULL,2),(610,0,0,0,'Charsirakh I a',280,9,0,0,0,0,15,NULL,1),(611,0,0,0,'Othehothep I d',2020,9,0,0,0,0,68,NULL,4),(612,0,0,0,'Othehothep I c',1720,9,0,0,0,0,58,NULL,3),(613,0,0,0,'Othehothep I b',1380,9,0,0,0,0,49,NULL,2),(614,0,0,0,'Othehothep I a',280,9,0,0,0,0,14,NULL,1),(615,0,0,0,'Othehothep II e',1340,9,0,0,0,0,44,NULL,2),(616,0,0,0,'Othehothep II f',1340,9,0,0,0,0,44,NULL,2),(617,0,0,0,'Othehothep II d',840,9,0,0,0,0,32,NULL,1),(618,0,0,0,'Othehothep II c',840,9,0,0,0,0,30,NULL,1),(619,0,0,0,'Othehothep II b',1920,9,0,0,0,0,67,NULL,3),(620,0,0,0,'Othehothep II a',400,9,0,0,0,0,18,NULL,1),(621,0,0,0,'Mothrem I',1140,9,0,0,0,0,38,NULL,2),(622,0,0,0,'Arakmehn I',1320,9,0,0,0,0,41,NULL,3),(623,0,0,0,'Othehothep III d',1040,9,0,0,0,0,36,NULL,1),(624,0,0,0,'Othehothep III c',940,9,0,0,0,0,30,NULL,2),(625,0,0,0,'Othehothep III e',840,9,0,0,0,0,32,NULL,1),(626,0,0,0,'Othehothep III f',680,9,0,0,0,0,27,NULL,1),(627,0,0,0,'Othehothep III b',1340,9,0,0,0,0,49,NULL,2),(628,0,0,0,'Othehothep III a',280,9,0,0,0,0,14,NULL,1),(629,0,0,0,'Unklath I d',1680,9,0,0,0,0,49,NULL,3),(630,0,0,0,'Unklath I e',1580,9,0,0,0,0,51,NULL,2),(631,0,0,0,'Unklath I g',1480,9,0,0,0,0,51,NULL,1),(632,0,0,0,'Unklath I f',1580,9,0,0,0,0,51,NULL,2),(633,0,0,0,'Unklath I c',1460,9,0,0,0,0,50,NULL,2),(634,0,0,0,'Unklath I b',1460,9,0,0,0,0,50,NULL,2),(635,0,0,0,'Unklath I a',1140,9,0,0,0,0,38,NULL,2),(636,0,0,0,'Arakmehn II',1040,9,0,0,0,0,38,NULL,1),(637,0,0,0,'Arakmehn III',1140,9,0,0,0,0,38,NULL,2),(638,0,0,0,'Unklath II b',680,9,0,0,0,0,25,NULL,1),(639,0,0,0,'Unklath II c',680,9,0,0,0,0,27,NULL,1),(640,0,0,0,'Unklath II d',1580,9,0,0,0,0,52,NULL,2),(641,0,0,0,'Unklath II a',1040,9,0,0,0,0,36,NULL,1),(642,0,0,0,'Arakmehn IV',1220,9,0,0,0,0,41,NULL,2),(643,0,0,0,'Rathal I b',680,9,0,0,0,0,25,NULL,1),(644,0,0,0,'Rathal I c',680,9,0,0,0,0,27,NULL,1),(645,0,0,0,'Rathal I e',780,9,0,0,0,0,27,NULL,2),(646,0,0,0,'Rathal I d',780,9,0,0,0,0,27,NULL,2),(647,0,0,0,'Rathal I a',1140,9,0,0,0,0,36,NULL,2),(648,0,0,0,'Rathal II b',680,9,0,0,0,0,25,NULL,1),(649,0,0,0,'Rathal II c',680,9,0,0,0,0,27,NULL,1),(650,0,0,0,'Rathal II d',1460,9,0,0,0,0,52,NULL,2),(651,0,0,0,'Rathal II a',1040,9,0,0,0,0,38,NULL,1),(653,0,0,0,'Esuph II a',280,9,0,0,0,0,14,NULL,1),(654,0,0,0,'Uthemath II',4460,9,0,0,0,0,138,NULL,8),(655,0,0,0,'Uthemath I e',940,9,0,0,0,0,32,NULL,2),(656,0,0,0,'Uthemath I d',840,9,0,0,0,0,30,NULL,1),(657,0,0,0,'Uthemath I f',2440,9,0,0,0,0,86,NULL,3),(658,0,0,0,'Uthemath I b',800,9,0,0,0,0,32,NULL,1),(659,0,0,0,'Uthemath I c',900,9,0,0,0,0,34,NULL,2),(660,0,0,0,'Uthemath I a',400,9,0,0,0,0,18,NULL,1),(661,0,0,0,'Botham I c',1700,9,0,0,0,0,49,NULL,2),(662,0,0,0,'Botham I e',1650,9,0,0,0,0,44,NULL,2),(663,0,0,0,'Botham I d',3050,9,0,0,0,0,80,NULL,3),(664,0,0,0,'Botham I b',3000,9,0,0,0,0,83,NULL,3),(666,0,0,0,'Horakhal',9420,9,0,0,0,0,277,NULL,14),(667,0,0,0,'Esuph III b',1340,9,0,0,0,0,49,NULL,2),(668,0,0,0,'Esuph III a',280,9,0,0,0,0,14,NULL,1),(669,0,0,0,'Esuph IV b',400,9,0,0,0,0,16,NULL,1),(670,0,0,0,'Esuph IV c',400,9,0,0,0,0,18,NULL,1),(671,0,0,0,'Esuph IV d',800,9,0,0,0,0,34,NULL,1),(672,0,0,0,'Esuph IV a',400,9,0,0,0,0,16,NULL,1),(673,0,0,0,'Botham II e',1650,9,0,0,0,0,42,NULL,2),(674,0,0,0,'Botham II g',1400,9,0,0,0,0,38,NULL,2),(675,0,0,0,'Botham II f',1650,9,0,0,0,0,44,NULL,2),(676,0,0,0,'Botham II d',1950,9,0,0,0,0,49,NULL,2),(677,0,0,0,'Botham II c',1250,9,0,0,0,0,38,NULL,2),(678,0,0,0,'Botham II b',1600,9,0,0,0,0,47,NULL,2),(679,0,0,0,'Botham II a',850,9,0,0,0,0,25,NULL,1),(680,0,0,0,'Botham III g',1650,9,0,0,0,0,42,NULL,2),(681,0,0,0,'Botham III f',2350,9,0,0,0,0,56,NULL,3),(682,0,0,0,'Botham III h',3750,9,0,0,0,0,98,NULL,3),(683,0,0,0,'Botham III d',850,9,0,0,0,0,27,NULL,1),(684,0,0,0,'Botham III e',850,9,0,0,0,0,27,NULL,1),(685,0,0,0,'Botham III b',950,9,0,0,0,0,25,NULL,2),(686,0,0,0,'Botham III c',850,9,0,0,0,0,27,NULL,1),(687,0,0,0,'Botham III a',1400,9,0,0,0,0,36,NULL,2),(688,0,0,0,'Botham IV i',1800,9,0,0,0,0,51,NULL,3),(689,0,0,0,'Botham IV h',1850,9,0,0,0,0,49,NULL,1),(690,0,0,0,'Botham IV f',1700,9,0,0,0,0,49,NULL,2),(691,0,0,0,'Botham IV g',1650,9,0,0,0,0,49,NULL,2),(692,0,0,0,'Botham IV c',850,9,0,0,0,0,27,NULL,1),(693,0,0,0,'Botham IV e',850,9,0,0,0,0,27,NULL,1),(694,0,0,0,'Botham IV d',850,9,0,0,0,0,27,NULL,1),(695,0,0,0,'Botham IV b',850,9,0,0,0,0,25,NULL,1),(696,0,0,0,'Botham IV a',1400,9,0,0,0,0,36,NULL,2),(697,0,0,0,'Ramen Tah',7650,9,0,0,0,0,184,NULL,16),(698,0,0,0,'Banana Bay 1',450,8,0,0,0,0,25,NULL,1),(699,0,0,0,'Banana Bay 2',765,8,0,0,0,0,36,NULL,1),(700,0,0,0,'Banana Bay 3',450,8,0,0,0,0,25,NULL,1),(701,0,0,0,'Banana Bay 4',450,8,0,0,0,0,25,NULL,1),(702,0,0,0,'Shark Manor',8780,8,0,0,0,0,286,NULL,15),(703,0,0,0,'Coconut Quay 1',1765,8,0,0,0,0,64,NULL,2),(704,0,0,0,'Coconut Quay 2',1045,8,0,0,0,0,42,NULL,2),(705,0,0,0,'Coconut Quay 3',2145,8,0,0,0,0,70,NULL,4),(706,0,0,0,'Coconut Quay 4',2135,8,0,0,0,0,72,NULL,3),(707,0,0,0,'Crocodile Bridge 3',1270,8,0,0,0,0,49,NULL,2),(708,0,0,0,'Crocodile Bridge 2',865,8,0,0,0,0,36,NULL,2),(709,0,0,0,'Crocodile Bridge 1',1045,8,0,0,0,0,42,NULL,2),(710,0,0,0,'Bamboo Garden 1',1640,8,0,0,0,0,63,NULL,3),(711,0,0,0,'Crocodile Bridge 4',4755,8,0,0,0,0,176,NULL,4),(712,0,0,0,'Crocodile Bridge 5',3970,8,0,0,0,0,157,NULL,2),(713,0,0,0,'Woodway 1',765,8,0,0,0,0,36,NULL,1),(714,0,0,0,'Woodway 2',585,8,0,0,0,0,30,NULL,1),(715,0,0,0,'Woodway 3',1540,8,0,0,0,0,65,NULL,2),(716,0,0,0,'Woodway 4',405,8,0,0,0,0,24,NULL,1),(717,0,0,0,'Flamingo Flats 5',1845,8,0,0,0,0,84,NULL,1),(718,0,0,0,'Bamboo Fortress',21970,8,0,0,0,0,848,NULL,20),(719,0,0,0,'Bamboo Garden 3',1540,8,0,0,0,0,63,NULL,2),(720,0,0,0,'Bamboo Garden 2',1045,8,0,0,0,0,42,NULL,2),(721,0,0,0,'Flamingo Flats 4',865,8,0,0,0,0,36,NULL,2),(722,0,0,0,'Flamingo Flats 2',1045,8,0,0,0,0,42,NULL,2),(723,0,0,0,'Flamingo Flats 3',685,8,0,0,0,0,30,NULL,2),(724,0,0,0,'Flamingo Flats 1',685,8,0,0,0,0,30,NULL,2),(725,0,0,0,'Jungle Edge 4',865,8,0,0,0,0,36,NULL,2),(726,0,0,0,'Jungle Edge 5',865,8,0,0,0,0,36,NULL,2),(727,0,0,0,'Jungle Edge 6',450,8,0,0,0,0,25,NULL,1),(728,0,0,0,'Jungle Edge 2',3170,8,0,0,0,0,128,NULL,3),(729,0,0,0,'Jungle Edge 3',865,8,0,0,0,0,36,NULL,2),(730,0,0,0,'Jungle Edge 1',2495,8,0,0,0,0,98,NULL,3),(731,0,0,0,'Haggler\'s Hangout 6',6450,8,0,0,0,0,208,NULL,4),(732,0,0,0,'Haggler\'s Hangout 5 (Shop)',1550,8,0,0,0,0,56,NULL,1),(733,0,0,0,'Haggler\'s Hangout 4a (Shop)',1850,8,0,0,0,0,56,NULL,1),(734,0,0,0,'Haggler\'s Hangout 4b (Shop)',1550,8,0,0,0,0,56,NULL,1),(735,0,0,0,'Haggler\'s Hangout 3',7550,8,0,0,0,0,256,NULL,4),(736,0,0,0,'Haggler\'s Hangout 2',1300,8,0,0,0,0,49,NULL,1),(737,0,0,0,'Haggler\'s Hangout 1',1400,8,0,0,0,0,49,NULL,2),(738,0,0,0,'River Homes 1',3485,8,0,0,0,0,128,NULL,3),(739,0,0,0,'River Homes 2a',1270,8,0,0,0,0,42,NULL,2),(740,0,0,0,'River Homes 2b',1595,8,0,0,0,0,56,NULL,3),(741,0,0,0,'River Homes 3',5055,8,0,0,0,0,176,NULL,7),(742,0,0,0,'The Treehouse',24120,8,0,0,0,0,894,NULL,23),(743,0,0,0,'Corner Shop (Shop)',2215,12,0,0,0,0,96,NULL,2),(744,0,0,0,'Tusk Flats 1',765,12,0,0,0,0,40,NULL,2),(745,0,0,0,'Tusk Flats 2',835,12,0,0,0,0,42,NULL,2),(746,0,0,0,'Tusk Flats 3',660,12,0,0,0,0,34,NULL,2),(747,0,0,0,'Tusk Flats 4',315,12,0,0,0,0,24,NULL,1),(748,0,0,0,'Tusk Flats 6',660,12,0,0,0,0,35,NULL,2),(749,0,0,0,'Tusk Flats 5',455,12,0,0,0,0,30,NULL,1),(750,0,0,0,'Shady Rocks 5',2890,12,0,0,0,0,110,NULL,2),(751,0,0,0,'Shady Rocks 4 (Shop)',2710,12,0,0,0,0,110,NULL,2),(752,0,0,0,'Shady Rocks 3',4115,12,0,0,0,0,154,NULL,3),(753,0,0,0,'Shady Rocks 2',2010,12,0,0,0,0,77,NULL,4),(754,0,0,0,'Shady Rocks 1',3630,12,0,0,0,0,132,NULL,4),(755,0,0,0,'Crystal Glance',19625,12,0,0,0,0,569,NULL,24),(756,0,0,0,'Arena Walk 3',3550,12,0,0,0,0,126,NULL,3),(757,0,0,0,'Arena Walk 2',1400,12,0,0,0,0,54,NULL,2),(758,0,0,0,'Arena Walk 1',3250,12,0,0,0,0,128,NULL,3),(759,0,0,0,'Bears Paw 2',2305,12,0,0,0,0,100,NULL,2),(760,0,0,0,'Bears Paw 1',1810,12,0,0,0,0,72,NULL,2),(761,0,0,0,'Spirit Homes 5',1450,12,0,0,0,0,56,NULL,2),(762,0,0,0,'Glacier Side 3',1950,12,0,0,0,0,75,NULL,2),(763,0,0,0,'Glacier Side 2',4750,12,0,0,0,0,154,NULL,3),(764,0,0,0,'Glacier Side 1',1600,12,0,0,0,0,65,NULL,2),(765,0,0,0,'Spirit Homes 1',1700,12,0,0,0,0,56,NULL,2),(766,0,0,0,'Spirit Homes 2',1900,12,0,0,0,0,72,NULL,2),(767,0,0,0,'Spirit Homes 3',4250,12,0,0,0,0,128,NULL,3),(768,0,0,0,'Spirit Homes 4',1100,12,0,0,0,0,49,NULL,1),(770,0,0,0,'Glacier Side 4',2050,12,0,0,0,0,75,NULL,1),(771,0,0,0,'Shelf Site',4800,12,0,0,0,0,160,NULL,3),(772,0,0,0,'Raven Corner 1',855,12,0,0,0,0,45,NULL,1),(773,0,0,0,'Raven Corner 2',1685,12,0,0,0,0,60,NULL,3),(774,0,0,0,'Raven Corner 3',855,12,0,0,0,0,45,NULL,1),(775,0,0,0,'Bears Paw 3',2090,12,0,0,0,0,82,NULL,3),(776,0,0,0,'Bears Paw 4',5205,12,0,0,0,0,189,NULL,4),(778,0,0,0,'Bears Paw 5',2045,12,0,0,0,0,81,NULL,3),(779,0,0,0,'Trout Plaza 5 (Shop)',3880,12,0,0,0,0,144,NULL,2),(780,0,0,0,'Pilchard Bin 1',685,12,0,0,0,0,30,NULL,2),(781,0,0,0,'Pilchard Bin 2',685,12,0,0,0,0,24,NULL,2),(782,0,0,0,'Pilchard Bin 3',585,12,0,0,0,0,24,NULL,1),(783,0,0,0,'Pilchard Bin 4',585,12,0,0,0,0,24,NULL,1),(784,0,0,0,'Pilchard Bin 5',685,12,0,0,0,0,24,NULL,2),(785,0,0,0,'Pilchard Bin 10',450,12,0,0,0,0,20,NULL,1),(786,0,0,0,'Pilchard Bin 9',450,12,0,0,0,0,20,NULL,1),(787,0,0,0,'Pilchard Bin 8',450,12,0,0,0,0,20,NULL,2),(789,0,0,0,'Pilchard Bin 7',450,12,0,0,0,0,20,NULL,1),(790,0,0,0,'Pilchard Bin 6',450,12,0,0,0,0,25,NULL,1),(791,0,0,0,'Trout Plaza 1',2395,12,0,0,0,0,112,NULL,2),(792,0,0,0,'Trout Plaza 2',1540,12,0,0,0,0,64,NULL,2),(793,0,0,0,'Trout Plaza 3',900,12,0,0,0,0,36,NULL,1),(794,0,0,0,'Trout Plaza 4',900,12,0,0,0,0,45,NULL,1),(795,0,0,0,'Skiffs End 1',1540,12,0,0,0,0,70,NULL,2),(796,0,0,0,'Skiffs End 2',910,12,0,0,0,0,42,NULL,2),(797,0,0,0,'Furrier Quarter 3',1010,12,0,0,0,0,54,NULL,2),(798,0,0,0,'Mammoth Belly',22810,12,0,0,0,0,634,NULL,30),(799,0,0,0,'Furrier Quarter 2',1045,12,0,0,0,0,56,NULL,2),(800,0,0,0,'Furrier Quarter 1',1635,12,0,0,0,0,84,NULL,3),(801,0,0,0,'Fimbul Shelf 3',1255,12,0,0,0,0,66,NULL,2),(802,0,0,0,'Fimbul Shelf 4',1045,12,0,0,0,0,56,NULL,2),(803,0,0,0,'Fimbul Shelf 2',1045,12,0,0,0,0,56,NULL,2),(804,0,0,0,'Fimbul Shelf 1',975,12,0,0,0,0,48,NULL,2),(805,0,0,0,'Frost Manor',26370,12,0,0,0,0,806,NULL,24),(831,0,0,0,'Marble Guildhall',16810,3,0,0,0,0,530,NULL,17),(832,0,0,0,'Iron Guildhall',15560,3,0,0,0,0,464,NULL,17),(833,0,0,0,'The Market 1 (Shop)',650,3,0,0,0,0,25,NULL,1),(834,0,0,0,'The Market 3 (Shop)',1450,3,0,0,0,0,40,NULL,1),(835,0,0,0,'The Market 2 (Shop)',1100,3,0,0,0,0,40,NULL,1),(836,0,0,0,'The Market 4 (Shop)',1800,3,0,0,0,0,48,NULL,1),(837,0,0,0,'Granite Guildhall',17845,3,0,0,0,0,530,NULL,17),(838,0,0,0,'Upper Barracks 1',210,3,0,0,0,0,14,NULL,1),(850,0,0,0,'Upper Barracks 13',580,3,0,0,0,0,24,NULL,2),(851,0,0,0,'Nobility Quarter 4',765,3,0,0,0,0,25,NULL,1),(852,0,0,0,'Nobility Quarter 5',765,3,0,0,0,0,25,NULL,1),(853,0,0,0,'Nobility Quarter 7',765,3,0,0,0,0,25,NULL,1),(854,0,0,0,'Nobility Quarter 6',765,3,0,0,0,0,26,NULL,1),(855,0,0,0,'Nobility Quarter 8',765,3,0,0,0,0,26,NULL,1),(856,0,0,0,'Nobility Quarter 9',765,3,0,0,0,0,26,NULL,1),(857,0,0,0,'Nobility Quarter 2',1865,3,0,0,0,0,50,NULL,3),(858,0,0,0,'Nobility Quarter 3',1865,3,0,0,0,0,50,NULL,3),(859,0,0,0,'Nobility Quarter 1',1865,3,0,0,0,0,50,NULL,3),(863,0,0,0,'The Farms 6, Fishing Hut',1255,3,0,0,0,0,32,NULL,2),(864,0,0,0,'The Farms 5',1530,3,0,0,0,0,36,NULL,2),(866,0,0,0,'The Farms 3',1530,3,0,0,0,0,36,NULL,2),(867,0,0,0,'The Farms 2',1530,3,0,0,0,0,36,NULL,2),(868,0,0,0,'The Farms 1',2510,3,0,0,0,0,60,NULL,3),(886,0,0,0,'Outlaw Castle',8000,3,0,0,0,0,307,NULL,9),(889,0,0,0,'Tunnel Gardens 3',2000,3,0,0,0,0,43,NULL,3),(890,0,0,0,'Tunnel Gardens 4',2000,3,0,0,0,0,42,NULL,3),(892,0,0,0,'Tunnel Gardens 5',1360,3,0,0,0,0,35,NULL,2),(893,0,0,0,'Tunnel Gardens 6',1360,3,0,0,0,0,38,NULL,2),(894,0,0,0,'Tunnel Gardens 8',1360,3,0,0,0,0,35,NULL,2),(895,0,0,0,'Tunnel Gardens 7',1360,3,0,0,0,0,35,NULL,2),(900,0,0,0,'Wolftower',21550,3,0,0,0,0,638,NULL,23),(901,0,0,0,'Paupers Palace, Flat 11',315,1,0,0,0,0,12,NULL,1),(905,0,0,0,'Botham I a',950,9,0,0,0,0,36,NULL,1),(906,0,0,0,'Esuph I',680,9,0,0,0,0,39,NULL,1),(907,0,0,0,'Esuph II b',1380,9,0,0,0,0,51,NULL,2),(1883,0,0,0,'Aureate Court 1',5240,13,0,0,0,0,276,NULL,3),(1884,0,0,0,'Aureate Court 2',4860,13,0,0,0,0,201,NULL,2),(1885,0,0,0,'Aureate Court 3',4300,13,0,0,0,0,228,NULL,2),(1886,0,0,0,'Aureate Court 4',3980,13,0,0,0,0,210,NULL,4),(1887,0,0,0,'Fortune Wing 1',10180,13,0,0,0,0,422,NULL,4),(1888,0,0,0,'Fortune Wing 2',5580,13,0,0,0,0,260,NULL,2),(1889,0,0,0,'Fortune Wing 3',5740,13,0,0,0,0,258,NULL,2),(1890,0,0,0,'Fortune Wing 4',5740,13,0,0,0,0,306,NULL,4),(1891,0,0,0,'Luminous Arc 1',6460,13,0,0,0,0,344,NULL,2),(1892,0,0,0,'Luminous Arc 2',6460,13,0,0,0,0,301,NULL,4),(1893,0,0,0,'Luminous Arc 3',5400,13,0,0,0,0,249,NULL,3),(1894,0,0,0,'Luminous Arc 4',8000,13,0,0,0,0,343,NULL,5),(1895,0,0,0,'Radiant Plaza 1',5620,13,0,0,0,0,276,NULL,4),(1896,0,0,0,'Radiant Plaza 2',3820,13,0,0,0,0,179,NULL,2),(1897,0,0,0,'Radiant Plaza 3',4900,13,0,0,0,0,257,NULL,2),(1898,0,0,0,'Radiant Plaza 4',7460,13,0,0,0,0,367,NULL,3),(1899,0,0,0,'Sun Palace',23120,13,0,0,0,0,976,NULL,27),(1900,0,0,0,'Halls of Serenity',23360,13,0,0,0,0,1093,NULL,33),(1901,0,0,0,'Cascade Towers',19500,13,0,0,0,0,811,NULL,33),(1902,0,0,0,'Sorcerer\'s Avenue 5',2695,2,0,0,0,0,96,NULL,1),(1903,0,0,0,'Sorcerer\'s Avenue 1a',1255,2,0,0,0,0,42,NULL,2),(1904,0,0,0,'Sorcerer\'s Avenue 1b',1035,2,0,0,0,0,36,NULL,2),(1905,0,0,0,'Sorcerer\'s Avenue 1c',1255,2,0,0,0,0,36,NULL,2),(1906,0,0,0,'Beach Home Apartments, Flat 06',1145,2,0,0,0,0,40,NULL,2),(1907,0,0,0,'Beach Home Apartments, Flat 01',715,2,0,0,0,0,30,NULL,1),(1908,0,0,0,'Beach Home Apartments, Flat 02',715,2,0,0,0,0,25,NULL,1),(1909,0,0,0,'Beach Home Apartments, Flat 03',715,2,0,0,0,0,30,NULL,1),(1910,0,0,0,'Beach Home Apartments, Flat 04',715,2,0,0,0,0,24,NULL,1),(1911,0,0,0,'Beach Home Apartments, Flat 05',715,2,0,0,0,0,24,NULL,1),(1912,0,0,0,'Beach Home Apartments, Flat 16',1145,2,0,0,0,0,40,NULL,2),(1913,0,0,0,'Beach Home Apartments, Flat 11',715,2,0,0,0,0,30,NULL,1),(1914,0,0,0,'Beach Home Apartments, Flat 12',880,2,0,0,0,0,30,NULL,1),(1915,0,0,0,'Beach Home Apartments, Flat 13',880,2,0,0,0,0,29,NULL,1),(1916,0,0,0,'Beach Home Apartments, Flat 14',385,2,0,0,0,0,15,NULL,1),(1917,0,0,0,'Beach Home Apartments, Flat 15',385,2,0,0,0,0,15,NULL,1),(1918,0,0,0,'Thais Clanhall',8420,2,0,0,0,0,370,NULL,10),(1919,0,0,0,'Harbour Street 4',935,2,0,0,0,0,30,NULL,1),(1920,0,0,0,'Thais Hostel',6980,2,0,0,0,0,171,NULL,24),(1921,0,0,0,'Lower Swamp Lane 1',4740,2,0,0,0,0,166,NULL,4),(1923,0,0,0,'Lower Swamp Lane 3',4740,2,0,0,0,0,161,NULL,4),(1924,0,0,0,'Sunset Homes, Flat 01',520,2,0,0,0,0,25,NULL,1),(1925,0,0,0,'Sunset Homes, Flat 02',520,2,0,0,0,0,30,NULL,1),(1926,0,0,0,'Sunset Homes, Flat 03',520,2,0,0,0,0,30,NULL,1),(1927,0,0,0,'Sunset Homes, Flat 14',520,2,0,0,0,0,30,NULL,1),(1929,0,0,0,'Sunset Homes, Flat 13',860,2,0,0,0,0,35,NULL,2),(1930,0,0,0,'Sunset Homes, Flat 12',520,2,0,0,0,0,25,NULL,1),(1932,0,0,0,'Sunset Homes, Flat 11',520,2,0,0,0,0,25,NULL,1),(1935,0,0,0,'Sunset Homes, Flat 24',520,2,0,0,0,0,30,NULL,1),(1936,0,0,0,'Sunset Homes, Flat 23',860,2,0,0,0,0,35,NULL,2),(1937,0,0,0,'Sunset Homes, Flat 22',520,2,0,0,0,0,25,NULL,1),(1938,0,0,0,'Sunset Homes, Flat 21',520,2,0,0,0,0,25,NULL,1),(1939,0,0,0,'Harbour Place 1 (Shop)',1100,2,0,0,0,0,37,NULL,1),(1940,0,0,0,'Harbour Place 2 (Shop)',1300,2,0,0,0,0,48,NULL,1),(1941,0,0,0,'Warriors Guildhall',14725,2,0,0,0,0,522,NULL,11),(1942,0,0,0,'Farm Lane, 1st floor (Shop)',945,2,0,0,0,0,42,NULL,0),(1943,0,0,0,'Farm Lane, Basement (Shop)',945,2,0,0,0,0,36,NULL,0),(1944,0,0,0,'Main Street 9, 1st floor (Shop)',1440,2,0,0,0,0,47,NULL,0),(1945,0,0,0,'Main Street 9a, 2nd floor (Shop)',765,2,0,0,0,0,30,NULL,0),(1946,0,0,0,'Main Street 9b, 2nd floor (Shop)',1260,2,0,0,0,0,48,NULL,0),(1947,0,0,0,'Farm Lane, 2nd Floor (Shop)',945,2,0,0,0,0,42,NULL,0),(1948,0,0,0,'The City Wall 5a',585,2,0,0,0,0,24,NULL,1),(1949,0,0,0,'The City Wall 5c',585,2,0,0,0,0,24,NULL,1),(1950,0,0,0,'The City Wall 5e',585,2,0,0,0,0,30,NULL,1),(1951,0,0,0,'The City Wall 5b',585,2,0,0,0,0,24,NULL,1),(1952,0,0,0,'The City Wall 5d',585,2,0,0,0,0,24,NULL,1),(1953,0,0,0,'The City Wall 5f',585,2,0,0,0,0,30,NULL,1),(1954,0,0,0,'The City Wall 3a',1045,2,0,0,0,0,42,NULL,2),(1955,0,0,0,'The City Wall 3b',1045,2,0,0,0,0,35,NULL,2),(1956,0,0,0,'The City Wall 3c',1045,2,0,0,0,0,35,NULL,2),(1957,0,0,0,'The City Wall 3d',1045,2,0,0,0,0,41,NULL,2),(1958,0,0,0,'The City Wall 3e',1045,2,0,0,0,0,30,NULL,2),(1959,0,0,0,'The City Wall 3f',1045,2,0,0,0,0,31,NULL,2),(1960,0,0,0,'The City Wall 1a',1270,2,0,0,0,0,49,NULL,2),(1961,0,0,0,'Mill Avenue 3',1400,2,0,0,0,0,49,NULL,2),(1962,0,0,0,'The City Wall 1b',1270,2,0,0,0,0,49,NULL,2),(1963,0,0,0,'Mill Avenue 4',1400,2,0,0,0,0,49,NULL,2),(1964,0,0,0,'Mill Avenue 5',3250,2,0,0,0,0,128,NULL,4),(1965,0,0,0,'Mill Avenue 1 (Shop)',1300,2,0,0,0,0,54,NULL,1),(1966,0,0,0,'Mill Avenue 2 (Shop)',2350,2,0,0,0,0,80,NULL,2),(1967,0,0,0,'The City Wall 7c',865,2,0,0,0,0,36,NULL,2),(1968,0,0,0,'The City Wall 7a',585,2,0,0,0,0,30,NULL,1),(1969,0,0,0,'The City Wall 7e',865,2,0,0,0,0,36,NULL,2),(1970,0,0,0,'The City Wall 7g',585,2,0,0,0,0,30,NULL,1),(1971,0,0,0,'The City Wall 7d',865,2,0,0,0,0,36,NULL,2),(1972,0,0,0,'The City Wall 7b',585,2,0,0,0,0,30,NULL,1),(1973,0,0,0,'The City Wall 7f',865,2,0,0,0,0,35,NULL,2),(1974,0,0,0,'The City Wall 7h',585,2,0,0,0,0,30,NULL,1),(1975,0,0,0,'The City Wall 9',955,2,0,0,0,0,50,NULL,2),(1976,0,0,0,'Upper Swamp Lane 12',3800,2,0,0,0,0,116,NULL,3),(1977,0,0,0,'Upper Swamp Lane 10',2060,2,0,0,0,0,70,NULL,3),(1978,0,0,0,'Upper Swamp Lane 8',8120,2,0,0,0,0,216,NULL,3),(1979,0,0,0,'Southern Thais Guildhall',22440,2,0,0,0,0,596,NULL,16),(1980,0,0,0,'Alai Flats, Flat 04',765,2,0,0,0,0,30,NULL,1),(1981,0,0,0,'Alai Flats, Flat 05',1225,2,0,0,0,0,38,NULL,2),(1982,0,0,0,'Alai Flats, Flat 06',1225,2,0,0,0,0,48,NULL,2),(1983,0,0,0,'Alai Flats, Flat 07',765,2,0,0,0,0,30,NULL,1),(1984,0,0,0,'Alai Flats, Flat 08',765,2,0,0,0,0,30,NULL,1),(1985,0,0,0,'Alai Flats, Flat 03',765,2,0,0,0,0,36,NULL,1),(1986,0,0,0,'Alai Flats, Flat 01',765,2,0,0,0,0,26,NULL,1),(1987,0,0,0,'Alai Flats, Flat 02',765,2,0,0,0,0,34,NULL,1),(1988,0,0,0,'Alai Flats, Flat 14',900,2,0,0,0,0,33,NULL,1),(1989,0,0,0,'Alai Flats, Flat 15',1450,2,0,0,0,0,48,NULL,2),(1990,0,0,0,'Alai Flats, Flat 16',1450,2,0,0,0,0,54,NULL,2),(1991,0,0,0,'Alai Flats, Flat 17',900,2,0,0,0,0,38,NULL,1),(1992,0,0,0,'Alai Flats, Flat 18',900,2,0,0,0,0,38,NULL,1),(1993,0,0,0,'Alai Flats, Flat 13',765,2,0,0,0,0,36,NULL,1),(1994,0,0,0,'Alai Flats, Flat 12',765,2,0,0,0,0,25,NULL,1),(1995,0,0,0,'Alai Flats, Flat 11',765,2,0,0,0,0,35,NULL,1),(1996,0,0,0,'Alai Flats, Flat 24',900,2,0,0,0,0,36,NULL,1),(1997,0,0,0,'Alai Flats, Flat 25',1450,2,0,0,0,0,52,NULL,2),(1998,0,0,0,'Alai Flats, Flat 26',1450,2,0,0,0,0,60,NULL,2),(1999,0,0,0,'Alai Flats, Flat 27',900,2,0,0,0,0,38,NULL,1),(2000,0,0,0,'Alai Flats, Flat 28',900,2,0,0,0,0,38,NULL,1),(2001,0,0,0,'Alai Flats, Flat 23',765,2,0,0,0,0,35,NULL,1),(2002,0,0,0,'Alai Flats, Flat 22',765,2,0,0,0,0,25,NULL,1),(2003,0,0,0,'Alai Flats, Flat 21',765,2,0,0,0,0,36,NULL,1),(2004,0,0,0,'Upper Swamp Lane 4',4740,2,0,0,0,0,165,NULL,4),(2005,0,0,0,'Upper Swamp Lane 2',4740,2,0,0,0,0,159,NULL,4),(2006,0,0,0,'Sorcerer\'s Avenue Labs 2c',715,2,0,0,0,0,20,NULL,1),(2007,0,0,0,'Sorcerer\'s Avenue Labs 2d',715,2,0,0,0,0,20,NULL,1),(2008,0,0,0,'Sorcerer\'s Avenue Labs 2e',715,2,0,0,0,0,20,NULL,1),(2009,0,0,0,'Sorcerer\'s Avenue Labs 2f',715,2,0,0,0,0,20,NULL,1),(2010,0,0,0,'Sorcerer\'s Avenue Labs 2b',715,2,0,0,0,0,24,NULL,1),(2011,0,0,0,'Sorcerer\'s Avenue Labs 2a',715,2,0,0,0,0,24,NULL,1),(2012,0,0,0,'Ivory Circle 1',4280,7,0,0,0,0,160,NULL,2),(2013,0,0,0,'Admiral\'s Avenue 3',4115,7,0,0,0,0,142,NULL,2),(2014,0,0,0,'Admiral\'s Avenue 2',5470,7,0,0,0,0,176,NULL,4),(2015,0,0,0,'Admiral\'s Avenue 1',5105,7,0,0,0,0,168,NULL,2),(2016,0,0,0,'Sugar Street 5',1350,7,0,0,0,0,48,NULL,2),(2017,0,0,0,'Freedom Street 1',2450,7,0,0,0,0,84,NULL,2),(2018,0,0,0,'Freedom Street 2',6050,7,0,0,0,0,208,NULL,4),(2019,0,0,0,'Trader\'s Point 2 (Shop)',5350,7,0,0,0,0,198,NULL,2),(2020,0,0,0,'Trader\'s Point 3 (Shop)',5950,7,0,0,0,0,195,NULL,2),(2021,0,0,0,'Ivory Circle 2',7030,7,0,0,0,0,214,NULL,2),(2022,0,0,0,'The Tavern 1a',2750,7,0,0,0,0,72,NULL,4),(2023,0,0,0,'The Tavern 1b',1900,7,0,0,0,0,54,NULL,2),(2024,0,0,0,'The Tavern 1c',4150,7,0,0,0,0,132,NULL,3),(2025,0,0,0,'The Tavern 1d',1550,7,0,0,0,0,48,NULL,2),(2026,0,0,0,'The Tavern 2d',1350,7,0,0,0,0,40,NULL,2),(2027,0,0,0,'The Tavern 2c',950,7,0,0,0,0,32,NULL,1),(2028,0,0,0,'The Tavern 2b',1700,7,0,0,0,0,62,NULL,2),(2029,0,0,0,'The Tavern 2a',5550,7,0,0,0,0,163,NULL,5),(2030,0,0,0,'Straycat\'s Corner 4',210,7,0,0,0,0,20,NULL,1),(2031,0,0,0,'Straycat\'s Corner 3',210,7,0,0,0,0,20,NULL,1),(2032,0,0,0,'Straycat\'s Corner 2',660,7,0,0,0,0,49,NULL,1),(2033,0,0,0,'Litter Promenade 5',580,7,0,0,0,0,35,NULL,2),(2034,0,0,0,'Litter Promenade 4',390,7,0,0,0,0,30,NULL,1),(2035,0,0,0,'Litter Promenade 3',450,7,0,0,0,0,36,NULL,1),(2036,0,0,0,'Litter Promenade 2',300,7,0,0,0,0,25,NULL,1),(2037,0,0,0,'Litter Promenade 1',400,7,0,0,0,0,25,NULL,2),(2038,0,0,0,'The Shelter',13590,7,0,0,0,0,560,NULL,31),(2039,0,0,0,'Straycat\'s Corner 6',300,7,0,0,0,0,25,NULL,1),(2040,0,0,0,'Straycat\'s Corner 5',760,7,0,0,0,0,48,NULL,2),(2042,0,0,0,'Rum Alley 3',330,7,0,0,0,0,28,NULL,1),(2043,0,0,0,'Straycat\'s Corner 1',300,7,0,0,0,0,25,NULL,1),(2044,0,0,0,'Rum Alley 2',300,7,0,0,0,0,25,NULL,1),(2045,0,0,0,'Rum Alley 1',510,7,0,0,0,0,36,NULL,1),(2046,0,0,0,'Smuggler Backyard 3',700,7,0,0,0,0,40,NULL,2),(2048,0,0,0,'Shady Trail 3',300,7,0,0,0,0,25,NULL,1),(2049,0,0,0,'Shady Trail 1',1150,7,0,0,0,0,48,NULL,5),(2050,0,0,0,'Shady Trail 2',490,7,0,0,0,0,30,NULL,2),(2051,0,0,0,'Smuggler Backyard 5',610,7,0,0,0,0,35,NULL,2),(2052,0,0,0,'Smuggler Backyard 4',390,7,0,0,0,0,30,NULL,1),(2053,0,0,0,'Smuggler Backyard 2',670,7,0,0,0,0,40,NULL,2),(2054,0,0,0,'Smuggler Backyard 1',670,7,0,0,0,0,40,NULL,2),(2055,0,0,0,'Sugar Street 2',2550,7,0,0,0,0,84,NULL,3),(2056,0,0,0,'Sugar Street 1',3000,7,0,0,0,0,84,NULL,3),(2057,0,0,0,'Sugar Street 3a',1650,7,0,0,0,0,54,NULL,3),(2058,0,0,0,'Sugar Street 3b',2050,7,0,0,0,0,60,NULL,3),(2059,0,0,0,'Harvester\'s Haven, Flat 01',950,7,0,0,0,0,36,NULL,2),(2060,0,0,0,'Harvester\'s Haven, Flat 03',950,7,0,0,0,0,30,NULL,2),(2061,0,0,0,'Harvester\'s Haven, Flat 05',950,7,0,0,0,0,30,NULL,2),(2062,0,0,0,'Harvester\'s Haven, Flat 02',950,7,0,0,0,0,36,NULL,2),(2063,0,0,0,'Harvester\'s Haven, Flat 04',950,7,0,0,0,0,30,NULL,2),(2064,0,0,0,'Harvester\'s Haven, Flat 06',950,7,0,0,0,0,30,NULL,2),(2065,0,0,0,'Harvester\'s Haven, Flat 07',950,7,0,0,0,0,30,NULL,2),(2066,0,0,0,'Harvester\'s Haven, Flat 09',950,7,0,0,0,0,30,NULL,2),(2067,0,0,0,'Harvester\'s Haven, Flat 11',950,7,0,0,0,0,36,NULL,2),(2068,0,0,0,'Harvester\'s Haven, Flat 12',950,7,0,0,0,0,36,NULL,2),(2069,0,0,0,'Harvester\'s Haven, Flat 10',950,7,0,0,0,0,30,NULL,2),(2070,0,0,0,'Harvester\'s Haven, Flat 08',950,7,0,0,0,0,30,NULL,2),(2071,0,0,0,'Marble Lane 4',6350,7,0,0,0,0,192,NULL,4),(2072,0,0,0,'Marble Lane 2',6415,7,0,0,0,0,200,NULL,3),(2073,0,0,0,'Marble Lane 3',8055,7,0,0,0,0,240,NULL,4),(2074,0,0,0,'Marble Lane 1',11060,7,0,0,0,0,320,NULL,6),(2075,0,0,0,'Ivy Cottage',30650,7,0,0,0,0,858,NULL,26),(2076,0,0,0,'Sugar Street 4d',750,7,0,0,0,0,24,NULL,2),(2077,0,0,0,'Sugar Street 4c',650,7,0,0,0,0,24,NULL,1),(2078,0,0,0,'Sugar Street 4b',950,7,0,0,0,0,36,NULL,2),(2079,0,0,0,'Sugar Street 4a',950,7,0,0,0,0,30,NULL,2),(2080,0,0,0,'Trader\'s Point 1',2200,7,0,0,0,0,77,NULL,2),(2081,0,0,0,'Mountain Hideout',15550,7,0,0,0,0,486,NULL,17),(2082,0,0,0,'Dark Mansion',17845,2,0,0,0,0,575,NULL,17),(2083,0,0,0,'Halls of the Adventurers',15380,2,0,0,0,0,518,NULL,18),(2084,0,0,0,'Castle of Greenshore',18860,2,0,0,0,0,600,NULL,12),(2085,0,0,0,'Greenshore Clanhall',10800,2,0,0,0,0,312,NULL,10),(2086,0,0,0,'Greenshore Village 1',2420,2,0,0,0,0,64,NULL,3),(2087,0,0,0,'Greenshore Village, Shop',1800,2,0,0,0,0,56,NULL,1),(2088,0,0,0,'Greenshore Village, Villa',8700,2,0,0,0,0,263,NULL,4),(2089,0,0,0,'Greenshore Village 2',780,2,0,0,0,0,30,NULL,1),(2090,0,0,0,'Greenshore Village 3',780,2,0,0,0,0,25,NULL,1),(2091,0,0,0,'Greenshore Village 5',780,2,0,0,0,0,30,NULL,1),(2092,0,0,0,'Greenshore Village 4',780,2,0,0,0,0,25,NULL,1),(2093,0,0,0,'Greenshore Village 6',4360,2,0,0,0,0,118,NULL,2),(2094,0,0,0,'Greenshore Village 7',1260,2,0,0,0,0,42,NULL,1),(2095,0,0,0,'The Tibianic',34500,2,0,0,0,0,862,NULL,22),(2097,0,0,0,'Fibula Village 5',1790,2,0,0,0,0,42,NULL,2),(2098,0,0,0,'Fibula Village 4',1790,2,0,0,0,0,42,NULL,2),(2099,0,0,0,'Fibula Village, Tower Flat',5105,2,0,0,0,0,161,NULL,2),(2100,0,0,0,'Fibula Village 1',845,2,0,0,0,0,30,NULL,1),(2101,0,0,0,'Fibula Village 2',845,2,0,0,0,0,30,NULL,1),(2102,0,0,0,'Fibula Village 3',3810,2,0,0,0,0,110,NULL,4),(2103,0,0,0,'Mercenary Tower',41955,2,0,0,0,0,996,NULL,26),(2104,0,0,0,'Guildhall of the Red Rose',27725,2,0,0,0,0,571,NULL,15),(2105,0,0,0,'Fibula Village, Bar',5235,2,0,0,0,0,122,NULL,2),(2106,0,0,0,'Fibula Village, Villa',11490,2,0,0,0,0,402,NULL,5),(2107,0,0,0,'Fibula Clanhall',11430,2,0,0,0,0,290,NULL,10),(2108,0,0,0,'Spiritkeep',19210,2,0,0,0,0,783,NULL,23),(2109,0,0,0,'Snake Tower',29720,2,0,0,0,0,1064,NULL,21),(2110,0,0,0,'Bloodhall',15270,2,0,0,0,0,569,NULL,15),(2111,0,0,0,'Senja Clanhall',10575,4,0,0,0,0,396,NULL,9),(2112,0,0,0,'Senja Village 2',765,4,0,0,0,0,36,NULL,1),(2113,0,0,0,'Senja Village 1a',765,4,0,0,0,0,36,NULL,1),(2114,0,0,0,'Senja Village 1b',1630,4,0,0,0,0,66,NULL,2),(2115,0,0,0,'Senja Village 4',765,4,0,0,0,0,30,NULL,1),(2116,0,0,0,'Senja Village 3',1765,4,0,0,0,0,72,NULL,2),(2117,0,0,0,'Senja Village 6b',765,4,0,0,0,0,30,NULL,1),(2118,0,0,0,'Senja Village 6a',765,4,0,0,0,0,30,NULL,1),(2119,0,0,0,'Senja Village 5',1225,4,0,0,0,0,48,NULL,2),(2120,0,0,0,'Senja Village 10',1485,4,0,0,0,0,72,NULL,1),(2121,0,0,0,'Senja Village 11',2620,4,0,0,0,0,96,NULL,2),(2122,0,0,0,'Senja Village 9',2575,4,0,0,0,0,103,NULL,2),(2123,0,0,0,'Senja Village 8',1675,4,0,0,0,0,57,NULL,2),(2124,0,0,0,'Senja Village 7',865,4,0,0,0,0,37,NULL,2),(2125,0,0,0,'Rosebud C',1340,4,0,0,0,0,70,NULL,0),(2127,0,0,0,'Rosebud A',1000,4,0,0,0,0,60,NULL,1),(2128,0,0,0,'Rosebud B',1000,4,0,0,0,0,60,NULL,1),(2129,0,0,0,'Nordic Stronghold',18400,4,0,0,0,0,718,NULL,21),(2130,0,0,0,'Northport Village 2',1475,4,0,0,0,0,40,NULL,2),(2131,0,0,0,'Northport Village 1',1475,4,0,0,0,0,48,NULL,2),(2132,0,0,0,'Northport Village 3',5435,4,0,0,0,0,178,NULL,2),(2133,0,0,0,'Northport Village 4',2630,4,0,0,0,0,81,NULL,2),(2134,0,0,0,'Northport Village 5',1805,4,0,0,0,0,56,NULL,2),(2135,0,0,0,'Northport Village 6',2135,4,0,0,0,0,64,NULL,2),(2136,0,0,0,'Seawatch',25010,4,0,0,0,0,749,NULL,19),(2137,0,0,0,'Northport Clanhall',9810,4,0,0,0,0,292,NULL,10),(2138,0,0,0,'Druids Retreat D',1180,4,0,0,0,0,54,NULL,2),(2139,0,0,0,'Druids Retreat A',1340,4,0,0,0,0,60,NULL,2),(2140,0,0,0,'Druids Retreat C',980,4,0,0,0,0,45,NULL,2),(2141,0,0,0,'Druids Retreat B',980,4,0,0,0,0,55,NULL,2),(2142,0,0,0,'Theater Avenue 14 (Shop)',2115,4,0,0,0,0,83,NULL,1),(2143,0,0,0,'Theater Avenue 12',955,4,0,0,0,0,28,NULL,2),(2144,0,0,0,'Theater Avenue 10',1090,4,0,0,0,0,45,NULL,2),(2145,0,0,0,'Theater Avenue 11c',585,4,0,0,0,0,24,NULL,1),(2146,0,0,0,'Theater Avenue 11b',585,4,0,0,0,0,24,NULL,1),(2147,0,0,0,'Theater Avenue 11a',1405,4,0,0,0,0,54,NULL,2),(2148,0,0,0,'Magician\'s Alley 1',1050,4,0,0,0,0,35,NULL,2),(2149,0,0,0,'Magician\'s Alley 1a',700,4,0,0,0,0,29,NULL,2),(2150,0,0,0,'Magician\'s Alley 1d',450,4,0,0,0,0,24,NULL,1),(2151,0,0,0,'Magician\'s Alley 1b',750,4,0,0,0,0,24,NULL,2),(2152,0,0,0,'Magician\'s Alley 1c',500,4,0,0,0,0,20,NULL,1),(2153,0,0,0,'Magician\'s Alley 5a',350,4,0,0,0,0,14,NULL,1),(2154,0,0,0,'Magician\'s Alley 5b',500,4,0,0,0,0,25,NULL,1),(2155,0,0,0,'Magician\'s Alley 5d',500,4,0,0,0,0,20,NULL,1),(2156,0,0,0,'Magician\'s Alley 5e',500,4,0,0,0,0,25,NULL,1),(2157,0,0,0,'Magician\'s Alley 5c',1150,4,0,0,0,0,35,NULL,2),(2158,0,0,0,'Magician\'s Alley 5f',1150,4,0,0,0,0,42,NULL,2),(2159,0,0,0,'Carlin Clanhall',10750,4,0,0,0,0,364,NULL,10),(2160,0,0,0,'Magician\'s Alley 4',2750,4,0,0,0,0,96,NULL,4),(2161,0,0,0,'Lonely Sea Side Hostel',10540,4,0,0,0,0,454,NULL,8),(2162,0,0,0,'Suntower',10080,4,0,0,0,0,450,NULL,7),(2163,0,0,0,'Harbour Lane 3',3560,4,0,0,0,0,145,NULL,3),(2164,0,0,0,'Harbour Flats, Flat 11',520,4,0,0,0,0,24,NULL,1),(2165,0,0,0,'Harbour Flats, Flat 13',520,4,0,0,0,0,24,NULL,1),(2166,0,0,0,'Harbour Flats, Flat 15',360,4,0,0,0,0,18,NULL,1),(2167,0,0,0,'Harbour Flats, Flat 17',360,4,0,0,0,0,24,NULL,1),(2168,0,0,0,'Harbour Flats, Flat 12',400,4,0,0,0,0,20,NULL,1),(2169,0,0,0,'Harbour Flats, Flat 14',400,4,0,0,0,0,20,NULL,1),(2170,0,0,0,'Harbour Flats, Flat 16',400,4,0,0,0,0,20,NULL,1),(2171,0,0,0,'Harbour Flats, Flat 18',400,4,0,0,0,0,25,NULL,1),(2172,0,0,0,'Harbour Flats, Flat 21',860,4,0,0,0,0,35,NULL,2),(2173,0,0,0,'Harbour Flats, Flat 22',980,4,0,0,0,0,45,NULL,2),(2174,0,0,0,'Harbour Flats, Flat 23',400,4,0,0,0,0,25,NULL,1),(2175,0,0,0,'Harbour Lane 2a (Shop)',680,4,0,0,0,0,32,NULL,0),(2176,0,0,0,'Harbour Lane 2b (Shop)',680,4,0,0,0,0,40,NULL,0),(2177,0,0,0,'Harbour Lane 1 (Shop)',1040,4,0,0,0,0,54,NULL,0),(2178,0,0,0,'Theater Avenue 6e',820,4,0,0,0,0,31,NULL,2),(2179,0,0,0,'Theater Avenue 6c',225,4,0,0,0,0,12,NULL,1),(2180,0,0,0,'Theater Avenue 6a',820,4,0,0,0,0,35,NULL,2),(2181,0,0,0,'Theater Avenue 6f',820,4,0,0,0,0,31,NULL,2),(2182,0,0,0,'Theater Avenue 6d',225,4,0,0,0,0,12,NULL,1),(2183,0,0,0,'Theater Avenue 6b',820,4,0,0,0,0,35,NULL,2),(2184,0,0,0,'East Lane 1a',2260,4,0,0,0,0,95,NULL,2),(2185,0,0,0,'East Lane 1b',1700,4,0,0,0,0,83,NULL,2),(2186,0,0,0,'East Lane 2',3900,4,0,0,0,0,172,NULL,2),(2191,0,0,0,'Northern Street 5',1980,4,0,0,0,0,94,NULL,2),(2192,0,0,0,'Northern Street 7',1700,4,0,0,0,0,83,NULL,2),(2193,0,0,0,'Northern Street 3a',740,4,0,0,0,0,31,NULL,2),(2194,0,0,0,'Northern Street 3b',780,4,0,0,0,0,36,NULL,2),(2195,0,0,0,'Northern Street 1c',740,4,0,0,0,0,31,NULL,2),(2196,0,0,0,'Northern Street 1b',740,4,0,0,0,0,37,NULL,2),(2197,0,0,0,'Northern Street 1a',940,4,0,0,0,0,41,NULL,2),(2198,0,0,0,'Theater Avenue 7, Flat 06',315,4,0,0,0,0,20,NULL,1),(2199,0,0,0,'Theater Avenue 7, Flat 01',315,4,0,0,0,0,15,NULL,1),(2200,0,0,0,'Theater Avenue 7, Flat 05',405,4,0,0,0,0,20,NULL,1),(2201,0,0,0,'Theater Avenue 7, Flat 02',405,4,0,0,0,0,20,NULL,1),(2202,0,0,0,'Theater Avenue 7, Flat 04',495,4,0,0,0,0,20,NULL,1),(2203,0,0,0,'Theater Avenue 7, Flat 03',405,4,0,0,0,0,19,NULL,1),(2204,0,0,0,'Theater Avenue 7, Flat 14',495,4,0,0,0,0,20,NULL,1),(2205,0,0,0,'Theater Avenue 7, Flat 13',405,4,0,0,0,0,17,NULL,1),(2206,0,0,0,'Theater Avenue 7, Flat 15',405,4,0,0,0,0,19,NULL,1),(2207,0,0,0,'Theater Avenue 7, Flat 16',405,4,0,0,0,0,20,NULL,1),(2208,0,0,0,'Theater Avenue 7, Flat 11',495,4,0,0,0,0,23,NULL,1),(2209,0,0,0,'Theater Avenue 7, Flat 12',405,4,0,0,0,0,15,NULL,1),(2210,0,0,0,'Theater Avenue 8a',1270,4,0,0,0,0,50,NULL,2),(2211,0,0,0,'Theater Avenue 8b',1370,4,0,0,0,0,49,NULL,3),(2212,0,0,0,'Central Plaza 3',600,4,0,0,0,0,20,NULL,0),(2213,0,0,0,'Central Plaza 2',600,4,0,0,0,0,20,NULL,0),(2214,0,0,0,'Central Plaza 1',600,4,0,0,0,0,24,NULL,0),(2215,0,0,0,'Park Lane 1a',1220,4,0,0,0,0,53,NULL,2),(2216,0,0,0,'Park Lane 3a',1220,4,0,0,0,0,48,NULL,2),(2217,0,0,0,'Park Lane 1b',1380,4,0,0,0,0,64,NULL,2),(2218,0,0,0,'Park Lane 3b',1100,4,0,0,0,0,48,NULL,2),(2219,0,0,0,'Park Lane 4',980,4,0,0,0,0,42,NULL,2),(2220,0,0,0,'Park Lane 2',980,4,0,0,0,0,42,NULL,2),(2221,0,0,0,'Magician\'s Alley 8',1400,4,0,0,0,0,42,NULL,2),(2222,0,0,0,'Moonkeep',13020,4,0,0,0,0,522,NULL,16),(2225,0,0,0,'Castle, Basement, Flat 01',585,11,0,0,0,0,30,NULL,1),(2226,0,0,0,'Castle, Basement, Flat 02',585,11,0,0,0,0,20,NULL,1),(2227,0,0,0,'Castle, Basement, Flat 03',585,11,0,0,0,0,20,NULL,1),(2228,0,0,0,'Castle, Basement, Flat 04',585,11,0,0,0,0,20,NULL,1),(2229,0,0,0,'Castle, Basement, Flat 07',585,11,0,0,0,0,20,NULL,1),(2230,0,0,0,'Castle, Basement, Flat 08',585,11,0,0,0,0,20,NULL,1),(2231,0,0,0,'Castle, Basement, Flat 09',585,11,0,0,0,0,24,NULL,1),(2232,0,0,0,'Castle, Basement, Flat 06',585,11,0,0,0,0,24,NULL,1),(2233,0,0,0,'Castle, Basement, Flat 05',585,11,0,0,0,0,24,NULL,1),(2234,0,0,0,'Castle Shop 1',1890,11,0,0,0,0,67,NULL,1),(2235,0,0,0,'Castle Shop 2',1890,11,0,0,0,0,70,NULL,1),(2236,0,0,0,'Castle Shop 3',1890,11,0,0,0,0,67,NULL,1),(2237,0,0,0,'Castle, 4th Floor, Flat 09',720,11,0,0,0,0,28,NULL,1),(2238,0,0,0,'Castle, 4th Floor, Flat 08',945,11,0,0,0,0,42,NULL,1),(2239,0,0,0,'Castle, 4th Floor, Flat 06',945,11,0,0,0,0,36,NULL,1),(2240,0,0,0,'Castle, 4th Floor, Flat 07',720,11,0,0,0,0,30,NULL,1),(2241,0,0,0,'Castle, 4th Floor, Flat 05',765,11,0,0,0,0,30,NULL,1),(2242,0,0,0,'Castle, 4th Floor, Flat 04',585,11,0,0,0,0,25,NULL,1),(2243,0,0,0,'Castle, 4th Floor, Flat 03',585,11,0,0,0,0,30,NULL,1),(2244,0,0,0,'Castle, 4th Floor, Flat 02',765,11,0,0,0,0,30,NULL,1),(2245,0,0,0,'Castle, 4th Floor, Flat 01',585,11,0,0,0,0,30,NULL,1),(2246,0,0,0,'Castle, 3rd Floor, Flat 01',585,11,0,0,0,0,30,NULL,1),(2247,0,0,0,'Castle, 3rd Floor, Flat 02',765,11,0,0,0,0,30,NULL,1),(2248,0,0,0,'Castle, 3rd Floor, Flat 03',585,11,0,0,0,0,25,NULL,1),(2249,0,0,0,'Castle, 3rd Floor, Flat 05',765,11,0,0,0,0,30,NULL,1),(2250,0,0,0,'Castle, 3rd Floor, Flat 04',585,11,0,0,0,0,25,NULL,1),(2251,0,0,0,'Castle, 3rd Floor, Flat 06',1045,11,0,0,0,0,36,NULL,2),(2252,0,0,0,'Castle, 3rd Floor, Flat 07',720,11,0,0,0,0,30,NULL,1),(2253,0,0,0,'Castle Street 1',2900,11,0,0,0,0,112,NULL,3),(2254,0,0,0,'Castle Street 2',1495,11,0,0,0,0,56,NULL,2),(2255,0,0,0,'Castle Street 3',1765,11,0,0,0,0,56,NULL,2),(2256,0,0,0,'Castle Street 4',1765,11,0,0,0,0,64,NULL,2),(2257,0,0,0,'Castle Street 5',1765,11,0,0,0,0,61,NULL,2),(2258,0,0,0,'Edron Flats, Basement Flat 2',1540,11,0,0,0,0,48,NULL,2),(2259,0,0,0,'Edron Flats, Basement Flat 1',1540,11,0,0,0,0,48,NULL,2),(2260,0,0,0,'Edron Flats, Flat 01',400,11,0,0,0,0,20,NULL,1),(2261,0,0,0,'Edron Flats, Flat 02',860,11,0,0,0,0,28,NULL,2),(2262,0,0,0,'Edron Flats, Flat 03',400,11,0,0,0,0,20,NULL,1),(2263,0,0,0,'Edron Flats, Flat 04',400,11,0,0,0,0,20,NULL,1),(2264,0,0,0,'Edron Flats, Flat 06',400,11,0,0,0,0,20,NULL,1),(2265,0,0,0,'Edron Flats, Flat 05',400,11,0,0,0,0,20,NULL,1),(2266,0,0,0,'Edron Flats, Flat 07',400,11,0,0,0,0,20,NULL,1),(2267,0,0,0,'Edron Flats, Flat 08',400,11,0,0,0,0,20,NULL,1),(2268,0,0,0,'Edron Flats, Flat 11',400,11,0,0,0,0,25,NULL,1),(2269,0,0,0,'Edron Flats, Flat 12',400,11,0,0,0,0,25,NULL,1),(2270,0,0,0,'Edron Flats, Flat 14',400,11,0,0,0,0,25,NULL,1),(2271,0,0,0,'Edron Flats, Flat 13',400,11,0,0,0,0,25,NULL,1),(2272,0,0,0,'Edron Flats, Flat 16',400,11,0,0,0,0,20,NULL,1),(2273,0,0,0,'Edron Flats, Flat 15',400,11,0,0,0,0,20,NULL,1),(2274,0,0,0,'Edron Flats, Flat 18',400,11,0,0,0,0,20,NULL,1),(2275,0,0,0,'Edron Flats, Flat 17',400,11,0,0,0,0,20,NULL,1),(2276,0,0,0,'Edron Flats, Flat 22',400,11,0,0,0,0,25,NULL,1),(2277,0,0,0,'Edron Flats, Flat 21',860,11,0,0,0,0,40,NULL,2),(2278,0,0,0,'Edron Flats, Flat 24',400,11,0,0,0,0,20,NULL,1),(2279,0,0,0,'Edron Flats, Flat 23',400,11,0,0,0,0,25,NULL,1),(2280,0,0,0,'Edron Flats, Flat 26',400,11,0,0,0,0,20,NULL,1),(2281,0,0,0,'Edron Flats, Flat 27',400,11,0,0,0,0,20,NULL,1),(2282,0,0,0,'Edron Flats, Flat 28',400,11,0,0,0,0,20,NULL,1),(2283,0,0,0,'Edron Flats, Flat 25',400,11,0,0,0,0,20,NULL,1),(2284,0,0,0,'Central Circle 1',3020,11,0,0,0,0,119,NULL,2),(2285,0,0,0,'Central Circle 2',3300,11,0,0,0,0,109,NULL,2),(2286,0,0,0,'Central Circle 3',4160,11,0,0,0,0,147,NULL,5),(2287,0,0,0,'Central Circle 4',4160,11,0,0,0,0,147,NULL,5),(2288,0,0,0,'Central Circle 5',4160,11,0,0,0,0,161,NULL,5),(2289,0,0,0,'Central Circle 6 (Shop)',3980,11,0,0,0,0,182,NULL,2),(2290,0,0,0,'Central Circle 7 (Shop)',3980,11,0,0,0,0,161,NULL,2),(2291,0,0,0,'Central Circle 8 (Shop)',3980,11,0,0,0,0,166,NULL,2),(2292,0,0,0,'Central Circle 9a',940,11,0,0,0,0,42,NULL,2),(2293,0,0,0,'Central Circle 9b',940,11,0,0,0,0,44,NULL,2),(2294,0,0,0,'Sky Lane, Guild 1',21145,11,0,0,0,0,666,NULL,23),(2295,0,0,0,'Sky Lane, Guild 2',19300,11,0,0,0,0,672,NULL,14),(2296,0,0,0,'Sky Lane, Guild 3',17315,11,0,0,0,0,564,NULL,18),(2297,0,0,0,'Sky Lane, Sea Tower',4775,11,0,0,0,0,196,NULL,6),(2298,0,0,0,'Wood Avenue 6a',1450,11,0,0,0,0,56,NULL,2),(2299,0,0,0,'Wood Avenue 9a',1540,11,0,0,0,0,56,NULL,2),(2300,0,0,0,'Wood Avenue 10a',1540,11,0,0,0,0,64,NULL,2),(2301,0,0,0,'Wood Avenue 11',7205,11,0,0,0,0,253,NULL,6),(2302,0,0,0,'Wood Avenue 8',5960,11,0,0,0,0,198,NULL,3),(2303,0,0,0,'Wood Avenue 7',5960,11,0,0,0,0,191,NULL,3),(2304,0,0,0,'Wood Avenue 6b',1450,11,0,0,0,0,56,NULL,2),(2305,0,0,0,'Wood Avenue 9b',1495,11,0,0,0,0,56,NULL,2),(2306,0,0,0,'Wood Avenue 10b',1595,11,0,0,0,0,64,NULL,3),(2307,0,0,0,'Wood Avenue 5',1765,11,0,0,0,0,64,NULL,2),(2308,0,0,0,'Wood Avenue 4a',1495,11,0,0,0,0,56,NULL,2),(2309,0,0,0,'Wood Avenue 4b',1495,11,0,0,0,0,56,NULL,2),(2310,0,0,0,'Wood Avenue 4c',1765,11,0,0,0,0,56,NULL,2),(2311,0,0,0,'Wood Avenue 4',1765,11,0,0,0,0,64,NULL,2),(2312,0,0,0,'Wood Avenue 3',1765,11,0,0,0,0,56,NULL,2),(2313,0,0,0,'Wood Avenue 2',1765,11,0,0,0,0,49,NULL,2),(2314,0,0,0,'Wood Avenue 1',1765,11,0,0,0,0,64,NULL,2),(2315,0,0,0,'Magic Academy, Guild',12025,11,0,0,0,0,414,NULL,14),(2316,0,0,0,'Magic Academy, Flat 1',1465,11,0,0,0,0,57,NULL,3),(2317,0,0,0,'Magic Academy, Flat 2',1530,11,0,0,0,0,55,NULL,2),(2318,0,0,0,'Magic Academy, Flat 3',1430,11,0,0,0,0,55,NULL,1),(2319,0,0,0,'Magic Academy, Flat 4',1530,11,0,0,0,0,55,NULL,2),(2320,0,0,0,'Magic Academy, Flat 5',1430,11,0,0,0,0,55,NULL,1),(2321,0,0,0,'Magic Academy, Shop',1595,11,0,0,0,0,48,NULL,1),(2322,0,0,0,'Stonehome Village 1',1780,11,0,0,0,0,74,NULL,2),(2323,0,0,0,'Stonehome Flats, Flat 05',400,11,0,0,0,0,20,NULL,1),(2324,0,0,0,'Stonehome Flats, Flat 04',400,11,0,0,0,0,25,NULL,1),(2325,0,0,0,'Stonehome Flats, Flat 06',400,11,0,0,0,0,20,NULL,1),(2326,0,0,0,'Stonehome Flats, Flat 03',400,11,0,0,0,0,20,NULL,1),(2327,0,0,0,'Stonehome Flats, Flat 01',400,11,0,0,0,0,20,NULL,1),(2328,0,0,0,'Stonehome Flats, Flat 02',740,11,0,0,0,0,30,NULL,2),(2329,0,0,0,'Stonehome Flats, Flat 11',740,11,0,0,0,0,35,NULL,2),(2330,0,0,0,'Stonehome Flats, Flat 12',740,11,0,0,0,0,35,NULL,2),(2331,0,0,0,'Stonehome Flats, Flat 13',400,11,0,0,0,0,20,NULL,1),(2332,0,0,0,'Stonehome Flats, Flat 14',400,11,0,0,0,0,20,NULL,1),(2333,0,0,0,'Stonehome Flats, Flat 16',400,11,0,0,0,0,20,NULL,1),(2334,0,0,0,'Stonehome Flats, Flat 15',400,11,0,0,0,0,20,NULL,1),(2335,0,0,0,'Stonehome Village 2',640,11,0,0,0,0,35,NULL,1),(2336,0,0,0,'Stonehome Village 3',680,11,0,0,0,0,36,NULL,1),(2337,0,0,0,'Stonehome Village 4',940,11,0,0,0,0,42,NULL,2),(2338,0,0,0,'Stonehome Village 6',1300,11,0,0,0,0,55,NULL,2),(2339,0,0,0,'Stonehome Village 5',1140,11,0,0,0,0,56,NULL,2),(2340,0,0,0,'Stonehome Village 7',1140,11,0,0,0,0,49,NULL,2),(2341,0,0,0,'Stonehome Village 8',680,11,0,0,0,0,36,NULL,1),(2342,0,0,0,'Stonehome Village 9',680,11,0,0,0,0,36,NULL,1),(2343,0,0,0,'Stonehome Clanhall',8580,11,0,0,0,0,345,NULL,9),(2344,0,0,0,'Cormaya 1',1270,11,0,0,0,0,49,NULL,2),(2345,0,0,0,'Cormaya 2',3710,11,0,0,0,0,145,NULL,3),(2346,0,0,0,'Cormaya Flats, Flat 01',450,11,0,0,0,0,20,NULL,1),(2347,0,0,0,'Cormaya Flats, Flat 02',450,11,0,0,0,0,20,NULL,1),(2348,0,0,0,'Cormaya Flats, Flat 03',820,11,0,0,0,0,30,NULL,2),(2349,0,0,0,'Cormaya Flats, Flat 06',450,11,0,0,0,0,20,NULL,1),(2350,0,0,0,'Cormaya Flats, Flat 05',450,11,0,0,0,0,20,NULL,1),(2351,0,0,0,'Cormaya Flats, Flat 04',820,11,0,0,0,0,30,NULL,2),(2352,0,0,0,'Cormaya Flats, Flat 13',820,11,0,0,0,0,30,NULL,2),(2353,0,0,0,'Cormaya Flats, Flat 14',820,11,0,0,0,0,35,NULL,2),(2354,0,0,0,'Cormaya Flats, Flat 15',450,11,0,0,0,0,20,NULL,1),(2355,0,0,0,'Cormaya Flats, Flat 16',450,11,0,0,0,0,20,NULL,1),(2356,0,0,0,'Cormaya Flats, Flat 11',450,11,0,0,0,0,20,NULL,1),(2357,0,0,0,'Cormaya Flats, Flat 12',450,11,0,0,0,0,20,NULL,1),(2358,0,0,0,'Cormaya 3',2035,11,0,0,0,0,72,NULL,2),(2359,0,0,0,'Castle of the White Dragon',25110,11,0,0,0,0,761,NULL,19),(2360,0,0,0,'Cormaya 4',1720,11,0,0,0,0,63,NULL,2),(2361,0,0,0,'Cormaya 5',4250,11,0,0,0,0,167,NULL,3),(2362,0,0,0,'Cormaya 6',2395,11,0,0,0,0,84,NULL,2),(2363,0,0,0,'Cormaya 7',2395,11,0,0,0,0,84,NULL,2),(2364,0,0,0,'Cormaya 8',2710,11,0,0,0,0,113,NULL,2),(2365,0,0,0,'Cormaya 9b',2620,11,0,0,0,0,88,NULL,2),(2366,0,0,0,'Cormaya 9a',1225,11,0,0,0,0,48,NULL,2),(2367,0,0,0,'Cormaya 9c',1225,11,0,0,0,0,48,NULL,2),(2368,0,0,0,'Cormaya 9d',2620,11,0,0,0,0,88,NULL,2),(2369,0,0,0,'Cormaya 10',3800,11,0,0,0,0,140,NULL,3),(2370,0,0,0,'Cormaya 11',2035,11,0,0,0,0,72,NULL,2),(2371,0,0,0,'Demon Tower',3340,2,0,0,0,0,127,NULL,2),(2372,0,0,0,'Nautic Observer',6540,4,0,0,0,0,300,NULL,4),(2373,0,0,0,'Riverspring',19450,3,0,0,0,0,565,NULL,18),(2374,0,0,0,'House of Recreation',22540,4,0,0,0,0,702,NULL,16),(2375,0,0,0,'Valorous Venore',14435,1,0,0,0,0,496,NULL,9),(2376,0,0,0,'Ab\'Dendriel Clanhall',14850,5,0,0,0,0,405,NULL,10),(2377,0,0,0,'Castle of the Winds',23885,5,0,0,0,0,842,NULL,18),(2378,0,0,0,'The Hideout',20800,5,0,0,0,0,597,NULL,20),(2379,0,0,0,'Shadow Towers',21800,5,0,0,0,0,750,NULL,18),(2380,0,0,0,'Hill Hideout',13950,3,0,0,0,0,346,NULL,15),(2381,0,0,0,'Meriana Beach',8230,7,0,0,0,0,184,NULL,3),(2382,0,0,0,'Darashia 8, Flat 01',2485,10,0,0,0,0,80,NULL,2),(2383,0,0,0,'Darashia 8, Flat 02',3385,10,0,0,0,0,114,NULL,2),(2384,0,0,0,'Darashia 8, Flat 03',4700,10,0,0,0,0,171,NULL,3),(2385,0,0,0,'Darashia 8, Flat 04',2845,10,0,0,0,0,90,NULL,2),(2386,0,0,0,'Darashia 8, Flat 05',2665,10,0,0,0,0,85,NULL,2),(2387,0,0,0,'Darashia, Eastern Guildhall',12660,10,0,0,0,0,444,NULL,16),(2388,0,0,0,'Theater Avenue 5a',450,4,0,0,0,0,20,NULL,1),(2389,0,0,0,'Theater Avenue 5b',450,4,0,0,0,0,19,NULL,1),(2390,0,0,0,'Theater Avenue 5c',450,4,0,0,0,0,16,NULL,1),(2391,0,0,0,'Theater Avenue 5d',450,4,0,0,0,0,16,NULL,1),(2392,0,0,0,'Outlaw Camp 1',1660,3,0,0,0,0,52,NULL,2),(2393,0,0,0,'Outlaw Camp 2',280,3,0,0,0,0,12,NULL,1),(2394,0,0,0,'Outlaw Camp 3',740,3,0,0,0,0,27,NULL,2),(2395,0,0,0,'Outlaw Camp 4',200,3,0,0,0,0,9,NULL,1),(2396,0,0,0,'Outlaw Camp 5',200,3,0,0,0,0,9,NULL,1),(2397,0,0,0,'Outlaw Camp 6',200,3,0,0,0,0,9,NULL,1),(2398,0,0,0,'Outlaw Camp 7',780,3,0,0,0,0,27,NULL,2),(2399,0,0,0,'Outlaw Camp 8',280,3,0,0,0,0,12,NULL,1),(2400,0,0,0,'Outlaw Camp 9',200,3,0,0,0,0,9,NULL,1),(2401,0,0,0,'Outlaw Camp 10',200,3,0,0,0,0,9,NULL,1),(2402,0,0,0,'Outlaw Camp 11',200,3,0,0,0,0,9,NULL,1),(2404,0,0,0,'Outlaw Camp 12 (Shop)',280,3,0,0,0,0,7,NULL,0),(2405,0,0,0,'Outlaw Camp 13 (Shop)',280,3,0,0,0,0,7,NULL,0),(2406,0,0,0,'Outlaw Camp 14 (Shop)',640,3,0,0,0,0,16,NULL,0),(2407,0,0,0,'Open-Air Theatre',2700,2,0,0,0,0,60,NULL,1),(2408,0,0,0,'The Lair',7625,1,0,0,0,0,165,NULL,3),(2409,0,0,0,'Upper Barracks 2',210,3,0,0,0,0,13,NULL,1),(2410,0,0,0,'Upper Barracks 3',210,3,0,0,0,0,13,NULL,1),(2411,0,0,0,'Upper Barracks 4',210,3,0,0,0,0,14,NULL,1),(2412,0,0,0,'Upper Barracks 5',210,3,0,0,0,0,12,NULL,1),(2413,0,0,0,'Upper Barracks 6',210,3,0,0,0,0,12,NULL,1),(2414,0,0,0,'Upper Barracks 7',210,3,0,0,0,0,12,NULL,1),(2415,0,0,0,'Upper Barracks 8',210,3,0,0,0,0,13,NULL,1),(2416,0,0,0,'Upper Barracks 9',210,3,0,0,0,0,13,NULL,1),(2417,0,0,0,'Upper Barracks 10',210,3,0,0,0,0,13,NULL,1),(2418,0,0,0,'Upper Barracks 11',210,3,0,0,0,0,14,NULL,1),(2419,0,0,0,'Upper Barracks 12',210,3,0,0,0,0,12,NULL,1),(2420,0,0,0,'Low Waters Observatory',17165,9,0,0,0,0,721,NULL,5),(2421,0,0,0,'Eastern House of Tranquility',11120,14,0,0,0,0,356,NULL,5),(2422,0,0,0,'Mammoth House',9300,12,0,0,0,0,218,NULL,6),(2427,0,0,0,'Lower Barracks 1',300,3,0,0,0,0,17,NULL,1),(2428,0,0,0,'Lower Barracks 2',300,3,0,0,0,0,16,NULL,1),(2429,0,0,0,'Lower Barracks 3',300,3,0,0,0,0,17,NULL,1),(2430,0,0,0,'Lower Barracks 4',300,3,0,0,0,0,16,NULL,1),(2431,0,0,0,'Lower Barracks 5',300,3,0,0,0,0,17,NULL,1),(2432,0,0,0,'Lower Barracks 6',300,3,0,0,0,0,15,NULL,1),(2433,0,0,0,'Lower Barracks 7',300,3,0,0,0,0,17,NULL,1),(2434,0,0,0,'Lower Barracks 8',300,3,0,0,0,0,16,NULL,1),(2435,0,0,0,'Lower Barracks 9',300,3,0,0,0,0,17,NULL,1),(2436,0,0,0,'Lower Barracks 10',300,3,0,0,0,0,16,NULL,1),(2437,0,0,0,'Lower Barracks 11',300,3,0,0,0,0,17,NULL,1),(2438,0,0,0,'Lower Barracks 12',300,3,0,0,0,0,16,NULL,1),(2439,0,0,0,'Lower Barracks 13',300,3,0,0,0,0,17,NULL,1),(2440,0,0,0,'Lower Barracks 14',300,3,0,0,0,0,16,NULL,1),(2441,0,0,0,'Lower Barracks 15',300,3,0,0,0,0,17,NULL,1),(2442,0,0,0,'Lower Barracks 16',300,3,0,0,0,0,16,NULL,1),(2443,0,0,0,'Lower Barracks 17',300,3,0,0,0,0,17,NULL,1),(2444,0,0,0,'Lower Barracks 18',300,3,0,0,0,0,16,NULL,1),(2445,0,0,0,'Lower Barracks 19',300,3,0,0,0,0,17,NULL,1),(2446,0,0,0,'Lower Barracks 20',300,3,0,0,0,0,16,NULL,1),(2447,0,0,0,'Lower Barracks 21',300,3,0,0,0,0,17,NULL,1),(2448,0,0,0,'Lower Barracks 22',300,3,0,0,0,0,16,NULL,1),(2449,0,0,0,'Lower Barracks 23',300,3,0,0,0,0,17,NULL,1),(2450,0,0,0,'Lower Barracks 24',300,3,0,0,0,0,16,NULL,1),(2451,0,0,0,'The Farms 4',1530,3,0,0,0,0,36,NULL,2),(2452,0,0,0,'Tunnel Gardens 1',2000,3,0,0,0,0,40,NULL,3),(2455,0,0,0,'Tunnel Gardens 2',2000,3,0,0,0,0,39,NULL,3),(2456,0,0,0,'The Yeah Beach Project',6525,7,0,0,0,0,183,NULL,3),(2460,0,0,0,'Hare\'s Den',7500,3,0,0,0,0,233,NULL,4),(2461,0,0,0,'Lost Cavern',14730,3,0,0,0,0,621,NULL,7),(2462,0,0,0,'Caveman Shelter',3780,14,0,0,0,0,92,NULL,4),(2463,0,0,0,'Old Sanctuary of God King Qjell',21940,28,0,0,0,0,854,NULL,6),(2464,0,0,0,'Wallside Lane 1',7590,33,0,0,0,0,295,NULL,4),(2465,0,0,0,'Wallside Residence',6680,33,0,0,0,0,223,NULL,4),(2466,0,0,0,'Wallside Lane 2',8445,33,0,0,0,0,294,NULL,4),(2467,0,0,0,'Antimony Lane 3',3665,33,0,0,0,0,126,NULL,3),(2468,0,0,0,'Antimony Lane 2',4745,33,0,0,0,0,159,NULL,3),(2469,0,0,0,'Vanward Flats B',7410,33,0,0,0,0,245,NULL,4),(2470,0,0,0,'Vanward Flats A',7410,33,0,0,0,0,222,NULL,4),(2471,0,0,0,'Bronze Brothers Bastion',35205,33,0,0,0,0,1181,NULL,15),(2472,0,0,0,'Antimony Lane 1',7105,33,0,0,0,0,242,NULL,5),(2473,0,0,0,'Rathleton Hills Estate',20685,33,0,0,0,0,646,NULL,13),(2474,0,0,0,'Rathleton Hills Residence',7085,33,0,0,0,0,228,NULL,3),(2475,0,0,0,'Rathleton Plaza 1',2890,33,0,0,0,0,95,NULL,2),(2476,0,0,0,'Rathleton Plaza 2',2620,33,0,0,0,0,99,NULL,2),(2478,0,0,0,'Antimony Lane 4',5150,33,0,0,0,0,176,NULL,3),(2480,0,0,0,'Old Heritage Estate',12075,33,0,0,0,0,402,NULL,7),(2481,0,0,0,'Cistern Ave',3745,33,0,0,0,0,173,NULL,2),(2482,0,0,0,'Rathleton Plaza 4',5005,33,0,0,0,0,193,NULL,2),(2483,0,0,0,'Rathleton Plaza 3',5735,33,0,0,0,0,193,NULL,3),(2488,0,0,0,'Thrarhor V e (Shop)',3000,9,0,0,0,0,36,NULL,1),(2491,0,0,0,'Isle of Solitude House',3000,31,0,0,0,0,529,NULL,14),(2492,0,0,0,'Marketplace 1',400000,63,0,0,0,0,147,NULL,1),(2493,0,0,0,'Marketplace 2',400000,63,0,0,0,0,166,NULL,2),(2495,0,0,0,'Quay 1',200000,63,0,0,0,0,191,NULL,4),(2496,0,0,0,'Quay 2',200000,63,0,0,0,0,148,NULL,2),(2497,0,0,0,'Wave Tower',400000,63,0,0,0,0,358,NULL,4),(2498,0,0,0,'Halls of Sun and Sea',1000000,63,0,0,0,0,611,NULL,11),(2500,0,0,0,'Holy Castle',0,65,0,0,0,0,3065,NULL,20);
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hunted_players`
--

DROP TABLE IF EXISTS `hunted_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hunted_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hunted_value` int(11) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `player_id` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hunted_players`
--

LOCK TABLES `hunted_players` WRITE;
/*!40000 ALTER TABLE `hunted_players` DISABLE KEYS */;
/*!40000 ALTER TABLE `hunted_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_bans`
--

DROP TABLE IF EXISTS `ip_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_bans` (
  `ip` int(10) unsigned NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL,
  PRIMARY KEY (`ip`),
  KEY `banned_by` (`banned_by`),
  CONSTRAINT `ip_bans_ibfk_1` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_bans`
--

LOCK TABLES `ip_bans` WRITE;
/*!40000 ALTER TABLE `ip_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_casts`
--

DROP TABLE IF EXISTS `live_casts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_casts` (
  `player_id` int(11) NOT NULL,
  `cast_name` varchar(255) NOT NULL,
  `password` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `spectators` smallint(6) DEFAULT 0,
  `version` int(11) DEFAULT 1220,
  UNIQUE KEY `player_id_2` (`player_id`),
  CONSTRAINT `live_casts_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_casts`
--

LOCK TABLES `live_casts` WRITE;
/*!40000 ALTER TABLE `live_casts` DISABLE KEYS */;
/*!40000 ALTER TABLE `live_casts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_history`
--

DROP TABLE IF EXISTS `market_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `expires_at` bigint(20) unsigned NOT NULL,
  `inserted` bigint(20) unsigned NOT NULL,
  `state` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`,`sale`),
  CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201750 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_history`
--

LOCK TABLES `market_history` WRITE;
/*!40000 ALTER TABLE `market_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_offers`
--

DROP TABLE IF EXISTS `market_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_offers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT 0,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sale` (`sale`,`itemtype`),
  KEY `created` (`created`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63544 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_offers`
--

LOCK TABLES `market_offers` WRITE;
/*!40000 ALTER TABLE `market_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_account_actions`
--

DROP TABLE IF EXISTS `myaac_account_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_account_actions` (
  `account_id` int(11) NOT NULL,
  `ip` int(10) unsigned NOT NULL DEFAULT 0,
  `ipv6` binary(16) NOT NULL DEFAULT '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `date` int(11) NOT NULL DEFAULT 0,
  `action` varchar(255) NOT NULL DEFAULT '',
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_account_actions`
--

LOCK TABLES `myaac_account_actions` WRITE;
/*!40000 ALTER TABLE `myaac_account_actions` DISABLE KEYS */;
INSERT INTO `myaac_account_actions` VALUES (8421,0,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1699120172,'Account created.'),(8421,0,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1699155551,'Created character <b>Bronson Otg</b>.'),(8421,0,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1699281202,'Created character <b>Bronson Newotg</b>.'),(8422,2976407275,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708004327,'Account created.'),(8422,2976407275,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708005094,'Created character <b>Teste Outfits</b>.'),(8422,2976407275,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708005209,'Created character <b>Teste Outfitstwo</b>.'),(8423,3049069827,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708114946,'Account created.'),(8423,3049069827,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708114946,'Created character <b>Zyzz</b>.'),(8424,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708441265,'Account created.'),(8424,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708441265,'Created character <b>Teste Xp</b>.'),(8424,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708444537,'Created character <b>Teste Xp</b>.'),(8425,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708445009,'Account created.'),(8425,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708445009,'Created character <b>Joninha Testexp</b>.'),(8425,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708452381,'Created character <b>Joninha Testecity</b>.'),(8426,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708454092,'Account created.'),(8426,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708454092,'Created character <b>Joninha Testexp</b>.'),(8426,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708457191,'Created character <b>Joninha Testestore</b>.'),(8426,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708459184,'Created character <b>Teste Elfoso</b>.'),(8427,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756261150,'Account created.'),(8427,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756261150,'Created character <b>Tolkien</b>.'),(8428,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756261744,'Account created.'),(8428,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756261744,'Created character <b>Stormy</b>.'),(8427,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756261797,'Created character <b>Shaman</b>.'),(8427,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756261805,'Changed comment for character <b>Tolkien</b>.'),(8429,0,'(Lª§ôˆº/®C„c',1756262068,'Account created.'),(8429,0,'(Lª§ôˆº/®C„c',1756262068,'Created character <b>Ozymandias</b>.'),(8430,0,'(Å˚Î°9cE‘œR',1756262175,'Account created.'),(8430,0,'(Å˚Î°9cE‘œR',1756262175,'Created character <b>Oppenheimer</b>.'),(8431,0,'(Å˚Î°9cE‘œR',1756262484,'Account created.'),(8431,0,'(Å˚Î°9cE‘œR',1756262484,'Created character <b>Iberdrola</b>.'),(8432,0,'(0p£\0—∂ıâé‰',1756263165,'Account created.'),(8432,0,'(0p£\0—∂ıâé‰',1756263165,'Created character <b>Rap Da Alma</b>.'),(8432,0,'(0p£\0—∂ıâé‰',1756263256,'Created character <b>Criador De Jutsu</b>.'),(8432,0,'(0p£\0—∂ıâé‰',1756263333,'Created character <b>Rulex Infernalist</b>.'),(8428,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756263636,'Created character <b>Greed</b>.'),(8428,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756263644,'Changed comment for character <b>Stormy</b>.'),(8433,1742224357,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756265492,'Account created.'),(8433,1742224357,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756265492,'Created character <b>Bfhbpqlyrps</b>.'),(8434,0,'&êuv\0]{Àöd¶¿',1756266439,'Account created.'),(8434,0,'&êuv\0]{Àöd¶¿',1756266439,'Created character <b>Shawty</b>.'),(8435,0,'( Ñ/C…+erö,ÿ',1756267098,'Account created.'),(8435,0,'( Ñ/C…+erö,ÿ',1756267098,'Created character <b>Gorbatchov</b>.'),(8436,245838301,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756267181,'Account created.'),(8436,245838301,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756267181,'Created character <b>Zpxysslfuczjgul</b>.'),(8437,3132318891,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756280119,'Account created.'),(8437,3132318891,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756280119,'Created character <b>Irjxoymj</b>.'),(8438,1743318850,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756285943,'Account created.'),(8438,1743318850,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756285943,'Created character <b>Rqbbnwrlmf</b>.'),(8439,2975588751,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756295300,'Account created.'),(8439,2975588751,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756295300,'Created character <b>Gandalf</b>.'),(8440,0,'(\0ÙòY\\åh!ãG–Ê',1756296418,'Account created.'),(8440,0,'(\0ÙòY\\åh!ãG–Ê',1756296418,'Created character <b>Usain Arrow</b>.'),(8441,2852160283,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756302672,'Account created.'),(8441,2852160283,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756302672,'Created character <b>Fuu Houhou</b>.'),(8442,755403103,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756303610,'Account created.'),(8442,755403103,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756303610,'Created character <b>Cacto</b>.'),(8443,0,'(MrßãCU·ÎÏ_˙¬',1756309007,'Account created.'),(8443,0,'(MrßãCU·ÎÏ_˙¬',1756309007,'Created character <b>Verde Orc</b>.'),(8444,0,'(MrßãCU·ÎÏ_˙¬',1756309055,'Account created.'),(8444,0,'(MrßãCU·ÎÏ_˙¬',1756309055,'Created character <b>Mais Quanto</b>.'),(8444,0,'(MrßãCU·ÎÏ_˙¬',1756309080,'Created character <b>Puro Suco</b>.'),(8445,0,'(MrßãCU·ÎÏ_˙¬',1756309133,'Account created.'),(8445,0,'(MrßãCU·ÎÏ_˙¬',1756309133,'Created character <b>Atira Muito</b>.'),(8445,0,'(MrßãCU·ÎÏ_˙¬',1756309225,'Created character <b>Atiira Muito</b>.'),(8445,0,'(MrßãCU·ÎÏ_˙¬',1756309260,'Created character <b>Muito Simples</b>.'),(8446,2594174612,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756310801,'Account created.'),(8446,2594174612,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756310801,'Created character <b>Efzzchiuzr</b>.'),(8447,1735049220,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756312025,'Account created.'),(8447,1735049220,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756312025,'Created character <b>Yozhobdxihrn</b>.');
/*!40000 ALTER TABLE `myaac_account_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_admin_menu`
--

DROP TABLE IF EXISTS `myaac_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `page` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `flags` int(11) NOT NULL DEFAULT 0,
  `enabled` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_admin_menu`
--

LOCK TABLES `myaac_admin_menu` WRITE;
/*!40000 ALTER TABLE `myaac_admin_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_bugtracker`
--

DROP TABLE IF EXISTS `myaac_bugtracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_bugtracker` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `text` text NOT NULL,
  `id` int(11) NOT NULL DEFAULT 0,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `reply` int(11) NOT NULL DEFAULT 0,
  `who` int(11) NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tag` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_bugtracker`
--

LOCK TABLES `myaac_bugtracker` WRITE;
/*!40000 ALTER TABLE `myaac_bugtracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_bugtracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_changelog`
--

DROP TABLE IF EXISTS `myaac_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_changelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` varchar(500) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - added, 2 - removed, 3 - changed, 4 - fixed',
  `where` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - server, 2 - site',
  `date` int(11) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_changelog`
--

LOCK TABLES `myaac_changelog` WRITE;
/*!40000 ALTER TABLE `myaac_changelog` DISABLE KEYS */;
INSERT INTO `myaac_changelog` VALUES (1,'MyAAC installed. (:',3,2,1699120131,0,0);
/*!40000 ALTER TABLE `myaac_changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_config`
--

DROP TABLE IF EXISTS `myaac_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `value` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_config`
--

LOCK TABLES `myaac_config` WRITE;
/*!40000 ALTER TABLE `myaac_config` DISABLE KEYS */;
INSERT INTO `myaac_config` VALUES (1,'database_version','33'),(2,'status_online',''),(3,'status_players','0'),(4,'status_playersMax','0'),(5,'status_lastCheck','1756312004'),(6,'status_uptime','117'),(7,'status_monsters','20597'),(8,'last_usage_report','1756260829'),(9,'views_counter','10220'),(10,'status_uptimeReadable','12 months, 31 days, 21h 01m'),(11,'status_motd','Bem vindo ao Middle Earth Server!'),(12,'status_mapAuthor','Jonathan Silva'),(13,'status_mapName','Bronson'),(14,'status_mapWidth','2293'),(15,'status_mapHeight','2048'),(16,'status_server','OTG-BR'),(17,'status_serverVersion','1.4'),(18,'status_clientVersion','12.35');
/*!40000 ALTER TABLE `myaac_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_faq`
--

DROP TABLE IF EXISTS `myaac_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` varchar(1020) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_faq`
--

LOCK TABLES `myaac_faq` WRITE;
/*!40000 ALTER TABLE `myaac_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_forum`
--

DROP TABLE IF EXISTS `myaac_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_post` int(11) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `section` int(11) NOT NULL DEFAULT 0,
  `replies` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `author_aid` int(11) NOT NULL DEFAULT 0,
  `author_guid` int(11) NOT NULL DEFAULT 0,
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL DEFAULT '',
  `post_smile` tinyint(1) NOT NULL DEFAULT 0,
  `post_html` tinyint(1) NOT NULL DEFAULT 0,
  `post_date` int(11) NOT NULL DEFAULT 0,
  `last_edit_aid` int(11) NOT NULL DEFAULT 0,
  `edit_date` int(11) NOT NULL DEFAULT 0,
  `post_ip` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `sticked` tinyint(1) NOT NULL DEFAULT 0,
  `closed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `section` (`section`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_forum`
--

LOCK TABLES `myaac_forum` WRITE;
/*!40000 ALTER TABLE `myaac_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_forum_boards`
--

DROP TABLE IF EXISTS `myaac_forum_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_forum_boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `guild` int(11) NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 0,
  `closed` tinyint(1) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_forum_boards`
--

LOCK TABLES `myaac_forum_boards` WRITE;
/*!40000 ALTER TABLE `myaac_forum_boards` DISABLE KEYS */;
INSERT INTO `myaac_forum_boards` VALUES (1,'News','News commenting',0,0,0,1,0),(2,'Trade','Trade offers.',1,0,0,0,0),(3,'Quests','Quest making.',2,0,0,0,0),(4,'Pictures','Your pictures.',3,0,0,0,0),(5,'Bug Report','Report bugs there.',4,0,0,0,0);
/*!40000 ALTER TABLE `myaac_forum_boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_gallery`
--

DROP TABLE IF EXISTS `myaac_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_gallery`
--

LOCK TABLES `myaac_gallery` WRITE;
/*!40000 ALTER TABLE `myaac_gallery` DISABLE KEYS */;
INSERT INTO `myaac_gallery` VALUES (1,'Demon','images/gallery/demon.jpg','images/gallery/demon_thumb.gif','MyAAC',1,0);
/*!40000 ALTER TABLE `myaac_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_menu`
--

DROP TABLE IF EXISTS `myaac_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `blank` tinyint(1) NOT NULL DEFAULT 0,
  `color` varchar(6) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `enabled` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_menu`
--

LOCK TABLES `myaac_menu` WRITE;
/*!40000 ALTER TABLE `myaac_menu` DISABLE KEYS */;
INSERT INTO `myaac_menu` VALUES (1,'kathrine','Latest News','news',0,'',1,0,1),(2,'kathrine','News Archive','news/archive',0,'',1,1,1),(3,'kathrine','Changelog','changelog',0,'',1,2,1),(4,'kathrine','Account Management','account/manage',0,'',2,0,1),(5,'kathrine','Create Account','account/create',0,'',2,1,1),(6,'kathrine','Lost Account?','account/lost',0,'',2,2,1),(7,'kathrine','Server Rules','rules',0,'',2,3,1),(8,'kathrine','Downloads','downloads',0,'',5,4,1),(9,'kathrine','Report Bug','bugtracker',0,'',2,5,1),(10,'kathrine','Who is Online?','online',0,'',3,0,1),(11,'kathrine','Characters','characters',0,'',3,1,1),(12,'kathrine','Guilds','guilds',0,'',3,2,1),(13,'kathrine','Highscores','highscores',0,'',3,3,1),(14,'kathrine','Last Deaths','lastkills',0,'',3,4,1),(15,'kathrine','Houses','houses',0,'',3,5,1),(16,'kathrine','Bans','bans',0,'',3,6,1),(17,'kathrine','Forum','forum',0,'',3,7,1),(18,'kathrine','Team','team',0,'',3,8,1),(19,'kathrine','Monsters','creatures',0,'',5,0,1),(20,'kathrine','Spells','spells',0,'',5,1,1),(21,'kathrine','Server Info','serverInfo',0,'',5,2,1),(22,'kathrine','Commands','commands',0,'',5,3,1),(23,'kathrine','Gallery','gallery',0,'',5,4,1),(24,'kathrine','Experience Table','experienceTable',0,'',5,5,1),(25,'kathrine','FAQ','faq',0,'',5,6,1),(26,'kathrine','Buy Points','points',0,'',6,0,1),(27,'kathrine','Shop Offer','gifts',0,'',6,1,1),(28,'kathrine','Shop History','gifts/history',0,'',6,2,1),(29,'tibiacom','Latest News','news',0,'',1,0,1),(30,'tibiacom','News Archive','news/archive',0,'',1,1,1),(31,'tibiacom','Changelog','changelog',0,'',1,2,1),(32,'tibiacom','Account Management','account/manage',0,'',2,0,1),(33,'tibiacom','Create Account','account/create',0,'',2,1,1),(34,'tibiacom','Lost Account?','account/lost',0,'',2,2,1),(35,'tibiacom','Server Rules','rules',0,'',2,3,1),(36,'tibiacom','Downloads','downloads',0,'',2,4,1),(37,'tibiacom','Report Bug','bugtracker',0,'',2,5,1),(38,'tibiacom','Characters','characters',0,'',3,0,1),(39,'tibiacom','Who Is Online?','online',0,'',3,1,1),(40,'tibiacom','Highscores','highscores',0,'',3,2,1),(41,'tibiacom','Last Kills','lastkills',0,'',3,3,1),(42,'tibiacom','Houses','houses',0,'',3,4,1),(43,'tibiacom','Guilds','guilds',0,'',3,5,1),(44,'tibiacom','Polls','polls',0,'',3,6,1),(45,'tibiacom','Bans','bans',0,'',3,7,1),(46,'tibiacom','Support List','team',0,'',3,8,1),(47,'tibiacom','Forum','forum',0,'',4,0,1),(48,'tibiacom','Creatures','creatures',0,'',5,0,1),(49,'tibiacom','Spells','spells',0,'',5,1,1),(50,'tibiacom','Commands','commands',0,'',5,2,1),(51,'tibiacom','Exp Stages','experienceStages',0,'',5,3,1),(52,'tibiacom','Gallery','gallery',0,'',5,4,1),(53,'tibiacom','Server Info','serverInfo',0,'',5,5,1),(54,'tibiacom','Experience Table','experienceTable',0,'',5,6,1),(55,'tibiacom','Buy Points','points',0,'',6,0,1),(56,'tibiacom','Shop Offer','gifts',0,'',6,1,1),(57,'tibiacom','Shop History','gifts/history',0,'',6,2,1),(116,'paxton1','√öltimas Not√≠cias','news',0,'',1,0,1),(117,'paxton1','Not√≠cias Arquivadas','news/archive',0,'',1,1,1),(118,'paxton1','Gerenciar Conta','account/manage',0,'',2,0,1),(119,'paxton1','Criar Conta','account/create',0,'',2,1,1),(120,'paxton1','Recuperar Conta','account/lost',0,'',2,2,1),(121,'paxton1','Regras','rules',0,'',2,3,1),(122,'paxton1','Personagens','characters',0,'',3,0,1),(123,'paxton1','Ranking','highscores',0,'',3,1,1),(124,'paxton1','√öltimas Mortes','lastkills',0,'',3,2,1),(125,'paxton1','Guildas','guilds',0,'',3,3,1),(126,'paxton1','Downloads','downloads',0,'',4,0,1),(127,'paxton1','Galeria','gallery',0,'',4,1,1),(128,'paxton1','Info. Server','serverinfo',0,'ffffff',4,2,1),(129,'paxton1','Buy Points','points',0,'',5,0,1),(130,'paxton1','Shop Offer','gifts',0,'',5,1,1),(131,'paxton1','Shop History','gifts/history',0,'',5,2,1);
/*!40000 ALTER TABLE `myaac_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_monsters`
--

DROP TABLE IF EXISTS `myaac_monsters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_monsters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL DEFAULT 0,
  `exp` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `speed_lvl` int(11) NOT NULL DEFAULT 1,
  `use_haste` tinyint(1) NOT NULL,
  `voices` text NOT NULL,
  `immunities` varchar(255) NOT NULL,
  `summonable` tinyint(1) NOT NULL,
  `convinceable` tinyint(1) NOT NULL,
  `race` varchar(255) NOT NULL,
  `loot` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_monsters`
--

LOCK TABLES `myaac_monsters` WRITE;
/*!40000 ALTER TABLE `myaac_monsters` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_monsters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_news`
--

DROP TABLE IF EXISTS `myaac_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - news, 2 - ticker, 3 - article',
  `date` int(11) NOT NULL DEFAULT 0,
  `category` tinyint(1) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_date` int(11) NOT NULL DEFAULT 0,
  `comments` varchar(50) NOT NULL DEFAULT '',
  `article_text` varchar(300) NOT NULL DEFAULT '',
  `article_image` varchar(100) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_news`
--

LOCK TABLES `myaac_news` WRITE;
/*!40000 ALTER TABLE `myaac_news` DISABLE KEYS */;
INSERT INTO `myaac_news` VALUES (5,'Bem vindo ao Middle Earth Server!','<p style=\"text-align: center;\">Boas vindas ao Middle Earth Server!</p>\r\n<p style=\"text-align: center;\">Para jogar em nosso servidor, voc&ecirc; precisar&aacute; do client disponivel na aba de downloads.<br /><br />&lt;download aqui&gt;<br /><br />Abaixo deixarei listados alguns dos principais sistemas do servidor, sendo eles:<br /><br /><img src=\"https://www.tibiawiki.com.br/images/f/f6/Dream_Matter.gif\" alt=\"Dream Matter.gif\" width=\"32\" height=\"32\" />Sistema de Upgrade (Refinamento), para saber mais visite:<br />&lt;site aqui&gt;</p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/f/f6/Dream_Matter.gif\" alt=\"Dream Matter.gif\" width=\"32\" height=\"32\" /> Sistema de Invas&otilde;es autom&aacute;ticas e aleat&oacute;rias, para saber mais visite:<br />&lt;site aqui&gt;</p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/f/f6/Dream_Matter.gif\" alt=\"Dream Matter.gif\" width=\"32\" height=\"32\" />Ilhas | Bosses, para saber mais visite:<br />&lt;site aqui&gt;<br /><br />E futuramente o sistema de tier e classifica&ccedil;&atilde;o ser&aacute; adicionado no servidor tamb&eacute;m.</p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/f/f4/Flames_of_the_Percht_Queen.gif\" alt=\"Flames of the Percht Queen.gif\" width=\"34\" height=\"34\" /> Novas criaturas foram adicionadas&nbsp;<img src=\"https://www.tibiawiki.com.br/images/f/f4/Flames_of_the_Percht_Queen.gif\" alt=\"Flames of the Percht Queen.gif\" width=\"34\" height=\"34\" /></p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/e/ef/Execowtioner.gif\" alt=\"Execowtioner.gif\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/7/70/Wardragon.gif\" alt=\"Wardragon.gif\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/d/d7/Dragolisk.gif\" alt=\"Dragolisk.gif\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/1/14/Mega_Dragon.gif\" alt=\"Mega Dragon.gif\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/7/79/Souleater.gif\" alt=\"Souleater.gif\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/1/1c/Moohtant.gif\" alt=\"Moohtant.gif\" width=\"64\" height=\"64\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../template/offlike/imagens/abertura.png\" /></p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: center;\">Quarta-Feira, as 19:30 ser&aacute; dada a largada!</p>\r\n<p style=\"text-align: center;\">Bom jogo a todos!</p>',1,1756262968,1,11934,11934,1756263095,'0','','images/news/announcement.jpg',0);
/*!40000 ALTER TABLE `myaac_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_news_categories`
--

DROP TABLE IF EXISTS `myaac_news_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_news_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `icon_id` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_news_categories`
--

LOCK TABLES `myaac_news_categories` WRITE;
/*!40000 ALTER TABLE `myaac_news_categories` DISABLE KEYS */;
INSERT INTO `myaac_news_categories` VALUES (1,'','',0,0),(2,'','',1,0),(3,'','',2,0),(4,'','',3,0),(5,'','',4,0);
/*!40000 ALTER TABLE `myaac_news_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_notepad`
--

DROP TABLE IF EXISTS `myaac_notepad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_notepad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_notepad`
--

LOCK TABLES `myaac_notepad` WRITE;
/*!40000 ALTER TABLE `myaac_notepad` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_notepad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_pages`
--

DROP TABLE IF EXISTS `myaac_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `body` text NOT NULL,
  `date` int(11) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `php` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - plain html, 1 - php',
  `enable_tinymce` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 - enabled, 0 - disabled',
  `access` tinyint(4) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_pages`
--

LOCK TABLES `myaac_pages` WRITE;
/*!40000 ALTER TABLE `myaac_pages` DISABLE KEYS */;
INSERT INTO `myaac_pages` VALUES (1,'downloads','Downloads','<p>&nbsp;</p>\n<p>&nbsp;</p>\n<div style=\"text-align: center;\">We\'re using official Tibia Client <strong>{{ config.client / 100 }}</strong><br />\n<p>Download Tibia Client <strong>{{ config.client / 100 }}</strong>&nbsp;for Windows <a href=\"https://drive.google.com/drive/folders/0B2-sMQkWYzhGSFhGVlY2WGk5czQ\" target=\"_blank\" rel=\"noopener\">HERE</a>.</p>\n<h2>IP Changer:</h2>\n<a href=\"https://static.otland.net/ipchanger.exe\" target=\"_blank\" rel=\"noopener\">HERE</a></div>',0,1,0,1,1,0),(2,'commands','Commands','<table style=\"border-collapse: collapse; width: 87.8471%; height: 57px;\" border=\"1\">\n<tbody>\n<tr style=\"height: 18px;\">\n<td style=\"width: 33.3333%; background-color: #505050; height: 18px;\"><span style=\"color: #ffffff;\"><strong>Words</strong></span></td>\n<td style=\"width: 33.3333%; background-color: #505050; height: 18px;\"><span style=\"color: #ffffff;\"><strong>Description</strong></span></td>\n</tr>\n<tr style=\"height: 18px; background-color: #f1e0c6;\">\n<td style=\"width: 33.3333%; height: 18px;\"><em>!example</em></td>\n<td style=\"width: 33.3333%; height: 18px;\">This is just an example</td>\n</tr>\n<tr style=\"height: 18px; background-color: #d4c0a1;\">\n<td style=\"width: 33.3333%; height: 18px;\"><em>!buyhouse</em></td>\n<td style=\"width: 33.3333%; height: 18px;\">Buy house you are looking at</td>\n</tr>\n<tr style=\"height: 18px; background-color: #f1e0c6;\">\n<td style=\"width: 33.3333%; height: 18px;\"><em>!aol</em></td>\n<td style=\"width: 33.3333%; height: 18px;\">Buy AoL</td>\n</tr>\n</tbody>\n</table>',0,1,0,1,1,0),(3,'rules_on_the_page','Rules','1. Names\na) Names which contain insulting (e.g. \"Bastard\"), racist (e.g. \"Nigger\"), extremely right-wing (e.g. \"Hitler\"), sexist (e.g. \"Bitch\") or offensive (e.g. \"Copkiller\") language.\nb) Names containing parts of sentences (e.g. \"Mike returns\"), nonsensical combinations of letters (e.g. \"Fgfshdsfg\") or invalid formattings (e.g. \"Thegreatknight\").\nc) Names that obviously do not describe a person (e.g. \"Christmastree\", \"Matrix\"), names of real life celebrities (e.g. \"Britney Spears\"), names that refer to real countries (e.g. \"Swedish Druid\"), names which were created to fake other players\' identities (e.g. \"Arieswer\" instead of \"Arieswar\") or official positions (e.g. \"System Admin\").\n\n2. Cheating\na) Exploiting obvious errors of the game (\"bugs\"), for instance to duplicate items. If you find an error you must report it to CipSoft immediately.\nb) Intentional abuse of weaknesses in the gameplay, for example arranging objects or players in a way that other players cannot move them.\nc) Using tools to automatically perform or repeat certain actions without any interaction by the player (\"macros\").\nd) Manipulating the client program or using additional software to play the game.\ne) Trying to steal other players\' account data (\"hacking\").\nf) Playing on more than one account at the same time (\"multi-clienting\").\ng) Offering account data to other players or accepting other players\' account data (\"account-trading/sharing\").\n\n3. Gamemasters\na) Threatening a gamemaster because of his or her actions or position as a gamemaster.\nb) Pretending to be a gamemaster or to have influence on the decisions of a gamemaster.\nc) Intentionally giving wrong or misleading information to a gamemaster concerning his or her investigations or making false reports about rule violations.\n\n4. Player Killing\na) Excessive killing of characters who are not marked with a \"skull\" on worlds which are not PvP-enforced. Please note that killing marked characters is not a reason for a banishment.\n\nA violation of the Tibia Rules may lead to temporary banishment of characters and accounts. In severe cases removal or modification of character skills, attributes and belongings, as well as the permanent removal of accounts without any compensation may be considered. The sanction is based on the seriousness of the rule violation and the previous record of the player. It is determined by the gamemaster imposing the banishment.\n\nThese rules may be changed at any time. All changes will be announced on the official website.',0,1,0,0,1,0);
/*!40000 ALTER TABLE `myaac_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_spells`
--

DROP TABLE IF EXISTS `myaac_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_spells` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spell` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `words` varchar(255) NOT NULL DEFAULT '',
  `category` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - attack, 2 - healing, 3 - summon, 4 - supply, 5 - support',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - instant, 2 - conjure, 3 - rune',
  `level` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `soul` tinyint(4) NOT NULL DEFAULT 0,
  `conjure_id` int(11) NOT NULL DEFAULT 0,
  `conjure_count` tinyint(4) NOT NULL DEFAULT 0,
  `reagent` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `premium` tinyint(1) NOT NULL DEFAULT 0,
  `vocations` varchar(100) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_spells`
--

LOCK TABLES `myaac_spells` WRITE;
/*!40000 ALTER TABLE `myaac_spells` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_spells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_videos`
--

DROP TABLE IF EXISTS `myaac_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `youtube_id` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_videos`
--

LOCK TABLES `myaac_videos` WRITE;
/*!40000 ALTER TABLE `myaac_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_visitors`
--

DROP TABLE IF EXISTS `myaac_visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_visitors` (
  `ip` varchar(45) NOT NULL,
  `lastvisit` int(11) NOT NULL DEFAULT 0,
  `page` varchar(2048) NOT NULL,
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_visitors`
--

LOCK TABLES `myaac_visitors` WRITE;
/*!40000 ALTER TABLE `myaac_visitors` DISABLE KEYS */;
INSERT INTO `myaac_visitors` VALUES ('181.189.30.34',1708612456,'/?guilds/desisto%20nunca'),('185.242.226.10',1708612030,'/'),('95.214.235.169',1708612478,'/');
/*!40000 ALTER TABLE `myaac_visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_weapons`
--

DROP TABLE IF EXISTS `myaac_weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myaac_weapons` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `vocations` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_weapons`
--

LOCK TABLES `myaac_weapons` WRITE;
/*!40000 ALTER TABLE `myaac_weapons` DISABLE KEYS */;
INSERT INTO `myaac_weapons` VALUES (1294,0,0,'[]'),(2111,0,0,'[]'),(2181,26,0,'{\"5\":true,\"27\":true,\"6\":true,\"28\":true,\"29\":true,\"7\":true}'),(2182,7,0,'{\"5\":true,\"27\":true}'),(2183,33,0,'{\"5\":true,\"27\":true,\"6\":true,\"28\":true,\"29\":true,\"7\":true}'),(2184,50,0,'{\"5\":true,\"27\":true,\"6\":true,\"28\":true,\"29\":true,\"7\":true}'),(2185,19,0,'{\"5\":true,\"27\":true,\"6\":true,\"28\":true,\"29\":true,\"7\":true}'),(2186,13,0,'{\"5\":true,\"27\":true,\"6\":true,\"28\":true,\"29\":true,\"7\":true}'),(2187,33,0,'{\"1\":true,\"2\":true,\"31\":true,\"32\":true,\"33\":true,\"3\":true}'),(2188,19,0,'{\"1\":true,\"2\":true,\"31\":true,\"32\":true,\"33\":true,\"3\":true}'),(2189,26,0,'{\"1\":true,\"2\":true,\"31\":true,\"32\":true,\"33\":true,\"3\":true}'),(2190,7,0,'{\"1\":true,\"31\":true}'),(2191,13,0,'{\"1\":true,\"2\":true,\"31\":true,\"32\":true,\"33\":true,\"3\":true}'),(2376,0,0,'[]'),(2377,20,0,'[]'),(2378,0,0,'[]'),(2379,0,0,'[]'),(2380,0,0,'[]'),(2381,20,0,'[]'),(2382,0,0,'[]'),(2384,0,0,'[]'),(2385,0,0,'[]'),(2386,0,0,'[]'),(2387,30,0,'[]'),(2388,0,0,'[]'),(2389,0,0,'[]'),(2390,150,0,'[]'),(2391,70,0,'[]'),(2392,40,0,'[]'),(2393,75,0,'[]'),(2394,0,0,'[]'),(2395,0,0,'[]'),(2396,0,0,'[]'),(2398,0,0,'[]'),(2399,0,0,'[]'),(2400,101,0,'[]'),(2402,0,0,'[]'),(2403,0,0,'[]'),(2404,0,0,'[]'),(2405,0,0,'[]'),(2406,0,0,'[]'),(2407,50,0,'[]'),(2408,115,0,'[]'),(2410,0,0,'[]'),(2411,0,0,'[]'),(2412,0,0,'[]'),(2413,0,0,'[]'),(2414,75,0,'[]'),(2415,150,0,'[]'),(2416,0,0,'[]'),(2417,0,0,'[]'),(2418,0,0,'[]'),(2419,0,0,'[]'),(2420,0,0,'[]'),(2421,101,0,'[]'),(2422,0,0,'[]'),(2423,0,0,'[]'),(2424,65,0,'[]'),(2426,55,0,'[]'),(2427,60,0,'[]'),(2428,0,0,'[]'),(2429,0,0,'[]'),(2430,35,0,'[]'),(2431,140,0,'[]'),(2432,55,0,'[]'),(2434,30,0,'[]'),(2435,30,0,'[]'),(2436,40,0,'[]'),(2439,0,0,'[]'),(2440,40,0,'[]'),(2442,0,0,'[]'),(2443,90,0,'[]'),(2444,90,0,'[]'),(2445,50,0,'[]'),(2446,75,0,'[]'),(2447,70,0,'[]'),(2448,0,0,'[]'),(2449,0,0,'[]'),(2450,0,0,'[]'),(2451,60,0,'[]'),(2452,115,0,'[]'),(2453,50,0,'{\"1\":true,\"2\":true,\"31\":true,\"32\":true,\"33\":true,\"3\":true}'),(2454,90,0,'[]'),(2543,0,0,'[]'),(2544,0,0,'[]'),(2545,0,0,'[]'),(2546,0,0,'[]'),(2547,55,0,'[]'),(3962,60,0,'[]'),(3963,0,0,'[]'),(3964,0,0,'[]'),(3965,20,0,'[]'),(3966,0,0,'[]'),(5803,150,0,'{\"11\":true,\"12\":true,\"45\":true}'),(5947,101,0,'{\"11\":true,\"12\":true,\"45\":true}'),(6528,200,0,'[]'),(6529,110,0,'[]'),(6553,85,0,'[]'),(7363,30,0,'[]'),(7364,20,0,'[]'),(7365,40,0,'[]'),(7366,0,0,'[]'),(7367,42,0,'[]'),(7368,80,0,'[]'),(7378,25,0,'[]'),(7379,75,0,'{\"1\":true,\"2\":true,\"31\":true,\"32\":true,\"33\":true,\"3\":true}'),(7380,40,0,'[]'),(7382,80,0,'[]'),(7387,60,0,'[]'),(7388,130,0,'[]'),(7391,90,0,'[]'),(7404,35,0,'[]'),(7405,220,0,'[]'),(7407,70,0,'[]'),(7408,32,0,'[]'),(7410,0,0,'{\"8\":true,\"30\":true}'),(7413,150,0,'[]'),(7414,200,0,'[]'),(7415,150,0,'[]'),(7419,90,0,'[]'),(7420,101,0,'[]'),(7424,200,0,'{\"3\":true,\"4\":true,\"33\":true,\"34\":true,\"7\":true,\"8\":true,\"29\":true,\"30\":true}'),(7427,80,0,'[]'),(7429,170,0,'{\"3\":true,\"4\":true,\"33\":true,\"34\":true,\"7\":true,\"8\":true,\"29\":true,\"30\":true}'),(7431,130,0,'[]'),(7434,220,0,'[]'),(7437,55,0,'[]'),(7438,35,0,'{\"36\":true,\"37\":true,\"38\":true,\"39\":true,\"45\":true}'),(7449,55,0,'[]'),(7451,101,0,'{\"3\":true,\"4\":true,\"33\":true,\"34\":true,\"7\":true,\"8\":true,\"29\":true,\"30\":true}'),(7452,90,0,'[]'),(7455,40,0,'[]'),(7776,220,0,'[]'),(7838,20,0,'[]'),(7839,20,0,'[]'),(7840,20,0,'[]'),(7850,20,0,'[]'),(7882,250,0,'[]'),(8852,200,0,'{\"11\":true,\"12\":true,\"45\":true}'),(8853,150,0,'{\"11\":true,\"12\":true,\"45\":true}'),(8854,90,0,'{\"36\":true,\"37\":true,\"38\":true,\"39\":true,\"45\":true}'),(8855,200,0,'{\"39\":true,\"45\":true}'),(8856,150,0,'{\"38\":true,\"39\":true,\"45\":true}'),(8910,150,0,'{\"3\":true,\"4\":true,\"33\":true,\"34\":true,\"7\":true,\"8\":true,\"29\":true,\"30\":true}'),(8921,22,0,'{\"1\":true,\"2\":true,\"31\":true,\"32\":true,\"33\":true,\"3\":true}'),(8924,200,0,'[]'),(8925,250,0,'[]'),(8930,65,0,'[]'),(8931,250,0,'[]'),(11307,170,0,'[]'),(11308,110,0,'[]'),(11323,70,0,'[]'),(12649,140,0,'[]'),(15404,160,0,'[]'),(15414,160,0,'[]'),(15643,180,0,'{\"39\":true,\"45\":true}'),(15644,220,0,'{\"12\":true,\"45\":true}'),(15648,30,0,'[]'),(15649,40,0,'[]'),(18303,0,0,'[]'),(18304,90,0,'[]'),(18435,90,0,'[]'),(18436,70,0,'[]'),(18437,70,0,'[]'),(18450,75,0,'[]'),(18451,180,0,'[]'),(18453,180,0,'{\"11\":true,\"12\":true,\"45\":true}'),(18465,180,0,'[]'),(23529,60,0,'[]'),(23839,1,0,'[]'),(29036,60,0,'[]'),(29057,150,0,'[]'),(29058,150,0,'[]'),(29059,120,0,'[]');
/*!40000 ALTER TABLE `myaac_weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsticker`
--

DROP TABLE IF EXISTS `newsticker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsticker` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `text` mediumtext NOT NULL,
  `icon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsticker`
--

LOCK TABLES `newsticker` WRITE;
/*!40000 ALTER TABLE `newsticker` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsticker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagseguro`
--

DROP TABLE IF EXISTS `pagseguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagseguro` (
  `date` datetime NOT NULL,
  `code` varchar(50) NOT NULL,
  `reference` varchar(200) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `lastEventDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagseguro`
--

LOCK TABLES `pagseguro` WRITE;
/*!40000 ALTER TABLE `pagseguro` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagseguro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagseguro_transactions`
--

DROP TABLE IF EXISTS `pagseguro_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagseguro_transactions` (
  `transaction_code` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `item_count` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `payment_amount` float DEFAULT 0,
  UNIQUE KEY `transaction_code` (`transaction_code`,`status`),
  KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagseguro_transactions`
--

LOCK TABLES `pagseguro_transactions` WRITE;
/*!40000 ALTER TABLE `pagseguro_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagseguro_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_transactions`
--

DROP TABLE IF EXISTS `paypal_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_transactions` (
  `id` int(11) NOT NULL,
  `payment_status` varchar(70) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `payer_email` varchar(255) NOT NULL DEFAULT '',
  `payer_id` varchar(255) NOT NULL DEFAULT '',
  `item_number1` varchar(255) NOT NULL DEFAULT '',
  `mc_gross` float NOT NULL,
  `mc_currency` varchar(5) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_transactions`
--

LOCK TABLES `paypal_transactions` WRITE;
/*!40000 ALTER TABLE `paypal_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_autoloot`
--

DROP TABLE IF EXISTS `player_autoloot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_autoloot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `autoloot_list` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2550 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_autoloot`
--

LOCK TABLES `player_autoloot` WRITE;
/*!40000 ALTER TABLE `player_autoloot` DISABLE KEYS */;
INSERT INTO `player_autoloot` VALUES (7,11910,'^'),(11,11920,''),(614,11919,''),(649,11922,''),(654,11923,''),(669,11924,''),(674,11925,''),(677,11915,''),(678,11912,''),(681,11914,''),(682,11911,''),(2206,11928,''),(2218,11926,''),(2228,11918,'ï'),(2229,11927,''),(2230,1,''),(2233,11929,'R	ÙGıGháM	j|Nl≥ôd'),(2251,11913,''),(2254,11933,''),(2260,4,''),(2261,3,''),(2262,11935,''),(2264,5,''),(2265,11931,''),(2266,2,''),(2267,11930,''),(2549,11934,'');
/*!40000 ALTER TABLE `player_autoloot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_autoloot_persist`
--

DROP TABLE IF EXISTS `player_autoloot_persist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_autoloot_persist` (
  `player_guid` mediumint(9) DEFAULT NULL,
  `cont_id` mediumint(9) DEFAULT NULL,
  `item_id` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_autoloot_persist`
--

LOCK TABLES `player_autoloot_persist` WRITE;
/*!40000 ALTER TABLE `player_autoloot_persist` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_autoloot_persist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_binary_items`
--

DROP TABLE IF EXISTS `player_binary_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_binary_items` (
  `player_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `items` longblob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`type`),
  CONSTRAINT `player_binary_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_binary_items`
--

LOCK TABLES `player_binary_items` WRITE;
/*!40000 ALTER TABLE `player_binary_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_binary_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_deaths`
--

DROP TABLE IF EXISTS `player_deaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_deaths` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) unsigned NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(1) NOT NULL DEFAULT 1,
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(1) NOT NULL DEFAULT 0,
  `unjustified` tinyint(1) NOT NULL DEFAULT 0,
  `mostdamage_unjustified` tinyint(1) NOT NULL DEFAULT 0,
  KEY `player_id` (`player_id`),
  KEY `killed_by` (`killed_by`),
  KEY `mostdamage_by` (`mostdamage_by`),
  CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_deaths`
--

LOCK TABLES `player_deaths` WRITE;
/*!40000 ALTER TABLE `player_deaths` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_deaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_depotitems`
--

DROP TABLE IF EXISTS `player_depotitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_depotitems`
--

LOCK TABLES `player_depotitems` WRITE;
/*!40000 ALTER TABLE `player_depotitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_depotitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_former_names`
--

DROP TABLE IF EXISTS `player_former_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_former_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `former_name` varchar(35) NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_former_names`
--

LOCK TABLES `player_former_names` WRITE;
/*!40000 ALTER TABLE `player_former_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_former_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_inboxitems`
--

DROP TABLE IF EXISTS `player_inboxitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_inboxitems`
--

LOCK TABLES `player_inboxitems` WRITE;
/*!40000 ALTER TABLE `player_inboxitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_inboxitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_items`
--

DROP TABLE IF EXISTS `player_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  KEY `player_id` (`player_id`),
  KEY `sid` (`sid`),
  CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_items`
--

LOCK TABLES `player_items` WRITE;
/*!40000 ALTER TABLE `player_items` DISABLE KEYS */;
INSERT INTO `player_items` VALUES (4,1,101,2461,1,''),(4,3,102,1988,1,'&'),(4,4,103,2652,1,''),(4,5,104,2512,1,''),(4,6,105,5907,1,''),(4,7,106,2649,1,''),(4,8,107,2642,1,''),(4,11,108,26052,1,'&'),(4,102,109,41243,1,''),(4,102,110,2120,1,''),(4,102,111,5710,1,''),(4,102,112,2789,10,'\n'),(3,1,101,2461,1,''),(3,3,102,1988,1,'&'),(3,4,103,2652,1,''),(3,5,104,2512,1,''),(3,6,105,2182,1,''),(3,7,106,2649,1,''),(3,8,107,2642,1,''),(3,11,108,26052,1,'&'),(3,102,109,2120,1,''),(3,102,110,5710,1,''),(3,102,111,2789,10,'\n'),(11935,1,101,2461,1,''),(11935,3,102,1988,1,'&'),(11935,4,103,2652,1,''),(11935,5,104,2512,1,''),(11935,6,105,2448,1,''),(11935,7,106,2649,1,''),(11935,8,107,2642,1,''),(11935,11,108,26052,1,''),(11935,102,109,5710,1,''),(11935,102,110,2120,1,''),(11935,102,111,2789,10,'\n'),(5,1,101,2461,1,''),(5,3,102,1988,1,'&'),(5,4,103,2652,1,''),(5,5,104,2512,1,''),(5,6,105,2376,1,''),(5,7,106,2649,1,''),(5,8,107,2642,1,''),(5,11,108,26052,1,'&'),(5,102,109,2789,10,'\n'),(5,102,110,5710,1,''),(5,102,111,2120,1,''),(11931,1,101,2461,1,''),(11931,3,102,1988,1,'&'),(11931,4,103,2652,1,''),(11931,5,104,2512,1,''),(11931,6,105,2386,1,''),(11931,7,106,2649,1,''),(11931,8,107,2642,1,''),(11931,11,108,26052,1,''),(11931,102,109,5710,1,''),(11931,102,110,2120,1,''),(11931,102,111,2789,10,'\n'),(2,1,101,2461,1,''),(2,3,102,1988,1,'&'),(2,4,103,2652,1,''),(2,5,104,2512,1,''),(2,6,105,2190,1,''),(2,7,106,2649,1,''),(2,8,107,2642,1,''),(2,11,108,26052,1,'&'),(2,102,109,2120,1,''),(2,102,110,5710,1,''),(2,102,111,2789,10,'\n'),(11930,1,101,2461,1,''),(11930,3,102,1988,1,'&'),(11930,4,103,2652,1,''),(11930,5,104,2512,1,''),(11930,6,105,5907,1,''),(11930,7,106,2649,1,''),(11930,8,107,2642,1,''),(11930,11,108,26052,1,''),(11930,102,109,41243,1,''),(11930,102,110,2789,10,'\n'),(11930,102,111,5710,1,''),(11930,102,112,2120,1,''),(11936,1,101,2461,1,''),(11936,3,102,1988,1,'&'),(11936,4,103,2652,1,''),(11936,5,104,2512,1,''),(11936,6,105,2190,1,''),(11936,7,106,2649,1,''),(11936,8,107,2642,1,''),(11936,11,108,26052,1,'&'),(11936,102,109,2120,1,''),(11936,102,110,5710,1,''),(11936,102,111,2789,10,'\n'),(11937,1,101,2461,1,''),(11937,3,102,1988,1,'&'),(11937,4,103,2652,1,''),(11937,5,104,2512,1,''),(11937,6,105,2376,1,''),(11937,7,106,2649,1,''),(11937,8,107,2642,1,''),(11937,11,108,26052,1,'&'),(11937,102,109,2789,10,'\n'),(11937,102,110,5710,1,''),(11937,102,111,2120,1,''),(11938,1,101,2461,1,''),(11938,3,102,1988,1,'&'),(11938,4,103,2652,1,''),(11938,5,104,2512,1,''),(11938,6,105,2182,1,''),(11938,7,106,2649,1,''),(11938,8,107,2642,1,''),(11938,11,108,26052,1,'&'),(11938,102,109,2120,1,''),(11938,102,110,5710,1,''),(11938,102,111,2789,10,'\n'),(11939,1,101,2461,1,''),(11939,3,102,1988,1,'&'),(11939,4,103,2652,1,''),(11939,5,104,2512,1,''),(11939,6,105,2182,1,''),(11939,7,106,2649,1,''),(11939,8,107,2642,1,''),(11939,11,108,26052,1,'&'),(11939,102,109,2120,1,''),(11939,102,110,5710,1,''),(11939,102,111,2789,10,'\n'),(11940,1,101,2461,1,''),(11940,3,102,1988,1,'&'),(11940,4,103,2652,1,''),(11940,5,104,2512,1,''),(11940,6,105,2190,1,''),(11940,7,106,2649,1,''),(11940,8,107,2642,1,''),(11940,11,108,26052,1,'&'),(11940,102,109,2120,1,''),(11940,102,110,5710,1,''),(11940,102,111,2789,10,'\n'),(11941,1,101,2461,1,''),(11941,3,102,1988,1,'&'),(11941,4,103,2652,1,''),(11941,5,104,2512,1,''),(11941,6,105,2386,1,''),(11941,7,106,2649,1,''),(11941,8,107,2642,1,''),(11941,11,108,26052,1,''),(11941,102,109,5710,1,''),(11941,102,110,2120,1,''),(11941,102,111,2789,10,'\n'),(11942,1,101,2461,1,''),(11942,3,102,1988,1,'&'),(11942,4,103,2652,1,''),(11942,5,104,2512,1,''),(11942,6,105,2386,1,''),(11942,7,106,2649,1,''),(11942,8,107,2642,1,''),(11942,11,108,26052,1,''),(11942,102,109,5710,1,''),(11942,102,110,2120,1,''),(11942,102,111,2789,10,'\n'),(11943,1,101,2461,1,''),(11943,3,102,1988,1,'&'),(11943,4,103,2652,1,''),(11943,5,104,2512,1,''),(11943,6,105,5907,1,''),(11943,7,106,2649,1,''),(11943,8,107,2642,1,''),(11943,11,108,26052,1,'&'),(11943,102,109,41243,1,''),(11943,102,110,2120,1,''),(11943,102,111,5710,1,''),(11943,102,112,2789,10,'\n'),(11944,1,101,2461,1,''),(11944,3,102,1988,1,'&'),(11944,4,103,2652,1,''),(11944,5,104,2512,1,''),(11944,6,105,2448,1,''),(11944,7,106,2649,1,''),(11944,8,107,2642,1,''),(11944,11,108,26052,1,''),(11944,102,109,5710,1,''),(11944,102,110,2120,1,''),(11944,102,111,2789,10,'\n'),(11945,1,101,2461,1,''),(11945,3,102,1988,1,'&'),(11945,4,103,2652,1,''),(11945,5,104,2512,1,''),(11945,6,105,2448,1,''),(11945,7,106,2649,1,''),(11945,8,107,2642,1,''),(11945,11,108,26052,1,''),(11945,102,109,5710,1,''),(11945,102,110,2120,1,''),(11945,102,111,2789,10,'\n'),(11946,1,101,2461,1,''),(11946,3,102,1988,1,'&'),(11946,4,103,2652,1,''),(11946,5,104,2512,1,''),(11946,6,105,5907,1,''),(11946,7,106,2649,1,''),(11946,8,107,2642,1,''),(11946,11,108,26052,1,''),(11946,102,109,41243,1,''),(11946,102,110,2789,10,'\n'),(11946,102,111,5710,1,''),(11946,102,112,2120,1,''),(11947,1,101,2461,1,''),(11947,3,102,1988,1,'&'),(11947,4,103,2652,1,''),(11947,5,104,2512,1,''),(11947,6,105,5907,1,''),(11947,7,106,2649,1,''),(11947,8,107,2642,1,''),(11947,11,108,26052,1,'&'),(11947,102,109,41243,1,''),(11947,102,110,2120,1,''),(11947,102,111,5710,1,''),(11947,102,112,2789,10,'\n'),(11948,1,101,2461,1,''),(11948,3,102,1988,1,'&'),(11948,4,103,2652,1,''),(11948,5,104,2512,1,''),(11948,6,105,2190,1,''),(11948,7,106,2649,1,''),(11948,8,107,2642,1,''),(11948,11,108,26052,1,'&'),(11948,102,109,2120,1,''),(11948,102,110,5710,1,''),(11948,102,111,2789,10,'\n'),(11949,1,101,2461,1,''),(11949,3,102,1988,1,'&'),(11949,4,103,2652,1,''),(11949,5,104,2512,1,''),(11949,6,105,5907,1,''),(11949,7,106,2649,1,''),(11949,8,107,2642,1,''),(11949,11,108,26052,1,''),(11949,102,109,41243,1,''),(11949,102,110,2789,10,'\n'),(11949,102,111,5710,1,''),(11949,102,112,2120,1,''),(11950,1,101,2461,1,''),(11950,3,102,1988,1,'&'),(11950,4,103,2652,1,''),(11950,5,104,2512,1,''),(11950,6,105,5907,1,''),(11950,7,106,2649,1,''),(11950,8,107,2642,1,''),(11950,11,108,26052,1,''),(11950,102,109,41243,1,''),(11950,102,110,2789,10,'\n'),(11950,102,111,5710,1,''),(11950,102,112,2120,1,''),(11951,1,101,2461,1,''),(11951,3,102,1988,1,'&'),(11951,4,103,2652,1,''),(11951,5,104,2512,1,''),(11951,6,105,5907,1,''),(11951,7,106,2649,1,''),(11951,8,107,2642,1,''),(11951,11,108,26052,1,''),(11951,102,109,41243,1,''),(11951,102,110,2789,10,'\n'),(11951,102,111,5710,1,''),(11951,102,112,2120,1,''),(11952,1,101,2461,1,''),(11952,3,102,1988,1,'&'),(11952,4,103,2652,1,''),(11952,5,104,2512,1,''),(11952,6,105,2190,1,''),(11952,7,106,2649,1,''),(11952,8,107,2642,1,''),(11952,11,108,26052,1,'&'),(11952,102,109,2120,1,''),(11952,102,110,5710,1,''),(11952,102,111,2789,10,'\n'),(11953,1,101,2461,1,''),(11953,3,102,1988,1,'&'),(11953,4,103,2652,1,''),(11953,5,104,2512,1,''),(11953,6,105,5907,1,''),(11953,7,106,2649,1,''),(11953,8,107,2642,1,''),(11953,11,108,26052,1,''),(11953,102,109,41243,1,''),(11953,102,110,2789,10,'\n'),(11953,102,111,5710,1,''),(11953,102,112,2120,1,''),(11954,1,101,2461,1,''),(11954,3,102,1988,1,'&'),(11954,4,103,2652,1,''),(11954,5,104,2512,1,''),(11954,6,105,2182,1,''),(11954,7,106,2649,1,''),(11954,8,107,2642,1,''),(11954,11,108,26052,1,'&'),(11954,102,109,2120,1,''),(11954,102,110,5710,1,''),(11954,102,111,2789,10,'\n'),(11955,1,101,2461,1,''),(11955,3,102,1988,1,'&'),(11955,4,103,2652,1,''),(11955,5,104,2512,1,''),(11955,6,105,2386,1,''),(11955,7,106,2649,1,''),(11955,8,107,2642,1,''),(11955,11,108,26052,1,''),(11955,102,109,5710,1,''),(11955,102,110,2120,1,''),(11955,102,111,2789,10,'\n'),(11956,1,101,2461,1,''),(11956,3,102,1988,1,'&'),(11956,4,103,2652,1,''),(11956,5,104,2512,1,''),(11956,6,105,2386,1,''),(11956,7,106,2649,1,''),(11956,8,107,2642,1,''),(11956,11,108,26052,1,''),(11956,102,109,5710,1,''),(11956,102,110,2120,1,''),(11956,102,111,2789,10,'\n'),(11957,1,101,2461,1,''),(11957,3,102,1988,1,'&'),(11957,4,103,2652,1,''),(11957,5,104,2512,1,''),(11957,6,105,2448,1,''),(11957,7,106,2649,1,''),(11957,8,107,2642,1,''),(11957,11,108,26052,1,''),(11957,102,109,5710,1,''),(11957,102,110,2120,1,''),(11957,102,111,2789,10,'\n'),(11958,1,101,2461,1,''),(11958,3,102,1988,1,'&'),(11958,4,103,2652,1,''),(11958,5,104,2512,1,''),(11958,6,105,2448,1,''),(11958,7,106,2649,1,''),(11958,8,107,2642,1,''),(11958,11,108,26052,1,''),(11958,102,109,5710,1,''),(11958,102,110,2120,1,''),(11958,102,111,2789,10,'\n'),(11959,1,101,2461,1,''),(11959,3,102,1988,1,'&'),(11959,4,103,2652,1,''),(11959,5,104,2512,1,''),(11959,6,105,2448,1,''),(11959,7,106,2649,1,''),(11959,8,107,2642,1,''),(11959,11,108,26052,1,''),(11959,102,109,5710,1,''),(11959,102,110,2120,1,''),(11959,102,111,2789,10,'\n'),(11960,1,101,2461,1,''),(11960,3,102,1988,1,'&'),(11960,4,103,2652,1,''),(11960,5,104,2512,1,''),(11960,6,105,5907,1,''),(11960,7,106,2649,1,''),(11960,8,107,2642,1,''),(11960,11,108,26052,1,'&'),(11960,102,109,41243,1,''),(11960,102,110,2120,1,''),(11960,102,111,5710,1,''),(11960,102,112,2789,10,'\n'),(11961,1,101,2461,1,''),(11961,3,102,1988,1,'&'),(11961,4,103,2652,1,''),(11961,5,104,2512,1,''),(11961,6,105,5907,1,''),(11961,7,106,2649,1,''),(11961,8,107,2642,1,''),(11961,11,108,26052,1,'&'),(11961,102,109,41243,1,''),(11961,102,110,2120,1,''),(11961,102,111,5710,1,''),(11961,102,112,2789,10,'\n'),(11962,1,101,2461,1,''),(11962,3,102,1988,1,'&'),(11962,4,103,2652,1,''),(11962,5,104,2512,1,''),(11962,6,105,5907,1,''),(11962,7,106,2649,1,''),(11962,8,107,2642,1,''),(11962,11,108,26052,1,''),(11962,102,109,41243,1,''),(11962,102,110,2789,10,'\n'),(11962,102,111,5710,1,''),(11962,102,112,2120,1,''),(11963,1,101,2461,1,''),(11963,3,102,1988,1,'&'),(11963,4,103,2652,1,''),(11963,5,104,2512,1,''),(11963,6,105,5907,1,''),(11963,7,106,2649,1,''),(11963,8,107,2642,1,''),(11963,11,108,26052,1,''),(11963,102,109,41243,1,''),(11963,102,110,2789,10,'\n'),(11963,102,111,5710,1,''),(11963,102,112,2120,1,''),(11934,1,101,2471,1,''),(11934,2,102,2173,1,'\0'),(11934,3,103,10521,1,'&'),(11934,4,104,9776,1,''),(11934,5,105,6433,1,''),(11934,6,106,2400,1,'?B\0'),(11934,7,107,9777,1,''),(11934,8,108,2646,1,''),(11934,9,109,2123,1,''),(11934,10,110,33045,1,''),(11934,11,111,26052,1,''),(11934,103,112,7429,1,''),(11934,103,113,2152,99,'c'),(11934,103,114,2160,99,'c'),(11934,111,115,26377,1,'');
/*!40000 ALTER TABLE `player_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_kills`
--

DROP TABLE IF EXISTS `player_kills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_kills` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) unsigned NOT NULL DEFAULT 0,
  `target` int(11) NOT NULL,
  `unavenged` tinyint(1) NOT NULL DEFAULT 0,
  KEY `player_kills_ibfk_1` (`player_id`),
  KEY `player_kills_ibfk_2` (`target`),
  CONSTRAINT `player_kills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  CONSTRAINT `player_kills_ibfk_2` FOREIGN KEY (`target`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_kills`
--

LOCK TABLES `player_kills` WRITE;
/*!40000 ALTER TABLE `player_kills` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_kills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_misc`
--

DROP TABLE IF EXISTS `player_misc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_misc` (
  `player_id` int(11) NOT NULL,
  `info` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_misc`
--

LOCK TABLES `player_misc` WRITE;
/*!40000 ALTER TABLE `player_misc` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_misc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_namelocks`
--

DROP TABLE IF EXISTS `player_namelocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL,
  PRIMARY KEY (`player_id`),
  KEY `namelocked_by` (`namelocked_by`),
  CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `player_namelocks_ibfk_2` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_namelocks`
--

LOCK TABLES `player_namelocks` WRITE;
/*!40000 ALTER TABLE `player_namelocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_namelocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_prey`
--

DROP TABLE IF EXISTS `player_prey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_prey` (
  `player_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mindex` smallint(6) NOT NULL,
  `mcolumn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_prey`
--

LOCK TABLES `player_prey` WRITE;
/*!40000 ALTER TABLE `player_prey` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_prey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_preydata`
--

DROP TABLE IF EXISTS `player_preydata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_preydata` (
  `player_id` int(11) NOT NULL,
  `data` blob NOT NULL,
  PRIMARY KEY (`player_id`),
  CONSTRAINT `player_preydata_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_preydata`
--

LOCK TABLES `player_preydata` WRITE;
/*!40000 ALTER TABLE `player_preydata` DISABLE KEYS */;
INSERT INTO `player_preydata` VALUES (2,'\0\0\0\0\0\0\0\0\0	\0Crazed Winter Rearguard\0Faun\0Giant Spider	\0Hellhound\0Minotaur Guard\0Roaring Lion\0Skeleton Miner\0Vampire\0ancient scarab\0\0\0\0\0\0\0\0	\0Crawler\0Crazed Summer Vanguard\0Cyclopslave	\0Ice Witch\n\0Ironblight\n\0Ogre Brute\n\0juggernaut\0phantasm\0wyvern\0\0\0\0\0\0\0\0\0\0'),(3,'\0\0\0\0\0\0\0\0\0	\0Choking Fear\r\0Courage Leech\0Elf Lightmaster\0Hellforger Cyclops\0Mancubus\0Nightstalker\0Swan Maiden\0Waspoid\0wyvern\0\0\0\0\0\0\0\0	\0Crazed Winter Vanguard\0Draken Elite\0Enfeebled Silencer\n\0Ogre Brute\0Quara Mantassin\r\0Quara Pincher\Z\0Saurons Possessed Beholder\0Stone Devourer\0Werewolf\0\0\0\0\0\0\0\0\0\0'),(4,'\0\0\0\0\0\0\0\0\0	\0Cloak of Terror\0Hellforger Cyclops\0Lizard Legionnaire\n\0Ogre Brute\0Orc Warrior\r\0Quara Pincher\Z\0Saurons Possessed Beholder\n\0Terminator\n\0White Lion\0\0\0\0\0\0\0\0	\0Black Knight	\0Bloodboil\0Chaos Draco\n\0Elf Ranger\r\0Lizard Chosen\0Quara Predator\0Spirit Of Fire\0Uruloki\0Waspoid\0\0\0\0\0\0\0\0\0\0'),(5,'\0\0\0\0\0\0\0\0\0	\0Banshee\0Draken Abomination\0Elf Lightmaster\0Energy Elemental\0Hydra\0Mancubus\0Slime\0blightwalker\0dragon hatchling\0\0\0\0\0\0\0\0	\0Abyssal Cursed Stone\0Crawler\0Flimsy Lost Soul\r\0Lizard Chosen	\0Nightmare\n\0Pirat Mate\0Pirat Scoundrel\0Quara Predator\0Soul-Broken Harbinger\0\0\0\0\0\0\0\0\0\0'),(11930,'\0\0\0\0\0\0\0\0\0	\0Black Knight\0Deathling Scout\0Draken Warmaster\r\0Falcon Knight\n\0Werehyaena\0Werewolf\0Yeti\0dragon hatchling\0plaguesmith\0\0\0\0\0\0\0\0	\0Cyclops\n\0Elder Wyrm\0Giant Spider\0Haunted Treeling\0Lizard Legionnaire\0Silencer\0Soul Burner\n\0White Lion\0dragon lord hatchling\0\0\0\0\0\0\0\0\0\0'),(11931,'\0\0\0\0\0\0\0\0\0	\0Grim Reaper\0Hand of Cursed Fate\0Hellforger Cyclops\0Hero\0Lizard High Guard\0Ogre Savage\0Pirate Corsair\0Quara Mantassin\0dragon lord hatchling\0\0\0\0\0\0\0\0		\0Bloodboil\0Brain Squid\n\0Frazzlemaw\0Icecold Book\0Juvenile Bashmu\0Minotaur\0Nightstalker\0Slime\0Wyrm\0\0\0\0\0\0\0\0\0\0'),(11934,'\0\0\0\0\0\0\0\0\0	\0Burster Spectre\0Cobra Vizier\0Demon\0Hydra	\0Lost Soul\0Pirate Buccaneer\0Shaburak Demon\0Spirit Of Fire\0dragon lord hatchling\0\0\0\0\0\0\0\0	\0Animated Feather\0Biting Book\0Crawler\0Draken Warmaster\0Elf Soldier\0Energetic Book\0High Elf\0Kollos\n\0Shock Head\0\0\0\0\0\0\0\0\0\0'),(11935,'\0\0\0\0\0\0\0\0\0	\0Allukard\0Grim Reaper\0Kollos\0Lich\r\0Lizard Zaogun\0Stone Devourer\0Warlock\0dragon lord hatchling\0wyvern\0\0\0\0\0\0\0\0	\r\0Dark Torturer\0Fury\0Ice Serpente\0Ogre Savage\0Slime\0Soul Burner\0Werelioness\0Wyrm\0Yeti\0\0\0\0\0\0\0\0\0\0');
/*!40000 ALTER TABLE `player_preydata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_preytimes`
--

DROP TABLE IF EXISTS `player_preytimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_preytimes` (
  `player_id` int(11) NOT NULL,
  `bonus_type1` int(11) NOT NULL,
  `bonus_value1` int(11) NOT NULL,
  `bonus_name1` varchar(50) NOT NULL,
  `bonus_type2` int(11) NOT NULL,
  `bonus_value2` int(11) NOT NULL,
  `bonus_name2` varchar(50) NOT NULL,
  `bonus_type3` int(11) NOT NULL,
  `bonus_value3` int(11) NOT NULL,
  `bonus_name3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_preytimes`
--

LOCK TABLES `player_preytimes` WRITE;
/*!40000 ALTER TABLE `player_preytimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_preytimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_rewards`
--

DROP TABLE IF EXISTS `player_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_rewards` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  CONSTRAINT `player_rewards_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_rewards`
--

LOCK TABLES `player_rewards` WRITE;
/*!40000 ALTER TABLE `player_rewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_rewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_spells`
--

DROP TABLE IF EXISTS `player_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_spells`
--

LOCK TABLES `player_spells` WRITE;
/*!40000 ALTER TABLE `player_spells` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_spells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_storage`
--

DROP TABLE IF EXISTS `player_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) unsigned NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`player_id`,`key`),
  CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_storage`
--

LOCK TABLES `player_storage` WRITE;
/*!40000 ALTER TABLE `player_storage` DISABLE KEYS */;
INSERT INTO `player_storage` VALUES (2,5152,0),(2,6983,1740097008),(2,17101,0),(2,30001,1),(2,40851,1),(2,45144,1),(2,45162,1),(2,69801,0),(2,98231,0),(2,10001001,8912896),(2,10001002,8388608),(2,10001003,8978432),(2,10001004,8454144),(2,10001005,9043968),(2,10001006,8519680),(2,10001007,9109504),(2,10001008,8585216),(2,10001009,9175040),(2,10001010,8650752),(2,10001011,9240576),(2,10001012,8716288),(2,10001013,9306112),(2,10001014,8781824),(2,10001015,9633792),(2,10001016,9371648),(2,10001017,9764864),(2,10001018,9502720),(2,10001019,9830400),(2,10001020,9568256),(2,10001021,10158080),(2,10001022,9895936),(2,10001023,10223616),(2,10001024,9961472),(2,10001025,10289152),(2,10001026,10027008),(2,10001027,10354688),(2,10001028,10092544),(2,10001029,16515072),(2,10001030,16449536),(2,10001031,17629184),(2,10001032,17563648),(2,10001033,17694720),(2,10001034,17891328),(2,10001035,18284544),(2,10001036,18219008),(2,10001037,18874368),(2,10001038,18939904),(2,10001039,21233664),(2,10001040,21299200),(2,10001041,22020096),(2,10001042,21954560),(2,10001043,23986176),(2,10001044,24051712),(2,10001045,28246016),(2,10001046,28180480),(2,10001047,28377088),(2,10001048,28311552),(2,10001049,30408704),(2,10001050,30343168),(2,10001051,30474240),(2,10001052,30539776),(2,10001053,111738880),(2,10001054,111804416),(2,10001055,112197632),(2,10001056,112656384),(2,10001057,112721920),(2,98231521,0),(3,5152,0),(3,6983,1740097000),(3,17101,0),(3,30001,1),(3,40851,1),(3,45144,1),(3,45162,1),(3,69801,0),(3,98231,0),(3,10001001,8912896),(3,10001002,8388608),(3,10001003,8978432),(3,10001004,8454144),(3,10001005,9043968),(3,10001006,8519680),(3,10001007,9109504),(3,10001008,8585216),(3,10001009,9175040),(3,10001010,8650752),(3,10001011,9240576),(3,10001012,8716288),(3,10001013,9306112),(3,10001014,8781824),(3,10001015,9633792),(3,10001016,9371648),(3,10001017,9764864),(3,10001018,9502720),(3,10001019,9830400),(3,10001020,9568256),(3,10001021,10158080),(3,10001022,9895936),(3,10001023,10223616),(3,10001024,9961472),(3,10001025,10289152),(3,10001026,10027008),(3,10001027,10354688),(3,10001028,10092544),(3,10001029,16515072),(3,10001030,16449536),(3,10001031,17629184),(3,10001032,17563648),(3,10001033,17694720),(3,10001034,17891328),(3,10001035,18284544),(3,10001036,18219008),(3,10001037,18874368),(3,10001038,18939904),(3,10001039,21233664),(3,10001040,21299200),(3,10001041,22020096),(3,10001042,21954560),(3,10001043,23986176),(3,10001044,24051712),(3,10001045,28246016),(3,10001046,28180480),(3,10001047,28377088),(3,10001048,28311552),(3,10001049,30408704),(3,10001050,30343168),(3,10001051,30474240),(3,10001052,30539776),(3,10001053,111738880),(3,10001054,111804416),(3,10001055,112197632),(3,10001056,112656384),(3,10001057,112721920),(3,98231521,0),(4,5152,0),(4,6983,1740096997),(4,17101,0),(4,30001,1),(4,40851,1),(4,45144,1),(4,45162,1),(4,69801,0),(4,98231,0),(4,10001001,8912896),(4,10001002,8388608),(4,10001003,8978432),(4,10001004,8454144),(4,10001005,9043968),(4,10001006,8519680),(4,10001007,9109504),(4,10001008,8585216),(4,10001009,9175040),(4,10001010,8650752),(4,10001011,9240576),(4,10001012,8716288),(4,10001013,9306112),(4,10001014,8781824),(4,10001015,9633792),(4,10001016,9371648),(4,10001017,9764864),(4,10001018,9502720),(4,10001019,9830400),(4,10001020,9568256),(4,10001021,10158080),(4,10001022,9895936),(4,10001023,10223616),(4,10001024,9961472),(4,10001025,10289152),(4,10001026,10027008),(4,10001027,10354688),(4,10001028,10092544),(4,10001029,16515072),(4,10001030,16449536),(4,10001031,17629184),(4,10001032,17563648),(4,10001033,17694720),(4,10001034,17891328),(4,10001035,18284544),(4,10001036,18219008),(4,10001037,18874368),(4,10001038,18939904),(4,10001039,21233664),(4,10001040,21299200),(4,10001041,22020096),(4,10001042,21954560),(4,10001043,23986176),(4,10001044,24051712),(4,10001045,28246016),(4,10001046,28180480),(4,10001047,28377088),(4,10001048,28311552),(4,10001049,30408704),(4,10001050,30343168),(4,10001051,30474240),(4,10001052,30539776),(4,10001053,111738880),(4,10001054,111804416),(4,10001055,112197632),(4,10001056,112656384),(4,10001057,112721920),(4,98231521,0),(5,5152,0),(5,6983,1740097004),(5,17101,0),(5,30001,1),(5,40851,1),(5,45144,1),(5,45162,1),(5,69801,0),(5,98231,0),(5,10001001,8912896),(5,10001002,8388608),(5,10001003,8978432),(5,10001004,8454144),(5,10001005,9043968),(5,10001006,8519680),(5,10001007,9109504),(5,10001008,8585216),(5,10001009,9175040),(5,10001010,8650752),(5,10001011,9240576),(5,10001012,8716288),(5,10001013,9306112),(5,10001014,8781824),(5,10001015,9633792),(5,10001016,9371648),(5,10001017,9764864),(5,10001018,9502720),(5,10001019,9830400),(5,10001020,9568256),(5,10001021,10158080),(5,10001022,9895936),(5,10001023,10223616),(5,10001024,9961472),(5,10001025,10289152),(5,10001026,10027008),(5,10001027,10354688),(5,10001028,10092544),(5,10001029,16515072),(5,10001030,16449536),(5,10001031,17629184),(5,10001032,17563648),(5,10001033,17694720),(5,10001034,17891328),(5,10001035,18284544),(5,10001036,18219008),(5,10001037,18874368),(5,10001038,18939904),(5,10001039,21233664),(5,10001040,21299200),(5,10001041,22020096),(5,10001042,21954560),(5,10001043,23986176),(5,10001044,24051712),(5,10001045,28246016),(5,10001046,28180480),(5,10001047,28377088),(5,10001048,28311552),(5,10001049,30408704),(5,10001050,30343168),(5,10001051,30474240),(5,10001052,30539776),(5,10001053,111738880),(5,10001054,111804416),(5,10001055,112197632),(5,10001056,112656384),(5,10001057,112721920),(5,98231521,0),(11930,5152,0),(11930,6983,1740097131),(11930,17101,0),(11930,30001,1),(11930,40852,1),(11930,45162,1),(11930,98231,0),(11930,10001001,9437184),(11930,10001002,9699328),(11930,10001003,115081216),(11930,10001004,115146752),(11930,10001005,115212288),(11930,10001006,115277824),(11931,5152,0),(11931,6983,1740097005),(11931,17101,0),(11931,30001,1),(11931,40853,1),(11931,45162,1),(11931,98231,0),(11931,10001001,114425856),(11931,10001002,114491392),(11931,10001003,114556928),(11931,10001004,114622464),(11931,10001005,114688000),(11931,10001006,114753536),(11931,10001007,114819072),(11931,10001008,114884608),(11931,10001009,114950144),(11931,10001010,115015680),(11934,0,1756303165),(11934,1963,497),(11934,5152,0),(11934,5170,0),(11934,5171,0),(11934,5172,0),(11934,5173,0),(11934,5174,0),(11934,5175,0),(11934,5176,0),(11934,5177,0),(11934,5178,0),(11934,5179,0),(11934,5180,0),(11934,5181,0),(11934,5182,0),(11934,5183,0),(11934,5184,0),(11934,5185,0),(11934,5186,0),(11934,5187,0),(11934,5933,1756380334),(11934,5934,1756381657),(11934,5941,1756383952),(11934,6983,1756312626),(11934,17101,0),(11934,30001,1),(11934,40851,1),(11934,40854,1),(11934,44958,1756307244),(11934,45001,0),(11934,45162,1),(11934,50722,0),(11934,98231,0),(11934,99963,1),(11934,99964,1),(11934,99965,1),(11934,99966,1),(11934,99969,1),(11934,10001001,8912896),(11934,10001002,8388608),(11934,10001003,8978432),(11934,10001004,8454144),(11934,10001005,9043968),(11934,10001006,8519680),(11934,10001007,9109504),(11934,10001008,8585216),(11934,10001009,9175040),(11934,10001010,8650752),(11934,10001011,9240576),(11934,10001012,8716288),(11934,10001013,9306112),(11934,10001014,8781824),(11934,10001015,9633792),(11934,10001016,9371648),(11934,10001017,9764864),(11934,10001018,9502720),(11934,10001019,9830400),(11934,10001020,9568256),(11934,10001021,10158080),(11934,10001022,9895936),(11934,10001023,10223616),(11934,10001024,9961472),(11934,10001025,10289152),(11934,10001026,10027008),(11934,10001027,10354688),(11934,10001028,10092544),(11934,10001029,16515072),(11934,10001030,16449536),(11934,10001031,17629184),(11934,10001032,17563648),(11934,10001033,17694720),(11934,10001034,17891328),(11934,10001035,18284544),(11934,10001036,18219008),(11934,10001037,18874368),(11934,10001038,18939904),(11934,10001039,21233664),(11934,10001040,21299200),(11934,10001041,22020096),(11934,10001042,21954560),(11934,10001043,23986176),(11934,10001044,24051712),(11934,10001045,28246016),(11934,10001046,28180480),(11934,10001047,28377088),(11934,10001048,28311552),(11934,10001049,30408704),(11934,10001050,30343168),(11934,10001051,30474240),(11934,10001052,30539776),(11934,10001053,122945536),(11934,10001054,123273216),(11934,10001055,123404288),(11934,10001056,123731968),(11934,10001057,123797504),(11934,10001058,123863040),(11934,10001059,123928576),(11934,10002011,240),(11935,5152,0),(11935,6983,1740097001),(11935,17101,0),(11935,30001,1),(11935,40854,1),(11935,45162,1),(11935,98231,0),(11935,10001001,113377280),(11935,10001002,113704960),(11935,10001003,113836032),(11935,10001004,114163712),(11935,10001005,114229248),(11935,10001006,114294784),(11935,10001007,114360320);
/*!40000 ALTER TABLE `player_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `vocation` int(11) NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 150,
  `healthmax` int(11) NOT NULL DEFAULT 150,
  `experience` bigint(20) NOT NULL DEFAULT 0,
  `exptoday` int(11) DEFAULT NULL,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `manamax` int(11) NOT NULL DEFAULT 0,
  `manaspent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `soul` int(10) unsigned NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `conditions` longblob DEFAULT NULL,
  `cap` int(11) NOT NULL DEFAULT 0,
  `sex` int(11) NOT NULL DEFAULT 0,
  `lastlogin` bigint(20) unsigned NOT NULL DEFAULT 0,
  `lastip` int(10) unsigned NOT NULL DEFAULT 0,
  `save` tinyint(1) NOT NULL DEFAULT 1,
  `skull` tinyint(1) NOT NULL DEFAULT 0,
  `skulltime` bigint(20) NOT NULL DEFAULT 0,
  `lastlogout` bigint(20) unsigned NOT NULL DEFAULT 0,
  `blessings` tinyint(4) NOT NULL DEFAULT 0,
  `blessings1` tinyint(4) NOT NULL DEFAULT 0,
  `blessings2` tinyint(4) NOT NULL DEFAULT 0,
  `blessings3` tinyint(4) NOT NULL DEFAULT 0,
  `blessings4` tinyint(4) NOT NULL DEFAULT 0,
  `blessings5` tinyint(4) NOT NULL DEFAULT 0,
  `blessings6` tinyint(4) NOT NULL DEFAULT 0,
  `blessings7` tinyint(4) NOT NULL DEFAULT 0,
  `blessings8` tinyint(4) NOT NULL DEFAULT 0,
  `onlinetime` bigint(20) NOT NULL DEFAULT 0,
  `deletion` bigint(20) NOT NULL DEFAULT 0,
  `balance` bigint(20) unsigned NOT NULL DEFAULT 0,
  `bonusrerollcount` bigint(20) DEFAULT 0,
  `quick_loot_fallback` tinyint(1) DEFAULT 0,
  `offlinetraining_time` smallint(5) unsigned NOT NULL DEFAULT 43200,
  `offlinetraining_skill` int(11) NOT NULL DEFAULT -1,
  `stamina` smallint(5) unsigned NOT NULL DEFAULT 2520,
  `skill_fist` int(10) unsigned NOT NULL DEFAULT 10,
  `skill_fist_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_club` int(10) unsigned NOT NULL DEFAULT 10,
  `skill_club_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_sword` int(10) unsigned NOT NULL DEFAULT 10,
  `skill_sword_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_axe` int(10) unsigned NOT NULL DEFAULT 10,
  `skill_axe_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_dist` int(10) unsigned NOT NULL DEFAULT 10,
  `skill_dist_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_shielding` int(10) unsigned NOT NULL DEFAULT 10,
  `skill_shielding_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_fishing` int(10) unsigned NOT NULL DEFAULT 10,
  `skill_fishing_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `create_ip` bigint(20) NOT NULL DEFAULT 0,
  `create_date` bigint(20) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `skill_critical_hit_chance` int(10) unsigned NOT NULL DEFAULT 0,
  `skill_critical_hit_chance_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_critical_hit_damage` int(10) unsigned NOT NULL DEFAULT 0,
  `skill_critical_hit_damage_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_life_leech_chance` int(10) unsigned NOT NULL DEFAULT 0,
  `skill_life_leech_chance_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_life_leech_amount` int(10) unsigned NOT NULL DEFAULT 0,
  `skill_life_leech_amount_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_mana_leech_chance` int(10) unsigned NOT NULL DEFAULT 0,
  `skill_mana_leech_chance_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_mana_leech_amount` int(10) unsigned NOT NULL DEFAULT 0,
  `skill_mana_leech_amount_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_criticalhit_chance` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_criticalhit_damage` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_lifeleech_chance` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_lifeleech_amount` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_manaleech_chance` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_manaleech_amount` bigint(20) unsigned NOT NULL DEFAULT 0,
  `prey_stamina_1` int(11) DEFAULT NULL,
  `prey_stamina_2` int(11) DEFAULT NULL,
  `prey_stamina_3` int(11) DEFAULT NULL,
  `prey_column` smallint(6) NOT NULL DEFAULT 1,
  `xpboost_stamina` int(11) DEFAULT NULL,
  `xpboost_value` int(11) DEFAULT NULL,
  `marriage_status` bigint(20) unsigned NOT NULL DEFAULT 0,
  `hide_skills` int(11) DEFAULT NULL,
  `hide_set` int(11) DEFAULT NULL,
  `former` varchar(255) NOT NULL DEFAULT '-',
  `signature` varchar(255) NOT NULL DEFAULT '',
  `marriage_spouse` int(11) NOT NULL DEFAULT -1,
  `loyalty_ranking` tinyint(1) NOT NULL DEFAULT 0,
  `bonus_rerolls` bigint(20) NOT NULL DEFAULT 0,
  `critical` int(11) DEFAULT 0,
  `sbw_points` int(11) NOT NULL DEFAULT 0,
  `instantrewardtokens` int(10) unsigned NOT NULL DEFAULT 0,
  `charmpoints` int(11) DEFAULT 0,
  `direction` tinyint(1) DEFAULT 0,
  `lookmount` int(11) DEFAULT 0,
  `version` int(11) DEFAULT 1000,
  `lootaction` tinyint(4) DEFAULT 0,
  `spells` blob DEFAULT NULL,
  `storages` mediumblob DEFAULT NULL,
  `items` longblob DEFAULT NULL,
  `depotitems` longblob DEFAULT NULL,
  `inboxitems` longblob DEFAULT NULL,
  `rewards` longblob DEFAULT NULL,
  `varcap` int(11) NOT NULL DEFAULT 0,
  `charmExpansion` tinyint(4) DEFAULT 0,
  `bestiarykills` longblob DEFAULT NULL,
  `charms` longblob DEFAULT NULL,
  `bestiaryTracker` longblob DEFAULT NULL,
  `autoloot` blob DEFAULT NULL,
  `lastday` bigint(20) DEFAULT 0,
  `bonus_reroll` int(11) NOT NULL DEFAULT 0,
  `created` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `account_id` (`account_id`),
  KEY `vocation` (`vocation`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11964 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (2,'Sorcerer Sample',1,1,8,1,185,185,4200,NULL,0,0,0,0,128,0,0,90,90,0,100,1,737,517,3,'',470,1,1740097001,16777343,1,0,0,1740097003,0,0,1,1,1,1,1,0,0,135,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,0),(3,'Druid Sample',1,1,8,5,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,737,517,3,'',470,1,1740096993,16777343,1,0,0,1740096995,0,0,1,1,1,1,1,0,0,44,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,0),(4,'Archer Sample',1,1,8,9,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,737,517,3,'',470,1,1740096988,16777343,1,0,0,1740096992,0,0,1,1,1,1,1,0,0,592,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,0),(5,'Knight Sample',1,1,8,13,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,737,517,3,'',470,1,1740096998,16777343,1,0,0,1740096999,0,0,1,1,1,1,1,0,0,210,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,0),(11930,'Elf Sample',1,1,8,35,185,185,4200,NULL,0,0,0,0,148,0,0,90,90,0,100,1,737,517,3,'',470,1,1740097005,16777343,1,0,0,1740097126,0,0,1,1,1,1,1,0,0,816,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,0),(11931,'Orc Sample',1,1,8,21,185,185,4200,NULL,0,0,0,0,1900,0,0,90,90,0,100,1,737,517,3,'',470,1,1740096999,16777343,1,0,0,1740097000,0,0,1,1,1,1,1,0,0,190,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,0),(11934,'[GOD] Middle Earth',6,8422,250,20,5080,5080,254237300,NULL,114,0,10,114,266,0,4,1594,1594,34406,0,1,2173,364,9,'',12450,1,1756312661,452805297,1,0,0,1756312621,0,0,1,1,1,1,1,0,0,100810,0,270000,0,0,25261,-1,2520,0,0,0,0,0,0,0,0,0,0,33,280,0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,718,0,0,0,1,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1716080383),(11935,'Dwarf Sample',1,1,8,17,185,185,4200,NULL,0,0,0,0,1889,0,0,90,90,0,100,1,737,517,3,'',470,1,1740096995,16777343,1,0,0,1740096996,0,0,1,1,1,1,1,0,0,236,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,0),(11936,'Tolkien',1,8427,8,1,185,185,4200,NULL,0,0,0,0,128,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756261150),(11937,'Stormy',1,8428,8,13,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756261744),(11938,'Shaman',1,8427,8,5,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756261797),(11939,'Ozymandias',1,8429,8,5,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756262068),(11940,'Oppenheimer',1,8430,8,1,185,185,4200,NULL,0,0,0,0,128,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756262175),(11941,'Iberdrola',1,8431,8,21,185,185,4200,NULL,0,0,0,0,1900,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756262484),(11942,'Rap Da Alma',1,8432,8,21,185,185,4200,NULL,0,0,0,0,1900,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756263165),(11943,'Criador De Jutsu',1,8432,8,9,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756263256),(11944,'Rulex Infernalist',1,8432,8,17,185,185,4200,NULL,0,0,0,0,1889,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756263333),(11945,'Greed',1,8428,8,17,185,185,4200,NULL,0,0,0,0,1889,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756263636),(11946,'Bfhbpqlyrps',1,8433,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756265492),(11947,'Shawty',1,8434,8,9,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756266439),(11948,'Gorbatchov',1,8435,8,1,185,185,4200,NULL,0,0,0,0,128,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756267098),(11949,'Zpxysslfuczjgul',1,8436,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756267181),(11950,'Irjxoymj',1,8437,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756280119),(11951,'Rqbbnwrlmf',1,8438,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756285943),(11952,'Gandalf',1,8439,8,1,185,185,4200,NULL,0,0,0,0,128,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756295300),(11953,'Usain Arrow',1,8440,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756296418),(11954,'Fuu Houhou',1,8441,8,5,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756302672),(11955,'Cacto',1,8442,8,21,185,185,4200,NULL,0,0,0,0,1900,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756303610),(11956,'Verde Orc',1,8443,8,21,185,185,4200,NULL,0,0,0,0,1900,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756309007),(11957,'Mais Quanto',1,8444,8,17,185,185,4200,NULL,0,0,0,0,1889,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756309055),(11958,'Puro Suco',1,8444,8,17,185,185,4200,NULL,0,0,0,0,1889,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756309080),(11959,'Atira Muito',1,8445,8,17,185,185,4200,NULL,0,0,0,0,1889,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756309133),(11960,'Atiira Muito',1,8445,8,9,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756309225),(11961,'Muito Simples',1,8445,8,9,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756309260),(11962,'Efzzchiuzr',1,8446,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756310801),(11963,'Yozhobdxihrn',1,8447,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756312025);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players_online`
--

DROP TABLE IF EXISTS `players_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players_online`
--

LOCK TABLES `players_online` WRITE;
/*!40000 ALTER TABLE `players_online` DISABLE KEYS */;
INSERT INTO `players_online` VALUES (11934);
/*!40000 ALTER TABLE `players_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prey_slots`
--

DROP TABLE IF EXISTS `prey_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prey_slots` (
  `player_id` int(11) NOT NULL,
  `num` smallint(6) NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT 1,
  `unlocked` tinyint(1) NOT NULL DEFAULT 0,
  `current` varchar(40) NOT NULL DEFAULT '',
  `monster_list` varchar(360) NOT NULL,
  `free_reroll_in` int(11) NOT NULL DEFAULT 0,
  `time_left` smallint(6) NOT NULL DEFAULT 0,
  `next_use` int(11) NOT NULL DEFAULT 0,
  `bonus_type` smallint(6) NOT NULL,
  `bonus_value` smallint(6) NOT NULL DEFAULT 0,
  `bonus_grade` smallint(6) NOT NULL DEFAULT 0,
  KEY `player_id` (`player_id`),
  CONSTRAINT `prey_slots_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prey_slots`
--

LOCK TABLES `prey_slots` WRITE;
/*!40000 ALTER TABLE `prey_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `prey_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell_players`
--

DROP TABLE IF EXISTS `sell_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sell_players` (
  `player_id` int(11) NOT NULL,
  `account` int(11) NOT NULL,
  `create` bigint(20) NOT NULL,
  `createip` bigint(20) NOT NULL,
  `coin` int(11) NOT NULL,
  PRIMARY KEY (`player_id`),
  CONSTRAINT `sell_players_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_players`
--

LOCK TABLES `sell_players` WRITE;
/*!40000 ALTER TABLE `sell_players` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell_players_history`
--

DROP TABLE IF EXISTS `sell_players_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sell_players_history` (
  `player_id` int(11) NOT NULL,
  `accountold` int(11) NOT NULL,
  `accountnew` int(11) NOT NULL,
  `create` bigint(20) NOT NULL,
  `createip` bigint(20) NOT NULL,
  `buytime` bigint(20) NOT NULL,
  `buyip` bigint(20) NOT NULL,
  `coin` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`buytime`) USING BTREE,
  CONSTRAINT `sell_players_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_players_history`
--

LOCK TABLES `sell_players_history` WRITE;
/*!40000 ALTER TABLE `sell_players_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell_players_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellchar`
--

DROP TABLE IF EXISTS `sellchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellchar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `vocation` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(40) NOT NULL,
  `oldid` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `sellchar_ibfk_1` FOREIGN KEY (`id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellchar`
--

LOCK TABLES `sellchar` WRITE;
/*!40000 ALTER TABLE `sellchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_config`
--

DROP TABLE IF EXISTS `server_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_config`
--

LOCK TABLES `server_config` WRITE;
/*!40000 ALTER TABLE `server_config` DISABLE KEYS */;
INSERT INTO `server_config` VALUES ('boost_boss','500'),('boost_boss_name','deathstrike'),('boost_boss_url','AnimatedOutfits/outfit.php?id=128&addons=3&head=115&body=107&legs=19&feet=38'),('boost_monster','2'),('boost_monsterSecond','326'),('boost_monsterThird','1621'),('boost_monster_name','orc warlord'),('boost_monster_nameSecond','frost torog'),('boost_monster_nameThird','true midnight asura'),('boost_monster_url','AnimatedOutfits/outfit.php?id=2&head=20&body=30&legs=40&feet=50'),('boost_monster_urlSecond','AnimatedOutfits/outfit.php?id=128&addons=3&head=115&body=107&legs=19&feet=38'),('boost_monster_urlSThird','AnimatedOutfits/outfit.php?id=362'),('boost_monster_urlThird','AnimatedOutfits/outfit.php?id=1068&addons=1&head=58&body=76&legs=72&feet=38'),('db_version','35'),('motd_hash','ccc5ec59ffd62304d9342dbd38e47d691102b384'),('motd_num','3'),('players_record','2');
/*!40000 ALTER TABLE `server_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snowballwar`
--

DROP TABLE IF EXISTS `snowballwar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snowballwar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snowballwar`
--

LOCK TABLES `snowballwar` WRITE;
/*!40000 ALTER TABLE `snowballwar` DISABLE KEYS */;
/*!40000 ALTER TABLE `snowballwar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_history`
--

DROP TABLE IF EXISTS `store_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_history` (
  `accountid` int(11) NOT NULL,
  `mode` tinyint(1) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL,
  `coinMode` tinyint(4) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `cust` int(11) NOT NULL,
  `time` bigint(20) DEFAULT NULL,
  KEY `store_history_ibfk_1` (`accountid`),
  CONSTRAINT `store_history_ibfk_1` FOREIGN KEY (`accountid`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_history`
--

LOCK TABLES `store_history` WRITE;
/*!40000 ALTER TABLE `store_history` DISABLE KEYS */;
INSERT INTO `store_history` VALUES (8422,0,1,0,'Autoloot',-22,1708181834),(8422,0,50,0,'[GOD] Shire Tales transferred to Teste Xp',-50,1708441794),(8422,0,28,0,'[GOD] Shire Tales transferred to joninha testestore',-28,1708457256),(8422,0,100,0,'[GOD] Shire Tales transferred to joninha testestore',-100,1708457408),(8422,0,100,0,'[GOD] Shire Tales transferred to joninha testeStore',-100,1708457418),(8422,0,1,0,'Autoloot',-25,1716228739),(8422,0,1,0,'Autoloot',-25,1716228993),(8422,0,1,0,'Autoloot',-25,1716230731),(8422,0,1,0,'Autoloot',-25,1756273189);
/*!40000 ALTER TABLE `store_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_history_old`
--

DROP TABLE IF EXISTS `store_history_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_history_old` (
  `account_id` int(11) NOT NULL,
  `mode` smallint(6) NOT NULL DEFAULT 0,
  `description` varchar(3500) NOT NULL,
  `coin_amount` int(11) NOT NULL,
  `time` bigint(20) unsigned NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL,
  `coins` int(11) NOT NULL DEFAULT 0,
  KEY `account_id` (`account_id`),
  CONSTRAINT `store_history_old_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_history_old`
--

LOCK TABLES `store_history_old` WRITE;
/*!40000 ALTER TABLE `store_history_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_history_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_subject` varchar(255) DEFAULT NULL,
  `ticket_author` varchar(255) DEFAULT NULL,
  `ticket_author_acc_id` int(11) NOT NULL,
  `ticket_last_reply` varchar(11) DEFAULT NULL,
  `ticket_admin_reply` int(11) DEFAULT NULL,
  `ticket_date` varchar(255) DEFAULT NULL,
  `ticket_ended` varchar(255) DEFAULT NULL,
  `ticket_status` varchar(255) DEFAULT NULL,
  `ticket_category` varchar(255) DEFAULT NULL,
  `ticket_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `tickets_ibfk_1` (`ticket_author_acc_id`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`ticket_author_acc_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_reply`
--

DROP TABLE IF EXISTS `tickets_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets_reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `reply_author` varchar(255) DEFAULT NULL,
  `reply_message` varchar(255) DEFAULT NULL,
  `reply_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `tickets_reply_ibfk_1` (`ticket_id`),
  CONSTRAINT `tickets_reply_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_reply`
--

LOCK TABLES `tickets_reply` WRITE;
/*!40000 ALTER TABLE `tickets_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tile_store`
--

DROP TABLE IF EXISTS `tile_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL,
  KEY `house_id` (`house_id`),
  CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tile_store`
--

LOCK TABLES `tile_store` WRITE;
/*!40000 ALTER TABLE `tile_store` DISABLE KEYS */;
INSERT INTO `tile_store` VALUES (1,'4‚\0\0\0á\0'),(1,'4„\0\0\0à\0'),(1,'6Â\0\0\0º\0'),(2,';„\0\0\0á\0'),(2,':Â\0\0\0º\0'),(2,';‰\0\0\0à\0'),(2,'<‰\0\0\0\'\0'),(3,'4È\0\0\0á\0'),(3,'4Í\0\0\0à\0'),(3,'5Ó\0\0\0º\0'),(4,'8È\0\0\0á\0'),(4,'8Í\0\0\0à\0'),(4,'<Í\0\0\0\'\0'),(4,'9Ó\0\0\0&\0'),(4,':Ó\0\0\0º\0'),(4,'<Ì\0\0\0\'\0'),(5,'@Á\0\0\0á\0'),(5,'@Ë\0\0\0à\0'),(5,'AÎ\0\0\0&\0'),(5,'CÎ\0\0\0º\0'),(5,'DÍ\0\0\0\'\0'),(6,'@Ô\0\0\0á\0'),(6,'@\0\0\0à\0'),(6,'DÒ\0\0\0\'\0'),(6,'BÙ\0\0\0º\0'),(7,'KÌ\0\0\0á\0'),(7,'KÓ\0\0\0à\0'),(7,'LÔ\0\0\0\'\0'),(7,'I\0\0\0º\0'),(7,'K\0\0\0&\0'),(8,'\r\0\0\0â\0'),(8,'\0\0\0ä\0'),(8,'\0\0\0º\0'),(8,'\r\n\0\0\0â\0'),(8,'\n\0\0\0ä\0'),(8,'\0\0\0&\0'),(8,'\0\0\0&\0'),(9,'\0\0\0â\0'),(9,'\0\0\0ä\0'),(9,'\0\0\0º\0'),(9,'\n\0\0\0â\0'),(9,'\n\0\0\0ä\0'),(9,'\0\0\0&\0'),(9,'\0\0\0â\0'),(9,'\0\0\0ä\0'),(9,'\0\0\0\'\0'),(9,'	\0\0\0\'\0'),(9,'\n\0\0\0\'\0'),(9,'\0\0\0&\0'),(10,'\0\0\0º\0'),(10,'\0\0\0á\0'),(10,'\0\0\0à\0'),(10,'\0\0\0â\0'),(10,'\Z\0\0\0ä\0'),(11,'\"\0\0\0â\0'),(11,'#\0\0\0ä\0'),(11,'%\0\0\0á\0'),(11,'%\0\0\0à\0'),(11,'\'\0\0\0á\0'),(11,'\'\0\0\0à\0'),(11,'\"\0\0\0&\0'),(11,'\"\"\0\0\0º\0'),(11,'&\"\0\0\0&\0'),(12,'\"%\0\0\0º\0'),(12,'$*\0\0\0â\0'),(12,'%*\0\0\0ä\0'),(12,'\')\0\0\0á\0'),(12,'\'*\0\0\0à\0'),(13,'Û\0\0\0á\0'),(13,'Ù\0\0\0à\0'),(13,'Ù\0\0\0\'\0'),(13,'˜\0\0\0π\0'),(14,'¸\0\0\0á\0'),(14,'˝\0\0\0à\0'),(14,'˝\0\0\0π\0'),(14,'\0\0\0\0â\0'),(14,'\r\0\0\0\0ä\0'),(15,'˙\0\0\0º\0'),(15,'ˇ\0\0\0â\0'),(15,'ˇ\0\0\0ä\0'),(15,'\0\0\0\0&\0'),(15,'\Z\0\0\0\0&\0'),(16,'˚\0\0\0á\0'),(16,'¸\0\0\0à\0'),(16,'\"˙\0\0\0º\0'),(16,' ˛\0\0\0&\0'),(16,'\"˛\0\0\0&\0'),(16,'$¸\0\0\0\'\0'),(16,'$˝\0\0\0\'\0'),(17,'Û\0\0\0â\0'),(17,'Û\0\0\0ä\0'),(17,'Ù\0\0\0π\0'),(18,'\0\0\0á\0'),(18,'\0\0\0à\0'),(18,'\0\0\0º\0'),(19,'\0\0\0á\0'),(19,'\Z\0\0\0à\0'),(19,'\0\0\0π\0'),(19,'\0\0\0\'\0'),(20,'\0\0\0á\0'),(20,'\0\0\0à\0'),(20,'\"\0\0\0â\0'),(20,'\"\0\0\0ä\0'),(20,' \0\0\0π\0'),(21,'4Û\0\0\0á\0'),(21,'7Ú\0\0\0º\0'),(21,'4Ù\0\0\0à\0'),(21,'9ı\0\0\0\'\0'),(22,'3˘\0\0\0π\0'),(22,'6˚\0\0\0&\0'),(22,'8¯\0\0\0á\0'),(22,'8˘\0\0\0à\0'),(23,':¯\0\0\0á\0'),(23,':˘\0\0\0à\0'),(23,'?˘\0\0\0π\0'),(24,':¸\0\0\0á\0'),(24,':˝\0\0\0à\0'),(24,'?˝\0\0\0π\0'),(25,'H˜\0\0\0º\0'),(25,'C¯\0\0\0á\0'),(25,'C˘\0\0\0à\0'),(25,'E¯\0\0\0á\0'),(25,'E˘\0\0\0à\0'),(25,'J˘\0\0\0\'\0'),(25,'J˚\0\0\0\'\0'),(25,'E˛\0\0\0&\0'),(25,'G˛\0\0\0&\0'),(25,'I˛\0\0\0&\0'),(25,'J˝\0\0\0\'\0'),(26,'-,\0\0\0á\0'),(26,'--\0\0\0à\0'),(26,'0&\0\0\0º\0'),(26,'1,\0\0\0â\0'),(26,'2,\0\0\0ä\0'),(27,'M˙\0\0\0π\0'),(27,'P˘\0\0\0á\0'),(27,'P˙\0\0\0à\0'),(28,'R˘\0\0\0á\0'),(28,'R˙\0\0\0à\0'),(28,'T¯\0\0\0º\0'),(29,'B\0\0\0á\0'),(29,'B\0\0\0à\0'),(29,'F\0\0\0π\0'),(30,'J\0\0\0á\0'),(30,'J\0\0\0à\0'),(30,'L\0\0\0º\0'),(31,'Vˇ\0\0\0á\0'),(31,'O\0\0\0\0π\0'),(31,'V\0\0\0\0à\0'),(32,'Q\0\0\0\'\0'),(32,'T\0\0\0á\0'),(32,'T\0\0\0à\0'),(32,'Q\0\0\0π\0'),(33,'X\0\0\0á\0'),(33,'X\0\0\0à\0'),(33,'W	\0\0\0º\0'),(33,'X	\0\0\0&\0'),(34,'G\0\0\0á\0'),(34,'J\n\0\0\0º\0'),(34,'G\0\0\0à\0'),(35,'I\0\0\0á\0'),(35,'I\0\0\0à\0'),(35,'M\0\0\0\'\0'),(35,'M\0\0\0π\0'),(36,'T\0\0\0π\0'),(36,'[\r\0\0\0á\0'),(36,'[\0\0\0à\0'),(37,'T\0\0\0π\0'),(37,'[\0\0\0á\0'),(37,'[\0\0\0à\0'),(38,'[\0\0\0á\0'),(38,'[\0\0\0à\0'),(38,'T\0\0\0π\0'),(39,'I\0\0\0á\0'),(39,'I\0\0\0à\0'),(39,'M\0\0\0\'\0'),(39,'M\0\0\0π\0'),(40,'J\Z\0\0\0º\0'),(40,'H\0\0\0á\0'),(40,'H\0\0\0à\0'),(41,'M\0\0\0á\0'),(41,'M\0\0\0à\0'),(41,'R\0\0\0π\0'),(42,'X#\0\0\0á\0'),(42,'W%\0\0\0º\0'),(42,'X$\0\0\0à\0'),(43,'F \0\0\0á\0'),(43,'F!\0\0\0à\0'),(43,'I \0\0\0\'\0'),(43,'I!\0\0\0π\0'),(44,'U\0\0\0π\0'),(44,'U\0\0\0\'\0'),(44,'Y\0\0\0á\0'),(44,'Y\0\0\0à\0'),(45,'C&\0\0\0á\0'),(45,'C\'\0\0\0à\0'),(45,'G&\0\0\0π\0'),(46,'J*\0\0\0π\0'),(46,'N)\0\0\0á\0'),(46,'N*\0\0\0à\0'),(47,'T\'\0\0\0º\0'),(47,'R)\0\0\0á\0'),(47,'R*\0\0\0à\0'),(48,'C+\0\0\0á\0'),(48,'C,\0\0\0à\0'),(48,'G,\0\0\0\'\0'),(48,'G.\0\0\0π\0'),(49,'M/\0\0\0π\0'),(49,'M1\0\0\0\'\0'),(49,'P0\0\0\0á\0'),(49,'P1\0\0\0à\0'),(50,'?*\0\0\0á\0'),(50,'?+\0\0\0à\0'),(50,'=-\0\0\0º\0'),(50,'?-\0\0\0&\0'),(51,'?1\0\0\0á\0'),(51,'?2\0\0\0à\0'),(51,'<4\0\0\0º\0'),(51,'>4\0\0\0&\0'),(52,'F2\0\0\0â\0'),(52,'G2\0\0\0ä\0'),(52,'C4\0\0\0π\0'),(53,'~É\0\0\0ﬁ\0'),(53,'~Ñ\0\0\0ﬂ\0'),(53,'ÑÉ\0\0\0ﬁ\0'),(53,'ÑÑ\0\0\0ﬂ\0'),(53,'Çà\0\0\0œ\r\0'),(54,'C7\0\0\0º\0'),(54,'D:\0\0\0â\0'),(54,'E:\0\0\0ä\0'),(55,'1/\0\0\0â\0'),(55,'2/\0\0\0ä\0'),(55,'22\0\0\0º\0'),(55,'32\0\0\0&\0'),(56,'5/\0\0\0â\0'),(56,'6/\0\0\0ä\0'),(56,'62\0\0\0º\0'),(57,'46\0\0\0á\0'),(57,'47\0\0\0à\0'),(57,'19\0\0\0º\0'),(57,'39\0\0\0&\0'),(58,'3<\0\0\0º\0'),(58,'7?\0\0\0á\0'),(58,'7@\0\0\0à\0'),(59,'+1\0\0\0â\0'),(59,',1\0\0\0ä\0'),(59,'(4\0\0\0º\0'),(59,'+4\0\0\0&\0'),(60,'*;\0\0\0º\0'),(60,',8\0\0\0á\0'),(60,',9\0\0\0à\0'),(60,',;\0\0\0&\0'),(61,'$/\0\0\0â\0'),(61,'%/\0\0\0ä\0'),(61,'#2\0\0\0º\0'),(61,'%2\0\0\0&\0'),(62,'!6\0\0\0º\0'),(62,'$7\0\0\0á\0'),(62,'$8\0\0\0à\0'),(63,'#=\0\0\0º\0'),(63,'%>\0\0\0á\0'),(63,'%?\0\0\0à\0'),(64,'\Z3\0\0\0º\0'),(64,'3\0\0\0&\0'),(64,'0\0\0\0á\0'),(64,'1\0\0\0à\0'),(65,'6\0\0\0º\0'),(65,';\0\0\0â\0'),(65,';\0\0\0ä\0'),(66,'6\0\0\0º\0'),(66,'9\0\0\0â\0'),(66,'9\0\0\0ä\0'),(67,'3\0\0\0º\0'),(67,'3\0\0\0&\0'),(67,'1\0\0\0á\0'),(67,'2\0\0\0à\0'),(68,',\0\0\0π\0'),(68,'-\0\0\0\'\0'),(68,'-\0\0\0â\0'),(68,'-\0\0\0ä\0'),(69,'+\0\0\0º\0'),(69,',\0\0\0â\0'),(69,'\r,\0\0\0ä\0'),(70,'\r$\0\0\0º\0'),(70,'\'\0\0\0â\0'),(70,'\'\0\0\0ä\0'),(71,'#\0\0\0º\0'),(71,'&\0\0\0á\0'),(71,'\'\0\0\0à\0'),(72,'ˇ&\0\0\0á\0'),(72,'ˇ\'\0\0\0à\0'),(72,'\0#\0\0\0º\0'),(73,'˝\0\0\0â\0'),(73,'˛\0\0\0ä\0'),(73,'\0\0\0\0π\0'),(74,'\0\0\0π\0'),(74,'	\0\0\0á\0'),(74,' \0\0\0\'\0'),(74,'	 \0\0\0à\0'),(75,'\0\0\0á\0'),(75,'\0\0\0º\0'),(75,'\0\0\0à\0'),(76,'˚\0\0\0º\0'),(76,'˘\0\0\0á\0'),(76,'˘\0\0\0à\0'),(77,'\0\r\0\0\0º\0'),(77,'\0\0\0á\0'),(77,'\0\0\0à\0'),(78,'ˇ\0\0\0π\0'),(78,'˚	\0\0\0â\0'),(78,'¸	\0\0\0ä\0'),(79,'\0\0\0º\0'),(79,'\0\0\0á\0'),(79,'	\0\0\0à\0'),(80,'˝\0\0\0π\0'),(80,'\0\0\0\0\0á\0'),(80,'\0\0\0\0à\0'),(80,'\0\0\0\0á\0'),(80,'\0\0\0à\0'),(81,'Ù\0\0\0â\0'),(81,'Ù\0\0\0ä\0'),(81,'ˆ\0\0\0π\0'),(82,'	Ú\0\0\0π\0'),(82,'\nÛ\0\0\0â\0'),(82,'Û\0\0\0ä\0'),(83,'q¯\0\0\0π\0'),(83,'u¯\0\0\0π\0'),(84,',?\0\0\0º\0'),(84,'-B\0\0\0â\0'),(84,'.B\0\0\0ä\0'),(85,'B”\0\0\0π\0'),(85,'E–\0\0\0ﬁ\0'),(85,'E—\0\0\0ﬂ\0'),(85,'F”\0\0\0∫\0'),(86,'J€\0\0\0ﬁ\0'),(86,'E‹\0\0\0π\0'),(86,'I›\0\0\0º\0'),(86,'J‹\0\0\0ﬂ\0'),(87,'PŸ\0\0\0π\0'),(87,'R⁄\0\0\0‹\0'),(87,'S⁄\0\0\0›\0'),(87,'TŸ\0\0\0∫\0'),(88,'X·\0\0\0º\0'),(88,'S‰\0\0\0ﬁ\0'),(88,'SÂ\0\0\0ﬂ\0'),(88,'XÊ\0\0\0º\0'),(89,']Î\0\0\0π\0'),(89,'_È\0\0\0‹\0'),(89,'`È\0\0\0›\0'),(89,'aÎ\0\0\0∫\0'),(90,'e€\0\0\0º\0'),(90,'bﬁ\0\0\0ﬁ\0'),(90,'bﬂ\0\0\0ﬂ\0'),(90,'e‡\0\0\0º\0'),(91,'VÚ\0\0\0ﬁ\0'),(91,'VÛ\0\0\0ﬂ\0'),(91,'W\0\0\0º\0'),(91,'YÙ\0\0\0∫\0'),(92,'bÒ\0\0\0ﬁ\0'),(92,'bÚ\0\0\0ﬂ\0'),(92,'d\0\0\0º\0'),(92,'fÚ\0\0\0π\0'),(93,'æË\0\0\0‹\0'),(93,'øË\0\0\0›\0'),(93,'¿Ï\0\0\0¸\0'),(94,'√Ë\0\0\0‹\0'),(94,'ƒË\0\0\0›\0'),(94,'√Ï\0\0\0¸\0'),(95,'∆Ë\0\0\0‹\0'),(95,'«Ë\0\0\0›\0'),(95,'«Ï\0\0\0¸\0'),(96,'ÀË\0\0\0‹\0'),(96,'ÃË\0\0\0›\0'),(96,'ÃÏ\0\0\0¸\0'),(97,'ŒË\0\0\0‹\0'),(97,'œË\0\0\0›\0'),(97,'œÏ\0\0\0¸\0'),(98,'øı\0\0\0¸\0'),(98,'ø¯\0\0\0‹\0'),(98,'¿¯\0\0\0›\0'),(98,'¿˘\0\0\0D\0'),(99,'√ı\0\0\0¸\0'),(99,'√¯\0\0\0‹\0'),(99,'ƒ¯\0\0\0›\0'),(100,'«ı\0\0\0¸\0'),(100,'∆¯\0\0\0‹\0'),(100,'«¯\0\0\0›\0'),(101,'Àı\0\0\0¸\0'),(101,' ¯\0\0\0‹\0'),(101,'À¯\0\0\0›\0'),(102,'œı\0\0\0¸\0'),(102,'Œ¯\0\0\0‹\0'),(102,'œ¯\0\0\0›\0'),(103,'≈¸\0\0\0¸\0'),(103,'»˝\0\0\0ﬁ\0'),(103,'»˛\0\0\0ﬂ\0'),(104,' ˝\0\0\0ﬁ\0'),(104,' ˛\0\0\0ﬂ\0'),(104,'Ã¸\0\0\0¸\0'),(105,'ΩÂ\0\0\0‹\0'),(105,'æÂ\0\0\0›\0'),(105,'æÈ\0\0\0¸\0'),(106,'âÉ\0\0\0ﬁ\0'),(106,'èÉ\0\0\0ﬁ\0'),(106,'àá\0\0\0ÿ\r\0'),(106,'âÑ\0\0\0ﬂ\0'),(106,'èÑ\0\0\0ﬂ\0'),(107,'≈Â\0\0\0‹\0'),(107,'∆Â\0\0\0›\0'),(107,'∆È\0\0\0¸\0'),(108,'…Â\0\0\0ﬁ\0'),(108,'…Ê\0\0\0ﬂ\0'),(108,'ÃÂ\0\0\0ﬁ\0'),(108,'ÃÊ\0\0\0ﬂ\0'),(108,'ÀÈ\0\0\0¸\0'),(109,'œÈ\0\0\0¸\0'),(109,'–Â\0\0\0‹\0'),(109,'—Â\0\0\0›\0'),(110,'ø˜\0\0\0¸\0'),(110,'ø˚\0\0\0‹\0'),(110,'¿˚\0\0\0›\0'),(110,'√˚\0\0\0‹\0'),(110,'ƒ˚\0\0\0›\0'),(111,'~ç\0\0\0ﬁ\0'),(111,'~é\0\0\0ﬂ\0'),(111,'Äå\0\0\0œ\r\0'),(112,'«˜\0\0\0¸\0'),(112,'∆˙\0\0\0ﬁ\0'),(112,'∆˚\0\0\0ﬂ\0'),(113,'À˜\0\0\0¸\0'),(113,' ˚\0\0\0‹\0'),(113,'À˚\0\0\0›\0'),(114,'œ˜\0\0\0¸\0'),(114,'Œ˙\0\0\0ﬁ\0'),(114,'Œ˚\0\0\0ﬂ\0'),(115,'6&\0\0\0º\0'),(115,'4*\0\0\0á\0'),(115,'4+\0\0\0à\0'),(116,'<!\0\0\0π\0'),(116,';%\0\0\0á\0'),(116,';&\0\0\0à\0'),(117,'>\0\0\0π\0'),(117,'C\0\0\0â\0'),(117,'D\0\0\0ä\0'),(118,'\r\0\0\0‚\0'),(118,'!\r\0\0\0⁄\0'),(118,'!\0\0\0€\0'),(119,'\0\0\0‚\0'),(119,'\"\0\0\0⁄\0'),(119,'\"\0\0\0€\0'),(120,' ¸\0\0\0‚\0'),(120,'#˝\0\0\0⁄\0'),(120,'#˛\0\0\0€\0'),(121,'\0\0\0‚\0'),(121,'\"Ò\0\0\0⁄\0'),(121,'\"Ú\0\0\0€\0'),(122,' Ê\0\0\0‚\0'),(122,'#Ê\0\0\0⁄\0'),(122,'#Á\0\0\0€\0'),(123,' ·\0\0\0‚\0'),(123,'#·\0\0\0⁄\0'),(123,'#‚\0\0\0€\0'),(124,'Ÿ\0\0\0‚\0'),(124,'\"Ÿ\0\0\0⁄\0'),(124,'\"⁄\0\0\0€\0'),(125,'’\0\0\0‚\0'),(125,'\"’\0\0\0⁄\0'),(125,'\"÷\0\0\0€\0'),(126,'—\0\0\0‚\0'),(126,'\"–\0\0\0⁄\0'),(126,'\"—\0\0\0€\0'),(127,'(»\0\0\0Â\0'),(127,')…\0\0\0‡\0'),(127,'*…\0\0\0·\0'),(128,'.»\0\0\0Â\0'),(128,'/…\0\0\0‡\0'),(128,'0…\0\0\0·\0'),(129,'3»\0\0\0Â\0'),(129,'5…\0\0\0‡\0'),(129,'6…\0\0\0·\0'),(130,'9»\0\0\0Â\0'),(130,';…\0\0\0‡\0'),(130,'<…\0\0\0·\0'),(131,'B–\0\0\0‡\0'),(131,'C–\0\0\0·\0'),(131,'E—\0\0\0‚\0'),(132,'Bÿ\0\0\0‡\0'),(132,'BŸ\0\0\0⁄\0'),(132,'B⁄\0\0\0€\0'),(132,'Cÿ\0\0\0·\0'),(132,'F⁄\0\0\0‚\0'),(133,'C‚\0\0\0‡\0'),(133,'D‚\0\0\0·\0'),(133,'E‰\0\0\0‚\0'),(134,'CÍ\0\0\0‡\0'),(134,'DÍ\0\0\0·\0'),(134,'FÏ\0\0\0‚\0'),(135,'>˙\0\0\0‡\0'),(135,'?˙\0\0\0·\0'),(135,'A¯\0\0\0‚\0'),(136,'=˛\0\0\0‡\0'),(136,'>˛\0\0\0·\0'),(136,'A\0\0\0\0‚\0'),(137,'B\0\0\0⁄\0'),(137,'G\0\0\0‚\0'),(137,'B\0\0\0€\0'),(138,'B\0\0\0⁄\0'),(138,'G\0\0\0‚\0'),(138,'B\0\0\0€\0'),(139,'=*\0\0\0⁄\0'),(139,'=+\0\0\0€\0'),(139,'C)\0\0\0‚\0'),(140,'<5\0\0\0⁄\0'),(140,'<6\0\0\0€\0'),(140,'@5\0\0\0‚\0'),(141,'39\0\0\0⁄\0'),(141,'3:\0\0\0€\0'),(141,'0<\0\0\0Â\0'),(142,'$9\0\0\0⁄\0'),(142,'$:\0\0\0€\0'),(142,'&;\0\0\0Â\0'),(143,';\0\0\0Â\0'),(143,'9\0\0\0⁄\0'),(143,':\0\0\0€\0'),(144,'.\0\0\0‚\0'),(144,'/\0\0\0⁄\0'),(144,'0\0\0\0€\0'),(145,')\0\0\0‚\0'),(145,')\0\0\0⁄\0'),(145,'*\0\0\0€\0'),(146,' \0\0\0‚\0'),(146,'$\0\0\0⁄\0'),(146,'$\Z\0\0\0€\0'),(147,'+\0\0\0‡\0'),(147,',\0\0\0·\0'),(147,'&\r\0\0\0‚\0'),(148,'\'\0\0\0‚\0'),(148,'*\0\0\0‡\0'),(148,'+\0\0\0·\0'),(149,'&˛\0\0\0‚\0'),(149,'*˝\0\0\0‡\0'),(149,'+˝\0\0\0·\0'),(150,'&˙\0\0\0‚\0'),(150,'*˚\0\0\0‡\0'),(150,'+˚\0\0\0·\0'),(151,'%\0\0\0‚\0'),(151,'*Ú\0\0\0⁄\0'),(151,'*Û\0\0\0€\0'),(152,'\'Ê\0\0\0‚\0'),(152,'*Á\0\0\0⁄\0'),(152,'*Ë\0\0\0€\0'),(153,'&‡\0\0\0‚\0'),(153,'*‡\0\0\0⁄\0'),(153,'*·\0\0\0€\0'),(154,'%⁄\0\0\0‚\0'),(154,'+⁄\0\0\0⁄\0'),(154,'+€\0\0\0€\0'),(155,'&”\0\0\0‚\0'),(155,'*”\0\0\0⁄\0'),(155,'*‘\0\0\0€\0'),(156,'2œ\0\0\0Â\0'),(156,'5—\0\0\0⁄\0'),(156,'5“\0\0\0€\0'),(157,':’\0\0\0⁄\0'),(157,':÷\0\0\0€\0'),(157,'?◊\0\0\0‚\0'),(158,'9ﬁ\0\0\0⁄\0'),(158,'9ﬂ\0\0\0€\0'),(158,'>‡\0\0\0‚\0'),(159,'8È\0\0\0⁄\0'),(159,'8Í\0\0\0€\0'),(159,'?È\0\0\0‚\0'),(160,'9\0\0\0⁄\0'),(160,'9Ò\0\0\0€\0'),(160,'@\0\0\0‚\0'),(161,'8ˆ\0\0\0‡\0'),(161,'8˜\0\0\0⁄\0'),(161,'9ˆ\0\0\0·\0'),(161,'8¯\0\0\0€\0'),(161,'?¯\0\0\0‚\0'),(162,'9˛\0\0\0⁄\0'),(162,'9ˇ\0\0\0€\0'),(162,'>\0\0\0\0‚\0'),(163,';	\0\0\0⁄\0'),(163,';\n\0\0\0€\0'),(163,'?	\0\0\0‚\0'),(164,';\0\0\0‡\0'),(164,'<\0\0\0·\0'),(164,'?\r\0\0\0‚\0'),(165,'8\0\0\0‚\0'),(165,'4 \0\0\0‡\0'),(165,'5 \0\0\0·\0'),(166,'/\0\0\0⁄\0'),(166,'3\0\0\0Â\0'),(166,'0\0\0\0€\0'),(167,'\'\0\0\0‚\0'),(167,'%\0\0\0⁄\0'),(167,'&\0\0\0€\0'),(168,'“\0\0\0⁄\0'),(168,'“	\0\0\0€\0'),(168,'”\0\0\0⁄\0'),(168,'”	\0\0\0€\0'),(168,'ÿ	\0\0\0\0'),(169,'—\0\0\0‡\0'),(169,'—\0\0\0‡\0'),(169,'“\0\0\0·\0'),(169,'“\0\0\0·\0'),(169,'ÿ\0\0\0\0'),(170,'“˚\0\0\0⁄\0'),(170,'‘˚\0\0\0⁄\0'),(170,'“¸\0\0\0€\0'),(170,'‘¸\0\0\0€\0'),(170,'◊˛\0\0\0\0'),(171,'”ˆ\0\0\0⁄\0'),(171,'”˜\0\0\0€\0'),(171,'‘ˆ\0\0\0⁄\0'),(171,'‘˜\0\0\0€\0'),(171,'◊¯\0\0\0\0'),(172,'€ˆ\0\0\0‡\0'),(172,'‹ˆ\0\0\0·\0'),(172,'ﬁˆ\0\0\0⁄\0'),(172,'ﬁ˜\0\0\0€\0'),(172,'›˚\0\0\0\0'),(173,'·ˆ\0\0\0⁄\0'),(173,'·˜\0\0\0€\0'),(173,'„ˆ\0\0\0⁄\0'),(173,'„˜\0\0\0€\0'),(173,'‚˚\0\0\0\0'),(174,'È¸\0\0\0‡\0'),(174,'Í¸\0\0\0·\0'),(174,'Í\0\0\0\0'),(175,'—	\0\0\0‡\0'),(175,'“	\0\0\0·\0'),(175,'ÿ	\0\0\0\0'),(176,'—\0\0\0⁄\0'),(176,'—\0\0\0€\0'),(176,'ÿ\0\0\0\0'),(177,'€ˆ\0\0\0⁄\0'),(177,'€˜\0\0\0€\0'),(177,'ﬁˆ\0\0\0⁄\0'),(177,'ﬁ˜\0\0\0€\0'),(177,'ﬂ˚\0\0\0\0'),(177,'·ˆ\0\0\0⁄\0'),(177,'·˜\0\0\0€\0'),(177,'‰ˆ\0\0\0⁄\0'),(177,'‰˜\0\0\0€\0'),(178,'È¸\0\0\0⁄\0'),(178,'È˝\0\0\0€\0'),(178,'Ï¸\0\0\0‡\0'),(178,'Ì¸\0\0\0·\0'),(178,'Î\0\0\0\0'),(179,'—Ó\0\0\0⁄\0'),(179,'—Ô\0\0\0€\0'),(179,'‘Ó\0\0\0⁄\0'),(179,'‘Ô\0\0\0€\0'),(179,'‘Ú\0\0\0\0'),(180,'ﬁÔ\0\0\0⁄\0'),(180,'€Ú\0\0\0\0'),(180,'ﬁ\0\0\0€\0'),(181,'‡Ô\0\0\0⁄\0'),(181,'‡\0\0\0€\0'),(181,'„Ú\0\0\0\0'),(182,'€Î\0\0\0\0'),(182,'ﬁÏ\0\0\0⁄\0'),(182,'ﬁÌ\0\0\0€\0'),(183,'‡Ï\0\0\0⁄\0'),(183,'‡Ì\0\0\0€\0'),(183,'ÂÌ\0\0\0\0'),(184,'ËÏ\0\0\0\0'),(184,'ÈÓ\0\0\0‡\0'),(184,'ÍÓ\0\0\0·\0'),(185,'- \0\0\0π\0'),(185,'0«\0\0\0ﬁ\0'),(185,'0»\0\0\0ﬂ\0'),(185,'1 \0\0\0π\0'),(186,'ÈÛ\0\0\0‡\0'),(186,'ÍÛ\0\0\0·\0'),(186,'Í¯\0\0\0\0'),(187,'ÓÚ\0\0\0‡\0'),(187,'ÔÚ\0\0\0·\0'),(187,'Ô¯\0\0\0\0'),(188,'ˆÚ\0\0\0⁄\0'),(188,'ˆÛ\0\0\0€\0'),(188,'˜Ú\0\0\0⁄\0'),(188,'˜Û\0\0\0€\0'),(188,'˙Ù\0\0\0‡\0'),(188,'˙ı\0\0\0‡\0'),(188,'˚Ù\0\0\0·\0'),(188,'˚ı\0\0\0·\0'),(188,'ˆ¯\0\0\0\0'),(189,'–Ó\0\0\0⁄\0'),(189,'–Ô\0\0\0€\0'),(189,'“Ì\0\0\0\0'),(189,'’Ó\0\0\0⁄\0'),(189,'’Ô\0\0\0€\0'),(190,'‹Î\0\0\0\0'),(190,'⁄Ò\0\0\0‡\0'),(190,'€Ò\0\0\0·\0'),(190,'›\0\0\0⁄\0'),(190,'›Ò\0\0\0€\0'),(191,'‡Î\0\0\0\0'),(191,'„Ï\0\0\0‡\0'),(191,'‰Ï\0\0\0·\0'),(191,'ﬂ\0\0\0⁄\0'),(191,'ﬂÒ\0\0\0€\0'),(191,'‰\0\0\0⁄\0'),(191,'‰Ò\0\0\0€\0'),(192,'˜Ú\0\0\0\0'),(192,'ıı\0\0\0‡\0'),(192,'ı˜\0\0\0‡\0'),(192,'ˆı\0\0\0·\0'),(192,'ˆ˜\0\0\0·\0'),(192,'˚ˆ\0\0\0⁄\0'),(192,'˚˜\0\0\0€\0'),(193,'»ˆ\0\0\0‡\0'),(193,'»˜\0\0\0‡\0'),(193,'…ˆ\0\0\0·\0'),(193,'…˜\0\0\0·\0'),(193,'Õ¯\0\0\0\0'),(194,'»\0\0\0\0‡\0'),(194,'»\0\0\0‡\0'),(194,'…\0\0\0\0·\0'),(194,'…\0\0\0·\0'),(194,'Õ\0\0\0\0'),(195,'≈Ç\0\0\0ﬁ\0'),(195,'≈É\0\0\0ﬂ\0'),(195,' Å\0\0\0œ\r\0'),(195,'≈Ñ\0\0\0ﬁ\0'),(195,'≈Ö\0\0\0ﬂ\0'),(196,'…\0\0\0⁄\0'),(196,'…\0\0\0€\0'),(196,'Õ\r\0\0\0\0'),(197,' \0\0\0⁄\0'),(197,' \0\0\0€\0'),(197,'Õ\0\0\0\0'),(198,'«ˆ\0\0\0\0'),(198,'Ãı\0\0\0⁄\0'),(198,'Ãˆ\0\0\0€\0'),(198,'»˘\0\0\0‡\0'),(198,'…˘\0\0\0·\0'),(199,'«ˇ\0\0\0\0'),(199,'Ã˛\0\0\0⁄\0'),(199,'Ãˇ\0\0\0€\0'),(199,'»\0\0\0‡\0'),(199,'»\0\0\0‡\0'),(199,'…\0\0\0·\0'),(199,'…\0\0\0·\0'),(200,'»\0\0\0\0'),(200,'…\0\0\0‡\0'),(200,' \0\0\0·\0'),(201,'Í\0\0\0\0'),(201,'Ë\0\0\0‡\0'),(201,'È\0\0\0·\0'),(201,'Ë\0\0\0‡\0'),(201,'Ë\0\0\0‡\0'),(201,'È\0\0\0·\0'),(201,'È\0\0\0·\0'),(202,'Ú\0\0\0\0'),(202,'Ò\0\0\0⁄\0'),(202,'Ò\0\0\0€\0'),(202,'Ù\0\0\0⁄\0'),(202,'Ù\0\0\0€\0'),(203,'Û\0\0\0\0'),(203,'Ú	\0\0\0‡\0'),(203,'Ú\0\0\0‡\0'),(203,'Û	\0\0\0·\0'),(203,'Û\0\0\0·\0'),(204,'¯\0\0\0\0'),(204,'˜\0\0\0‡\0'),(204,'˜\0\0\0‡\0'),(204,'¯\0\0\0·\0'),(204,'¯\0\0\0·\0'),(205,'Ì¸\0\0\0‡\0'),(205,'Ì˛\0\0\0‡\0'),(205,'Ó¸\0\0\0·\0'),(205,'Ó˛\0\0\0·\0'),(205,'Ó\0\0\0\0'),(206,'Ú¸\0\0\0‡\0'),(206,'Ú˛\0\0\0‡\0'),(206,'Û¸\0\0\0·\0'),(206,'Û˛\0\0\0·\0'),(206,'Û\0\0\0\0'),(207,'˚˚\0\0\0⁄\0'),(207,'˝˚\0\0\0⁄\0'),(207,'¯˛\0\0\0\0'),(207,'˚¸\0\0\0€\0'),(207,'˝¸\0\0\0€\0'),(208,'—\0\0\0⁄\0'),(208,'—\0\0\0€\0'),(208,'”\0\0\0⁄\0'),(208,'”\0\0\0€\0'),(208,'◊\0\0\0⁄\0'),(208,'◊\0\0\0€\0'),(208,'’\0\0\0\0'),(209,'‹\0\0\0⁄\0'),(209,'‹\0\0\0€\0'),(209,'ﬁ\0\0\0\0'),(210,'·\0\0\0\0'),(210,'„\0\0\0⁄\0'),(210,'„\0\0\0€\0'),(211,'È\0\0\0⁄\0'),(211,'È\0\0\0€\0'),(211,'Î\0\0\0⁄\0'),(211,'Î\0\0\0€\0'),(211,'Í\0\0\0\0'),(212,'Ú\0\0\0⁄\0'),(212,'Ú\0\0\0€\0'),(212,'Ù\0\0\0\0'),(213,'˙\0\0\0⁄\0'),(213,'˙\0\0\0€\0'),(213,'˘\0\0\0\0'),(214,'Ô¸\0\0\0⁄\0'),(214,'Ô˝\0\0\0€\0'),(214,'Ù¸\0\0\0⁄\0'),(214,'Ù˝\0\0\0€\0'),(214,'Ó\0\0\0\0'),(214,'Û\0\0\0‡\0'),(214,'Ù\0\0\0·\0'),(215,'˘˚\0\0\0⁄\0'),(215,'˚˚\0\0\0⁄\0'),(215,'˘¸\0\0\0€\0'),(215,'˚¸\0\0\0€\0'),(215,'˝\0\0\0\0\0'),(216,'¬w\0\0\0‹\0'),(216,'√w\0\0\0›\0'),(216,'≈w\0\0\0ﬁ\0'),(216,'≈x\0\0\0ﬂ\0'),(216,'∆|\0\0\0ÿ\r\0'),(217,'…t\0\0\0ﬁ\0'),(217,'…u\0\0\0ﬂ\0'),(217,'Ãt\0\0\0ﬁ\0'),(217,'Ãu\0\0\0ﬂ\0'),(217,'Ày\0\0\0œ\r\0'),(218,'–u\0\0\0ﬁ\0'),(218,'–v\0\0\0ﬂ\0'),(218,'“y\0\0\0œ\r\0'),(219,'–\0\0\0œ\r\0'),(219,'“Ç\0\0\0ﬁ\0'),(219,'“É\0\0\0ﬂ\0'),(220,'q‹\0\0\0˛\0'),(220,'qﬁ\0\0\0œ\r\0'),(220,'r‹\0\0\0ˇ\0'),(221,'x‹\0\0\0˛\0'),(221,'xﬁ\0\0\0œ\r\0'),(221,'y‹\0\0\0ˇ\0'),(222,'r„\0\0\0˛\0'),(222,'s„\0\0\0ˇ\0'),(222,'t‰\0\0\0ÿ\r\0'),(223,'~‚\0\0\0ÿ\r\0'),(223,'Ç·\0\0\0¸\0'),(223,'Ç‚\0\0\0˝\0'),(224,'sÍ\0\0\0˛\0'),(224,'tÍ\0\0\0ˇ\0'),(224,'tÌ\0\0\0œ\r\0'),(225,'xÍ\0\0\0¸\0'),(225,'xÎ\0\0\0˝\0'),(225,'|Ï\0\0\0ÿ\r\0'),(226,'ÄÍ\0\0\0ÿ\r\0'),(226,'ÉË\0\0\0˛\0'),(226,'ÑË\0\0\0ˇ\0'),(227,'âÁ\0\0\0¸\0'),(227,'âË\0\0\0˝\0'),(227,'ãÈ\0\0\0œ\r\0'),(228,'sÚ\0\0\0˛\0'),(228,'tÚ\0\0\0ˇ\0'),(228,'uı\0\0\0œ\r\0'),(229,'xÛ\0\0\0¸\0'),(229,'zÒ\0\0\0œ\r\0'),(229,'xÙ\0\0\0˝\0'),(230,'ÉÔ\0\0\0œ\r\0'),(230,'Ä\0\0\0¸\0'),(230,'ÄÒ\0\0\0˝\0'),(231,'ãÌ\0\0\0˛\0'),(231,'åÌ\0\0\0ˇ\0'),(231,'ã\0\0\0œ\r\0'),(232,'ìÓ\0\0\0¸\0'),(232,'ìÔ\0\0\0˝\0'),(232,'ëÒ\0\0\0ÿ\r\0'),(233,'v˙\0\0\0¸\0'),(233,'v˚\0\0\0˝\0'),(233,'x˘\0\0\0œ\r\0'),(234,'}ˇ\0\0\0œ\r\0'),(234,'}\0\0\0˛\0'),(234,'~\0\0\0ˇ\0'),(235,'ëı\0\0\0œ\r\0'),(235,'ìˆ\0\0\0¸\0'),(235,'ì˜\0\0\0˝\0'),(236,'é˛\0\0\0ÿ\r\0'),(236,'ë˛\0\0\0˛\0'),(236,'í˛\0\0\0ˇ\0'),(237,'à˛\0\0\0¸\0'),(237,'àˇ\0\0\0˝\0'),(237,'á\0\0\0œ\r\0'),(238,'è\0\0\0œ\r\0'),(238,'í\0\0\0¸\0'),(238,'í\0\0\0˝\0'),(239,'É\0\0\0¸\0'),(239,'É\0\0\0˝\0'),(239,'à	\0\0\0ÿ\r\0'),(240,'è\n\0\0\0œ\r\0'),(240,'è\r\0\0\0˛\0'),(240,'ê\r\0\0\0ˇ\0'),(241,'ô\0\0\0œ\r\0'),(241,'ú\0\0\0¸\0'),(241,'ú\0\0\0˝\0'),(242,'ñ\0\0\0¸\0'),(242,'ñ\0\0\0˝\0'),(242,'ô\r\0\0\0œ\r\0'),(243,'°\0\0\0˛\0'),(243,'¢\0\0\0ˇ\0'),(243,'ü\0\0\0ÿ\r\0'),(244,'âã\0\0\0œ\r\0'),(244,'áå\0\0\0‹\0'),(244,'áé\0\0\0‹\0'),(244,'àå\0\0\0›\0'),(244,'àé\0\0\0›\0'),(245,'®°\0\0\0|\0'),(245,'©°\0\0\0}\0'),(245,'®•\0\0\0|\0'),(245,'©•\0\0\0}\0'),(245,'≠§\0\0\0é\0'),(246,'è\0Ä\0\0\0‹\0'),(246,'ê\0Ä\0\0\0›\0'),(246,'ï\0É\0\0\0⁄\0'),(247,'è\0á\0\0\0ﬁ\0'),(247,'è\0à\0\0\0ﬂ\0'),(247,'è\0å\0\0\0ﬁ\0'),(247,'è\0ç\0\0\0ﬂ\0'),(247,'ï\0ã\0\0\0⁄\0'),(248,'è\0è\0\0\0ﬁ\0'),(248,'ë\0è\0\0\0ﬁ\0'),(248,'è\0ê\0\0\0ﬂ\0'),(248,'ë\0ê\0\0\0ﬂ\0'),(248,'ï\0ë\0\0\0⁄\0'),(249,'è\0ñ\0\0\0ﬁ\0'),(249,'è\0ó\0\0\0ﬂ\0'),(249,'è\0ö\0\0\0ﬁ\0'),(249,'è\0õ\0\0\0ﬂ\0'),(249,'ï\0ö\0\0\0⁄\0'),(250,'è\0†\0\0\0ﬁ\0'),(250,'è\0°\0\0\0ﬂ\0'),(250,'è\0£\0\0\0ﬁ\0'),(250,'è\0§\0\0\0ﬂ\0'),(250,'ï\0¢\0\0\0⁄\0'),(251,'è\0¶\0\0\0ﬁ\0'),(251,'è\0ß\0\0\0ﬂ\0'),(251,'è\0®\0\0\0ﬁ\0'),(251,'è\0©\0\0\0ﬂ\0'),(251,'ï\0®\0\0\0⁄\0'),(252,'ü\0¶\0\0\0ﬁ\0'),(252,'ü\0ß\0\0\0ﬂ\0'),(252,'õ\0®\0\0\0⁄\0'),(252,'†\0¶\0\0\0‹\0'),(252,'°\0¶\0\0\0›\0'),(253,'†\0û\0\0\0‹\0'),(253,'°\0û\0\0\0›\0'),(253,'õ\0°\0\0\0⁄\0'),(254,'õ\0ô\0\0\0⁄\0'),(254,'†\0ñ\0\0\0‹\0'),(254,'°\0ñ\0\0\0›\0'),(254,'†\0ò\0\0\0‹\0'),(254,'°\0ò\0\0\0›\0'),(255,'ü\0è\0\0\0ﬁ\0'),(255,'°\0è\0\0\0ﬁ\0'),(255,'õ\0ë\0\0\0⁄\0'),(255,'ü\0ê\0\0\0ﬂ\0'),(255,'°\0ê\0\0\0ﬂ\0'),(256,'ú\0á\0\0\0‹\0'),(256,'ù\0á\0\0\0›\0'),(256,'õ\0ä\0\0\0⁄\0'),(256,'ú\0ç\0\0\0‹\0'),(256,'ù\0ç\0\0\0›\0'),(257,'õ\0É\0\0\0⁄\0'),(257,'ú\0Ä\0\0\0‹\0'),(257,'ù\0Ä\0\0\0›\0'),(258,'KÉ\0\0\0‹\0'),(258,'LÉ\0\0\0›\0'),(258,'JÖ\0\0\0ÿ\r\0'),(258,'NÑ\0\0\0ÿ\r\0'),(259,'CÇ\0\0\0–\r\0'),(259,'EÉ\0\0\0ﬁ\0'),(259,'CÜ\0\0\0–\r\0'),(259,'EÑ\0\0\0ﬂ\0'),(260,':Å\0\0\0–\r\0'),(260,'<Ç\0\0\0ﬁ\0'),(260,'<É\0\0\0ﬂ\0'),(260,'=Ñ\0\0\0ÿ\r\0'),(261,'8t\0\0\0ﬁ\0'),(261,'8u\0\0\0ﬂ\0'),(261,'=v\0\0\0ÿ\r\0'),(261,':x\0\0\0–\r\0'),(262,'5n\0\0\0ﬁ\0'),(262,'5o\0\0\0ﬂ\0'),(262,'7l\0\0\0–\r\0'),(262,'8p\0\0\0–\r\0'),(263,'@l\0\0\0–\r\0'),(263,'Bn\0\0\0ﬁ\0'),(263,'Bo\0\0\0ﬂ\0'),(263,'Ap\0\0\0–\r\0'),(264,'Kk\0\0\0–\r\0'),(264,'Il\0\0\0ﬁ\0'),(264,'Im\0\0\0ﬂ\0'),(264,'Kp\0\0\0–\r\0'),(265,'Ui\0\0\0–\r\0'),(265,'Rl\0\0\0ﬁ\0'),(265,'Rm\0\0\0ﬂ\0'),(265,'Vn\0\0\0–\r\0'),(266,'ci\0\0\0–\r\0'),(266,'ej\0\0\0‹\0'),(266,'fj\0\0\0›\0'),(266,'dn\0\0\0–\r\0'),(267,'az\0\0\0ÿ\r\0'),(267,'ey\0\0\0‹\0'),(267,'fy\0\0\0›\0'),(267,'c|\0\0\0–\r\0'),(268,'Rz\0\0\0ﬁ\0'),(268,'R{\0\0\0ﬂ\0'),(268,'Wx\0\0\0–\r\0'),(268,'W|\0\0\0–\r\0'),(269,'Fw\0\0\0ﬁ\0'),(269,'Hv\0\0\0–\r\0'),(269,'Fx\0\0\0ﬂ\0'),(269,'H|\0\0\0–\r\0'),(270,'*Z\0\0\0É\0'),(270,'*[\0\0\0Ñ\0'),(270,'&]\0\0\0Ü\0'),(270,'*]\0\0\0Ü\0'),(270,'(^\0\0\0Â\0'),(271,'.c\0\0\0Ü\0'),(271,'/d\0\0\0Â\0'),(271,'0b\0\0\0Ü\0'),(272,'6f\0\0\0Ü\0'),(272,'5i\0\0\0É\0'),(272,'5j\0\0\0Ñ\0'),(272,'7k\0\0\0Â\0'),(273,'Gf\0\0\0É\0'),(273,'Gg\0\0\0Ñ\0'),(273,'If\0\0\0É\0'),(273,'Ig\0\0\0Ñ\0'),(273,'Gk\0\0\0Â\0'),(275,'ND\0\0\0Ü\0'),(275,'OF\0\0\0‚\0'),(276,'E?\0\0\0Â\0'),(276,'EB\0\0\0É\0'),(276,'EC\0\0\0Ñ\0'),(276,'GB\0\0\0É\0'),(276,'GC\0\0\0Ñ\0'),(276,'GB\0\0\0É\0'),(276,'GC\0\0\0Ñ\0'),(277,'7@\0\0\0É\0'),(277,'7A\0\0\0Ñ\0'),(277,'9@\0\0\0É\0'),(277,'<A\0\0\0‚\0'),(278,',S\0\0\0É\0'),(278,'/P\0\0\0Â\0'),(278,',T\0\0\0Ñ\0'),(278,'0S\0\0\0É\0'),(278,'0T\0\0\0Ñ\0'),(279,',J\0\0\0É\0'),(279,',K\0\0\0Ñ\0'),(279,'/M\0\0\0Â\0'),(279,'0J\0\0\0É\0'),(279,'0K\0\0\0Ñ\0'),(280,'&S\0\0\0É\0'),(280,'(P\0\0\0Â\0'),(280,'*S\0\0\0É\0'),(280,'&T\0\0\0Ñ\0'),(280,'*T\0\0\0Ñ\0'),(281,'&J\0\0\0É\0'),(281,'&K\0\0\0Ñ\0'),(281,'*J\0\0\0É\0'),(281,'*K\0\0\0Ñ\0'),(281,')M\0\0\0Â\0'),(282,'S\0\0\0É\0'),(282,'T\0\0\0Ñ\0'),(282,'!P\0\0\0Â\0'),(282,'$S\0\0\0É\0'),(282,'$T\0\0\0Ñ\0'),(283,'J\0\0\0É\0'),(283,'K\0\0\0Ñ\0'),(283,'$J\0\0\0É\0'),(283,'$K\0\0\0Ñ\0'),(283,'\"M\0\0\0Â\0'),(284,'S\0\0\0É\0'),(284,'P\0\0\0Â\0'),(284,'S\0\0\0É\0'),(284,'T\0\0\0Ñ\0'),(284,'T\0\0\0Ñ\0'),(285,'J\0\0\0É\0'),(285,'K\0\0\0Ñ\0'),(285,'J\0\0\0É\0'),(285,'K\0\0\0Ñ\0'),(285,'M\0\0\0Â\0'),(286,'J\0\0\0Ü\0'),(286,'O\0\0\0Ü\0'),(286,'O\0\0\0‚\0'),(286,'T\0\0\0Ü\0'),(287,';E\0\0\0É\0'),(287,';F\0\0\0Ñ\0'),(287,'>E\0\0\0É\0'),(287,'>F\0\0\0Ñ\0'),(287,'<K\0\0\0Â\0'),(288,'<N\0\0\0Â\0'),(288,';Q\0\0\0Ü\0'),(288,';S\0\0\0Ü\0'),(289,'d\0\0\0º\0'),(289,'f\0\0\0⁄\0'),(289,'f\0\0\0€\0'),(289,'e\0\0\0º\0'),(290,'k\0\0\0⁄\0'),(290,'m\0\0\0º\0'),(290,'k\0\0\0€\0'),(290,'m\0\0\0º\0'),(291,'l\0\0\0‡\0'),(291,'m\0\0\0·\0'),(291,'n\Z\0\0\0º\0'),(291,'n\0\0\0º\0'),(292,'f\0\0\0º\0'),(292,'e\0\0\0º\0'),(292,'f\0\0\0‡\0'),(292,'g\0\0\0·\0'),(294,'Ûó\0\0\0⁄\0'),(294,'Ûò\0\0\0€\0'),(294,'˜ô\0\0\0i\0'),(295,'Ûû\0\0\0⁄\0'),(295,'Ûü\0\0\0€\0'),(295,'˜†\0\0\0i\0'),(296,'Û•\0\0\0⁄\0'),(296,'Û¶\0\0\0€\0'),(296,'˜ß\0\0\0i\0'),(297,'ÛØ\0\0\0‡\0'),(297,'ÙØ\0\0\0·\0'),(297,'˜Æ\0\0\0i\0'),(298,'Û≥\0\0\0⁄\0'),(298,'Û¥\0\0\0€\0'),(298,'˜µ\0\0\0i\0'),(299,'Û∫\0\0\0‡\0'),(299,'Ù∫\0\0\0·\0'),(299,'ÛΩ\0\0\0‡\0'),(299,'ÙΩ\0\0\0·\0'),(299,'˜º\0\0\0i\0'),(300,'Û¡\0\0\0⁄\0'),(300,'Û¬\0\0\0€\0'),(300,'˜√\0\0\0i\0'),(301,'ˇï\0\0\0⁄\0'),(301,'ˇñ\0\0\0€\0'),(301,'ô\0\0\0l\0'),(302,'ó\0\0\0⁄\0'),(302,'ò\0\0\0€\0'),(302,'õ\0\0\0l\0'),(303,'ó\0\0\0⁄\0'),(303,'ò\0\0\0€\0'),(303,'õ\0\0\0l\0'),(304,'ó\0\0\0‡\0'),(304,'ó\0\0\0·\0'),(304,'õ\0\0\0l\0'),(305,'#ó\0\0\0⁄\0'),(305,'#ò\0\0\0€\0'),(305,'%õ\0\0\0l\0'),(306,'*ó\0\0\0‡\0'),(306,'+ó\0\0\0·\0'),(306,',õ\0\0\0l\0'),(307,'.û\0\0\0i\0'),(307,'2ú\0\0\0⁄\0'),(307,'2ù\0\0\0€\0'),(308,'ˇ•\0\0\0⁄\0'),(308,'ˇ¶\0\0\0€\0'),(308,'©\0\0\0l\0'),(309,'•\0\0\0⁄\0'),(309,'¶\0\0\0€\0'),(309,'©\0\0\0l\0'),(310,'\r•\0\0\0‡\0'),(310,'•\0\0\0·\0'),(310,'©\0\0\0l\0'),(311,'•\0\0\0⁄\0'),(311,'¶\0\0\0€\0'),(311,'©\0\0\0l\0'),(312,'•\0\0\0‡\0'),(312,'•\0\0\0·\0'),(312,'©\0\0\0l\0'),(313,'\"•\0\0\0⁄\0'),(313,'\"¶\0\0\0€\0'),(313,'%•\0\0\0⁄\0'),(313,'%¶\0\0\0€\0'),(313,'$©\0\0\0l\0'),(314,')•\0\0\0⁄\0'),(314,')¶\0\0\0€\0'),(314,'+©\0\0\0l\0'),(315,'-¨\0\0\0i\0'),(315,'1™\0\0\0⁄\0'),(315,'1´\0\0\0€\0'),(316,'+Æ\0\0\0l\0'),(316,')≤\0\0\0‡\0'),(316,'*≤\0\0\0·\0'),(317,'$Æ\0\0\0l\0'),(317,'\"≤\0\0\0‡\0'),(317,'#≤\0\0\0·\0'),(318,'Æ\0\0\0l\0'),(318,'Ø\0\0\0⁄\0'),(318,'∞\0\0\0€\0'),(319,'Æ\0\0\0l\0'),(319,'≤\0\0\0‡\0'),(319,'≤\0\0\0·\0'),(320,'Æ\0\0\0l\0'),(320,'\r≤\0\0\0‡\0'),(320,'≤\0\0\0·\0'),(321,'Æ\0\0\0l\0'),(321,'≤\0\0\0‡\0'),(321,'≤\0\0\0·\0'),(322,'ˇ≤\0\0\0‡\0'),(322,'Æ\0\0\0l\0'),(322,'\0≤\0\0\0·\0'),(323,'π\0\0\0⁄\0'),(323,'∫\0\0\0€\0'),(323,'Ω\0\0\0l\0'),(324,'	π\0\0\0⁄\0'),(324,'	∫\0\0\0€\0'),(324,'Ω\0\0\0l\0'),(325,'\rπ\0\0\0⁄\0'),(325,'\r∫\0\0\0€\0'),(325,'Ω\0\0\0l\0'),(326,'π\0\0\0⁄\0'),(326,'∫\0\0\0€\0'),(326,'Ω\0\0\0l\0'),(327,'π\0\0\0‡\0'),(327,'π\0\0\0·\0'),(327,'Ω\0\0\0l\0'),(328,'#π\0\0\0⁄\0'),(328,'#∫\0\0\0€\0'),(328,'&π\0\0\0⁄\0'),(328,'&∫\0\0\0€\0'),(328,'%Ω\0\0\0l\0'),(329,'*π\0\0\0⁄\0'),(329,'*∫\0\0\0€\0'),(329,'-π\0\0\0⁄\0'),(329,'-∫\0\0\0€\0'),(329,',Ω\0\0\0l\0'),(330,'/æ\0\0\0‡\0'),(330,'0æ\0\0\0·\0'),(330,'2æ\0\0\0⁄\0'),(330,'2ø\0\0\0€\0'),(330,'.¿\0\0\0i\0'),(331,',¬\0\0\0l\0'),(331,'*∆\0\0\0‡\0'),(331,'+∆\0\0\0·\0'),(332,'%¬\0\0\0l\0'),(332,'&ƒ\0\0\0⁄\0'),(332,'&≈\0\0\0€\0'),(333,'¬\0\0\0l\0'),(333,'∆\0\0\0‡\0'),(333,'∆\0\0\0·\0'),(334,'¬\0\0\0l\0'),(334,'ƒ\0\0\0⁄\0'),(334,'≈\0\0\0€\0'),(335,'¬\0\0\0l\0'),(335,'\r∆\0\0\0‡\0'),(335,'∆\0\0\0·\0'),(336,'¬\0\0\0l\0'),(336,'∆\0\0\0‡\0'),(336,'∆\0\0\0·\0'),(337,'¬\0\0\0l\0'),(337,'ƒ\0\0\0⁄\0'),(337,'≈\0\0\0€\0'),(338,'˝z\0\0\0i\0'),(338,'v\0\0\0⁄\0'),(338,'w\0\0\0€\0'),(338,'}\0\0\0‡\0'),(338,'}\0\0\0·\0'),(339,'ë‚\0\0\0l\0'),(339,'ì‰\0\0\0i\0'),(340,'ú⁄\0\0\0l\0'),(341,'™ﬁ\0\0\0l\0'),(341,'™·\0\0\0l\0'),(342,'•‘\0\0\0l\0'),(342,'¶ÿ\0\0\0l\0'),(343,'≠«\0\0\0l\0'),(343,'¨ \0\0\0l\0'),(344,'π°\0\0\0⁄\0'),(344,'π¢\0\0\0€\0'),(344,'∫¶\0\0\0l\0'),(345,'√†\0\0\0l\0'),(345,'√•\0\0\0‹\0'),(345,'ƒ•\0\0\0›\0'),(346,' °\0\0\0‹\0'),(346,'À°\0\0\0›\0'),(346,' ¶\0\0\0l\0'),(347,'“†\0\0\0l\0'),(347,'–•\0\0\0‡\0'),(347,'—•\0\0\0·\0'),(348,'‹°\0\0\0⁄\0'),(348,'‹¢\0\0\0€\0'),(348,'⁄¶\0\0\0l\0'),(349,'Â°\0\0\0‹\0'),(349,'Ê°\0\0\0›\0'),(349,'Ë¶\0\0\0l\0'),(350,'Ô†\0\0\0l\0'),(350,'§\0\0\0ﬁ\0'),(350,'•\0\0\0ﬂ\0'),(351,'˘°\0\0\0ﬁ\0'),(351,'˘¢\0\0\0ﬂ\0'),(351,'¯¶\0\0\0l\0'),(352,'˛•\0\0\0‡\0'),(352,'ˇ•\0\0\0·\0'),(352,'\0†\0\0\0l\0'),(353,'°\0\0\0⁄\0'),(353,'¢\0\0\0€\0'),(353,'¶\0\0\0l\0'),(354,'∑Ø\0\0\0i\0'),(354,'π∞\0\0\0ﬁ\0'),(354,'π±\0\0\0ﬂ\0'),(355,'æ´\0\0\0l\0'),(355,'Ω∞\0\0\0ﬁ\0'),(355,'Ω±\0\0\0ﬂ\0'),(356,'ƒØ\0\0\0i\0'),(356,'¬±\0\0\0‹\0'),(356,'√±\0\0\0›\0'),(357,'œØ\0\0\0i\0'),(357,'–¨\0\0\0‹\0'),(357,'—¨\0\0\0›\0'),(358,'÷´\0\0\0l\0'),(358,'÷∞\0\0\0ﬁ\0'),(358,'÷±\0\0\0ﬂ\0'),(359,'⁄¨\0\0\0ﬁ\0'),(359,'⁄≠\0\0\0ﬂ\0'),(359,'ﬁ≠\0\0\0i\0'),(359,'⁄∞\0\0\0‹\0'),(359,'€∞\0\0\0›\0'),(360,'„≠\0\0\0i\0'),(360,'Á¨\0\0\0ﬁ\0'),(360,'Á≠\0\0\0ﬂ\0'),(360,'Á∞\0\0\0ﬁ\0'),(360,'Á±\0\0\0ﬂ\0'),(361,'Î´\0\0\0l\0'),(361,'ÏÆ\0\0\0ﬁ\0'),(361,'ÏØ\0\0\0ﬂ\0'),(362,'ÚØ\0\0\0i\0'),(362,'±\0\0\0‹\0'),(362,'Ò±\0\0\0›\0'),(363,'˝Ø\0\0\0i\0'),(363,'˛±\0\0\0‹\0'),(363,'ˇ±\0\0\0›\0'),(364,'´\0\0\0l\0'),(364,'≠\0\0\0ﬁ\0'),(364,'Æ\0\0\0ﬂ\0'),(365,'\nØ\0\0\0i\0'),(365,'	±\0\0\0›\0'),(366,'∏µ\0\0\0ﬁ\0'),(366,'∏∂\0\0\0ﬂ\0'),(366,'ª∑\0\0\0l\0'),(367,'¬∂\0\0\0‹\0'),(367,'¬∑\0\0\0l\0'),(367,'√∂\0\0\0›\0'),(368,'–µ\0\0\0‹\0'),(368,'—µ\0\0\0›\0'),(368,'“∑\0\0\0l\0'),(369,'Óµ\0\0\0‹\0'),(369,'Ôµ\0\0\0›\0'),(369,'∑\0\0\0l\0'),(370,'\0∑\0\0\0l\0'),(370,'µ\0\0\0ﬁ\0'),(370,'∂\0\0\0ﬂ\0'),(371,'∑\0\0\0l\0'),(371,'	µ\0\0\0ﬁ\0'),(371,'	∂\0\0\0ﬂ\0'),(372,'ΩΩ\0\0\0l\0'),(372,'¿ƒ\0\0\0‡\0'),(372,'¡ƒ\0\0\0·\0'),(373,'Ω\0\0\0l\0'),(373,'\0√\0\0\0⁄\0'),(373,'\0ƒ\0\0\0€\0'),(374,'∏…\0\0\0⁄\0'),(374,'∏ \0\0\0€\0'),(374,'Ω–\0\0\0l\0'),(375,'œ\0\0\0‡\0'),(375,'	œ\0\0\0·\0'),(375,'–\0\0\0l\0'),(376,'„›\0\0\0û\0'),(376,'„‡\0\0\0û\0'),(377,'Îﬂ\0\0\0û\0'),(377,'Í‚\0\0\0û\0'),(378,'§™\0\0\0~\0'),(378,'§´\0\0\0\0'),(378,'®¨\0\0\0é\0'),(379,'∆o\0\0\0\0⁄\0'),(379,'√q\0\0\0\0ı\Z\0'),(379,'∆p\0\0\0\0€\0'),(380,'æs\0\0\0\0‡\0'),(380,'øs\0\0\0\0·\0'),(380,'¡q\0\0\0\0ı\Z\0'),(381,'∑f\0\0\0\0ı\Z\0'),(381,'∫e\0\0\0\0⁄\0'),(381,'∫f\0\0\0\0€\0'),(382,'Øh\0\0\0\0‡\0'),(382,'≤g\0\0\0\0ı\Z\0'),(382,'∞h\0\0\0\0·\0'),(383,'Øa\0\0\0\0‡\0'),(383,'∞a\0\0\0\0·\0'),(383,'≤c\0\0\0\0ı\Z\0'),(384,'Ø]\0\0\0\0‡\0'),(384,'Ø_\0\0\0\0‡\0'),(384,'∞]\0\0\0\0·\0'),(384,'∞_\0\0\0\0·\0'),(384,'¥`\0\0\0\0Ï\Z\0'),(385,'∂]\0\0\0\0⁄\0'),(385,'∂^\0\0\0\0€\0'),(385,'∏`\0\0\0\0Ï\Z\0'),(386,'øV\0\0\0\0⁄\0'),(386,'øW\0\0\0\0€\0'),(386,'¬Z\0\0\0\0ı\Z\0'),(387,'√T\0\0\0\0⁄\0'),(387,'√U\0\0\0\0€\0'),(387,'ƒX\0\0\0\0Ï\Z\0'),(388,'»W\0\0\0\0‡\0'),(388,'…W\0\0\0\0·\0'),(388,'∆Z\0\0\0\0ı\Z\0'),(389,'“U\0\0\0\0ı\Z\0'),(389,'’W\0\0\0\0‡\0'),(389,'÷T\0\0\0\0⁄\0'),(389,'÷U\0\0\0\0€\0'),(389,'÷W\0\0\0\0·\0'),(390,'ÂM\0\0\0\0⁄\0'),(390,'ÂN\0\0\0\0€\0'),(390,'ÈP\0\0\0\0z\0'),(391,'ÔR\0\0\0\0É\0'),(391,'ÚP\0\0\0\0⁄\0'),(391,'ÚQ\0\0\0\0€\0'),(392,'ÓT\0\0\0\0z\0'),(392,'ÒU\0\0\0\0⁄\0'),(392,'ÒV\0\0\0\0€\0'),(393,'œm\0\0\0\0‡\0'),(393,'–j\0\0\0\0Ï\Z\0'),(393,'–m\0\0\0\0·\0'),(394,'“o\0\0\0\0⁄\0'),(394,'Õp\0\0\0\0ı\Z\0'),(394,'“p\0\0\0\0€\0'),(395,'’n\0\0\0\0Û\Z\0'),(395,'‘q\0\0\0\0‡\0'),(395,'’q\0\0\0\0·\0'),(395,'◊q\0\0\0\0ı\Z\0'),(396,'–w\0\0\0\0‡\0'),(396,'—w\0\0\0\0·\0'),(396,'—w\0\0\0\0Ï\Z\0'),(397,'”z\0\0\0\0⁄\0'),(397,'”{\0\0\0\0€\0'),(397,'—z\0\0\0\0Ï\Z\0'),(398,'‘u\0\0\0\0⁄\0'),(398,'‘v\0\0\0\0€\0'),(398,'÷u\0\0\0\0⁄\0'),(398,'÷v\0\0\0\0€\0'),(398,'”y\0\0\0\0ı\Z\0'),(399,'‘{\0\0\0\0‡\0'),(399,'’{\0\0\0\0·\0'),(399,'Ÿz\0\0\0\0Ï\Z\0'),(400,'“\\\0\0\0\0‡\0'),(400,'”\\\0\0\0\0·\0'),(400,'”_\0\0\0\0Î\Z\0'),(400,'’\\\0\0\0\0⁄\0'),(400,'’]\0\0\0\0€\0'),(400,'÷_\0\0\0\0Î\Z\0'),(400,'“b\0\0\0\0‡\0'),(400,'”b\0\0\0\0·\0'),(400,'‘a\0\0\0\0ı\Z\0'),(400,'’c\0\0\0\0Ï\Z\0'),(400,'”e\0\0\0\0ı\Z\0'),(401,'“\\\0\0\0\0⁄\0'),(401,'“]\0\0\0\0€\0'),(401,'◊]\0\0\0\0ı\Z\0'),(402,'’U\0\0\0\0ı\Z\0'),(402,'÷W\0\0\0\0‡\0'),(402,'◊W\0\0\0\0·\0'),(403,'ﬁk\0\0\0\0ı\Z\0'),(403,'·j\0\0\0\0⁄\0'),(403,'·k\0\0\0\0€\0'),(404,'∂]\0\0\0\0⁄\0'),(404,'∂^\0\0\0\0€\0'),(404,'∏`\0\0\0\0Ï\Z\0'),(405,'Ø]\0\0\0\0‡\0'),(405,'Ø_\0\0\0\0‡\0'),(405,'∞]\0\0\0\0·\0'),(405,'∞_\0\0\0\0·\0'),(405,'¥`\0\0\0\0Ï\Z\0'),(406,'Øc\0\0\0\0Ô\Z\0'),(406,'±a\0\0\0\0⁄\0'),(406,'±b\0\0\0\0€\0'),(406,'≤e\0\0\0\0ı\Z\0'),(407,'æo\0\0\0\0⁄\0'),(407,'æp\0\0\0\0€\0'),(407,'¿n\0\0\0\0Ï\Z\0'),(407,'¿r\0\0\0\0Ï\Z\0'),(408,'√o\0\0\0\0⁄\0'),(408,'≈n\0\0\0\0Ï\Z\0'),(408,'√p\0\0\0\0€\0'),(408,'≈r\0\0\0\0Ï\Z\0'),(409,'ﬂj\0\0\0\0‡\0'),(409,'‡j\0\0\0\0·\0'),(409,'„i\0\0\0\0Ï\Z\0'),(409,'·l\0\0\0\0ı\Z\0'),(410,'Âh\0\0\0\0ı\Z\0'),(410,'Áj\0\0\0\0Ï\Z\0'),(410,'Ëk\0\0\0\0⁄\0'),(410,'Ël\0\0\0\0€\0'),(411,'¯K\0\0\0\0⁄\0'),(411,'ˆN\0\0\0\0Ï\Z\0'),(411,'¯L\0\0\0\0€\0'),(412,'˚S\0\0\0\0⁄\0'),(412,'˚T\0\0\0\0€\0'),(412,'˙T\0\0\0\0ı\Z\0'),(413,'¯K\0\0\0\0⁄\0'),(413,'ÙM\0\0\0\0ı\Z\0'),(413,'¯L\0\0\0\0€\0'),(414,'›J\0\0\0\0‡\0'),(414,'ﬁJ\0\0\0\0·\0'),(414,'‡M\0\0\0\0Î\Z\0'),(415,'ÆÆ\0\0\0|\0'),(415,'ØÆ\0\0\0}\0'),(415,'´∞\0\0\0é\0'),(416,'¨≥\0\0\0|\0'),(416,'≠≥\0\0\0}\0'),(416,'¨∂\0\0\0|\0'),(416,'≠∂\0\0\0}\0'),(416,'µ¥\0\0\0é\0'),(417,'®°\0\0\0~\0'),(417,'®¢\0\0\0\0'),(417,'≠¢\0\0\0é\0'),(417,'®•\0\0\0|\0'),(417,'©•\0\0\0}\0'),(418,'¨Æ\0\0\0|\0'),(418,'≠Æ\0\0\0}\0'),(418,'¨±\0\0\0|\0'),(418,'≠±\0\0\0}\0'),(418,'µ∞\0\0\0é\0'),(419,'¨≥\0\0\0|\0'),(419,'≠≥\0\0\0}\0'),(419,'Æ∑\0\0\0ê\0'),(420,'±≥\0\0\0|\0'),(420,'≤≥\0\0\0}\0'),(420,'≥∑\0\0\0ê\0'),(421,'±Æ\0\0\0|\0'),(421,'≤Æ\0\0\0}\0'),(421,'µ±\0\0\0é\0'),(422,'ªÆ\0\0\0~\0'),(422,'ªØ\0\0\0\0'),(422,'ΩÆ\0\0\0|\0'),(422,'æÆ\0\0\0}\0'),(422,'√∞\0\0\0é\0'),(423,'ª≥\0\0\0~\0'),(423,'ª¥\0\0\0\0'),(423,'Ω¥\0\0\0|\0'),(423,'æ¥\0\0\0}\0'),(423,'√≥\0\0\0é\0'),(424,'ªÆ\0\0\0~\0'),(424,'ªØ\0\0\0\0'),(424,'æÆ\0\0\0~\0'),(424,'æØ\0\0\0\0'),(424,'Ωµ\0\0\0ê\0'),(425,'¬Æ\0\0\0~\0'),(425,'¬Ø\0\0\0\0'),(425,'¡µ\0\0\0ê\0'),(426,'…Æ\0\0\0~\0'),(426,'…Ø\0\0\0\0'),(426,'À≠\0\0\0ê\0'),(427,'–Æ\0\0\0~\0'),(427,'–Ø\0\0\0\0'),(427,'—±\0\0\0é\0'),(428,'…≥\0\0\0|\0'),(428,' ≥\0\0\0}\0'),(428,'»µ\0\0\0é\0'),(429,'Œ≥\0\0\0|\0'),(429,'œ≥\0\0\0}\0'),(429,'—∂\0\0\0é\0'),(430,'…Æ\0\0\0|\0'),(430,' Æ\0\0\0}\0'),(430,'…±\0\0\0|\0'),(430,' ±\0\0\0}\0'),(430,'—∞\0\0\0é\0'),(431,'…≥\0\0\0|\0'),(431,' ≥\0\0\0}\0'),(431,'…∂\0\0\0|\0'),(431,' ∂\0\0\0}\0'),(431,'—µ\0\0\0é\0'),(432,'¿º\0\0\0|\0'),(432,'¡º\0\0\0}\0'),(432,'∆æ\0\0\0é\0'),(432,'¿¿\0\0\0|\0'),(432,'¡¿\0\0\0}\0'),(433,'¿º\0\0\0~\0'),(433,'¿Ω\0\0\0\0'),(433,'≈º\0\0\0~\0'),(433,'≈Ω\0\0\0\0'),(433,'∆¿\0\0\0é\0'),(434,'Ãø\0\0\0|\0'),(434,'Õø\0\0\0}\0'),(434,'Ã¬\0\0\0|\0'),(434,'Õ¬\0\0\0}\0'),(434,'‘¡\0\0\0é\0'),(435,'Ãƒ\0\0\0|\0'),(435,'Ã«\0\0\0|\0'),(435,'Õƒ\0\0\0}\0'),(435,'Õ«\0\0\0}\0'),(435,'‘∆\0\0\0é\0'),(436,'Ãø\0\0\0|\0'),(436,'Õø\0\0\0}\0'),(436,'Ã¬\0\0\0|\0'),(436,'Õ¬\0\0\0}\0'),(436,'‘¡\0\0\0é\0'),(437,'Ãƒ\0\0\0|\0'),(437,'Ã«\0\0\0|\0'),(437,'Õƒ\0\0\0}\0'),(437,'Õ«\0\0\0}\0'),(437,'‘∆\0\0\0é\0'),(438,'ÿ¥\0\0\0|\0'),(438,'Ÿ¥\0\0\0}\0'),(438,'›∑\0\0\0é\0'),(438,'ÿπ\0\0\0|\0'),(438,'Ÿπ\0\0\0}\0'),(439,'⁄ø\0\0\0~\0'),(439,'›ø\0\0\0~\0'),(439,'‡ø\0\0\0~\0'),(439,'⁄¿\0\0\0\0'),(439,'›¿\0\0\0\0'),(439,'ﬂ¬\0\0\0ë\0'),(439,'ﬁ»\0\0\0ê\0'),(439,'‡¿\0\0\0\0'),(440,'ÿ¥\0\0\0|\0'),(440,'Ÿ¥\0\0\0}\0'),(440,'ÿπ\0\0\0|\0'),(440,'Ÿπ\0\0\0}\0'),(440,'›∏\0\0\0é\0'),(441,'⁄ø\0\0\0|\0'),(441,'€ø\0\0\0}\0'),(441,'⁄¬\0\0\0|\0'),(441,'€¬\0\0\0}\0'),(441,'·¡\0\0\0é\0'),(442,'⁄ƒ\0\0\0|\0'),(442,'⁄«\0\0\0|\0'),(442,'€ƒ\0\0\0}\0'),(442,'€«\0\0\0}\0'),(442,'·∆\0\0\0é\0'),(443,'Êæ\0\0\0~\0'),(443,'Êø\0\0\0\0'),(443,'ËΩ\0\0\0ê\0'),(444,'Îæ\0\0\0~\0'),(444,'Îø\0\0\0\0'),(444,'ÌΩ\0\0\0ê\0'),(445,'Êæ\0\0\0~\0'),(445,'Êø\0\0\0\0'),(445,'È¬\0\0\0ê\0'),(446,'Îæ\0\0\0~\0'),(446,'Îø\0\0\0\0'),(446,'Ï¬\0\0\0ê\0'),(447,'È«\0\0\0|\0'),(447,'Í«\0\0\0}\0'),(447,'Ó»\0\0\0é\0'),(448,'Ù«\0\0\0~\0'),(448,'ˆ∆\0\0\0ê\0'),(448,'Ù»\0\0\0\0'),(448,'ÙÃ\0\0\0|\0'),(448,'ıÃ\0\0\0}\0'),(449,'˚∆\0\0\0ê\0'),(449,'˘…\0\0\0|\0'),(449,'˙…\0\0\0}\0'),(449,'˘Ã\0\0\0|\0'),(449,'˙Ã\0\0\0}\0'),(450,'Ù«\0\0\0~\0'),(450,'˜«\0\0\0~\0'),(450,'Ù»\0\0\0\0'),(450,'˜»\0\0\0\0'),(450,'ıÕ\0\0\0ê\0'),(451,'˘«\0\0\0|\0'),(451,'˙«\0\0\0}\0'),(451,'˝»\0\0\0é\0'),(451,'˘Ã\0\0\0|\0'),(451,'˙Ã\0\0\0}\0'),(452,'Û◊\0\0\0|\0'),(452,'Ù◊\0\0\0}\0'),(452,'ˆ÷\0\0\0ê\0'),(452,'Û€\0\0\0|\0'),(452,'Ù€\0\0\0}\0'),(453,'ˇ‘\0\0\0ê\0'),(453,'˝ÿ\0\0\0~\0'),(453,'˝Ÿ\0\0\0\0'),(454,'’\0\0\0~\0'),(454,'÷\0\0\0\0'),(454,'◊\0\0\0é\0'),(455,'˝’\0\0\0~\0'),(455,'˝÷\0\0\0\0'),(455,'˝ÿ\0\0\0~\0'),(455,'˝Ÿ\0\0\0\0'),(455,'◊\0\0\0è\0'),(455,'⁄\0\0\0ê\0'),(456,'¸ﬁ\0\0\0|\0'),(456,'˝ﬁ\0\0\0}\0'),(456,'ˇ‚\0\0\0ê\0'),(457,'·\0\0\0é\0'),(458,'BE\0\0\0É\0'),(458,'BF\0\0\0Ñ\0'),(458,'FE\0\0\0É\0'),(458,'FF\0\0\0Ñ\0'),(458,'EJ\0\0\0Â\0'),(459,'EO\0\0\0Â\0'),(459,'DS\0\0\0É\0'),(459,'GS\0\0\0É\0'),(459,'DT\0\0\0Ñ\0'),(459,'GT\0\0\0Ñ\0'),(460,'LK\0\0\0É\0'),(460,'HM\0\0\0‚\0'),(460,'LL\0\0\0Ñ\0'),(460,'LN\0\0\0Ü\0'),(461,'0Y\0\0\0Ü\0'),(461,'1]\0\0\0Â\0'),(462,'7\\\0\0\0É\0'),(462,'7]\0\0\0Ñ\0'),(462,'9`\0\0\0Â\0'),(463,'GW\0\0\0É\0'),(463,'GX\0\0\0Ñ\0'),(463,'J[\0\0\0Â\0'),(464,'JK\0\0\0Â\0'),(464,'FP\0\0\0É\0'),(464,'FQ\0\0\0Ñ\0'),(464,'IP\0\0\0É\0'),(464,'IQ\0\0\0Ñ\0'),(465,'=J\0\0\0É\0'),(465,'=K\0\0\0Ñ\0'),(465,'?J\0\0\0É\0'),(465,'?K\0\0\0Ñ\0'),(465,'AJ\0\0\0É\0'),(465,'AK\0\0\0Ñ\0'),(465,'CH\0\0\0‚\0'),(466,'3P\0\0\0É\0'),(466,'3Q\0\0\0Ñ\0'),(466,'6P\0\0\0É\0'),(466,'6Q\0\0\0Ñ\0'),(466,'9P\0\0\0É\0'),(466,'9Q\0\0\0Ñ\0'),(466,'7Y\0\0\0Â\0'),(467,'BO\0\0\0É\0'),(467,'EO\0\0\0É\0'),(467,'HO\0\0\0É\0'),(467,'BP\0\0\0Ñ\0'),(467,'EP\0\0\0Ñ\0'),(467,'HP\0\0\0Ñ\0'),(467,'FW\0\0\0Â\0'),(468,'NN\0\0\0É\0'),(468,'NO\0\0\0Ñ\0'),(468,'MP\0\0\0‚\0'),(468,'OS\0\0\0Ü\0'),(470,'Ÿz\0\0\0ﬁ\0'),(470,'Ÿ{\0\0\0ﬂ\0'),(470,'›{\0\0\0œ\0'),(471,'‹Ç\0\0\0ﬁ\0'),(471,'‹É\0\0\0ﬂ\0'),(471,'€Ö\0\0\0“\0'),(472,'·k\0\0\0‹\0'),(472,'‚k\0\0\0›\0'),(472,'Âj\0\0\0œ\0'),(473,'·p\0\0\0ﬁ\0'),(473,'·q\0\0\0ﬂ\0'),(473,'Âr\0\0\0œ\0'),(474,'Ê{\0\0\0œ\0'),(474,'‚|\0\0\0‹\0'),(474,'„|\0\0\0›\0'),(475,'ÂÇ\0\0\0ﬁ\0'),(475,'ÂÉ\0\0\0ﬂ\0'),(475,'‰Ö\0\0\0“\0'),(476,'·ç\0\0\0‹\0'),(476,'‚ç\0\0\0›\0'),(476,'Âå\0\0\0œ\0'),(477,'·ë\0\0\0ﬁ\0'),(477,'·í\0\0\0ﬂ\0'),(477,'Âì\0\0\0œ\0'),(478,'·õ\0\0\0‹\0'),(478,'‚õ\0\0\0›\0'),(478,'Âö\0\0\0œ\0'),(479,'`\0\0\0ﬁ\0'),(479,'a\0\0\0ﬂ\0'),(479,'d\0\0\0“\0'),(480,'π\0\0\0“\0'),(480,'\0Ω\0\0\0‹\0'),(480,'Ω\0\0\0›\0'),(481,'\nπ\0\0\0“\0'),(481,'º\0\0\0ﬁ\0'),(481,'Ω\0\0\0ﬂ\0'),(482,'π\0\0\0“\0'),(482,'∫\0\0\0ﬁ\0'),(482,'ª\0\0\0ﬂ\0'),(483,'Ï†\0\0\0ã\0'),(483,'Ï°\0\0\0å\0'),(483,'¢\0\0\0·\0'),(484,'Ï™\0\0\0ç\0'),(484,'Ì™\0\0\0é\0'),(484,'©\0\0\0·\0'),(485,'¯∞\0\0\0‰\0'),(485,'ˆ¥\0\0\0ç\0'),(485,'˜¥\0\0\0é\0'),(486,'¯b\0\0\0ã\0'),(486,'¯c\0\0\0å\0'),(486,'˚f\0\0\0‰\0'),(487,'k\0\0\0ç\0'),(487,'k\0\0\0é\0'),(487,'p\0\0\0ç\0'),(487,'p\0\0\0é\0'),(487,'q\0\0\0‰\0'),(488,'v\0\0\0ã\0'),(488,'w\0\0\0å\0'),(488,'x\0\0\0·\0'),(489,'z\0\0\0ã\0'),(489,'{\0\0\0å\0'),(489,'}\0\0\0‰\0'),(490,'Ö\0\0\0ç\0'),(490,'Ö\0\0\0é\0'),(490,'Ñ\0\0\0·\0'),(491,'á\0\0\0ã\0'),(491,'à\0\0\0å\0'),(491,'ä\0\0\0·\0'),(492,'ë\0\0\0ã\0'),(492,'í\0\0\0å\0'),(492,'î\0\0\0·\0'),(493,'ñ\0\0\0ç\0'),(493,'ñ\0\0\0é\0'),(493,'ö\0\0\0ç\0'),(493,'ö\0\0\0é\0'),(493,'õ\0\0\0‰\0'),(494,'±\0\0\0ã\0'),(494,'≤\0\0\0å\0'),(494,'∞\0\0\0‰\0'),(495,'í\0\0\0‰\0'),(495,'ï\0\0\0ç\0'),(495,'\rï\0\0\0é\0'),(496,'ó\0\0\0ã\0'),(496,'ò\0\0\0å\0'),(496,'ô\0\0\0·\0'),(497,'†\0\0\0ã\0'),(497,'°\0\0\0å\0'),(497,'§\0\0\0‰\0'),(498,'¨\0\0\0‰\0'),(498,'©\0\0\0ã\0'),(498,'™\0\0\0å\0'),(499,'∞\0\0\0‰\0'),(499,'¥\0\0\0ç\0'),(499,'\r¥\0\0\0é\0'),(500,'ï\0\0\0·\0'),(500,'ó\0\0\0ç\0'),(500,'ó\0\0\0é\0'),(501,'$ì\0\0\0ã\0'),(501,'$î\0\0\0å\0'),(501,'\'ï\0\0\0·\0'),(502,'-ó\0\0\0ç\0'),(502,'.ó\0\0\0é\0'),(502,'/ñ\0\0\0·\0'),(503,'4ó\0\0\0ç\0'),(503,'5ó\0\0\0é\0'),(503,'6ñ\0\0\0·\0'),(504,'Úv\0\0\0ﬁ\0'),(504,'Úw\0\0\0ﬂ\0'),(504,'Òu\0\0\0œ\0'),(505,'Ìx\0\0\0ﬁ\0'),(505,'Ìy\0\0\0ﬂ\0'),(505,'Òy\0\0\0œ\0'),(506,'Ùv\0\0\0œ\0'),(506,'¯t\0\0\0ﬁ\0'),(506,'¯u\0\0\0ﬂ\0'),(507,'Ìà\0\0\0‹\0'),(507,'Óà\0\0\0›\0'),(507,'ÒÜ\0\0\0œ\0'),(508,'ÙÜ\0\0\0œ\0'),(508,'¯Ñ\0\0\0ﬁ\0'),(508,'¯Ö\0\0\0ﬂ\0'),(509,'Ìó\0\0\0‹\0'),(509,'Óó\0\0\0›\0'),(509,'Òï\0\0\0œ\0'),(510,'¯ì\0\0\0ﬁ\0'),(510,'Ùï\0\0\0œ\0'),(510,'¯î\0\0\0ﬂ\0'),(511,'¯¢\0\0\0‹\0'),(511,'˘¢\0\0\0›\0'),(511,'¸§\0\0\0œ\0'),(512,'¯®\0\0\0‹\0'),(512,'˘®\0\0\0›\0'),(512,'¸®\0\0\0œ\0'),(513,'ˇ•\0\0\0œ\0'),(513,'\0¢\0\0\0ﬁ\0'),(513,'\0£\0\0\0ﬂ\0'),(513,'¢\0\0\0ﬁ\0'),(513,'£\0\0\0ﬂ\0'),(514,'ÓÖ\0\0\0ﬁ\0'),(514,'ÓÜ\0\0\0ﬂ\0'),(514,'â\0\0\0“\0'),(515,'ÙÖ\0\0\0‹\0'),(515,'ıÖ\0\0\0›\0'),(515,'˜â\0\0\0“\0'),(516,'Óî\0\0\0‹\0'),(516,'Ôî\0\0\0›\0'),(516,'ò\0\0\0“\0'),(517,'¯î\0\0\0ﬁ\0'),(517,'¯ï\0\0\0ﬂ\0'),(517,'˜ò\0\0\0“\0'),(518,'˙§\0\0\0ﬁ\0'),(518,'˙•\0\0\0ﬂ\0'),(518,'•\0\0\0œ\0'),(519,'Ï£\0\0\0ç\0'),(519,'Ì£\0\0\0é\0'),(519,'¢\0\0\0·\0'),(520,'Ïß\0\0\0ã\0'),(520,'Ï®\0\0\0å\0'),(520,'©\0\0\0·\0'),(521,'˙≥\0\0\0·\0'),(521,'ˆ¥\0\0\0ç\0'),(521,'˜¥\0\0\0é\0'),(522,'±\0\0\0ã\0'),(522,'≤\0\0\0å\0'),(522,'≥\0\0\0·\0'),(523,'ô\0\0\0ã\0'),(523,'ö\0\0\0å\0'),(523,'ò\0\0\0·\0'),(524,'ì\0\0\0·\0'),(524,'î\0\0\0ç\0'),(524,'î\0\0\0é\0'),(525,'&ì\0\0\0ã\0'),(525,'%ó\0\0\0‰\0'),(525,'&î\0\0\0å\0'),(526,',û\0\0\0œ\0'),(526,'-°\0\0\0‹\0'),(526,'.°\0\0\0›\0'),(527,'6û\0\0\0œ\0'),(527,'4°\0\0\0‹\0'),(527,'5°\0\0\0›\0'),(528,',®\0\0\0œ\0'),(528,'-´\0\0\0‹\0'),(528,'.´\0\0\0›\0'),(529,'4´\0\0\0‹\0'),(529,'5´\0\0\0›\0'),(529,'6®\0\0\0œ\0'),(530,'-≥\0\0\0‹\0'),(530,'.≥\0\0\0›\0'),(530,'/≤\0\0\0œ\0'),(531,'3≤\0\0\0œ\0'),(531,'4≥\0\0\0‹\0'),(531,'5≥\0\0\0›\0'),(532,'-ª\0\0\0‹\0'),(532,'.ª\0\0\0›\0'),(532,'/∫\0\0\0œ\0'),(533,'4ª\0\0\0‹\0'),(533,'5ª\0\0\0›\0'),(533,'5º\0\0\0“\0'),(534,'n\0\0\0ã\0'),(534,'o\0\0\0å\0'),(534,'n\0\0\0ã\0'),(534,'o\0\0\0å\0'),(534,'p\0\0\0œ\0'),(535,'~\0\0\0ã\0'),(535,'\0\0\0å\0'),(535,'~\0\0\0ã\0'),(535,'\0\0\0å\0'),(535,'Ä\0\0\0œ\0'),(536,'%n\0\0\0ç\0'),(536,'&n\0\0\0é\0'),(536,'$q\0\0\0œ\0'),(536,'%s\0\0\0ç\0'),(536,'&s\0\0\0é\0'),(537,'%~\0\0\0ç\0'),(537,'&~\0\0\0é\0'),(537,'$Å\0\0\0œ\0'),(537,'%É\0\0\0ç\0'),(537,'&É\0\0\0é\0'),(542,'<o\0\0\0ã\0'),(542,'<p\0\0\0å\0'),(542,'?x\0\0\0“\0'),(542,'Co\0\0\0ã\0'),(542,'Cp\0\0\0å\0'),(543,'æ\0\0\0ﬁ\0'),(543,'æ\0\0\0ﬂ\0'),(543,'¬\0\0\0ı\Z\0'),(544,'Â\0\0\0ﬁ\0'),(544,'Â\0\0\0ﬂ\0'),(544,'Ï\0\0\0ﬁ\0'),(544,'Ï\0\0\0ﬂ\0'),(544,'Ë	\0\0\0Ï\Z\0'),(545,'Àı\0\0\0ﬁ\0'),(545,'Àˆ\0\0\0ﬂ\0'),(545,'ŒÙ\0\0\0Ï\Z\0'),(545,'—ı\0\0\0ﬁ\0'),(545,'—ˆ\0\0\0ﬂ\0'),(546,'ÿˆ\0\0\0ı\Z\0'),(546,'€ı\0\0\0ﬁ\0'),(546,'€ˆ\0\0\0ﬂ\0'),(547,'ÀÏ\0\0\0‹\0'),(547,'ÃÏ\0\0\0›\0'),(547,'ÕÔ\0\0\0Ï\Z\0'),(548,'“Ï\0\0\0ﬁ\0'),(548,'“Ì\0\0\0ﬂ\0'),(548,'÷Ô\0\0\0Ï\Z\0'),(548,'ÿÏ\0\0\0ﬁ\0'),(548,'ÿÌ\0\0\0ﬂ\0'),(549,'À‘\0\0\0‹\0'),(549,'Ã‘\0\0\0›\0'),(549,'ÀŸ\0\0\0‹\0'),(549,'ÃŸ\0\0\0›\0'),(549,'Œ⁄\0\0\0Ï\Z\0'),(550,'Îı\0\0\0ﬁ\0'),(550,'Îˆ\0\0\0ﬂ\0'),(550,'ÓÙ\0\0\0Ï\Z\0'),(551,'Ô\0\0\0Ï\Z\0'),(551,'ÚÏ\0\0\0ﬁ\0'),(551,'ÚÌ\0\0\0ﬂ\0'),(552,'ÍŸ\0\0\0ﬁ\0'),(552,'Í⁄\0\0\0ﬂ\0'),(552,'Í‹\0\0\0Ï\Z\0'),(553,'\0\0\0ﬁ\0'),(553,'\0\0\0ﬂ\0'),(553,'\0\0\0\0Ï\Z\0'),(554,'ˇı\0\0\0ﬁ\0'),(554,'ˇˆ\0\0\0ﬂ\0'),(554,'Ù\0\0\0Ï\Z\0'),(555,'Ô\0\0\0ı\Z\0'),(555,'Ï\0\0\0‹\0'),(555,'Ï\0\0\0›\0'),(556,'¸◊\0\0\0ﬁ\0'),(556,'¸ÿ\0\0\0ﬂ\0'),(556,'ˇ‹\0\0\0Ï\Z\0'),(556,'◊\0\0\0ﬁ\0'),(556,'ÿ\0\0\0ﬂ\0'),(557,'◊\0\0\0‹\0'),(557,'◊\0\0\0›\0'),(557,'‹\0\0\0Ï\Z\0'),(558,'æ\0\0\0‹\0'),(558,'ø\0\0\0›\0'),(558,'¬\0\0\0ı\Z\0'),(559,'Ÿı\0\0\0‹\0'),(559,'⁄ı\0\0\0›\0'),(559,'⁄¯\0\0\0Ï\Z\0'),(560,'ÀÏ\0\0\0ﬁ\0'),(560,'ÀÌ\0\0\0ﬂ\0'),(560,'ŒÔ\0\0\0Ï\Z\0'),(561,'“Ï\0\0\0‹\0'),(561,'”Ï\0\0\0›\0'),(561,'÷Ô\0\0\0Ï\Z\0'),(562,'À‘\0\0\0ﬁ\0'),(562,'À’\0\0\0ﬂ\0'),(562,'—‘\0\0\0ﬁ\0'),(562,'—’\0\0\0ﬂ\0'),(562,'“ÿ\0\0\0ı\Z\0'),(563,'Ï\0\0\0ﬁ\0'),(563,'Ï\0\0\0ﬂ\0'),(563,'Ë	\0\0\0Ï\Z\0'),(564,'Îı\0\0\0ﬁ\0'),(564,'Îˆ\0\0\0ﬂ\0'),(564,'Ú˜\0\0\0ı\Z\0'),(565,'Ô\0\0\0Ï\Z\0'),(565,'ÚÏ\0\0\0ﬁ\0'),(565,'ÚÌ\0\0\0ﬂ\0'),(566,'ÁŸ\0\0\0‹\0'),(566,'ËŸ\0\0\0›\0'),(566,'Î€\0\0\0ı\Z\0'),(567,'Ï\0\0\0ﬁ\0'),(567,'Ì\0\0\0ﬂ\0'),(567,'Ú\0\0\0Ï\Z\0'),(568,'¸◊\0\0\0‹\0'),(568,'˝◊\0\0\0›\0'),(568,'˛‹\0\0\0Ï\Z\0'),(569,'◊\0\0\0ﬁ\0'),(569,'ÿ\0\0\0ﬂ\0'),(569,'‹\0\0\0Ï\Z\0'),(570,'•\0˘\0\0\0‡\0'),(570,'¶\0˘\0\0\0·\0'),(570,'†\0˛\0\0\0⁄\0'),(570,'†\0ˇ\0\0\0€\0'),(570,'¶\0˛\0\0\0⁄\0'),(570,'¶\0ˇ\0\0\0€\0'),(570,'®\0¸\0\0\0âM\0'),(571,'Ÿ\0˘\0\0\0⁄\0'),(571,'Ÿ\0˙\0\0\0€\0'),(571,'ﬂ\0˘\0\0\0⁄\0'),(571,'ﬂ\0˙\0\0\0€\0'),(571,'‹\0¸\0\0\0ÄM\0'),(572,'°\0\0\0\0q\0'),(572,'£\0\0\0\0s\0'),(572,'¶\0\0\0\0s\0'),(572,'¶\0\0\0\0Ó\Z\0'),(572,'®\0\0\0\0r\0'),(572,'¢\0\0\0\0Ó\Z\0'),(572,'•\0\n\0\0\0⁄\0'),(572,'•\0\0\0\0€\0'),(572,'ß\0\n\0\0\0⁄\0'),(572,'ß\0\0\0\0€\0'),(572,'†\0\0\0\0‡\0'),(572,'†\0\0\0\0‡\0'),(572,'°\0\0\0\0·\0'),(572,'°\0\0\0\0·\0'),(572,'ß\0\0\0\0b\0'),(572,'™\0\0\0\0˜\Z\0'),(572,'£\0\0\0\0Ó\Z\0'),(572,'¶\0\0\0\0Ó\Z\0'),(573,'ü\0\0\0\0t\0'),(573,'ü\0\0\0\0r\0'),(573,'ü\0\r\0\0\0t\0'),(573,'¶\0\0\0\0q\0'),(573,'†\0\0\0\0⁄\0'),(573,'†\0\0\0\0€\0'),(573,'¢\0\0\0\0⁄\0'),(573,'¢\0\0\0\0€\0'),(573,'¢\0\0\0\0˜\Z\0'),(573,'£\0\0\0\0‡\0'),(573,'§\0\0\0\0·\0'),(573,'¶\0\0\0\0‡\0'),(573,'¶\0\0\0\0‡\0'),(573,'ß\0\0\0\0·\0'),(573,'ß\0\0\0\0·\0'),(573,'®\0\0\0\0t\0'),(573,'®\0\0\0\0t\0'),(573,'®\0\0\0\0r\0'),(573,'¢\0\n\0\0\0˜\Z\0'),(573,'ß\0\0\0\0˜\Z\0'),(573,'®\0\n\0\0\0t\0'),(573,'®\0\0\0\0r\0'),(573,'†\0\r\0\0\0⁄\0'),(573,'†\0\0\0\0€\0'),(573,'¢\0\r\0\0\0⁄\0'),(573,'¢\0\0\0\0€\0'),(573,'•\0\0\0\0Ó\Z\0'),(574,'π\0\0\0\0⁄\0'),(574,'π\0\0\0\0€\0'),(574,'ª\0\0\0\0⁄\0'),(574,'ª\0\0\0\0€\0'),(574,'¡\0\0\0\0âM\0'),(575,'æ\0\0\0\0‡\0'),(575,'ø\0\0\0\0·\0'),(575,'Ω\0	\0\0\0ÄM\0'),(575,'æ\0\0\0\0âM\0'),(575,'¿\0\0\0\0ÄM\0'),(576,'†\0\0\0\0⁄\0'),(576,'†\0\0\0\0€\0'),(576,'°\0\0\0\0q\0'),(576,'°\0\0\0\0⁄\0'),(576,'°\0\0\0\0€\0'),(576,'§\0\0\0\0q\0'),(576,'¶\0\0\0\0Ù\Z\0'),(577,'§\0\0\0\0‡\0'),(577,'•\0\0\0\0·\0'),(577,'§\0\0\0\0‡\0'),(577,'•\0\0\0\0·\0'),(577,'¶\0\0\0\0t\0'),(577,'¶\0\0\0\0Ù\Z\0'),(577,'¢\0\0\0\0s\0'),(577,'¢\0\0\0\0q\0'),(578,'¶\0\0\0\0Ù\Z\0'),(578,'¶\0\0\0\0r\0'),(579,'≥\0\0\0\0r\0'),(579,'≥\0\0\0\0Ù\Z\0'),(579,'∑\0\0\0\0t\0'),(579,'µ\0\0\0\0‡\0'),(579,'µ\0\0\0\0s\0'),(579,'∂\0\0\0\0·\0'),(580,'±\0\0\0\0t\0'),(580,'≤\0\Z\0\0\0⁄\0'),(580,'≤\0\0\0\0€\0'),(580,'≤\0\0\0\0Ù\Z\0'),(580,'≤\0\Z\0\0\0⁄\0'),(580,'≤\0\0\0\0€\0'),(580,'π\0\Z\0\0\0t\0'),(580,'π\0\Z\0\0\0r\0'),(580,'¥\0\0\0\0q\0'),(580,'∑\0\0\0\0s\0'),(580,'¥\0\0\0\0s\0'),(580,'∑\0\0\0\0q\0'),(581,'π\0\0\0\0q\0'),(581,'∫\0\0\0\0⁄\0'),(581,'∫\0\0\0\0€\0'),(581,'∫\0\0\0\0⁄\0'),(581,'∫\0\0\0\0€\0'),(581,'∫\0\0\0\0s\0'),(581,'¿\0\0\0\0Ù\Z\0'),(582,'ø\0\0\0\0⁄\0'),(582,'ø\0\0\0\0€\0'),(582,'Ω\0\0\0\0q\0'),(582,'Ω\0\0\0\0s\0'),(582,'¿\0\0\0\0⁄\0'),(582,'¿\0\0\0\0€\0'),(582,'¡\0\0\0\0t\0'),(582,'¡\0\Z\0\0\0r\0'),(582,'¡\0\0\0\0r\0'),(582,'¡\0\Z\0\0\0Ù\Z\0'),(582,'¿\0\0\0\0q\0'),(583,'Œ\0\Z\0\0\0⁄\0'),(583,'Œ\0\0\0\0€\0'),(583,'œ\0\Z\0\0\0⁄\0'),(583,'œ\0\0\0\0€\0'),(583,'Õ\0\0\0\0N\0'),(584,'·\0\0\0\0‡\0'),(584,'‚\0\0\0\0·\0'),(584,'·\0\Z\0\0\0‡\0'),(584,'‚\0\Z\0\0\0·\0'),(584,'‡\0\0\0\0N\0'),(585,'›\0%\0\0\0⁄\0'),(585,'›\0&\0\0\0€\0'),(585,'›\0%\0\0\0⁄\0'),(585,'›\0&\0\0\0€\0'),(585,'›\0%\0\0\0⁄\0'),(585,'›\0&\0\0\0€\0'),(585,'›\0(\0\0\0N\0'),(586,'‚\0%\0\0\0‡\0'),(586,'‚\0\'\0\0\0‡\0'),(586,'„\0%\0\0\0·\0'),(586,'„\0\'\0\0\0·\0'),(586,'Á\0%\0\0\0⁄\0'),(586,'Á\0&\0\0\0€\0'),(586,'‚\0(\0\0\0‡\0'),(586,'„\0(\0\0\0·\0'),(586,'„\0)\0\0\0N\0'),(586,'Â\0(\0\0\0‡\0'),(586,'Ê\0(\0\0\0·\0'),(587,'Õ\0%\0\0\0⁄\0'),(587,'Õ\0&\0\0\0€\0'),(587,'Ã\0\'\0\0\0âM\0'),(587,'’\0%\0\0\0⁄\0'),(587,'’\0&\0\0\0€\0'),(588,'≥\0+\0\0\0ÅM\0'),(588,'¥\0(\0\0\0‡\0'),(588,'¥\0*\0\0\0‡\0'),(588,'µ\0(\0\0\0·\0'),(588,'µ\0*\0\0\0·\0'),(588,'¥\0(\0\0\0‡\0'),(588,'¥\0*\0\0\0‡\0'),(588,'µ\0(\0\0\0·\0'),(588,'µ\0*\0\0\0·\0'),(589,'ß\0(\0\0\0N\0'),(590,'¶\07\0\0\0åM\0'),(590,'¢\0:\0\0\0⁄\0'),(590,'¢\0;\0\0\0€\0'),(590,'§\09\0\0\0ÉM\0'),(590,'•\0:\0\0\0⁄\0'),(590,'•\0;\0\0\0€\0'),(590,'¶\0=\0\0\0N\0'),(591,'é\06\0\0\0⁄\0'),(591,'é\07\0\0\0€\0'),(591,'è\06\0\0\0⁄\0'),(591,'è\07\0\0\0€\0'),(591,'ë\0;\0\0\0N\0'),(591,'î\09\0\0\0N\0'),(591,'ò\0;\0\0\0\0'),(592,'†\0E\0\0\0‡\0'),(592,'°\0E\0\0\0·\0'),(592,'§\0G\0\0\0åM\0'),(592,'ß\0F\0\0\0‡\0'),(592,'§\0G\0\0\0N\0'),(592,'¶\0E\0\0\0N\0'),(592,'®\0F\0\0\0·\0'),(592,'†\0H\0\0\0‡\0'),(592,'°\0H\0\0\0·\0'),(592,'£\0K\0\0\0N\0'),(592,'§\0K\0\0\0åM\0'),(592,'ß\0H\0\0\0‡\0'),(592,'ß\0J\0\0\0‡\0'),(592,'®\0H\0\0\0·\0'),(592,'®\0J\0\0\0·\0'),(592,'ß\0L\0\0\0‡\0'),(592,'®\0L\0\0\0·\0'),(592,'©\0L\0\0\0N\0'),(593,'è\0M\0\0\0‡\0'),(593,'è\0N\0\0\0‡\0'),(593,'î\0K\0\0\0⁄\0'),(593,'ï\0K\0\0\0⁄\0'),(593,'ê\0M\0\0\0·\0'),(593,'ê\0N\0\0\0·\0'),(593,'í\0O\0\0\0N\0'),(593,'î\0L\0\0\0€\0'),(593,'ï\0L\0\0\0€\0'),(593,'ñ\0M\0\0\0N\0'),(593,'ñ\0R\0\0\0\0'),(594,'º\03\0\0\0ÂN\0'),(594,'º\04\0\0\0ÊN\0'),(594,'¬\02\0\0\0âM\0'),(595,'À\02\0\0\0âM\0'),(595,'“\02\0\0\0ÂN\0'),(595,'“\03\0\0\0ÊN\0');
/*!40000 ALTER TABLE `tile_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_forum`
--

DROP TABLE IF EXISTS `z_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_post` int(11) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `section` int(11) NOT NULL DEFAULT 0,
  `replies` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `author_aid` int(11) NOT NULL DEFAULT 0,
  `author_guid` int(11) NOT NULL DEFAULT 0,
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT 0,
  `post_html` tinyint(1) NOT NULL DEFAULT 0,
  `post_date` int(11) NOT NULL DEFAULT 0,
  `last_edit_aid` int(11) NOT NULL DEFAULT 0,
  `edit_date` int(11) NOT NULL DEFAULT 0,
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` int(11) NOT NULL,
  `news_icon` varchar(50) NOT NULL,
  `sticked` tinyint(1) NOT NULL DEFAULT 0,
  `closed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `section` (`section`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_forum`
--

LOCK TABLES `z_forum` WRITE;
/*!40000 ALTER TABLE `z_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_network_box`
--

DROP TABLE IF EXISTS `z_network_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_network_box` (
  `id` int(11) NOT NULL,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_network_box`
--

LOCK TABLES `z_network_box` WRITE;
/*!40000 ALTER TABLE `z_network_box` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_network_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_news_tickers`
--

DROP TABLE IF EXISTS `z_news_tickers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT 1,
  `author` int(11) NOT NULL,
  `image_id` int(11) NOT NULL DEFAULT 0,
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_news_tickers`
--

LOCK TABLES `z_news_tickers` WRITE;
/*!40000 ALTER TABLE `z_news_tickers` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_news_tickers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_ots_comunication`
--

DROP TABLE IF EXISTS `z_ots_comunication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_ots_comunication`
--

LOCK TABLES `z_ots_comunication` WRITE;
/*!40000 ALTER TABLE `z_ots_comunication` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_ots_comunication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_ots_guildcomunication`
--

DROP TABLE IF EXISTS `z_ots_guildcomunication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_ots_guildcomunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_ots_guildcomunication`
--

LOCK TABLES `z_ots_guildcomunication` WRITE;
/*!40000 ALTER TABLE `z_ots_guildcomunication` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_ots_guildcomunication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_polls`
--

DROP TABLE IF EXISTS `z_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_polls`
--

LOCK TABLES `z_polls` WRITE;
/*!40000 ALTER TABLE `z_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_polls_answers`
--

DROP TABLE IF EXISTS `z_polls_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_polls_answers`
--

LOCK TABLES `z_polls_answers` WRITE;
/*!40000 ALTER TABLE `z_polls_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_polls_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_replay`
--

DROP TABLE IF EXISTS `z_replay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_replay` (
  `title` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_replay`
--

LOCK TABLES `z_replay` WRITE;
/*!40000 ALTER TABLE `z_replay` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_replay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_category`
--

DROP TABLE IF EXISTS `z_shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `button` varchar(50) NOT NULL,
  `hide` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_category`
--

LOCK TABLES `z_shop_category` WRITE;
/*!40000 ALTER TABLE `z_shop_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_donate_confirm`
--

DROP TABLE IF EXISTS `z_shop_donate_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_donate_confirm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` bigint(20) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `donate_id` int(11) NOT NULL,
  `msg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=239 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_donate_confirm`
--

LOCK TABLES `z_shop_donate_confirm` WRITE;
/*!40000 ALTER TABLE `z_shop_donate_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_donate_confirm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_donates`
--

DROP TABLE IF EXISTS `z_shop_donates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_donates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` bigint(20) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `price` varchar(20) NOT NULL,
  `coins` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=878 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_donates`
--

LOCK TABLES `z_shop_donates` WRITE;
/*!40000 ALTER TABLE `z_shop_donates` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_donates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_history_item`
--

DROP TABLE IF EXISTS `z_shop_history_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_history_item`
--

LOCK TABLES `z_shop_history_item` WRITE;
/*!40000 ALTER TABLE `z_shop_history_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_history_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_offer`
--

DROP TABLE IF EXISTS `z_shop_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `coins` int(11) NOT NULL DEFAULT 0,
  `price` varchar(50) NOT NULL,
  `itemid` int(11) NOT NULL DEFAULT 0,
  `mount_id` varchar(100) NOT NULL,
  `addon_name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `offer_date` int(11) NOT NULL,
  `default_image` varchar(50) NOT NULL,
  `hide` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_offer`
--

LOCK TABLES `z_shop_offer` WRITE;
/*!40000 ALTER TABLE `z_shop_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_payment`
--

DROP TABLE IF EXISTS `z_shop_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_shop_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(10) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_category_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `price` varchar(50) NOT NULL,
  `coins` int(10) unsigned NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'waiting',
  `date` int(11) NOT NULL,
  `gift` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_payment`
--

LOCK TABLES `z_shop_payment` WRITE;
/*!40000 ALTER TABLE `z_shop_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-27 13:39:03
