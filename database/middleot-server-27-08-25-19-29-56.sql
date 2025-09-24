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
INSERT INTO `account_viplist` VALUES (8427,11937,'',0,0),(8427,11947,'',0,0),(8427,12020,'',0,0),(8428,11938,'',0,0),(8428,11947,'',0,0),(8428,12016,'',0,0),(8443,12000,'',0,0),(8448,11965,'',0,0),(8453,11954,'',0,0),(8459,11972,'',1,0),(8459,11981,'',1,0),(8460,11965,'',0,0),(8460,11978,'',0,0),(8463,11948,'',0,0),(8463,11979,'',0,0),(8463,11986,'',0,0),(8463,11991,'',0,0),(8463,12004,'',0,0),(8466,11991,'',2,0),(8466,12004,'',0,0),(8466,12013,'',0,0),(8477,11991,'',0,0),(8477,12008,'',0,0),(8478,12008,'',0,0),(8479,11991,'',0,0),(8483,11991,'',0,0),(8483,12008,'',0,0),(8486,11997,'',0,0),(8486,11998,'',0,0),(8486,12005,'',0,0),(8490,11934,'',0,0),(8491,11939,'',0,0),(8491,11940,'',0,0),(8491,11979,'',0,0),(8491,11988,'',0,0),(8491,11991,'',0,0),(8491,11994,'',0,0),(8491,12004,'',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=8500 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'1','2924ec278f5bbaf9cb9b061f632dc3ab3a84092a',NULL,5,0,0,0,0,0,0,'god@god',0,0,0,'0','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',1594492196,0,0,0,0,0,'','',0,'',0,0,0),(8422,'zllcapiroto','db73770fb465a9f9d06569164e1f8b77a7ac7343','',6,30,4596,1756302249,0,0,0,'joninhac10@gmail.com',1708004327,0,0,'','',0,'','','us',1756347260,3,'',0,0,'',0,0,0,0,0,'',1708263854,0,0,0,0,0,'','',0,'',0,0,0),(8427,'290901','75ca90b17d5db4dfed2bb02b910d85fc3d85e65c',NULL,1,3,213,1756261150,0,0,0,'yurixavieralmeida@gmail.com',1756261150,0,0,'','',0,'','','br',1756356612,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8428,'290902','75ca90b17d5db4dfed2bb02b910d85fc3d85e65c',NULL,1,3,0,1756261744,0,0,0,'yurixavieralmeida01@gmail.com',1756261744,0,0,'','',0,'','','br',1756356630,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8429,'4527057','25131ad57472470d29d7db281a1817dfe83daeb1',NULL,1,3,38,1756262068,0,0,0,'dieguitos4527@gmail.com',1756262068,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8430,'carlosneto','287c25aa183f8144604c3710dd71fe973645482f',NULL,1,32,212,1756348575,0,0,0,'carlos_neto10@icloud.com',1756262175,0,0,'','',0,'','','',1756339823,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8431,'carlosneto1','36fad1935563e8ec4801a8850d97357e49abe0c6',NULL,1,3,0,1756262484,0,0,0,'carlos_neto10@live.com',1756262484,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8432,'malino2233','68e61d23423db21bf2d450af7795a0efb49932de',NULL,1,3,0,1756263165,0,0,0,'malinosantos43@gmail.com',1756263165,0,0,'','',0,'','','',1756341800,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8433,'rYanzZRNfJBC','4388a9d34c73d278d2f9599a7a0e73dc61cd0a17',NULL,1,3,0,1756265492,0,0,0,'deperubomoxi91@gmail.com',1756265492,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8434,'daniele','3405fb603e3e805743e0d6c8a915d81e72347251',NULL,1,3,0,1756266439,0,0,0,'daniele@hotmail.com',1756266439,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8435,'jotaver','c21fdebdd8436540b3021c4c28551fb28d4f3981',NULL,1,3,0,1756267098,0,0,0,'vitor.araujo195@gmail.com',1756267098,0,0,'','',0,'','','',1756302536,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8436,'wvWPQnpMXdQFlS','29d80253675076e9ed35512e79f2f19f2b9c6fb9',NULL,1,3,0,1756267181,0,0,0,'avizuvi145@gmail.com',1756267181,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8437,'wENrzTdNFYqTv','9ad4c8a3f3d263c7f4ecd0eb05653d0f8e50a4d5',NULL,1,3,0,1756280119,0,0,0,'bevicimigib336@gmail.com',1756280119,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8438,'MMLxlojKKqL','0ca799d83bc4ff7887759f37080b8e2d5ee8502d',NULL,1,3,0,1756285943,0,0,0,'tifemec187@gmail.com',1756285943,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8439,'capytan','c025c4cc5d7c90e4588ea4da933c85cb3bd61ee2',NULL,1,3,0,1756295300,0,0,0,'igorvaliati2@gmail.com',1756295300,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8440,'9699','e29ce2b6fae41b77c9200cdc05a69e5c7fafddd3',NULL,1,18,2,1756296418,0,0,0,'Wkaiperr@gmail.com',1756296418,0,0,'','',0,'','','',1756331886,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8441,'10100','64ba01e9e7dfc6a42245444f7f282053cf2858a5',NULL,1,3,6,1756302672,0,0,0,'jonathanbolado@hotmail.com',1756302672,0,0,'','',0,'','','',1756326008,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8442,'86671030','9882a3e4026a72145875a703ea473600b492d09e',NULL,1,3,0,1756303610,0,0,0,'neymarcarlinho9@gmail.com',1756303610,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8443,'orcmde4414','e049f857bc8a8ffdd87680c0f09cf9efc723f6fa',NULL,1,3,0,1756309007,0,0,0,'ramon._st@hotmail.com',1756309007,0,0,'','',0,'','','',1756309918,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8444,'mmmmde4414','67406402a3affcb7d13d1cd486cf102a89b097a9',NULL,1,3,0,1756309055,0,0,0,'ramontube123@gmail.com',1756309055,0,0,'','',0,'','','',1756336022,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8445,'aaamde4414','e7a8957dbdfde61feda98d011117cacc8508a036',NULL,1,3,0,1756309133,0,0,0,'fagaoujo@gmail.com',1756309133,0,0,'','',0,'','','',1756309203,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8446,'vjMYJnBDaAFZ','fd252e5943752de3e701fe3068138fff4ebcb577',NULL,1,3,0,1756310801,0,0,0,'iyefineqi82@gmail.com',1756310801,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8447,'FOUaSucVANHmBM','670366434396141cee672cf7f407d0e9e6b6288e',NULL,1,3,0,1756312025,0,0,0,'saterthaja1972@yahoo.com',1756312025,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8448,'Goias123','49784cfe6ad186a5fd032cf4d15604a391893696',NULL,1,3,180,1756316791,0,0,0,'Goias123@gmail.com',1756316791,0,0,'','',0,'','','',1756316841,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8449,'zeza123','5ac7573804ab5230f0dd07fa26d8faf59113b811',NULL,1,3,125,1756317464,0,0,0,'Z@gmail.com',1756317464,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8450,'cvsgarcia','7c8891c16cedd719907fa89571f5071505723f8a',NULL,1,3,0,1756317674,0,0,0,'asdasdas@gmail.com',1756317674,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8451,'3521854','429967ad726377d7f47be260becde6f11287940a',NULL,1,3,0,1756318903,0,0,0,'raafagobetti94@gmail.com',1756318903,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8452,'Josefa159','a3ba9020b1d4b605b5fb2b54dcf32ef84144f59e',NULL,1,3,4,1756321916,0,0,0,'andinho123tube@gmail.com',1756321916,0,0,'','',0,'','','',1756336810,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8453,'10200','6b383831ca066353959eb0af8ce7b649492276e2',NULL,1,3,25,1756325287,0,0,0,'tibianobrabo1999@gmail.com',1756325287,0,0,'','',0,'','','',1756343606,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8454,'uzeto','9bea3d5189aab1c45eb059dfe3cc33007bf770b1',NULL,1,3,0,1756326835,0,0,0,'marco.uzeto@yahoo.com.br',1756326835,0,0,'','',0,'','','',1756326850,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8455,'uzeto1','9bea3d5189aab1c45eb059dfe3cc33007bf770b1',NULL,1,3,0,1756326933,0,0,0,'markaum_rdp@yahoo.com.br',1756326933,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8456,'iclenio10','e9fe40356e530d6f895b203814041bc3d5cf3b2e',NULL,1,3,0,1756329338,0,0,0,'iclenio7@gmail.com',1756329338,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8457,'thiagosoares','48e63d67a9e6ad201cb99024b07c2d37d5ccc946',NULL,1,3,0,1756330239,0,0,0,'thiagotrajano2511@gmail.com',1756330239,0,0,'','',0,'','','',1756330322,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8458,'baldao12','3261d7f98bb8701a7a6b7c00fbd7886ee4c17218',NULL,1,3,0,1756330804,0,0,0,'pedro25.baldraia@gmail.com',1756330804,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8459,'778899','ab6c8d80aae02a00722542c18205ffb762b98bea',NULL,1,3,0,1756330924,0,0,0,'fj29668@gmail.com',1756330924,0,0,'','',0,'','','',1756332878,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8460,'8624','22bb68d1aef507be3e03c4eb14f677abf551428c',NULL,1,3,0,1756331321,0,0,0,'danilo27_perim@outlook.com',1756331321,0,0,'','',0,'','','',1756331336,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8461,'theopastel','f687e0ea9999c6e3cc979cb5eedb724681c12f8e',NULL,1,3,0,1756332053,0,0,0,'vitoreduardomarconato@gmail.com',1756332053,0,0,'','',0,'','','',1756332062,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8462,'1368859','026ed9a7ab672cb725246d9194cf3d8901a52a31',NULL,1,3,3,1756332353,0,0,0,'dieguitos0202@gmail.com',1756332353,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8463,'vv1241','9c1c79dc5caa5b400328514912544896613bbaad',NULL,1,3,0,1756332496,0,0,0,'vinicius.16gabriel@hotmail.com',1756332496,0,0,'','',0,'','','',1756332507,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8464,'10300','64ba01e9e7dfc6a42245444f7f282053cf2858a5',NULL,1,3,0,1756332708,0,0,0,'jnbrabo1999@gmail.com',1756332708,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8465,'10400','64ba01e9e7dfc6a42245444f7f282053cf2858a5',NULL,1,3,0,1756332794,0,0,0,'jonathanbolado@gmail.com',1756332794,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8466,'35431080','d948796ce9b96dfaf73bbe21e34e523a3085d869',NULL,1,3,0,1756333182,0,0,0,'matheus.pbsousa21@gmail.con',1756333182,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8467,'2568','b1a5bfeccd0bb3db11cfee9205e7dbcd595462ab',NULL,1,3,20,1756333426,0,0,0,'leozin.aula4@gmail.com',1756333426,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8468,'707070','f70a61492337a5b64de4cf57593b86b3af7f1d8d',NULL,1,3,0,1756333589,0,0,0,'gilneto1101@gmail.com',1756333589,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8469,'denilso2','b8621b06a5897d1099e140a44fc786922861d42e',NULL,1,3,0,1756333928,0,0,0,'dede2mito@gmail.com',1756333928,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8470,'zllcapiroto2','2924ec278f5bbaf9cb9b061f632dc3ab3a84092a',NULL,1,3,0,1756334064,0,0,0,'sasa@gmail.com',1756334064,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8471,'thaynanzzy','a989d090d4612a5cba89ab61ccf0602433de6351',NULL,1,3,10,1756334249,0,0,0,'thaynangsb1@gmail.com',1756334249,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8472,'6767','6aa99b404c0503a6216de0739159262a3a5e81c1',NULL,1,3,0,1756334258,0,0,0,'toby_bfh@hotmail.com',1756334258,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8473,'9432','e29ce2b6fae41b77c9200cdc05a69e5c7fafddd3',NULL,1,3,0,1756334483,0,0,0,'willieskaiper@gmail.com',1756334483,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8474,'808080','f70a61492337a5b64de4cf57593b86b3af7f1d8d',NULL,1,3,0,1756334538,0,0,0,'gilneto1501@gmail.com',1756334538,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8475,'miguel','e6ba238c0e580fd6d6687a1f17c7468e7c677b06',NULL,1,3,0,1756334962,0,0,0,'dustdsg@gmail.com',1756334962,0,0,'','',0,'','','',1756334972,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8476,'bigate','4dc29cb8b629e2efe12949c35d5e4acc3f756cbd',NULL,1,3,0,1756335255,0,0,0,'paulinhobigate@gmail.com',1756335255,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8477,'tonyx1','754f65b59925d85457ac8e320e59042c49f89709',NULL,1,3,0,1756335902,0,0,0,'maconha037@gmail.com',1756335902,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8478,'tonyx2','754f65b59925d85457ac8e320e59042c49f89709',NULL,1,3,0,1756335951,0,0,0,'dheyalbuquerque92@gmail.com',1756335951,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8479,'tonyx3','754f65b59925d85457ac8e320e59042c49f89709',NULL,1,3,0,1756336002,0,0,0,'mirante1992@hotmail.com',1756336002,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8480,'esquis4414','9c0f4472f5cf50de8806482504ceb5a569b0bccb',NULL,1,3,0,1756336141,0,0,0,'ekferahard@gmail.com',1756336141,0,0,'','',0,'','','',1756336172,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8481,'oo1241','c4d758f197c4bbcc36c69ceb3bcc4a023981515d',NULL,1,3,0,1756336653,0,0,0,'vaksksalkas@hotmail.com',1756336653,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8482,'505050','7944339be0237ddb1942884d62bc6a34f72f5fa9',NULL,1,33,13,1756336709,0,0,0,'Romsilvaa23@gmail.com',1756336709,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8483,'tonyx4','754f65b59925d85457ac8e320e59042c49f89709',NULL,1,3,0,1756337002,0,0,0,'maconha027@gmail.com',1756337002,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8484,'denisio','2c4e4db602d3bda6774f4bd5bde6f646500b4f47',NULL,1,3,0,1756337272,0,0,0,'junintokio133@gmail.com',1756337272,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8485,'UxPKGzCazIhLT','1e9d6d0fa19c9c77b98a417739bfb8730dde48f9',NULL,1,3,0,1756337733,0,0,0,'cuzofop300@gmail.com',1756337733,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8486,'jonasmacaco123','4c2f2c5a6f07af51c6cf3737c2e46cf59f262380',NULL,1,33,13,1756338298,0,0,0,'brunogiovani45@gmail.com',1756338298,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8487,'351546','f4973cf1b9f6dd618e8fb20432481c461ba1533c',NULL,1,3,0,1756338901,0,0,0,'thiagoformigam10@gmail.com',1756338901,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8488,'351547','f4973cf1b9f6dd618e8fb20432481c461ba1533c',NULL,1,3,30,1756338965,0,0,0,'thiagoformigam11@gmail.com',1756338965,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8489,'terceiro441','3b1245a93c5c22d874c251de270fdd12aa4a3261',NULL,1,3,44,1756339723,0,0,0,'pvieira3253@gmail.com',1756339723,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8490,'danilofelix','08a77d165dc110658532ceecae2757126e245f0d',NULL,1,3,0,1756339786,0,0,0,'lukeevans513@hotmail.com',1756339786,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8491,'shawsz','bca0e443a49f44f5ab70d9ad89f32e2b617befcc',NULL,1,33,0,1756339913,0,0,0,'lukeevans513@gmail.com',1756339913,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8492,'shawsz2','bca0e443a49f44f5ab70d9ad89f32e2b617befcc',NULL,1,3,0,1756340026,0,0,0,'shusahsuah@hotmail.com',1756340026,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8493,'shawsz3','bca0e443a49f44f5ab70d9ad89f32e2b617befcc',NULL,1,3,0,1756340087,0,0,0,'spasokdsa@hotmail.xom',1756340087,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8494,'picapau','f69af60dc8bffc05f7c261e7bd93e3cb5454c92b',NULL,1,3,0,1756340216,0,0,0,'picapau@gmail.com',1756340216,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8495,'malino455','e63e2e492265d163fb07436d910df7632490cae7',NULL,1,3,0,1756340973,0,0,0,'gusionlins@gmail.com',1756340973,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8496,'orc123','ad2f81bcca652ac4ea7c575a37fe093679b7a431',NULL,1,3,0,1756341211,0,0,0,'fernandinholins6@gmail.com',1756341211,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8497,'280578jf','31838753e7f83e119c193653f1985f1b8df12e76',NULL,1,3,0,1756342263,0,0,0,'wesley_chininha@hotmail.com',1756342263,0,0,'','',0,'','','',1756342306,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8498,'daniele2','3405fb603e3e805743e0d6c8a915d81e72347251',NULL,1,3,0,1756342287,0,0,0,'daniele2@hotmail.com',1756342287,0,0,'','',0,'','','',0,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0),(8499,'Kaissin123','7c80eefa359f4734f2b84ec70b5cc99bc4e643b6',NULL,1,3,0,1756344980,0,0,0,'Kaisonleonny@gmail.com',1756344980,0,0,'','',0,'','','',1756345034,0,'',0,0,'',0,0,0,0,0,'',0,0,0,0,0,0,'','',0,'',0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=974 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boost_creature`
--

LOCK TABLES `boost_creature` WRITE;
/*!40000 ALTER TABLE `boost_creature` DISABLE KEYS */;
INSERT INTO `boost_creature` VALUES (970,'normal','Assassin',30,20,NULL),(971,'boss','Drazzak',30,15,NULL),(972,'second','Haunted treeling',30,20,NULL),(973,'third','Ghastly dragon',30,20,NULL);
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
INSERT INTO `global_storage` VALUES ('69798','1756368000'),('69799','1716248993');
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
INSERT INTO `house_lists` VALUES (201,257,'Aleska Teodoro\nLuana Moranguinho'),(542,256,'Stormy\nShawty'),(542,257,'Stormy\nShawty');
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
INSERT INTO `houses` VALUES (1,0,0,0,'Baixa 1',3000,1,0,0,0,0,20,NULL,1),(2,0,0,0,'Baixa 2',1200,1,0,0,0,0,12,NULL,1),(3,0,0,0,'Baixa 3',10000,1,0,0,0,0,24,NULL,1),(4,0,0,0,'Baixa 4',7000,1,0,0,0,0,30,NULL,1),(5,0,0,0,'Baixa 5',1700,1,0,0,0,0,25,NULL,1),(6,0,0,0,'Baixa 6',2000,1,0,0,0,0,30,NULL,1),(7,0,0,0,'Baixa 7',1300,1,0,0,0,0,20,NULL,1),(8,0,0,0,'Elite 1',30000,1,0,0,0,0,51,NULL,2),(9,0,0,0,'Elite 2',35000,1,0,0,0,0,74,NULL,3),(10,0,0,0,'Elite 3',20000,1,0,0,0,0,45,NULL,2),(11,0,0,0,'Elite 4',15000,1,0,0,0,0,55,NULL,3),(12,0,0,0,'Elite 5',15000,1,0,0,0,0,64,NULL,2),(13,0,0,0,'Depot 1',22000,1,0,0,0,0,30,NULL,1),(14,0,0,0,'Depot 2',20000,1,0,0,0,0,33,NULL,2),(15,0,0,0,'Depot 3',24000,1,0,0,0,0,25,NULL,1),(16,0,0,0,'Depot 4',25000,1,0,0,0,0,29,NULL,1),(17,0,0,0,'Depot 5',20000,1,0,0,0,0,30,NULL,1),(18,0,0,0,'Oeste 1',1800,1,0,0,0,0,20,NULL,1),(19,0,0,0,'Oeste 2',2000,1,0,0,0,0,24,NULL,1),(20,0,0,0,'Oeste 3',2900,1,0,0,0,0,33,NULL,2),(21,0,0,0,'Baixa 8',8000,1,0,0,0,0,25,NULL,1),(22,0,0,0,'Baixa 9',1500,1,0,0,0,0,21,NULL,1),(23,0,0,0,'Baixa 10',1400,1,0,0,0,0,18,NULL,1),(24,0,0,0,'Baixa 11',900,1,0,0,0,0,12,NULL,1),(25,0,0,0,'Elite 6',15000,1,0,0,0,0,57,NULL,2),(26,0,0,0,'Cima 1',3500,1,0,0,0,0,39,NULL,2),(27,0,0,0,'Leste 1',800,1,0,0,0,0,11,NULL,1),(28,0,0,0,'Leste 2',800,1,0,0,0,0,12,NULL,1),(29,0,0,0,'Leste 3',1100,1,0,0,0,0,15,NULL,1),(30,0,0,0,'Leste 4',1400,1,0,0,0,0,18,NULL,1),(31,0,0,0,'Leste 5',2000,1,0,0,0,0,22,NULL,1),(32,0,0,0,'Leste 6',1200,1,0,0,0,0,16,NULL,1),(33,0,0,0,'Leste 7',1200,1,0,0,0,0,15,NULL,1),(34,0,0,0,'Leste 8',800,1,0,0,0,0,9,NULL,1),(35,0,0,0,'Leste 9',1600,1,0,0,0,0,20,NULL,1),(36,0,0,0,'Leste 10',2000,1,0,0,0,0,22,NULL,1),(37,0,0,0,'Leste 11',2000,1,0,0,0,0,22,NULL,1),(38,0,0,0,'Leste 12',2500,1,0,0,0,0,29,NULL,1),(39,0,0,0,'Leste 13',1600,1,0,0,0,0,20,NULL,1),(40,0,0,0,'Leste 14',1200,1,0,0,0,0,15,NULL,1),(41,0,0,0,'Leste 15',1400,1,0,0,0,0,18,NULL,1),(42,0,0,0,'Leste 18',500,1,0,0,0,0,9,NULL,1),(43,0,0,0,'Leste 16',900,1,0,0,0,0,12,NULL,1),(44,0,0,0,'Leste 17',1500,1,0,0,0,0,20,NULL,1),(45,0,0,0,'Sul 1',1100,1,0,0,0,0,15,NULL,1),(46,0,0,0,'Sul 2',1100,1,0,0,0,0,15,NULL,1),(47,0,0,0,'Sul 3',800,1,0,0,0,0,12,NULL,1),(48,0,0,0,'Sul 4',1600,1,0,0,0,0,20,NULL,1),(49,0,0,0,'Sul 5',1100,1,0,0,0,0,16,NULL,1),(50,0,0,0,'Sul 6',1200,1,0,0,0,0,16,NULL,1),(51,0,0,0,'Sul 7',1500,1,0,0,0,0,20,NULL,1),(52,0,0,0,'Sul 8',1100,1,0,0,0,0,15,NULL,1),(53,0,0,0,'Rohirrims 1',3200,1,0,0,0,0,36,NULL,2),(54,0,0,0,'Sul 10',1200,1,0,0,0,0,15,NULL,1),(55,0,0,0,'Sul 11',900,1,0,0,0,0,12,NULL,1),(56,0,0,0,'Sul 12',800,1,0,0,0,0,12,NULL,1),(57,0,0,0,'Sul 13',1500,1,0,0,0,0,20,NULL,1),(58,0,0,0,'Sul 14',2200,1,0,0,0,0,29,NULL,1),(59,0,0,0,'Sul 15',1800,1,0,0,0,0,24,NULL,1),(60,0,0,0,'Sul 16',1500,1,0,0,0,0,20,NULL,1),(61,0,0,0,'Sul 17',1200,1,0,0,0,0,16,NULL,1),(62,0,0,0,'Sul 18',1500,1,0,0,0,0,19,NULL,1),(63,0,0,0,'Sul 19',1200,1,0,0,0,0,15,NULL,1),(64,0,0,0,'Sul 20',1500,1,0,0,0,0,20,NULL,1),(65,0,0,0,'Sul 21',1900,1,0,0,0,0,24,NULL,1),(66,0,0,0,'Sul 22',1700,1,0,0,0,0,24,NULL,1),(67,0,0,0,'Sul 23',1000,1,0,0,0,0,15,NULL,1),(68,0,0,0,'Sul 24',1200,1,0,0,0,0,15,NULL,1),(69,0,0,0,'Sul 25',1200,1,0,0,0,0,15,NULL,1),(70,0,0,0,'Sul 26',1200,1,0,0,0,0,15,NULL,1),(71,0,0,0,'Sul 27',1100,1,0,0,0,0,15,NULL,1),(72,0,0,0,'Sul 28',700,1,0,0,0,0,10,NULL,1),(73,0,0,0,'Sul 29',1200,1,0,0,0,0,14,NULL,1),(74,0,0,0,'Sul 30',1200,1,0,0,0,0,16,NULL,1),(75,0,0,0,'Oeste 4',1200,1,0,0,0,0,14,NULL,1),(76,0,0,0,'Oeste 5',1100,1,0,0,0,0,15,NULL,1),(77,0,0,0,'Oeste 6',800,1,0,0,0,0,12,NULL,1),(78,0,0,0,'Oeste 7',1600,1,0,0,0,0,18,NULL,1),(79,0,0,0,'Oeste 8',800,1,0,0,0,0,12,NULL,1),(80,0,0,0,'Oeste 9',2400,1,0,0,0,0,26,NULL,2),(81,0,0,0,'Oeste 10',800,1,0,0,0,0,12,NULL,1),(82,0,0,0,'Oeste 11',500,1,0,0,0,0,9,NULL,1),(83,0,0,0,'Fazenda 9',1600,1,0,0,0,0,17,NULL,0),(84,0,0,0,'Sul 31',1400,1,0,0,0,0,16,NULL,1),(85,0,0,0,'Fazenda 1',1400,1,0,0,0,0,18,NULL,1),(86,0,0,0,'Fazenda 2',1400,1,0,0,0,0,17,NULL,1),(87,0,0,0,'Fazenda 3',1400,1,0,0,0,0,17,NULL,1),(88,0,0,0,'Fazenda 4',2700,1,0,0,0,0,30,NULL,1),(89,0,0,0,'Fazenda 5',1100,1,0,0,0,0,14,NULL,1),(90,0,0,0,'Fazenda 6',1900,1,0,0,0,0,22,NULL,1),(91,0,0,0,'Fazenda 7',1100,1,0,0,0,0,14,NULL,1),(92,0,0,0,'Fazenda 8',1100,1,0,0,0,0,14,NULL,1),(93,0,0,0,'Corredor 1',3000,2,0,0,0,0,15,NULL,1),(94,0,0,0,'Corredor 2',3000,2,0,0,0,0,13,NULL,1),(95,0,0,0,'Corredor 3',3000,2,0,0,0,0,13,NULL,1),(96,0,0,0,'Corredor 4',3000,2,0,0,0,0,13,NULL,1),(97,0,0,0,'Corredor 5',3000,2,0,0,0,0,13,NULL,1),(98,0,0,0,'Corredor 6',2000,2,0,0,0,0,15,NULL,1),(99,0,0,0,'Corredor 7',2000,2,0,0,0,0,10,NULL,1),(100,0,0,0,'Corredor 8',2000,2,0,0,0,0,10,NULL,1),(101,0,0,0,'Corredor 9',2000,2,0,0,0,0,10,NULL,1),(102,0,0,0,'Corredor 10',3000,2,0,0,0,0,10,NULL,1),(103,0,0,0,'Stronghold 1',3000,2,0,0,0,0,19,NULL,1),(104,0,0,0,'Stronghold 2',1400,2,0,0,0,0,19,NULL,1),(105,0,0,0,'Stronghold 3',2700,2,0,0,0,0,29,NULL,1),(106,0,0,0,'Rohirrims 2',3200,1,0,0,0,0,36,NULL,2),(107,0,0,0,'Stronghold 5',900,2,0,0,0,0,13,NULL,1),(108,0,0,0,'Stronghold 6',1000,2,0,0,0,0,17,NULL,2),(109,0,0,0,'Stronghold 7',1200,2,0,0,0,0,17,NULL,1),(110,0,0,0,'Stronghold 8',2000,2,0,0,0,0,29,NULL,2),(111,0,0,0,'Rohirrims 3',2900,1,0,0,0,0,31,NULL,1),(112,0,0,0,'Stronghold 10',1100,2,0,0,0,0,13,NULL,1),(113,0,0,0,'Stronghold 11',1100,2,0,0,0,0,13,NULL,1),(114,0,0,0,'Stronghold 12',1100,2,0,0,0,0,13,NULL,1),(115,0,0,0,'Cima 2',1500,1,0,0,0,0,17,NULL,1),(116,0,0,0,'Cima 3',2300,1,0,0,0,0,27,NULL,1),(117,0,0,0,'Cima 4',1700,1,0,0,0,0,19,NULL,1),(118,0,0,0,'Elvenpath 1',3500,3,0,0,0,0,10,NULL,1),(119,0,0,0,'Elvenpath 2',3000,3,0,0,0,0,13,NULL,1),(120,0,0,0,'Elvenpath 3',1400,3,0,0,0,0,16,NULL,1),(121,0,0,0,'Elvenpath 4',1100,3,0,0,0,0,13,NULL,1),(122,0,0,0,'Elvenpath 5',1100,3,0,0,0,0,13,NULL,1),(123,0,0,0,'Elvenpath 6',800,3,0,0,0,0,10,NULL,1),(124,0,0,0,'Elvenpath 7',800,3,0,0,0,0,10,NULL,1),(125,0,0,0,'Elvenpath 8',800,3,0,0,0,0,10,NULL,1),(126,0,0,0,'Elvenpath 9',800,3,0,0,0,0,10,NULL,1),(127,0,0,0,'Elvenpath 10',1400,3,0,0,0,0,16,NULL,1),(128,0,0,0,'Elvenpath 11',1400,3,0,0,0,0,16,NULL,1),(129,0,0,0,'Elvenpath 12',1400,3,0,0,0,0,16,NULL,1),(130,0,0,0,'Elvenpath 13',1400,3,0,0,0,0,16,NULL,1),(131,0,0,0,'Elvenpath 14',1100,3,0,0,0,0,13,NULL,1),(132,0,0,0,'Elvenpath 15',2500,3,0,0,0,0,29,NULL,2),(133,0,0,0,'Elvenpath 16',1500,3,0,0,0,0,17,NULL,1),(134,0,0,0,'Elvenpath 17',1700,3,0,0,0,0,19,NULL,1),(135,0,0,0,'Elvenpath 18',4000,3,0,0,0,0,42,NULL,1),(136,0,0,0,'Elvenpath 19',3500,3,0,0,0,0,37,NULL,1),(137,0,0,0,'Elvenpath 20',3500,3,0,0,0,0,26,NULL,1),(138,0,0,0,'Elvenpath 21',1900,3,0,0,0,0,21,NULL,1),(139,0,0,0,'Elvenpath 22',2900,3,0,0,0,0,31,NULL,1),(140,0,0,0,'Elvenpath 23',1500,3,0,0,0,0,17,NULL,1),(141,0,0,0,'Elvenpath 24',1700,3,0,0,0,0,19,NULL,1),(142,0,0,0,'Elvenpath 25',1500,3,0,0,0,0,17,NULL,1),(143,0,0,0,'Elvenpath 26',1900,3,0,0,0,0,21,NULL,1),(144,0,0,0,'Elvenpath 27',3600,3,0,0,0,0,21,NULL,1),(145,0,0,0,'Elvenpath 28',3500,3,0,0,0,0,13,NULL,1),(146,0,0,0,'Elvenpath 29',1900,3,0,0,0,0,21,NULL,1),(147,0,0,0,'Elvenpath 30',2300,3,0,0,0,0,25,NULL,1),(148,0,0,0,'Elvenpath 31',1900,3,0,0,0,0,21,NULL,1),(149,0,0,0,'Elvenpath 32',1400,3,0,0,0,0,16,NULL,1),(150,0,0,0,'Elvenpath 33',1900,3,0,0,0,0,21,NULL,1),(151,0,0,0,'Elvenpath 34',2900,3,0,0,0,0,31,NULL,1),(152,0,0,0,'Elvenpath 35',1700,3,0,0,0,0,19,NULL,1),(153,0,0,0,'Elvenpath 36',1100,3,0,0,0,0,13,NULL,1),(154,0,0,0,'Elvenpath 37',2300,3,0,0,0,0,25,NULL,1),(155,0,0,0,'Elvenpath 38',1100,3,0,0,0,0,13,NULL,1),(156,0,0,0,'Elvenpath 39',6000,3,0,0,0,0,29,NULL,1),(157,0,0,0,'Elvenpath 40',1900,3,0,0,0,0,21,NULL,1),(158,0,0,0,'Elvenpath 41',2400,3,0,0,0,0,26,NULL,1),(159,0,0,0,'Elvenpath 42',2700,3,0,0,0,0,29,NULL,1),(160,0,0,0,'Elvenpath 43',2000,3,0,0,0,0,22,NULL,1),(161,0,0,0,'Elvenpath 44',3200,3,0,0,0,0,36,NULL,2),(162,0,0,0,'Elvenpath 45',2400,3,0,0,0,0,26,NULL,1),(163,0,0,0,'Elvenpath 46',1100,3,0,0,0,0,13,NULL,1),(164,0,0,0,'Elvenpath 47',1100,3,0,0,0,0,13,NULL,1),(165,0,0,0,'Elvenpath 48',4500,3,0,0,0,0,25,NULL,1),(166,0,0,0,'Elvenpath 49',1500,3,0,0,0,0,17,NULL,1),(167,0,0,0,'Elvenpath 50',1400,3,0,0,0,0,16,NULL,1),(168,0,0,0,'Depot Square 1',18000,4,0,0,0,0,29,NULL,2),(169,0,0,0,'Depot Square 2',12000,4,0,0,0,0,22,NULL,2),(170,0,0,0,'Depot Square 3',10000,4,0,0,0,0,31,NULL,2),(171,0,0,0,'Depot Square 4',3000,4,0,0,0,0,25,NULL,2),(172,0,0,0,'Depot Square 5',13000,4,0,0,0,0,21,NULL,2),(173,0,0,0,'Depot Square 6',13000,4,0,0,0,0,26,NULL,2),(174,0,0,0,'Depot Square 7',12000,4,0,0,0,0,19,NULL,1),(175,0,0,0,'Depot Square 8',12000,4,0,0,0,0,22,NULL,1),(176,0,0,0,'Depot Square 9',14000,4,0,0,0,0,29,NULL,1),(177,0,0,0,'Depot Square 10',30000,4,0,0,0,0,51,NULL,4),(178,0,0,0,'Depot Square 11',12000,4,0,0,0,0,26,NULL,2),(179,0,0,0,'Av Elendil 1',1050,4,0,0,0,0,25,NULL,2),(180,0,0,0,'Av Elendil 2',700,4,0,0,0,0,16,NULL,1),(181,0,0,0,'Av Elendil 3',700,4,0,0,0,0,16,NULL,1),(182,0,0,0,'Av Elendil 4',450,4,0,0,0,0,11,NULL,1),(183,0,0,0,'Av Elendil 5',450,4,0,0,0,0,11,NULL,1),(184,0,0,0,'Av Elendil 6',550,4,0,0,0,0,13,NULL,1),(185,0,0,0,'Fazenda 10',1000,1,0,0,0,0,20,NULL,1),(186,0,0,0,'Av Elendil 8',1150,4,0,0,0,0,25,NULL,1),(187,0,0,0,'Av Elendil 9',850,4,0,0,0,0,19,NULL,1),(188,0,0,0,'Av Elendil 10',1750,4,0,0,0,0,43,NULL,4),(189,0,0,0,'Av Elendil 11',1050,4,0,0,0,0,25,NULL,2),(190,0,0,0,'Av Elendil 12',1050,4,0,0,0,0,25,NULL,2),(191,0,0,0,'Av Elendil 13',1550,4,0,0,0,0,37,NULL,3),(192,0,0,0,'Av Elendil 14',1500,4,0,0,0,0,36,NULL,3),(193,0,0,0,'Eriador 1',1100,4,0,0,0,0,26,NULL,2),(194,0,0,0,'Eriador 2',1350,4,0,0,0,0,31,NULL,2),(195,0,0,0,'Dark Woods 1',1000,2,0,0,0,0,29,NULL,2),(196,0,0,0,'Eriador 4',550,4,0,0,0,0,13,NULL,1),(197,0,0,0,'Eriador 5',550,4,0,0,0,0,13,NULL,1),(198,0,0,0,'Eriador 6',1100,4,0,0,0,0,26,NULL,2),(199,0,0,0,'Eriador 7',1250,4,0,0,0,0,31,NULL,3),(200,0,0,0,'Eriador 8',1150,4,0,0,0,0,25,NULL,1),(201,11940,0,0,'Everdim 1',1500,4,0,0,0,0,36,NULL,3),(202,0,0,0,'Everdim 2',650,4,0,0,0,0,17,NULL,2),(203,0,0,0,'Everdim 3',1050,4,0,0,0,0,25,NULL,2),(204,0,0,0,'Everdim 4',1050,4,0,0,0,0,25,NULL,2),(205,0,0,0,'Everdim 5',1050,4,0,0,0,0,25,NULL,2),(206,0,0,0,'Everdim 6',750,4,0,0,0,0,19,NULL,2),(207,0,0,0,'Everdim 7',1100,4,0,0,0,0,26,NULL,2),(208,0,0,0,'Everdim 8',2200,4,0,0,0,0,50,NULL,3),(209,0,0,0,'Everdim 9',1150,4,0,0,0,0,25,NULL,1),(210,0,0,0,'Everdim 10',1550,4,0,0,0,0,33,NULL,1),(211,0,0,0,'Everdim 11',1600,4,0,0,0,0,36,NULL,2),(212,0,0,0,'Everdim 12',950,4,0,0,0,0,21,NULL,1),(213,0,0,0,'Everdim 13',950,4,0,0,0,0,21,NULL,1),(214,0,0,0,'Everdim 14',1850,4,0,0,0,0,43,NULL,3),(215,0,0,0,'Everdim 15',1100,4,0,0,0,0,26,NULL,2),(216,0,0,0,'Dark Woods 2',1250,2,0,0,0,0,29,NULL,2),(217,0,0,0,'Dark Woods 3',850,2,0,0,0,0,21,NULL,2),(218,0,0,0,'Dark Woods 4',1250,2,0,0,0,0,17,NULL,1),(219,0,0,0,'Dark Woods ',1250,2,0,0,0,0,17,NULL,1),(220,0,0,0,'Lake Town 1',140,5,0,0,0,0,7,NULL,1),(221,0,0,0,'Lake Town 2',180,5,0,0,0,0,9,NULL,1),(222,0,0,0,'Lake Town 3',140,5,0,0,0,0,7,NULL,1),(223,0,0,0,'Lake Town 4',260,5,0,0,0,0,13,NULL,1),(224,0,0,0,'Lake Town 5',200,5,0,0,0,0,10,NULL,1),(225,0,0,0,'Lake Town 6',260,5,0,0,0,0,13,NULL,1),(226,0,0,0,'Lake Town 7',260,5,0,0,0,0,13,NULL,1),(227,0,0,0,'Lake Town 8',140,5,0,0,0,0,7,NULL,1),(228,0,0,0,'Lake Town 9',200,5,0,0,0,0,10,NULL,1),(229,0,0,0,'Lake Town 10',200,5,0,0,0,0,10,NULL,1),(230,0,0,0,'Lake Town 11',180,5,0,0,0,0,9,NULL,1),(231,0,0,0,'Lake Town 12',260,5,0,0,0,0,13,NULL,1),(232,0,0,0,'Lake Town 13',180,5,0,0,0,0,9,NULL,1),(233,0,0,0,'Lake Town 14',140,5,0,0,0,0,7,NULL,1),(234,0,0,0,'Lake Town 15',320,5,0,0,0,0,16,NULL,1),(235,0,0,0,'Lake Town 16',220,5,0,0,0,0,11,NULL,1),(236,0,0,0,'Lake Town 17',260,5,0,0,0,0,13,NULL,1),(237,0,0,0,'Lake Town 18',260,5,0,0,0,0,13,NULL,1),(238,0,0,0,'Lake Town 19',320,5,0,0,0,0,16,NULL,1),(239,0,0,0,'Lake Town 20',320,5,0,0,0,0,16,NULL,1),(240,0,0,0,'Lake Town 21',260,5,0,0,0,0,13,NULL,1),(241,0,0,0,'Lake Town 22',180,5,0,0,0,0,9,NULL,1),(242,0,0,0,'Lake Town 23',180,5,0,0,0,0,9,NULL,1),(243,0,0,0,'Lake Town 24',260,5,0,0,0,0,13,NULL,1),(244,0,0,0,'Rohirrims 4',2500,1,0,0,0,0,29,NULL,2),(245,0,0,0,'Mordor 1',220,12,0,0,0,0,26,NULL,2),(246,0,0,0,'Ship 1',700,6,0,0,0,0,37,NULL,1),(247,0,0,0,'Ship 2',780,6,0,0,0,0,43,NULL,2),(248,0,0,0,'Ship 3',660,6,0,0,0,0,37,NULL,2),(249,0,0,0,'Ship 4',780,6,0,0,0,0,43,NULL,2),(250,0,0,0,'Ship 5',780,6,0,0,0,0,43,NULL,2),(251,0,0,0,'Ship 6',540,6,0,0,0,0,31,NULL,2),(252,0,0,0,'Ship 7',540,6,0,0,0,0,31,NULL,2),(253,0,0,0,'Ship 8',820,6,0,0,0,0,43,NULL,1),(254,0,0,0,'Ship 9',780,6,0,0,0,0,43,NULL,2),(255,0,0,0,'Ship 10',660,6,0,0,0,0,37,NULL,2),(256,0,0,0,'Ship 11',780,6,0,0,0,0,43,NULL,2),(257,0,0,0,'Ship 12',700,6,0,0,0,0,37,NULL,1),(258,0,0,0,'Argond 1',2400,7,0,0,0,0,43,NULL,1),(259,0,0,0,'Argond 2',1500,7,0,0,0,0,17,NULL,1),(260,0,0,0,'Argond 3',1600,7,0,0,0,0,72,NULL,1),(261,0,0,0,'Argond 4',4000,7,0,0,0,0,80,NULL,1),(262,0,0,0,'Argond 5',2500,7,0,0,0,0,37,NULL,1),(263,0,0,0,'Argond 6',2500,7,0,0,0,0,77,NULL,1),(264,0,0,0,'Argond 7',2000,7,0,0,0,0,80,NULL,1),(265,0,0,0,'Argond 8',2400,7,0,0,0,0,81,NULL,1),(266,0,0,0,'Argond 9',2400,7,0,0,0,0,56,NULL,1),(267,0,0,0,'Argond 10',2400,7,0,0,0,0,55,NULL,1),(268,0,0,0,'Argond 11',4200,7,0,0,0,0,71,NULL,1),(269,0,0,0,'Argond 12',5000,7,0,0,0,0,118,NULL,1),(270,0,0,0,'Minas 1',15000,13,0,0,0,0,81,NULL,2),(271,0,0,0,'Minas 2',12000,13,0,0,0,0,38,NULL,1),(272,0,0,0,'Minas 3',16000,13,0,0,0,0,85,NULL,2),(273,0,0,0,'Minas 4',14000,13,0,0,0,0,54,NULL,2),(274,0,0,0,'Treetop 8',800,5,0,0,0,0,23,NULL,1),(275,0,0,0,'Minas 5',13000,13,0,0,0,0,34,NULL,1),(276,0,0,0,'Minas 6',15000,13,0,0,0,0,64,NULL,3),(277,0,0,0,'Minas 7',25000,13,0,0,0,0,134,NULL,2),(278,0,0,0,'Minas Depot 1',1500,13,0,0,0,0,22,NULL,2),(279,0,0,0,'Minas Depot 2',1500,13,0,0,0,0,16,NULL,2),(280,0,0,0,'Minas Depot 3',1500,13,0,0,0,0,21,NULL,2),(281,0,0,0,'Minas Depot 4',1500,13,0,0,0,0,16,NULL,2),(282,0,0,0,'Minas Depot 5',1500,13,0,0,0,0,25,NULL,2),(283,0,0,0,'Minas Depot 6',1500,13,0,0,0,0,19,NULL,2),(284,0,0,0,'Minas Depot 7',1500,13,0,0,0,0,26,NULL,2),(285,0,0,0,'Minas Depot 8',1500,13,0,0,0,0,19,NULL,2),(286,0,0,0,'Minas Depot 9',1500,13,0,0,0,0,56,NULL,2),(287,0,0,0,'Minas Depot 10',1500,13,0,0,0,0,29,NULL,2),(288,0,0,0,'Minas Depot 11',1500,13,0,0,0,0,32,NULL,1),(289,0,0,0,'Shire 1',1600,4,0,0,0,0,175,NULL,1),(290,0,0,0,'Shire 2',1600,4,0,0,0,0,158,NULL,1),(291,0,0,0,'Shire 3',1600,4,0,0,0,0,147,NULL,1),(292,0,0,0,'Shire 4',1600,4,0,0,0,0,198,NULL,1),(294,0,0,0,'Mines 1',300,10,0,0,0,0,17,NULL,1),(295,0,0,0,'Mines 2',300,10,0,0,0,0,17,NULL,1),(296,0,0,0,'Mines 3',300,10,0,0,0,0,17,NULL,1),(297,0,0,0,'Mines 4',300,10,0,0,0,0,17,NULL,1),(298,0,0,0,'Mines 5',300,10,0,0,0,0,17,NULL,1),(299,0,0,0,'Mines 6',260,10,0,0,0,0,17,NULL,2),(300,0,0,0,'Mines 7',300,10,0,0,0,0,17,NULL,1),(301,0,0,0,'Mines 8',300,10,0,0,0,0,17,NULL,1),(302,0,0,0,'Mines 9',300,10,0,0,0,0,17,NULL,1),(303,0,0,0,'Mines 10',300,10,0,0,0,0,17,NULL,1),(304,0,0,0,'Mines 11',300,10,0,0,0,0,17,NULL,1),(305,0,0,0,'Mines 12',300,10,0,0,0,0,17,NULL,1),(306,0,0,0,'Mines 13',300,10,0,0,0,0,17,NULL,1),(307,0,0,0,'Mines 14',300,10,0,0,0,0,17,NULL,1),(308,0,0,0,'Mines 15',300,10,0,0,0,0,17,NULL,1),(309,0,0,0,'Mines 16',300,10,0,0,0,0,17,NULL,1),(310,0,0,0,'Mines 18',300,10,0,0,0,0,17,NULL,1),(311,0,0,0,'Mines 19',300,10,0,0,0,0,17,NULL,1),(312,0,0,0,'Mines 20',300,10,0,0,0,0,17,NULL,1),(313,0,0,0,'Mines 21',260,10,0,0,0,0,17,NULL,2),(314,0,0,0,'Mines 22',300,10,0,0,0,0,17,NULL,1),(315,0,0,0,'Mines 23',300,10,0,0,0,0,17,NULL,1),(316,0,0,0,'Mines 24',300,10,0,0,0,0,17,NULL,1),(317,0,0,0,'Mines 25',300,10,0,0,0,0,17,NULL,1),(318,0,0,0,'Mines 26',300,10,0,0,0,0,17,NULL,1),(319,0,0,0,'Mines 27',300,10,0,0,0,0,17,NULL,1),(320,0,0,0,'Mines 28',300,10,0,0,0,0,17,NULL,1),(321,0,0,0,'Mines 29',300,10,0,0,0,0,17,NULL,1),(322,0,0,0,'Mines 30',300,10,0,0,0,0,17,NULL,1),(323,0,0,0,'Mines 31',300,10,0,0,0,0,17,NULL,1),(324,0,0,0,'Mines 32',300,10,0,0,0,0,17,NULL,1),(325,0,0,0,'Mines 33',300,10,0,0,0,0,17,NULL,1),(326,0,0,0,'Mines 34',300,10,0,0,0,0,17,NULL,1),(327,0,0,0,'Mines 35',300,10,0,0,0,0,17,NULL,1),(328,0,0,0,'Mines 36',260,10,0,0,0,0,17,NULL,2),(329,0,0,0,'Mines 37',260,10,0,0,0,0,17,NULL,2),(330,0,0,0,'Mines 38',260,10,0,0,0,0,17,NULL,2),(331,0,0,0,'Mines 39',300,10,0,0,0,0,17,NULL,1),(332,0,0,0,'Mines 40',300,10,0,0,0,0,17,NULL,1),(333,0,0,0,'Mines 41',300,10,0,0,0,0,17,NULL,1),(334,0,0,0,'Mines 42',300,10,0,0,0,0,17,NULL,1),(335,0,0,0,'Mines 43',300,10,0,0,0,0,17,NULL,1),(336,0,0,0,'Mines 44',300,10,0,0,0,0,17,NULL,1),(337,0,0,0,'Mines 45',300,10,0,0,0,0,17,NULL,1),(338,0,0,0,'Dwarf Square',17000,10,0,0,0,0,35,NULL,2),(339,0,0,0,'Fazenda Dwarf 1',550,10,0,0,0,0,11,NULL,0),(340,0,0,0,'Fazenda Dwarf 2',700,10,0,0,0,0,14,NULL,0),(341,0,0,0,'Fazenda Dwarf 3',350,10,0,0,0,0,8,NULL,0),(342,0,0,0,'Fazenda Dwarf 4',500,10,0,0,0,0,11,NULL,0),(343,0,0,0,'Fazenda Dwarf 5',450,10,0,0,0,0,10,NULL,0),(344,0,0,0,'Lower Village 1',480,10,0,0,0,0,26,NULL,1),(345,0,0,0,'Lower Village 2',480,10,0,0,0,0,26,NULL,1),(346,0,0,0,'Lower Village 3',480,10,0,0,0,0,26,NULL,1),(347,0,0,0,'Lower Village 4',480,10,0,0,0,0,26,NULL,1),(348,0,0,0,'Lower Village 5',480,10,0,0,0,0,26,NULL,1),(349,0,0,0,'Lower Village 6',480,10,0,0,0,0,26,NULL,1),(350,0,0,0,'Lower Village 7',480,10,0,0,0,0,26,NULL,1),(351,0,0,0,'Lower Village 8',480,10,0,0,0,0,26,NULL,1),(352,0,0,0,'Lower Village 9',480,10,0,0,0,0,26,NULL,1),(353,0,0,0,'Lower Village 10',480,10,0,0,0,0,26,NULL,1),(354,0,0,0,'Lower Village 11',220,10,0,0,0,0,13,NULL,1),(355,0,0,0,'Lower Village 12',220,10,0,0,0,0,13,NULL,1),(356,0,0,0,'Lower Village 13',220,10,0,0,0,0,13,NULL,1),(357,0,0,0,'Lower Village 14',220,10,0,0,0,0,13,NULL,1),(358,0,0,0,'Lower Village 15',220,10,0,0,0,0,13,NULL,1),(359,0,0,0,'Lower Village 16',420,10,0,0,0,0,25,NULL,2),(360,0,0,0,'Lower Village 17',420,10,0,0,0,0,25,NULL,2),(361,0,0,0,'Lower Village 18',220,10,0,0,0,0,13,NULL,1),(362,0,0,0,'Lower Village 19',220,10,0,0,0,0,13,NULL,1),(363,0,0,0,'Lower Village 20',220,10,0,0,0,0,13,NULL,1),(364,0,0,0,'Lower Village 21',220,10,0,0,0,0,13,NULL,1),(365,0,0,0,'Lower Village 22',220,10,0,0,0,0,12,NULL,1),(366,0,0,0,'Lower Village 23',220,10,0,0,0,0,13,NULL,1),(367,0,0,0,'Lower Village 24',140,10,0,0,0,0,9,NULL,1),(368,0,0,0,'Lower Village 25',140,10,0,0,0,0,9,NULL,1),(369,0,0,0,'Lower Village 26',140,10,0,0,0,0,9,NULL,1),(370,0,0,0,'Lower Village 27',140,10,0,0,0,0,9,NULL,1),(371,0,0,0,'Lower Village 28',220,10,0,0,0,0,13,NULL,1),(372,0,0,0,'Dwarven Elite 1',4500,10,0,0,0,0,71,NULL,1),(373,0,0,0,'Dwarven Elite 2',4500,10,0,0,0,0,71,NULL,1),(374,0,0,0,'Dwarven Elite 3',4500,10,0,0,0,0,71,NULL,1),(375,0,0,0,'Dwarven Elite 4',4500,10,0,0,0,0,71,NULL,1),(376,0,0,0,'Capial 1',400,4,0,0,0,0,8,NULL,0),(377,0,0,0,'Capial 2',400,4,0,0,0,0,9,NULL,0),(378,0,0,0,'Mordor 2',150,12,0,0,0,0,17,NULL,1),(379,0,0,0,'Forod 1',280,11,0,0,0,0,16,NULL,1),(380,0,0,0,'Forod 2',280,11,0,0,0,0,16,NULL,1),(381,0,0,0,'Forod 3',220,11,0,0,0,0,13,NULL,1),(382,0,0,0,'Forod 4',160,11,0,0,0,0,10,NULL,1),(383,0,0,0,'Forod 5',220,11,0,0,0,0,13,NULL,1),(384,0,0,0,'Forod 6',300,11,0,0,0,0,19,NULL,2),(385,0,0,0,'Forod 7',220,11,0,0,0,0,13,NULL,1),(386,0,0,0,'Forod 8',280,11,0,0,0,0,16,NULL,1),(387,0,0,0,'Forod 10',300,11,0,0,0,0,17,NULL,1),(388,0,0,0,'Forod 11',180,11,0,0,0,0,11,NULL,1),(389,0,0,0,'Forod 12',220,11,0,0,0,0,15,NULL,2),(390,0,0,0,'Ice 1',280,11,0,0,0,0,16,NULL,1),(391,0,0,0,'Ice 2',220,11,0,0,0,0,13,NULL,1),(392,0,0,0,'Ice 3',340,11,0,0,0,0,19,NULL,1),(393,0,0,0,'Forod 13',200,11,0,0,0,0,13,NULL,1),(394,0,0,0,'Forod 14',280,11,0,0,0,0,16,NULL,1),(395,0,0,0,'Forod 15',180,11,0,0,0,0,11,NULL,1),(396,0,0,0,'Forod 16',320,11,0,0,0,0,18,NULL,1),(397,0,0,0,'Forod 17',320,11,0,0,0,0,18,NULL,1),(398,0,0,0,'Forod 18',240,11,0,0,0,0,16,NULL,2),(399,0,0,0,'Forod 19',220,11,0,0,0,0,13,NULL,1),(400,0,0,0,'Forod 20',740,11,0,0,0,0,54,NULL,3),(401,0,0,0,'Forod 21',280,11,0,0,0,0,16,NULL,1),(402,0,0,0,'Forod 22',220,11,0,0,0,0,13,NULL,1),(403,0,0,0,'Forod 23',160,11,0,0,0,0,10,NULL,1),(404,0,0,0,'Forod 24',220,11,0,0,0,0,13,NULL,1),(405,0,0,0,'Forod 25',300,11,0,0,0,0,19,NULL,2),(406,0,0,0,'Forod 26',240,11,0,0,0,0,14,NULL,1),(407,0,0,0,'Forod 27',320,11,0,0,0,0,18,NULL,1),(408,0,0,0,'Forod 28',320,11,0,0,0,0,18,NULL,1),(409,0,0,0,'Forod 29',300,11,0,0,0,0,17,NULL,1),(410,0,0,0,'Forod 30',300,11,0,0,0,0,17,NULL,1),(411,0,0,0,'Ice 4',220,11,0,0,0,0,13,NULL,1),(412,0,0,0,'Ice 5',280,11,0,0,0,0,17,NULL,1),(413,0,0,0,'Ice 6',220,11,0,0,0,0,13,NULL,1),(414,0,0,0,'Top',220,11,0,0,0,0,13,NULL,1),(415,0,0,0,'Mordor 3',150,12,0,0,0,0,17,NULL,1),(416,0,0,0,'Mordor 4',330,12,0,0,0,0,37,NULL,2),(417,0,0,0,'Mordor 5',220,12,0,0,0,0,26,NULL,2),(418,0,0,0,'Mordor 6',330,12,0,0,0,0,37,NULL,2),(419,0,0,0,'Mordor 7',150,12,0,0,0,0,17,NULL,1),(420,0,0,0,'Mordor 8',150,12,0,0,0,0,17,NULL,1),(421,0,0,0,'Mordor 9',150,12,0,0,0,0,17,NULL,1),(422,0,0,0,'Mordor 10',210,12,0,0,0,0,25,NULL,2),(423,0,0,0,'Mordor 11',210,12,0,0,0,0,25,NULL,2),(424,0,0,0,'Mordor 13',210,12,0,0,0,0,29,NULL,2),(425,0,0,0,'Mordor 14',200,12,0,0,0,0,22,NULL,1),(426,0,0,0,'Mordor 15',150,12,0,0,0,0,17,NULL,1),(427,0,0,0,'Mordor 16',110,12,0,0,0,0,13,NULL,1),(428,0,0,0,'Mordor 17',150,12,0,0,0,0,17,NULL,1),(429,0,0,0,'Mordor 18',110,12,0,0,0,0,13,NULL,1),(430,0,0,0,'Mordor 19',290,12,0,0,0,0,33,NULL,2),(431,0,0,0,'Mordor 20',290,12,0,0,0,0,33,NULL,2),(432,0,0,0,'Mordor 21',270,12,0,0,0,0,31,NULL,2),(433,0,0,0,'Mordor 22',270,12,0,0,0,0,31,NULL,2),(434,0,0,0,'Mordor 23',290,12,0,0,0,0,33,NULL,2),(435,0,0,0,'Mordor 24',290,12,0,0,0,0,33,NULL,2),(436,0,0,0,'Mordor 25',290,12,0,0,0,0,33,NULL,2),(437,0,0,0,'Mordor 26',290,12,0,0,0,0,33,NULL,2),(438,0,0,0,'Mordor 27',270,12,0,0,0,0,31,NULL,2),(439,0,0,0,'Mordor 28',520,12,0,0,0,0,58,NULL,3),(440,0,0,0,'Mordor 29',270,12,0,0,0,0,31,NULL,2),(441,0,0,0,'Mordor 30',250,12,0,0,0,0,29,NULL,2),(442,0,0,0,'Mordor 31',250,12,0,0,0,0,29,NULL,2),(443,0,0,0,'Mordor 32',150,12,0,0,0,0,17,NULL,1),(444,0,0,0,'Mordor 33',150,12,0,0,0,0,17,NULL,1),(445,0,0,0,'Mordor 34',150,12,0,0,0,0,17,NULL,1),(446,0,0,0,'Mordor 35',150,12,0,0,0,0,17,NULL,1),(447,0,0,0,'Mordor 36',140,11,0,0,0,0,16,NULL,1),(448,0,0,0,'Mordor 37',210,12,0,0,0,0,25,NULL,2),(449,0,0,0,'Mordor 38',210,12,0,0,0,0,25,NULL,2),(450,0,0,0,'Mordor 39',210,12,0,0,0,0,25,NULL,2),(451,0,0,0,'Mordor 40',210,12,0,0,0,0,25,NULL,2),(452,0,0,0,'Mordor 41',270,12,0,0,0,0,31,NULL,2),(453,0,0,0,'Mordor 42',190,12,0,0,0,0,21,NULL,1),(454,0,0,0,'Mordor 43',190,12,0,0,0,0,21,NULL,1),(455,0,0,0,'Mordor 44',380,12,0,0,0,0,42,NULL,2),(456,0,0,0,'Mordor 45',230,12,0,0,0,0,25,NULL,1),(457,0,0,0,'Mordor 46',250,12,0,0,0,0,25,NULL,0),(458,0,0,0,'Minas Depot 12',1000,13,0,0,0,0,30,NULL,2),(459,0,0,0,'Minas Depot 13',1000,13,0,0,0,0,31,NULL,2),(460,0,0,0,'Minas Depot 14',1000,13,0,0,0,0,17,NULL,2),(461,0,0,0,'Minas Top 1',1000,13,0,0,0,0,37,NULL,1),(462,0,0,0,'Minas Top 2',1000,13,0,0,0,0,24,NULL,1),(463,0,0,0,'Minas Top 3',1000,13,0,0,0,0,31,NULL,1),(464,0,0,0,'Minas Top 4',1000,13,0,0,0,0,37,NULL,2),(465,0,0,0,'Minas Top 5',1000,13,0,0,0,0,56,NULL,3),(466,0,0,0,'Minas Top 6',1000,13,0,0,0,0,61,NULL,3),(467,0,0,0,'Minas Top 7',1000,13,0,0,0,0,41,NULL,3),(468,0,0,0,'Minas Mirante',1000,13,0,0,0,0,33,NULL,2),(469,0,0,0,'Darashia 2, Flat 07',1000,10,0,0,0,0,48,NULL,1),(470,0,0,0,'Anubis 1',500,14,0,0,0,0,13,NULL,1),(471,0,0,0,'Anubis 2',500,14,0,0,0,0,13,NULL,1),(472,0,0,0,'Anubis 3',550,14,0,0,0,0,17,NULL,1),(473,0,0,0,'Anubis 4',550,14,0,0,0,0,17,NULL,1),(474,0,0,0,'Anubis 5',520,14,0,0,0,0,13,NULL,1),(475,0,0,0,'Anubis 6',520,14,0,0,0,0,13,NULL,1),(476,0,0,0,'Anubis 7',550,14,0,0,0,0,17,NULL,1),(477,0,0,0,'Anubis 8',540,14,0,0,0,0,17,NULL,1),(478,0,0,0,'Anubis 9',530,14,0,0,0,0,17,NULL,1),(479,0,0,0,'Anubis 10',580,14,0,0,0,0,17,NULL,1),(480,0,0,0,'Anubis 11',520,14,0,0,0,0,17,NULL,1),(481,0,0,0,'Anubis 12',520,14,0,0,0,0,17,NULL,1),(482,0,0,0,'Anubis 13',520,14,0,0,0,0,17,NULL,1),(483,0,0,0,'Horus 1',600,14,0,0,0,0,17,NULL,1),(484,0,0,0,'Horus 2',600,14,0,0,0,0,17,NULL,1),(485,0,0,0,'Horus 3',600,14,0,0,0,0,17,NULL,1),(486,0,0,0,'Horus 4',700,14,0,0,0,0,17,NULL,1),(487,0,0,0,'Horus 5',1200,14,0,0,0,0,73,NULL,2),(488,0,0,0,'Horus 6',700,14,0,0,0,0,19,NULL,1),(489,0,0,0,'Horus 7',700,14,0,0,0,0,19,NULL,1),(490,0,0,0,'Horus 8',1100,14,0,0,0,0,49,NULL,1),(491,0,0,0,'Horus 9',1200,14,0,0,0,0,55,NULL,1),(492,0,0,0,'Horus 10',700,14,0,0,0,0,25,NULL,1),(493,0,0,0,'Horus 11',750,14,0,0,0,0,31,NULL,2),(494,0,0,0,'Horus 12',700,14,0,0,0,0,25,NULL,1),(495,0,0,0,'Horus 13',700,14,0,0,0,0,19,NULL,1),(496,0,0,0,'Horus 14',750,14,0,0,0,0,25,NULL,1),(497,0,0,0,'Horus 15',650,14,0,0,0,0,25,NULL,1),(498,0,0,0,'Horus 16',650,14,0,0,0,0,19,NULL,1),(499,0,0,0,'Horus 17',650,14,0,0,0,0,25,NULL,1),(500,0,0,0,'Horus 18',750,14,0,0,0,0,16,NULL,1),(501,0,0,0,'Horus 19',700,14,0,0,0,0,13,NULL,1),(502,0,0,0,'Horus 20',700,14,0,0,0,0,21,NULL,1),(503,0,0,0,'Horus 21',700,14,0,0,0,0,21,NULL,1),(504,0,0,0,'Piramide 1',800,14,0,0,0,0,21,NULL,1),(505,0,0,0,'Piramide 2',600,14,0,0,0,0,9,NULL,1),(506,0,0,0,'Piramide 3',850,14,0,0,0,0,25,NULL,1),(507,0,0,0,'Piramide 4',750,14,0,0,0,0,21,NULL,1),(508,0,0,0,'Piramide 5',750,14,0,0,0,0,21,NULL,1),(509,0,0,0,'Piramide 6',700,14,0,0,0,0,21,NULL,1),(510,0,0,0,'Piramide 7',700,14,0,0,0,0,21,NULL,1),(511,0,0,0,'Piramide 8',650,14,0,0,0,0,13,NULL,1),(512,0,0,0,'Piramide 9',650,14,0,0,0,0,13,NULL,1),(513,0,0,0,'Piramide 10',800,14,0,0,0,0,29,NULL,2),(514,0,0,0,'Osiris 1',800,14,0,0,0,0,21,NULL,1),(515,0,0,0,'Osiris 2',800,14,0,0,0,0,21,NULL,1),(516,0,0,0,'Osiris 3',750,14,0,0,0,0,21,NULL,1),(517,0,0,0,'Osiris 4',750,14,0,0,0,0,21,NULL,1),(518,0,0,0,'Osiris 5',700,14,0,0,0,0,26,NULL,1),(519,0,0,0,'Seth 1',3000,14,0,0,0,0,33,NULL,1),(520,0,0,0,'Seth 2',3000,14,0,0,0,0,33,NULL,1),(521,0,0,0,'Seth 3',3000,14,0,0,0,0,33,NULL,1),(522,0,0,0,'Seth 4',3000,14,0,0,0,0,49,NULL,1),(523,0,0,0,'Seth 5',3000,14,0,0,0,0,55,NULL,1),(524,0,0,0,'Seth 6',3000,14,0,0,0,0,49,NULL,1),(525,0,0,0,'Seth 7',3000,14,0,0,0,0,25,NULL,1),(526,0,0,0,'Isis 1',600,14,0,0,0,0,11,NULL,1),(527,0,0,0,'Isis 2',600,14,0,0,0,0,11,NULL,1),(528,0,0,0,'Isis 3',550,14,0,0,0,0,11,NULL,1),(529,0,0,0,'Isis 4',550,14,0,0,0,0,11,NULL,1),(530,0,0,0,'Isis 5',550,14,0,0,0,0,13,NULL,1),(531,0,0,0,'Isis 6',550,14,0,0,0,0,13,NULL,1),(532,0,0,0,'Isis 7',500,14,0,0,0,0,13,NULL,1),(533,0,0,0,'Isis 8',500,14,0,0,0,0,13,NULL,1),(534,0,0,0,'Ra 1',15000,14,0,0,0,0,37,NULL,2),(535,0,0,0,'Ra 2',15000,14,0,0,0,0,37,NULL,2),(536,0,0,0,'Ra 3',15000,14,0,0,0,0,37,NULL,2),(537,0,0,0,'Ra 4',15000,14,0,0,0,0,37,NULL,2),(541,0,0,0,'Darashia 8, Flat 11',1990,10,0,0,0,0,66,NULL,2),(542,11936,0,0,'Ra 5 ',25000,14,0,0,0,0,66,NULL,2),(543,0,0,0,'Anfallas 1',850,15,0,0,0,0,21,NULL,1),(544,0,0,0,'Anfallas 2',850,15,0,0,0,0,25,NULL,2),(545,0,0,0,'Anfallas 3',800,15,0,0,0,0,22,NULL,2),(546,0,0,0,'Anfallas 4',650,15,0,0,0,0,10,NULL,1),(547,0,0,0,'Anfallas 5',850,15,0,0,0,0,19,NULL,1),(548,0,0,0,'Anfallas 6',900,15,0,0,0,0,22,NULL,2),(549,0,0,0,'Anfallas 7',850,15,0,0,0,0,43,NULL,2),(550,0,0,0,'Anfallas 8',650,15,0,0,0,0,22,NULL,1),(551,0,0,0,'Anfallas 9',600,15,0,0,0,0,13,NULL,1),(552,0,0,0,'Anfallas 10',550,15,0,0,0,0,13,NULL,1),(553,0,0,0,'Anfallas 11',700,15,0,0,0,0,29,NULL,1),(554,0,0,0,'Anfallas 12',450,15,0,0,0,0,9,NULL,1),(555,0,0,0,'Anfallas 13',600,15,0,0,0,0,19,NULL,1),(556,0,0,0,'Anfallas 14',750,15,0,0,0,0,31,NULL,2),(557,0,0,0,'Anfallas 15',700,15,0,0,0,0,26,NULL,1),(558,0,0,0,'Anfallas Top 1',900,15,0,0,0,0,21,NULL,1),(559,0,0,0,'Anfallas Top 2',650,15,0,0,0,0,10,NULL,1),(560,0,0,0,'Anfallas Top 3',850,15,0,0,0,0,19,NULL,1),(561,0,0,0,'Anfallas Top 4',950,15,0,0,0,0,22,NULL,1),(562,0,0,0,'Anfallas Top 5',800,15,0,0,0,0,43,NULL,2),(563,0,0,0,'Anfallas Top 6 ',750,15,0,0,0,0,25,NULL,1),(564,0,0,0,'Anfallas Top 7',650,15,0,0,0,0,22,NULL,1),(565,0,0,0,'Anfallas Top 8',600,15,0,0,0,0,13,NULL,1),(566,0,0,0,'Anfallas Top 9',550,15,0,0,0,0,13,NULL,1),(567,0,0,0,'Anfallas Top 10',700,15,0,0,0,0,19,NULL,1),(568,0,0,0,'Anfallas Top 11',800,15,0,0,0,0,31,NULL,1),(569,0,0,0,'Anfallas Top 12',800,15,0,0,0,0,26,NULL,1),(570,0,0,0,'Umbar#01',0,0,0,0,0,0,143,NULL,3),(571,0,0,0,'Umbar#02',0,0,0,0,0,0,95,NULL,2),(572,0,0,0,'Umbar#03',0,0,0,0,0,0,162,NULL,4),(573,0,0,0,'Umbar#04',0,0,0,0,0,0,277,NULL,7),(574,0,0,0,'Umbar#05',0,0,0,0,0,0,128,NULL,2),(575,0,0,0,'Umbar#06',0,0,0,0,0,0,63,NULL,1),(576,0,0,0,'Umbar#07',0,0,0,0,0,0,48,NULL,2),(577,0,0,0,'Umbar#08',0,0,0,0,0,0,89,NULL,2),(578,0,0,0,'Umbar#10',0,0,0,0,0,0,51,NULL,0),(579,0,0,0,'Umbar#09',0,0,0,0,0,0,66,NULL,1),(580,0,0,0,'Umbar#11',0,0,0,0,0,0,149,NULL,2),(581,0,0,0,'Umbar#12',0,0,0,0,0,0,118,NULL,2),(582,0,0,0,'Umbar#13',0,0,0,0,0,0,115,NULL,2),(583,0,0,0,'Umbar#14',0,0,0,0,0,0,154,NULL,2),(584,0,0,0,'Umbar#15',0,0,0,0,0,0,95,NULL,2),(585,0,0,0,'Umbar#16',0,0,0,0,0,0,101,NULL,3),(586,0,0,0,'Umbar#17',0,0,0,0,0,0,134,NULL,5),(587,0,0,0,'Umbar#18',0,0,0,0,0,0,162,NULL,2),(588,0,0,0,'Umbar#19',0,0,0,0,0,0,110,NULL,4),(589,0,0,0,'Umbar#20',0,0,0,0,0,0,228,NULL,0),(590,0,0,0,'Umbar#21',0,0,0,0,0,0,288,NULL,2),(591,0,0,0,'Umbar#22',0,0,0,0,0,0,207,NULL,2),(592,0,0,0,'Umbar#23',0,0,0,0,0,0,293,NULL,6),(593,0,0,0,'Umbar#24',0,0,0,0,0,0,167,NULL,4),(594,0,0,0,'Umbar#001',0,18,0,0,0,0,51,NULL,1),(595,0,0,0,'Umbar#002',0,18,0,0,0,0,59,NULL,1),(596,0,0,0,'Thanah II d',350,9,0,0,0,0,16,NULL,1),(597,0,0,0,'Thanah II e',350,9,0,0,0,0,12,NULL,1),(599,0,0,0,'Thanah II a',850,9,0,0,0,0,37,NULL,1),(600,0,0,0,'Thrarhor I c (Shop)',1050,9,0,0,0,0,28,NULL,1),(601,0,0,0,'Thrarhor I d (Shop)',1050,9,0,0,0,0,21,NULL,1),(602,0,0,0,'Thrarhor I a (Shop)',1050,9,0,0,0,0,32,NULL,1),(603,0,0,0,'Thrarhor I b (Shop)',1050,9,0,0,0,0,24,NULL,1),(604,0,0,0,'Thanah I c',3250,9,0,0,0,0,91,NULL,3),(605,0,0,0,'Thanah I d',2900,9,0,0,0,0,80,NULL,4),(606,0,0,0,'Thanah I b',3000,9,0,0,0,0,84,NULL,3),(607,0,0,0,'Thanah I a',850,9,0,0,0,0,27,NULL,1),(608,0,0,0,'Harrah I',5740,9,0,0,0,0,190,NULL,10),(609,0,0,0,'Charsirakh I b',1580,9,0,0,0,0,51,NULL,2),(610,0,0,0,'Charsirakh I a',280,9,0,0,0,0,15,NULL,1),(611,0,0,0,'Othehothep I d',2020,9,0,0,0,0,68,NULL,4),(612,0,0,0,'Othehothep I c',1720,9,0,0,0,0,58,NULL,3),(613,0,0,0,'Othehothep I b',1380,9,0,0,0,0,49,NULL,2),(614,0,0,0,'Othehothep I a',280,9,0,0,0,0,14,NULL,1),(615,0,0,0,'Othehothep II e',1340,9,0,0,0,0,44,NULL,2),(616,0,0,0,'Othehothep II f',1340,9,0,0,0,0,44,NULL,2),(617,0,0,0,'Othehothep II d',840,9,0,0,0,0,32,NULL,1),(618,0,0,0,'Othehothep II c',840,9,0,0,0,0,30,NULL,1),(619,0,0,0,'Othehothep II b',1920,9,0,0,0,0,67,NULL,3),(620,0,0,0,'Othehothep II a',400,9,0,0,0,0,18,NULL,1),(621,0,0,0,'Mothrem I',1140,9,0,0,0,0,38,NULL,2),(622,0,0,0,'Arakmehn I',1320,9,0,0,0,0,41,NULL,3),(623,0,0,0,'Othehothep III d',1040,9,0,0,0,0,36,NULL,1),(624,0,0,0,'Othehothep III c',940,9,0,0,0,0,30,NULL,2),(625,0,0,0,'Othehothep III e',840,9,0,0,0,0,32,NULL,1),(626,0,0,0,'Othehothep III f',680,9,0,0,0,0,27,NULL,1),(627,0,0,0,'Othehothep III b',1340,9,0,0,0,0,49,NULL,2),(628,0,0,0,'Othehothep III a',280,9,0,0,0,0,14,NULL,1),(629,0,0,0,'Unklath I d',1680,9,0,0,0,0,49,NULL,3),(630,0,0,0,'Unklath I e',1580,9,0,0,0,0,51,NULL,2),(631,0,0,0,'Unklath I g',1480,9,0,0,0,0,51,NULL,1),(632,0,0,0,'Unklath I f',1580,9,0,0,0,0,51,NULL,2),(633,0,0,0,'Unklath I c',1460,9,0,0,0,0,50,NULL,2),(634,0,0,0,'Unklath I b',1460,9,0,0,0,0,50,NULL,2),(635,0,0,0,'Unklath I a',1140,9,0,0,0,0,38,NULL,2),(636,0,0,0,'Arakmehn II',1040,9,0,0,0,0,38,NULL,1),(637,0,0,0,'Arakmehn III',1140,9,0,0,0,0,38,NULL,2),(638,0,0,0,'Unklath II b',680,9,0,0,0,0,25,NULL,1),(639,0,0,0,'Unklath II c',680,9,0,0,0,0,27,NULL,1),(640,0,0,0,'Unklath II d',1580,9,0,0,0,0,52,NULL,2),(641,0,0,0,'Unklath II a',1040,9,0,0,0,0,36,NULL,1),(642,0,0,0,'Arakmehn IV',1220,9,0,0,0,0,41,NULL,2),(643,0,0,0,'Rathal I b',680,9,0,0,0,0,25,NULL,1),(644,0,0,0,'Rathal I c',680,9,0,0,0,0,27,NULL,1),(645,0,0,0,'Rathal I e',780,9,0,0,0,0,27,NULL,2),(646,0,0,0,'Rathal I d',780,9,0,0,0,0,27,NULL,2),(647,0,0,0,'Rathal I a',1140,9,0,0,0,0,36,NULL,2),(648,0,0,0,'Rathal II b',680,9,0,0,0,0,25,NULL,1),(649,0,0,0,'Rathal II c',680,9,0,0,0,0,27,NULL,1),(650,0,0,0,'Rathal II d',1460,9,0,0,0,0,52,NULL,2),(651,0,0,0,'Rathal II a',1040,9,0,0,0,0,38,NULL,1),(653,0,0,0,'Esuph II a',280,9,0,0,0,0,14,NULL,1),(654,0,0,0,'Uthemath II',4460,9,0,0,0,0,138,NULL,8),(655,0,0,0,'Uthemath I e',940,9,0,0,0,0,32,NULL,2),(656,0,0,0,'Uthemath I d',840,9,0,0,0,0,30,NULL,1),(657,0,0,0,'Uthemath I f',2440,9,0,0,0,0,86,NULL,3),(658,0,0,0,'Uthemath I b',800,9,0,0,0,0,32,NULL,1),(659,0,0,0,'Uthemath I c',900,9,0,0,0,0,34,NULL,2),(660,0,0,0,'Uthemath I a',400,9,0,0,0,0,18,NULL,1),(661,0,0,0,'Botham I c',1700,9,0,0,0,0,49,NULL,2),(662,0,0,0,'Botham I e',1650,9,0,0,0,0,44,NULL,2),(663,0,0,0,'Botham I d',3050,9,0,0,0,0,80,NULL,3),(664,0,0,0,'Botham I b',3000,9,0,0,0,0,83,NULL,3),(666,0,0,0,'Horakhal',9420,9,0,0,0,0,277,NULL,14),(667,0,0,0,'Esuph III b',1340,9,0,0,0,0,49,NULL,2),(668,0,0,0,'Esuph III a',280,9,0,0,0,0,14,NULL,1),(669,0,0,0,'Esuph IV b',400,9,0,0,0,0,16,NULL,1),(670,0,0,0,'Esuph IV c',400,9,0,0,0,0,18,NULL,1),(671,0,0,0,'Esuph IV d',800,9,0,0,0,0,34,NULL,1),(672,0,0,0,'Esuph IV a',400,9,0,0,0,0,16,NULL,1),(673,0,0,0,'Botham II e',1650,9,0,0,0,0,42,NULL,2),(674,0,0,0,'Botham II g',1400,9,0,0,0,0,38,NULL,2),(675,0,0,0,'Botham II f',1650,9,0,0,0,0,44,NULL,2),(676,0,0,0,'Botham II d',1950,9,0,0,0,0,49,NULL,2),(677,0,0,0,'Botham II c',1250,9,0,0,0,0,38,NULL,2),(678,0,0,0,'Botham II b',1600,9,0,0,0,0,47,NULL,2),(679,0,0,0,'Botham II a',850,9,0,0,0,0,25,NULL,1),(680,0,0,0,'Botham III g',1650,9,0,0,0,0,42,NULL,2),(681,0,0,0,'Botham III f',2350,9,0,0,0,0,56,NULL,3),(682,0,0,0,'Botham III h',3750,9,0,0,0,0,98,NULL,3),(683,0,0,0,'Botham III d',850,9,0,0,0,0,27,NULL,1),(684,0,0,0,'Botham III e',850,9,0,0,0,0,27,NULL,1),(685,0,0,0,'Botham III b',950,9,0,0,0,0,25,NULL,2),(686,0,0,0,'Botham III c',850,9,0,0,0,0,27,NULL,1),(687,0,0,0,'Botham III a',1400,9,0,0,0,0,36,NULL,2),(688,0,0,0,'Botham IV i',1800,9,0,0,0,0,51,NULL,3),(689,0,0,0,'Botham IV h',1850,9,0,0,0,0,49,NULL,1),(690,0,0,0,'Botham IV f',1700,9,0,0,0,0,49,NULL,2),(691,0,0,0,'Botham IV g',1650,9,0,0,0,0,49,NULL,2),(692,0,0,0,'Botham IV c',850,9,0,0,0,0,27,NULL,1),(693,0,0,0,'Botham IV e',850,9,0,0,0,0,27,NULL,1),(694,0,0,0,'Botham IV d',850,9,0,0,0,0,27,NULL,1),(695,0,0,0,'Botham IV b',850,9,0,0,0,0,25,NULL,1),(696,0,0,0,'Botham IV a',1400,9,0,0,0,0,36,NULL,2),(697,0,0,0,'Ramen Tah',7650,9,0,0,0,0,184,NULL,16),(698,0,0,0,'Banana Bay 1',450,8,0,0,0,0,25,NULL,1),(699,0,0,0,'Banana Bay 2',765,8,0,0,0,0,36,NULL,1),(700,0,0,0,'Banana Bay 3',450,8,0,0,0,0,25,NULL,1),(701,0,0,0,'Banana Bay 4',450,8,0,0,0,0,25,NULL,1),(702,0,0,0,'Shark Manor',8780,8,0,0,0,0,286,NULL,15),(703,0,0,0,'Coconut Quay 1',1765,8,0,0,0,0,64,NULL,2),(704,0,0,0,'Coconut Quay 2',1045,8,0,0,0,0,42,NULL,2),(705,0,0,0,'Coconut Quay 3',2145,8,0,0,0,0,70,NULL,4),(706,0,0,0,'Coconut Quay 4',2135,8,0,0,0,0,72,NULL,3),(707,0,0,0,'Crocodile Bridge 3',1270,8,0,0,0,0,49,NULL,2),(708,0,0,0,'Crocodile Bridge 2',865,8,0,0,0,0,36,NULL,2),(709,0,0,0,'Crocodile Bridge 1',1045,8,0,0,0,0,42,NULL,2),(710,0,0,0,'Bamboo Garden 1',1640,8,0,0,0,0,63,NULL,3),(711,0,0,0,'Crocodile Bridge 4',4755,8,0,0,0,0,176,NULL,4),(712,0,0,0,'Crocodile Bridge 5',3970,8,0,0,0,0,157,NULL,2),(713,0,0,0,'Woodway 1',765,8,0,0,0,0,36,NULL,1),(714,0,0,0,'Woodway 2',585,8,0,0,0,0,30,NULL,1),(715,0,0,0,'Woodway 3',1540,8,0,0,0,0,65,NULL,2),(716,0,0,0,'Woodway 4',405,8,0,0,0,0,24,NULL,1),(717,0,0,0,'Flamingo Flats 5',1845,8,0,0,0,0,84,NULL,1),(718,0,0,0,'Bamboo Fortress',21970,8,0,0,0,0,848,NULL,20),(719,0,0,0,'Bamboo Garden 3',1540,8,0,0,0,0,63,NULL,2),(720,0,0,0,'Bamboo Garden 2',1045,8,0,0,0,0,42,NULL,2),(721,0,0,0,'Flamingo Flats 4',865,8,0,0,0,0,36,NULL,2),(722,0,0,0,'Flamingo Flats 2',1045,8,0,0,0,0,42,NULL,2),(723,0,0,0,'Flamingo Flats 3',685,8,0,0,0,0,30,NULL,2),(724,0,0,0,'Flamingo Flats 1',685,8,0,0,0,0,30,NULL,2),(725,0,0,0,'Jungle Edge 4',865,8,0,0,0,0,36,NULL,2),(726,0,0,0,'Jungle Edge 5',865,8,0,0,0,0,36,NULL,2),(727,0,0,0,'Jungle Edge 6',450,8,0,0,0,0,25,NULL,1),(728,0,0,0,'Jungle Edge 2',3170,8,0,0,0,0,128,NULL,3),(729,0,0,0,'Jungle Edge 3',865,8,0,0,0,0,36,NULL,2),(730,0,0,0,'Jungle Edge 1',2495,8,0,0,0,0,98,NULL,3),(731,0,0,0,'Haggler\'s Hangout 6',6450,8,0,0,0,0,208,NULL,4),(732,0,0,0,'Haggler\'s Hangout 5 (Shop)',1550,8,0,0,0,0,56,NULL,1),(733,0,0,0,'Haggler\'s Hangout 4a (Shop)',1850,8,0,0,0,0,56,NULL,1),(734,0,0,0,'Haggler\'s Hangout 4b (Shop)',1550,8,0,0,0,0,56,NULL,1),(735,0,0,0,'Haggler\'s Hangout 3',7550,8,0,0,0,0,256,NULL,4),(736,0,0,0,'Haggler\'s Hangout 2',1300,8,0,0,0,0,49,NULL,1),(737,0,0,0,'Haggler\'s Hangout 1',1400,8,0,0,0,0,49,NULL,2),(738,0,0,0,'River Homes 1',3485,8,0,0,0,0,128,NULL,3),(739,0,0,0,'River Homes 2a',1270,8,0,0,0,0,42,NULL,2),(740,0,0,0,'River Homes 2b',1595,8,0,0,0,0,56,NULL,3),(741,0,0,0,'River Homes 3',5055,8,0,0,0,0,176,NULL,7),(742,0,0,0,'The Treehouse',24120,8,0,0,0,0,894,NULL,23),(743,0,0,0,'Corner Shop (Shop)',2215,12,0,0,0,0,96,NULL,2),(744,0,0,0,'Tusk Flats 1',765,12,0,0,0,0,40,NULL,2),(745,0,0,0,'Tusk Flats 2',835,12,0,0,0,0,42,NULL,2),(746,0,0,0,'Tusk Flats 3',660,12,0,0,0,0,34,NULL,2),(747,0,0,0,'Tusk Flats 4',315,12,0,0,0,0,24,NULL,1),(748,0,0,0,'Tusk Flats 6',660,12,0,0,0,0,35,NULL,2),(749,0,0,0,'Tusk Flats 5',455,12,0,0,0,0,30,NULL,1),(750,0,0,0,'Shady Rocks 5',2890,12,0,0,0,0,110,NULL,2),(751,0,0,0,'Shady Rocks 4 (Shop)',2710,12,0,0,0,0,110,NULL,2),(752,0,0,0,'Shady Rocks 3',4115,12,0,0,0,0,154,NULL,3),(753,0,0,0,'Shady Rocks 2',2010,12,0,0,0,0,77,NULL,4),(754,0,0,0,'Shady Rocks 1',3630,12,0,0,0,0,132,NULL,4),(755,0,0,0,'Crystal Glance',19625,12,0,0,0,0,569,NULL,24),(756,0,0,0,'Arena Walk 3',3550,12,0,0,0,0,126,NULL,3),(757,0,0,0,'Arena Walk 2',1400,12,0,0,0,0,54,NULL,2),(758,0,0,0,'Arena Walk 1',3250,12,0,0,0,0,128,NULL,3),(759,0,0,0,'Bears Paw 2',2305,12,0,0,0,0,100,NULL,2),(760,0,0,0,'Bears Paw 1',1810,12,0,0,0,0,72,NULL,2),(761,0,0,0,'Spirit Homes 5',1450,12,0,0,0,0,56,NULL,2),(762,0,0,0,'Glacier Side 3',1950,12,0,0,0,0,75,NULL,2),(763,0,0,0,'Glacier Side 2',4750,12,0,0,0,0,154,NULL,3),(764,0,0,0,'Glacier Side 1',1600,12,0,0,0,0,65,NULL,2),(765,0,0,0,'Spirit Homes 1',1700,12,0,0,0,0,56,NULL,2),(766,0,0,0,'Spirit Homes 2',1900,12,0,0,0,0,72,NULL,2),(767,0,0,0,'Spirit Homes 3',4250,12,0,0,0,0,128,NULL,3),(768,0,0,0,'Spirit Homes 4',1100,12,0,0,0,0,49,NULL,1),(770,0,0,0,'Glacier Side 4',2050,12,0,0,0,0,75,NULL,1),(771,0,0,0,'Shelf Site',4800,12,0,0,0,0,160,NULL,3),(772,0,0,0,'Raven Corner 1',855,12,0,0,0,0,45,NULL,1),(773,0,0,0,'Raven Corner 2',1685,12,0,0,0,0,60,NULL,3),(774,0,0,0,'Raven Corner 3',855,12,0,0,0,0,45,NULL,1),(775,0,0,0,'Bears Paw 3',2090,12,0,0,0,0,82,NULL,3),(776,0,0,0,'Bears Paw 4',5205,12,0,0,0,0,189,NULL,4),(778,0,0,0,'Bears Paw 5',2045,12,0,0,0,0,81,NULL,3),(779,0,0,0,'Trout Plaza 5 (Shop)',3880,12,0,0,0,0,144,NULL,2),(780,0,0,0,'Pilchard Bin 1',685,12,0,0,0,0,30,NULL,2),(781,0,0,0,'Pilchard Bin 2',685,12,0,0,0,0,24,NULL,2),(782,0,0,0,'Pilchard Bin 3',585,12,0,0,0,0,24,NULL,1),(783,0,0,0,'Pilchard Bin 4',585,12,0,0,0,0,24,NULL,1),(784,0,0,0,'Pilchard Bin 5',685,12,0,0,0,0,24,NULL,2),(785,0,0,0,'Pilchard Bin 10',450,12,0,0,0,0,20,NULL,1),(786,0,0,0,'Pilchard Bin 9',450,12,0,0,0,0,20,NULL,1),(787,0,0,0,'Pilchard Bin 8',450,12,0,0,0,0,20,NULL,2),(789,0,0,0,'Pilchard Bin 7',450,12,0,0,0,0,20,NULL,1),(790,0,0,0,'Pilchard Bin 6',450,12,0,0,0,0,25,NULL,1),(791,0,0,0,'Trout Plaza 1',2395,12,0,0,0,0,112,NULL,2),(792,0,0,0,'Trout Plaza 2',1540,12,0,0,0,0,64,NULL,2),(793,0,0,0,'Trout Plaza 3',900,12,0,0,0,0,36,NULL,1),(794,0,0,0,'Trout Plaza 4',900,12,0,0,0,0,45,NULL,1),(795,0,0,0,'Skiffs End 1',1540,12,0,0,0,0,70,NULL,2),(796,0,0,0,'Skiffs End 2',910,12,0,0,0,0,42,NULL,2),(797,0,0,0,'Furrier Quarter 3',1010,12,0,0,0,0,54,NULL,2),(798,0,0,0,'Mammoth Belly',22810,12,0,0,0,0,634,NULL,30),(799,0,0,0,'Furrier Quarter 2',1045,12,0,0,0,0,56,NULL,2),(800,0,0,0,'Furrier Quarter 1',1635,12,0,0,0,0,84,NULL,3),(801,0,0,0,'Fimbul Shelf 3',1255,12,0,0,0,0,66,NULL,2),(802,0,0,0,'Fimbul Shelf 4',1045,12,0,0,0,0,56,NULL,2),(803,0,0,0,'Fimbul Shelf 2',1045,12,0,0,0,0,56,NULL,2),(804,0,0,0,'Fimbul Shelf 1',975,12,0,0,0,0,48,NULL,2),(805,0,0,0,'Frost Manor',26370,12,0,0,0,0,806,NULL,24),(831,0,0,0,'Marble Guildhall',16810,3,0,0,0,0,530,NULL,17),(832,0,0,0,'Iron Guildhall',15560,3,0,0,0,0,464,NULL,17),(833,0,0,0,'The Market 1 (Shop)',650,3,0,0,0,0,25,NULL,1),(834,0,0,0,'The Market 3 (Shop)',1450,3,0,0,0,0,40,NULL,1),(835,0,0,0,'The Market 2 (Shop)',1100,3,0,0,0,0,40,NULL,1),(836,0,0,0,'The Market 4 (Shop)',1800,3,0,0,0,0,48,NULL,1),(837,0,0,0,'Granite Guildhall',17845,3,0,0,0,0,530,NULL,17),(838,0,0,0,'Upper Barracks 1',210,3,0,0,0,0,14,NULL,1),(850,0,0,0,'Upper Barracks 13',580,3,0,0,0,0,24,NULL,2),(851,0,0,0,'Nobility Quarter 4',765,3,0,0,0,0,25,NULL,1),(852,0,0,0,'Nobility Quarter 5',765,3,0,0,0,0,25,NULL,1),(853,0,0,0,'Nobility Quarter 7',765,3,0,0,0,0,25,NULL,1),(854,0,0,0,'Nobility Quarter 6',765,3,0,0,0,0,26,NULL,1),(855,0,0,0,'Nobility Quarter 8',765,3,0,0,0,0,26,NULL,1),(856,0,0,0,'Nobility Quarter 9',765,3,0,0,0,0,26,NULL,1),(857,0,0,0,'Nobility Quarter 2',1865,3,0,0,0,0,50,NULL,3),(858,0,0,0,'Nobility Quarter 3',1865,3,0,0,0,0,50,NULL,3),(859,0,0,0,'Nobility Quarter 1',1865,3,0,0,0,0,50,NULL,3),(863,0,0,0,'The Farms 6, Fishing Hut',1255,3,0,0,0,0,32,NULL,2),(864,0,0,0,'The Farms 5',1530,3,0,0,0,0,36,NULL,2),(866,0,0,0,'The Farms 3',1530,3,0,0,0,0,36,NULL,2),(867,0,0,0,'The Farms 2',1530,3,0,0,0,0,36,NULL,2),(868,0,0,0,'The Farms 1',2510,3,0,0,0,0,60,NULL,3),(886,0,0,0,'Outlaw Castle',8000,3,0,0,0,0,307,NULL,9),(889,0,0,0,'Tunnel Gardens 3',2000,3,0,0,0,0,43,NULL,3),(890,0,0,0,'Tunnel Gardens 4',2000,3,0,0,0,0,42,NULL,3),(892,0,0,0,'Tunnel Gardens 5',1360,3,0,0,0,0,35,NULL,2),(893,0,0,0,'Tunnel Gardens 6',1360,3,0,0,0,0,38,NULL,2),(894,0,0,0,'Tunnel Gardens 8',1360,3,0,0,0,0,35,NULL,2),(895,0,0,0,'Tunnel Gardens 7',1360,3,0,0,0,0,35,NULL,2),(900,0,0,0,'Wolftower',21550,3,0,0,0,0,638,NULL,23),(901,0,0,0,'Paupers Palace, Flat 11',315,1,0,0,0,0,12,NULL,1),(905,0,0,0,'Botham I a',950,9,0,0,0,0,36,NULL,1),(906,0,0,0,'Esuph I',680,9,0,0,0,0,39,NULL,1),(907,0,0,0,'Esuph II b',1380,9,0,0,0,0,51,NULL,2),(1883,0,0,0,'Aureate Court 1',5240,13,0,0,0,0,276,NULL,3),(1884,0,0,0,'Aureate Court 2',4860,13,0,0,0,0,201,NULL,2),(1885,0,0,0,'Aureate Court 3',4300,13,0,0,0,0,228,NULL,2),(1886,0,0,0,'Aureate Court 4',3980,13,0,0,0,0,210,NULL,4),(1887,0,0,0,'Fortune Wing 1',10180,13,0,0,0,0,422,NULL,4),(1888,0,0,0,'Fortune Wing 2',5580,13,0,0,0,0,260,NULL,2),(1889,0,0,0,'Fortune Wing 3',5740,13,0,0,0,0,258,NULL,2),(1890,0,0,0,'Fortune Wing 4',5740,13,0,0,0,0,306,NULL,4),(1891,0,0,0,'Luminous Arc 1',6460,13,0,0,0,0,344,NULL,2),(1892,0,0,0,'Luminous Arc 2',6460,13,0,0,0,0,301,NULL,4),(1893,0,0,0,'Luminous Arc 3',5400,13,0,0,0,0,249,NULL,3),(1894,0,0,0,'Luminous Arc 4',8000,13,0,0,0,0,343,NULL,5),(1895,0,0,0,'Radiant Plaza 1',5620,13,0,0,0,0,276,NULL,4),(1896,0,0,0,'Radiant Plaza 2',3820,13,0,0,0,0,179,NULL,2),(1897,0,0,0,'Radiant Plaza 3',4900,13,0,0,0,0,257,NULL,2),(1898,0,0,0,'Radiant Plaza 4',7460,13,0,0,0,0,367,NULL,3),(1899,0,0,0,'Sun Palace',23120,13,0,0,0,0,976,NULL,27),(1900,0,0,0,'Halls of Serenity',23360,13,0,0,0,0,1093,NULL,33),(1901,0,0,0,'Cascade Towers',19500,13,0,0,0,0,811,NULL,33),(1902,0,0,0,'Sorcerer\'s Avenue 5',2695,2,0,0,0,0,96,NULL,1),(1903,0,0,0,'Sorcerer\'s Avenue 1a',1255,2,0,0,0,0,42,NULL,2),(1904,0,0,0,'Sorcerer\'s Avenue 1b',1035,2,0,0,0,0,36,NULL,2),(1905,0,0,0,'Sorcerer\'s Avenue 1c',1255,2,0,0,0,0,36,NULL,2),(1906,0,0,0,'Beach Home Apartments, Flat 06',1145,2,0,0,0,0,40,NULL,2),(1907,0,0,0,'Beach Home Apartments, Flat 01',715,2,0,0,0,0,30,NULL,1),(1908,0,0,0,'Beach Home Apartments, Flat 02',715,2,0,0,0,0,25,NULL,1),(1909,0,0,0,'Beach Home Apartments, Flat 03',715,2,0,0,0,0,30,NULL,1),(1910,0,0,0,'Beach Home Apartments, Flat 04',715,2,0,0,0,0,24,NULL,1),(1911,0,0,0,'Beach Home Apartments, Flat 05',715,2,0,0,0,0,24,NULL,1),(1912,0,0,0,'Beach Home Apartments, Flat 16',1145,2,0,0,0,0,40,NULL,2),(1913,0,0,0,'Beach Home Apartments, Flat 11',715,2,0,0,0,0,30,NULL,1),(1914,0,0,0,'Beach Home Apartments, Flat 12',880,2,0,0,0,0,30,NULL,1),(1915,0,0,0,'Beach Home Apartments, Flat 13',880,2,0,0,0,0,29,NULL,1),(1916,0,0,0,'Beach Home Apartments, Flat 14',385,2,0,0,0,0,15,NULL,1),(1917,0,0,0,'Beach Home Apartments, Flat 15',385,2,0,0,0,0,15,NULL,1),(1918,0,0,0,'Thais Clanhall',8420,2,0,0,0,0,370,NULL,10),(1919,0,0,0,'Harbour Street 4',935,2,0,0,0,0,30,NULL,1),(1920,0,0,0,'Thais Hostel',6980,2,0,0,0,0,171,NULL,24),(1921,0,0,0,'Lower Swamp Lane 1',4740,2,0,0,0,0,166,NULL,4),(1923,0,0,0,'Lower Swamp Lane 3',4740,2,0,0,0,0,161,NULL,4),(1924,0,0,0,'Sunset Homes, Flat 01',520,2,0,0,0,0,25,NULL,1),(1925,0,0,0,'Sunset Homes, Flat 02',520,2,0,0,0,0,30,NULL,1),(1926,0,0,0,'Sunset Homes, Flat 03',520,2,0,0,0,0,30,NULL,1),(1927,0,0,0,'Sunset Homes, Flat 14',520,2,0,0,0,0,30,NULL,1),(1929,0,0,0,'Sunset Homes, Flat 13',860,2,0,0,0,0,35,NULL,2),(1930,0,0,0,'Sunset Homes, Flat 12',520,2,0,0,0,0,25,NULL,1),(1932,0,0,0,'Sunset Homes, Flat 11',520,2,0,0,0,0,25,NULL,1),(1935,0,0,0,'Sunset Homes, Flat 24',520,2,0,0,0,0,30,NULL,1),(1936,0,0,0,'Sunset Homes, Flat 23',860,2,0,0,0,0,35,NULL,2),(1937,0,0,0,'Sunset Homes, Flat 22',520,2,0,0,0,0,25,NULL,1),(1938,0,0,0,'Sunset Homes, Flat 21',520,2,0,0,0,0,25,NULL,1),(1939,0,0,0,'Harbour Place 1 (Shop)',1100,2,0,0,0,0,37,NULL,1),(1940,0,0,0,'Harbour Place 2 (Shop)',1300,2,0,0,0,0,48,NULL,1),(1941,0,0,0,'Warriors Guildhall',14725,2,0,0,0,0,522,NULL,11),(1942,0,0,0,'Farm Lane, 1st floor (Shop)',945,2,0,0,0,0,42,NULL,0),(1943,0,0,0,'Farm Lane, Basement (Shop)',945,2,0,0,0,0,36,NULL,0),(1944,0,0,0,'Main Street 9, 1st floor (Shop)',1440,2,0,0,0,0,47,NULL,0),(1945,0,0,0,'Main Street 9a, 2nd floor (Shop)',765,2,0,0,0,0,30,NULL,0),(1946,0,0,0,'Main Street 9b, 2nd floor (Shop)',1260,2,0,0,0,0,48,NULL,0),(1947,0,0,0,'Farm Lane, 2nd Floor (Shop)',945,2,0,0,0,0,42,NULL,0),(1948,0,0,0,'The City Wall 5a',585,2,0,0,0,0,24,NULL,1),(1949,0,0,0,'The City Wall 5c',585,2,0,0,0,0,24,NULL,1),(1950,0,0,0,'The City Wall 5e',585,2,0,0,0,0,30,NULL,1),(1951,0,0,0,'The City Wall 5b',585,2,0,0,0,0,24,NULL,1),(1952,0,0,0,'The City Wall 5d',585,2,0,0,0,0,24,NULL,1),(1953,0,0,0,'The City Wall 5f',585,2,0,0,0,0,30,NULL,1),(1954,0,0,0,'The City Wall 3a',1045,2,0,0,0,0,42,NULL,2),(1955,0,0,0,'The City Wall 3b',1045,2,0,0,0,0,35,NULL,2),(1956,0,0,0,'The City Wall 3c',1045,2,0,0,0,0,35,NULL,2),(1957,0,0,0,'The City Wall 3d',1045,2,0,0,0,0,41,NULL,2),(1958,0,0,0,'The City Wall 3e',1045,2,0,0,0,0,30,NULL,2),(1959,0,0,0,'The City Wall 3f',1045,2,0,0,0,0,31,NULL,2),(1960,0,0,0,'The City Wall 1a',1270,2,0,0,0,0,49,NULL,2),(1961,0,0,0,'Mill Avenue 3',1400,2,0,0,0,0,49,NULL,2),(1962,0,0,0,'The City Wall 1b',1270,2,0,0,0,0,49,NULL,2),(1963,0,0,0,'Mill Avenue 4',1400,2,0,0,0,0,49,NULL,2),(1964,0,0,0,'Mill Avenue 5',3250,2,0,0,0,0,128,NULL,4),(1965,0,0,0,'Mill Avenue 1 (Shop)',1300,2,0,0,0,0,54,NULL,1),(1966,0,0,0,'Mill Avenue 2 (Shop)',2350,2,0,0,0,0,80,NULL,2),(1967,0,0,0,'The City Wall 7c',865,2,0,0,0,0,36,NULL,2),(1968,0,0,0,'The City Wall 7a',585,2,0,0,0,0,30,NULL,1),(1969,0,0,0,'The City Wall 7e',865,2,0,0,0,0,36,NULL,2),(1970,0,0,0,'The City Wall 7g',585,2,0,0,0,0,30,NULL,1),(1971,0,0,0,'The City Wall 7d',865,2,0,0,0,0,36,NULL,2),(1972,0,0,0,'The City Wall 7b',585,2,0,0,0,0,30,NULL,1),(1973,0,0,0,'The City Wall 7f',865,2,0,0,0,0,35,NULL,2),(1974,0,0,0,'The City Wall 7h',585,2,0,0,0,0,30,NULL,1),(1975,0,0,0,'The City Wall 9',955,2,0,0,0,0,50,NULL,2),(1976,0,0,0,'Upper Swamp Lane 12',3800,2,0,0,0,0,116,NULL,3),(1977,0,0,0,'Upper Swamp Lane 10',2060,2,0,0,0,0,70,NULL,3),(1978,0,0,0,'Upper Swamp Lane 8',8120,2,0,0,0,0,216,NULL,3),(1979,0,0,0,'Southern Thais Guildhall',22440,2,0,0,0,0,596,NULL,16),(1980,0,0,0,'Alai Flats, Flat 04',765,2,0,0,0,0,30,NULL,1),(1981,0,0,0,'Alai Flats, Flat 05',1225,2,0,0,0,0,38,NULL,2),(1982,0,0,0,'Alai Flats, Flat 06',1225,2,0,0,0,0,48,NULL,2),(1983,0,0,0,'Alai Flats, Flat 07',765,2,0,0,0,0,30,NULL,1),(1984,0,0,0,'Alai Flats, Flat 08',765,2,0,0,0,0,30,NULL,1),(1985,0,0,0,'Alai Flats, Flat 03',765,2,0,0,0,0,36,NULL,1),(1986,0,0,0,'Alai Flats, Flat 01',765,2,0,0,0,0,26,NULL,1),(1987,0,0,0,'Alai Flats, Flat 02',765,2,0,0,0,0,34,NULL,1),(1988,0,0,0,'Alai Flats, Flat 14',900,2,0,0,0,0,33,NULL,1),(1989,0,0,0,'Alai Flats, Flat 15',1450,2,0,0,0,0,48,NULL,2),(1990,0,0,0,'Alai Flats, Flat 16',1450,2,0,0,0,0,54,NULL,2),(1991,0,0,0,'Alai Flats, Flat 17',900,2,0,0,0,0,38,NULL,1),(1992,0,0,0,'Alai Flats, Flat 18',900,2,0,0,0,0,38,NULL,1),(1993,0,0,0,'Alai Flats, Flat 13',765,2,0,0,0,0,36,NULL,1),(1994,0,0,0,'Alai Flats, Flat 12',765,2,0,0,0,0,25,NULL,1),(1995,0,0,0,'Alai Flats, Flat 11',765,2,0,0,0,0,35,NULL,1),(1996,0,0,0,'Alai Flats, Flat 24',900,2,0,0,0,0,36,NULL,1),(1997,0,0,0,'Alai Flats, Flat 25',1450,2,0,0,0,0,52,NULL,2),(1998,0,0,0,'Alai Flats, Flat 26',1450,2,0,0,0,0,60,NULL,2),(1999,0,0,0,'Alai Flats, Flat 27',900,2,0,0,0,0,38,NULL,1),(2000,0,0,0,'Alai Flats, Flat 28',900,2,0,0,0,0,38,NULL,1),(2001,0,0,0,'Alai Flats, Flat 23',765,2,0,0,0,0,35,NULL,1),(2002,0,0,0,'Alai Flats, Flat 22',765,2,0,0,0,0,25,NULL,1),(2003,0,0,0,'Alai Flats, Flat 21',765,2,0,0,0,0,36,NULL,1),(2004,0,0,0,'Upper Swamp Lane 4',4740,2,0,0,0,0,165,NULL,4),(2005,0,0,0,'Upper Swamp Lane 2',4740,2,0,0,0,0,159,NULL,4),(2006,0,0,0,'Sorcerer\'s Avenue Labs 2c',715,2,0,0,0,0,20,NULL,1),(2007,0,0,0,'Sorcerer\'s Avenue Labs 2d',715,2,0,0,0,0,20,NULL,1),(2008,0,0,0,'Sorcerer\'s Avenue Labs 2e',715,2,0,0,0,0,20,NULL,1),(2009,0,0,0,'Sorcerer\'s Avenue Labs 2f',715,2,0,0,0,0,20,NULL,1),(2010,0,0,0,'Sorcerer\'s Avenue Labs 2b',715,2,0,0,0,0,24,NULL,1),(2011,0,0,0,'Sorcerer\'s Avenue Labs 2a',715,2,0,0,0,0,24,NULL,1),(2012,0,0,0,'Ivory Circle 1',4280,7,0,0,0,0,160,NULL,2),(2013,0,0,0,'Admiral\'s Avenue 3',4115,7,0,0,0,0,142,NULL,2),(2014,0,0,0,'Admiral\'s Avenue 2',5470,7,0,0,0,0,176,NULL,4),(2015,0,0,0,'Admiral\'s Avenue 1',5105,7,0,0,0,0,168,NULL,2),(2016,0,0,0,'Sugar Street 5',1350,7,0,0,0,0,48,NULL,2),(2017,0,0,0,'Freedom Street 1',2450,7,0,0,0,0,84,NULL,2),(2018,0,0,0,'Freedom Street 2',6050,7,0,0,0,0,208,NULL,4),(2019,0,0,0,'Trader\'s Point 2 (Shop)',5350,7,0,0,0,0,198,NULL,2),(2020,0,0,0,'Trader\'s Point 3 (Shop)',5950,7,0,0,0,0,195,NULL,2),(2021,0,0,0,'Ivory Circle 2',7030,7,0,0,0,0,214,NULL,2),(2022,0,0,0,'The Tavern 1a',2750,7,0,0,0,0,72,NULL,4),(2023,0,0,0,'The Tavern 1b',1900,7,0,0,0,0,54,NULL,2),(2024,0,0,0,'The Tavern 1c',4150,7,0,0,0,0,132,NULL,3),(2025,0,0,0,'The Tavern 1d',1550,7,0,0,0,0,48,NULL,2),(2026,0,0,0,'The Tavern 2d',1350,7,0,0,0,0,40,NULL,2),(2027,0,0,0,'The Tavern 2c',950,7,0,0,0,0,32,NULL,1),(2028,0,0,0,'The Tavern 2b',1700,7,0,0,0,0,62,NULL,2),(2029,0,0,0,'The Tavern 2a',5550,7,0,0,0,0,163,NULL,5),(2030,0,0,0,'Straycat\'s Corner 4',210,7,0,0,0,0,20,NULL,1),(2031,0,0,0,'Straycat\'s Corner 3',210,7,0,0,0,0,20,NULL,1),(2032,0,0,0,'Straycat\'s Corner 2',660,7,0,0,0,0,49,NULL,1),(2033,0,0,0,'Litter Promenade 5',580,7,0,0,0,0,35,NULL,2),(2034,0,0,0,'Litter Promenade 4',390,7,0,0,0,0,30,NULL,1),(2035,0,0,0,'Litter Promenade 3',450,7,0,0,0,0,36,NULL,1),(2036,0,0,0,'Litter Promenade 2',300,7,0,0,0,0,25,NULL,1),(2037,0,0,0,'Litter Promenade 1',400,7,0,0,0,0,25,NULL,2),(2038,0,0,0,'The Shelter',13590,7,0,0,0,0,560,NULL,31),(2039,0,0,0,'Straycat\'s Corner 6',300,7,0,0,0,0,25,NULL,1),(2040,0,0,0,'Straycat\'s Corner 5',760,7,0,0,0,0,48,NULL,2),(2042,0,0,0,'Rum Alley 3',330,7,0,0,0,0,28,NULL,1),(2043,0,0,0,'Straycat\'s Corner 1',300,7,0,0,0,0,25,NULL,1),(2044,0,0,0,'Rum Alley 2',300,7,0,0,0,0,25,NULL,1),(2045,0,0,0,'Rum Alley 1',510,7,0,0,0,0,36,NULL,1),(2046,0,0,0,'Smuggler Backyard 3',700,7,0,0,0,0,40,NULL,2),(2048,0,0,0,'Shady Trail 3',300,7,0,0,0,0,25,NULL,1),(2049,0,0,0,'Shady Trail 1',1150,7,0,0,0,0,48,NULL,5),(2050,0,0,0,'Shady Trail 2',490,7,0,0,0,0,30,NULL,2),(2051,0,0,0,'Smuggler Backyard 5',610,7,0,0,0,0,35,NULL,2),(2052,0,0,0,'Smuggler Backyard 4',390,7,0,0,0,0,30,NULL,1),(2053,0,0,0,'Smuggler Backyard 2',670,7,0,0,0,0,40,NULL,2),(2054,0,0,0,'Smuggler Backyard 1',670,7,0,0,0,0,40,NULL,2),(2055,0,0,0,'Sugar Street 2',2550,7,0,0,0,0,84,NULL,3),(2056,0,0,0,'Sugar Street 1',3000,7,0,0,0,0,84,NULL,3),(2057,0,0,0,'Sugar Street 3a',1650,7,0,0,0,0,54,NULL,3),(2058,0,0,0,'Sugar Street 3b',2050,7,0,0,0,0,60,NULL,3),(2059,0,0,0,'Harvester\'s Haven, Flat 01',950,7,0,0,0,0,36,NULL,2),(2060,0,0,0,'Harvester\'s Haven, Flat 03',950,7,0,0,0,0,30,NULL,2),(2061,0,0,0,'Harvester\'s Haven, Flat 05',950,7,0,0,0,0,30,NULL,2),(2062,0,0,0,'Harvester\'s Haven, Flat 02',950,7,0,0,0,0,36,NULL,2),(2063,0,0,0,'Harvester\'s Haven, Flat 04',950,7,0,0,0,0,30,NULL,2),(2064,0,0,0,'Harvester\'s Haven, Flat 06',950,7,0,0,0,0,30,NULL,2),(2065,0,0,0,'Harvester\'s Haven, Flat 07',950,7,0,0,0,0,30,NULL,2),(2066,0,0,0,'Harvester\'s Haven, Flat 09',950,7,0,0,0,0,30,NULL,2),(2067,0,0,0,'Harvester\'s Haven, Flat 11',950,7,0,0,0,0,36,NULL,2),(2068,0,0,0,'Harvester\'s Haven, Flat 12',950,7,0,0,0,0,36,NULL,2),(2069,0,0,0,'Harvester\'s Haven, Flat 10',950,7,0,0,0,0,30,NULL,2),(2070,0,0,0,'Harvester\'s Haven, Flat 08',950,7,0,0,0,0,30,NULL,2),(2071,0,0,0,'Marble Lane 4',6350,7,0,0,0,0,192,NULL,4),(2072,0,0,0,'Marble Lane 2',6415,7,0,0,0,0,200,NULL,3),(2073,0,0,0,'Marble Lane 3',8055,7,0,0,0,0,240,NULL,4),(2074,0,0,0,'Marble Lane 1',11060,7,0,0,0,0,320,NULL,6),(2075,0,0,0,'Ivy Cottage',30650,7,0,0,0,0,858,NULL,26),(2076,0,0,0,'Sugar Street 4d',750,7,0,0,0,0,24,NULL,2),(2077,0,0,0,'Sugar Street 4c',650,7,0,0,0,0,24,NULL,1),(2078,0,0,0,'Sugar Street 4b',950,7,0,0,0,0,36,NULL,2),(2079,0,0,0,'Sugar Street 4a',950,7,0,0,0,0,30,NULL,2),(2080,0,0,0,'Trader\'s Point 1',2200,7,0,0,0,0,77,NULL,2),(2081,0,0,0,'Mountain Hideout',15550,7,0,0,0,0,486,NULL,17),(2082,0,0,0,'Dark Mansion',17845,2,0,0,0,0,575,NULL,17),(2083,0,0,0,'Halls of the Adventurers',15380,2,0,0,0,0,518,NULL,18),(2084,0,0,0,'Castle of Greenshore',18860,2,0,0,0,0,600,NULL,12),(2085,0,0,0,'Greenshore Clanhall',10800,2,0,0,0,0,312,NULL,10),(2086,0,0,0,'Greenshore Village 1',2420,2,0,0,0,0,64,NULL,3),(2087,0,0,0,'Greenshore Village, Shop',1800,2,0,0,0,0,56,NULL,1),(2088,0,0,0,'Greenshore Village, Villa',8700,2,0,0,0,0,263,NULL,4),(2089,0,0,0,'Greenshore Village 2',780,2,0,0,0,0,30,NULL,1),(2090,0,0,0,'Greenshore Village 3',780,2,0,0,0,0,25,NULL,1),(2091,0,0,0,'Greenshore Village 5',780,2,0,0,0,0,30,NULL,1),(2092,0,0,0,'Greenshore Village 4',780,2,0,0,0,0,25,NULL,1),(2093,0,0,0,'Greenshore Village 6',4360,2,0,0,0,0,118,NULL,2),(2094,0,0,0,'Greenshore Village 7',1260,2,0,0,0,0,42,NULL,1),(2095,0,0,0,'The Tibianic',34500,2,0,0,0,0,862,NULL,22),(2097,0,0,0,'Fibula Village 5',1790,2,0,0,0,0,42,NULL,2),(2098,0,0,0,'Fibula Village 4',1790,2,0,0,0,0,42,NULL,2),(2099,0,0,0,'Fibula Village, Tower Flat',5105,2,0,0,0,0,161,NULL,2),(2100,0,0,0,'Fibula Village 1',845,2,0,0,0,0,30,NULL,1),(2101,0,0,0,'Fibula Village 2',845,2,0,0,0,0,30,NULL,1),(2102,0,0,0,'Fibula Village 3',3810,2,0,0,0,0,110,NULL,4),(2103,0,0,0,'Mercenary Tower',41955,2,0,0,0,0,996,NULL,26),(2104,0,0,0,'Guildhall of the Red Rose',27725,2,0,0,0,0,571,NULL,15),(2105,0,0,0,'Fibula Village, Bar',5235,2,0,0,0,0,122,NULL,2),(2106,0,0,0,'Fibula Village, Villa',11490,2,0,0,0,0,402,NULL,5),(2107,0,0,0,'Fibula Clanhall',11430,2,0,0,0,0,290,NULL,10),(2108,0,0,0,'Spiritkeep',19210,2,0,0,0,0,783,NULL,23),(2109,0,0,0,'Snake Tower',29720,2,0,0,0,0,1064,NULL,21),(2110,0,0,0,'Bloodhall',15270,2,0,0,0,0,569,NULL,15),(2111,0,0,0,'Senja Clanhall',10575,4,0,0,0,0,396,NULL,9),(2112,0,0,0,'Senja Village 2',765,4,0,0,0,0,36,NULL,1),(2113,0,0,0,'Senja Village 1a',765,4,0,0,0,0,36,NULL,1),(2114,0,0,0,'Senja Village 1b',1630,4,0,0,0,0,66,NULL,2),(2115,0,0,0,'Senja Village 4',765,4,0,0,0,0,30,NULL,1),(2116,0,0,0,'Senja Village 3',1765,4,0,0,0,0,72,NULL,2),(2117,0,0,0,'Senja Village 6b',765,4,0,0,0,0,30,NULL,1),(2118,0,0,0,'Senja Village 6a',765,4,0,0,0,0,30,NULL,1),(2119,0,0,0,'Senja Village 5',1225,4,0,0,0,0,48,NULL,2),(2120,0,0,0,'Senja Village 10',1485,4,0,0,0,0,72,NULL,1),(2121,0,0,0,'Senja Village 11',2620,4,0,0,0,0,96,NULL,2),(2122,0,0,0,'Senja Village 9',2575,4,0,0,0,0,103,NULL,2),(2123,0,0,0,'Senja Village 8',1675,4,0,0,0,0,57,NULL,2),(2124,0,0,0,'Senja Village 7',865,4,0,0,0,0,37,NULL,2),(2125,0,0,0,'Rosebud C',1340,4,0,0,0,0,70,NULL,0),(2127,0,0,0,'Rosebud A',1000,4,0,0,0,0,60,NULL,1),(2128,0,0,0,'Rosebud B',1000,4,0,0,0,0,60,NULL,1),(2129,0,0,0,'Nordic Stronghold',18400,4,0,0,0,0,718,NULL,21),(2130,0,0,0,'Northport Village 2',1475,4,0,0,0,0,40,NULL,2),(2131,0,0,0,'Northport Village 1',1475,4,0,0,0,0,48,NULL,2),(2132,0,0,0,'Northport Village 3',5435,4,0,0,0,0,178,NULL,2),(2133,0,0,0,'Northport Village 4',2630,4,0,0,0,0,81,NULL,2),(2134,0,0,0,'Northport Village 5',1805,4,0,0,0,0,56,NULL,2),(2135,0,0,0,'Northport Village 6',2135,4,0,0,0,0,64,NULL,2),(2136,0,0,0,'Seawatch',25010,4,0,0,0,0,749,NULL,19),(2137,0,0,0,'Northport Clanhall',9810,4,0,0,0,0,292,NULL,10),(2138,0,0,0,'Druids Retreat D',1180,4,0,0,0,0,54,NULL,2),(2139,0,0,0,'Druids Retreat A',1340,4,0,0,0,0,60,NULL,2),(2140,0,0,0,'Druids Retreat C',980,4,0,0,0,0,45,NULL,2),(2141,0,0,0,'Druids Retreat B',980,4,0,0,0,0,55,NULL,2),(2142,0,0,0,'Theater Avenue 14 (Shop)',2115,4,0,0,0,0,83,NULL,1),(2143,0,0,0,'Theater Avenue 12',955,4,0,0,0,0,28,NULL,2),(2144,0,0,0,'Theater Avenue 10',1090,4,0,0,0,0,45,NULL,2),(2145,0,0,0,'Theater Avenue 11c',585,4,0,0,0,0,24,NULL,1),(2146,0,0,0,'Theater Avenue 11b',585,4,0,0,0,0,24,NULL,1),(2147,0,0,0,'Theater Avenue 11a',1405,4,0,0,0,0,54,NULL,2),(2148,0,0,0,'Magician\'s Alley 1',1050,4,0,0,0,0,35,NULL,2),(2149,0,0,0,'Magician\'s Alley 1a',700,4,0,0,0,0,29,NULL,2),(2150,0,0,0,'Magician\'s Alley 1d',450,4,0,0,0,0,24,NULL,1),(2151,0,0,0,'Magician\'s Alley 1b',750,4,0,0,0,0,24,NULL,2),(2152,0,0,0,'Magician\'s Alley 1c',500,4,0,0,0,0,20,NULL,1),(2153,0,0,0,'Magician\'s Alley 5a',350,4,0,0,0,0,14,NULL,1),(2154,0,0,0,'Magician\'s Alley 5b',500,4,0,0,0,0,25,NULL,1),(2155,0,0,0,'Magician\'s Alley 5d',500,4,0,0,0,0,20,NULL,1),(2156,0,0,0,'Magician\'s Alley 5e',500,4,0,0,0,0,25,NULL,1),(2157,0,0,0,'Magician\'s Alley 5c',1150,4,0,0,0,0,35,NULL,2),(2158,0,0,0,'Magician\'s Alley 5f',1150,4,0,0,0,0,42,NULL,2),(2159,0,0,0,'Carlin Clanhall',10750,4,0,0,0,0,364,NULL,10),(2160,0,0,0,'Magician\'s Alley 4',2750,4,0,0,0,0,96,NULL,4),(2161,0,0,0,'Lonely Sea Side Hostel',10540,4,0,0,0,0,454,NULL,8),(2162,0,0,0,'Suntower',10080,4,0,0,0,0,450,NULL,7),(2163,0,0,0,'Harbour Lane 3',3560,4,0,0,0,0,145,NULL,3),(2164,0,0,0,'Harbour Flats, Flat 11',520,4,0,0,0,0,24,NULL,1),(2165,0,0,0,'Harbour Flats, Flat 13',520,4,0,0,0,0,24,NULL,1),(2166,0,0,0,'Harbour Flats, Flat 15',360,4,0,0,0,0,18,NULL,1),(2167,0,0,0,'Harbour Flats, Flat 17',360,4,0,0,0,0,24,NULL,1),(2168,0,0,0,'Harbour Flats, Flat 12',400,4,0,0,0,0,20,NULL,1),(2169,0,0,0,'Harbour Flats, Flat 14',400,4,0,0,0,0,20,NULL,1),(2170,0,0,0,'Harbour Flats, Flat 16',400,4,0,0,0,0,20,NULL,1),(2171,0,0,0,'Harbour Flats, Flat 18',400,4,0,0,0,0,25,NULL,1),(2172,0,0,0,'Harbour Flats, Flat 21',860,4,0,0,0,0,35,NULL,2),(2173,0,0,0,'Harbour Flats, Flat 22',980,4,0,0,0,0,45,NULL,2),(2174,0,0,0,'Harbour Flats, Flat 23',400,4,0,0,0,0,25,NULL,1),(2175,0,0,0,'Harbour Lane 2a (Shop)',680,4,0,0,0,0,32,NULL,0),(2176,0,0,0,'Harbour Lane 2b (Shop)',680,4,0,0,0,0,40,NULL,0),(2177,0,0,0,'Harbour Lane 1 (Shop)',1040,4,0,0,0,0,54,NULL,0),(2178,0,0,0,'Theater Avenue 6e',820,4,0,0,0,0,31,NULL,2),(2179,0,0,0,'Theater Avenue 6c',225,4,0,0,0,0,12,NULL,1),(2180,0,0,0,'Theater Avenue 6a',820,4,0,0,0,0,35,NULL,2),(2181,0,0,0,'Theater Avenue 6f',820,4,0,0,0,0,31,NULL,2),(2182,0,0,0,'Theater Avenue 6d',225,4,0,0,0,0,12,NULL,1),(2183,0,0,0,'Theater Avenue 6b',820,4,0,0,0,0,35,NULL,2),(2184,0,0,0,'East Lane 1a',2260,4,0,0,0,0,95,NULL,2),(2185,0,0,0,'East Lane 1b',1700,4,0,0,0,0,83,NULL,2),(2186,0,0,0,'East Lane 2',3900,4,0,0,0,0,172,NULL,2),(2191,0,0,0,'Northern Street 5',1980,4,0,0,0,0,94,NULL,2),(2192,0,0,0,'Northern Street 7',1700,4,0,0,0,0,83,NULL,2),(2193,0,0,0,'Northern Street 3a',740,4,0,0,0,0,31,NULL,2),(2194,0,0,0,'Northern Street 3b',780,4,0,0,0,0,36,NULL,2),(2195,0,0,0,'Northern Street 1c',740,4,0,0,0,0,31,NULL,2),(2196,0,0,0,'Northern Street 1b',740,4,0,0,0,0,37,NULL,2),(2197,0,0,0,'Northern Street 1a',940,4,0,0,0,0,41,NULL,2),(2198,0,0,0,'Theater Avenue 7, Flat 06',315,4,0,0,0,0,20,NULL,1),(2199,0,0,0,'Theater Avenue 7, Flat 01',315,4,0,0,0,0,15,NULL,1),(2200,0,0,0,'Theater Avenue 7, Flat 05',405,4,0,0,0,0,20,NULL,1),(2201,0,0,0,'Theater Avenue 7, Flat 02',405,4,0,0,0,0,20,NULL,1),(2202,0,0,0,'Theater Avenue 7, Flat 04',495,4,0,0,0,0,20,NULL,1),(2203,0,0,0,'Theater Avenue 7, Flat 03',405,4,0,0,0,0,19,NULL,1),(2204,0,0,0,'Theater Avenue 7, Flat 14',495,4,0,0,0,0,20,NULL,1),(2205,0,0,0,'Theater Avenue 7, Flat 13',405,4,0,0,0,0,17,NULL,1),(2206,0,0,0,'Theater Avenue 7, Flat 15',405,4,0,0,0,0,19,NULL,1),(2207,0,0,0,'Theater Avenue 7, Flat 16',405,4,0,0,0,0,20,NULL,1),(2208,0,0,0,'Theater Avenue 7, Flat 11',495,4,0,0,0,0,23,NULL,1),(2209,0,0,0,'Theater Avenue 7, Flat 12',405,4,0,0,0,0,15,NULL,1),(2210,0,0,0,'Theater Avenue 8a',1270,4,0,0,0,0,50,NULL,2),(2211,0,0,0,'Theater Avenue 8b',1370,4,0,0,0,0,49,NULL,3),(2212,0,0,0,'Central Plaza 3',600,4,0,0,0,0,20,NULL,0),(2213,0,0,0,'Central Plaza 2',600,4,0,0,0,0,20,NULL,0),(2214,0,0,0,'Central Plaza 1',600,4,0,0,0,0,24,NULL,0),(2215,0,0,0,'Park Lane 1a',1220,4,0,0,0,0,53,NULL,2),(2216,0,0,0,'Park Lane 3a',1220,4,0,0,0,0,48,NULL,2),(2217,0,0,0,'Park Lane 1b',1380,4,0,0,0,0,64,NULL,2),(2218,0,0,0,'Park Lane 3b',1100,4,0,0,0,0,48,NULL,2),(2219,0,0,0,'Park Lane 4',980,4,0,0,0,0,42,NULL,2),(2220,0,0,0,'Park Lane 2',980,4,0,0,0,0,42,NULL,2),(2221,0,0,0,'Magician\'s Alley 8',1400,4,0,0,0,0,42,NULL,2),(2222,0,0,0,'Moonkeep',13020,4,0,0,0,0,522,NULL,16),(2225,0,0,0,'Castle, Basement, Flat 01',585,11,0,0,0,0,30,NULL,1),(2226,0,0,0,'Castle, Basement, Flat 02',585,11,0,0,0,0,20,NULL,1),(2227,0,0,0,'Castle, Basement, Flat 03',585,11,0,0,0,0,20,NULL,1),(2228,0,0,0,'Castle, Basement, Flat 04',585,11,0,0,0,0,20,NULL,1),(2229,0,0,0,'Castle, Basement, Flat 07',585,11,0,0,0,0,20,NULL,1),(2230,0,0,0,'Castle, Basement, Flat 08',585,11,0,0,0,0,20,NULL,1),(2231,0,0,0,'Castle, Basement, Flat 09',585,11,0,0,0,0,24,NULL,1),(2232,0,0,0,'Castle, Basement, Flat 06',585,11,0,0,0,0,24,NULL,1),(2233,0,0,0,'Castle, Basement, Flat 05',585,11,0,0,0,0,24,NULL,1),(2234,0,0,0,'Castle Shop 1',1890,11,0,0,0,0,67,NULL,1),(2235,0,0,0,'Castle Shop 2',1890,11,0,0,0,0,70,NULL,1),(2236,0,0,0,'Castle Shop 3',1890,11,0,0,0,0,67,NULL,1),(2237,0,0,0,'Castle, 4th Floor, Flat 09',720,11,0,0,0,0,28,NULL,1),(2238,0,0,0,'Castle, 4th Floor, Flat 08',945,11,0,0,0,0,42,NULL,1),(2239,0,0,0,'Castle, 4th Floor, Flat 06',945,11,0,0,0,0,36,NULL,1),(2240,0,0,0,'Castle, 4th Floor, Flat 07',720,11,0,0,0,0,30,NULL,1),(2241,0,0,0,'Castle, 4th Floor, Flat 05',765,11,0,0,0,0,30,NULL,1),(2242,0,0,0,'Castle, 4th Floor, Flat 04',585,11,0,0,0,0,25,NULL,1),(2243,0,0,0,'Castle, 4th Floor, Flat 03',585,11,0,0,0,0,30,NULL,1),(2244,0,0,0,'Castle, 4th Floor, Flat 02',765,11,0,0,0,0,30,NULL,1),(2245,0,0,0,'Castle, 4th Floor, Flat 01',585,11,0,0,0,0,30,NULL,1),(2246,0,0,0,'Castle, 3rd Floor, Flat 01',585,11,0,0,0,0,30,NULL,1),(2247,0,0,0,'Castle, 3rd Floor, Flat 02',765,11,0,0,0,0,30,NULL,1),(2248,0,0,0,'Castle, 3rd Floor, Flat 03',585,11,0,0,0,0,25,NULL,1),(2249,0,0,0,'Castle, 3rd Floor, Flat 05',765,11,0,0,0,0,30,NULL,1),(2250,0,0,0,'Castle, 3rd Floor, Flat 04',585,11,0,0,0,0,25,NULL,1),(2251,0,0,0,'Castle, 3rd Floor, Flat 06',1045,11,0,0,0,0,36,NULL,2),(2252,0,0,0,'Castle, 3rd Floor, Flat 07',720,11,0,0,0,0,30,NULL,1),(2253,0,0,0,'Castle Street 1',2900,11,0,0,0,0,112,NULL,3),(2254,0,0,0,'Castle Street 2',1495,11,0,0,0,0,56,NULL,2),(2255,0,0,0,'Castle Street 3',1765,11,0,0,0,0,56,NULL,2),(2256,0,0,0,'Castle Street 4',1765,11,0,0,0,0,64,NULL,2),(2257,0,0,0,'Castle Street 5',1765,11,0,0,0,0,61,NULL,2),(2258,0,0,0,'Edron Flats, Basement Flat 2',1540,11,0,0,0,0,48,NULL,2),(2259,0,0,0,'Edron Flats, Basement Flat 1',1540,11,0,0,0,0,48,NULL,2),(2260,0,0,0,'Edron Flats, Flat 01',400,11,0,0,0,0,20,NULL,1),(2261,0,0,0,'Edron Flats, Flat 02',860,11,0,0,0,0,28,NULL,2),(2262,0,0,0,'Edron Flats, Flat 03',400,11,0,0,0,0,20,NULL,1),(2263,0,0,0,'Edron Flats, Flat 04',400,11,0,0,0,0,20,NULL,1),(2264,0,0,0,'Edron Flats, Flat 06',400,11,0,0,0,0,20,NULL,1),(2265,0,0,0,'Edron Flats, Flat 05',400,11,0,0,0,0,20,NULL,1),(2266,0,0,0,'Edron Flats, Flat 07',400,11,0,0,0,0,20,NULL,1),(2267,0,0,0,'Edron Flats, Flat 08',400,11,0,0,0,0,20,NULL,1),(2268,0,0,0,'Edron Flats, Flat 11',400,11,0,0,0,0,25,NULL,1),(2269,0,0,0,'Edron Flats, Flat 12',400,11,0,0,0,0,25,NULL,1),(2270,0,0,0,'Edron Flats, Flat 14',400,11,0,0,0,0,25,NULL,1),(2271,0,0,0,'Edron Flats, Flat 13',400,11,0,0,0,0,25,NULL,1),(2272,0,0,0,'Edron Flats, Flat 16',400,11,0,0,0,0,20,NULL,1),(2273,0,0,0,'Edron Flats, Flat 15',400,11,0,0,0,0,20,NULL,1),(2274,0,0,0,'Edron Flats, Flat 18',400,11,0,0,0,0,20,NULL,1),(2275,0,0,0,'Edron Flats, Flat 17',400,11,0,0,0,0,20,NULL,1),(2276,0,0,0,'Edron Flats, Flat 22',400,11,0,0,0,0,25,NULL,1),(2277,0,0,0,'Edron Flats, Flat 21',860,11,0,0,0,0,40,NULL,2),(2278,0,0,0,'Edron Flats, Flat 24',400,11,0,0,0,0,20,NULL,1),(2279,0,0,0,'Edron Flats, Flat 23',400,11,0,0,0,0,25,NULL,1),(2280,0,0,0,'Edron Flats, Flat 26',400,11,0,0,0,0,20,NULL,1),(2281,0,0,0,'Edron Flats, Flat 27',400,11,0,0,0,0,20,NULL,1),(2282,0,0,0,'Edron Flats, Flat 28',400,11,0,0,0,0,20,NULL,1),(2283,0,0,0,'Edron Flats, Flat 25',400,11,0,0,0,0,20,NULL,1),(2284,0,0,0,'Central Circle 1',3020,11,0,0,0,0,119,NULL,2),(2285,0,0,0,'Central Circle 2',3300,11,0,0,0,0,109,NULL,2),(2286,0,0,0,'Central Circle 3',4160,11,0,0,0,0,147,NULL,5),(2287,0,0,0,'Central Circle 4',4160,11,0,0,0,0,147,NULL,5),(2288,0,0,0,'Central Circle 5',4160,11,0,0,0,0,161,NULL,5),(2289,0,0,0,'Central Circle 6 (Shop)',3980,11,0,0,0,0,182,NULL,2),(2290,0,0,0,'Central Circle 7 (Shop)',3980,11,0,0,0,0,161,NULL,2),(2291,0,0,0,'Central Circle 8 (Shop)',3980,11,0,0,0,0,166,NULL,2),(2292,0,0,0,'Central Circle 9a',940,11,0,0,0,0,42,NULL,2),(2293,0,0,0,'Central Circle 9b',940,11,0,0,0,0,44,NULL,2),(2294,0,0,0,'Sky Lane, Guild 1',21145,11,0,0,0,0,666,NULL,23),(2295,0,0,0,'Sky Lane, Guild 2',19300,11,0,0,0,0,672,NULL,14),(2296,0,0,0,'Sky Lane, Guild 3',17315,11,0,0,0,0,564,NULL,18),(2297,0,0,0,'Sky Lane, Sea Tower',4775,11,0,0,0,0,196,NULL,6),(2298,0,0,0,'Wood Avenue 6a',1450,11,0,0,0,0,56,NULL,2),(2299,0,0,0,'Wood Avenue 9a',1540,11,0,0,0,0,56,NULL,2),(2300,0,0,0,'Wood Avenue 10a',1540,11,0,0,0,0,64,NULL,2),(2301,0,0,0,'Wood Avenue 11',7205,11,0,0,0,0,253,NULL,6),(2302,0,0,0,'Wood Avenue 8',5960,11,0,0,0,0,198,NULL,3),(2303,0,0,0,'Wood Avenue 7',5960,11,0,0,0,0,191,NULL,3),(2304,0,0,0,'Wood Avenue 6b',1450,11,0,0,0,0,56,NULL,2),(2305,0,0,0,'Wood Avenue 9b',1495,11,0,0,0,0,56,NULL,2),(2306,0,0,0,'Wood Avenue 10b',1595,11,0,0,0,0,64,NULL,3),(2307,0,0,0,'Wood Avenue 5',1765,11,0,0,0,0,64,NULL,2),(2308,0,0,0,'Wood Avenue 4a',1495,11,0,0,0,0,56,NULL,2),(2309,0,0,0,'Wood Avenue 4b',1495,11,0,0,0,0,56,NULL,2),(2310,0,0,0,'Wood Avenue 4c',1765,11,0,0,0,0,56,NULL,2),(2311,0,0,0,'Wood Avenue 4',1765,11,0,0,0,0,64,NULL,2),(2312,0,0,0,'Wood Avenue 3',1765,11,0,0,0,0,56,NULL,2),(2313,0,0,0,'Wood Avenue 2',1765,11,0,0,0,0,49,NULL,2),(2314,0,0,0,'Wood Avenue 1',1765,11,0,0,0,0,64,NULL,2),(2315,0,0,0,'Magic Academy, Guild',12025,11,0,0,0,0,414,NULL,14),(2316,0,0,0,'Magic Academy, Flat 1',1465,11,0,0,0,0,57,NULL,3),(2317,0,0,0,'Magic Academy, Flat 2',1530,11,0,0,0,0,55,NULL,2),(2318,0,0,0,'Magic Academy, Flat 3',1430,11,0,0,0,0,55,NULL,1),(2319,0,0,0,'Magic Academy, Flat 4',1530,11,0,0,0,0,55,NULL,2),(2320,0,0,0,'Magic Academy, Flat 5',1430,11,0,0,0,0,55,NULL,1),(2321,0,0,0,'Magic Academy, Shop',1595,11,0,0,0,0,48,NULL,1),(2322,0,0,0,'Stonehome Village 1',1780,11,0,0,0,0,74,NULL,2),(2323,0,0,0,'Stonehome Flats, Flat 05',400,11,0,0,0,0,20,NULL,1),(2324,0,0,0,'Stonehome Flats, Flat 04',400,11,0,0,0,0,25,NULL,1),(2325,0,0,0,'Stonehome Flats, Flat 06',400,11,0,0,0,0,20,NULL,1),(2326,0,0,0,'Stonehome Flats, Flat 03',400,11,0,0,0,0,20,NULL,1),(2327,0,0,0,'Stonehome Flats, Flat 01',400,11,0,0,0,0,20,NULL,1),(2328,0,0,0,'Stonehome Flats, Flat 02',740,11,0,0,0,0,30,NULL,2),(2329,0,0,0,'Stonehome Flats, Flat 11',740,11,0,0,0,0,35,NULL,2),(2330,0,0,0,'Stonehome Flats, Flat 12',740,11,0,0,0,0,35,NULL,2),(2331,0,0,0,'Stonehome Flats, Flat 13',400,11,0,0,0,0,20,NULL,1),(2332,0,0,0,'Stonehome Flats, Flat 14',400,11,0,0,0,0,20,NULL,1),(2333,0,0,0,'Stonehome Flats, Flat 16',400,11,0,0,0,0,20,NULL,1),(2334,0,0,0,'Stonehome Flats, Flat 15',400,11,0,0,0,0,20,NULL,1),(2335,0,0,0,'Stonehome Village 2',640,11,0,0,0,0,35,NULL,1),(2336,0,0,0,'Stonehome Village 3',680,11,0,0,0,0,36,NULL,1),(2337,0,0,0,'Stonehome Village 4',940,11,0,0,0,0,42,NULL,2),(2338,0,0,0,'Stonehome Village 6',1300,11,0,0,0,0,55,NULL,2),(2339,0,0,0,'Stonehome Village 5',1140,11,0,0,0,0,56,NULL,2),(2340,0,0,0,'Stonehome Village 7',1140,11,0,0,0,0,49,NULL,2),(2341,0,0,0,'Stonehome Village 8',680,11,0,0,0,0,36,NULL,1),(2342,0,0,0,'Stonehome Village 9',680,11,0,0,0,0,36,NULL,1),(2343,0,0,0,'Stonehome Clanhall',8580,11,0,0,0,0,345,NULL,9),(2344,0,0,0,'Cormaya 1',1270,11,0,0,0,0,49,NULL,2),(2345,0,0,0,'Cormaya 2',3710,11,0,0,0,0,145,NULL,3),(2346,0,0,0,'Cormaya Flats, Flat 01',450,11,0,0,0,0,20,NULL,1),(2347,0,0,0,'Cormaya Flats, Flat 02',450,11,0,0,0,0,20,NULL,1),(2348,0,0,0,'Cormaya Flats, Flat 03',820,11,0,0,0,0,30,NULL,2),(2349,0,0,0,'Cormaya Flats, Flat 06',450,11,0,0,0,0,20,NULL,1),(2350,0,0,0,'Cormaya Flats, Flat 05',450,11,0,0,0,0,20,NULL,1),(2351,0,0,0,'Cormaya Flats, Flat 04',820,11,0,0,0,0,30,NULL,2),(2352,0,0,0,'Cormaya Flats, Flat 13',820,11,0,0,0,0,30,NULL,2),(2353,0,0,0,'Cormaya Flats, Flat 14',820,11,0,0,0,0,35,NULL,2),(2354,0,0,0,'Cormaya Flats, Flat 15',450,11,0,0,0,0,20,NULL,1),(2355,0,0,0,'Cormaya Flats, Flat 16',450,11,0,0,0,0,20,NULL,1),(2356,0,0,0,'Cormaya Flats, Flat 11',450,11,0,0,0,0,20,NULL,1),(2357,0,0,0,'Cormaya Flats, Flat 12',450,11,0,0,0,0,20,NULL,1),(2358,0,0,0,'Cormaya 3',2035,11,0,0,0,0,72,NULL,2),(2359,0,0,0,'Castle of the White Dragon',25110,11,0,0,0,0,761,NULL,19),(2360,0,0,0,'Cormaya 4',1720,11,0,0,0,0,63,NULL,2),(2361,0,0,0,'Cormaya 5',4250,11,0,0,0,0,167,NULL,3),(2362,0,0,0,'Cormaya 6',2395,11,0,0,0,0,84,NULL,2),(2363,0,0,0,'Cormaya 7',2395,11,0,0,0,0,84,NULL,2),(2364,0,0,0,'Cormaya 8',2710,11,0,0,0,0,113,NULL,2),(2365,0,0,0,'Cormaya 9b',2620,11,0,0,0,0,88,NULL,2),(2366,0,0,0,'Cormaya 9a',1225,11,0,0,0,0,48,NULL,2),(2367,0,0,0,'Cormaya 9c',1225,11,0,0,0,0,48,NULL,2),(2368,0,0,0,'Cormaya 9d',2620,11,0,0,0,0,88,NULL,2),(2369,0,0,0,'Cormaya 10',3800,11,0,0,0,0,140,NULL,3),(2370,0,0,0,'Cormaya 11',2035,11,0,0,0,0,72,NULL,2),(2371,0,0,0,'Demon Tower',3340,2,0,0,0,0,127,NULL,2),(2372,0,0,0,'Nautic Observer',6540,4,0,0,0,0,300,NULL,4),(2373,0,0,0,'Riverspring',19450,3,0,0,0,0,565,NULL,18),(2374,0,0,0,'House of Recreation',22540,4,0,0,0,0,702,NULL,16),(2375,0,0,0,'Valorous Venore',14435,1,0,0,0,0,496,NULL,9),(2376,0,0,0,'Ab\'Dendriel Clanhall',14850,5,0,0,0,0,405,NULL,10),(2377,0,0,0,'Castle of the Winds',23885,5,0,0,0,0,842,NULL,18),(2378,0,0,0,'The Hideout',20800,5,0,0,0,0,597,NULL,20),(2379,0,0,0,'Shadow Towers',21800,5,0,0,0,0,750,NULL,18),(2380,0,0,0,'Hill Hideout',13950,3,0,0,0,0,346,NULL,15),(2381,0,0,0,'Meriana Beach',8230,7,0,0,0,0,184,NULL,3),(2382,0,0,0,'Darashia 8, Flat 01',2485,10,0,0,0,0,80,NULL,2),(2383,0,0,0,'Darashia 8, Flat 02',3385,10,0,0,0,0,114,NULL,2),(2384,0,0,0,'Darashia 8, Flat 03',4700,10,0,0,0,0,171,NULL,3),(2385,0,0,0,'Darashia 8, Flat 04',2845,10,0,0,0,0,90,NULL,2),(2386,0,0,0,'Darashia 8, Flat 05',2665,10,0,0,0,0,85,NULL,2),(2387,0,0,0,'Darashia, Eastern Guildhall',12660,10,0,0,0,0,444,NULL,16),(2388,0,0,0,'Theater Avenue 5a',450,4,0,0,0,0,20,NULL,1),(2389,0,0,0,'Theater Avenue 5b',450,4,0,0,0,0,19,NULL,1),(2390,0,0,0,'Theater Avenue 5c',450,4,0,0,0,0,16,NULL,1),(2391,0,0,0,'Theater Avenue 5d',450,4,0,0,0,0,16,NULL,1),(2392,0,0,0,'Outlaw Camp 1',1660,3,0,0,0,0,52,NULL,2),(2393,0,0,0,'Outlaw Camp 2',280,3,0,0,0,0,12,NULL,1),(2394,0,0,0,'Outlaw Camp 3',740,3,0,0,0,0,27,NULL,2),(2395,0,0,0,'Outlaw Camp 4',200,3,0,0,0,0,9,NULL,1),(2396,0,0,0,'Outlaw Camp 5',200,3,0,0,0,0,9,NULL,1),(2397,0,0,0,'Outlaw Camp 6',200,3,0,0,0,0,9,NULL,1),(2398,0,0,0,'Outlaw Camp 7',780,3,0,0,0,0,27,NULL,2),(2399,0,0,0,'Outlaw Camp 8',280,3,0,0,0,0,12,NULL,1),(2400,0,0,0,'Outlaw Camp 9',200,3,0,0,0,0,9,NULL,1),(2401,0,0,0,'Outlaw Camp 10',200,3,0,0,0,0,9,NULL,1),(2402,0,0,0,'Outlaw Camp 11',200,3,0,0,0,0,9,NULL,1),(2404,0,0,0,'Outlaw Camp 12 (Shop)',280,3,0,0,0,0,7,NULL,0),(2405,0,0,0,'Outlaw Camp 13 (Shop)',280,3,0,0,0,0,7,NULL,0),(2406,0,0,0,'Outlaw Camp 14 (Shop)',640,3,0,0,0,0,16,NULL,0),(2407,0,0,0,'Open-Air Theatre',2700,2,0,0,0,0,60,NULL,1),(2408,0,0,0,'The Lair',7625,1,0,0,0,0,165,NULL,3),(2409,0,0,0,'Upper Barracks 2',210,3,0,0,0,0,13,NULL,1),(2410,0,0,0,'Upper Barracks 3',210,3,0,0,0,0,13,NULL,1),(2411,0,0,0,'Upper Barracks 4',210,3,0,0,0,0,14,NULL,1),(2412,0,0,0,'Upper Barracks 5',210,3,0,0,0,0,12,NULL,1),(2413,0,0,0,'Upper Barracks 6',210,3,0,0,0,0,12,NULL,1),(2414,0,0,0,'Upper Barracks 7',210,3,0,0,0,0,12,NULL,1),(2415,0,0,0,'Upper Barracks 8',210,3,0,0,0,0,13,NULL,1),(2416,0,0,0,'Upper Barracks 9',210,3,0,0,0,0,13,NULL,1),(2417,0,0,0,'Upper Barracks 10',210,3,0,0,0,0,13,NULL,1),(2418,0,0,0,'Upper Barracks 11',210,3,0,0,0,0,14,NULL,1),(2419,0,0,0,'Upper Barracks 12',210,3,0,0,0,0,12,NULL,1),(2420,0,0,0,'Low Waters Observatory',17165,9,0,0,0,0,721,NULL,5),(2421,0,0,0,'Eastern House of Tranquility',11120,14,0,0,0,0,356,NULL,5),(2422,0,0,0,'Mammoth House',9300,12,0,0,0,0,218,NULL,6),(2427,0,0,0,'Lower Barracks 1',300,3,0,0,0,0,17,NULL,1),(2428,0,0,0,'Lower Barracks 2',300,3,0,0,0,0,16,NULL,1),(2429,0,0,0,'Lower Barracks 3',300,3,0,0,0,0,17,NULL,1),(2430,0,0,0,'Lower Barracks 4',300,3,0,0,0,0,16,NULL,1),(2431,0,0,0,'Lower Barracks 5',300,3,0,0,0,0,17,NULL,1),(2432,0,0,0,'Lower Barracks 6',300,3,0,0,0,0,15,NULL,1),(2433,0,0,0,'Lower Barracks 7',300,3,0,0,0,0,17,NULL,1),(2434,0,0,0,'Lower Barracks 8',300,3,0,0,0,0,16,NULL,1),(2435,0,0,0,'Lower Barracks 9',300,3,0,0,0,0,17,NULL,1),(2436,0,0,0,'Lower Barracks 10',300,3,0,0,0,0,16,NULL,1),(2437,0,0,0,'Lower Barracks 11',300,3,0,0,0,0,17,NULL,1),(2438,0,0,0,'Lower Barracks 12',300,3,0,0,0,0,16,NULL,1),(2439,0,0,0,'Lower Barracks 13',300,3,0,0,0,0,17,NULL,1),(2440,0,0,0,'Lower Barracks 14',300,3,0,0,0,0,16,NULL,1),(2441,0,0,0,'Lower Barracks 15',300,3,0,0,0,0,17,NULL,1),(2442,0,0,0,'Lower Barracks 16',300,3,0,0,0,0,16,NULL,1),(2443,0,0,0,'Lower Barracks 17',300,3,0,0,0,0,17,NULL,1),(2444,0,0,0,'Lower Barracks 18',300,3,0,0,0,0,16,NULL,1),(2445,0,0,0,'Lower Barracks 19',300,3,0,0,0,0,17,NULL,1),(2446,0,0,0,'Lower Barracks 20',300,3,0,0,0,0,16,NULL,1),(2447,0,0,0,'Lower Barracks 21',300,3,0,0,0,0,17,NULL,1),(2448,0,0,0,'Lower Barracks 22',300,3,0,0,0,0,16,NULL,1),(2449,0,0,0,'Lower Barracks 23',300,3,0,0,0,0,17,NULL,1),(2450,0,0,0,'Lower Barracks 24',300,3,0,0,0,0,16,NULL,1),(2451,0,0,0,'The Farms 4',1530,3,0,0,0,0,36,NULL,2),(2452,0,0,0,'Tunnel Gardens 1',2000,3,0,0,0,0,40,NULL,3),(2455,0,0,0,'Tunnel Gardens 2',2000,3,0,0,0,0,39,NULL,3),(2456,0,0,0,'The Yeah Beach Project',6525,7,0,0,0,0,183,NULL,3),(2460,0,0,0,'Hare\'s Den',7500,3,0,0,0,0,233,NULL,4),(2461,0,0,0,'Lost Cavern',14730,3,0,0,0,0,621,NULL,7),(2462,0,0,0,'Caveman Shelter',3780,14,0,0,0,0,92,NULL,4),(2463,0,0,0,'Old Sanctuary of God King Qjell',21940,28,0,0,0,0,854,NULL,6),(2464,0,0,0,'Wallside Lane 1',7590,33,0,0,0,0,295,NULL,4),(2465,0,0,0,'Wallside Residence',6680,33,0,0,0,0,223,NULL,4),(2466,0,0,0,'Wallside Lane 2',8445,33,0,0,0,0,294,NULL,4),(2467,0,0,0,'Antimony Lane 3',3665,33,0,0,0,0,126,NULL,3),(2468,0,0,0,'Antimony Lane 2',4745,33,0,0,0,0,159,NULL,3),(2469,0,0,0,'Vanward Flats B',7410,33,0,0,0,0,245,NULL,4),(2470,0,0,0,'Vanward Flats A',7410,33,0,0,0,0,222,NULL,4),(2471,0,0,0,'Bronze Brothers Bastion',35205,33,0,0,0,0,1181,NULL,15),(2472,0,0,0,'Antimony Lane 1',7105,33,0,0,0,0,242,NULL,5),(2473,0,0,0,'Rathleton Hills Estate',20685,33,0,0,0,0,646,NULL,13),(2474,0,0,0,'Rathleton Hills Residence',7085,33,0,0,0,0,228,NULL,3),(2475,0,0,0,'Rathleton Plaza 1',2890,33,0,0,0,0,95,NULL,2),(2476,0,0,0,'Rathleton Plaza 2',2620,33,0,0,0,0,99,NULL,2),(2478,0,0,0,'Antimony Lane 4',5150,33,0,0,0,0,176,NULL,3),(2480,0,0,0,'Old Heritage Estate',12075,33,0,0,0,0,402,NULL,7),(2481,0,0,0,'Cistern Ave',3745,33,0,0,0,0,173,NULL,2),(2482,0,0,0,'Rathleton Plaza 4',5005,33,0,0,0,0,193,NULL,2),(2483,0,0,0,'Rathleton Plaza 3',5735,33,0,0,0,0,193,NULL,3),(2488,0,0,0,'Thrarhor V e (Shop)',3000,9,0,0,0,0,36,NULL,1),(2491,0,0,0,'Isle of Solitude House',3000,31,0,0,0,0,529,NULL,14),(2492,0,0,0,'Marketplace 1',400000,63,0,0,0,0,147,NULL,1),(2493,0,0,0,'Marketplace 2',400000,63,0,0,0,0,166,NULL,2),(2495,0,0,0,'Quay 1',200000,63,0,0,0,0,191,NULL,4),(2496,0,0,0,'Quay 2',200000,63,0,0,0,0,148,NULL,2),(2497,0,0,0,'Wave Tower',400000,63,0,0,0,0,358,NULL,4),(2498,0,0,0,'Halls of Sun and Sea',1000000,63,0,0,0,0,611,NULL,11),(2500,0,0,0,'Holy Castle',0,65,0,0,0,0,3065,NULL,20);
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
INSERT INTO `myaac_account_actions` VALUES (8421,0,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1699120172,'Account created.'),(8421,0,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1699155551,'Created character <b>Bronson Otg</b>.'),(8421,0,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1699281202,'Created character <b>Bronson Newotg</b>.'),(8422,2976407275,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708004327,'Account created.'),(8422,2976407275,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708005094,'Created character <b>Teste Outfits</b>.'),(8422,2976407275,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708005209,'Created character <b>Teste Outfitstwo</b>.'),(8423,3049069827,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708114946,'Account created.'),(8423,3049069827,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708114946,'Created character <b>Zyzz</b>.'),(8424,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708441265,'Account created.'),(8424,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708441265,'Created character <b>Teste Xp</b>.'),(8424,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708444537,'Created character <b>Teste Xp</b>.'),(8425,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708445009,'Account created.'),(8425,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708445009,'Created character <b>Joninha Testexp</b>.'),(8425,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708452381,'Created character <b>Joninha Testecity</b>.'),(8426,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708454092,'Account created.'),(8426,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708454092,'Created character <b>Joninha Testexp</b>.'),(8426,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708457191,'Created character <b>Joninha Testestore</b>.'),(8426,3049070072,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1708459184,'Created character <b>Teste Elfoso</b>.'),(8427,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756261150,'Account created.'),(8427,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756261150,'Created character <b>Tolkien</b>.'),(8428,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756261744,'Account created.'),(8428,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756261744,'Created character <b>Stormy</b>.'),(8427,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756261797,'Created character <b>Shaman</b>.'),(8427,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756261805,'Changed comment for character <b>Tolkien</b>.'),(8429,0,'(Lª§ôˆº/®C„c',1756262068,'Account created.'),(8429,0,'(Lª§ôˆº/®C„c',1756262068,'Created character <b>Ozymandias</b>.'),(8430,0,'(Å˚Î°9cE‘œR',1756262175,'Account created.'),(8430,0,'(Å˚Î°9cE‘œR',1756262175,'Created character <b>Oppenheimer</b>.'),(8431,0,'(Å˚Î°9cE‘œR',1756262484,'Account created.'),(8431,0,'(Å˚Î°9cE‘œR',1756262484,'Created character <b>Iberdrola</b>.'),(8432,0,'(0p£\0—∂ıâé‰',1756263165,'Account created.'),(8432,0,'(0p£\0—∂ıâé‰',1756263165,'Created character <b>Rap Da Alma</b>.'),(8432,0,'(0p£\0—∂ıâé‰',1756263256,'Created character <b>Criador De Jutsu</b>.'),(8432,0,'(0p£\0—∂ıâé‰',1756263333,'Created character <b>Rulex Infernalist</b>.'),(8428,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756263636,'Created character <b>Greed</b>.'),(8428,0,'(\rA°gì\0ÏêÇ8€≤i˚',1756263644,'Changed comment for character <b>Stormy</b>.'),(8433,1742224357,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756265492,'Account created.'),(8433,1742224357,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756265492,'Created character <b>Bfhbpqlyrps</b>.'),(8434,0,'&êuv\0]{Àöd¶¿',1756266439,'Account created.'),(8434,0,'&êuv\0]{Àöd¶¿',1756266439,'Created character <b>Shawty</b>.'),(8435,0,'( Ñ/C…+erö,ÿ',1756267098,'Account created.'),(8435,0,'( Ñ/C…+erö,ÿ',1756267098,'Created character <b>Gorbatchov</b>.'),(8436,245838301,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756267181,'Account created.'),(8436,245838301,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756267181,'Created character <b>Zpxysslfuczjgul</b>.'),(8437,3132318891,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756280119,'Account created.'),(8437,3132318891,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756280119,'Created character <b>Irjxoymj</b>.'),(8438,1743318850,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756285943,'Account created.'),(8438,1743318850,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756285943,'Created character <b>Rqbbnwrlmf</b>.'),(8439,2975588751,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756295300,'Account created.'),(8439,2975588751,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756295300,'Created character <b>Gandalf</b>.'),(8440,0,'(\0ÙòY\\åh!ãG–Ê',1756296418,'Account created.'),(8440,0,'(\0ÙòY\\åh!ãG–Ê',1756296418,'Created character <b>Usain Arrow</b>.'),(8441,2852160283,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756302672,'Account created.'),(8441,2852160283,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756302672,'Created character <b>Fuu Houhou</b>.'),(8442,755403103,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756303610,'Account created.'),(8442,755403103,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756303610,'Created character <b>Cacto</b>.'),(8443,0,'(MrßãCU·ÎÏ_˙¬',1756309007,'Account created.'),(8443,0,'(MrßãCU·ÎÏ_˙¬',1756309007,'Created character <b>Verde Orc</b>.'),(8444,0,'(MrßãCU·ÎÏ_˙¬',1756309055,'Account created.'),(8444,0,'(MrßãCU·ÎÏ_˙¬',1756309055,'Created character <b>Mais Quanto</b>.'),(8444,0,'(MrßãCU·ÎÏ_˙¬',1756309080,'Created character <b>Puro Suco</b>.'),(8445,0,'(MrßãCU·ÎÏ_˙¬',1756309133,'Account created.'),(8445,0,'(MrßãCU·ÎÏ_˙¬',1756309133,'Created character <b>Atira Muito</b>.'),(8445,0,'(MrßãCU·ÎÏ_˙¬',1756309225,'Created character <b>Atiira Muito</b>.'),(8445,0,'(MrßãCU·ÎÏ_˙¬',1756309260,'Created character <b>Muito Simples</b>.'),(8446,2594174612,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756310801,'Account created.'),(8446,2594174612,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756310801,'Created character <b>Efzzchiuzr</b>.'),(8447,1735049220,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756312025,'Account created.'),(8447,1735049220,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756312025,'Created character <b>Yozhobdxihrn</b>.'),(8448,2982682714,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756316791,'Account created.'),(8448,2982682714,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756316791,'Created character <b>Dwarf King</b>.'),(8449,0,'(1óπSÃ{õÈÆòÓ¸',1756317464,'Account created.'),(8449,0,'(1óπSÃ{õÈÆòÓ¸',1756317464,'Created character <b>Criei Druid</b>.'),(8450,0,'(àPf%ƒ#·bØ¯m',1756317674,'Account created.'),(8450,0,'(àPf%ƒ#·bØ¯m',1756317674,'Created character <b>Viinii</b>.'),(8451,2974891335,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756318903,'Account created.'),(8451,2974891335,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756318903,'Created character <b>Orc Vegano</b>.'),(8452,0,'(nî\04„\0Ë÷≈f<âB',1756321916,'Account created.'),(8452,0,'(nî\04„\0Ë÷≈f<âB',1756321916,'Created character <b>Andin Inevitavel</b>.'),(8453,2852160277,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756325287,'Account created.'),(8453,2852160277,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756325287,'Created character <b>Chou Soran</b>.'),(8441,2852160283,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756326028,'Account password changed.'),(8454,2327467196,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756326835,'Account created.'),(8454,2327467196,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756326835,'Created character <b>Hector Bonilha</b>.'),(8455,2327467196,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756326933,'Account created.'),(8455,2327467196,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756326933,'Created character <b>Danilandia</b>.'),(8456,2214551790,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756329338,'Account created.'),(8456,2214551790,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756329338,'Created character <b>Smoker</b>.'),(8457,2974487959,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756330239,'Account created.'),(8457,2974487959,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756330239,'Created character <b>Kathy Insane</b>.'),(8458,2861976350,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756330804,'Account created.'),(8458,2861976350,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756330804,'Created character <b>Lamine Yamal</b>.'),(8459,0,'(0Fä\0	4åé›÷X',1756330924,'Account created.'),(8459,0,'(0Fä\0	4åé›÷X',1756330924,'Created character <b>Solo Leveling</b>.'),(8460,2327467503,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756331321,'Account created.'),(8460,2327467503,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756331321,'Created character <b>El Felca</b>.'),(8460,2327467503,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756331386,'Created character <b>Uzeto Free Itens</b>.'),(8461,2327467911,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756332053,'Account created.'),(8461,2327467911,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756332053,'Created character <b>Parabens Salles</b>.'),(8462,0,'(Lª§ôˆ\\ﬁ/Hñq¨',1756332353,'Account created.'),(8462,0,'(Lª§ôˆ\\ﬁ/Hñq¨',1756332353,'Created character <b>Lula</b>.'),(8452,0,'(nî\04„\0Ë÷≈f<âB',1756332453,'Created character <b>Andinn Inevitavel</b>.'),(8463,0,'(Ñ@\\O/í≥.àò',1756332496,'Account created.'),(8463,0,'(Ñ@\\O/í≥.àò',1756332496,'Created character <b>Skylline</b>.'),(8452,0,'(nî\04„\0Ë÷≈f<âB',1756332569,'Created character <b>Anderson Inevitavel</b>.'),(8464,2852160283,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756332708,'Account created.'),(8464,2852160283,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756332708,'Created character <b>Zhang Chulan</b>.'),(8465,2852160283,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756332794,'Account created.'),(8465,2852160283,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756332794,'Created character <b>Reiyu Shita</b>.'),(8466,2818620544,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756333182,'Account created.'),(8466,2818620544,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756333182,'Created character <b>Orc Lokao</b>.'),(8459,0,'(0Fä\0	4åé›÷X',1756333341,'Created character <b>Re Zero Beatrice</b>.'),(8467,0,'(?è\0,‡r’Sÿ`',1756333426,'Account created.'),(8467,0,'(?è\0,‡r’Sÿ`',1756333426,'Created character <b>Elrond Druid</b>.'),(8468,0,'(Mæäût\\`≤ÇÓ…Ji',1756333589,'Account created.'),(8468,0,'(Mæäût\\`≤ÇÓ…Ji',1756333589,'Created character <b>Luana Moranguinho</b>.'),(8469,0,'(Lá„êÀ\\-QÁ¿ΩPÉ',1756333928,'Account created.'),(8469,0,'(Lá„êÀ\\-QÁ¿ΩPÉ',1756333928,'Created character <b>Robin Hood</b>.'),(8470,2973957402,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756334064,'Account created.'),(8470,2973957402,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756334064,'Created character <b>Juice Fruit</b>.'),(8471,0,'(h–DYÎ5˚#K€œ',1756334249,'Account created.'),(8471,0,'(h–DYÎ5˚#K€œ',1756334249,'Created character <b>Thaynan Charlove</b>.'),(8472,766287659,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756334258,'Account created.'),(8472,766287659,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756334259,'Created character <b>Anna Koldings</b>.'),(8473,0,'(0Œ\0u¥¸ø¢¶í',1756334483,'Account created.'),(8473,0,'(0Œ\0u¥¸ø¢¶í',1756334483,'Created character <b>Wheely</b>.'),(8474,0,'(Mæäût\\`≤ÇÓ…Ji',1756334538,'Account created.'),(8474,0,'(Mæäût\\`≤ÇÓ…Ji',1756334538,'Created character <b>Aleska Teodoro</b>.'),(8475,3206519263,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756334962,'Account created.'),(8475,3206519263,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756334962,'Created character <b>Uppercut</b>.'),(8476,0,'(äX™\0\0\0lh§;áÂ*ı',1756335255,'Account created.'),(8476,0,'(äX™\0\0\0lh§;áÂ*ı',1756335255,'Created character <b>Joninha</b>.'),(8477,3220365070,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756335902,'Account created.'),(8477,3220365070,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756335902,'Created character <b>Receptaculo</b>.'),(8478,3220365070,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756335951,'Account created.'),(8478,3220365070,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756335951,'Created character <b>Alagoano Alma</b>.'),(8479,3220365070,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756336002,'Account created.'),(8479,3220365070,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756336002,'Created character <b>Ojuara</b>.'),(8444,0,'(MrßãC|ÊX?¿Ä¢;',1756336043,'Created character <b>Go North</b>.'),(8480,0,'(MrßãC|ÊX?¿Ä¢;',1756336141,'Account created.'),(8480,0,'(MrßãC|ÊX?¿Ä¢;',1756336141,'Created character <b>Para Para</b>.'),(8480,0,'(MrßãC|ÊX?¿Ä¢;',1756336199,'Created character <b>Press</b>.'),(8481,0,'(Ñ@\\O/í≥.àò',1756336653,'Account created.'),(8481,0,'(Ñ@\\O/í≥.àò',1756336653,'Created character <b>Billy Boy</b>.'),(8482,0,'*	∫¡\0†\0\0\0\0\0ƒ\0>',1756336709,'Account created.'),(8482,0,'*	∫¡\0†\0\0\0\0\0ƒ\0>',1756336709,'Created character <b>Orappa</b>.'),(8452,0,'(nî\04„\0Ë÷≈f<âB',1756336783,'Account password changed.'),(8483,3220365070,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756337002,'Account created.'),(8483,3220365070,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756337002,'Created character <b>Putifero</b>.'),(8484,0,'(\"ºZ\00©ΩŸÜæﬂ',1756337272,'Account created.'),(8484,0,'(\"ºZ\00©ΩŸÜæﬂ',1756337272,'Created character <b>Fuba</b>.'),(8485,1850396408,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756337733,'Account created.'),(8485,1850396408,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756337733,'Created character <b>Whvgqooqr</b>.'),(8486,2978020397,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756338298,'Account created.'),(8486,2978020397,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756338298,'Created character <b>Negrosaki</b>.'),(8487,2818620732,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756338901,'Account created.'),(8487,2818620732,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756338901,'Created character <b>Zico Dez</b>.'),(8488,2818620732,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756338965,'Account created.'),(8488,2818620732,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756338965,'Created character <b>Dulokz</b>.'),(8489,0,'(MrßãC|ÊX?¿Ä¢;',1756339723,'Account created.'),(8489,0,'(MrßãC|ÊX?¿Ä¢;',1756339723,'Created character <b>Terceiro</b>.'),(8490,3173338018,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756339786,'Account created.'),(8490,3173338018,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756339787,'Created character <b>Middle Earth</b>.'),(8430,0,'(Mæäût\\`≤ÇÓ…Ji',1756339837,'Account password changed.'),(8491,3173338018,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756339913,'Account created.'),(8491,3173338018,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756339913,'Created character <b>Jumahu</b>.'),(8492,3173338018,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756340026,'Account created.'),(8492,3173338018,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756340026,'Created character <b>Logitch</b>.'),(8493,3173338018,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756340087,'Account created.'),(8493,3173338018,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1756340087,'Created character <b>Paramax</b>.'),(8494,0,'*	∫≈Àñ\0\0\0\0Ÿ\0~',1756340216,'Account created.'),(8494,0,'*	∫≈Àñ\0\0\0\0Ÿ\0~',1756340216,'Created character <b>Picapau</b>.'),(8495,0,'(0p£\0YNh±∑<«',1756340973,'Account created.'),(8495,0,'(0p£\0YNh±∑<«',1756340973,'Created character <b>Orc Blokadao</b>.'),(8496,0,'(0p£\0YNh±∑<«',1756341211,'Account created.'),(8496,0,'(0p£\0YNh±∑<«',1756341211,'Created character <b>Orc The Criar</b>.'),(8497,0,'(h–S˚wpm’_”«\\',1756342263,'Account created.'),(8497,0,'(h–S˚wpm’_”«\\',1756342263,'Created character <b>China Weed Lover</b>.'),(8498,0,'&êuv4Èc≈•)Ë',1756342287,'Account created.'),(8498,0,'&êuv4Èc≈•)Ë',1756342287,'Created character <b>Drumbash Pebblebeard</b>.'),(8499,0,'((\0öñ\0çõˇs\'3¶Û',1756344980,'Account created.'),(8499,0,'((\0öñ\0çõˇs\'3¶Û',1756344980,'Created character <b>Xerequinha</b>.');
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
INSERT INTO `myaac_config` VALUES (1,'database_version','33'),(2,'status_online','1'),(3,'status_players','27'),(4,'status_playersMax','100'),(5,'status_lastCheck','1756367766'),(6,'status_uptime','15783'),(7,'status_monsters','20881'),(8,'last_usage_report','1756260829'),(9,'views_counter','12520'),(10,'status_uptimeReadable','month, day, 01h 23m'),(11,'status_motd','Bem vindo ao Middle Earth Server!'),(12,'status_mapAuthor','Jonathan Silva'),(13,'status_mapName','Bronson'),(14,'status_mapWidth','2293'),(15,'status_mapHeight','2048'),(16,'status_server','OTG-BR'),(17,'status_serverVersion','1.4'),(18,'status_clientVersion','12.35');
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
INSERT INTO `myaac_news` VALUES (5,'Bem vindo ao Middle Earth Server!','<p style=\"text-align: center;\">Boas vindas ao Middle Earth Server!</p>\r\n<p style=\"text-align: center;\">Para jogar em nosso servidor, voc&ecirc; precisar&aacute; do client disponivel na aba de downloads.<br /><img src=\"https://www.tibiawiki.com.br/images/thumb/7/76/Tibia_icon.png/120px-Tibia_icon.png?20190711200111\" alt=\"Client Icon\" /><br /><a href=\"../?download_client\">Download do Client </a><br /><br />Abaixo deixarei listados alguns dos principais sistemas do servidor, sendo eles:<br /><br /><img src=\"https://www.tibiawiki.com.br/images/f/f6/Dream_Matter.gif\" alt=\"Dream Matter.gif\" width=\"32\" height=\"32\" />Sistema de Upgrade (Refinamento), para saber mais visite:</p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/5/5a/Hammer.gif\" alt=\"Hammer.gif\" width=\"32\" height=\"32\" /></p>\r\n<p style=\"text-align: center;\"><a href=\"../?refinament\"> Refine </a></p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/f/f6/Dream_Matter.gif\" alt=\"Dream Matter.gif\" width=\"32\" height=\"32\" /> Sistema de Invas&otilde;es autom&aacute;ticas e aleat&oacute;rias, para saber mais visite:</p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/thumb/2/22/Tibian_Parchment.gif/56px-Tibian_Parchment.gif\" srcset=\"/images/2/22/Tibian_Parchment.gif 1.5x\" alt=\"Tibian Parchment.gif\" width=\"56\" height=\"56\" /></p>\r\n<p style=\"text-align: center;\"><br /><a href=\"../?bossesraidsaleatorias\">&nbsp;Invas&otilde;es Aleat&oacute;rias </a></p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/f/f6/Dream_Matter.gif\" alt=\"Dream Matter.gif\" width=\"32\" height=\"32\" />Ilhas | Bosses, para saber mais visite:</p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/f/ff/Icone8.png\" alt=\"Icone8.png\" width=\"63\" height=\"65\" /></p>\r\n<p style=\"text-align: center;\"><br /><a href=\"../?islands\"> Ilhas &amp; Dolls </a><br /><br />E futuramente o sistema de tier e classifica&ccedil;&atilde;o ser&aacute; adicionado no servidor tamb&eacute;m.</p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/f/f4/Flames_of_the_Percht_Queen.gif\" alt=\"Flames of the Percht Queen.gif\" width=\"34\" height=\"34\" /> Novas criaturas foram adicionadas&nbsp;<img src=\"https://www.tibiawiki.com.br/images/f/f4/Flames_of_the_Percht_Queen.gif\" alt=\"Flames of the Percht Queen.gif\" width=\"34\" height=\"34\" /></p>\r\n<p style=\"text-align: center;\"><img src=\"https://www.tibiawiki.com.br/images/e/ef/Execowtioner.gif\" alt=\"Execowtioner.gif\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/7/70/Wardragon.gif\" alt=\"Wardragon.gif\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/d/d7/Dragolisk.gif\" alt=\"Dragolisk.gif\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/1/14/Mega_Dragon.gif\" alt=\"Mega Dragon.gif\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/7/79/Souleater.gif\" alt=\"Souleater.gif\" width=\"64\" height=\"64\" /><img src=\"https://www.tibiawiki.com.br/images/1/1c/Moohtant.gif\" alt=\"Moohtant.gif\" width=\"64\" height=\"64\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../template/offlike/imagens/abertura.png\" /></p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: center;\">Quarta-Feira, as 19:30 ser&aacute; dada a largada!</p>\r\n<p style=\"text-align: center;\">Bom jogo a todos!</p>',1,1756262968,1,11934,11934,1756333519,'0','','images/news/announcement.jpg',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=4769 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_autoloot`
--

LOCK TABLES `player_autoloot` WRITE;
/*!40000 ALTER TABLE `player_autoloot` DISABLE KEYS */;
INSERT INTO `player_autoloot` VALUES (7,11910,'^'),(11,11920,''),(614,11919,''),(649,11922,''),(654,11923,''),(669,11924,''),(674,11925,''),(677,11915,''),(678,11912,''),(681,11914,''),(682,11911,''),(2206,11928,''),(2218,11926,''),(2228,11918,'ï'),(2229,11927,''),(2230,1,''),(2233,11929,'R	ÙGıGháM	j|Nl≥ôd'),(2251,11913,''),(2254,11933,''),(2260,4,''),(2261,3,''),(2262,11935,''),(2264,5,''),(2265,11931,''),(2266,2,''),(2267,11930,''),(2575,11938,''),(2603,11959,''),(2635,11995,''),(2638,11990,''),(2648,11957,''),(2657,12001,''),(2852,11942,''),(2885,11972,''),(3025,11960,''),(3026,12002,''),(3082,12000,''),(3095,11974,''),(3100,11941,''),(3117,12010,''),(3120,12009,''),(3157,12019,''),(3160,11975,''),(3281,11996,''),(3300,12014,''),(3316,11956,''),(3318,12015,''),(3326,12006,''),(3470,12011,''),(3508,11981,''),(3513,12003,''),(3547,11948,''),(3710,11987,''),(3739,11986,''),(3789,12021,''),(3808,11964,'S	»	«	∆	dfe'),(3812,11968,''),(3813,11982,''),(3818,11967,''),(3819,12016,''),(3881,11978,''),(3898,11965,''),(4136,12012,''),(4168,11976,''),(4182,12013,''),(4485,12004,''),(4590,11954,''),(4691,11939,''),(4741,11988,''),(4742,11994,' 	n	W\n™	—	Ó	o\ndj\nÇ	º	Œ•	X	N)´	ß\"—‘	'),(4743,11969,''),(4744,11983,''),(4745,11936,' •	N)e<ıbì˙¨	è‘	 	%n	º	Ç	ü	X	a~	ø3di	'),(4746,11937,''),(4747,11979,'n	ebX	a$\' 	S	W\ndÇ	º	•	‘	'),(4748,11991,'eX	a•	‘	~	ø3dã 	bj\nº	n	¨	ìˆ'),(4749,11997,''),(4750,12005,''),(4751,11984,''),(4752,12008,'W\nı fà	•	Ï	ü	Ç	º	^b˙e<‘	n	ai	dW 	Q%'),(4753,11998,''),(4754,12020,''),(4755,11985,''),(4756,11940,''),(4757,11999,''),(4758,12018,''),(4759,11989,''),(4760,11943,''),(4761,11947,''),(4762,11953,''),(4763,11971,''),(4764,11970,''),(4765,11993,''),(4766,11992,''),(4768,11934,'');
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
INSERT INTO `player_autoloot_persist` VALUES (11991,26377,2148),(11991,26377,5878),(11936,26377,2148),(12008,26377,2148);
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
INSERT INTO `player_deaths` VALUES (11942,1756334266,8,'um elf',0,'um elf',0,0,0),(11990,1756334575,8,'um minotaur',0,'um minotaur',0,0,0),(11978,1756334826,10,'um minotaur guard',0,'um minotaur guard',0,0,0),(11964,1756334830,9,'um minotaur guard',0,'um minotaur guard',0,0,0),(11987,1756335708,9,'um minotaur archer',0,'um minotaur guard',0,0,0),(11953,1756335846,10,'um pirate ghost',0,'um pirate ghost',0,0,0),(11960,1756336749,9,'um ghoul',0,'um ghoul',0,0,0),(11956,1756336763,9,'um ghoul',0,'um ghoul',0,0,0),(12002,1756336763,8,'um ghoul',0,'um ghoul',0,0,0),(12000,1756336764,8,'um ghoul',0,'um ghoul',0,0,0),(11953,1756336891,11,'um minotaur archer',0,'um minotaur archer',0,0,0),(11986,1756336895,16,'um pirate marauder',0,'um pirate cutthroat',0,0,0),(12003,1756337013,8,'um minotaur',0,'um minotaur',0,0,0),(11956,1756337219,10,'uma carrion worm',0,'uma carrion worm',0,0,0),(11992,1756337252,10,'um pirate marauder',0,'um pirate marauder',0,0,0),(11956,1756337482,10,'a pirate skeleton',0,'um pirate cutthroat',0,0,0),(11948,1756337506,8,'a pirate skeleton',0,'um pirate cutthroat',0,0,0),(11986,1756337526,17,'um dragon',0,'um dragon',0,0,0),(11968,1756337559,17,'um dragon',0,'um dragon',0,0,0),(11974,1756337731,11,'um minotaur guard',0,'um minotaur guard',0,0,0),(11972,1756338084,15,'um dragon',0,'um dragon',0,0,0),(11986,1756338084,18,'um dragon',0,'um dragon',0,0,0),(11981,1756338086,18,'um dragon',0,'um dragon',0,0,0),(11972,1756338203,15,'um pirate corsair',0,'um pirate corsair',0,0,0),(11986,1756338206,18,'um pirate corsair',0,'um pirate corsair',0,0,0),(11994,1756338429,16,'um cyclops',0,'um cyclops',0,0,0),(11956,1756338436,11,'um ghoul',0,'um ghoul',0,0,0),(11988,1756338437,16,'um cyclops',0,'um cyclops',0,0,0),(11968,1756338486,18,'um cyclops drone',0,'um cyclops drone',0,0,0),(11956,1756338519,11,'um pirate corsair',0,'um pirate buccaneer',0,0,0),(11985,1756338764,8,'um dwarf soldier',0,'um dwarf soldier',0,0,0),(11968,1756338856,19,'um bonebeast',0,'um bonebeast',0,0,0),(11943,1756339012,16,'um pirate corsair',0,'um pirate corsair',0,0,0),(11968,1756339134,19,'um dragon',0,'um dragon',0,0,0),(11953,1756339243,16,'um assassin',0,'um assassin',0,0,0),(11979,1756339300,16,'um draco',0,'um draco',0,0,0),(11991,1756339302,16,'um draco',0,'um draco',0,0,0),(11979,1756339365,16,'um draco',0,'um draco',0,0,0),(11943,1756339424,16,'uma ice witch',0,'uma ice witch',0,0,0),(11986,1756339490,19,'uma ice witch',0,'uma ice witch',0,0,0),(12003,1756339513,8,'um minotaur',0,'um minotaur',0,0,0),(11981,1756339728,19,'um wyvern',0,'um wyvern',0,0,0),(11968,1756339817,20,'um wyvern',0,'um wyvern',0,0,0),(11986,1756339897,19,'um elf',0,'um elf',0,0,0),(12003,1756339995,8,'um minotaur',0,'um minotaur',0,0,0),(11981,1756340647,20,'um bonebeast',0,'um bonebeast',0,0,0),(11991,1756340662,19,'um bonebeast',0,'um bonebeast',0,0,0),(11979,1756340666,19,'um bonebeast',0,'um bonebeast',0,0,0),(11947,1756340838,16,'um pirate ghost',0,'um pirate buccaneer',0,0,0),(12004,1756340845,19,'um draco',0,'um draco',0,0,0),(11974,1756340962,18,'um hero',0,'um hero',0,0,0),(12005,1756341274,9,'um assassin',0,'um assassin',0,0,0),(11969,1756341280,8,'um pirate ghost',0,'um pirate ghost',0,0,0),(11948,1756341837,20,'um dragon lord',0,'um dragon lord',0,0,0),(11981,1756341876,21,'um dragon lord',0,'um dragon lord',0,0,0),(12004,1756341876,20,'um dragon lord',0,'um dragon lord',0,0,0),(11979,1756341887,21,'um dragon lord',0,'um dragon lord',0,0,0),(11979,1756342329,22,'um dragon lord',0,'um dragon lord',0,0,0),(11991,1756342332,23,'um dragon lord',0,'um dragon lord',0,0,0),(12004,1756342439,22,'um dragon lord',0,'um dragon lord',0,0,0),(11981,1756342442,22,'um dragon lord',0,'um dragon lord',0,0,0),(11948,1756342444,22,'um dragon',0,'um dragon lord',0,0,0),(12004,1756342463,22,'pirate captain',0,'pirate captain',0,0,0),(12019,1756342488,8,'pirate captain',0,'pirate captain',0,0,0),(11940,1756342994,18,'pirate captain',0,'pirate captain',0,0,0),(11953,1756343345,22,'uma slime',0,'uma slime',0,0,0),(11989,1756343409,17,'pirate captain',0,'pirate captain',0,0,0),(11953,1756343745,23,'uma ice witch',0,'uma ice witch',0,0,0),(11992,1756343752,14,'pirate captain',0,'pirate captain',0,0,0),(11979,1756343759,23,'um dragon lord',0,'um dragon lord',0,0,0),(11953,1756343921,23,'uma ice witch',0,'uma ice witch',0,0,0),(11988,1756344094,25,'pirate captain',0,'pirate captain',0,0,0),(11981,1756344208,25,'um dragon lord',0,'um dragon lord',0,0,0),(11979,1756344589,27,'um draco',0,'um draco',0,0,0),(12005,1756344679,12,'uma slime',0,'uma slime',0,0,0),(11936,1756344726,23,'um cyclops',0,'um cyclops',0,0,0),(12004,1756344980,27,'um black knight',0,'um black knight',0,0,0),(11992,1756345000,15,'uma slime',0,'uma slime',0,0,0),(12008,1756345097,8,'um hunter',0,'um hunter',0,0,0),(11940,1756345105,23,'um dragon',0,'um dragon',0,0,0),(12008,1756345133,7,'pirate captain',0,'pirate captain',0,0,0),(11969,1756345567,13,'pirate captain',0,'pirate captain',0,0,0),(11943,1756345760,21,'um cyclops',0,'um cyclops',0,0,0),(11976,1756345769,28,'a vampire bride',0,'a vampire bride',0,0,0),(11992,1756345898,16,'um dwarf soldier',0,'um dwarf guard',0,0,0),(11998,1756345941,14,'uma kongra',0,'uma kongra',0,0,0),(12005,1756345941,13,'uma kongra',0,'uma kongra',0,0,0),(11997,1756345949,12,'um sibang',0,'um sibang',0,0,0),(11992,1756346215,16,'um dwarf guard',0,'um dwarf guard',0,0,0),(11991,1756346578,32,'um bonebeast',0,'um bonebeast',0,0,0),(11994,1756346943,30,'um dragon lord',0,'um dragon lord',0,0,0),(11979,1756347053,31,'um dragon',0,'um dragon',0,0,0),(11986,1756347116,26,'a dragon hatchling',0,'a dragon hatchling',0,0,0),(11986,1756347266,25,'um bonebeast',0,'um bonebeast',0,0,0),(11988,1756347769,32,'um dragon',0,'um dragon lord',0,0,0),(12016,1756347857,20,'uma ice witch',0,'uma ice witch',0,0,0),(11986,1756347904,26,'a vampire bride',0,'a vampire bride',0,0,0),(11989,1756347935,24,'uma slime',0,'uma slime',0,0,0),(11986,1756348008,26,'um bonebeast',0,'um bonebeast',0,0,0),(12004,1756348152,30,'um bonebeast',0,'um bonebeast',0,0,0),(11991,1756348324,34,'um bonebeast',0,'um bonebeast',0,0,0),(11991,1756348531,34,'um bonebeast',0,'um bonebeast',0,0,0),(12016,1756349125,20,'um hero',0,'um hero',0,0,0),(11954,1756349685,23,'El Felca',1,'El Felca',1,1,0),(11969,1756349691,24,'El Felca',1,'El Felca',1,1,0),(12004,1756350004,30,'um black knight',0,'um black knight',0,0,0),(11988,1756350019,35,'um dragon lord',0,'um dragon lord',0,0,0),(11994,1756350025,35,'um dragon lord',0,'um dragon lord',0,0,0),(11969,1756350185,23,'um dragon',0,'um dragon',0,0,0),(11940,1756350297,36,'um dragon lord',0,'um dragon lord',0,0,0),(11994,1756350596,35,'um dragon lord',0,'um dragon lord',0,0,0),(11988,1756350651,35,'um dragon lord',0,'um dragon lord',0,0,0),(11940,1756350681,37,'um dragon lord',0,'um dragon lord',0,0,0),(11978,1756350857,29,'um cyclops',0,'um cyclops',0,0,0),(11940,1756351029,41,'um dragon lord',0,'um dragon lord',0,0,0),(12004,1756351174,34,'um black knight',0,'um black knight',0,0,0),(11994,1756351302,35,'um dragon lord',0,'um dragon lord',0,0,0),(11969,1756351405,25,'uma ice witch',0,'uma ice witch',0,0,0),(11994,1756351511,35,'um dragon lord',0,'um dragon lord',0,0,0),(11969,1756351632,25,'uma ice witch',0,'uma ice witch',0,0,0),(11994,1756351666,35,'um dragon lord',0,'um dragon lord',0,0,0),(11988,1756351669,40,'um dragon lord',0,'um dragon lord',0,0,0),(11940,1756351673,43,'um dragon lord',0,'um dragon lord',0,0,0),(11954,1756352023,25,'uma ice witch',0,'uma ice witch',0,0,0),(11969,1756352055,26,'uma ice witch',0,'uma ice witch',0,0,0),(11940,1756352324,44,'um dragon lord',0,'um dragon lord',0,0,0),(11988,1756352328,42,'um dragon lord',0,'um dragon lord',0,0,0),(11994,1756352334,41,'um dragon lord',0,'um dragon lord',0,0,0),(11976,1756353113,33,'um bonebeast',0,'um bonebeast',0,0,0),(11994,1756353151,45,'um dragon lord',0,'um dragon lord',0,0,0),(11940,1756353157,49,'um dragon lord',0,'um dragon lord',0,0,0),(11988,1756353172,46,'um dragon lord',0,'um dragon lord',0,0,0),(11983,1756353339,24,'um bonebeast',0,'um bonebeast',0,0,0),(11979,1756355688,51,'um dragon lord',0,'um dragon lord',0,0,0),(11940,1756355903,54,'um wyrm',0,'um wyrm',0,0,0),(11988,1756355916,51,'um wyrm',0,'um wyrm',0,0,0),(11994,1756355922,50,'um elder wyrm',0,'um elder wyrm',0,0,0),(12004,1756355926,57,'um elder wyrm',0,'um elder wyrm',0,0,0),(11940,1756356230,54,'um elder wyrm',0,'um elder wyrm',0,0,0),(11994,1756356310,50,'um wyrm',0,'um wyrm',0,0,0),(11984,1756356568,8,'um nomad',0,'um nomad',0,0,0),(11940,1756356666,54,'um uruloki',0,'um uruloki',0,0,0),(11988,1756356667,51,'um uruloki',0,'um uruloki',0,0,0),(11994,1756356672,50,'um uruloki',0,'um uruloki',0,0,0),(12004,1756356703,57,'um uruloki',0,'um uruloki',0,0,0),(11994,1756357058,50,'um dragon lord',0,'um dragon lord',0,0,0),(11988,1756357061,51,'um dragon lord',0,'um dragon lord',0,0,0),(12008,1756357434,33,'um dragon lord',0,'um dragon lord',0,0,0),(11988,1756357559,51,'um dragon lord',0,'um dragon lord',0,0,0),(11969,1756357951,36,'um frost dragon',0,'um frost dragon',0,0,0),(11969,1756358238,36,'um bonebeast',0,'um bonebeast',0,0,0),(11969,1756358659,37,'um dragon',0,'um dragon',0,0,0),(11984,1756359044,15,'um dwarf',0,'um dwarf',0,0,0),(11991,1756359460,62,'um black knight',0,'um black knight',0,0,0),(12005,1756359872,44,'um dragon lord',0,'um dragon lord',0,0,0),(11998,1756359873,44,'um dragon lord',0,'um dragon lord',0,0,0),(11997,1756359945,43,'um dragon lord',0,'um dragon lord',0,0,0),(11991,1756360053,63,'um black knight',0,'um black knight',0,0,0),(11983,1756360183,45,'um dragon lord',0,'um dragon lord',0,0,0),(11979,1756360222,64,'um dragon lord',0,'um dragon lord',0,0,0),(11969,1756360443,39,'um cyclops',0,'um cyclops',0,0,0),(11983,1756360927,47,'uma ice witch',0,'uma ice witch',0,0,0),(11988,1756361658,60,'um dragon lord',0,'um dragon lord',0,0,0),(11983,1756363480,52,'um bonebeast',0,'um bonebeast',0,0,0),(11939,1756364619,33,'um cyclops',0,'um cyclops',0,0,0),(11969,1756364698,42,'um dragon lord',0,'um dragon',0,0,0),(11969,1756364879,42,'um bonebeast',0,'um bonebeast',0,0,0),(11983,1756364970,54,'um bonebeast',0,'um bonebeast',0,0,0),(11969,1756365320,42,'uma ice witch',0,'uma ice witch',0,0,0),(11940,1756365538,69,'um dragon lord',0,'um dragon lord',0,0,0),(11994,1756366185,66,'um dragon',0,'um dragon',0,0,0),(11988,1756366384,64,'um dragon lord',0,'um dragon lord',0,0,0);
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
INSERT INTO `player_depotitems` VALUES (11936,101,1,2004,1,''),(11936,102,2,2002,1,''),(11936,103,2,2000,1,''),(11936,104,2,1998,1,''),(11936,105,2,2001,1,''),(11936,106,5,5925,3,''),(11936,107,5,5882,7,''),(11936,108,5,5925,100,'d'),(11936,109,5,5878,35,'#'),(11936,110,5,5897,11,''),(11936,111,5,10574,1,''),(11936,112,5,5877,27,''),(11936,113,5,5920,11,''),(11936,114,5,5948,11,''),(11936,115,101,57450,12,''),(11936,116,101,42119,1,''),(11937,101,1,2383,1,''),(11939,101,1,11302,1,''),(11939,102,1,9933,1,''),(11939,103,1,42119,1,''),(11939,104,1,57443,1,''),(11940,101,1,2120,1,''),(11940,102,1,5710,1,''),(11953,101,1,7441,1,''),(11953,102,1,2110,1,''),(11953,103,1,2160,2,''),(11953,104,1,5907,1,''),(11954,101,1,2271,99,'c'),(11954,102,1,2271,100,'d'),(11954,103,1,2271,100,'d'),(11964,101,1,2311,35,'#'),(11964,102,1,2311,100,'d'),(11964,103,1,2311,100,'d'),(11964,104,1,35107,1,''),(11964,105,1,1988,1,''),(11964,106,105,57443,1,''),(11964,107,105,42119,2,''),(11969,101,1,7441,1,''),(11969,102,1,2160,61,'='),(11969,103,1,35110,1,''),(11969,104,1,2271,97,'a'),(11969,105,1,2271,100,'d'),(11969,106,1,2271,100,'d'),(11978,101,1,1988,1,''),(11978,102,101,33083,100,'d\0'),(11978,103,101,33083,100,'d\0'),(11979,101,1,2464,1,''),(11979,102,18,10020,1,''),(11979,103,18,10020,1,''),(11983,101,1,7455,1,''),(11985,101,1,2160,5,''),(11988,101,1,7620,50,'2'),(11988,102,1,7620,100,'d'),(11989,101,1,2515,1,''),(11989,102,1,2455,1,''),(11989,103,1,2503,1,''),(11989,104,1,2502,1,''),(11989,105,2,5878,92,'\\'),(11989,106,2,5878,100,'d'),(11989,107,2,5878,100,'d'),(11989,108,2,5878,100,'d'),(11989,109,2,5878,100,'d'),(11989,110,2,5878,100,'d'),(11989,111,2,2148,41,')'),(11989,112,2,2543,11,''),(11991,101,1,7730,1,''),(11991,102,1,31719,1,''),(11994,101,1,2506,1,''),(11994,102,1,2469,1,''),(11994,103,3,11302,1,''),(11994,104,3,31719,1,''),(11997,101,1,2492,1,''),(11997,102,1,2516,1,''),(11998,101,1,5878,8,''),(11998,102,1,5883,14,''),(11998,103,1,57484,1,''),(11998,104,1,57484,1,''),(12004,101,1,35112,1,''),(12004,102,1,35107,1,''),(12008,101,1,2492,1,''),(12008,102,1,2516,1,''),(12008,103,1,2142,1,''),(12008,104,1,2135,1,''),(12008,105,1,2440,1,''),(12008,106,2,2265,47,'/'),(12008,107,2,2265,100,'d'),(12008,108,2,2265,100,'d'),(12010,101,1,8886,1,''),(12013,101,5,2160,70,'F'),(12013,102,5,7901,1,''),(12013,103,5,11302,1,''),(12013,104,5,9933,1,'');
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
INSERT INTO `player_inboxitems` VALUES (11934,101,0,10513,1,''),(11934,102,0,2522,1,''),(11934,103,0,5804,1,''),(11934,104,0,7730,1,''),(11934,105,0,10513,1,''),(11934,106,0,57411,1,''),(11934,107,0,37646,1,''),(11934,108,0,10513,1,''),(11934,109,0,10513,1,''),(11934,110,0,10513,1,''),(11934,111,0,15643,1,''),(11934,112,0,8877,1,''),(11934,113,0,7730,1,''),(11934,114,0,11302,1,''),(11934,115,0,31719,1,''),(11934,116,0,42119,1,''),(11934,117,0,8887,1,''),(11934,118,0,8877,1,''),(11934,119,0,57484,1,''),(11934,120,0,31719,1,''),(11934,121,0,57450,1,''),(11934,122,0,57484,1,''),(11934,123,0,8886,1,''),(11934,124,0,57444,1,''),(11934,125,0,7730,1,''),(11934,126,0,8877,1,''),(11934,127,0,5804,1,''),(11934,128,0,5804,1,''),(11939,101,0,24331,1,''),(11939,102,0,28310,1,''),(11939,103,0,5804,1,''),(11939,104,0,10513,1,''),(11939,105,0,11302,1,''),(11939,106,0,37646,1,''),(11939,107,0,31719,1,''),(11939,108,0,57428,1,''),(11939,109,0,57440,1,''),(11939,110,0,57445,1,''),(11939,111,0,5804,1,''),(11939,112,0,41872,1,''),(11939,113,0,11302,1,''),(11939,114,0,31719,1,''),(11939,115,0,5804,1,''),(11939,116,0,10513,1,''),(11939,117,0,28310,1,''),(11939,118,0,10513,1,''),(11939,119,0,57445,1,''),(11939,120,0,6132,1,''),(11939,121,0,57484,1,''),(11939,122,0,5804,1,''),(11939,123,0,31719,1,''),(11939,124,0,31719,1,''),(11939,125,0,10513,1,''),(11939,126,0,7730,1,''),(11939,127,0,5804,1,''),(11939,128,0,7730,1,''),(11939,129,0,6132,1,''),(11939,130,0,11302,1,''),(11939,131,0,31719,1,''),(11939,132,0,24331,1,''),(11939,133,0,7730,1,''),(11964,101,0,31719,1,''),(11964,102,0,2466,1,''),(11964,103,0,8877,1,''),(11964,104,0,2466,1,''),(11964,105,0,31719,1,''),(11964,106,0,2522,1,''),(11964,107,0,2466,1,''),(11964,108,0,2466,1,''),(11964,109,0,31719,1,''),(11964,110,0,57448,1,''),(11964,111,0,2466,1,''),(11964,112,0,8877,1,''),(11964,113,0,31719,1,''),(11964,114,0,7730,1,''),(11964,115,0,2466,1,''),(11964,116,0,57411,1,''),(11964,117,0,57428,1,''),(11964,118,0,57428,1,''),(11964,119,0,57445,1,''),(11969,101,0,5804,1,''),(11969,102,0,7730,1,''),(11969,103,0,11302,1,''),(11969,104,0,6132,1,''),(11969,105,0,57445,1,''),(11969,106,0,7730,1,''),(11969,107,0,7730,1,''),(11969,108,0,45150,1,''),(11969,109,0,57445,1,''),(11969,110,0,11302,1,''),(12004,101,0,10513,1,''),(12004,102,0,31719,1,''),(12004,103,0,57445,1,''),(12004,104,0,7730,1,''),(12004,105,0,7730,1,''),(12004,106,0,8877,1,''),(12004,107,0,7730,1,''),(12004,108,0,5804,1,''),(12010,101,0,57445,1,''),(12010,102,0,31719,1,''),(12011,101,0,7730,1,''),(12011,102,0,57445,1,''),(12011,103,0,5804,1,''),(12011,104,0,31719,1,''),(12011,105,0,11302,1,'');
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
INSERT INTO `player_items` VALUES (4,1,101,2461,1,''),(4,3,102,1988,1,'&'),(4,4,103,2652,1,''),(4,5,104,2512,1,''),(4,6,105,5907,1,''),(4,7,106,2649,1,''),(4,8,107,2642,1,''),(4,11,108,26052,1,'&'),(4,102,109,41243,1,''),(4,102,110,2120,1,''),(4,102,111,5710,1,''),(4,102,112,2789,10,'\n'),(3,1,101,2461,1,''),(3,3,102,1988,1,'&'),(3,4,103,2652,1,''),(3,5,104,2512,1,''),(3,6,105,2182,1,''),(3,7,106,2649,1,''),(3,8,107,2642,1,''),(3,11,108,26052,1,'&'),(3,102,109,2120,1,''),(3,102,110,5710,1,''),(3,102,111,2789,10,'\n'),(11935,1,101,2461,1,''),(11935,3,102,1988,1,'&'),(11935,4,103,2652,1,''),(11935,5,104,2512,1,''),(11935,6,105,2448,1,''),(11935,7,106,2649,1,''),(11935,8,107,2642,1,''),(11935,11,108,26052,1,''),(11935,102,109,5710,1,''),(11935,102,110,2120,1,''),(11935,102,111,2789,10,'\n'),(5,1,101,2461,1,''),(5,3,102,1988,1,'&'),(5,4,103,2652,1,''),(5,5,104,2512,1,''),(5,6,105,2376,1,''),(5,7,106,2649,1,''),(5,8,107,2642,1,''),(5,11,108,26052,1,'&'),(5,102,109,2789,10,'\n'),(5,102,110,5710,1,''),(5,102,111,2120,1,''),(11931,1,101,2461,1,''),(11931,3,102,1988,1,'&'),(11931,4,103,2652,1,''),(11931,5,104,2512,1,''),(11931,6,105,2386,1,''),(11931,7,106,2649,1,''),(11931,8,107,2642,1,''),(11931,11,108,26052,1,''),(11931,102,109,5710,1,''),(11931,102,110,2120,1,''),(11931,102,111,2789,10,'\n'),(2,1,101,2461,1,''),(2,3,102,1988,1,'&'),(2,4,103,2652,1,''),(2,5,104,2512,1,''),(2,6,105,2190,1,''),(2,7,106,2649,1,''),(2,8,107,2642,1,''),(2,11,108,26052,1,'&'),(2,102,109,2120,1,''),(2,102,110,5710,1,''),(2,102,111,2789,10,'\n'),(11930,1,101,2461,1,''),(11930,3,102,1988,1,'&'),(11930,4,103,2652,1,''),(11930,5,104,2512,1,''),(11930,6,105,5907,1,''),(11930,7,106,2649,1,''),(11930,8,107,2642,1,''),(11930,11,108,26052,1,''),(11930,102,109,41243,1,''),(11930,102,110,2789,10,'\n'),(11930,102,111,5710,1,''),(11930,102,112,2120,1,''),(11944,1,101,2461,1,''),(11944,3,102,1988,1,'&'),(11944,4,103,2652,1,''),(11944,5,104,2512,1,''),(11944,6,105,2448,1,''),(11944,7,106,2649,1,''),(11944,8,107,2642,1,''),(11944,11,108,26052,1,''),(11944,102,109,5710,1,''),(11944,102,110,2120,1,''),(11944,102,111,2789,10,'\n'),(11945,1,101,2461,1,''),(11945,3,102,1988,1,'&'),(11945,4,103,2652,1,''),(11945,5,104,2512,1,''),(11945,6,105,2448,1,''),(11945,7,106,2649,1,''),(11945,8,107,2642,1,''),(11945,11,108,26052,1,''),(11945,102,109,5710,1,''),(11945,102,110,2120,1,''),(11945,102,111,2789,10,'\n'),(11946,1,101,2461,1,''),(11946,3,102,1988,1,'&'),(11946,4,103,2652,1,''),(11946,5,104,2512,1,''),(11946,6,105,5907,1,''),(11946,7,106,2649,1,''),(11946,8,107,2642,1,''),(11946,11,108,26052,1,''),(11946,102,109,41243,1,''),(11946,102,110,2789,10,'\n'),(11946,102,111,5710,1,''),(11946,102,112,2120,1,''),(11949,1,101,2461,1,''),(11949,3,102,1988,1,'&'),(11949,4,103,2652,1,''),(11949,5,104,2512,1,''),(11949,6,105,5907,1,''),(11949,7,106,2649,1,''),(11949,8,107,2642,1,''),(11949,11,108,26052,1,''),(11949,102,109,41243,1,''),(11949,102,110,2789,10,'\n'),(11949,102,111,5710,1,''),(11949,102,112,2120,1,''),(11950,1,101,2461,1,''),(11950,3,102,1988,1,'&'),(11950,4,103,2652,1,''),(11950,5,104,2512,1,''),(11950,6,105,5907,1,''),(11950,7,106,2649,1,''),(11950,8,107,2642,1,''),(11950,11,108,26052,1,''),(11950,102,109,41243,1,''),(11950,102,110,2789,10,'\n'),(11950,102,111,5710,1,''),(11950,102,112,2120,1,''),(11951,1,101,2461,1,''),(11951,3,102,1988,1,'&'),(11951,4,103,2652,1,''),(11951,5,104,2512,1,''),(11951,6,105,5907,1,''),(11951,7,106,2649,1,''),(11951,8,107,2642,1,''),(11951,11,108,26052,1,''),(11951,102,109,41243,1,''),(11951,102,110,2789,10,'\n'),(11951,102,111,5710,1,''),(11951,102,112,2120,1,''),(11952,1,101,2461,1,''),(11952,3,102,1988,1,'&'),(11952,4,103,2652,1,''),(11952,5,104,2512,1,''),(11952,6,105,2190,1,''),(11952,7,106,2649,1,''),(11952,8,107,2642,1,''),(11952,11,108,26052,1,'&'),(11952,102,109,2120,1,''),(11952,102,110,5710,1,''),(11952,102,111,2789,10,'\n'),(11955,1,101,2461,1,''),(11955,3,102,1988,1,'&'),(11955,4,103,2652,1,''),(11955,5,104,2512,1,''),(11955,6,105,2386,1,''),(11955,7,106,2649,1,''),(11955,8,107,2642,1,''),(11955,11,108,26052,1,''),(11955,102,109,5710,1,''),(11955,102,110,2120,1,''),(11955,102,111,2789,10,'\n'),(11958,1,101,2461,1,''),(11958,3,102,1988,1,'&'),(11958,4,103,2652,1,''),(11958,5,104,2512,1,''),(11958,6,105,2448,1,''),(11958,7,106,2649,1,''),(11958,8,107,2642,1,''),(11958,11,108,26052,1,''),(11958,102,109,5710,1,''),(11958,102,110,2120,1,''),(11958,102,111,2789,10,'\n'),(11961,1,101,2461,1,''),(11961,3,102,1988,1,'&'),(11961,4,103,2652,1,''),(11961,5,104,2512,1,''),(11961,6,105,5907,1,''),(11961,7,106,2649,1,''),(11961,8,107,2642,1,''),(11961,11,108,26052,1,'&'),(11961,102,109,41243,1,''),(11961,102,110,2120,1,''),(11961,102,111,5710,1,''),(11961,102,112,2789,10,'\n'),(11962,1,101,2461,1,''),(11962,3,102,1988,1,'&'),(11962,4,103,2652,1,''),(11962,5,104,2512,1,''),(11962,6,105,5907,1,''),(11962,7,106,2649,1,''),(11962,8,107,2642,1,''),(11962,11,108,26052,1,''),(11962,102,109,41243,1,''),(11962,102,110,2789,10,'\n'),(11962,102,111,5710,1,''),(11962,102,112,2120,1,''),(11963,1,101,2461,1,''),(11963,3,102,1988,1,'&'),(11963,4,103,2652,1,''),(11963,5,104,2512,1,''),(11963,6,105,5907,1,''),(11963,7,106,2649,1,''),(11963,8,107,2642,1,''),(11963,11,108,26052,1,''),(11963,102,109,41243,1,''),(11963,102,110,2789,10,'\n'),(11963,102,111,5710,1,''),(11963,102,112,2120,1,''),(11966,1,101,2461,1,''),(11966,3,102,1988,1,'&'),(11966,4,103,2652,1,''),(11966,5,104,2512,1,''),(11966,6,105,5907,1,''),(11966,7,106,2649,1,''),(11966,8,107,2642,1,''),(11966,11,108,26052,1,''),(11966,102,109,41243,1,''),(11966,102,110,2789,10,'\n'),(11966,102,111,5710,1,''),(11966,102,112,2120,1,''),(11973,1,101,2461,1,''),(11973,3,102,1988,1,'&'),(11973,4,103,2652,1,''),(11973,5,104,2512,1,''),(11973,6,105,2190,1,''),(11973,7,106,2649,1,''),(11973,8,107,2642,1,''),(11973,11,108,26052,1,'&'),(11973,102,109,2120,1,''),(11973,102,110,5710,1,''),(11973,102,111,2789,10,'\n'),(11977,1,101,2461,1,''),(11977,3,102,1988,1,'&'),(11977,4,103,2652,1,''),(11977,5,104,2512,1,''),(11977,6,105,2448,1,''),(11977,7,106,2649,1,''),(11977,8,107,2642,1,''),(11977,11,108,26052,1,''),(11977,102,109,5710,1,''),(11977,102,110,2120,1,''),(11977,102,111,2789,10,'\n'),(11980,1,101,2461,1,''),(11980,3,102,1988,1,'&'),(11980,4,103,2652,1,''),(11980,5,104,2512,1,''),(11980,6,105,2376,1,''),(11980,7,106,2649,1,''),(11980,8,107,2642,1,''),(11980,11,108,26052,1,'&'),(11980,102,109,2789,10,'\n'),(11980,102,110,5710,1,''),(11980,102,111,2120,1,''),(11938,1,101,2461,1,''),(11938,3,102,1988,1,'&'),(11938,4,103,2652,1,''),(11938,5,104,2512,1,''),(11938,6,105,2182,1,''),(11938,7,106,2649,1,''),(11938,8,107,2642,1,''),(11938,11,108,26052,1,'&\0'),(11938,102,109,2120,1,''),(11938,102,110,5710,1,''),(11938,102,111,2789,10,'\n'),(11959,1,101,2461,1,''),(11959,3,102,1988,1,'&'),(11959,4,103,2652,1,''),(11959,5,104,2512,1,''),(11959,6,105,2448,1,''),(11959,7,106,2649,1,''),(11959,8,107,2642,1,''),(11959,11,108,26052,1,''),(11959,102,109,5710,1,''),(11959,102,110,2120,1,''),(11959,102,111,2789,10,'\n'),(11995,1,101,2461,1,''),(11995,3,102,1988,1,'&'),(11995,4,103,2652,1,''),(11995,5,104,2512,1,''),(11995,6,105,2448,1,''),(11995,7,106,2649,1,''),(11995,8,107,2642,1,''),(11995,11,108,26052,1,''),(11995,102,109,5710,1,''),(11995,102,110,2120,1,''),(11995,102,111,2789,7,''),(11990,1,101,2461,1,''),(11990,3,102,1988,1,'&'),(11990,4,103,2652,1,''),(11990,5,104,2512,1,''),(11990,6,105,2190,1,''),(11990,7,106,2649,1,''),(11990,8,107,2642,1,''),(11990,11,108,26052,1,'&'),(11990,102,109,2120,1,''),(11990,102,110,5710,1,''),(11957,1,101,2461,1,''),(11957,3,102,1988,1,'&'),(11957,4,103,2652,1,''),(11957,5,104,2512,1,''),(11957,6,105,2448,1,''),(11957,7,106,2649,1,''),(11957,8,107,2642,1,''),(11957,11,108,26052,1,''),(11957,102,109,5710,1,''),(11957,102,110,2120,1,''),(11957,102,111,2789,10,'\n'),(12001,1,101,2461,1,''),(12001,3,102,1988,1,'&'),(12001,4,103,2652,1,''),(12001,5,104,2512,1,''),(12001,6,105,2182,1,''),(12001,7,106,2649,1,''),(12001,8,107,2642,1,''),(12001,11,108,26052,1,'&'),(12001,102,109,2120,1,''),(12001,102,110,5710,1,''),(12001,102,111,2789,10,'\n'),(12007,1,101,2461,1,''),(12007,3,102,1988,1,'&'),(12007,4,103,2652,1,''),(12007,5,104,2512,1,''),(12007,6,105,5907,1,''),(12007,7,106,2649,1,''),(12007,8,107,2642,1,''),(12007,11,108,26052,1,''),(12007,102,109,41243,1,''),(12007,102,110,2789,10,'\n'),(12007,102,111,5710,1,''),(12007,102,112,2120,1,''),(11942,1,101,2480,1,''),(11942,3,102,1988,1,'&'),(11942,4,103,2465,1,''),(11942,5,104,2529,1,''),(11942,6,105,2429,1,''),(11942,7,106,2478,1,''),(11942,8,107,2643,1,''),(11942,11,108,26052,1,''),(11942,102,109,2148,21,''),(11942,102,110,5897,2,''),(11942,102,111,2152,3,''),(11942,102,112,5710,1,''),(11942,102,113,2120,1,''),(11942,102,114,2789,1,''),(11972,1,101,2461,1,''),(11972,3,102,1988,1,'&'),(11972,4,103,2652,1,''),(11972,5,104,2512,1,''),(11972,6,105,5907,1,''),(11972,7,106,2649,1,''),(11972,8,107,2642,1,''),(11972,11,108,26052,1,'&\0'),(11972,102,109,2672,2,''),(11972,102,110,41243,1,''),(11972,102,111,2120,1,''),(11972,102,112,5710,1,''),(11972,108,113,33085,14,'\0:Ç'),(12017,1,101,2461,1,''),(12017,3,102,1988,1,'&'),(12017,4,103,2652,1,''),(12017,5,104,2512,1,''),(12017,6,105,2386,1,''),(12017,7,106,2649,1,''),(12017,8,107,2642,1,''),(12017,11,108,26052,1,''),(12017,102,109,5710,1,''),(12017,102,110,2120,1,''),(12017,102,111,2789,10,'\n'),(11960,1,101,2461,1,''),(11960,3,102,1988,1,'&'),(11960,4,103,2652,1,''),(11960,5,104,2512,1,''),(11960,6,105,5907,1,''),(11960,7,106,2649,1,''),(11960,8,107,2642,1,''),(11960,11,108,26052,1,'&'),(11960,102,109,2148,4,''),(11960,102,110,41243,1,''),(11960,102,111,2120,1,''),(11960,102,112,5710,1,''),(11960,102,113,2789,3,''),(12002,1,101,2461,1,''),(12002,3,102,1988,1,'&'),(12002,4,103,2652,1,''),(12002,5,104,2512,1,''),(12002,6,105,5907,1,''),(12002,7,106,2649,1,''),(12002,8,107,2642,1,''),(12002,11,108,26052,1,'&'),(12002,102,109,2190,1,''),(12002,102,110,2120,1,''),(12002,102,111,5710,1,''),(12000,1,101,2461,1,''),(12000,3,102,1988,1,'&'),(12000,4,103,2652,1,''),(12000,5,104,2512,1,''),(12000,6,105,5907,1,''),(12000,7,106,2649,1,''),(12000,8,107,2642,1,''),(12000,11,108,26052,1,'&'),(12000,102,109,2182,1,''),(12000,102,110,2120,1,''),(12000,102,111,5710,1,''),(11974,1,101,2481,1,''),(11974,3,102,1988,1,'&'),(11974,4,103,2483,1,''),(11974,5,104,2510,1,''),(11974,6,105,2182,1,''),(11974,7,106,2648,1,''),(11974,8,107,2642,1,''),(11974,11,108,26052,1,'&\0'),(11974,102,109,2148,55,'7'),(11974,102,110,2152,7,''),(11974,102,111,7620,89,'Y'),(11974,102,112,2288,1,''),(11974,102,113,5878,33,'!'),(11974,102,114,2389,1,''),(11974,102,115,2120,1,''),(11974,102,116,5710,1,''),(11974,108,117,33086,500,'Ù:Ç'),(11941,1,101,2461,1,''),(11941,3,102,1988,1,'&'),(11941,4,103,2652,1,''),(11941,5,104,2512,1,''),(11941,6,105,2386,1,''),(11941,7,106,2649,1,''),(11941,8,107,2642,1,''),(11941,11,108,26052,1,''),(11941,102,109,5710,1,''),(11941,102,110,2120,1,''),(11941,102,111,2789,10,'\n'),(12010,1,101,2461,1,''),(12010,3,102,1988,1,'&'),(12010,4,103,2652,1,''),(12010,5,104,2511,1,''),(12010,6,105,2448,1,''),(12010,7,106,2649,1,''),(12010,8,107,2642,1,''),(12010,11,108,26052,1,''),(12010,102,109,10513,1,''),(12010,102,110,5710,1,''),(12010,102,111,2120,1,''),(12010,102,112,2789,5,''),(12009,1,101,2461,1,''),(12009,3,102,1988,1,'&'),(12009,4,103,2652,1,''),(12009,5,104,2512,1,''),(12009,6,105,5907,1,''),(12009,7,106,2649,1,''),(12009,8,107,2642,1,''),(12009,11,108,26052,1,'&'),(12009,102,109,41243,1,''),(12009,102,110,2120,1,''),(12009,102,111,5710,1,''),(12009,102,112,2789,6,''),(12009,108,113,26377,1,''),(12019,1,101,2461,1,''),(12019,3,102,1988,1,'&'),(12019,4,103,2652,1,''),(12019,5,104,2512,1,''),(12019,6,105,2182,1,''),(12019,7,106,2649,1,''),(12019,8,107,2642,1,''),(12019,11,108,26052,1,'&'),(12019,102,109,2120,1,''),(12019,102,110,5710,1,''),(12019,102,111,2789,5,''),(11975,1,101,2461,1,''),(11975,3,102,1988,1,'&\0'),(11975,4,103,2652,1,''),(11975,5,104,2512,1,''),(11975,6,105,2182,1,''),(11975,7,106,2649,1,''),(11975,8,107,2642,1,''),(11975,11,108,26052,1,'&'),(11975,102,109,2120,1,''),(11975,102,110,5710,1,''),(11975,102,111,2789,5,''),(11996,1,101,2461,1,''),(11996,3,102,1988,1,'&'),(11996,4,103,2652,1,''),(11996,5,104,2512,1,''),(11996,6,105,2182,1,''),(11996,7,106,2649,1,''),(11996,8,107,2642,1,''),(11996,11,108,26052,1,'&'),(11996,102,109,2120,1,''),(11996,102,110,5710,1,''),(11996,102,111,2789,9,'	'),(12014,1,101,2458,1,''),(12014,3,102,1988,1,'&'),(12014,4,103,2464,1,''),(12014,5,104,2512,1,''),(12014,6,105,5907,1,''),(12014,7,106,2649,1,''),(12014,8,107,2642,1,''),(12014,11,108,26052,1,'&'),(12014,102,109,41243,1,''),(12014,102,110,2120,1,''),(12014,102,111,5710,1,''),(12014,102,112,2789,6,''),(11956,1,101,2473,1,''),(11956,3,102,1988,1,'&'),(11956,4,103,2652,1,''),(11956,5,104,2512,1,''),(11956,6,105,2429,1,''),(11956,7,106,2649,1,''),(11956,8,107,2642,1,''),(11956,11,108,26052,1,''),(11956,102,109,2428,1,''),(11956,102,110,2789,47,'/'),(11956,102,111,2148,5,''),(11956,102,112,2152,17,''),(11956,102,113,2265,30,''),(11956,102,114,5710,1,''),(11956,102,115,2120,1,''),(12015,1,101,2461,1,''),(12015,3,102,1988,1,'&'),(12015,4,103,2464,1,''),(12015,5,104,2512,1,''),(12015,6,105,2182,1,''),(12015,7,106,2649,1,''),(12015,8,107,2642,1,''),(12015,11,108,26052,1,'&'),(12015,102,109,2120,1,''),(12015,102,110,5710,1,''),(12015,108,111,33086,500,'Ù:Ç'),(12006,1,101,2461,1,''),(12006,3,102,1988,1,'&'),(12006,4,103,2652,1,''),(12006,5,104,2512,1,''),(12006,6,105,5907,1,''),(12006,7,106,2649,1,''),(12006,8,107,2642,1,''),(12006,11,108,26052,1,''),(12006,102,109,41243,1,''),(12006,102,110,2789,9,'	'),(12006,102,111,5710,1,''),(12006,102,112,2120,1,''),(12011,1,101,2461,1,''),(12011,3,102,1988,1,'&'),(12011,4,103,2652,1,''),(12011,5,104,2512,1,''),(12011,6,105,2409,1,''),(12011,7,106,2649,1,''),(12011,8,107,2642,1,''),(12011,11,108,26052,1,'&'),(12011,102,109,2376,1,''),(12011,102,110,2148,10,'\n'),(12011,102,111,2152,56,'8'),(12011,102,112,2789,6,''),(12011,102,113,2160,24,''),(12011,102,114,2789,50,'2'),(12011,102,115,5710,1,''),(12011,102,116,2120,1,''),(11981,1,101,2458,1,''),(11981,3,102,1988,1,'&'),(11981,4,103,2464,1,''),(11981,5,104,2511,1,''),(11981,6,105,2185,1,''),(11981,7,106,2468,1,''),(11981,8,107,2642,1,''),(11981,11,108,26052,1,'&'),(11981,102,109,7620,16,''),(11981,102,110,2789,87,'W'),(11981,102,111,2182,1,''),(11981,102,112,7620,100,'d'),(11981,102,113,5878,3,''),(11981,102,114,2120,1,''),(11981,102,115,5710,1,''),(12003,1,101,2461,1,''),(12003,3,102,1988,1,'&'),(12003,4,103,2652,1,''),(12003,5,104,2512,1,''),(12003,6,105,2386,1,''),(12003,7,106,2649,1,''),(12003,8,107,2642,1,''),(12003,11,108,26052,1,''),(12003,102,109,5710,1,''),(12003,102,110,2120,1,''),(12003,102,111,2789,1,''),(11948,3,101,1988,1,'&'),(11948,4,102,2652,1,''),(11948,5,103,2512,1,''),(11948,6,104,2190,1,''),(11948,7,105,2649,1,''),(11948,8,106,2642,1,''),(11948,11,107,26052,1,'&'),(11948,101,108,2152,47,'/'),(11948,101,109,2160,3,''),(11948,101,110,7620,42,'*'),(11948,101,111,2789,34,'\"'),(11948,101,112,2086,1,'“'),(11948,101,113,7620,100,'d'),(11948,101,114,2120,1,''),(11948,101,115,5710,1,''),(11987,1,101,2461,1,''),(11987,3,102,1988,1,'&'),(11987,4,103,2652,1,''),(11987,5,104,2510,1,''),(11987,6,105,2182,1,''),(11987,7,106,2649,1,''),(11987,8,107,2642,1,''),(11987,11,108,26052,1,'&'),(11987,102,109,2148,17,''),(11987,102,110,5878,3,''),(11987,102,111,2120,1,''),(11987,102,112,5710,1,''),(11987,108,113,33086,7723,'+'),(11986,1,101,2461,1,''),(11986,3,102,1988,1,'&\0'),(11986,4,103,7463,1,''),(11986,5,104,2513,1,''),(11986,6,105,2190,1,''),(11986,7,106,7464,1,''),(11986,8,107,2642,1,''),(11986,11,108,26052,1,'&\0'),(11986,102,109,5878,3,''),(11986,102,110,2789,16,''),(11986,102,111,2789,100,'d'),(11986,102,112,2148,81,'Q'),(11986,102,113,21310,1,''),(11986,102,114,2152,16,''),(11986,102,115,7620,31,''),(11986,102,116,2129,100,'d\0'),(11986,102,117,2129,100,'d\0'),(11986,102,118,5879,1,''),(11986,102,119,10567,1,''),(11986,102,120,7620,100,'d'),(11986,102,121,2502,1,''),(11986,102,122,2120,1,''),(11986,102,123,5710,1,''),(12021,1,101,2461,1,''),(12021,3,102,1988,1,'&'),(12021,4,103,2652,1,''),(12021,5,104,2512,1,''),(12021,6,105,5907,1,''),(12021,7,106,2649,1,''),(12021,8,107,2642,1,''),(12021,11,108,26052,1,''),(12021,102,109,41243,1,''),(12021,102,110,2789,5,''),(12021,102,111,5710,1,''),(12021,102,112,2120,1,''),(11964,1,101,2490,1,''),(11964,3,102,1988,1,'&\0'),(11964,4,103,2483,1,''),(11964,5,104,2175,1,''),(11964,6,105,7381,1,''),(11964,7,106,2648,1,''),(11964,8,107,2642,1,''),(11964,11,108,26052,1,'&\0'),(11964,102,109,2148,54,'6'),(11964,102,110,2003,1,'&\0'),(11964,102,111,2209,1,'›\0'),(11964,102,112,2265,25,''),(11964,102,113,2265,100,'d'),(11964,102,114,2152,83,'S'),(11964,102,115,2304,49,'1'),(11964,102,116,7620,54,'6'),(11964,102,117,2789,89,'Y'),(11964,102,118,2265,100,'d'),(11964,102,119,2160,47,'/'),(11964,102,120,5710,1,''),(11964,102,121,2120,1,''),(11964,102,122,2789,96,'`'),(11964,108,123,26377,1,'&\0'),(11964,108,124,33086,9878,'ñ&'),(11964,108,125,33084,8402,'“ '),(11964,108,126,33084,92,'\\\0:Ç'),(11964,123,127,2148,90,'Z'),(11968,1,101,2481,1,''),(11968,3,102,1988,1,'&'),(11968,4,103,2463,1,''),(11968,5,104,6131,1,''),(11968,6,105,5907,1,''),(11968,7,106,2647,1,''),(11968,8,107,2642,1,''),(11968,11,108,26052,1,'&'),(11968,102,109,41243,1,'&\0'),(11968,102,110,2456,1,''),(11968,102,111,2209,1,''),(11968,102,112,2148,33,'!'),(11968,102,113,2209,1,''),(11968,102,114,2671,3,''),(11968,102,115,2152,8,''),(11968,102,116,5710,1,''),(11968,102,117,2120,1,''),(11968,109,118,2544,19,''),(11968,109,119,2544,100,'d'),(11982,1,101,2461,1,''),(11982,3,102,1988,1,'&'),(11982,4,103,2652,1,''),(11982,5,104,2512,1,''),(11982,6,105,2190,1,''),(11982,7,106,2649,1,''),(11982,8,107,2642,1,''),(11982,11,108,26052,1,'&'),(11982,102,109,2120,1,''),(11982,102,110,5710,1,''),(11982,102,111,2789,10,'\n'),(11967,1,101,2461,1,''),(11967,3,102,1988,1,'&'),(11967,4,103,2652,1,''),(11967,5,104,2512,1,''),(11967,6,105,2386,1,''),(11967,7,106,2649,1,''),(11967,8,107,2642,1,''),(11967,11,108,26052,1,'&'),(11967,102,109,2148,7,''),(11967,102,110,2152,2,''),(11967,102,111,2666,16,''),(11967,102,112,5710,1,''),(11967,102,113,2120,1,''),(12016,1,101,2461,1,''),(12016,3,102,1988,1,'&'),(12016,4,103,2652,1,''),(12016,5,104,2512,1,''),(12016,6,105,2389,1,''),(12016,7,106,2649,1,''),(12016,8,107,2642,1,''),(12016,11,108,26052,1,'&'),(12016,102,109,2148,52,'4'),(12016,102,110,7620,24,''),(12016,102,111,2672,4,''),(12016,102,112,41243,1,''),(12016,102,113,2120,1,''),(12016,102,114,5710,1,''),(11978,1,101,2461,1,''),(11978,3,102,1988,1,'&'),(11978,4,103,2483,1,''),(11978,5,104,2510,1,''),(11978,6,105,2429,1,''),(11978,7,106,2649,1,''),(11978,8,107,2642,1,''),(11978,11,108,26052,1,'&\0'),(11978,102,109,2465,1,''),(11978,102,110,2148,63,'?'),(11978,102,111,2789,60,'<'),(11978,102,112,2152,63,'?'),(11978,102,113,33083,73,'I\0'),(11978,102,114,2160,1,''),(11978,102,115,5710,1,''),(11978,102,116,2120,1,''),(11965,1,101,2490,1,''),(11965,2,102,2129,70,'F\0'),(11965,3,103,1988,1,'&\0'),(11965,4,104,2465,1,''),(11965,5,105,6131,1,''),(11965,6,106,2185,1,''),(11965,7,107,2478,1,''),(11965,8,108,2643,1,''),(11965,11,109,26052,1,'&'),(11965,103,110,2789,60,'<'),(11965,103,111,2120,1,''),(11965,103,112,5710,1,''),(12012,1,101,2461,1,''),(12012,3,102,1988,1,'&'),(12012,4,103,2652,1,''),(12012,5,104,2512,1,''),(12012,6,105,2182,1,''),(12012,7,106,2649,1,''),(12012,8,107,2642,1,''),(12012,11,108,26052,1,'&\0'),(12012,102,109,2148,3,''),(12012,102,110,2120,1,''),(12012,102,111,5710,1,''),(12012,102,112,2789,9,'	'),(11976,1,101,2481,1,''),(11976,3,102,1988,1,'&'),(11976,4,103,2463,1,''),(11976,5,104,41243,1,'&'),(11976,6,105,2456,1,''),(11976,7,106,2649,1,''),(11976,8,107,2642,1,''),(11976,11,108,26052,1,'&\0'),(11976,102,109,2231,1,''),(11976,102,110,2148,68,'D'),(11976,102,111,7364,2,''),(11976,102,112,2152,21,''),(11976,102,113,7620,74,'J'),(11976,102,114,2004,1,''),(11976,102,115,2001,1,''),(11976,102,116,7839,1,''),(11976,102,117,7365,1,''),(11976,102,118,2789,57,'9'),(11976,102,119,5925,2,''),(11976,102,120,2265,17,''),(11976,102,121,2160,4,''),(11976,102,122,5878,4,''),(11976,102,123,2789,100,'d'),(11976,102,124,5710,1,''),(11976,102,125,2120,1,''),(11976,104,126,2544,82,'R'),(11976,114,127,2541,1,''),(11976,114,128,5907,1,''),(11976,114,129,2513,1,''),(11976,114,130,2381,1,''),(11976,115,131,7620,44,','),(12013,1,101,2461,1,''),(12013,3,102,1988,1,'&'),(12013,4,103,2652,1,''),(12013,5,104,2512,1,''),(12013,6,105,2376,1,''),(12013,7,106,2649,1,''),(12013,8,107,2195,1,''),(12013,11,108,26052,1,'&'),(12013,102,109,2148,10,'\n'),(12013,102,110,2152,16,''),(12013,102,111,2789,8,''),(12013,102,112,5710,1,''),(12013,102,113,2120,1,''),(12013,108,114,33082,6726,'F\Z'),(12013,108,115,26377,1,''),(12004,3,101,1987,1,'&'),(12004,4,102,2505,1,''),(12004,5,103,2512,1,''),(12004,6,104,2389,1,''),(12004,7,105,2507,1,''),(12004,8,106,2195,1,''),(12004,11,107,26052,1,'&'),(12004,107,108,33085,8045,'m'),(11954,1,101,2461,1,''),(11954,3,102,1988,1,'&'),(11954,4,103,2652,1,''),(11954,5,104,2512,1,''),(11954,6,105,2185,1,''),(11954,7,106,2649,1,''),(11954,8,107,2642,1,''),(11954,11,108,26052,1,'&\0'),(11954,102,109,2148,7,''),(11954,102,110,2152,36,'$'),(11954,102,111,7620,48,'0'),(11954,102,112,2160,7,''),(11954,102,113,2120,1,''),(11954,102,114,5710,1,''),(11939,3,101,1988,1,'&'),(11939,4,102,2652,1,''),(11939,5,103,2512,1,''),(11939,6,104,2182,1,''),(11939,7,105,2649,1,''),(11939,8,106,2195,1,''),(11939,11,107,26052,1,'&'),(11939,101,108,2152,48,'0'),(11939,101,109,2461,1,''),(11939,101,110,2160,24,''),(11939,101,111,20620,1,''),(11939,101,112,33087,1667,'É'),(11939,107,113,33086,9504,' %'),(11939,111,114,10513,1,''),(11988,1,101,2490,1,''),(11988,3,102,57440,1,'&'),(11988,4,103,2652,1,''),(11988,5,104,2516,1,''),(11988,6,105,2181,1,''),(11988,7,106,2647,1,''),(11988,8,107,2640,1,'\0∫€\0'),(11988,11,108,26052,1,'&'),(11988,102,109,2148,30,''),(11988,102,110,2152,19,''),(11988,102,111,1988,1,'&'),(11988,102,112,5710,1,''),(11988,102,113,2120,1,''),(11988,102,114,2789,8,''),(11988,102,115,7620,78,'N'),(11988,102,116,2160,1,''),(11988,108,117,26377,1,'&\0'),(11994,1,101,2490,1,''),(11994,3,102,1988,1,'&\0'),(11994,4,103,2652,1,''),(11994,5,104,2516,1,''),(11994,6,105,2435,1,''),(11994,7,106,2647,1,''),(11994,8,107,2195,1,''),(11994,11,108,26052,1,'&\0'),(11994,102,109,2152,31,''),(11994,102,110,2148,18,''),(11994,102,111,2516,1,''),(11994,102,112,7620,51,'3'),(11994,102,113,2172,100,'d\0'),(11994,102,114,2160,52,'4'),(11994,102,115,1988,1,'&\0'),(11994,102,116,5710,1,''),(11994,102,117,2120,1,''),(11994,108,118,33086,4859,'˚'),(11994,108,119,26377,1,'&\0'),(11994,115,120,2273,100,'d'),(11994,115,121,2273,100,'d'),(11994,115,122,2273,100,'d'),(11994,115,123,2273,100,'d'),(11994,119,124,2148,38,'&'),(11994,119,125,2392,1,''),(11994,119,126,2392,1,''),(11994,119,127,2392,1,''),(11994,119,128,2516,1,''),(11994,119,129,2516,1,''),(11994,119,130,2516,1,''),(11994,119,131,2492,1,''),(11994,119,132,2516,1,''),(11994,119,133,2492,1,''),(11994,119,134,2516,1,''),(11994,119,135,2506,1,''),(11994,119,136,2392,1,''),(11994,119,137,2647,1,''),(11994,119,138,2647,1,''),(11994,119,139,10574,3,''),(11969,1,101,2461,1,''),(11969,3,102,57440,1,'&'),(11969,4,103,2652,1,''),(11969,5,104,2512,1,''),(11969,7,105,2649,1,''),(11969,8,106,2195,1,''),(11969,11,107,26052,1,'&\0'),(11969,102,108,2188,1,''),(11969,102,109,2148,93,']'),(11969,102,110,2152,49,'1'),(11969,102,111,2268,22,''),(11969,102,112,2268,100,'d'),(11969,102,113,2268,100,'d'),(11969,102,114,10513,1,''),(11969,102,115,2268,100,'d'),(11969,102,116,2789,33,'!'),(11969,102,117,2789,94,'^'),(11969,102,118,2789,100,'d'),(11969,102,119,2789,100,'d'),(11969,102,120,7620,61,'='),(11983,1,101,2461,1,''),(11983,2,102,2173,1,'\0'),(11983,3,103,1988,1,'&'),(11983,4,104,2652,1,''),(11983,5,105,2512,1,''),(11983,6,106,5907,1,''),(11983,7,107,2649,1,''),(11983,8,108,2195,1,''),(11983,11,109,26052,1,''),(11983,103,110,2796,1,''),(11983,103,111,2148,42,'*'),(11983,103,112,7387,1,''),(11983,103,113,2152,6,''),(11983,103,114,2160,1,''),(11983,103,115,7387,1,''),(11983,103,116,2445,1,''),(11983,103,117,2796,100,'d'),(11983,103,118,2000,1,''),(11983,103,119,2796,88,'X'),(11983,103,120,2787,18,''),(11983,118,121,7441,1,''),(11983,118,122,2265,91,'['),(11983,118,123,2120,1,''),(11983,118,124,5710,1,''),(11983,118,125,41243,1,''),(11983,118,126,2173,1,'\0'),(11983,118,127,7620,17,''),(11983,118,128,7620,100,'d'),(11983,118,129,7620,100,'d'),(11983,118,130,7620,100,'d'),(11936,1,101,7903,1,''),(11936,3,102,1988,1,'&'),(11936,4,103,7463,1,''),(11936,5,104,6131,1,''),(11936,6,105,2189,1,''),(11936,7,106,7464,1,''),(11936,8,107,2643,1,''),(11936,11,108,26052,1,'&'),(11936,102,109,2148,73,'I'),(11936,102,110,2152,92,'\\'),(11936,102,111,2002,1,'&'),(11936,102,112,7620,36,'$'),(11936,102,113,2160,5,''),(11936,102,114,2120,1,''),(11936,102,115,5710,1,''),(11936,108,116,33087,7272,'h'),(11936,108,117,26377,1,'&'),(11936,111,118,2274,28,''),(11936,111,119,2274,100,'d'),(11936,111,120,2274,100,'d'),(11936,111,121,2274,100,'d'),(11936,111,122,2274,100,'d'),(11937,1,101,2502,1,''),(11937,3,102,1988,1,'&'),(11937,4,103,2463,1,''),(11937,5,104,2516,1,''),(11937,6,105,2392,1,''),(11937,7,106,2647,1,''),(11937,8,107,2642,1,''),(11937,11,108,26052,1,'&\0'),(11937,102,109,5925,40,'('),(11937,102,110,6131,1,''),(11937,102,111,2152,28,''),(11937,102,112,2265,37,'%'),(11937,102,113,5710,1,''),(11937,102,114,2120,1,''),(11979,1,101,2502,1,''),(11979,3,102,1988,1,'&'),(11979,4,103,2505,1,''),(11979,5,104,2516,1,''),(11979,6,105,2436,1,''),(11979,7,106,2504,1,''),(11979,11,107,26052,1,'&\0'),(11979,102,108,2152,90,'Z'),(11979,102,109,2148,23,''),(11979,102,110,57445,1,''),(11979,102,111,2160,27,''),(11979,102,112,2086,1,'‘'),(11979,107,113,26377,1,'&'),(11979,107,114,33084,8366,'Æ '),(11979,107,115,33084,400,'ê:Ç'),(11979,113,116,2148,30,''),(11979,113,117,10020,1,''),(11979,113,118,2414,1,''),(11979,113,119,2414,1,''),(11979,113,120,2516,1,''),(11979,113,121,2392,1,''),(11979,113,122,2392,1,''),(11979,113,123,2387,1,''),(11979,113,124,2469,1,''),(11979,113,125,2392,1,''),(11979,113,126,2392,1,''),(11979,113,127,2516,1,''),(11979,113,128,2469,1,''),(11979,113,129,2392,1,''),(11979,113,130,2392,1,''),(11979,113,131,2516,1,''),(11979,113,132,10020,1,''),(11979,113,133,10020,1,''),(11979,113,134,2146,5,''),(11979,113,135,2149,12,''),(11979,113,136,10020,1,''),(11979,113,137,10020,1,''),(11979,113,138,10020,1,''),(11979,113,139,2145,1,''),(11979,113,140,10020,1,''),(11991,1,101,2502,1,''),(11991,3,102,57428,1,'&'),(11991,4,103,7463,1,''),(11991,5,104,2533,1,''),(11991,7,105,2504,1,''),(11991,8,106,2195,1,''),(11991,9,107,2127,1,''),(11991,11,108,26052,1,'&'),(11991,102,109,2274,52,'4'),(11991,102,110,2274,100,'d'),(11991,102,111,2274,100,'d'),(11991,102,112,2274,100,'d'),(11991,102,113,2181,1,''),(11991,102,114,2152,71,'G'),(11991,102,115,7620,72,'H'),(11991,102,116,2148,74,'J'),(11991,102,117,2789,35,'#'),(11991,102,118,2789,100,'d'),(11991,102,119,2789,100,'d'),(11991,102,120,2273,1,''),(11991,102,121,2268,10,'\n'),(11991,102,122,7620,100,'d'),(11991,102,123,2145,1,''),(11991,102,124,2160,17,''),(11991,102,125,2789,100,'d'),(11991,102,126,1988,1,'&'),(11991,108,127,26377,1,'&'),(11991,127,128,5878,1,''),(11991,127,129,2146,3,''),(11991,127,130,13247,1,''),(11997,1,101,2490,1,''),(11997,3,102,1988,1,'&'),(11997,4,103,2463,1,''),(11997,5,104,2513,1,''),(11997,6,105,2182,1,''),(11997,7,106,2648,1,''),(11997,8,107,2642,1,''),(11997,11,108,26052,1,'&\0'),(11997,102,109,2789,55,'7'),(11997,102,110,2789,100,'d'),(11997,102,111,2789,100,'d'),(11997,102,112,2789,100,'d'),(11997,102,113,7620,10,'\n'),(11997,102,114,2789,100,'d'),(11997,102,115,2152,28,''),(11997,102,116,2789,100,'d'),(11997,102,117,7620,100,'d'),(11997,102,118,2381,1,''),(11997,102,119,7620,100,'d'),(11997,102,120,2160,2,''),(11997,102,121,2420,1,''),(11997,102,122,2120,1,''),(11997,102,123,5710,1,''),(12005,1,101,2490,1,''),(12005,3,102,1988,1,'&'),(12005,4,103,2463,1,''),(12005,5,104,2513,1,''),(12005,6,105,2188,1,''),(12005,7,106,2468,1,''),(12005,8,107,2642,1,''),(12005,11,108,26052,1,'&\0'),(12005,102,109,2789,52,'4'),(12005,102,110,2789,100,'d'),(12005,102,111,2789,100,'d'),(12005,102,112,2190,1,''),(12005,102,113,2789,100,'d'),(12005,102,114,2152,40,'('),(12005,102,115,2789,100,'d'),(12005,102,116,7620,12,''),(12005,102,117,7620,100,'d'),(12005,102,118,2160,4,''),(12005,102,119,2381,1,''),(12005,102,120,2420,1,''),(12005,102,121,2120,1,''),(12005,102,122,5710,1,''),(11984,1,101,2481,1,''),(11984,3,102,1988,1,'&'),(11984,4,103,2652,1,''),(11984,5,104,2541,1,''),(11984,6,105,2428,1,''),(11984,7,106,2647,1,''),(11984,8,107,2642,1,''),(11984,11,108,26052,1,''),(11984,102,109,2160,8,''),(11984,102,110,2152,35,'#'),(11984,102,111,2265,83,'S'),(11984,102,112,2265,100,'d'),(11984,102,113,2787,56,'8'),(11984,102,114,2787,100,'d'),(11984,102,115,5710,1,''),(11984,102,116,2120,1,''),(12008,1,101,2490,1,''),(12008,2,102,2135,1,''),(12008,3,103,1988,1,'&'),(12008,4,104,2463,1,''),(12008,5,105,2540,1,''),(12008,6,106,3963,1,''),(12008,7,107,2649,1,''),(12008,8,108,2643,1,''),(12008,11,109,26052,1,'&'),(12008,103,110,2148,44,','),(12008,103,111,2152,53,'5'),(12008,103,112,7620,3,''),(12008,103,113,2789,78,'N'),(12008,103,114,2789,99,'c'),(12008,103,115,7620,100,'d'),(12008,103,116,2159,2,''),(12008,103,117,2129,100,'d\0'),(12008,103,118,2160,2,''),(12008,103,119,5710,1,''),(12008,103,120,2120,1,''),(12008,109,121,33082,5616,''),(12008,109,122,26377,1,'&'),(12008,122,123,2148,51,'3'),(12008,122,124,2146,3,''),(12008,122,125,2149,2,''),(12008,122,126,5948,5,''),(12008,122,127,5882,4,''),(12008,122,128,2145,3,''),(12008,122,129,5877,11,''),(12008,122,130,5920,7,''),(12008,122,131,5925,3,''),(12008,122,132,2129,100,'d\0'),(12008,122,133,2129,100,'d\0'),(12008,122,134,2129,100,'d\0'),(12008,122,135,2129,100,'d\0'),(12008,122,136,2129,100,'d\0'),(12008,122,137,2129,100,'d\0'),(12008,122,138,2129,100,'d\0'),(12008,122,139,2129,100,'d\0'),(12008,122,140,2129,100,'d\0'),(12008,122,141,2129,100,'d\0'),(12008,122,142,2129,100,'d\0'),(12008,122,143,2129,100,'d\0'),(11998,1,101,2490,1,''),(11998,2,102,2135,1,''),(11998,3,103,1988,1,'&'),(11998,4,104,2463,1,''),(11998,5,105,2513,1,''),(11998,6,106,2389,1,''),(11998,7,107,2648,1,''),(11998,8,108,2642,1,''),(11998,11,109,26052,1,'&\0'),(11998,103,110,2148,82,'R'),(11998,103,111,2789,52,'4'),(11998,103,112,2789,100,'d'),(11998,103,113,2789,100,'d'),(11998,103,114,2152,54,'6'),(11998,103,115,2789,100,'d'),(11998,103,116,2789,100,'d'),(11998,103,117,2789,100,'d'),(11998,103,118,2789,100,'d'),(11998,103,119,41243,1,''),(11998,103,120,2455,1,''),(11998,103,121,2129,100,'d\0'),(11998,103,122,2160,1,''),(11998,103,123,2420,1,''),(11998,103,124,2120,1,''),(11998,103,125,5710,1,''),(12020,1,101,2458,1,''),(12020,3,102,1988,1,'&'),(12020,4,103,2464,1,''),(12020,6,104,2381,1,''),(12020,7,105,2468,1,''),(12020,8,106,2642,1,''),(12020,11,107,26052,1,''),(12020,102,108,2148,77,'M'),(12020,102,109,5878,4,''),(12020,102,110,2512,1,''),(12020,102,111,5878,100,'d'),(12020,102,112,2160,8,''),(12020,102,113,2152,18,''),(12020,102,114,5878,100,'d'),(12020,102,115,5710,1,''),(12020,102,116,2120,1,''),(11985,1,101,2481,1,''),(11985,3,102,1988,1,'&\0'),(11985,4,103,2465,1,''),(11985,5,104,2513,1,''),(11985,6,105,2429,1,''),(11985,7,106,2478,1,''),(11985,8,107,2642,1,''),(11985,11,108,26052,1,''),(11985,102,109,2148,91,'['),(11985,102,110,2152,75,'K'),(11985,102,111,2428,1,''),(11985,102,112,5710,1,''),(11985,102,113,2120,1,''),(11940,1,101,2461,1,''),(11940,3,102,57440,1,'&'),(11940,4,103,2652,1,''),(11940,5,104,2516,1,''),(11940,6,105,2189,1,''),(11940,7,106,2647,1,''),(11940,8,107,2640,1,'\0∫€\0'),(11940,11,108,26052,1,'&'),(11940,102,109,2148,60,'<'),(11940,102,110,2152,60,'<'),(11940,102,111,2293,11,''),(11940,102,112,1988,1,'&'),(11940,108,113,33087,10000,'\''),(11940,108,114,26377,1,''),(11940,112,115,10513,1,''),(11940,112,116,7620,66,'B'),(11940,112,117,7620,100,'d'),(11999,1,101,2459,1,''),(11999,3,102,1988,1,'&'),(11999,4,103,2652,1,''),(11999,5,104,2512,1,''),(11999,6,105,5907,1,''),(11999,7,106,2649,1,''),(11999,8,107,2642,1,''),(11999,11,108,26052,1,'&'),(11999,102,109,41243,1,''),(11999,102,110,2120,1,''),(11999,102,111,5710,1,''),(12018,1,101,2460,1,''),(12018,3,102,1988,1,'&'),(12018,4,103,2465,1,''),(12018,5,104,2509,1,''),(12018,6,105,2429,1,''),(12018,7,106,2478,1,''),(12018,8,107,2643,1,''),(12018,11,108,26052,1,''),(12018,102,109,2148,52,'4'),(12018,102,110,2152,33,'!'),(12018,102,111,2160,3,''),(12018,102,112,2789,69,'E'),(12018,102,113,2789,100,'d'),(12018,102,114,1988,1,''),(12018,102,115,5710,1,''),(12018,102,116,2120,1,''),(11989,1,101,2481,1,''),(11989,3,102,1988,1,'&'),(11989,4,103,2483,1,''),(11989,5,104,2513,1,''),(11989,6,105,5907,1,''),(11989,7,106,2648,1,''),(11989,8,107,2642,1,''),(11989,11,108,26052,1,'&\0'),(11989,102,109,2148,7,''),(11989,102,110,2152,21,''),(11989,102,111,5878,93,']'),(11989,102,112,5878,100,'d'),(11989,102,113,2789,4,''),(11989,102,114,2789,100,'d'),(11989,102,115,2789,100,'d'),(11989,102,116,2789,100,'d'),(11989,102,117,41243,1,'&\0'),(11989,102,118,2120,1,''),(11989,102,119,7620,35,'#'),(11989,102,120,2160,4,''),(11989,102,121,2004,1,'&\0'),(11989,102,122,5710,1,''),(11989,102,123,2789,100,'d'),(11989,117,124,2543,21,''),(11989,121,125,5878,4,''),(11943,1,101,2473,1,''),(11943,3,102,1988,1,'&'),(11943,4,103,2463,1,''),(11943,6,104,5907,1,''),(11943,7,105,2478,1,''),(11943,8,106,2643,1,''),(11943,10,107,7364,1,''),(11943,11,108,26052,1,'&\0'),(11943,102,109,2148,61,'='),(11943,102,110,2152,49,'1'),(11943,102,111,2499,1,''),(11943,102,112,2509,1,''),(11943,102,113,2789,51,'3'),(11943,102,114,2160,4,''),(11943,102,115,2120,1,''),(11943,102,116,5710,1,''),(11943,102,117,2502,1,''),(11943,102,118,5878,10,'\n'),(11943,108,119,33085,202,' \0:Ç'),(11947,1,101,2460,1,''),(11947,3,102,1988,1,'&'),(11947,4,103,2652,1,''),(11947,5,104,2513,1,''),(11947,6,105,2389,1,''),(11947,7,106,2647,1,''),(11947,8,107,2642,1,''),(11947,11,108,26052,1,'&\0'),(11947,102,109,2148,53,'5'),(11947,102,110,2160,2,''),(11947,102,111,2152,73,'I'),(11947,102,112,5897,18,''),(11947,102,113,5907,1,''),(11947,102,114,7620,65,'A'),(11947,102,115,41243,1,''),(11947,102,116,2120,1,''),(11947,102,117,5710,1,''),(11953,1,101,2460,1,''),(11953,2,102,2172,100,'d\0'),(11953,3,103,1988,1,'&'),(11953,4,104,2483,1,''),(11953,5,105,41243,1,'&'),(11953,6,106,2456,1,''),(11953,7,107,2648,1,''),(11953,8,108,2642,1,''),(11953,10,109,7364,26,'\Z'),(11953,11,110,26052,1,'&\0'),(11953,103,111,2148,39,'\''),(11953,103,112,2152,13,'\r'),(11953,103,113,2160,1,''),(11953,103,114,5878,69,'E'),(11953,103,115,5878,100,'d'),(11953,103,116,2465,1,''),(11953,103,117,2533,1,''),(11953,103,118,2789,51,'3'),(11953,103,119,2145,1,''),(11953,103,120,5897,6,''),(11953,103,121,5878,100,'d'),(11953,103,122,5710,1,''),(11953,103,123,2120,1,''),(11953,105,124,2545,1,''),(11971,1,101,2461,1,''),(11971,3,102,1988,1,'&'),(11971,4,103,2652,1,''),(11971,5,104,2512,1,''),(11971,6,105,2448,1,''),(11971,7,106,2649,1,''),(11971,8,107,2642,1,''),(11971,11,108,26052,1,''),(11971,102,109,5710,1,''),(11971,102,110,2120,1,''),(11971,102,111,2789,10,'\n'),(11970,1,101,2461,1,''),(11970,3,102,1988,1,'&'),(11970,4,103,2652,1,''),(11970,5,104,2512,1,''),(11970,6,105,5907,1,''),(11970,7,106,2649,1,''),(11970,8,107,2642,1,''),(11970,11,108,26052,1,'&'),(11970,102,109,41243,1,''),(11970,102,110,2120,1,''),(11970,102,111,5710,1,''),(11970,102,112,2789,10,'\n'),(11993,1,101,2461,1,''),(11993,3,102,1988,1,'&\0'),(11993,4,103,2652,1,''),(11993,5,104,2512,1,''),(11993,6,105,2423,1,''),(11993,7,106,2649,1,''),(11993,8,107,2642,1,''),(11993,11,108,26052,1,''),(11993,102,109,5710,1,''),(11993,102,110,2120,1,''),(11992,1,101,2461,1,''),(11992,3,102,1988,1,'&'),(11992,4,103,2464,1,''),(11992,5,104,2512,1,''),(11992,6,105,2383,1,''),(11992,7,106,2649,1,''),(11992,8,107,2642,1,''),(11992,11,108,26052,1,'&'),(11992,102,109,1988,1,'&'),(11992,102,110,1988,1,'&'),(11992,102,111,2419,1,''),(11992,102,112,2152,22,''),(11992,102,113,5710,1,''),(11992,102,114,2120,1,''),(11992,109,115,2378,1,''),(11992,109,116,2148,79,'O'),(11992,109,117,2378,1,''),(11992,109,118,2378,1,''),(11934,1,101,2471,1,''),(11934,2,102,2173,1,'\0'),(11934,3,103,10521,1,'&'),(11934,4,104,9776,1,''),(11934,5,105,6433,1,''),(11934,6,106,2400,1,'?B\0'),(11934,7,107,9777,1,''),(11934,8,108,2646,1,''),(11934,9,109,2123,1,''),(11934,10,110,33045,1,''),(11934,11,111,26052,1,'&'),(11934,103,112,57428,1,''),(11934,103,113,1988,1,''),(11934,103,114,42119,95,'_'),(11934,103,115,57450,1,''),(11934,103,116,57443,25,''),(11934,103,117,57450,77,'M'),(11934,103,118,49451,1,''),(11934,103,119,2523,1,''),(11934,103,120,6433,1,''),(11934,103,121,2522,1,''),(11934,103,122,2472,1,''),(11934,103,123,7429,1,''),(11934,103,124,2152,99,'c'),(11934,103,125,2160,99,'c'),(11934,111,126,57450,1,''),(11934,111,127,26377,1,'');
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
INSERT INTO `player_preydata` VALUES (2,'\0\0\0\0\0\0\0\0\0	\0Crazed Winter Rearguard\0Faun\0Giant Spider	\0Hellhound\0Minotaur Guard\0Roaring Lion\0Skeleton Miner\0Vampire\0ancient scarab\0\0\0\0\0\0\0\0	\0Crawler\0Crazed Summer Vanguard\0Cyclopslave	\0Ice Witch\n\0Ironblight\n\0Ogre Brute\n\0juggernaut\0phantasm\0wyvern\0\0\0\0\0\0\0\0\0\0'),(3,'\0\0\0\0\0\0\0\0\0	\0Choking Fear\r\0Courage Leech\0Elf Lightmaster\0Hellforger Cyclops\0Mancubus\0Nightstalker\0Swan Maiden\0Waspoid\0wyvern\0\0\0\0\0\0\0\0	\0Crazed Winter Vanguard\0Draken Elite\0Enfeebled Silencer\n\0Ogre Brute\0Quara Mantassin\r\0Quara Pincher\Z\0Saurons Possessed Beholder\0Stone Devourer\0Werewolf\0\0\0\0\0\0\0\0\0\0'),(4,'\0\0\0\0\0\0\0\0\0	\0Cloak of Terror\0Hellforger Cyclops\0Lizard Legionnaire\n\0Ogre Brute\0Orc Warrior\r\0Quara Pincher\Z\0Saurons Possessed Beholder\n\0Terminator\n\0White Lion\0\0\0\0\0\0\0\0	\0Black Knight	\0Bloodboil\0Chaos Draco\n\0Elf Ranger\r\0Lizard Chosen\0Quara Predator\0Spirit Of Fire\0Uruloki\0Waspoid\0\0\0\0\0\0\0\0\0\0'),(5,'\0\0\0\0\0\0\0\0\0	\0Banshee\0Draken Abomination\0Elf Lightmaster\0Energy Elemental\0Hydra\0Mancubus\0Slime\0blightwalker\0dragon hatchling\0\0\0\0\0\0\0\0	\0Abyssal Cursed Stone\0Crawler\0Flimsy Lost Soul\r\0Lizard Chosen	\0Nightmare\n\0Pirat Mate\0Pirat Scoundrel\0Quara Predator\0Soul-Broken Harbinger\0\0\0\0\0\0\0\0\0\0'),(11930,'\0\0\0\0\0\0\0\0\0	\0Black Knight\0Deathling Scout\0Draken Warmaster\r\0Falcon Knight\n\0Werehyaena\0Werewolf\0Yeti\0dragon hatchling\0plaguesmith\0\0\0\0\0\0\0\0	\0Cyclops\n\0Elder Wyrm\0Giant Spider\0Haunted Treeling\0Lizard Legionnaire\0Silencer\0Soul Burner\n\0White Lion\0dragon lord hatchling\0\0\0\0\0\0\0\0\0\0'),(11931,'\0\0\0\0\0\0\0\0\0	\0Grim Reaper\0Hand of Cursed Fate\0Hellforger Cyclops\0Hero\0Lizard High Guard\0Ogre Savage\0Pirate Corsair\0Quara Mantassin\0dragon lord hatchling\0\0\0\0\0\0\0\0		\0Bloodboil\0Brain Squid\n\0Frazzlemaw\0Icecold Book\0Juvenile Bashmu\0Minotaur\0Nightstalker\0Slime\0Wyrm\0\0\0\0\0\0\0\0\0\0'),(11934,'\0\0\0\0\0\0\0\0\0	\0Burster Spectre\0Cobra Vizier\0Demon\0Hydra	\0Lost Soul\0Pirate Buccaneer\0Shaburak Demon\0Spirit Of Fire\0dragon lord hatchling\0\0\0\0\0\0\0\0	\0Animated Feather\0Biting Book\0Crawler\0Draken Warmaster\0Elf Soldier\0Energetic Book\0High Elf\0Kollos\n\0Shock Head\0\0\0\0\0\0\0\0\0\0'),(11935,'\0\0\0\0\0\0\0\0\0	\0Allukard\0Grim Reaper\0Kollos\0Lich\r\0Lizard Zaogun\0Stone Devourer\0Warlock\0dragon lord hatchling\0wyvern\0\0\0\0\0\0\0\0	\r\0Dark Torturer\0Fury\0Ice Serpente\0Ogre Savage\0Slime\0Soul Burner\0Werelioness\0Wyrm\0Yeti\0\0\0\0\0\0\0\0\0\0'),(11936,'\0˚\0ƒÓò\0\0	\0Abyssal Cursed Stone	\0Bloodboil\0Cursed Book\0Draken Spellweaver\r\0Falcon Knight\0Grim Reaper\0Kollos\0Skeleton Miner\0Stone Devourer∑\nƒÓò\0\0	\0Draken Abomination\0Hellfire Fighter	\0Hellhound\0Infernal Phantom\0Ink Blob\0Medusa\0Orc Warlord\0Uruloki\0Wyvern\0\0\0\0\0\0\0\0\0\0'),(11937,'\0\0\0\0\0\0\0\0\0\0dragon hatchling@\r\0	\0Breach Brood\r\0Dark Torturer\0Deepling Warrior\0Giant Spider\0Hellfire Fighter\0Lizard High Guard\n\0Terminator\n\0White Lion\0dragon hatchling\0\0\0\0\0\0\0\0\0Dragon Lord Hatchling@\0\n	\r\0Cliff Strider\0Cobra Scout\0Deepling Brawler\0Dragon Lord Hatchling\0Draken Abomination\0Ghastly Dragon\0High Elf\0Kollos\0Minotaur\0\0\0\0\0\0\0\0\0\0'),(11938,'\0\0\0\0\0\0\0\0\0	\0Choking Fear\0Deepling Brawler\n\0Elf Ranger\0Frost Flower Asura\0Ghastly Dragon\0Hellforger Cyclops\0Mancubus\n\0juggernaut\0plaguesmith\0\0\0\0\0\0\0\0	\0Abyssal Cursed Stone\0Elf Arcanist\0Elf Lightmaster\0Juvenile Bashmu	\0Lost Soul\n\0Ogre Brute\0Ripper Spectre\0Shade of Akama\0Stone Devourer\0\0\0\0\0\0\0\0\0\0'),(11939,'\0\0\0\0\0\0\0\0\0	\0Earth Elemental\n\0Elf Ranger\0Frost Flower Asura\0Fury\0Hellfire Fighter\0Ice Serpente\0Shaburak Prince\0Shade of Akama\0Slime\0\0\0\0\0\0\0\0	\0Choking Fear\0Elf Soldier\r\0Falcon Knight\0Flying Book\0Mancubus\0Nightstalker\0Quara Mantassin	\0Souleater\n\0Terminator\0\0\0\0\0\0\0\0\0\0'),(11940,'\0˘sÓò\0\0		\0Bloodboil\0Deepling Brawler\0Dragon\0Draken Warmaster\r\0Quara Pincher\0Shaburak Prince\0Slime\0Spectre\0WyrmK}Óò\0\0	\0Dragon Lord Hatchling\0Earth Elemental\0Haunted Treeling\0Infernal Demon\0Ogre Savage\0Quara Predator\0Shade of Akama\0Werehyaena Shaman\n\0juggernaut\0\0\0\0\0\0\0\0\0\0'),(11941,'\0\0\0\0\0\0\0\0\0	\0Black Knight\0Cobra Vizier\0Draken Spellweaver\0Elf Arcanist\n\0Elf Ranger\0Shadow Spectre\0Squid Warden\0Uruloki\0plaguesmith\0\0\0\0\0\0\0\0	\0Burster Spectre\0Demon\n\0Dragonling\n\0Frazzlemaw\0Haunted Treeling	\0Hellspawn\n\0Ogre Brute\0Spidris\0ancient scarab\0\0\0\0\0\0\0\0\0\0'),(11942,'\0\0\0\0\0\0\0\0\0	\0Brachiodemon\0Deepling Brawler\0Earth Elemental\0Elf Lightmaster\0Frost Dragon	\0Hellhound\Z\0Saurons Possessed Beholder\r\0Vampire Bride\n\0White Lion\0\0\0\0\0\0\0\0	\0Cobra Scout\0Dragon Lord Hatchling\n\0Elder Wyrm\0Elf Soldier\0Mega Dragon\0Nightstalker\n\0Rage Squid\0Spiky Carnivor\0Werewolf\0\0\0\0\0\0\0\0\0\0'),(11943,'\0Ó{¡Ìò\0\0	\0Deepling Warrior\n\0Elder Wyrm\0Ice Serpente\0Knowledge Elemental\r\0Magma Crawler\0Quara Predator\r\0Shaburak Lord\0Spectre\n\0juggernaut≠ú¡Ìò\0\0	\0Cobra Vizier\0Cyclopslave\0Grim Reaper	\0Hellspawn\0Ogre Savage\0Quara Constrictor\0Solarian\0Spidris\n\0Terminator\0\0\0\0\0\0\0\0\0\0'),(11947,'\0\0\0\0\0\0\0\0\0	\0Chaos Draco\0Dragon Lord Hatchling	\0Guzzlemaw\0High Elf	\0Nightmare\0Slime\0Soul Burner	\0destroyer\0plaguesmith\0\0\0\0\0\0\0\0	\0Burster Spectre\0Demon Skeleton\0Frost Torog\0Infernal Phantom\n\0Ogre Brute\0Ogre Savage\0Spark of Destruction\n\0Werehyaena\0Werelioness\0\0\0\0\0\0\0\0\0\0'),(11948,'\0©ßÓò\0\0	\0Biting Book\0Breach Brood\0Deathling Spellsinger\r\0Lizard Chosen\0Nightstalker\0Quara Hydromancer\0Spectre\r\0Undead Dragon\0ancient scarab¸ÄÓò\0\0\0Dragon LordÑ\0	\0Behemoth\0Draco\0Dragon Lord\r\0Falcon Knight\n\0Ironblight\0Mephisto\0Necromancer	\0Souleater\0Wyrm\0\0\0\0\0\0\0\0\0\0'),(11953,'\0\0\0\0\0\0\0\0\0	\0Cyclops\r\0Dark Torturer\0Dread Intruder\r\0Falcon Knight\n\0Ironblight\0Lizard Legionnaire	\0Lost Soul\0Ogre Savage\0ancient scarab¯≥ÆÌò\0\0	\0Brachiodemon\0Deepling Brawler\0Draco\0Dragon\0Dwarf Miner\0Frost Dragon\0Hero\0Shadow Spectre\0Skeleton Miner\0\0\0\0\0\0\0\0\0\0'),(11954,'\0&ØÌò\0\0\0		\0Biting Book\0Choking Fear\0Dawnfire Asura\0Draken Abomination\0Draken Elite\0Juvenile Bashmu\0Orc Warlord\0Skeleton Miner	\0Souleater\0\0\0\0\0\0\0\0	\0Cyclops\0Enyd\r\0Magma Crawler\0Medusa\0Mega Dragon\0Quara Constrictor\0Quara Mantassin\r\0Quara Pincher\n\0Terminator\0\0\0\0\0\0\0\0\0\0'),(11956,'\0î“Óò\0\0\0Elf Lightmaster \0		\0Dwarf Miner\0Elf Lightmaster\n\0Ironblight\0Menacing Carnivor\0Quara Hydromancer\0Spark of Destruction\r\0Vampire Bride\n\0White Lion\0dragon hatchlingGﬂÓò\0\0\0Wyrm \0	\0Dragon	\0Hellspawn\0Hero\0Kollos\0Shaburak Prince\0Stone Devourer\0Wyrm\0Yeti\n\0juggernaut\0\0\0\0\0\0\0\0\0\0'),(11957,'\0\0\0\0\0\0\0\0\0	\0Cobra Assassin\0Deepling Warrior	\0Dragolisk\0Dread Intruder\0Ghastly Dragon	\0Guzzlemaw\n\0Shock Head	\0Souleater\0Yeti\0\0\0\0\0\0\0\0	\0Allukard\0Cursed Book\0Deathling Spellsinger\0Deepling Master\0Lizard Legionnaire\0Shade of Akama\r\0Undead Dragon\0Werehyaena Shaman\0blightwalker\0\0\0\0\0\0\0\0\0\0'),(11959,'\0\0\0\0\0\0\0\0\0	\0Black Knight\0Cobra Assassin\0Deepling Warrior\n\0Dragonling\0Dread Intruder\0Elf Arcanist\0Enyd\0Infernal Demon\0Ink Blob\0\0\0\0\0\0\0\0	\0Deathling Spellsinger	\0Dragolisk\0Dragon\n\0Elder Wyrm\0Minotaur Guard\0Werelioness\0Wyrm\n\0juggernaut\0phantasm\0\0\0\0\0\0\0\0\0\0'),(11960,'\0\0\0\0\0\0\0\0\0	\0Cobra Scout\0Cyclopslave\0Deepling Master\0Hellforger Cyclops\0Infernal Phantom\0Lizard Dragon Priest	\0Nightmare\n\0Rage Squid\0Spectre\0\0\0\0\0\0\0\0	\0Cursed Book\0Energetic Book\r\0Falcon Knight\0Fury\0Quara Mantassin\0Stone Rhino\r\0Vampire Bride\n\0Werehyaena\n\0White Lion\0\0\0\0\0\0\0\0\0\0'),(11964,'\0∂Ø“Ìò\0\0	\0Deepling Master\0Elf Soldier\r\0Falcon Knight\0Ice Serpente	\0Ice Witch\0Knowledge Elemental\0Mega Dragon\0Orc Warlord\0WyvernXƒ“Ìò\0\0	\0	\0Cobra Vizier\0High Elf\r\0Lizard Chosen\0Lizard High Guard\0Lumbering Carnivor\0Necromancer\n\0Shock Head\0Spirit Of Fire\0Squid Warden\0\0\0\0\0\0\0\0\0\0'),(11965,'\0ÃÂŒÌò\0\0	\0Brachiodemon\0Dawnfire Asura\0Draken Spellweaver\0Energetic Book\0Ink Blob\0Skeleton Miner\0Werelioness	\0destroyer\0dragon hatchlingWŒÌò\0\0	\0Deathling Spellsinger\0Deepling Warrior\0Draken Abomination\0Enyd\0Istari Follower\r\0Quara Pincher\0Spark of Destruction\0Squid Warden\0Wyvern\0\0\0\0\0\0\0\0\0\0'),(11967,'\0ﬁRﬂÌò\0\0	\0Bashmu\0Dread Intruder\0Earth Elemental\0Energuardian of Tales\r\0Lizard Zaogun\n\0Shock Head\0Uruloki\n\0Werehyaena\0dragon hatchling3^ﬂÌò\0\0	\0Deathling Scout\0Deepling Brawler\0Dragon Lord Hatchling\n\0Frazzlemaw\0Lizard Legionnaire	\0Nightmare\0True Frost Flower Asura\n\0White Lion\n\0juggernaut\0\0\0\0\0\0\0\0\0\0'),(11968,'\0B§Óò\0\0	\0Belzebuth Minion\0Cobra Assassin\0Demon Skeleton\0Grim Reaper\0High Elf\0True Frost Flower Asura\n\0Werehyaena\0Werewolf\0dragon hatchlingéÆÓò\0\0	\0Cobra Scout\0Draco\0Draken Elite\0Elf Lightmaster\0Enyd\0Frost Flower Asura\0Hellfire Fighter\0Vampire\0Wyrm\0\0\0\0\0\0\0\0\0\0'),(11969,'\0\0\0\0\0\0\0\0\0	\0Cursed Book\0Dawnfire Asura\0Defiler\0Dread Intruder\n\0Ironblight\r\0Lizard Chosen\0Necromancer\0Ripper Spectre\0Spiky Carnivor\0\0\0\0\0\0\0\0	\0Behemoth\0Cobra Vizier\r\0Dark Torturer\0Dwarf Guard\n\0Elder Wyrm\0Energuardian of Tales	\0Lost Soul\0Orc Warrior	\0Souleater\0\0\0\0\0\0\0\0\0\0'),(11970,'\0\0\0\0\0\0\0\0\0		\0Bloodboil\0Burning Book\0Burster Spectre\r\0Demon Outcast\0Frost Flower Asura\0Medusa\0Mutated Bat\0True Midnight Asura\r\0Vampire Bride\0\0\0\0\0\0\0\0	\0Cobra Vizier\0Cursed Book\0Deepling Brawler\0Demon\0Draken Abomination\0Menacing Carnivor\0Spirit Of Fire\n\0Werehyaena\0phantasm\0\0\0\0\0\0\0\0\0\0'),(11971,'\0\0\0\0\0\0\0\0\0	\0Cyclopslave\0Draken Abomination\0Draken Elite\0Earth Elemental\r\0Gazer Spectre\0Hellforger Cyclops\0Infernal Phantom\0Quara Mantassin\0Werewolf\0\0\0\0\0\0\0\0	\0Deathling Spellsinger\0Demon\0Dwarf Miner\0Ghastly Dragon\0Ice Serpente	\0Nightmare\0Oxyurus\0Quara Predator\0Spectre\0\0\0\0\0\0\0\0\0\0'),(11972,'\0\0\0\0\0\0\0\0\0	\0Deepling Brawler\0Lumbering Carnivor\0Midnight Asura\0Necromancer\0Shaburak Demon	\0Souleater\0Stone Devourer\0True Dawnfire Asura\0Uruloki\0\0\0\0\0\0\0\0	\0Defiler\0Draken Elite\0Kollos\r\0Magma Crawler\0Mega Dragon\0Quara Hydromancer\0Shade of Akama\n\0White Lion\n\0juggernaut\0\0\0\0\0\0\0\0\0\0'),(11974,'\0∂2ºÌò\0\0\n\0Frazzlemaw<\0	\0Brachiodemon\0Draken Warmaster\0Elf Arcanist\n\0Frazzlemaw\0Mancubus\0Medusa\0Mega Dragon\0Ogre Shaman\0Quara ConstrictorßVºÌò\0\0	\0Bonebeast`\0		\0Bonebeast\0Frost Flower Asura	\0Hellhound\0Necromancer\0Werehyaena Shaman\0Werelioness\0Yeti\0ancient scarab\0blightwalker\0\0\0\0\0\0\0\0\0\0'),(11975,'\0®Ìò\0\0	\0Cobra Vizier\0Deepling Brawler\0Deepling Warrior\0Energuardian of Tales\0Falcon Paladin\0Hand of Cursed Fate\0Mephisto\0Spidris\0plaguesmithû®Ìò\0\0\0Cyclops \0\r\0	\0Burning Book\0Cyclops\0Cyclopslave	\0Dragolisk\0Draken Abomination\0Draken Elite\0Mega Dragon\0Menacing Carnivor\0Shade of Akama\0\0\0\0\0\0\0\0\0\0'),(11976,'\0\0\0\0\0\0\0\0\0	\0Bashmu\0Biting Book	\0Bloodboil\0Choking Fear\0Deepling Master\n\0Elf Ranger\0Enyd\0Ink Blob\0Spark of Destruction\0\0\0\0\0\0\0\0	\0Cobra Vizier\0Deathling Spellsinger\0Earth Elemental\0Falcon Paladin\0Frost Flower Asura\0Fury\0Sight of Surrender\0True Frost Flower Asura\0Warlock\0\0\0\0\0\0\0\0\0\0'),(11978,'\01ùØÌò\0\0	\0Brain Squid\0Dawnfire Asura\0Dragon\n\0Elf Ranger\0Giant Spider	\0Guzzlemaw\0Infernal Phantom\0Istari Follower	\0Lost Soul„£ØÌò\0\0	\0Chaos Draco\0Cobra Assassin\0Crystal Spider\0Draken Warmaster\0Dwarf Guard\0Lumbering Carnivor\0Spirit Of Fire\0blightwalker\0plaguesmith\0\0\0\0\0\0\0\0\0\0'),(11979,'\0ÉáÓò\0\0\0	\0Breach Brood\n\0Elder Wyrm\0Frost Flower Asura	\0Hellspawn\0Mancubus\0Mephisto\0Sight of Surrender\0Stampor\0Vampire¢Óò\0\0\0	\0Behemoth\0Choking Fear\0Draken Spellweaver\0Draken Warmaster\0Flying Book\0Ink Blob\0Midnight Asura\0Mutated Bat\0Waspoid\0\0\0\0\0\0\0\0\0\0'),(11981,'\0 /◊Ìò\0\0\0SolarianP	\0	\0Allukard\0Banshee\0Cobra Vizier\r\0Demon Outcast\0Energetic Book\0Frost Torog\0Fury\0Solarian\0Squid Warden6\Z◊Ìò\0\0\0Werehyaena ShamanP \0\n	\0Crystal Spider\0Cyclopslave\r\0Dark Torturer\0Elf Lightmaster\0Flying Book\0Minotaur\0Minotaur Guard\r\0Shaburak Lord\0Werehyaena Shaman\0\0\0\0\0\0\0\0\0\0'),(11982,'\0\0\0\0\0\0\0\0\0	\0Black Knight\n\0Elf Ranger\0Flying Book\0Frost Dragon\0Hellfire Fighter\0Oxyurus\0Quara Hydromancer\0Spirit Of Fire\0True Dawnfire Asura\0\0\0\0\0\0\0\0	\0Defiler\r\0Gazer Spectre\0Grim Reaper\0Knowledge Elemental\0Mega Dragon\0Nightstalker\0Ogre Savage\0Ogre Shaman\n\0Rage Squid\0\0\0\0\0\0\0\0\0\0'),(11983,'\0\0\0\0\0\0\0\0\0	\0Allukard\0Dragon Lord\0Dread Intruder\0Frost Flower Asura\0Frost Torog\0Ghastly Dragon\0Grim Reaper\0Silencer\r\0serpent spawn\0\0\0\0\0\0\0\0		\0Bloodboil\0Draken Abomination\n\0Frazzlemaw\0Hellforger Cyclops	\0Hellhound\0Mancubus\0Menacing Carnivor\0Shaburak Prince\n\0White Lion\0\0\0\0\0\0\0\0\0\0'),(11984,'\0\0\0\0\0\0\0\0\0		\0Bloodboil\0Breach Brood\0Enyd\0Ghastly Dragon\0Istari Follower\0Shadow Spectre\0Stone Devourer\n\0Terminator\0True Midnight Asura\0\0\0\0\0\0\0\0	\r\0Dark Torturer\0Deepling Warrior\0Frost Torog\0Mancubus\0Mutated Bat\0Orc Warlord\0Quara Predator\Z\0Saurons Possessed Beholder\0Shaburak Demon\0\0\0\0\0\0\0\0\0\0'),(11985,'\0\0\0\0\0\0\0\0\0	\0Bashmu\0Cursed Book\r\0Demon Outcast\n\0Elder Wyrm\n\0Frazzlemaw\0Hellforger Cyclops\0Minotaur\0Orc Warlord\0Warlock\0\0\0\0\0\0\0\0	\0Banshee\0Demon Skeleton\0Draco\0Draken Warmaster\0Giant Spider\0Orc Warrior\0Shade of Akama\0Vampire\r\0Vampire Bride\0\0\0\0\0\0\0\0\0\0'),(11986,'\0\0\0\0\0\0\0\0\0	\0Crawler\0Earth Elemental\r\0Gazer Spectre	\0Guzzlemaw\0Icecold Book\r\0Quara Pincher\0Slime\0Squid Warden\0ancient scarab\0\0\0\0\0\0\0\0	\0Cobra Vizier\0Demon\r\0Demon Outcast\0Demon Skeleton\0Dwarf Guard\0Dwarf Miner\n\0Elder Wyrm\0Frost Torog	\0Nightmare\0\0\0\0\0\0\0\0\0\0'),(11987,'\0\0\0\0\0\0\0\0\0	\0Brachiodemon\r\0Cliff Strider\0Deepling Warrior\0Draken Warmaster\r\0Lizard Zaogun\0Shaburak Demon\0Shadow Spectre\0Uruloki\n\0Werehyaena\0\0\0\0\0\0\0\0	\0Bashmu\0Cursed Book\0Cyclops	\0Dragolisk\0Draken Spellweaver\0Earth Elemental\0Frost Flower Asura\r\0Magma Crawler\n\0Rage Squid\0\0\0\0\0\0\0\0\0\0'),(11988,'\0NŒ∑Ìò\0\0	\0Cursed Book	\0Dragolisk\n\0Dragonling\0Dwarf Miner\0Elf Soldier\0Mephisto\0Quara Predator\r\0Undead Dragon\0Yeti®ﬂ∑Ìò\0\0	\0Cobra Assassin\0Deepling Master\0Dragon Lord Hatchling\0Draken Spellweaver\0Orc Warlord\0Quara Constrictor\0Spirit Of Fire\0Vampire\0ancient scarab\0\0\0\0\0\0\0\0\0\0'),(11989,'\0æ‡;Óò\0\0	\0Crystal Spider\0Cursed Book\0Draken Spellweaver\0Icecold Book\0Lich\0Mephisto\0Quara Predator	\0Souleater\0Werehyaena Shaman“kdÓò\0\0		\0Bloodboil\0Cobra Assassin\0Cobra Vizier\0Dragon Lord\r\0Gazer Spectre\0Medusa\0Orc Warlord\0Shade of Akama\n\0Shock Head\0\0\0\0\0\0\0\0\0\0'),(11990,'\0\0\0\0\0\0\0\0\0	\0Draken Elite\0Dwarf Guard\n\0Elder Wyrm\0Kollos\n\0Rage Squid\0Stampor\n\0Terminator\0Werewolf\r\0serpent spawn\0\0\0\0\0\0\0\0	\0Banshee\0Brain Squid\n\0Frazzlemaw\0Haunted Treeling\0Istari Follower\0Juvenile Bashmu\0Mephisto\0Pirate Corsair\0plaguesmith\0\0\0\0\0\0\0\0\0\0'),(11991,'\0∆+Óò\0\0	\r\0Cliff Strider\0Dawnfire Asura	\0Dragolisk\0Haunted Treeling\0Orc Warrior\Z\0Saurons Possessed Beholder\0Spark of Destruction\0Werelioness\0phantasmÔ\"Óò\0\0	\0Biting Book\0Crawler\0Crystal Spider\0Cursed Book\n\0Dragonling\0Earth Elemental\0Grim Reaper\0Istari Follower\r\0serpent spawn\0\0\0\0\0\0\0\0\0\0'),(11992,'\0∑Ö≈Ìò\0\0	\0Brain Squid\0Cobra Scout\0Deathling Spellsinger\0Demon Skeleton\0Draken Abomination\0Elf Arcanist\0Hellforger Cyclops	\0Ice Witch\0Squid Wardenµã≈Ìò\0\0	\0Dwarf Guard\0Istari Follower\0Medusa\0Quara Predator\0Shaburak Prince\0Warlock\0Werehyaena Shaman\0blightwalker\0plaguesmith\0\0\0\0\0\0\0\0\0\0'),(11993,'\0\0\0\0\0\0\0\0\0	\0Belzebuth Minion\0Cursed Book\0Medusa\0Mega Dragon	\0Nightmare\0Quara Constrictor\0Solarian\0Werelion\0dragon hatchling\0\0\0\0\0\0\0\0	\0Allukard\0Cobra Assassin	\0Dragolisk\0Hellforger Cyclops\0Kollos\0Lizard Dragon Priest\0Quara Hydromancer\0Spiky Carnivor\0Squid Warden\0\0\0\0\0\0\0\0\0\0'),(11994,'\0C∏Ìò\0\0	\0Brachiodemon\0Grim Reaper\0High Elf\0Infernal Demon\0Lich\0Lizard High Guard\0Nightstalker\0Stone Devourer\0WerelionˆU∏Ìò\0\0	\n\0Elf Ranger\r\0Falcon Knight\0Frost Flower Asura\0Hero	\0Ice Witch\0Ink Blob\0Soul Burner\0Spidris\0Succubus\0\0\0\0\0\0\0\0\0\0'),(11995,'\0\0\0\0\0\0\0\0\0	\0Cyclopslave	\0Dragolisk\0Dragon Lord Hatchling\0Flying Book\0Ghastly Dragon\0Hellforger Cyclops\0Hydra\0Ogre Savage\0Stampor\0\0\0\0\0\0\0\0	\n\0Dragonling\0Draken Spellweaver\0Frost Flower Asura\0Knowledge Elemental\0Midnight Asura\0Oxyurus\0Shadow Spectre\0Spark of Destruction\0True Dawnfire Asura\0\0\0\0\0\0\0\0\0\0'),(11996,'\0\0\0\0\0\0\0\0\0	\0Abyssal Cursed Stone\0Dragon Lord Hatchling\0Dwarf Guard\0Ghastly Dragon\0Hand of Cursed Fate\0Haunted Treeling\0Skeleton Miner\0Spectre\0blightwalker\0\0\0\0\0\0\0\0	\0Brain Squid\r\0Dark Torturer\0Dread Intruder\0Medusa\0Minotaur Guard\0Stone Devourer\n\0Terminator\0True Frost Flower Asura\0Werelioness\0\0\0\0\0\0\0\0\0\0'),(11997,'\0\0\0\0\0\0\0\0\0\0Cyclopslave4\0\0\n	\0Banshee\0Cyclopslave\0Falcon Paladin\r\0Lizard Chosen\0Lizard Dragon Priest\0Pirate Buccaneer\0Sight of Surrender\0Soul Burner\0Spectre¥6Ôò\0\0\0	\0Abyssal Cursed Stone\0Belzebuth Minion\0Draken Spellweaver\0Draken Warmaster\0Elf Lightmaster\0Flying Book\0Ink Blob\0Squid Warden\0True Frost Flower Asura\0\0\0\0\0\0\0\0\0\0'),(11998,'\0êsÔò\0\0\0Earth Elementalº\0\n	\0Burning Book\0Deepling Brawler\0Draken Warmaster\0Earth Elemental\0Elf Arcanist\0Falcon Paladin\0Haunted Treeling\0Infernal Demon\0ancient scarab\0\0\0\0\0\0\0\0\0Behemothº\r\0	\0Behemoth\0Biting Book\n\0Dragonling\0Draken Abomination\0Hand of Cursed Fate\0Infernal Phantom\0Orc Warlord\0Pirate Buccaneer\0phantasm\0\0\0\0\0\0\0\0\0\0'),(11999,'\0\0\0\0\0\0\0\0\0		\0Bloodboil	\0Bonebeast\0Frost Flower Asura	\0Hellhound	\0Hellspawn\0Ink Blob\0Shaburak Prince\0Spirit Of Fire\0dragon hatchling\0\0\0\0\0\0\0\0	\0Crawler\0Cursed Book\0High Elf\0Infernal Phantom\n\0Ogre Brute\0Quara Mantassin\0Soul Burner\0Stone Devourer\0Waspoid\0\0\0\0\0\0\0\0\0\0'),(12000,'\0\0\0\0\0\0\0\0\0	\0Choking Fear\0Energetic Book\0Ghastly Dragon\r\0Quara Pincher\0Spidris\0Stone Devourer\0True Midnight Asura\0Uruloki\n\0White Lion\0\0\0\0\0\0\0\0	\0Deepling Warrior\0Haunted Treeling	\0Lost Soul\0Pirate Corsair\0Sight of Surrender\0Solarian\0Stampor	\0destroyer\n\0juggernaut\0\0\0\0\0\0\0\0\0\0'),(12001,'\0\0\0\0\0\0\0\0\0	\0Chaos Draco\0Draken Spellweaver\0Elf Soldier\0Lumbering Carnivor\0Shaburak Prince\0Squid Warden\0Stampor\0True Frost Flower Asura\0phantasm\0\0\0\0\0\0\0\0	\0Brain Squid\0Deepling Brawler\0Hand of Cursed Fate\0Icecold Book\0Minotaur\n\0Ogre Brute\r\0Vampire Bride\0Yeti\0plaguesmith\0\0\0\0\0\0\0\0\0\0'),(12002,'\0\0\0\0\0\0\0\0\0	\0Crawler\0Defiler\0Juvenile Bashmu\0Mutated Bat\0Quara Predator\n\0Rage Squid\0True Midnight Asura\0Vampire\0Werehyaena Shaman\0\0\0\0\0\0\0\0	\0Brain Squid\0Energuardian of Tales\n\0Frazzlemaw\0Hellforger Cyclops\0Icecold Book\0Quara Hydromancer\0Spiky Carnivor\0Stampor\0Warlock\0\0\0\0\0\0\0\0\0\0'),(12003,'\0\0\0\0\0\0\0\0\0	\0Deathling Spellsinger\0Draco\0Haunted Treeling\r\0Magma Crawler	\0Nightmare\0Nightstalker\0Orc Warlord\0Pirate Buccaneer\0Werewolf\0\0\0\0\0\0\0\0	\0Abyssal Cursed Stone\0Cyclopslave	\0Hellhound\0Knowledge Elemental\0Kollos\r\0Lizard Zaogun\0Ogre Shaman\r\0Quara Pincher\r\0Shaburak Lord\0\0\0\0\0\0\0\0\0\0'),(12004,'\0(Ÿ\"Óò\0\0		\0Hellspawn\r\0Magma Crawler\0Midnight Asura\0Soul Burner\0Spidris\0Spirit Of Fire\n\0Werehyaena\0Werewolf\0dragon hatchlingÔ\"Óò\0\0	\0Dawnfire Asura\0Frost Torog\0Ghastly Dragon\0Hydra\0Icecold Book\0Ink Blob\0Lizard Dragon Priest\0Lumbering Carnivor\0Solarian\0\0\0\0\0\0\0\0\0\0'),(12005,'\0HßÔò\0\0\0Elf LightmasterD\0	\0Elf Lightmaster\0Hellfire Fighter\0Ice Serpente\r\0Lizard Chosen\0Lizard High Guard\r\0Lizard Zaogun\0Minotaur Guard\0Shadow Spectre\n\0Terminatorë…Ôò\0\0\0Chaos DracoD\0	\0Allukard\0Chaos Draco\r\0Cliff Strider\0Dwarf Miner\0Flying Book\0Lizard Legionnaire\0dragon hatchling\0phantasm\r\0serpent spawn\0\0\0\0\0\0\0\0\0\0'),(12006,'\0\0\0\0\0\0\0\0\0	\0Cobra Scout\0Dwarf Guard\n\0Elf Ranger\0Ogre Savage\0Quara Predator\0Silencer\0Spark of Destruction\0Vampire\0Werelion\0\0\0\0\0\0\0\0		\0Bloodboil\0Burning Book\0Crawler	\0Hellspawn\r\0Magma Crawler\0Quara Mantassin\0Skeleton Miner\0Slime\0Succubus\0\0\0\0\0\0\0\0\0\0'),(12008,'\0\0\0\0\0\0\0\0\0	\0Brachiodemon\0Crystal Spider\0Draco\n\0Dragonling\0Frost Flower Asura\0Orc Warlord\0True Dawnfire Asura\0Vampire\0plaguesmith\0\0\0\0\0\0\0\0	\0Abyssal Cursed Stone\0Biting Book\0Cobra Scout\r\0Dark Torturer\r\0Falcon Knight	\0Hellhound\0Juvenile Bashmu\0Mephisto\0True Midnight Asura\0\0\0\0\0\0\0\0\0\0'),(12009,'\0\0\0\0\0\0\0\0\0	\0Brachiodemon\0Crawler\0Deepling Master\n\0Elder Wyrm\0Menacing Carnivor	\0Nightmare\r\0Quara Pincher\0Werewolf	\0destroyer\0\0\0\0\0\0\0\0		\0Bloodboil	\0Bonebeast\n\0Frazzlemaw\0Ghastly Dragon\0Guardian of Tales	\0Hellspawn\n\0Rage Squid\n\0Shock Head\0Soul Burner\0\0\0\0\0\0\0\0\0\0'),(12010,'\0\0\0\0\0\0\0\0\0	\0Cyclopslave\r\0Demon Outcast\0Energetic Book\0Hellfire Fighter\0Lizard Legionnaire\0Werelion\0Wyrm\0ancient scarab\0dragon hatchling\0\0\0\0\0\0\0\0	\0Breach Brood\0Crawler\0Draken Spellweaver\n\0Frazzlemaw\0Infernal Demon\0Juvenile Bashmu\0Stone Devourer\0True Dawnfire Asura\0Werehyaena Shaman\0\0\0\0\0\0\0\0\0\0'),(12011,'\0\0\0\0\0\0\0\0\0	\0Abyssal Cursed Stone\r\0Demon Outcast\0Fury\0Mancubus\0Mega Dragon\0Oxyurus\r\0Shaburak Lord\0Spark of Destruction\0True Dawnfire Asura\0\0\0\0\0\0\0\0	\0Brachiodemon\0Burning Book\0Lumbering Carnivor\0Mutated Bat\n\0Shock Head\0Stone Rhino\0Waspoid\0Werelioness\n\0White Lion\0\0\0\0\0\0\0\0\0\0'),(12012,'\0\0\0\0\0\0\0\0\0	\0Dragon Lord\0Dread Intruder\0Elf Lightmaster\0Mega Dragon\0Mephisto\0Quara Mantassin	\0Souleater\0Spectre	\0destroyer\0\0\0\0\0\0\0\0	\0Crystal Spider\0Infernal Demon\0Lich	\0Lost Soul\0Lumbering Carnivor\0Midnight Asura\0Quara Predator\0Stone Devourer\0True Midnight Asura\0\0\0\0\0\0\0\0\0\0'),(12013,'\0\0\0\0\0\0\0\0\0	\0Burster Spectre\0Flying Book\0Frost Dragon\0Lizard Dragon Priest\0Minotaur Guard\0Soul Burner\0Waspoid\n\0White Lion\0blightwalker\0\0\0\0\0\0\0\0	\0Biting Book\r\0Cliff Strider\0Cobra Vizier\0Giant Spider\0Hand of Cursed Fate\0Knowledge Elemental\0Mancubus\0Quara Predator\0Wyrm\0\0\0\0\0\0\0\0\0\0'),(12014,'\0\0\0\0\0\0\0\0\0	\0Bashmu\0Belzebuth Minion\0Elf Arcanist\r\0Gazer Spectre\0Hand of Cursed Fate\0Quara Mantassin\0Retching Horror\0Sight of Surrender\0Wyrm\0\0\0\0\0\0\0\0	\0Biting Book\0Breach Brood\0Draken Abomination\0Elf Soldier\0Mega Dragon\0Ogre Savage\0Silencer\0Yeti\0blightwalker\0\0\0\0\0\0\0\0\0\0'),(12015,'\0\0\0\0\0\0\0\0\0	\0Crawler\0Defiler\0Demon\0Draco\0Dwarf Miner	\0Hellspawn	\0Nightmare\0Waspoid\0plaguesmith\0\0\0\0\0\0\0\0	\0Belzebuth Minion\0Breach Brood\0Frost Dragon\0High Elf\0Hydra\0Ogre Shaman\0Orc Warrior\0Spiky Carnivor\n\0Terminator\0\0\0\0\0\0\0\0\0\0'),(12016,'\0\0\0\0\0\0\0\0\0	\0Belzebuth Minion\0Black Knight	\0Bonebeast\r\0Demon Outcast\0Elf Lightmaster\0Enyd\0Lizard High Guard\0Midnight Asura\0Quara Mantassin\0\0\0\0\0\0\0\0	\0Dragon Lord Hatchling\n\0Elder Wyrm\0Frost Dragon\0Hand of Cursed Fate	\0Ice Witch\0Quara Predator\0Shade of Akama\0True Dawnfire Asura	\0destroyer\0\0\0\0\0\0\0\0\0\0'),(12018,'\0”ì)Óò\0\0	\0Crawler\r\0Demon Outcast\0Energetic Book\0Lizard High Guard\0Ogre Savage\0Shade of Akama\0Waspoid\0Wyrm\0Wyvern‘•)Óò\0\0	\0Burning Book\0Choking Fear\0Elf Arcanist\0Elf Lightmaster	\0Hellhound	\0Hellspawn\0Spidris\r\0Undead Dragon	\0destroyer\0\0\0\0\0\0\0\0\0\0'),(12019,'\0\0\0\0\0\0\0\0\0	\0Cyclopslave\0Demon\0Hellfire Fighter\0Mega Dragon\0Orc Warrior\0Sight of Surrender\0Spidris\0Spiky Carnivor\0Werewolf\0\0\0\0\0\0\0\0	\0Burning Book\0Chaos Draco\0Defiler\0Energuardian of Tales\r\0Lizard Zaogun\0Quara Mantassin\0Skeleton Miner\0Solarian\0Uruloki\0\0\0\0\0\0\0\0\0\0'),(12020,'\0\0\0\0\0\0\0\0\0		\0Bonebeast\0Cobra Assassin\0Cursed Book\0Dread Intruder\r\0Gazer Spectre\0Lizard Dragon Priest	\0Lost Soul\0True Dawnfire Asura\0Wyrm\0\0\0\0\0\0\0\0	\0Draken Abomination\0Fury\0Haunted Treeling\0Retching Horror\0Ripper Spectre\0Stampor\0Uruloki\0dragon hatchling\0plaguesmith\0\0\0\0\0\0\0\0\0\0'),(12021,'\0\0\0\0\0\0\0\0\0	\r\0Dark Torturer\0Deathling Scout\0Demon Skeleton\0Hellfire Fighter	\0Lost Soul\0Quara Mantassin\0Retching Horror\0Werelion\0Werewolf\0\0\0\0\0\0\0\0	\0Breach Brood\0Dwarf Guard\0Juvenile Bashmu\r\0Magma Crawler\0Oxyurus\0Quara Predator\0Shade of Akama\0Slime\0Wyrm\0\0\0\0\0\0\0\0\0\0');
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
INSERT INTO `player_storage` VALUES (2,5152,0),(2,6983,1740097008),(2,17101,0),(2,30001,1),(2,40851,1),(2,45144,1),(2,45162,1),(2,69801,0),(2,98231,0),(2,10001001,8912896),(2,10001002,8388608),(2,10001003,8978432),(2,10001004,8454144),(2,10001005,9043968),(2,10001006,8519680),(2,10001007,9109504),(2,10001008,8585216),(2,10001009,9175040),(2,10001010,8650752),(2,10001011,9240576),(2,10001012,8716288),(2,10001013,9306112),(2,10001014,8781824),(2,10001015,9633792),(2,10001016,9371648),(2,10001017,9764864),(2,10001018,9502720),(2,10001019,9830400),(2,10001020,9568256),(2,10001021,10158080),(2,10001022,9895936),(2,10001023,10223616),(2,10001024,9961472),(2,10001025,10289152),(2,10001026,10027008),(2,10001027,10354688),(2,10001028,10092544),(2,10001029,16515072),(2,10001030,16449536),(2,10001031,17629184),(2,10001032,17563648),(2,10001033,17694720),(2,10001034,17891328),(2,10001035,18284544),(2,10001036,18219008),(2,10001037,18874368),(2,10001038,18939904),(2,10001039,21233664),(2,10001040,21299200),(2,10001041,22020096),(2,10001042,21954560),(2,10001043,23986176),(2,10001044,24051712),(2,10001045,28246016),(2,10001046,28180480),(2,10001047,28377088),(2,10001048,28311552),(2,10001049,30408704),(2,10001050,30343168),(2,10001051,30474240),(2,10001052,30539776),(2,10001053,111738880),(2,10001054,111804416),(2,10001055,112197632),(2,10001056,112656384),(2,10001057,112721920),(2,98231521,0),(3,5152,0),(3,6983,1740097000),(3,17101,0),(3,30001,1),(3,40851,1),(3,45144,1),(3,45162,1),(3,69801,0),(3,98231,0),(3,10001001,8912896),(3,10001002,8388608),(3,10001003,8978432),(3,10001004,8454144),(3,10001005,9043968),(3,10001006,8519680),(3,10001007,9109504),(3,10001008,8585216),(3,10001009,9175040),(3,10001010,8650752),(3,10001011,9240576),(3,10001012,8716288),(3,10001013,9306112),(3,10001014,8781824),(3,10001015,9633792),(3,10001016,9371648),(3,10001017,9764864),(3,10001018,9502720),(3,10001019,9830400),(3,10001020,9568256),(3,10001021,10158080),(3,10001022,9895936),(3,10001023,10223616),(3,10001024,9961472),(3,10001025,10289152),(3,10001026,10027008),(3,10001027,10354688),(3,10001028,10092544),(3,10001029,16515072),(3,10001030,16449536),(3,10001031,17629184),(3,10001032,17563648),(3,10001033,17694720),(3,10001034,17891328),(3,10001035,18284544),(3,10001036,18219008),(3,10001037,18874368),(3,10001038,18939904),(3,10001039,21233664),(3,10001040,21299200),(3,10001041,22020096),(3,10001042,21954560),(3,10001043,23986176),(3,10001044,24051712),(3,10001045,28246016),(3,10001046,28180480),(3,10001047,28377088),(3,10001048,28311552),(3,10001049,30408704),(3,10001050,30343168),(3,10001051,30474240),(3,10001052,30539776),(3,10001053,111738880),(3,10001054,111804416),(3,10001055,112197632),(3,10001056,112656384),(3,10001057,112721920),(3,98231521,0),(4,5152,0),(4,6983,1740096997),(4,17101,0),(4,30001,1),(4,40851,1),(4,45144,1),(4,45162,1),(4,69801,0),(4,98231,0),(4,10001001,8912896),(4,10001002,8388608),(4,10001003,8978432),(4,10001004,8454144),(4,10001005,9043968),(4,10001006,8519680),(4,10001007,9109504),(4,10001008,8585216),(4,10001009,9175040),(4,10001010,8650752),(4,10001011,9240576),(4,10001012,8716288),(4,10001013,9306112),(4,10001014,8781824),(4,10001015,9633792),(4,10001016,9371648),(4,10001017,9764864),(4,10001018,9502720),(4,10001019,9830400),(4,10001020,9568256),(4,10001021,10158080),(4,10001022,9895936),(4,10001023,10223616),(4,10001024,9961472),(4,10001025,10289152),(4,10001026,10027008),(4,10001027,10354688),(4,10001028,10092544),(4,10001029,16515072),(4,10001030,16449536),(4,10001031,17629184),(4,10001032,17563648),(4,10001033,17694720),(4,10001034,17891328),(4,10001035,18284544),(4,10001036,18219008),(4,10001037,18874368),(4,10001038,18939904),(4,10001039,21233664),(4,10001040,21299200),(4,10001041,22020096),(4,10001042,21954560),(4,10001043,23986176),(4,10001044,24051712),(4,10001045,28246016),(4,10001046,28180480),(4,10001047,28377088),(4,10001048,28311552),(4,10001049,30408704),(4,10001050,30343168),(4,10001051,30474240),(4,10001052,30539776),(4,10001053,111738880),(4,10001054,111804416),(4,10001055,112197632),(4,10001056,112656384),(4,10001057,112721920),(4,98231521,0),(5,5152,0),(5,6983,1740097004),(5,17101,0),(5,30001,1),(5,40851,1),(5,45144,1),(5,45162,1),(5,69801,0),(5,98231,0),(5,10001001,8912896),(5,10001002,8388608),(5,10001003,8978432),(5,10001004,8454144),(5,10001005,9043968),(5,10001006,8519680),(5,10001007,9109504),(5,10001008,8585216),(5,10001009,9175040),(5,10001010,8650752),(5,10001011,9240576),(5,10001012,8716288),(5,10001013,9306112),(5,10001014,8781824),(5,10001015,9633792),(5,10001016,9371648),(5,10001017,9764864),(5,10001018,9502720),(5,10001019,9830400),(5,10001020,9568256),(5,10001021,10158080),(5,10001022,9895936),(5,10001023,10223616),(5,10001024,9961472),(5,10001025,10289152),(5,10001026,10027008),(5,10001027,10354688),(5,10001028,10092544),(5,10001029,16515072),(5,10001030,16449536),(5,10001031,17629184),(5,10001032,17563648),(5,10001033,17694720),(5,10001034,17891328),(5,10001035,18284544),(5,10001036,18219008),(5,10001037,18874368),(5,10001038,18939904),(5,10001039,21233664),(5,10001040,21299200),(5,10001041,22020096),(5,10001042,21954560),(5,10001043,23986176),(5,10001044,24051712),(5,10001045,28246016),(5,10001046,28180480),(5,10001047,28377088),(5,10001048,28311552),(5,10001049,30408704),(5,10001050,30343168),(5,10001051,30474240),(5,10001052,30539776),(5,10001053,111738880),(5,10001054,111804416),(5,10001055,112197632),(5,10001056,112656384),(5,10001057,112721920),(5,98231521,0),(11930,5152,0),(11930,6983,1740097131),(11930,17101,0),(11930,30001,1),(11930,40852,1),(11930,45162,1),(11930,98231,0),(11930,10001001,9437184),(11930,10001002,9699328),(11930,10001003,115081216),(11930,10001004,115146752),(11930,10001005,115212288),(11930,10001006,115277824),(11931,5152,0),(11931,6983,1740097005),(11931,17101,0),(11931,30001,1),(11931,40853,1),(11931,45162,1),(11931,98231,0),(11931,10001001,114425856),(11931,10001002,114491392),(11931,10001003,114556928),(11931,10001004,114622464),(11931,10001005,114688000),(11931,10001006,114753536),(11931,10001007,114819072),(11931,10001008,114884608),(11931,10001009,114950144),(11931,10001010,115015680),(11934,0,1756303165),(11934,3991,1756385590),(11934,3992,1756386659),(11934,5152,0),(11934,5170,0),(11934,5171,0),(11934,5172,0),(11934,5173,0),(11934,5174,0),(11934,5175,0),(11934,5176,0),(11934,5177,0),(11934,5178,0),(11934,5179,0),(11934,5180,0),(11934,5181,0),(11934,5182,0),(11934,5183,0),(11934,5184,0),(11934,5185,0),(11934,5186,0),(11934,5187,0),(11934,5933,1756380334),(11934,5934,1756381657),(11934,5941,1756383952),(11934,6983,1756368005),(11934,17101,0),(11934,30001,1),(11934,40851,1),(11934,40854,1),(11934,44958,1756355887),(11934,45001,0),(11934,45162,1),(11934,50722,0),(11934,60002,1756343155),(11934,98231,0),(11934,99963,1),(11934,99964,1),(11934,99965,1),(11934,99966,1),(11934,99969,1),(11934,10001001,8912896),(11934,10001002,8388608),(11934,10001003,8978432),(11934,10001004,8454144),(11934,10001005,9043968),(11934,10001006,8519680),(11934,10001007,9109504),(11934,10001008,8585216),(11934,10001009,9175040),(11934,10001010,8650752),(11934,10001011,9240576),(11934,10001012,8716288),(11934,10001013,9306112),(11934,10001014,8781824),(11934,10001015,9633792),(11934,10001016,9371648),(11934,10001017,9764864),(11934,10001018,9502720),(11934,10001019,9830400),(11934,10001020,9568256),(11934,10001021,10158080),(11934,10001022,9895936),(11934,10001023,10223616),(11934,10001024,9961472),(11934,10001025,10289152),(11934,10001026,10027008),(11934,10001027,10354688),(11934,10001028,10092544),(11934,10001029,16515072),(11934,10001030,16449536),(11934,10001031,17629184),(11934,10001032,17563648),(11934,10001033,17694720),(11934,10001034,17891328),(11934,10001035,18284544),(11934,10001036,18219008),(11934,10001037,18874368),(11934,10001038,18939904),(11934,10001039,21233664),(11934,10001040,21299200),(11934,10001041,22020096),(11934,10001042,21954560),(11934,10001043,23986176),(11934,10001044,24051712),(11934,10001045,28246016),(11934,10001046,28180480),(11934,10001047,28377088),(11934,10001048,28311552),(11934,10001049,30408704),(11934,10001050,30343168),(11934,10001051,30474240),(11934,10001052,30539776),(11934,10001053,122945536),(11934,10001054,123273216),(11934,10001055,123404288),(11934,10001056,123731968),(11934,10001057,123797504),(11934,10001058,123863040),(11934,10001059,123928576),(11934,10002011,226),(11935,5152,0),(11935,6983,1740097001),(11935,17101,0),(11935,30001,1),(11935,40854,1),(11935,45162,1),(11935,98231,0),(11935,10001001,113377280),(11935,10001002,113704960),(11935,10001003,113836032),(11935,10001004,114163712),(11935,10001005,114229248),(11935,10001006,114294784),(11935,10001007,114360320),(11936,1,681),(11936,5151,5),(11936,5152,6),(11936,5170,0),(11936,5171,0),(11936,5172,0),(11936,5173,0),(11936,5174,0),(11936,5175,0),(11936,5176,0),(11936,5177,0),(11936,5178,0),(11936,5179,0),(11936,5180,0),(11936,5181,0),(11936,5182,0),(11936,5183,0),(11936,5184,0),(11936,5185,0),(11936,5186,0),(11936,5187,0),(11936,5190,1756341948),(11936,5191,1756347853),(11936,6983,1756368005),(11936,7100,0),(11936,17101,0),(11936,30001,1),(11936,40851,1),(11936,44958,1756359701),(11936,45001,0),(11936,45162,1),(11936,98231,0),(11936,99963,1),(11936,99964,1),(11936,10001001,8912896),(11936,10001002,8388608),(11936,10001003,8978432),(11936,10001004,8454144),(11936,10001005,9043968),(11936,10001006,8519680),(11936,10001007,9109504),(11936,10001008,8585216),(11936,10001009,9175040),(11936,10001010,8650752),(11936,10001011,9240576),(11936,10001012,8716288),(11936,10001013,9306112),(11936,10001014,8781824),(11936,10001015,9633792),(11936,10001016,9371648),(11936,10001017,9764864),(11936,10001018,9502720),(11936,10001019,9830400),(11936,10001020,9568256),(11936,10001021,10158080),(11936,10001022,9895936),(11936,10001023,10223616),(11936,10001024,9961472),(11936,10001025,10289152),(11936,10001026,10027008),(11936,10001027,10354688),(11936,10001028,10092544),(11936,10001029,16515072),(11936,10001030,16449536),(11936,10001031,17629184),(11936,10001032,17563648),(11936,10001033,17694720),(11936,10001034,17891328),(11936,10001035,18284544),(11936,10001036,18219008),(11936,10001037,18874368),(11936,10001038,18939904),(11936,10001039,21233664),(11936,10001040,21299200),(11936,10001041,22020096),(11936,10001042,21954560),(11936,10001043,23986176),(11936,10001044,24051712),(11936,10001045,28246016),(11936,10001046,28180480),(11936,10001047,28377088),(11936,10001048,28311552),(11936,10001049,30408704),(11936,10001050,30343168),(11936,10001051,30474240),(11936,10001052,30539776),(11936,10002002,33554432),(11936,10002011,57),(11937,1,498),(11937,1958,501),(11937,5151,5),(11937,5152,6),(11937,5170,0),(11937,5171,0),(11937,5172,0),(11937,5173,0),(11937,5174,0),(11937,5175,0),(11937,5176,0),(11937,5177,0),(11937,5178,0),(11937,5179,0),(11937,5180,0),(11937,5181,0),(11937,5182,0),(11937,5183,0),(11937,5184,0),(11937,5185,0),(11937,5186,0),(11937,5187,0),(11937,5190,1756341937),(11937,5191,1756347846),(11937,6983,1756368005),(11937,17101,0),(11937,30001,1),(11937,40851,1),(11937,44958,1756359356),(11937,45001,0),(11937,45162,1),(11937,98231,0),(11937,99963,1),(11937,99964,1),(11937,10001001,8912896),(11937,10001002,8388608),(11937,10001003,8978432),(11937,10001004,8454144),(11937,10001005,9043968),(11937,10001006,8519680),(11937,10001007,9109504),(11937,10001008,8585216),(11937,10001009,9175040),(11937,10001010,8650752),(11937,10001011,9240576),(11937,10001012,8716288),(11937,10001013,9306112),(11937,10001014,8781824),(11937,10001015,9633792),(11937,10001016,9371648),(11937,10001017,9764864),(11937,10001018,9502720),(11937,10001019,9830400),(11937,10001020,9568256),(11937,10001021,10158080),(11937,10001022,9895936),(11937,10001023,10223616),(11937,10001024,9961472),(11937,10001025,10289152),(11937,10001026,10027008),(11937,10001027,10354688),(11937,10001028,10092544),(11937,10001029,16515072),(11937,10001030,16449536),(11937,10001031,17629184),(11937,10001032,17563648),(11937,10001033,17694720),(11937,10001034,17891328),(11937,10001035,18284544),(11937,10001036,18219008),(11937,10001037,18874368),(11937,10001038,18939904),(11937,10001039,21233664),(11937,10001040,21299200),(11937,10001041,22020096),(11937,10001042,21954560),(11937,10001043,23986176),(11937,10001044,24051712),(11937,10001045,28246016),(11937,10001046,28180480),(11937,10001047,28377088),(11937,10001048,28311552),(11937,10001049,30408704),(11937,10001050,30343168),(11937,10001051,30474240),(11937,10001052,30539776),(11937,10002003,524288),(11937,10002011,82),(11938,1956,201),(11938,5152,0),(11938,5170,0),(11938,5171,0),(11938,5172,0),(11938,5173,0),(11938,5174,0),(11938,5175,0),(11938,5176,0),(11938,5177,0),(11938,5178,0),(11938,5179,0),(11938,5180,0),(11938,5181,0),(11938,5182,0),(11938,5183,0),(11938,5184,0),(11938,5185,0),(11938,5186,0),(11938,5187,0),(11938,6983,1756334304),(11938,17101,0),(11938,30001,1),(11938,40851,1),(11938,45001,0),(11938,45162,1),(11938,50722,0),(11938,98231,0),(11938,10001001,8912896),(11938,10001002,8388608),(11938,10001003,8978432),(11938,10001004,8454144),(11938,10001005,9043968),(11938,10001006,8519680),(11938,10001007,9109504),(11938,10001008,8585216),(11938,10001009,9175040),(11938,10001010,8650752),(11938,10001011,9240576),(11938,10001012,8716288),(11938,10001013,9306112),(11938,10001014,8781824),(11938,10001015,9633792),(11938,10001016,9371648),(11938,10001017,9764864),(11938,10001018,9502720),(11938,10001019,9830400),(11938,10001020,9568256),(11938,10001021,10158080),(11938,10001022,9895936),(11938,10001023,10223616),(11938,10001024,9961472),(11938,10001025,10289152),(11938,10001026,10027008),(11938,10001027,10354688),(11938,10001028,10092544),(11938,10001029,16515072),(11938,10001030,16449536),(11938,10001031,17629184),(11938,10001032,17563648),(11938,10001033,17694720),(11938,10001034,17891328),(11938,10001035,18284544),(11938,10001036,18219008),(11938,10001037,18874368),(11938,10001038,18939904),(11938,10001039,21233664),(11938,10001040,21299200),(11938,10001041,22020096),(11938,10001042,21954560),(11938,10001043,23986176),(11938,10001044,24051712),(11938,10001045,28246016),(11938,10001046,28180480),(11938,10001047,28377088),(11938,10001048,28311552),(11938,10001049,30408704),(11938,10001050,30343168),(11938,10001051,30474240),(11938,10001052,30539776),(11939,0,1756355309),(11939,1,522),(11939,1957,1),(11939,5152,0),(11939,5170,0),(11939,5171,0),(11939,5172,0),(11939,5173,0),(11939,5174,0),(11939,5175,0),(11939,5176,0),(11939,5177,0),(11939,5178,0),(11939,5179,0),(11939,5180,0),(11939,5181,0),(11939,5182,0),(11939,5183,0),(11939,5184,0),(11939,5185,0),(11939,5186,0),(11939,5187,0),(11939,6983,1756351233),(11939,7100,0),(11939,17101,0),(11939,30001,1),(11939,35707,1),(11939,35709,1),(11939,35710,1),(11939,40851,1),(11939,44958,1756357772),(11939,45001,0),(11939,45162,1),(11939,50722,0),(11939,98231,0),(11939,99963,1),(11939,10001001,8912896),(11939,10001002,8388608),(11939,10001003,8978432),(11939,10001004,8454144),(11939,10001005,9043968),(11939,10001006,8519680),(11939,10001007,9109504),(11939,10001008,8585216),(11939,10001009,9175040),(11939,10001010,8650752),(11939,10001011,9240576),(11939,10001012,8716288),(11939,10001013,9306112),(11939,10001014,8781824),(11939,10001015,9633792),(11939,10001016,9371648),(11939,10001017,9764864),(11939,10001018,9502720),(11939,10001019,9830400),(11939,10001020,9568256),(11939,10001021,10158080),(11939,10001022,9895936),(11939,10001023,10223616),(11939,10001024,9961472),(11939,10001025,10289152),(11939,10001026,10027008),(11939,10001027,10354688),(11939,10001028,10092544),(11939,10001029,16515072),(11939,10001030,16449536),(11939,10001031,17629184),(11939,10001032,17563648),(11939,10001033,17694720),(11939,10001034,17891328),(11939,10001035,18284544),(11939,10001036,18219008),(11939,10001037,18874368),(11939,10001038,18939904),(11939,10001039,21233664),(11939,10001040,21299200),(11939,10001041,22020096),(11939,10001042,21954560),(11939,10001043,23986176),(11939,10001044,24051712),(11939,10001045,28246016),(11939,10001046,28180480),(11939,10001047,28377088),(11939,10001048,28311552),(11939,10001049,30408704),(11939,10001050,30343168),(11939,10001051,30474240),(11939,10001052,30539776),(11939,10002003,536870912),(11939,10002011,92),(11940,0,1756356024),(11940,1,832),(11940,1958,1),(11940,5151,3),(11940,5152,4),(11940,5170,0),(11940,5171,0),(11940,5172,2),(11940,5173,0),(11940,5174,0),(11940,5175,0),(11940,5176,0),(11940,5177,0),(11940,5178,0),(11940,5179,0),(11940,5180,0),(11940,5181,0),(11940,5182,0),(11940,5183,0),(11940,5184,0),(11940,5185,0),(11940,5186,0),(11940,5187,0),(11940,5190,1756338992),(11940,5191,1756343617),(11940,5192,1756358207),(11940,6983,1756368005),(11940,7100,0),(11940,17101,0),(11940,30001,1),(11940,35706,1),(11940,35707,1),(11940,35711,1),(11940,40851,1),(11940,44958,1756361868),(11940,45001,0),(11940,45162,1),(11940,51052,1),(11940,51053,1756352050),(11940,77658,1),(11940,98231,0),(11940,99963,1),(11940,99964,1),(11940,10001001,8912896),(11940,10001002,8388608),(11940,10001003,8978432),(11940,10001004,8454144),(11940,10001005,9043968),(11940,10001006,8519680),(11940,10001007,9109504),(11940,10001008,8585216),(11940,10001009,9175040),(11940,10001010,8650752),(11940,10001011,9240576),(11940,10001012,8716288),(11940,10001013,9306112),(11940,10001014,8781824),(11940,10001015,9633792),(11940,10001016,9371648),(11940,10001017,9764864),(11940,10001018,9502720),(11940,10001019,9830400),(11940,10001020,9568256),(11940,10001021,10158080),(11940,10001022,9895936),(11940,10001023,10223616),(11940,10001024,9961472),(11940,10001025,10289152),(11940,10001026,10027008),(11940,10001027,10354688),(11940,10001028,10092544),(11940,10001029,16515072),(11940,10001030,16449536),(11940,10001031,17629184),(11940,10001032,17563648),(11940,10001033,17694720),(11940,10001034,17891328),(11940,10001035,18284544),(11940,10001036,18219008),(11940,10001037,18874368),(11940,10001038,18939904),(11940,10001039,21233664),(11940,10001040,21299200),(11940,10001041,22020096),(11940,10001042,21954560),(11940,10001043,23986176),(11940,10001044,24051712),(11940,10001045,28246016),(11940,10001046,28180480),(11940,10001047,28377088),(11940,10001048,28311552),(11940,10001049,30408704),(11940,10001050,30343168),(11940,10001051,30474240),(11940,10001052,30539776),(11940,10001053,81461251),(11940,10001054,81526787),(11940,10002008,402653184),(11940,10002011,246),(11941,5152,0),(11941,6983,1756341512),(11941,17101,0),(11941,30001,1),(11941,40853,1),(11941,45001,0),(11941,45162,1),(11941,98231,0),(11941,10001001,123994112),(11941,10001002,124059648),(11941,10001003,124125184),(11941,10001004,124190720),(11941,10001005,124256256),(11941,10001006,124321792),(11941,10001007,124387328),(11941,10001008,124452864),(11941,10001009,124518400),(11941,10001010,124583936),(11942,5152,0),(11942,6983,1756338703),(11942,17101,0),(11942,30001,1),(11942,40853,1),(11942,44958,1756338694),(11942,45001,0),(11942,45162,1),(11942,50722,0),(11942,98231,0),(11942,10001001,123994112),(11942,10001002,124059648),(11942,10001003,124125184),(11942,10001004,124190720),(11942,10001005,124256256),(11942,10001006,124321792),(11942,10001007,124387328),(11942,10001008,124452864),(11942,10001009,124518400),(11942,10001010,124583936),(11943,1,629),(11943,1957,172),(11943,5151,0),(11943,5152,1),(11943,5170,0),(11943,5171,0),(11943,5172,0),(11943,5173,0),(11943,5174,0),(11943,5175,0),(11943,5176,0),(11943,5177,0),(11943,5178,0),(11943,5179,0),(11943,5180,0),(11943,5181,0),(11943,5182,0),(11943,5183,0),(11943,5184,0),(11943,5185,0),(11943,5186,0),(11943,5187,0),(11943,5190,1756337523),(11943,6983,1756368005),(11943,7100,0),(11943,17101,0),(11943,30001,1),(11943,40851,1),(11943,44958,1756345787),(11943,45001,0),(11943,45162,1),(11943,50722,0),(11943,77658,1),(11943,98231,0),(11943,99963,1),(11943,10001001,8912896),(11943,10001002,8388608),(11943,10001003,8978432),(11943,10001004,8454144),(11943,10001005,9043968),(11943,10001006,8519680),(11943,10001007,9109504),(11943,10001008,8585216),(11943,10001009,9175040),(11943,10001010,8650752),(11943,10001011,9240576),(11943,10001012,8716288),(11943,10001013,9306112),(11943,10001014,8781824),(11943,10001015,9633792),(11943,10001016,9371648),(11943,10001017,9764864),(11943,10001018,9502720),(11943,10001019,9830400),(11943,10001020,9568256),(11943,10001021,10158080),(11943,10001022,9895936),(11943,10001023,10223616),(11943,10001024,9961472),(11943,10001025,10289152),(11943,10001026,10027008),(11943,10001027,10354688),(11943,10001028,10092544),(11943,10001029,16515072),(11943,10001030,16449536),(11943,10001031,17629184),(11943,10001032,17563648),(11943,10001033,17694720),(11943,10001034,17891328),(11943,10001035,18284544),(11943,10001036,18219008),(11943,10001037,18874368),(11943,10001038,18939904),(11943,10001039,21233664),(11943,10001040,21299200),(11943,10001041,22020096),(11943,10001042,21954560),(11943,10001043,23986176),(11943,10001044,24051712),(11943,10001045,28246016),(11943,10001046,28180480),(11943,10001047,28377088),(11943,10001048,28311552),(11943,10001049,30408704),(11943,10001050,30343168),(11943,10001051,30474240),(11943,10001052,30539776),(11947,1,566),(11947,1957,59),(11947,5151,2),(11947,5152,3),(11947,5170,0),(11947,5171,1),(11947,5172,0),(11947,5173,0),(11947,5174,0),(11947,5175,0),(11947,5176,0),(11947,5177,0),(11947,5178,0),(11947,5179,0),(11947,5180,0),(11947,5181,0),(11947,5182,0),(11947,5183,0),(11947,5184,0),(11947,5185,0),(11947,5186,0),(11947,5187,0),(11947,5190,1756340508),(11947,5191,1756353883),(11947,6983,1756368005),(11947,17101,0),(11947,30001,1),(11947,40851,1),(11947,44958,1756358050),(11947,45001,0),(11947,45162,1),(11947,50722,0),(11947,98231,0),(11947,99963,1),(11947,10001001,8912896),(11947,10001002,8388608),(11947,10001003,8978432),(11947,10001004,8454144),(11947,10001005,9043968),(11947,10001006,8519680),(11947,10001007,9109504),(11947,10001008,8585216),(11947,10001009,9175040),(11947,10001010,8650752),(11947,10001011,9240576),(11947,10001012,8716288),(11947,10001013,9306112),(11947,10001014,8781824),(11947,10001015,9633792),(11947,10001016,9371648),(11947,10001017,9764864),(11947,10001018,9502720),(11947,10001019,9830400),(11947,10001020,9568256),(11947,10001021,10158080),(11947,10001022,9895936),(11947,10001023,10223616),(11947,10001024,9961472),(11947,10001025,10289152),(11947,10001026,10027008),(11947,10001027,10354688),(11947,10001028,10092544),(11947,10001029,16515072),(11947,10001030,16449536),(11947,10001031,17629184),(11947,10001032,17563648),(11947,10001033,17694720),(11947,10001034,17891328),(11947,10001035,18284544),(11947,10001036,18219008),(11947,10001037,18874368),(11947,10001038,18939904),(11947,10001039,21233664),(11947,10001040,21299200),(11947,10001041,22020096),(11947,10001042,21954560),(11947,10001043,23986176),(11947,10001044,24051712),(11947,10001045,28246016),(11947,10001046,28180480),(11947,10001047,28377088),(11947,10001048,28311552),(11947,10001049,30408704),(11947,10001050,30343168),(11947,10001051,30474240),(11947,10001052,30539776),(11948,1,908),(11948,1960,393),(11948,5004,1),(11948,5151,0),(11948,5152,1),(11948,5170,1),(11948,5171,0),(11948,5172,0),(11948,5173,0),(11948,5174,0),(11948,5175,0),(11948,5176,0),(11948,5177,0),(11948,5178,0),(11948,5179,0),(11948,5180,0),(11948,5181,0),(11948,5182,0),(11948,5183,0),(11948,5184,0),(11948,5185,0),(11948,5186,0),(11948,5187,0),(11948,5190,1756338924),(11948,6983,1756346651),(11948,7100,0),(11948,17101,0),(11948,30001,1),(11948,40851,1),(11948,44958,1756346542),(11948,45001,0),(11948,45162,1),(11948,50722,0),(11948,60002,1756342889),(11948,77658,1),(11948,98231,0),(11948,99963,1),(11948,10001001,8912896),(11948,10001002,8388608),(11948,10001003,8978432),(11948,10001004,8454144),(11948,10001005,9043968),(11948,10001006,8519680),(11948,10001007,9109504),(11948,10001008,8585216),(11948,10001009,9175040),(11948,10001010,8650752),(11948,10001011,9240576),(11948,10001012,8716288),(11948,10001013,9306112),(11948,10001014,8781824),(11948,10001015,9633792),(11948,10001016,9371648),(11948,10001017,9764864),(11948,10001018,9502720),(11948,10001019,9830400),(11948,10001020,9568256),(11948,10001021,10158080),(11948,10001022,9895936),(11948,10001023,10223616),(11948,10001024,9961472),(11948,10001025,10289152),(11948,10001026,10027008),(11948,10001027,10354688),(11948,10001028,10092544),(11948,10001029,16515072),(11948,10001030,16449536),(11948,10001031,17629184),(11948,10001032,17563648),(11948,10001033,17694720),(11948,10001034,17891328),(11948,10001035,18284544),(11948,10001036,18219008),(11948,10001037,18874368),(11948,10001038,18939904),(11948,10001039,21233664),(11948,10001040,21299200),(11948,10001041,22020096),(11948,10001042,21954560),(11948,10001043,23986176),(11948,10001044,24051712),(11948,10001045,28246016),(11948,10001046,28180480),(11948,10001047,28377088),(11948,10001048,28311552),(11948,10001049,30408704),(11948,10001050,30343168),(11948,10001051,30474240),(11948,10001052,30539776),(11953,1,1044),(11953,1099,1),(11953,1956,1),(11953,5151,0),(11953,5152,1),(11953,5170,0),(11953,5171,0),(11953,5172,0),(11953,5173,0),(11953,5174,0),(11953,5175,0),(11953,5176,0),(11953,5177,0),(11953,5178,0),(11953,5179,0),(11953,5180,0),(11953,5181,0),(11953,5182,0),(11953,5183,0),(11953,5184,0),(11953,5185,0),(11953,5186,0),(11953,5187,0),(11953,5190,1756339822),(11953,6983,1756368005),(11953,7100,0),(11953,17101,0),(11953,30001,1),(11953,40852,1),(11953,44958,1756346356),(11953,45001,0),(11953,45162,1),(11953,50722,0),(11953,51052,0),(11953,51053,1756337904),(11953,77658,1),(11953,98231,0),(11953,99963,1),(11953,10001001,9437184),(11953,10001002,9699328),(11953,10001003,124846080),(11953,10001004,124780544),(11953,10001005,124649472),(11953,10001006,124715008),(11954,0,1756350103),(11954,1,1430),(11954,5151,5),(11954,5152,6),(11954,5170,0),(11954,5171,1),(11954,5172,0),(11954,5173,0),(11954,5174,0),(11954,5175,0),(11954,5176,0),(11954,5177,0),(11954,5178,0),(11954,5179,0),(11954,5180,0),(11954,5181,0),(11954,5182,0),(11954,5183,0),(11954,5184,0),(11954,5185,0),(11954,5186,0),(11954,5187,0),(11954,5191,1756359900),(11954,6983,1756359920),(11954,7094,1756352940),(11954,17101,0),(11954,30001,2),(11954,40851,1),(11954,44958,1756359896),(11954,45001,0),(11954,45162,1),(11954,50722,0),(11954,81700,1),(11954,98231,0),(11954,99963,1),(11954,10001001,8912896),(11954,10001002,8388608),(11954,10001003,8978432),(11954,10001004,8454144),(11954,10001005,9043968),(11954,10001006,8519680),(11954,10001007,9109504),(11954,10001008,8585216),(11954,10001009,9175040),(11954,10001010,8650752),(11954,10001011,9240576),(11954,10001012,8716288),(11954,10001013,9306112),(11954,10001014,8781824),(11954,10001015,9633792),(11954,10001016,9371648),(11954,10001017,9764864),(11954,10001018,9502720),(11954,10001019,9830400),(11954,10001020,9568256),(11954,10001021,10158080),(11954,10001022,9895936),(11954,10001023,10223616),(11954,10001024,9961472),(11954,10001025,10289152),(11954,10001026,10027008),(11954,10001027,10354688),(11954,10001028,10092544),(11954,10001029,16515072),(11954,10001030,16449536),(11954,10001031,17629184),(11954,10001032,17563648),(11954,10001033,17694720),(11954,10001034,17891328),(11954,10001035,18284544),(11954,10001036,18219008),(11954,10001037,18874368),(11954,10001038,18939904),(11954,10001039,21233664),(11954,10001040,21299200),(11954,10001041,22020096),(11954,10001042,21954560),(11954,10001043,23986176),(11954,10001044,24051712),(11954,10001045,28246016),(11954,10001046,28180480),(11954,10001047,28377088),(11954,10001048,28311552),(11954,10001049,30408704),(11954,10001050,30343168),(11954,10001051,30474240),(11954,10001052,30539776),(11954,10001053,41549827),(11954,10001054,41615363),(11956,1,280),(11956,5152,0),(11956,5170,0),(11956,5171,0),(11956,5172,0),(11956,5173,0),(11956,5174,0),(11956,5175,0),(11956,5176,0),(11956,5177,0),(11956,5178,0),(11956,5179,0),(11956,5180,0),(11956,5181,0),(11956,5182,0),(11956,5183,0),(11956,5184,0),(11956,5185,0),(11956,5186,0),(11956,5187,0),(11956,6983,1756344021),(11956,17101,0),(11956,30001,1),(11956,40853,1),(11956,44958,1756341121),(11956,45001,0),(11956,45162,1),(11956,50722,0),(11956,77658,1),(11956,98231,0),(11956,10001001,123994112),(11956,10001002,124059648),(11956,10001003,124125184),(11956,10001004,124190720),(11956,10001005,124256256),(11956,10001006,124321792),(11956,10001007,124387328),(11956,10001008,124452864),(11956,10001009,124518400),(11956,10001010,124583936),(11957,5152,0),(11957,6983,1756335979),(11957,17101,0),(11957,40854,1),(11957,44958,1756335936),(11957,45001,0),(11957,45162,1),(11957,50722,0),(11957,98231,0),(11957,10001001,122945536),(11957,10001002,123273216),(11957,10001003,123404288),(11957,10001004,123731968),(11957,10001005,123797504),(11957,10001006,123863040),(11957,10001007,123928576),(11959,5152,0),(11959,6983,1756334985),(11959,17101,0),(11959,40854,1),(11959,45001,0),(11959,45162,1),(11959,98231,0),(11959,10001001,122945536),(11959,10001002,123273216),(11959,10001003,123404288),(11959,10001004,123731968),(11959,10001005,123797504),(11959,10001006,123863040),(11959,10001007,123928576),(11960,5152,0),(11960,5170,0),(11960,5171,0),(11960,5172,0),(11960,5173,0),(11960,5174,0),(11960,5175,0),(11960,5176,0),(11960,5177,0),(11960,5178,0),(11960,5179,0),(11960,5180,0),(11960,5181,0),(11960,5182,0),(11960,5183,0),(11960,5184,0),(11960,5185,0),(11960,5186,0),(11960,5187,0),(11960,6983,1756341037),(11960,17101,0),(11960,30001,1),(11960,40851,1),(11960,44958,1756336862),(11960,45001,0),(11960,45162,1),(11960,50722,0),(11960,98231,0),(11960,10001001,8912896),(11960,10001002,8388608),(11960,10001003,8978432),(11960,10001004,8454144),(11960,10001005,9043968),(11960,10001006,8519680),(11960,10001007,9109504),(11960,10001008,8585216),(11960,10001009,9175040),(11960,10001010,8650752),(11960,10001011,9240576),(11960,10001012,8716288),(11960,10001013,9306112),(11960,10001014,8781824),(11960,10001015,9633792),(11960,10001016,9371648),(11960,10001017,9764864),(11960,10001018,9502720),(11960,10001019,9830400),(11960,10001020,9568256),(11960,10001021,10158080),(11960,10001022,9895936),(11960,10001023,10223616),(11960,10001024,9961472),(11960,10001025,10289152),(11960,10001026,10027008),(11960,10001027,10354688),(11960,10001028,10092544),(11960,10001029,16515072),(11960,10001030,16449536),(11960,10001031,17629184),(11960,10001032,17563648),(11960,10001033,17694720),(11960,10001034,17891328),(11960,10001035,18284544),(11960,10001036,18219008),(11960,10001037,18874368),(11960,10001038,18939904),(11960,10001039,21233664),(11960,10001040,21299200),(11960,10001041,22020096),(11960,10001042,21954560),(11960,10001043,23986176),(11960,10001044,24051712),(11960,10001045,28246016),(11960,10001046,28180480),(11960,10001047,28377088),(11960,10001048,28311552),(11960,10001049,30408704),(11960,10001050,30343168),(11960,10001051,30474240),(11960,10001052,30539776),(11964,0,1756342984),(11964,1,1033),(11964,1957,182),(11964,5151,1),(11964,5152,2),(11964,5170,1),(11964,5171,1),(11964,5172,0),(11964,5173,0),(11964,5174,0),(11964,5175,0),(11964,5176,0),(11964,5177,0),(11964,5178,0),(11964,5179,0),(11964,5180,0),(11964,5181,0),(11964,5182,0),(11964,5183,0),(11964,5184,0),(11964,5185,0),(11964,5186,0),(11964,5187,0),(11964,5190,1756336269),(11964,5191,1756337376),(11964,6983,1756348941),(11964,7100,0),(11964,9992,1756349653),(11964,17101,0),(11964,30001,1),(11964,35705,1),(11964,35710,1),(11964,40854,1),(11964,44958,1756346496),(11964,45001,0),(11964,45162,1),(11964,77658,1),(11964,98231,0),(11964,99963,1),(11964,10001001,122945536),(11964,10001002,123273216),(11964,10001003,123404288),(11964,10001004,123731968),(11964,10001005,123797504),(11964,10001006,123863040),(11964,10001007,123928576),(11964,10002003,256),(11964,10002011,71),(11965,1,1512),(11965,5151,6),(11965,5152,7),(11965,5170,0),(11965,5171,1),(11965,5172,0),(11965,5173,0),(11965,5174,0),(11965,5175,0),(11965,5176,0),(11965,5177,0),(11965,5178,0),(11965,5179,0),(11965,5180,0),(11965,5181,0),(11965,5182,0),(11965,5183,0),(11965,5184,0),(11965,5185,0),(11965,5186,0),(11965,5187,0),(11965,5190,1756336272),(11965,5191,1756350789),(11965,6983,1756351250),(11965,7100,0),(11965,17101,0),(11965,30001,1),(11965,40851,1),(11965,44958,1756351034),(11965,45001,0),(11965,45162,1),(11965,50722,0),(11965,77658,1),(11965,98231,0),(11965,99963,1),(11965,10001001,8912896),(11965,10001002,8388608),(11965,10001003,8978432),(11965,10001004,8454144),(11965,10001005,9043968),(11965,10001006,8519680),(11965,10001007,9109504),(11965,10001008,8585216),(11965,10001009,9175040),(11965,10001010,8650752),(11965,10001011,9240576),(11965,10001012,8716288),(11965,10001013,9306112),(11965,10001014,8781824),(11965,10001015,9633792),(11965,10001016,9371648),(11965,10001017,9764864),(11965,10001018,9502720),(11965,10001019,9830400),(11965,10001020,9568256),(11965,10001021,10158080),(11965,10001022,9895936),(11965,10001023,10223616),(11965,10001024,9961472),(11965,10001025,10289152),(11965,10001026,10027008),(11965,10001027,10354688),(11965,10001028,10092544),(11965,10001029,16515072),(11965,10001030,16449536),(11965,10001031,17629184),(11965,10001032,17563648),(11965,10001033,17694720),(11965,10001034,17891328),(11965,10001035,18284544),(11965,10001036,18219008),(11965,10001037,18874368),(11965,10001038,18939904),(11965,10001039,21233664),(11965,10001040,21299200),(11965,10001041,22020096),(11965,10001042,21954560),(11965,10001043,23986176),(11965,10001044,24051712),(11965,10001045,28246016),(11965,10001046,28180480),(11965,10001047,28377088),(11965,10001048,28311552),(11965,10001049,30408704),(11965,10001050,30343168),(11965,10001051,30474240),(11965,10001052,30539776),(11967,5152,0),(11967,5170,0),(11967,5171,0),(11967,5172,0),(11967,5173,0),(11967,5174,0),(11967,5175,0),(11967,5176,0),(11967,5177,0),(11967,5178,0),(11967,5179,0),(11967,5180,0),(11967,5181,0),(11967,5182,0),(11967,5183,0),(11967,5184,0),(11967,5185,0),(11967,5186,0),(11967,5187,0),(11967,6983,1756349158),(11967,17101,0),(11967,40853,1),(11967,44958,1756349039),(11967,45001,0),(11967,45162,1),(11967,50722,0),(11967,98231,0),(11967,10001001,123994112),(11967,10001002,124059648),(11967,10001003,124125184),(11967,10001004,124190720),(11967,10001005,124256256),(11967,10001006,124321792),(11967,10001007,124387328),(11967,10001008,124452864),(11967,10001009,124518400),(11967,10001010,124583936),(11968,1,700),(11968,1957,121),(11968,5151,0),(11968,5152,1),(11968,5170,1),(11968,5171,0),(11968,5172,0),(11968,5173,0),(11968,5174,0),(11968,5175,0),(11968,5176,0),(11968,5177,0),(11968,5178,0),(11968,5179,0),(11968,5180,0),(11968,5181,0),(11968,5182,0),(11968,5183,0),(11968,5184,0),(11968,5185,0),(11968,5186,0),(11968,5187,0),(11968,5190,1756335660),(11968,6983,1756349051),(11968,7100,0),(11968,17101,0),(11968,30001,1),(11968,40852,1),(11968,44958,1756349022),(11968,45001,0),(11968,45162,1),(11968,77658,1),(11968,98231,0),(11968,10001001,9437184),(11968,10001002,9699328),(11968,10001003,124846080),(11968,10001004,124780544),(11968,10001005,124649472),(11968,10001006,124715008),(11968,10002001,4),(11968,10002011,3),(11969,0,1756358324),(11969,1,1025),(11969,5151,7),(11969,5152,8),(11969,5170,0),(11969,5171,3),(11969,5172,0),(11969,5173,0),(11969,5174,0),(11969,5175,0),(11969,5176,0),(11969,5177,0),(11969,5178,0),(11969,5179,0),(11969,5180,0),(11969,5181,0),(11969,5182,0),(11969,5183,0),(11969,5184,0),(11969,5185,0),(11969,5186,0),(11969,5187,0),(11969,5191,1756363771),(11969,6983,1756368005),(11969,7094,1756357371),(11969,17101,0),(11969,30001,2),(11969,40851,1),(11969,44958,1756365353),(11969,45001,0),(11969,45162,1),(11969,50722,0),(11969,51052,0),(11969,51053,1756344075),(11969,81700,1),(11969,98231,0),(11969,99963,1),(11969,10001001,8912896),(11969,10001002,8388608),(11969,10001003,8978432),(11969,10001004,8454144),(11969,10001005,9043968),(11969,10001006,8519680),(11969,10001007,9109504),(11969,10001008,8585216),(11969,10001009,9175040),(11969,10001010,8650752),(11969,10001011,9240576),(11969,10001012,8716288),(11969,10001013,9306112),(11969,10001014,8781824),(11969,10001015,9633792),(11969,10001016,9371648),(11969,10001017,9764864),(11969,10001018,9502720),(11969,10001019,9830400),(11969,10001020,9568256),(11969,10001021,10158080),(11969,10001022,9895936),(11969,10001023,10223616),(11969,10001024,9961472),(11969,10001025,10289152),(11969,10001026,10027008),(11969,10001027,10354688),(11969,10001028,10092544),(11969,10001029,16515072),(11969,10001030,16449536),(11969,10001031,17629184),(11969,10001032,17563648),(11969,10001033,17694720),(11969,10001034,17891328),(11969,10001035,18284544),(11969,10001036,18219008),(11969,10001037,18874368),(11969,10001038,18939904),(11969,10001039,21233664),(11969,10001040,21299200),(11969,10001041,22020096),(11969,10001042,21954560),(11969,10001043,23986176),(11969,10001044,24051712),(11969,10001045,28246016),(11969,10001046,28180480),(11969,10001047,28377088),(11969,10001048,28311552),(11969,10001049,30408704),(11969,10001050,30343168),(11969,10001051,30474240),(11969,10001052,30539776),(11969,10001053,41549827),(11969,10001054,41615363),(11969,10002002,8404992),(11969,10002011,46),(11970,5152,0),(11970,5170,0),(11970,5171,0),(11970,5172,0),(11970,5173,0),(11970,5174,0),(11970,5175,0),(11970,5176,0),(11970,5177,0),(11970,5178,0),(11970,5179,0),(11970,5180,0),(11970,5181,0),(11970,5182,0),(11970,5183,0),(11970,5184,0),(11970,5185,0),(11970,5186,0),(11970,5187,0),(11970,6983,1756368005),(11970,17101,0),(11970,30001,1),(11970,40851,1),(11970,44958,1756334410),(11970,45001,0),(11970,45162,1),(11970,98231,0),(11970,10001001,8912896),(11970,10001002,8388608),(11970,10001003,8978432),(11970,10001004,8454144),(11970,10001005,9043968),(11970,10001006,8519680),(11970,10001007,9109504),(11970,10001008,8585216),(11970,10001009,9175040),(11970,10001010,8650752),(11970,10001011,9240576),(11970,10001012,8716288),(11970,10001013,9306112),(11970,10001014,8781824),(11970,10001015,9633792),(11970,10001016,9371648),(11970,10001017,9764864),(11970,10001018,9502720),(11970,10001019,9830400),(11970,10001020,9568256),(11970,10001021,10158080),(11970,10001022,9895936),(11970,10001023,10223616),(11970,10001024,9961472),(11970,10001025,10289152),(11970,10001026,10027008),(11970,10001027,10354688),(11970,10001028,10092544),(11970,10001029,16515072),(11970,10001030,16449536),(11970,10001031,17629184),(11970,10001032,17563648),(11970,10001033,17694720),(11970,10001034,17891328),(11970,10001035,18284544),(11970,10001036,18219008),(11970,10001037,18874368),(11970,10001038,18939904),(11970,10001039,21233664),(11970,10001040,21299200),(11970,10001041,22020096),(11970,10001042,21954560),(11970,10001043,23986176),(11970,10001044,24051712),(11970,10001045,28246016),(11970,10001046,28180480),(11970,10001047,28377088),(11970,10001048,28311552),(11970,10001049,30408704),(11970,10001050,30343168),(11970,10001051,30474240),(11970,10001052,30539776),(11971,5152,0),(11971,5170,0),(11971,5171,0),(11971,5172,0),(11971,5173,0),(11971,5174,0),(11971,5175,0),(11971,5176,0),(11971,5177,0),(11971,5178,0),(11971,5179,0),(11971,5180,0),(11971,5181,0),(11971,5182,0),(11971,5183,0),(11971,5184,0),(11971,5185,0),(11971,5186,0),(11971,5187,0),(11971,6983,1756368005),(11971,17101,0),(11971,30001,1),(11971,40854,1),(11971,44958,1756334570),(11971,45001,0),(11971,45162,1),(11971,98231,0),(11971,10001001,122945536),(11971,10001002,123273216),(11971,10001003,123404288),(11971,10001004,123731968),(11971,10001005,123797504),(11971,10001006,123863040),(11971,10001007,123928576),(11972,1956,161),(11972,5152,0),(11972,5170,0),(11972,5171,0),(11972,5172,0),(11972,5173,0),(11972,5174,0),(11972,5175,0),(11972,5176,0),(11972,5177,0),(11972,5178,0),(11972,5179,0),(11972,5180,0),(11972,5181,0),(11972,5182,0),(11972,5183,0),(11972,5184,0),(11972,5185,0),(11972,5186,0),(11972,5187,0),(11972,6983,1756339194),(11972,7100,0),(11972,17101,0),(11972,30001,1),(11972,40851,1),(11972,44958,1756338280),(11972,45001,0),(11972,45162,1),(11972,50722,0),(11972,77658,1),(11972,98231,0),(11972,10001001,8912896),(11972,10001002,8388608),(11972,10001003,8978432),(11972,10001004,8454144),(11972,10001005,9043968),(11972,10001006,8519680),(11972,10001007,9109504),(11972,10001008,8585216),(11972,10001009,9175040),(11972,10001010,8650752),(11972,10001011,9240576),(11972,10001012,8716288),(11972,10001013,9306112),(11972,10001014,8781824),(11972,10001015,9633792),(11972,10001016,9371648),(11972,10001017,9764864),(11972,10001018,9502720),(11972,10001019,9830400),(11972,10001020,9568256),(11972,10001021,10158080),(11972,10001022,9895936),(11972,10001023,10223616),(11972,10001024,9961472),(11972,10001025,10289152),(11972,10001026,10027008),(11972,10001027,10354688),(11972,10001028,10092544),(11972,10001029,16515072),(11972,10001030,16449536),(11972,10001031,17629184),(11972,10001032,17563648),(11972,10001033,17694720),(11972,10001034,17891328),(11972,10001035,18284544),(11972,10001036,18219008),(11972,10001037,18874368),(11972,10001038,18939904),(11972,10001039,21233664),(11972,10001040,21299200),(11972,10001041,22020096),(11972,10001042,21954560),(11972,10001043,23986176),(11972,10001044,24051712),(11972,10001045,28246016),(11972,10001046,28180480),(11972,10001047,28377088),(11972,10001048,28311552),(11972,10001049,30408704),(11972,10001050,30343168),(11972,10001051,30474240),(11972,10001052,30539776),(11974,1,555),(11974,1956,175),(11974,5151,0),(11974,5152,1),(11974,5170,1),(11974,5171,0),(11974,5172,0),(11974,5173,0),(11974,5174,0),(11974,5175,0),(11974,5176,0),(11974,5177,0),(11974,5178,0),(11974,5179,0),(11974,5180,0),(11974,5181,0),(11974,5182,0),(11974,5183,0),(11974,5184,0),(11974,5185,0),(11974,5186,0),(11974,5187,0),(11974,5190,1756340599),(11974,6983,1756341388),(11974,7100,0),(11974,17101,0),(11974,30001,1),(11974,40851,1),(11974,44958,1756341000),(11974,45001,0),(11974,45162,1),(11974,50722,0),(11974,77658,1),(11974,98231,0),(11974,10001001,8912896),(11974,10001002,8388608),(11974,10001003,8978432),(11974,10001004,8454144),(11974,10001005,9043968),(11974,10001006,8519680),(11974,10001007,9109504),(11974,10001008,8585216),(11974,10001009,9175040),(11974,10001010,8650752),(11974,10001011,9240576),(11974,10001012,8716288),(11974,10001013,9306112),(11974,10001014,8781824),(11974,10001015,9633792),(11974,10001016,9371648),(11974,10001017,9764864),(11974,10001018,9502720),(11974,10001019,9830400),(11974,10001020,9568256),(11974,10001021,10158080),(11974,10001022,9895936),(11974,10001023,10223616),(11974,10001024,9961472),(11974,10001025,10289152),(11974,10001026,10027008),(11974,10001027,10354688),(11974,10001028,10092544),(11974,10001029,16515072),(11974,10001030,16449536),(11974,10001031,17629184),(11974,10001032,17563648),(11974,10001033,17694720),(11974,10001034,17891328),(11974,10001035,18284544),(11974,10001036,18219008),(11974,10001037,18874368),(11974,10001038,18939904),(11974,10001039,21233664),(11974,10001040,21299200),(11974,10001041,22020096),(11974,10001042,21954560),(11974,10001043,23986176),(11974,10001044,24051712),(11974,10001045,28246016),(11974,10001046,28180480),(11974,10001047,28377088),(11974,10001048,28311552),(11974,10001049,30408704),(11974,10001050,30343168),(11974,10001051,30474240),(11974,10001052,30539776),(11975,5152,0),(11975,6983,1756342626),(11975,17101,0),(11975,30001,1),(11975,40851,1),(11975,44958,1756342563),(11975,45001,0),(11975,45162,1),(11975,50722,0),(11975,98231,0),(11975,10001001,8912896),(11975,10001002,8388608),(11975,10001003,8978432),(11975,10001004,8454144),(11975,10001005,9043968),(11975,10001006,8519680),(11975,10001007,9109504),(11975,10001008,8585216),(11975,10001009,9175040),(11975,10001010,8650752),(11975,10001011,9240576),(11975,10001012,8716288),(11975,10001013,9306112),(11975,10001014,8781824),(11975,10001015,9633792),(11975,10001016,9371648),(11975,10001017,9764864),(11975,10001018,9502720),(11975,10001019,9830400),(11975,10001020,9568256),(11975,10001021,10158080),(11975,10001022,9895936),(11975,10001023,10223616),(11975,10001024,9961472),(11975,10001025,10289152),(11975,10001026,10027008),(11975,10001027,10354688),(11975,10001028,10092544),(11975,10001029,16515072),(11975,10001030,16449536),(11975,10001031,17629184),(11975,10001032,17563648),(11975,10001033,17694720),(11975,10001034,17891328),(11975,10001035,18284544),(11975,10001036,18219008),(11975,10001037,18874368),(11975,10001038,18939904),(11975,10001039,21233664),(11975,10001040,21299200),(11975,10001041,22020096),(11975,10001042,21954560),(11975,10001043,23986176),(11975,10001044,24051712),(11975,10001045,28246016),(11975,10001046,28180480),(11975,10001047,28377088),(11975,10001048,28311552),(11975,10001049,30408704),(11975,10001050,30343168),(11975,10001051,30474240),(11975,10001052,30539776),(11976,1,98),(11976,1958,501),(11976,5151,6),(11976,5152,7),(11976,5170,0),(11976,5171,1),(11976,5172,0),(11976,5173,0),(11976,5174,0),(11976,5175,0),(11976,5176,0),(11976,5177,0),(11976,5178,0),(11976,5179,0),(11976,5180,0),(11976,5181,0),(11976,5182,0),(11976,5183,0),(11976,5184,0),(11976,5185,0),(11976,5186,0),(11976,5187,0),(11976,5190,1756348597),(11976,5191,1756351584),(11976,6983,1756353292),(11976,7100,0),(11976,17101,0),(11976,30001,1),(11976,30002,2),(11976,40852,1),(11976,44958,1756353283),(11976,45001,0),(11976,45162,1),(11976,50722,0),(11976,77658,1),(11976,81701,2),(11976,98231,0),(11976,99963,1),(11976,10001001,9437184),(11976,10001002,9699328),(11976,10001003,124846080),(11976,10001004,124780544),(11976,10001005,124649472),(11976,10001006,124715008),(11978,1,481),(11978,1072,1),(11978,1957,1),(11978,5151,3),(11978,5152,4),(11978,5170,0),(11978,5171,0),(11978,5172,0),(11978,5173,0),(11978,5174,0),(11978,5175,0),(11978,5176,0),(11978,5177,0),(11978,5178,0),(11978,5179,0),(11978,5180,0),(11978,5181,0),(11978,5182,0),(11978,5183,0),(11978,5184,0),(11978,5185,0),(11978,5186,0),(11978,5187,0),(11978,5190,1756336352),(11978,5191,1756342981),(11978,6983,1756334922),(11978,7100,0),(11978,17101,0),(11978,30001,1),(11978,40853,1),(11978,44958,1756339714),(11978,45001,0),(11978,45162,1),(11978,50722,0),(11978,77658,1),(11978,98231,0),(11978,99963,1),(11978,10001001,123994112),(11978,10001002,124059648),(11978,10001003,124125184),(11978,10001004,124190720),(11978,10001005,124256256),(11978,10001006,124321792),(11978,10001007,124387328),(11978,10001008,124452864),(11978,10001009,124518400),(11978,10001010,124583936),(11979,0,1756353639),(11979,1,442),(11979,1958,1),(11979,5004,1),(11979,5151,0),(11979,5152,1),(11979,5170,0),(11979,5171,0),(11979,5172,0),(11979,5173,0),(11979,5174,0),(11979,5175,0),(11979,5176,0),(11979,5177,0),(11979,5178,0),(11979,5179,0),(11979,5180,0),(11979,5181,0),(11979,5182,0),(11979,5183,0),(11979,5184,0),(11979,5185,0),(11979,5186,0),(11979,5187,0),(11979,5190,1756338783),(11979,6001,1756342667),(11979,6983,1756368005),(11979,7100,0),(11979,17101,0),(11979,30001,1),(11979,40854,1),(11979,44958,1756356720),(11979,45001,0),(11979,45162,1),(11979,51052,1),(11979,51053,1756352583),(11979,60002,1756343288),(11979,77658,1),(11979,98231,0),(11979,99963,1),(11979,99964,1),(11979,10001001,122945536),(11979,10001002,123273216),(11979,10001003,123404288),(11979,10001004,123731968),(11979,10001005,123797504),(11979,10001006,123863040),(11979,10001007,123928576),(11981,1,913),(11981,1960,393),(11981,5151,0),(11981,5152,1),(11981,5170,1),(11981,5171,0),(11981,5172,0),(11981,5173,0),(11981,5174,0),(11981,5175,0),(11981,5176,0),(11981,5177,0),(11981,5178,0),(11981,5179,0),(11981,5180,0),(11981,5181,0),(11981,5182,0),(11981,5183,0),(11981,5184,0),(11981,5185,0),(11981,5186,0),(11981,5187,0),(11981,5190,1756335667),(11981,6983,1756345843),(11981,7100,0),(11981,17101,0),(11981,30001,1),(11981,40851,1),(11981,44958,1756345745),(11981,45001,0),(11981,45162,1),(11981,50722,0),(11981,77658,1),(11981,98231,0),(11981,99963,1),(11981,10001001,8912896),(11981,10001002,8388608),(11981,10001003,8978432),(11981,10001004,8454144),(11981,10001005,9043968),(11981,10001006,8519680),(11981,10001007,9109504),(11981,10001008,8585216),(11981,10001009,9175040),(11981,10001010,8650752),(11981,10001011,9240576),(11981,10001012,8716288),(11981,10001013,9306112),(11981,10001014,8781824),(11981,10001015,9633792),(11981,10001016,9371648),(11981,10001017,9764864),(11981,10001018,9502720),(11981,10001019,9830400),(11981,10001020,9568256),(11981,10001021,10158080),(11981,10001022,9895936),(11981,10001023,10223616),(11981,10001024,9961472),(11981,10001025,10289152),(11981,10001026,10027008),(11981,10001027,10354688),(11981,10001028,10092544),(11981,10001029,16515072),(11981,10001030,16449536),(11981,10001031,17629184),(11981,10001032,17563648),(11981,10001033,17694720),(11981,10001034,17891328),(11981,10001035,18284544),(11981,10001036,18219008),(11981,10001037,18874368),(11981,10001038,18939904),(11981,10001039,21233664),(11981,10001040,21299200),(11981,10001041,22020096),(11981,10001042,21954560),(11981,10001043,23986176),(11981,10001044,24051712),(11981,10001045,28246016),(11981,10001046,28180480),(11981,10001047,28377088),(11981,10001048,28311552),(11981,10001049,30408704),(11981,10001050,30343168),(11981,10001051,30474240),(11981,10001052,30539776),(11982,5152,0),(11982,6983,1756349072),(11982,17101,0),(11982,40851,1),(11982,44958,1756349063),(11982,45001,0),(11982,45162,1),(11982,50722,0),(11982,98231,0),(11982,10001001,8912896),(11982,10001002,8388608),(11982,10001003,8978432),(11982,10001004,8454144),(11982,10001005,9043968),(11982,10001006,8519680),(11982,10001007,9109504),(11982,10001008,8585216),(11982,10001009,9175040),(11982,10001010,8650752),(11982,10001011,9240576),(11982,10001012,8716288),(11982,10001013,9306112),(11982,10001014,8781824),(11982,10001015,9633792),(11982,10001016,9371648),(11982,10001017,9764864),(11982,10001018,9502720),(11982,10001019,9830400),(11982,10001020,9568256),(11982,10001021,10158080),(11982,10001022,9895936),(11982,10001023,10223616),(11982,10001024,9961472),(11982,10001025,10289152),(11982,10001026,10027008),(11982,10001027,10354688),(11982,10001028,10092544),(11982,10001029,16515072),(11982,10001030,16449536),(11982,10001031,17629184),(11982,10001032,17563648),(11982,10001033,17694720),(11982,10001034,17891328),(11982,10001035,18284544),(11982,10001036,18219008),(11982,10001037,18874368),(11982,10001038,18939904),(11982,10001039,21233664),(11982,10001040,21299200),(11982,10001041,22020096),(11982,10001042,21954560),(11982,10001043,23986176),(11982,10001044,24051712),(11982,10001045,28246016),(11982,10001046,28180480),(11982,10001047,28377088),(11982,10001048,28311552),(11982,10001049,30408704),(11982,10001050,30343168),(11982,10001051,30474240),(11982,10001052,30539776),(11983,1,935),(11983,1032,1),(11983,1957,144),(11983,5151,0),(11983,5152,1),(11983,5170,0),(11983,5171,1),(11983,5172,0),(11983,5173,0),(11983,5174,0),(11983,5175,0),(11983,5176,0),(11983,5177,0),(11983,5178,0),(11983,5179,0),(11983,5180,0),(11983,5181,0),(11983,5182,0),(11983,5183,0),(11983,5184,0),(11983,5185,0),(11983,5186,0),(11983,5187,0),(11983,5191,1756352086),(11983,6983,1756368005),(11983,17101,0),(11983,30001,1),(11983,40852,1),(11983,44958,1756364980),(11983,45001,0),(11983,45162,1),(11983,50722,0),(11983,98231,0),(11983,99963,1),(11983,99964,1),(11983,10001001,9437184),(11983,10001002,9699328),(11983,10001003,124846080),(11983,10001004,124780544),(11983,10001005,124649472),(11983,10001006,124715008),(11984,1,948),(11984,1957,144),(11984,5152,0),(11984,5170,0),(11984,5171,0),(11984,5172,0),(11984,5173,0),(11984,5174,0),(11984,5175,0),(11984,5176,0),(11984,5177,0),(11984,5178,0),(11984,5179,0),(11984,5180,0),(11984,5181,0),(11984,5182,0),(11984,5183,0),(11984,5184,0),(11984,5185,0),(11984,5186,0),(11984,5187,0),(11984,6983,1756368005),(11984,17101,0),(11984,30001,1),(11984,40853,1),(11984,44958,1756363367),(11984,45001,0),(11984,45162,1),(11984,50722,0),(11984,98231,0),(11984,99963,1),(11984,10001001,123994112),(11984,10001002,124059648),(11984,10001003,124125184),(11984,10001004,124190720),(11984,10001005,124256256),(11984,10001006,124321792),(11984,10001007,124387328),(11984,10001008,124452864),(11984,10001009,124518400),(11984,10001010,124583936),(11985,1,778),(11985,5151,2),(11985,5152,3),(11985,5170,0),(11985,5171,0),(11985,5172,0),(11985,5173,0),(11985,5174,0),(11985,5175,0),(11985,5176,0),(11985,5177,0),(11985,5178,0),(11985,5179,0),(11985,5180,0),(11985,5181,0),(11985,5182,0),(11985,5183,0),(11985,5184,0),(11985,5185,0),(11985,5186,0),(11985,5187,0),(11985,5190,1756347524),(11985,6983,1756368005),(11985,17101,0),(11985,30001,1),(11985,40853,1),(11985,44958,1756348498),(11985,45001,0),(11985,45162,1),(11985,50722,0),(11985,98231,0),(11985,10001001,123994112),(11985,10001002,124059648),(11985,10001003,124125184),(11985,10001004,124190720),(11985,10001005,124256256),(11985,10001006,124321792),(11985,10001007,124387328),(11985,10001008,124452864),(11985,10001009,124518400),(11985,10001010,124583936),(11986,1,1119),(11986,1957,98),(11986,5151,1),(11986,5152,2),(11986,5170,1),(11986,5171,1),(11986,5172,0),(11986,5173,0),(11986,5174,0),(11986,5175,0),(11986,5176,0),(11986,5177,0),(11986,5178,0),(11986,5179,0),(11986,5180,0),(11986,5181,0),(11986,5182,0),(11986,5183,0),(11986,5184,0),(11986,5185,0),(11986,5186,0),(11986,5187,0),(11986,5190,1756335662),(11986,5191,1756343511),(11986,6983,1756348184),(11986,7100,0),(11986,17101,0),(11986,30001,1),(11986,40851,1),(11986,44958,1756348158),(11986,45001,0),(11986,45162,1),(11986,50722,0),(11986,77658,1),(11986,98231,0),(11986,99963,1),(11986,10001001,8912896),(11986,10001002,8388608),(11986,10001003,8978432),(11986,10001004,8454144),(11986,10001005,9043968),(11986,10001006,8519680),(11986,10001007,9109504),(11986,10001008,8585216),(11986,10001009,9175040),(11986,10001010,8650752),(11986,10001011,9240576),(11986,10001012,8716288),(11986,10001013,9306112),(11986,10001014,8781824),(11986,10001015,9633792),(11986,10001016,9371648),(11986,10001017,9764864),(11986,10001018,9502720),(11986,10001019,9830400),(11986,10001020,9568256),(11986,10001021,10158080),(11986,10001022,9895936),(11986,10001023,10223616),(11986,10001024,9961472),(11986,10001025,10289152),(11986,10001026,10027008),(11986,10001027,10354688),(11986,10001028,10092544),(11986,10001029,16515072),(11986,10001030,16449536),(11986,10001031,17629184),(11986,10001032,17563648),(11986,10001033,17694720),(11986,10001034,17891328),(11986,10001035,18284544),(11986,10001036,18219008),(11986,10001037,18874368),(11986,10001038,18939904),(11986,10001039,21233664),(11986,10001040,21299200),(11986,10001041,22020096),(11986,10001042,21954560),(11986,10001043,23986176),(11986,10001044,24051712),(11986,10001045,28246016),(11986,10001046,28180480),(11986,10001047,28377088),(11986,10001048,28311552),(11986,10001049,30408704),(11986,10001050,30343168),(11986,10001051,30474240),(11986,10001052,30539776),(11987,5152,0),(11987,6983,1756347659),(11987,7100,0),(11987,17101,0),(11987,30001,1),(11987,40851,1),(11987,44958,1756336749),(11987,45001,0),(11987,45162,1),(11987,50722,0),(11987,77658,1),(11987,98231,0),(11987,10001001,8912896),(11987,10001002,8388608),(11987,10001003,8978432),(11987,10001004,8454144),(11987,10001005,9043968),(11987,10001006,8519680),(11987,10001007,9109504),(11987,10001008,8585216),(11987,10001009,9175040),(11987,10001010,8650752),(11987,10001011,9240576),(11987,10001012,8716288),(11987,10001013,9306112),(11987,10001014,8781824),(11987,10001015,9633792),(11987,10001016,9371648),(11987,10001017,9764864),(11987,10001018,9502720),(11987,10001019,9830400),(11987,10001020,9568256),(11987,10001021,10158080),(11987,10001022,9895936),(11987,10001023,10223616),(11987,10001024,9961472),(11987,10001025,10289152),(11987,10001026,10027008),(11987,10001027,10354688),(11987,10001028,10092544),(11987,10001029,16515072),(11987,10001030,16449536),(11987,10001031,17629184),(11987,10001032,17563648),(11987,10001033,17694720),(11987,10001034,17891328),(11987,10001035,18284544),(11987,10001036,18219008),(11987,10001037,18874368),(11987,10001038,18939904),(11987,10001039,21233664),(11987,10001040,21299200),(11987,10001041,22020096),(11987,10001042,21954560),(11987,10001043,23986176),(11987,10001044,24051712),(11987,10001045,28246016),(11987,10001046,28180480),(11987,10001047,28377088),(11987,10001048,28311552),(11987,10001049,30408704),(11987,10001050,30343168),(11987,10001051,30474240),(11987,10001052,30539776),(11987,10002008,134217728),(11988,0,1756357142),(11988,1,829),(11988,1958,1),(11988,5151,5),(11988,5152,6),(11988,5170,0),(11988,5171,0),(11988,5172,2),(11988,5173,0),(11988,5174,0),(11988,5175,0),(11988,5176,0),(11988,5177,0),(11988,5178,0),(11988,5179,0),(11988,5180,0),(11988,5181,0),(11988,5182,0),(11988,5183,0),(11988,5184,0),(11988,5185,0),(11988,5186,0),(11988,5187,0),(11988,5190,1756336607),(11988,5191,1756343605),(11988,5192,1756358373),(11988,6983,1756368005),(11988,7100,0),(11988,17101,0),(11988,30001,1),(11988,35707,1),(11988,40851,1),(11988,44958,1756361872),(11988,45001,0),(11988,45162,1),(11988,77658,1),(11988,98231,0),(11988,99963,1),(11988,99964,1),(11988,10001001,8912896),(11988,10001002,8388608),(11988,10001003,8978432),(11988,10001004,8454144),(11988,10001005,9043968),(11988,10001006,8519680),(11988,10001007,9109504),(11988,10001008,8585216),(11988,10001009,9175040),(11988,10001010,8650752),(11988,10001011,9240576),(11988,10001012,8716288),(11988,10001013,9306112),(11988,10001014,8781824),(11988,10001015,9633792),(11988,10001016,9371648),(11988,10001017,9764864),(11988,10001018,9502720),(11988,10001019,9830400),(11988,10001020,9568256),(11988,10001021,10158080),(11988,10001022,9895936),(11988,10001023,10223616),(11988,10001024,9961472),(11988,10001025,10289152),(11988,10001026,10027008),(11988,10001027,10354688),(11988,10001028,10092544),(11988,10001029,16515072),(11988,10001030,16449536),(11988,10001031,17629184),(11988,10001032,17563648),(11988,10001033,17694720),(11988,10001034,17891328),(11988,10001035,18284544),(11988,10001036,18219008),(11988,10001037,18874368),(11988,10001038,18939904),(11988,10001039,21233664),(11988,10001040,21299200),(11988,10001041,22020096),(11988,10001042,21954560),(11988,10001043,23986176),(11988,10001044,24051712),(11988,10001045,28246016),(11988,10001046,28180480),(11988,10001047,28377088),(11988,10001048,28311552),(11988,10001049,30408704),(11988,10001050,30343168),(11988,10001051,30474240),(11988,10001052,30539776),(11989,0,1756343484),(11989,1,1104),(11989,1956,1),(11989,5151,0),(11989,5152,1),(11989,5170,0),(11989,5171,0),(11989,5172,0),(11989,5173,0),(11989,5174,0),(11989,5175,0),(11989,5176,0),(11989,5177,0),(11989,5178,0),(11989,5179,0),(11989,5180,0),(11989,5181,0),(11989,5182,0),(11989,5183,0),(11989,5184,0),(11989,5185,0),(11989,5186,0),(11989,5187,0),(11989,5190,1756345993),(11989,6983,1756368005),(11989,7100,0),(11989,17101,0),(11989,30001,1),(11989,40851,1),(11989,44958,1756348429),(11989,45001,0),(11989,45162,1),(11989,50722,0),(11989,77658,1),(11989,98231,0),(11989,99963,1),(11989,10001001,8912896),(11989,10001002,8388608),(11989,10001003,8978432),(11989,10001004,8454144),(11989,10001005,9043968),(11989,10001006,8519680),(11989,10001007,9109504),(11989,10001008,8585216),(11989,10001009,9175040),(11989,10001010,8650752),(11989,10001011,9240576),(11989,10001012,8716288),(11989,10001013,9306112),(11989,10001014,8781824),(11989,10001015,9633792),(11989,10001016,9371648),(11989,10001017,9764864),(11989,10001018,9502720),(11989,10001019,9830400),(11989,10001020,9568256),(11989,10001021,10158080),(11989,10001022,9895936),(11989,10001023,10223616),(11989,10001024,9961472),(11989,10001025,10289152),(11989,10001026,10027008),(11989,10001027,10354688),(11989,10001028,10092544),(11989,10001029,16515072),(11989,10001030,16449536),(11989,10001031,17629184),(11989,10001032,17563648),(11989,10001033,17694720),(11989,10001034,17891328),(11989,10001035,18284544),(11989,10001036,18219008),(11989,10001037,18874368),(11989,10001038,18939904),(11989,10001039,21233664),(11989,10001040,21299200),(11989,10001041,22020096),(11989,10001042,21954560),(11989,10001043,23986176),(11989,10001044,24051712),(11989,10001045,28246016),(11989,10001046,28180480),(11989,10001047,28377088),(11989,10001048,28311552),(11989,10001049,30408704),(11989,10001050,30343168),(11989,10001051,30474240),(11989,10001052,30539776),(11990,5152,0),(11990,6983,1756335750),(11990,17101,0),(11990,30001,1),(11990,40851,1),(11990,44958,1756334704),(11990,45001,0),(11990,45162,1),(11990,50722,0),(11990,98231,0),(11990,10001001,8912896),(11990,10001002,8388608),(11990,10001003,8978432),(11990,10001004,8454144),(11990,10001005,9043968),(11990,10001006,8519680),(11990,10001007,9109504),(11990,10001008,8585216),(11990,10001009,9175040),(11990,10001010,8650752),(11990,10001011,9240576),(11990,10001012,8716288),(11990,10001013,9306112),(11990,10001014,8781824),(11990,10001015,9633792),(11990,10001016,9371648),(11990,10001017,9764864),(11990,10001018,9502720),(11990,10001019,9830400),(11990,10001020,9568256),(11990,10001021,10158080),(11990,10001022,9895936),(11990,10001023,10223616),(11990,10001024,9961472),(11990,10001025,10289152),(11990,10001026,10027008),(11990,10001027,10354688),(11990,10001028,10092544),(11990,10001029,16515072),(11990,10001030,16449536),(11990,10001031,17629184),(11990,10001032,17563648),(11990,10001033,17694720),(11990,10001034,17891328),(11990,10001035,18284544),(11990,10001036,18219008),(11990,10001037,18874368),(11990,10001038,18939904),(11990,10001039,21233664),(11990,10001040,21299200),(11990,10001041,22020096),(11990,10001042,21954560),(11990,10001043,23986176),(11990,10001044,24051712),(11990,10001045,28246016),(11990,10001046,28180480),(11990,10001047,28377088),(11990,10001048,28311552),(11990,10001049,30408704),(11990,10001050,30343168),(11990,10001051,30474240),(11990,10001052,30539776),(11991,0,1756440181),(11991,1,942),(11991,1001,1),(11991,1960,165),(11991,5004,1),(11991,5151,2),(11991,5152,3),(11991,5170,0),(11991,5171,0),(11991,5172,0),(11991,5173,0),(11991,5174,2),(11991,5175,0),(11991,5176,0),(11991,5177,0),(11991,5178,0),(11991,5179,0),(11991,5180,0),(11991,5181,0),(11991,5182,0),(11991,5183,0),(11991,5184,0),(11991,5185,0),(11991,5186,0),(11991,5187,0),(11991,5190,1756337994),(11991,5194,1756355420),(11991,6983,1756368005),(11991,7100,0),(11991,17101,0),(11991,30001,1),(11991,40851,1),(11991,44958,1756363338),(11991,45001,0),(11991,45162,1),(11991,50722,0),(11991,60002,1756343240),(11991,77658,1),(11991,98231,0),(11991,99963,1),(11991,99964,1),(11991,10001001,8912896),(11991,10001002,8388608),(11991,10001003,8978432),(11991,10001004,8454144),(11991,10001005,9043968),(11991,10001006,8519680),(11991,10001007,9109504),(11991,10001008,8585216),(11991,10001009,9175040),(11991,10001010,8650752),(11991,10001011,9240576),(11991,10001012,8716288),(11991,10001013,9306112),(11991,10001014,8781824),(11991,10001015,9633792),(11991,10001016,9371648),(11991,10001017,9764864),(11991,10001018,9502720),(11991,10001019,9830400),(11991,10001020,9568256),(11991,10001021,10158080),(11991,10001022,9895936),(11991,10001023,10223616),(11991,10001024,9961472),(11991,10001025,10289152),(11991,10001026,10027008),(11991,10001027,10354688),(11991,10001028,10092544),(11991,10001029,16515072),(11991,10001030,16449536),(11991,10001031,17629184),(11991,10001032,17563648),(11991,10001033,17694720),(11991,10001034,17891328),(11991,10001035,18284544),(11991,10001036,18219008),(11991,10001037,18874368),(11991,10001038,18939904),(11991,10001039,21233664),(11991,10001040,21299200),(11991,10001041,22020096),(11991,10001042,21954560),(11991,10001043,23986176),(11991,10001044,24051712),(11991,10001045,28246016),(11991,10001046,28180480),(11991,10001047,28377088),(11991,10001048,28311552),(11991,10001049,30408704),(11991,10001050,30343168),(11991,10001051,30474240),(11991,10001052,30539776),(11991,10002001,2097152),(11991,10002011,22),(11992,1,823),(11992,5152,0),(11992,5170,0),(11992,5171,0),(11992,5172,0),(11992,5173,0),(11992,5174,0),(11992,5175,0),(11992,5176,0),(11992,5177,0),(11992,5178,0),(11992,5179,0),(11992,5180,0),(11992,5181,0),(11992,5182,0),(11992,5183,0),(11992,5184,0),(11992,5185,0),(11992,5186,0),(11992,5187,0),(11992,6983,1756368005),(11992,7100,0),(11992,17101,0),(11992,30001,1),(11992,40851,1),(11992,44958,1756346389),(11992,45001,0),(11992,45162,1),(11992,50722,0),(11992,77658,1),(11992,98231,0),(11992,10001001,8912896),(11992,10001002,8388608),(11992,10001003,8978432),(11992,10001004,8454144),(11992,10001005,9043968),(11992,10001006,8519680),(11992,10001007,9109504),(11992,10001008,8585216),(11992,10001009,9175040),(11992,10001010,8650752),(11992,10001011,9240576),(11992,10001012,8716288),(11992,10001013,9306112),(11992,10001014,8781824),(11992,10001015,9633792),(11992,10001016,9371648),(11992,10001017,9764864),(11992,10001018,9502720),(11992,10001019,9830400),(11992,10001020,9568256),(11992,10001021,10158080),(11992,10001022,9895936),(11992,10001023,10223616),(11992,10001024,9961472),(11992,10001025,10289152),(11992,10001026,10027008),(11992,10001027,10354688),(11992,10001028,10092544),(11992,10001029,16515072),(11992,10001030,16449536),(11992,10001031,17629184),(11992,10001032,17563648),(11992,10001033,17694720),(11992,10001034,17891328),(11992,10001035,18284544),(11992,10001036,18219008),(11992,10001037,18874368),(11992,10001038,18939904),(11992,10001039,21233664),(11992,10001040,21299200),(11992,10001041,22020096),(11992,10001042,21954560),(11992,10001043,23986176),(11992,10001044,24051712),(11992,10001045,28246016),(11992,10001046,28180480),(11992,10001047,28377088),(11992,10001048,28311552),(11992,10001049,30408704),(11992,10001050,30343168),(11992,10001051,30474240),(11992,10001052,30539776),(11993,5152,0),(11993,5170,0),(11993,5171,0),(11993,5172,0),(11993,5173,0),(11993,5174,0),(11993,5175,0),(11993,5176,0),(11993,5177,0),(11993,5178,0),(11993,5179,0),(11993,5180,0),(11993,5181,0),(11993,5182,0),(11993,5183,0),(11993,5184,0),(11993,5185,0),(11993,5186,0),(11993,5187,0),(11993,6983,1756368005),(11993,17101,0),(11993,30001,1),(11993,40854,1),(11993,44958,1756345690),(11993,45001,0),(11993,45162,1),(11993,98231,0),(11993,10001001,122945536),(11993,10001002,123273216),(11993,10001003,123404288),(11993,10001004,123731968),(11993,10001005,123797504),(11993,10001006,123863040),(11993,10001007,123928576),(11994,0,1756353777),(11994,1,660),(11994,1958,1),(11994,5151,5),(11994,5152,6),(11994,5170,0),(11994,5171,0),(11994,5172,2),(11994,5173,0),(11994,5174,0),(11994,5175,0),(11994,5176,0),(11994,5177,0),(11994,5178,0),(11994,5179,0),(11994,5180,0),(11994,5181,0),(11994,5182,0),(11994,5183,0),(11994,5184,0),(11994,5185,0),(11994,5186,0),(11994,5187,0),(11994,5190,1756336596),(11994,5191,1756343591),(11994,5192,1756359134),(11994,6983,1756368005),(11994,7100,0),(11994,17101,0),(11994,30001,1),(11994,35707,1),(11994,40853,1),(11994,44958,1756360208),(11994,45001,0),(11994,45162,1),(11994,77658,1),(11994,98231,0),(11994,99963,1),(11994,99964,1),(11994,10001001,123994112),(11994,10001002,124059648),(11994,10001003,124125184),(11994,10001004,124190720),(11994,10001005,124256256),(11994,10001006,124321792),(11994,10001007,124387328),(11994,10001008,124452864),(11994,10001009,124518400),(11994,10001010,124583936),(11995,1956,201),(11995,5152,0),(11995,5170,0),(11995,5171,0),(11995,5172,0),(11995,5173,0),(11995,5174,0),(11995,5175,0),(11995,5176,0),(11995,5177,0),(11995,5178,0),(11995,5179,0),(11995,5180,0),(11995,5181,0),(11995,5182,0),(11995,5183,0),(11995,5184,0),(11995,5185,0),(11995,5186,0),(11995,5187,0),(11995,6983,1756335707),(11995,17101,0),(11995,40854,1),(11995,44958,1756335499),(11995,45001,0),(11995,45162,1),(11995,50722,0),(11995,98231,0),(11995,10001001,122945536),(11995,10001002,123273216),(11995,10001003,123404288),(11995,10001004,123731968),(11995,10001005,123797504),(11995,10001006,123863040),(11995,10001007,123928576),(11996,5152,0),(11996,5170,0),(11996,5171,0),(11996,5172,0),(11996,5173,0),(11996,5174,0),(11996,5175,0),(11996,5176,0),(11996,5177,0),(11996,5178,0),(11996,5179,0),(11996,5180,0),(11996,5181,0),(11996,5182,0),(11996,5183,0),(11996,5184,0),(11996,5185,0),(11996,5186,0),(11996,5187,0),(11996,6983,1756343411),(11996,17101,0),(11996,30001,1),(11996,40851,1),(11996,44958,1756336035),(11996,45001,0),(11996,45162,1),(11996,98231,0),(11996,10001001,8912896),(11996,10001002,8388608),(11996,10001003,8978432),(11996,10001004,8454144),(11996,10001005,9043968),(11996,10001006,8519680),(11996,10001007,9109504),(11996,10001008,8585216),(11996,10001009,9175040),(11996,10001010,8650752),(11996,10001011,9240576),(11996,10001012,8716288),(11996,10001013,9306112),(11996,10001014,8781824),(11996,10001015,9633792),(11996,10001016,9371648),(11996,10001017,9764864),(11996,10001018,9502720),(11996,10001019,9830400),(11996,10001020,9568256),(11996,10001021,10158080),(11996,10001022,9895936),(11996,10001023,10223616),(11996,10001024,9961472),(11996,10001025,10289152),(11996,10001026,10027008),(11996,10001027,10354688),(11996,10001028,10092544),(11996,10001029,16515072),(11996,10001030,16449536),(11996,10001031,17629184),(11996,10001032,17563648),(11996,10001033,17694720),(11996,10001034,17891328),(11996,10001035,18284544),(11996,10001036,18219008),(11996,10001037,18874368),(11996,10001038,18939904),(11996,10001039,21233664),(11996,10001040,21299200),(11996,10001041,22020096),(11996,10001042,21954560),(11996,10001043,23986176),(11996,10001044,24051712),(11996,10001045,28246016),(11996,10001046,28180480),(11996,10001047,28377088),(11996,10001048,28311552),(11996,10001049,30408704),(11996,10001050,30343168),(11996,10001051,30474240),(11996,10001052,30539776),(11997,1,714),(11997,1958,245),(11997,5151,3),(11997,5152,4),(11997,5170,0),(11997,5171,3),(11997,5172,0),(11997,5173,0),(11997,5174,0),(11997,5175,0),(11997,5176,0),(11997,5177,0),(11997,5178,0),(11997,5179,0),(11997,5180,0),(11997,5181,0),(11997,5182,0),(11997,5183,0),(11997,5184,0),(11997,5185,0),(11997,5186,0),(11997,5187,0),(11997,5191,1756353287),(11997,6983,1756368005),(11997,17101,0),(11997,30001,1),(11997,40851,1),(11997,44958,1756360270),(11997,45001,0),(11997,45162,1),(11997,50722,0),(11997,98231,0),(11997,99963,1),(11997,10001001,8912896),(11997,10001002,8388608),(11997,10001003,8978432),(11997,10001004,8454144),(11997,10001005,9043968),(11997,10001006,8519680),(11997,10001007,9109504),(11997,10001008,8585216),(11997,10001009,9175040),(11997,10001010,8650752),(11997,10001011,9240576),(11997,10001012,8716288),(11997,10001013,9306112),(11997,10001014,8781824),(11997,10001015,9633792),(11997,10001016,9371648),(11997,10001017,9764864),(11997,10001018,9502720),(11997,10001019,9830400),(11997,10001020,9568256),(11997,10001021,10158080),(11997,10001022,9895936),(11997,10001023,10223616),(11997,10001024,9961472),(11997,10001025,10289152),(11997,10001026,10027008),(11997,10001027,10354688),(11997,10001028,10092544),(11997,10001029,16515072),(11997,10001030,16449536),(11997,10001031,17629184),(11997,10001032,17563648),(11997,10001033,17694720),(11997,10001034,17891328),(11997,10001035,18284544),(11997,10001036,18219008),(11997,10001037,18874368),(11997,10001038,18939904),(11997,10001039,21233664),(11997,10001040,21299200),(11997,10001041,22020096),(11997,10001042,21954560),(11997,10001043,23986176),(11997,10001044,24051712),(11997,10001045,28246016),(11997,10001046,28180480),(11997,10001047,28377088),(11997,10001048,28311552),(11997,10001049,30408704),(11997,10001050,30343168),(11997,10001051,30474240),(11997,10001052,30539776),(11998,1,719),(11998,1958,245),(11998,5151,4),(11998,5152,5),(11998,5170,0),(11998,5171,3),(11998,5172,0),(11998,5173,0),(11998,5174,0),(11998,5175,0),(11998,5176,0),(11998,5177,0),(11998,5178,0),(11998,5179,0),(11998,5180,0),(11998,5181,0),(11998,5182,0),(11998,5183,0),(11998,5184,0),(11998,5185,0),(11998,5186,0),(11998,5187,0),(11998,5191,1756353271),(11998,6983,1756368005),(11998,17101,0),(11998,30001,1),(11998,40851,1),(11998,44958,1756360387),(11998,45001,0),(11998,45162,1),(11998,50722,0),(11998,98231,0),(11998,99963,1),(11998,10001001,8912896),(11998,10001002,8388608),(11998,10001003,8978432),(11998,10001004,8454144),(11998,10001005,9043968),(11998,10001006,8519680),(11998,10001007,9109504),(11998,10001008,8585216),(11998,10001009,9175040),(11998,10001010,8650752),(11998,10001011,9240576),(11998,10001012,8716288),(11998,10001013,9306112),(11998,10001014,8781824),(11998,10001015,9633792),(11998,10001016,9371648),(11998,10001017,9764864),(11998,10001018,9502720),(11998,10001019,9830400),(11998,10001020,9568256),(11998,10001021,10158080),(11998,10001022,9895936),(11998,10001023,10223616),(11998,10001024,9961472),(11998,10001025,10289152),(11998,10001026,10027008),(11998,10001027,10354688),(11998,10001028,10092544),(11998,10001029,16515072),(11998,10001030,16449536),(11998,10001031,17629184),(11998,10001032,17563648),(11998,10001033,17694720),(11998,10001034,17891328),(11998,10001035,18284544),(11998,10001036,18219008),(11998,10001037,18874368),(11998,10001038,18939904),(11998,10001039,21233664),(11998,10001040,21299200),(11998,10001041,22020096),(11998,10001042,21954560),(11998,10001043,23986176),(11998,10001044,24051712),(11998,10001045,28246016),(11998,10001046,28180480),(11998,10001047,28377088),(11998,10001048,28311552),(11998,10001049,30408704),(11998,10001050,30343168),(11998,10001051,30474240),(11998,10001052,30539776),(11999,5152,0),(11999,5170,0),(11999,5171,0),(11999,5172,0),(11999,5173,0),(11999,5174,0),(11999,5175,0),(11999,5176,0),(11999,5177,0),(11999,5178,0),(11999,5179,0),(11999,5180,0),(11999,5181,0),(11999,5182,0),(11999,5183,0),(11999,5184,0),(11999,5185,0),(11999,5186,0),(11999,5187,0),(11999,6983,1756368005),(11999,17101,0),(11999,30001,1),(11999,40851,1),(11999,44958,1756345716),(11999,45001,0),(11999,45162,1),(11999,50722,0),(11999,98231,0),(11999,10001001,8912896),(11999,10001002,8388608),(11999,10001003,8978432),(11999,10001004,8454144),(11999,10001005,9043968),(11999,10001006,8519680),(11999,10001007,9109504),(11999,10001008,8585216),(11999,10001009,9175040),(11999,10001010,8650752),(11999,10001011,9240576),(11999,10001012,8716288),(11999,10001013,9306112),(11999,10001014,8781824),(11999,10001015,9633792),(11999,10001016,9371648),(11999,10001017,9764864),(11999,10001018,9502720),(11999,10001019,9830400),(11999,10001020,9568256),(11999,10001021,10158080),(11999,10001022,9895936),(11999,10001023,10223616),(11999,10001024,9961472),(11999,10001025,10289152),(11999,10001026,10027008),(11999,10001027,10354688),(11999,10001028,10092544),(11999,10001029,16515072),(11999,10001030,16449536),(11999,10001031,17629184),(11999,10001032,17563648),(11999,10001033,17694720),(11999,10001034,17891328),(11999,10001035,18284544),(11999,10001036,18219008),(11999,10001037,18874368),(11999,10001038,18939904),(11999,10001039,21233664),(11999,10001040,21299200),(11999,10001041,22020096),(11999,10001042,21954560),(11999,10001043,23986176),(11999,10001044,24051712),(11999,10001045,28246016),(11999,10001046,28180480),(11999,10001047,28377088),(11999,10001048,28311552),(11999,10001049,30408704),(11999,10001050,30343168),(11999,10001051,30474240),(11999,10001052,30539776),(12000,5152,0),(12000,6983,1756341128),(12000,17101,0),(12000,30001,1),(12000,40851,1),(12000,44958,1756336846),(12000,45001,0),(12000,45162,1),(12000,50722,0),(12000,98231,0),(12000,10001001,8912896),(12000,10001002,8388608),(12000,10001003,8978432),(12000,10001004,8454144),(12000,10001005,9043968),(12000,10001006,8519680),(12000,10001007,9109504),(12000,10001008,8585216),(12000,10001009,9175040),(12000,10001010,8650752),(12000,10001011,9240576),(12000,10001012,8716288),(12000,10001013,9306112),(12000,10001014,8781824),(12000,10001015,9633792),(12000,10001016,9371648),(12000,10001017,9764864),(12000,10001018,9502720),(12000,10001019,9830400),(12000,10001020,9568256),(12000,10001021,10158080),(12000,10001022,9895936),(12000,10001023,10223616),(12000,10001024,9961472),(12000,10001025,10289152),(12000,10001026,10027008),(12000,10001027,10354688),(12000,10001028,10092544),(12000,10001029,16515072),(12000,10001030,16449536),(12000,10001031,17629184),(12000,10001032,17563648),(12000,10001033,17694720),(12000,10001034,17891328),(12000,10001035,18284544),(12000,10001036,18219008),(12000,10001037,18874368),(12000,10001038,18939904),(12000,10001039,21233664),(12000,10001040,21299200),(12000,10001041,22020096),(12000,10001042,21954560),(12000,10001043,23986176),(12000,10001044,24051712),(12000,10001045,28246016),(12000,10001046,28180480),(12000,10001047,28377088),(12000,10001048,28311552),(12000,10001049,30408704),(12000,10001050,30343168),(12000,10001051,30474240),(12000,10001052,30539776),(12001,5152,0),(12001,6983,1756336194),(12001,17101,0),(12001,40851,1),(12001,45001,0),(12001,45162,1),(12001,98231,0),(12001,10001001,8912896),(12001,10001002,8388608),(12001,10001003,8978432),(12001,10001004,8454144),(12001,10001005,9043968),(12001,10001006,8519680),(12001,10001007,9109504),(12001,10001008,8585216),(12001,10001009,9175040),(12001,10001010,8650752),(12001,10001011,9240576),(12001,10001012,8716288),(12001,10001013,9306112),(12001,10001014,8781824),(12001,10001015,9633792),(12001,10001016,9371648),(12001,10001017,9764864),(12001,10001018,9502720),(12001,10001019,9830400),(12001,10001020,9568256),(12001,10001021,10158080),(12001,10001022,9895936),(12001,10001023,10223616),(12001,10001024,9961472),(12001,10001025,10289152),(12001,10001026,10027008),(12001,10001027,10354688),(12001,10001028,10092544),(12001,10001029,16515072),(12001,10001030,16449536),(12001,10001031,17629184),(12001,10001032,17563648),(12001,10001033,17694720),(12001,10001034,17891328),(12001,10001035,18284544),(12001,10001036,18219008),(12001,10001037,18874368),(12001,10001038,18939904),(12001,10001039,21233664),(12001,10001040,21299200),(12001,10001041,22020096),(12001,10001042,21954560),(12001,10001043,23986176),(12001,10001044,24051712),(12001,10001045,28246016),(12001,10001046,28180480),(12001,10001047,28377088),(12001,10001048,28311552),(12001,10001049,30408704),(12001,10001050,30343168),(12001,10001051,30474240),(12001,10001052,30539776),(12002,5152,0),(12002,6983,1756341040),(12002,17101,0),(12002,30001,1),(12002,40851,1),(12002,44958,1756336810),(12002,45001,0),(12002,45162,1),(12002,50722,0),(12002,98231,0),(12002,10001001,8912896),(12002,10001002,8388608),(12002,10001003,8978432),(12002,10001004,8454144),(12002,10001005,9043968),(12002,10001006,8519680),(12002,10001007,9109504),(12002,10001008,8585216),(12002,10001009,9175040),(12002,10001010,8650752),(12002,10001011,9240576),(12002,10001012,8716288),(12002,10001013,9306112),(12002,10001014,8781824),(12002,10001015,9633792),(12002,10001016,9371648),(12002,10001017,9764864),(12002,10001018,9502720),(12002,10001019,9830400),(12002,10001020,9568256),(12002,10001021,10158080),(12002,10001022,9895936),(12002,10001023,10223616),(12002,10001024,9961472),(12002,10001025,10289152),(12002,10001026,10027008),(12002,10001027,10354688),(12002,10001028,10092544),(12002,10001029,16515072),(12002,10001030,16449536),(12002,10001031,17629184),(12002,10001032,17563648),(12002,10001033,17694720),(12002,10001034,17891328),(12002,10001035,18284544),(12002,10001036,18219008),(12002,10001037,18874368),(12002,10001038,18939904),(12002,10001039,21233664),(12002,10001040,21299200),(12002,10001041,22020096),(12002,10001042,21954560),(12002,10001043,23986176),(12002,10001044,24051712),(12002,10001045,28246016),(12002,10001046,28180480),(12002,10001047,28377088),(12002,10001048,28311552),(12002,10001049,30408704),(12002,10001050,30343168),(12002,10001051,30474240),(12002,10001052,30539776),(12003,1956,193),(12003,5152,0),(12003,5170,0),(12003,5171,0),(12003,5172,0),(12003,5173,0),(12003,5174,0),(12003,5175,0),(12003,5176,0),(12003,5177,0),(12003,5178,0),(12003,5179,0),(12003,5180,0),(12003,5181,0),(12003,5182,0),(12003,5183,0),(12003,5184,0),(12003,5185,0),(12003,5186,0),(12003,5187,0),(12003,6983,1756345908),(12003,17101,0),(12003,30001,1),(12003,40853,1),(12003,44958,1756339816),(12003,45001,0),(12003,45162,1),(12003,98231,0),(12003,10001001,123994112),(12003,10001002,124059648),(12003,10001003,124125184),(12003,10001004,124190720),(12003,10001005,124256256),(12003,10001006,124321792),(12003,10001007,124387328),(12003,10001008,124452864),(12003,10001009,124518400),(12003,10001010,124583936),(12004,1,363),(12004,1001,1),(12004,1960,64),(12004,5004,1),(12004,5151,1),(12004,5152,2),(12004,5170,0),(12004,5171,0),(12004,5172,0),(12004,5173,0),(12004,5174,1),(12004,5175,0),(12004,5176,0),(12004,5177,0),(12004,5178,0),(12004,5179,0),(12004,5180,0),(12004,5181,0),(12004,5182,0),(12004,5183,0),(12004,5184,0),(12004,5185,0),(12004,5186,0),(12004,5187,0),(12004,5190,1756338907),(12004,5194,1756353313),(12004,6983,1756351976),(12004,7100,1),(12004,17101,0),(12004,30001,1),(12004,35707,1),(12004,35709,1),(12004,40851,1),(12004,44958,1756357002),(12004,45001,0),(12004,45162,1),(12004,50722,0),(12004,60002,1756342823),(12004,77658,1),(12004,98231,0),(12004,99963,1),(12004,99964,1),(12004,10001001,8912896),(12004,10001002,8388608),(12004,10001003,8978432),(12004,10001004,8454144),(12004,10001005,9043968),(12004,10001006,8519680),(12004,10001007,9109504),(12004,10001008,8585216),(12004,10001009,9175040),(12004,10001010,8650752),(12004,10001011,9240576),(12004,10001012,8716288),(12004,10001013,9306112),(12004,10001014,8781824),(12004,10001015,9633792),(12004,10001016,9371648),(12004,10001017,9764864),(12004,10001018,9502720),(12004,10001019,9830400),(12004,10001020,9568256),(12004,10001021,10158080),(12004,10001022,9895936),(12004,10001023,10223616),(12004,10001024,9961472),(12004,10001025,10289152),(12004,10001026,10027008),(12004,10001027,10354688),(12004,10001028,10092544),(12004,10001029,16515072),(12004,10001030,16449536),(12004,10001031,17629184),(12004,10001032,17563648),(12004,10001033,17694720),(12004,10001034,17891328),(12004,10001035,18284544),(12004,10001036,18219008),(12004,10001037,18874368),(12004,10001038,18939904),(12004,10001039,21233664),(12004,10001040,21299200),(12004,10001041,22020096),(12004,10001042,21954560),(12004,10001043,23986176),(12004,10001044,24051712),(12004,10001045,28246016),(12004,10001046,28180480),(12004,10001047,28377088),(12004,10001048,28311552),(12004,10001049,30408704),(12004,10001050,30343168),(12004,10001051,30474240),(12004,10001052,30539776),(12004,10002001,4),(12004,10002008,536870912),(12004,10002011,247),(12005,1,706),(12005,1958,248),(12005,5151,4),(12005,5152,5),(12005,5170,0),(12005,5171,3),(12005,5172,0),(12005,5173,0),(12005,5174,0),(12005,5175,0),(12005,5176,0),(12005,5177,0),(12005,5178,0),(12005,5179,0),(12005,5180,0),(12005,5181,0),(12005,5182,0),(12005,5183,0),(12005,5184,0),(12005,5185,0),(12005,5186,0),(12005,5187,0),(12005,5191,1756353504),(12005,6983,1756368005),(12005,17101,0),(12005,30001,1),(12005,40851,1),(12005,44958,1756360239),(12005,45001,0),(12005,45162,1),(12005,50722,0),(12005,98231,0),(12005,99963,1),(12005,10001001,8912896),(12005,10001002,8388608),(12005,10001003,8978432),(12005,10001004,8454144),(12005,10001005,9043968),(12005,10001006,8519680),(12005,10001007,9109504),(12005,10001008,8585216),(12005,10001009,9175040),(12005,10001010,8650752),(12005,10001011,9240576),(12005,10001012,8716288),(12005,10001013,9306112),(12005,10001014,8781824),(12005,10001015,9633792),(12005,10001016,9371648),(12005,10001017,9764864),(12005,10001018,9502720),(12005,10001019,9830400),(12005,10001020,9568256),(12005,10001021,10158080),(12005,10001022,9895936),(12005,10001023,10223616),(12005,10001024,9961472),(12005,10001025,10289152),(12005,10001026,10027008),(12005,10001027,10354688),(12005,10001028,10092544),(12005,10001029,16515072),(12005,10001030,16449536),(12005,10001031,17629184),(12005,10001032,17563648),(12005,10001033,17694720),(12005,10001034,17891328),(12005,10001035,18284544),(12005,10001036,18219008),(12005,10001037,18874368),(12005,10001038,18939904),(12005,10001039,21233664),(12005,10001040,21299200),(12005,10001041,22020096),(12005,10001042,21954560),(12005,10001043,23986176),(12005,10001044,24051712),(12005,10001045,28246016),(12005,10001046,28180480),(12005,10001047,28377088),(12005,10001048,28311552),(12005,10001049,30408704),(12005,10001050,30343168),(12005,10001051,30474240),(12005,10001052,30539776),(12006,5152,0),(12006,6983,1756344181),(12006,17101,0),(12006,40852,1),(12006,44958,1756338198),(12006,45001,0),(12006,45162,1),(12006,50722,0),(12006,98231,0),(12006,10001001,9437184),(12006,10001002,9699328),(12006,10001003,124846080),(12006,10001004,124780544),(12006,10001005,124649472),(12006,10001006,124715008),(12008,1,564),(12008,1958,278),(12008,5151,1),(12008,5152,2),(12008,5170,0),(12008,5171,0),(12008,5172,0),(12008,5173,0),(12008,5174,0),(12008,5175,0),(12008,5176,0),(12008,5177,0),(12008,5178,0),(12008,5179,0),(12008,5180,0),(12008,5181,0),(12008,5182,0),(12008,5183,0),(12008,5184,0),(12008,5185,0),(12008,5186,0),(12008,5187,0),(12008,5191,1756349627),(12008,6983,1756351976),(12008,7100,1),(12008,17101,0),(12008,30001,1),(12008,40851,1),(12008,44958,1756360529),(12008,45001,0),(12008,45162,1),(12008,50722,0),(12008,98231,0),(12008,99963,1),(12008,10001001,8912896),(12008,10001002,8388608),(12008,10001003,8978432),(12008,10001004,8454144),(12008,10001005,9043968),(12008,10001006,8519680),(12008,10001007,9109504),(12008,10001008,8585216),(12008,10001009,9175040),(12008,10001010,8650752),(12008,10001011,9240576),(12008,10001012,8716288),(12008,10001013,9306112),(12008,10001014,8781824),(12008,10001015,9633792),(12008,10001016,9371648),(12008,10001017,9764864),(12008,10001018,9502720),(12008,10001019,9830400),(12008,10001020,9568256),(12008,10001021,10158080),(12008,10001022,9895936),(12008,10001023,10223616),(12008,10001024,9961472),(12008,10001025,10289152),(12008,10001026,10027008),(12008,10001027,10354688),(12008,10001028,10092544),(12008,10001029,16515072),(12008,10001030,16449536),(12008,10001031,17629184),(12008,10001032,17563648),(12008,10001033,17694720),(12008,10001034,17891328),(12008,10001035,18284544),(12008,10001036,18219008),(12008,10001037,18874368),(12008,10001038,18939904),(12008,10001039,21233664),(12008,10001040,21299200),(12008,10001041,22020096),(12008,10001042,21954560),(12008,10001043,23986176),(12008,10001044,24051712),(12008,10001045,28246016),(12008,10001046,28180480),(12008,10001047,28377088),(12008,10001048,28311552),(12008,10001049,30408704),(12008,10001050,30343168),(12008,10001051,30474240),(12008,10001052,30539776),(12008,10001053,63045632),(12008,10001054,63111168),(12009,5152,0),(12009,6983,1756341932),(12009,17101,0),(12009,40851,1),(12009,44958,1756341924),(12009,45001,0),(12009,45162,1),(12009,50722,0),(12009,98231,0),(12009,10001001,8912896),(12009,10001002,8388608),(12009,10001003,8978432),(12009,10001004,8454144),(12009,10001005,9043968),(12009,10001006,8519680),(12009,10001007,9109504),(12009,10001008,8585216),(12009,10001009,9175040),(12009,10001010,8650752),(12009,10001011,9240576),(12009,10001012,8716288),(12009,10001013,9306112),(12009,10001014,8781824),(12009,10001015,9633792),(12009,10001016,9371648),(12009,10001017,9764864),(12009,10001018,9502720),(12009,10001019,9830400),(12009,10001020,9568256),(12009,10001021,10158080),(12009,10001022,9895936),(12009,10001023,10223616),(12009,10001024,9961472),(12009,10001025,10289152),(12009,10001026,10027008),(12009,10001027,10354688),(12009,10001028,10092544),(12009,10001029,16515072),(12009,10001030,16449536),(12009,10001031,17629184),(12009,10001032,17563648),(12009,10001033,17694720),(12009,10001034,17891328),(12009,10001035,18284544),(12009,10001036,18219008),(12009,10001037,18874368),(12009,10001038,18939904),(12009,10001039,21233664),(12009,10001040,21299200),(12009,10001041,22020096),(12009,10001042,21954560),(12009,10001043,23986176),(12009,10001044,24051712),(12009,10001045,28246016),(12009,10001046,28180480),(12009,10001047,28377088),(12009,10001048,28311552),(12009,10001049,30408704),(12009,10001050,30343168),(12009,10001051,30474240),(12009,10001052,30539776),(12010,5152,0),(12010,6983,1756341921),(12010,17101,0),(12010,40854,1),(12010,44958,1756341899),(12010,45001,0),(12010,45162,1),(12010,50722,0),(12010,98231,0),(12010,10001001,122945536),(12010,10001002,123273216),(12010,10001003,123404288),(12010,10001004,123731968),(12010,10001005,123797504),(12010,10001006,123863040),(12010,10001007,123928576),(12010,10002004,2),(12010,10002011,95),(12011,0,1756340546),(12011,1,557),(12011,5152,0),(12011,6983,1756345193),(12011,17101,0),(12011,30001,1),(12011,40851,1),(12011,44958,1756341189),(12011,45001,0),(12011,45162,1),(12011,50722,0),(12011,98231,0),(12011,10001001,8912896),(12011,10001002,8388608),(12011,10001003,8978432),(12011,10001004,8454144),(12011,10001005,9043968),(12011,10001006,8519680),(12011,10001007,9109504),(12011,10001008,8585216),(12011,10001009,9175040),(12011,10001010,8650752),(12011,10001011,9240576),(12011,10001012,8716288),(12011,10001013,9306112),(12011,10001014,8781824),(12011,10001015,9633792),(12011,10001016,9371648),(12011,10001017,9764864),(12011,10001018,9502720),(12011,10001019,9830400),(12011,10001020,9568256),(12011,10001021,10158080),(12011,10001022,9895936),(12011,10001023,10223616),(12011,10001024,9961472),(12011,10001025,10289152),(12011,10001026,10027008),(12011,10001027,10354688),(12011,10001028,10092544),(12011,10001029,16515072),(12011,10001030,16449536),(12011,10001031,17629184),(12011,10001032,17563648),(12011,10001033,17694720),(12011,10001034,17891328),(12011,10001035,18284544),(12011,10001036,18219008),(12011,10001037,18874368),(12011,10001038,18939904),(12011,10001039,21233664),(12011,10001040,21299200),(12011,10001041,22020096),(12011,10001042,21954560),(12011,10001043,23986176),(12011,10001044,24051712),(12011,10001045,28246016),(12011,10001046,28180480),(12011,10001047,28377088),(12011,10001048,28311552),(12011,10001049,30408704),(12011,10001050,30343168),(12011,10001051,30474240),(12011,10001052,30539776),(12012,5152,0),(12012,5170,0),(12012,5171,0),(12012,5172,0),(12012,5173,0),(12012,5174,0),(12012,5175,0),(12012,5176,0),(12012,5177,0),(12012,5178,0),(12012,5179,0),(12012,5180,0),(12012,5181,0),(12012,5182,0),(12012,5183,0),(12012,5184,0),(12012,5185,0),(12012,5186,0),(12012,5187,0),(12012,6983,1756352805),(12012,17101,0),(12012,30001,1),(12012,40851,1),(12012,44958,1756352061),(12012,45001,0),(12012,45162,1),(12012,50722,0),(12012,98231,0),(12012,101010,1756351483),(12012,10001001,8912896),(12012,10001002,8388608),(12012,10001003,8978432),(12012,10001004,8454144),(12012,10001005,9043968),(12012,10001006,8519680),(12012,10001007,9109504),(12012,10001008,8585216),(12012,10001009,9175040),(12012,10001010,8650752),(12012,10001011,9240576),(12012,10001012,8716288),(12012,10001013,9306112),(12012,10001014,8781824),(12012,10001015,9633792),(12012,10001016,9371648),(12012,10001017,9764864),(12012,10001018,9502720),(12012,10001019,9830400),(12012,10001020,9568256),(12012,10001021,10158080),(12012,10001022,9895936),(12012,10001023,10223616),(12012,10001024,9961472),(12012,10001025,10289152),(12012,10001026,10027008),(12012,10001027,10354688),(12012,10001028,10092544),(12012,10001029,16515072),(12012,10001030,16449536),(12012,10001031,17629184),(12012,10001032,17563648),(12012,10001033,17694720),(12012,10001034,17891328),(12012,10001035,18284544),(12012,10001036,18219008),(12012,10001037,18874368),(12012,10001038,18939904),(12012,10001039,21233664),(12012,10001040,21299200),(12012,10001041,22020096),(12012,10001042,21954560),(12012,10001043,23986176),(12012,10001044,24051712),(12012,10001045,28246016),(12012,10001046,28180480),(12012,10001047,28377088),(12012,10001048,28311552),(12012,10001049,30408704),(12012,10001050,30343168),(12012,10001051,30474240),(12012,10001052,30539776),(12013,0,1756351950),(12013,5152,0),(12013,5170,0),(12013,5171,0),(12013,5172,0),(12013,5173,0),(12013,5174,0),(12013,5175,0),(12013,5176,0),(12013,5177,0),(12013,5178,0),(12013,5179,0),(12013,5180,0),(12013,5181,0),(12013,5182,0),(12013,5183,0),(12013,5184,0),(12013,5185,0),(12013,5186,0),(12013,5187,0),(12013,6983,1756353426),(12013,7100,0),(12013,17101,0),(12013,30001,1),(12013,40851,1),(12013,44958,1756353168),(12013,45001,0),(12013,45162,1),(12013,98231,0),(12013,10001001,8912896),(12013,10001002,8388608),(12013,10001003,8978432),(12013,10001004,8454144),(12013,10001005,9043968),(12013,10001006,8519680),(12013,10001007,9109504),(12013,10001008,8585216),(12013,10001009,9175040),(12013,10001010,8650752),(12013,10001011,9240576),(12013,10001012,8716288),(12013,10001013,9306112),(12013,10001014,8781824),(12013,10001015,9633792),(12013,10001016,9371648),(12013,10001017,9764864),(12013,10001018,9502720),(12013,10001019,9830400),(12013,10001020,9568256),(12013,10001021,10158080),(12013,10001022,9895936),(12013,10001023,10223616),(12013,10001024,9961472),(12013,10001025,10289152),(12013,10001026,10027008),(12013,10001027,10354688),(12013,10001028,10092544),(12013,10001029,16515072),(12013,10001030,16449536),(12013,10001031,17629184),(12013,10001032,17563648),(12013,10001033,17694720),(12013,10001034,17891328),(12013,10001035,18284544),(12013,10001036,18219008),(12013,10001037,18874368),(12013,10001038,18939904),(12013,10001039,21233664),(12013,10001040,21299200),(12013,10001041,22020096),(12013,10001042,21954560),(12013,10001043,23986176),(12013,10001044,24051712),(12013,10001045,28246016),(12013,10001046,28180480),(12013,10001047,28377088),(12013,10001048,28311552),(12013,10001049,30408704),(12013,10001050,30343168),(12013,10001051,30474240),(12013,10001052,30539776),(12013,10001053,81461251),(12013,10001054,81526787),(12013,10002001,262144),(12013,10002011,19),(12014,5152,0),(12014,6983,1756343717),(12014,7100,0),(12014,17101,0),(12014,30001,1),(12014,40851,1),(12014,44958,1756343708),(12014,45001,0),(12014,45162,1),(12014,50722,0),(12014,77658,1),(12014,98231,0),(12014,10001001,8912896),(12014,10001002,8388608),(12014,10001003,8978432),(12014,10001004,8454144),(12014,10001005,9043968),(12014,10001006,8519680),(12014,10001007,9109504),(12014,10001008,8585216),(12014,10001009,9175040),(12014,10001010,8650752),(12014,10001011,9240576),(12014,10001012,8716288),(12014,10001013,9306112),(12014,10001014,8781824),(12014,10001015,9633792),(12014,10001016,9371648),(12014,10001017,9764864),(12014,10001018,9502720),(12014,10001019,9830400),(12014,10001020,9568256),(12014,10001021,10158080),(12014,10001022,9895936),(12014,10001023,10223616),(12014,10001024,9961472),(12014,10001025,10289152),(12014,10001026,10027008),(12014,10001027,10354688),(12014,10001028,10092544),(12014,10001029,16515072),(12014,10001030,16449536),(12014,10001031,17629184),(12014,10001032,17563648),(12014,10001033,17694720),(12014,10001034,17891328),(12014,10001035,18284544),(12014,10001036,18219008),(12014,10001037,18874368),(12014,10001038,18939904),(12014,10001039,21233664),(12014,10001040,21299200),(12014,10001041,22020096),(12014,10001042,21954560),(12014,10001043,23986176),(12014,10001044,24051712),(12014,10001045,28246016),(12014,10001046,28180480),(12014,10001047,28377088),(12014,10001048,28311552),(12014,10001049,30408704),(12014,10001050,30343168),(12014,10001051,30474240),(12014,10001052,30539776),(12015,5152,0),(12015,6983,1756344085),(12015,17101,0),(12015,30001,1),(12015,40851,1),(12015,44958,1756344076),(12015,45001,0),(12015,45162,1),(12015,50722,0),(12015,77658,1),(12015,98231,0),(12015,10001001,8912896),(12015,10001002,8388608),(12015,10001003,8978432),(12015,10001004,8454144),(12015,10001005,9043968),(12015,10001006,8519680),(12015,10001007,9109504),(12015,10001008,8585216),(12015,10001009,9175040),(12015,10001010,8650752),(12015,10001011,9240576),(12015,10001012,8716288),(12015,10001013,9306112),(12015,10001014,8781824),(12015,10001015,9633792),(12015,10001016,9371648),(12015,10001017,9764864),(12015,10001018,9502720),(12015,10001019,9830400),(12015,10001020,9568256),(12015,10001021,10158080),(12015,10001022,9895936),(12015,10001023,10223616),(12015,10001024,9961472),(12015,10001025,10289152),(12015,10001026,10027008),(12015,10001027,10354688),(12015,10001028,10092544),(12015,10001029,16515072),(12015,10001030,16449536),(12015,10001031,17629184),(12015,10001032,17563648),(12015,10001033,17694720),(12015,10001034,17891328),(12015,10001035,18284544),(12015,10001036,18219008),(12015,10001037,18874368),(12015,10001038,18939904),(12015,10001039,21233664),(12015,10001040,21299200),(12015,10001041,22020096),(12015,10001042,21954560),(12015,10001043,23986176),(12015,10001044,24051712),(12015,10001045,28246016),(12015,10001046,28180480),(12015,10001047,28377088),(12015,10001048,28311552),(12015,10001049,30408704),(12015,10001050,30343168),(12015,10001051,30474240),(12015,10001052,30539776),(12016,0,1756341445),(12016,1,1341),(12016,5152,0),(12016,6983,1756349176),(12016,7100,0),(12016,17101,0),(12016,30001,1),(12016,40851,1),(12016,44958,1756349164),(12016,45001,0),(12016,45162,1),(12016,50722,0),(12016,77658,1),(12016,98231,0),(12016,10001001,8912896),(12016,10001002,8388608),(12016,10001003,8978432),(12016,10001004,8454144),(12016,10001005,9043968),(12016,10001006,8519680),(12016,10001007,9109504),(12016,10001008,8585216),(12016,10001009,9175040),(12016,10001010,8650752),(12016,10001011,9240576),(12016,10001012,8716288),(12016,10001013,9306112),(12016,10001014,8781824),(12016,10001015,9633792),(12016,10001016,9371648),(12016,10001017,9764864),(12016,10001018,9502720),(12016,10001019,9830400),(12016,10001020,9568256),(12016,10001021,10158080),(12016,10001022,9895936),(12016,10001023,10223616),(12016,10001024,9961472),(12016,10001025,10289152),(12016,10001026,10027008),(12016,10001027,10354688),(12016,10001028,10092544),(12016,10001029,16515072),(12016,10001030,16449536),(12016,10001031,17629184),(12016,10001032,17563648),(12016,10001033,17694720),(12016,10001034,17891328),(12016,10001035,18284544),(12016,10001036,18219008),(12016,10001037,18874368),(12016,10001038,18939904),(12016,10001039,21233664),(12016,10001040,21299200),(12016,10001041,22020096),(12016,10001042,21954560),(12016,10001043,23986176),(12016,10001044,24051712),(12016,10001045,28246016),(12016,10001046,28180480),(12016,10001047,28377088),(12016,10001048,28311552),(12016,10001049,30408704),(12016,10001050,30343168),(12016,10001051,30474240),(12016,10001052,30539776),(12016,10002001,4),(12016,10002011,3),(12018,1,906),(12018,1956,1),(12018,5151,0),(12018,5152,1),(12018,5170,0),(12018,5171,0),(12018,5172,0),(12018,5173,0),(12018,5174,0),(12018,5175,0),(12018,5176,0),(12018,5177,0),(12018,5178,0),(12018,5179,0),(12018,5180,0),(12018,5181,0),(12018,5182,0),(12018,5183,0),(12018,5184,0),(12018,5185,0),(12018,5186,0),(12018,5187,0),(12018,5190,1756346478),(12018,6983,1756368005),(12018,7100,0),(12018,17101,0),(12018,30001,1),(12018,40853,1),(12018,44958,1756344700),(12018,45001,0),(12018,45162,1),(12018,50722,0),(12018,77658,1),(12018,98231,0),(12018,99963,1),(12018,10001001,123994112),(12018,10001002,124059648),(12018,10001003,124125184),(12018,10001004,124190720),(12018,10001005,124256256),(12018,10001006,124321792),(12018,10001007,124387328),(12018,10001008,124452864),(12018,10001009,124518400),(12018,10001010,124583936),(12019,5152,0),(12019,6983,1756342555),(12019,17101,0),(12019,30001,1),(12019,40851,1),(12019,45001,0),(12019,45162,1),(12019,98231,0),(12019,10001001,8912896),(12019,10001002,8388608),(12019,10001003,8978432),(12019,10001004,8454144),(12019,10001005,9043968),(12019,10001006,8519680),(12019,10001007,9109504),(12019,10001008,8585216),(12019,10001009,9175040),(12019,10001010,8650752),(12019,10001011,9240576),(12019,10001012,8716288),(12019,10001013,9306112),(12019,10001014,8781824),(12019,10001015,9633792),(12019,10001016,9371648),(12019,10001017,9764864),(12019,10001018,9502720),(12019,10001019,9830400),(12019,10001020,9568256),(12019,10001021,10158080),(12019,10001022,9895936),(12019,10001023,10223616),(12019,10001024,9961472),(12019,10001025,10289152),(12019,10001026,10027008),(12019,10001027,10354688),(12019,10001028,10092544),(12019,10001029,16515072),(12019,10001030,16449536),(12019,10001031,17629184),(12019,10001032,17563648),(12019,10001033,17694720),(12019,10001034,17891328),(12019,10001035,18284544),(12019,10001036,18219008),(12019,10001037,18874368),(12019,10001038,18939904),(12019,10001039,21233664),(12019,10001040,21299200),(12019,10001041,22020096),(12019,10001042,21954560),(12019,10001043,23986176),(12019,10001044,24051712),(12019,10001045,28246016),(12019,10001046,28180480),(12019,10001047,28377088),(12019,10001048,28311552),(12019,10001049,30408704),(12019,10001050,30343168),(12019,10001051,30474240),(12019,10001052,30539776),(12020,1,57),(12020,5151,3),(12020,5152,4),(12020,5170,3),(12020,5171,0),(12020,5172,0),(12020,5173,0),(12020,5174,0),(12020,5175,0),(12020,5176,0),(12020,5177,0),(12020,5178,0),(12020,5179,0),(12020,5180,0),(12020,5181,0),(12020,5182,0),(12020,5183,0),(12020,5184,0),(12020,5185,0),(12020,5186,0),(12020,5187,0),(12020,5190,1756358061),(12020,6983,1756368005),(12020,17101,0),(12020,30001,1),(12020,40854,1),(12020,44958,1756358075),(12020,45001,0),(12020,45162,1),(12020,50722,0),(12020,98231,0),(12020,99963,1),(12020,10001001,122945536),(12020,10001002,123273216),(12020,10001003,123404288),(12020,10001004,123731968),(12020,10001005,123797504),(12020,10001006,123863040),(12020,10001007,123928576),(12021,5152,0),(12021,6983,1756348563),(12021,17101,0),(12021,30001,1),(12021,40852,1),(12021,44958,1756348407),(12021,45001,0),(12021,45162,1),(12021,50722,0),(12021,98231,0),(12021,10001001,9437184),(12021,10001002,9699328),(12021,10001003,124846080),(12021,10001004,124780544),(12021,10001005,124649472),(12021,10001006,124715008);
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
) ENGINE=InnoDB AUTO_INCREMENT=12022 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (2,'Sorcerer Sample',1,1,8,1,185,185,4200,NULL,0,0,0,0,128,0,0,90,90,0,100,1,737,517,3,'',470,1,1740097001,16777343,1,0,0,1740097003,0,0,1,1,1,1,1,0,0,135,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,0),(3,'Druid Sample',1,1,8,5,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,737,517,3,'',470,1,1740096993,16777343,1,0,0,1740096995,0,0,1,1,1,1,1,0,0,44,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,0),(4,'Archer Sample',1,1,8,9,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,737,517,3,'',470,1,1740096988,16777343,1,0,0,1740096992,0,0,1,1,1,1,1,0,0,592,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,0),(5,'Knight Sample',1,1,8,13,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,737,517,3,'',470,1,1740096998,16777343,1,0,0,1740096999,0,0,1,1,1,1,1,0,0,210,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,0),(11930,'Elf Sample',1,1,8,35,185,185,4200,NULL,0,0,0,0,148,0,0,90,90,0,100,1,737,517,3,'',470,1,1740097005,16777343,1,0,0,1740097126,0,0,1,1,1,1,1,0,0,816,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,0),(11931,'Orc Sample',1,1,8,21,185,185,4200,NULL,0,0,0,0,1900,0,0,90,90,0,100,1,737,517,3,'',470,1,1740096999,16777343,1,0,0,1740097000,0,0,1,1,1,1,1,0,0,190,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,0),(11934,'[GOD] Middle Earth',6,8422,250,20,5080,5080,254237300,NULL,114,0,10,114,1893,3,4,1594,1594,34406,0,1,223,1560,7,'',12450,1,1756352020,452805297,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,420155,0,270000,0,0,43200,-1,2520,0,0,0,0,0,0,0,0,0,0,33,280,0,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,718,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1716080383),(11935,'Dwarf Sample',1,1,8,17,185,185,4200,NULL,0,0,0,0,1889,0,0,90,90,0,100,1,737,517,3,'',470,1,1740096995,16777343,1,0,0,1740096996,0,0,1,1,1,1,1,0,0,236,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,0),(11936,'Tolkien',1,8427,50,2,395,395,1868863,NULL,132,0,40,0,152,0,74,910,1350,434648,150,1,1204,747,6,'',989,1,1756363186,3353480637,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,282448,0,50212,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,11,97,10,0,0,'','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756261150),(11937,'Stormy',1,8428,50,14,830,830,1866424,NULL,132,0,40,114,134,0,4,56,300,5262,100,1,1599,366,6,'',1520,1,1756362920,3353480637,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,407339,0,47730,0,0,43200,-1,2496,10,0,10,0,41,117,10,0,10,0,25,116,10,0,0,'','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,3,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756261744),(11938,'Shaman',1,8427,8,5,185,185,4200,NULL,106,76,78,58,128,0,0,90,90,0,100,1,1066,1036,1,'',470,1,1756334231,368511177,1,0,0,1756334299,0,0,1,1,1,1,1,0,0,464,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756261797),(11939,'Ozymandias',1,8429,33,5,310,310,523389,NULL,114,83,0,114,128,0,84,840,840,2674162,100,1,1070,1036,1,'',770,1,1756352092,623394749,1,0,0,1756364619,0,0,0,0,0,0,0,0,0,341801,0,20000,0,0,43200,-1,2432,10,0,10,0,10,0,10,0,10,0,12,209,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,869,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756262068),(11940,'Oppenheimer',1,8430,69,2,490,490,5150404,NULL,114,114,114,114,1243,3,56,1920,1920,274582,150,1,1070,1036,1,'',1235,1,1756365571,1226271163,1,0,0,1756368000,0,0,0,0,0,0,0,0,0,158991,0,50000,0,0,43200,-1,2419,10,0,10,0,10,0,10,0,10,0,12,155,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756262175),(11941,'Iberdrola',1,8431,8,21,185,185,4200,NULL,0,0,0,0,1900,0,0,90,90,0,100,1,1506,1235,6,'',470,1,1756340734,623394749,1,0,0,1756341507,0,0,1,1,1,1,1,0,0,8891,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756262484),(11942,'Rap Da Alma',1,8432,9,21,199,199,6522,NULL,0,0,0,0,1901,0,0,93,93,678,100,1,1206,747,6,'\0 \0\0ˇˇˇˇ¯S\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛',497,1,1756338666,878223405,1,0,0,1756338698,0,0,1,1,1,1,1,0,0,2111,0,0,0,0,39972,3,2520,10,0,10,0,10,0,23,102,10,0,17,43,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756263165),(11943,'Criador De Jutsu',1,8432,29,9,395,395,334499,NULL,51,79,39,75,152,0,7,405,405,6447,100,1,1124,929,6,'\0 \0\0ˇˇˇˇ(Á	\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛\0\0\0ˇˇˇˇò:\0\0\Z\0\0\0\0\0˛',806,1,1756352018,878223405,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,185979,0,20000,0,0,43200,-1,2291,10,0,10,0,10,0,10,0,66,1330,14,119,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756263256),(11944,'Rulex Infernalist',1,8432,8,17,185,185,4200,NULL,0,0,0,0,1889,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756263333),(11945,'Greed',1,8428,8,17,185,185,4200,NULL,0,0,0,0,1889,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756263636),(11946,'Bfhbpqlyrps',1,8433,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756265492),(11947,'Shawty',1,8434,31,9,415,415,442440,NULL,91,114,79,0,156,0,6,435,435,10797,100,1,1600,371,3,'',838,0,1756352019,1987416355,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,208192,0,20000,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,56,23,13,97,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756266439),(11948,'Gorbatchov',1,8435,30,1,295,295,373801,NULL,86,97,3,76,128,0,58,714,750,125239,100,1,1361,1366,6,'\0 \0\0ˇˇˇˇ∞÷\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛\0\0\0\0\0\0\0hø\0\0\Z\0\0\0\0\0˛\0\0\0\0\0\0\0êe\0\0\Z\0\0\0\0\0,\0\0\0”M\">\r\0\0\0\0”M\">\0\0\0\0˛',734,1,1756342446,2722903985,1,0,0,1756346646,0,0,1,1,1,1,1,0,0,51290,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,7,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756267098),(11949,'Zpxysslfuczjgul',1,8436,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756267181),(11950,'Irjxoymj',1,8437,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756280119),(11951,'Rqbbnwrlmf',1,8438,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756285943),(11952,'Gandalf',1,8439,8,1,185,185,4200,NULL,0,0,0,0,128,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756295300),(11953,'Usain Arrow',1,8440,28,35,385,385,327229,NULL,83,76,45,14,1902,0,6,410,410,6427,100,1,575,576,7,'\0 \0\0ˇˇˇˇÄ\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛',810,0,1756352018,1146405045,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,156411,0,20000,0,0,43200,-1,2367,10,19,10,0,10,0,10,0,64,819,12,77,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,3,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756296418),(11954,'Fuu Houhou',1,8441,35,6,320,320,635158,NULL,94,0,116,94,635,3,23,900,900,5998,100,1,706,96,6,'\0 \0\0ˇˇˇˇ <\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\n\0\0\0˛Ä\0\0\0\0\0\0\0∏p\0\Z\0\0\0\0\0˛',794,0,1756359587,2350348475,1,0,0,1756359915,0,0,1,1,1,1,1,0,0,156975,0,20000,0,0,43200,-1,2456,10,0,10,0,10,0,10,0,10,0,10,2,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,3,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756302672),(11955,'Cacto',1,8442,8,21,185,185,4200,NULL,0,0,0,0,1900,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756303610),(11956,'Verde Orc',1,8443,13,21,255,255,25483,NULL,0,0,0,0,1900,0,1,105,105,1696,100,1,1594,366,4,'\0\0\0ˇˇˇˇ0u\0\0\Z\0\0\0\0\0˛',605,1,1756338521,1015048627,1,0,0,1756344016,0,0,1,1,1,1,1,0,0,29356,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,27,134,10,0,15,61,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756309007),(11957,'Mais Quanto',1,8444,8,17,185,185,4200,NULL,0,0,0,0,1889,0,0,90,90,0,100,1,1340,1371,6,'',470,1,1756334929,1015048627,1,0,0,1756335974,0,0,1,1,1,1,1,0,0,1045,0,0,0,0,43200,-1,2520,10,0,15,65,10,0,10,0,10,0,12,5,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,3,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756309055),(11958,'Puro Suco',1,8444,8,17,185,185,4200,NULL,0,0,0,0,1889,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756309080),(11959,'Atira Muito',1,8445,8,17,185,185,4200,NULL,0,0,0,0,1889,0,0,90,90,0,100,1,1062,652,7,'',470,1,1756334978,1015048627,1,0,0,1756334980,0,0,1,1,1,1,1,0,0,2,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,3,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756309133),(11960,'Atiira Muito',1,8445,13,9,110,235,25988,NULL,106,76,78,58,128,0,0,165,165,100,100,1,797,528,7,'',550,1,1756336750,1015048627,1,0,0,1756341032,0,0,1,1,1,1,1,0,0,20055,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,33,101,11,51,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756309225),(11961,'Muito Simples',1,8445,8,9,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756309260),(11962,'Efzzchiuzr',1,8446,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756310801),(11963,'Yozhobdxihrn',1,8447,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756312025),(11964,'Dwarf King',1,8448,25,18,440,440,228251,NULL,0,0,0,0,1888,0,5,119,175,1065749,200,1,1209,748,6,'\0 \0\0ˇˇˇˇÿp\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛',1065,1,1756348922,2085625521,1,0,0,1756348936,0,0,1,1,1,1,1,0,0,126227,0,21320,0,0,40804,1,2520,10,0,74,2067,10,0,10,0,10,0,16,16,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756316791),(11965,'Criei Druid',1,8449,31,5,291,300,419037,NULL,114,92,77,127,433,0,58,780,780,221189,100,1,1209,750,6,'\0 \0\0ˇˇˇˇh<\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0\0˛',746,0,1756351134,475314826,1,0,0,1756351245,0,0,1,1,1,1,1,0,0,262171,0,86780,0,0,43200,13,2471,10,5,10,0,10,0,10,0,10,0,10,27,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756317464),(11966,'Viinii',1,8450,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756317674),(11967,'Orc Vegano',1,8451,8,21,184,185,5100,NULL,0,0,0,0,1893,0,0,70,90,20,100,1,1302,1352,3,'\0\0\0ˇˇˇˇ0u\0\0\Z\0\0\0\0\0˛',470,1,1756333822,1195200945,1,0,0,1756349153,0,0,1,1,1,1,1,0,0,130680,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,43,299,10,0,30,8,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,3,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756318903),(11968,'Andin Inevitavel',1,8452,24,35,345,345,191904,NULL,0,0,0,0,1902,0,6,346,346,7049,100,1,1207,749,6,'',742,1,1756349043,907158961,1,0,0,1756349046,0,0,1,1,1,1,1,0,0,75882,0,0,0,0,43200,4,2520,10,0,10,0,10,0,10,0,80,1945,10,20,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756321916),(11969,'Chou Soran',1,8453,42,2,355,355,1093637,NULL,94,40,132,94,634,3,29,820,1110,22182,150,1,1594,375,4,'\0 \0\0ˇˇˇˇPô\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\n\0\0\0˛Ä\0\0\0\0\0\0\0(Ì\0\Z\0\0\0\0\0˛\0\0\0ˇˇˇˇ0u\0\0\Z\0\0\0\0\0˛',885,1,1756365323,2350348475,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,107717,0,20000,0,0,43200,-1,2395,14,453,10,0,10,0,10,0,10,0,13,239,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,624,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756325287),(11970,'Hector Bonilha',1,8454,8,9,183,185,4200,NULL,106,76,78,58,128,0,0,90,90,0,100,1,1608,376,6,'',470,1,1756352020,3159669386,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,248022,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,28,37,13,17,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756326835),(11971,'Danilandia',1,8455,8,17,182,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,1592,365,6,'',470,0,1756352020,3159669386,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,236231,0,0,0,0,43200,-1,2520,10,0,17,62,10,0,10,0,10,0,12,91,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756326933),(11972,'Smoker',1,8456,16,9,265,265,51380,NULL,95,94,36,104,129,0,1,210,210,245,100,1,566,582,6,'\0 \0\0ˇˇˇˇËÒ\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛',598,1,1756338209,3999334275,1,0,0,1756339189,0,0,1,1,1,1,1,0,0,25455,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,61,889,10,36,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756329338),(11973,'Kathy Insane',1,8457,8,1,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756330239),(11974,'Lamine Yamal',1,8458,19,5,240,240,87662,NULL,93,82,115,119,128,0,57,420,420,358656,100,1,603,574,7,'\0\0\0ˇˇˇˇ0u\0\0\Z\0\0\0\0\0˛\0 \0\0ˇˇˇˇ†˝\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛',602,1,1756340963,508270250,1,0,0,1756341383,0,0,1,1,1,1,1,0,0,26040,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,11,122,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756330804),(11975,'Solo Leveling',1,8459,8,5,185,185,4200,NULL,114,114,126,114,130,0,0,90,90,0,100,1,107,654,5,'\0 \0\0ˇˇˇˇh\n\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛',470,1,1756342071,2371395629,1,0,0,1756342621,0,0,1,1,1,1,1,0,0,685,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756330924),(11976,'El Felca',1,8460,32,36,427,427,494720,NULL,114,0,114,114,1902,0,8,372,476,9018,99,1,1207,750,6,'\0 \0\0ˇˇˇˇÿà\r\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0\0˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0˛',880,1,1756353116,4015372938,1,0,0,1756353287,0,0,1,1,1,1,1,0,0,137894,0,20000,0,0,43200,4,2484,10,3,10,0,10,0,10,0,64,196,11,1,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,3,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756331321),(11977,'Uzeto Free Itens',1,8460,8,17,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756331385),(11978,'Parabens Salles',1,8461,29,21,479,479,336175,NULL,0,0,0,0,1894,0,2,153,153,8485,100,1,1070,1036,1,'',1037,1,1756334918,2270673546,1,0,0,1756350857,0,0,0,0,0,0,0,0,0,201266,0,20000,0,0,43200,-1,2463,10,0,10,0,10,0,48,913,10,0,10,13,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756332053),(11979,'Lula',1,8462,64,19,1075,1075,4138728,NULL,95,10,0,95,1891,0,4,403,403,368533,200,10,1063,653,7,'',2520,1,1756360254,623394749,1,0,0,1756368000,0,0,0,0,0,0,0,0,0,172693,0,30078,0,0,43200,-1,2515,10,1,71,3429,10,0,10,0,10,0,11,48,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756332353),(11980,'Andinn Inevitavel',1,8452,8,13,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756332453),(11981,'Skylline',1,8463,28,5,285,285,316115,NULL,35,26,2,35,128,0,63,690,690,435740,100,1,1208,750,6,'\0 \0\0ˇˇˇˇÎ	\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0\0˛',710,1,1756345834,2425857837,1,0,0,1756345838,0,0,1,1,1,1,1,0,0,44091,0,2478,0,0,43200,13,2520,10,11,10,0,10,0,10,0,10,0,10,25,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,3,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756332496),(11982,'Anderson Inevitavel',1,8452,8,1,185,185,4200,NULL,106,76,78,58,128,0,0,90,90,0,100,1,1208,750,6,'\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0˛',470,1,1756349050,907158961,1,0,0,1756349067,0,0,1,1,1,1,1,0,0,17,0,0,0,0,43200,13,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,3,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756332569),(11983,'Zhang Chulan',1,8464,55,36,678,678,2598400,NULL,0,0,0,0,1902,0,15,376,865,7745,100,1,1283,1288,1,'\0 \0\0ˇˇˇˇ˝\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛\0\0\0ˇˇˇˇ(#\0\0\Z\0\0\0\0\0˛',1292,1,1756364971,2350348475,1,0,0,1756368000,0,0,0,0,0,0,0,0,0,252144,0,41987,0,0,43200,-1,2360,10,0,10,0,10,0,10,0,59,987,23,87,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756332708),(11984,'Reiyu Shita',1,8465,27,21,391,451,272312,NULL,0,0,0,0,1893,0,2,5,147,7654,100,13,1013,882,6,'\0 \0\0ˇˇˇˇP]\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛\0\0\0ˇˇˇˇHq\0\0\Z\0\0\0\0\0˛',983,1,1756359076,2350348475,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,176358,0,20000,0,0,43200,-1,2390,10,0,10,0,10,0,47,508,10,0,31,117,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,3,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756332794),(11985,'Orc Lokao',1,8466,23,21,395,395,157920,NULL,0,0,0,0,1900,0,2,59,135,1240,100,1,1600,375,4,'\0\0\0ˇˇˇˇ0u\0\0\Z\0\0\0\0\0˛',875,1,1756352018,2159804584,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,134672,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,48,751,10,0,35,154,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756333182),(11986,'Re Zero Beatrice',1,8459,25,1,270,270,230655,NULL,114,126,107,114,140,0,56,600,600,121544,100,1,1358,1382,6,'\0 \0\0ˇˇˇˇxû\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛',674,0,1756348086,2371395629,1,0,0,1756348179,0,0,1,1,1,1,1,0,0,43625,0,20000,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,11,66,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756333341),(11987,'Elrond Druid',1,8467,10,5,195,195,11605,NULL,0,114,0,88,128,0,74,150,150,655442,100,1,1206,748,6,'',494,1,1756338949,503005873,1,0,0,1756347654,0,0,1,1,1,1,1,0,0,61713,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,13,40,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756333426),(11988,'Luana Moranguinho',1,8468,64,6,465,465,4113014,NULL,106,76,78,58,136,0,56,1770,1770,79495,150,1,1071,1035,1,'\0 \0\0ˇˇˇˇPΩ\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\n\0\0\0˛',1171,0,1756366417,1226271163,1,0,0,1756368000,0,0,0,0,0,0,0,0,0,153612,0,36254,0,0,43200,-1,2381,10,0,10,0,10,0,10,0,10,0,11,52,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756333589),(11989,'Robin Hood',1,8469,38,9,366,485,804372,NULL,120,120,120,120,129,0,8,528,540,16889,100,1,798,439,8,'\0 \0\0ˇˇˇˇ¿t\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛\0\0\0ˇˇˇˇ0u\0\0\Z\0\0\0\0\0˛\0\0\0\0\0\0\0∏\0\0\Z\0\0\0\0\0.\0\0\0”M\">\r\0\0\0\0”M\">\0\0\0\0˛',950,1,1756352020,1722921407,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,219939,0,20000,0,0,43200,-1,2275,10,2,10,0,10,0,10,0,70,1654,14,85,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756333928),(11990,'Juice Fruit',1,8470,9,1,190,190,6454,NULL,106,76,78,58,128,0,0,120,120,446,100,1,739,512,7,'\0 \0\0ˇˇˇˇ $\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛',482,1,1756334607,452805297,1,0,0,1756335745,0,0,1,1,1,1,1,0,0,2618,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,11,91,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756334064),(11991,'Thaynan Charlove',1,8471,70,6,495,495,5299229,NULL,132,76,18,116,128,0,57,596,1950,338958,61,1,1317,1354,3,'\0 \0\0ˇˇˇˇ \0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\n\0\0\0˛\0\0\0ˇˇˇˇ0u\0\0\Z\0\0\0\0\0˛',1249,1,1756360056,2592405946,1,0,0,1756368000,0,0,1,1,1,1,1,1,0,196178,0,30052,0,0,43200,-1,2429,15,1157,10,0,10,0,10,0,10,0,16,26,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,421,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756334249),(11992,'Anna Koldings',1,8472,16,13,305,305,49097,NULL,34,14,114,49,466,0,3,18,130,3068,100,1,1598,375,4,'\0\0\0ˇˇˇˇHq\0\0\Z\0\0\0\0\0˛',670,0,1756352020,731884589,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,128716,0,0,0,0,43200,-1,2520,10,0,10,0,58,1226,10,0,10,0,34,42,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756334259),(11993,'Wheely',1,8473,8,17,185,185,4200,NULL,0,0,0,0,1891,0,0,90,90,0,100,1,1603,374,1,'',470,1,1756352018,1146405045,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,116692,0,0,0,0,43200,-1,2520,10,0,41,317,10,0,10,0,10,0,27,68,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,3,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756334483),(11994,'Aleska Teodoro',1,8474,66,23,1054,1054,4418070,NULL,0,0,0,0,136,0,6,321,321,1143867,100,1,1071,1036,1,'',2093,0,1756366218,1226271163,1,0,0,1756368000,0,0,0,0,0,0,0,0,0,216271,0,50043,0,0,43200,-1,2402,10,0,10,0,10,0,53,1153,10,0,11,106,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756334538),(11995,'Uppercut',1,8475,8,17,185,185,4504,NULL,114,114,67,114,1891,0,0,90,90,40,106,1,735,516,7,'\0 \0\0ˇˇˇˇÿ#	\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛\0@\0\0ˇˇˇˇp\0\Z\0\0\0\0\0\0\0\0®a\0\0˛',470,1,1756334994,3751354303,1,0,0,1756335702,0,0,1,1,1,1,1,0,0,708,0,0,0,0,43200,-1,2520,10,0,14,41,10,0,10,0,10,0,11,50,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756334962),(11996,'Joninha',1,8476,8,5,185,185,4200,NULL,106,76,78,58,128,0,0,90,90,0,100,1,1210,752,7,'',470,1,1756342808,2001697992,1,0,0,1756343406,0,0,1,1,1,1,1,0,0,14434,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756335255),(11997,'Receptaculo',1,8477,43,6,360,360,1221772,NULL,106,76,78,58,128,0,28,10,1140,4478,150,1,1594,366,4,'\0 \0\0ˇˇˇˇHM\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\n\0\0\0˛\0\0\0ˇˇˇˇHq\0\0\Z\0\0\0\0\0˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0˛',898,1,1756359947,232780479,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,247305,0,20000,0,0,43200,-1,2458,10,0,10,0,10,0,10,0,10,0,14,23,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756335902),(11998,'Alagoano Alma',1,8478,44,10,625,545,1242950,NULL,114,81,79,94,128,0,11,6,630,5259,150,1,1594,366,4,'\0 \0\0ˇˇˇˇ∏R	\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛\0\0\0ˇˇˇˇHq\0\0\Z\0\0\0\0\0˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0˛',1172,1,1756363525,232780479,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,227238,0,20000,0,0,43200,-1,2447,10,42,10,0,10,0,10,0,60,803,13,85,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756335951),(11999,'Ojuara',1,8479,8,9,175,185,4200,NULL,106,76,78,58,128,0,3,6,90,2606,100,1,1594,366,4,'\0\0\0ˇˇˇˇHq\0\0\Z\0\0\0\0\0˛',470,1,1756352038,232780479,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,92920,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,62,600,27,225,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756336002),(12000,'Go North',1,8444,12,5,167,205,21398,NULL,106,76,78,58,136,0,0,210,210,328,100,1,797,528,7,'',518,0,1756336776,1015048627,1,0,0,1756341123,0,0,1,1,1,1,1,0,0,21007,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,14,328,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756336043),(12001,'Para Para',1,8480,8,5,185,185,4200,NULL,106,76,78,58,128,0,0,90,90,0,100,1,1070,1036,1,'',470,1,1756336153,1015048627,1,0,0,1756336189,0,0,1,1,1,1,1,0,0,36,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756336141),(12002,'Press',1,8480,12,1,74,205,22887,NULL,106,76,78,58,128,0,0,210,210,224,100,1,797,528,7,'',518,1,1756336766,1015048627,1,0,0,1756341035,0,0,1,1,1,1,1,0,0,15330,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,15,18,10,2,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756336199),(12003,'Billy Boy',1,8481,8,21,185,185,4986,NULL,0,0,0,0,1895,0,0,90,90,373,100,1,1070,1036,1,'',470,1,1756340028,2425857837,1,0,0,1756345903,0,0,1,1,1,1,1,0,0,26683,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,11,48,10,0,10,96,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756336653),(12004,'Orappa',1,8482,57,10,675,675,2802999,NULL,106,76,78,58,128,0,12,705,825,88176,150,1,1208,747,6,'',1338,1,1756356705,2369726385,1,0,0,1756358063,0,0,0,0,0,0,0,0,0,88956,0,172,0,0,43200,-1,2487,10,0,10,0,10,0,10,0,81,602,10,16,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756336709),(12005,'Putifero',1,8483,44,2,365,365,1239667,NULL,106,76,78,58,128,0,26,11,1170,14199,150,1,1594,366,4,'\0 \0\0ˇˇˇˇXb	\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\n\0\0\0˛\0\0\0ˇˇˇˇHq\0\0\Z\0\0\0\0\0˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0˛',911,1,1756359885,232780479,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,204611,0,20000,0,0,43200,-1,2445,10,0,10,0,10,0,10,0,10,0,13,151,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756337002),(12006,'Fuba',1,8484,8,35,184,185,4200,NULL,0,0,0,0,148,0,0,90,90,0,100,1,1603,376,6,'',470,1,1756338113,198785930,1,0,0,1756344176,0,0,1,1,1,1,1,0,0,20804,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,27,1,12,114,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756337272),(12007,'Whvgqooqr',1,8485,8,35,185,185,4200,NULL,0,0,0,0,136,0,0,90,90,0,100,1,0,0,0,'',470,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756337733),(12008,'Negrosaki',1,8486,41,14,766,686,1012427,NULL,88,114,114,88,962,0,2,255,255,5901,100,1,1593,372,5,'',1295,1,1756357438,2144590730,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,177195,0,20091,0,0,43200,-1,2520,10,0,10,0,79,2580,10,0,10,0,23,219,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756338298),(12009,'Zico Dez',1,8487,8,9,185,185,4560,NULL,106,76,78,58,128,0,0,70,90,80,100,1,1207,749,6,'\0 \0\0ˇˇˇˇxc\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0˛',470,1,1756339125,1019019432,1,0,0,1756341927,0,0,1,1,1,1,1,0,0,5462,0,0,0,0,43200,4,2520,10,0,10,0,10,0,10,0,33,19,14,66,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756338901),(12010,'Dulokz',1,8488,8,17,185,185,4560,NULL,114,0,114,114,1891,0,0,90,90,240,126,1,1208,748,6,'\0 \0\0ˇˇˇˇò\"\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛',470,1,1756339256,1019019432,1,0,0,1756341916,0,0,1,1,1,1,1,0,0,5058,0,0,0,0,43200,1,2520,10,0,20,63,10,0,10,0,10,0,13,123,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756338965),(12011,'Terceiro',1,8489,8,13,185,185,4200,NULL,106,76,78,58,128,0,0,90,90,0,100,1,1608,376,6,'',470,1,1756342160,1015048627,1,0,0,1756345188,0,0,1,1,1,1,1,0,0,14032,0,0,0,0,43200,-1,2520,10,0,10,0,27,87,10,0,10,0,17,6,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,1,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756339723),(12012,'[CM] Middle Earth',5,8490,999,5,185,185,16517199400,NULL,106,76,78,58,266,0,0,90,90,0,100,4,1255,697,5,'',470,1,1756352020,2722833853,1,0,0,1756352800,0,0,1,1,1,1,1,0,0,42618,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756339786),(12013,'Jumahu',1,8491,8,13,185,185,4200,NULL,88,79,0,88,1243,3,8,90,90,7739120,100,1,1204,747,6,'',470,1,1756353375,2722833853,1,0,0,1756353421,0,0,1,1,1,1,1,0,0,92614,0,0,0,0,43200,2,2520,10,0,10,0,74,1393,10,0,10,0,10,24,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756339913),(12014,'Logitch',1,8492,10,9,201,205,10303,NULL,114,102,0,114,128,0,0,120,120,120,100,1,1206,750,6,'\0 \0\0ˇˇˇˇ¿E\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛',502,1,1756343636,2722833853,1,0,0,1756343712,0,0,1,1,1,1,1,0,0,12804,0,0,0,0,43200,4,2520,10,0,10,0,10,0,10,0,62,92,11,38,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756340026),(12015,'Paramax',1,8493,10,5,158,195,9530,NULL,128,0,0,114,128,0,0,150,150,1222,100,1,1209,750,6,'\0 \0\0ˇˇˇˇ∞\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛\0\0\0ˇˇˇˇ‡.\0\0\Z\0\0\0\0\0˛',494,1,1756341923,2722833853,1,0,0,1756344080,0,0,1,1,1,1,1,0,0,9762,0,0,0,0,43200,13,2520,10,0,10,0,10,0,10,0,10,0,10,34,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756340087),(12016,'Picapau',1,8494,20,9,305,305,111892,NULL,106,76,78,58,128,0,3,270,270,3469,100,1,1206,754,7,'\0 \0\0ˇˇˇˇ(·\n\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛',662,1,1756349126,3320781928,1,0,0,1756349171,0,0,1,1,1,1,1,0,0,94760,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,63,667,10,33,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756340216),(12017,'Orc Blokadao',1,8495,8,21,185,185,4200,NULL,0,0,0,0,1900,0,0,90,90,0,100,1,0,0,0,'',470,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1000,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,0,1756340973),(12018,'Orc The Criar',1,8496,32,21,521,521,472013,NULL,0,0,0,0,1898,0,3,132,162,21220,100,1,728,406,6,'\0 \0\0ˇˇˇˇñ\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛\0\0\0ˇˇˇˇ0u\0\0\Z\0\0\0\0\0˛\0\0\0\0\0\0\0ò:\0\0\Z\0\0\0\0\0,\0\0\0”M\">\r\0\0\0\0”M\">\0\0\0\0˛',1118,1,1756352018,878223405,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,264400,0,20000,0,0,43200,-1,2306,10,0,10,0,10,0,57,1284,10,0,26,97,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756341211),(12019,'China Weed Lover',1,8497,8,5,185,185,4202,NULL,106,76,78,58,128,0,0,90,90,48,100,1,1070,1035,1,'',470,1,1756342490,3046735283,1,0,0,1756342550,0,0,1,1,1,1,1,0,0,255,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756342263),(12020,'Drumbash Pebblebeard',1,8498,27,17,470,470,286274,NULL,0,0,0,0,1876,0,2,5,185,6490,200,1,1596,375,4,'\0\0\0ˇˇˇˇ0u\0\0\Z\0\0\0\0\0˛',1135,1,1756352018,1987416355,1,0,0,1756368000,0,0,1,1,1,1,1,0,0,191668,0,20000,0,0,43200,-1,2467,10,1,31,187,10,0,25,1279,10,0,23,63,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,2,0,1100,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756342287),(12021,'Xerequinha',1,8499,8,35,175,185,4357,NULL,0,0,81,0,1904,0,0,90,90,60,100,1,1000,615,8,'\0 \0\0ˇˇˇˇ@\0\Z\0\0\0\0\0Ë\0\0\0\0\0Ë\0\0\0\0\0˛',470,0,1756348246,3098974385,1,0,0,1756348558,0,0,1,1,1,1,1,0,0,1667,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,24,10,0,10,0,0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,1,0,0,0,NULL,NULL,'-','',-1,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0',0,0,1756344980);
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
INSERT INTO `server_config` VALUES ('boost_boss','500'),('boost_boss_name','deathstrike'),('boost_boss_url','AnimatedOutfits/outfit.php?id=128&addons=3&head=115&body=107&legs=19&feet=38'),('boost_monster','2'),('boost_monsterSecond','326'),('boost_monsterThird','1621'),('boost_monster_name','orc warlord'),('boost_monster_nameSecond','frost torog'),('boost_monster_nameThird','true midnight asura'),('boost_monster_url','AnimatedOutfits/outfit.php?id=2&head=20&body=30&legs=40&feet=50'),('boost_monster_urlSecond','AnimatedOutfits/outfit.php?id=128&addons=3&head=115&body=107&legs=19&feet=38'),('boost_monster_urlSThird','AnimatedOutfits/outfit.php?id=362'),('boost_monster_urlThird','AnimatedOutfits/outfit.php?id=1068&addons=1&head=58&body=76&legs=72&feet=38'),('db_version','35'),('motd_hash','ccc5ec59ffd62304d9342dbd38e47d691102b384'),('motd_num','3'),('players_record','52');
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
INSERT INTO `store_history` VALUES (8422,0,1,0,'Autoloot',-22,1708181834),(8422,0,50,0,'[GOD] Shire Tales transferred to Teste Xp',-50,1708441794),(8422,0,28,0,'[GOD] Shire Tales transferred to joninha testestore',-28,1708457256),(8422,0,100,0,'[GOD] Shire Tales transferred to joninha testestore',-100,1708457408),(8422,0,100,0,'[GOD] Shire Tales transferred to joninha testeStore',-100,1708457418),(8422,0,1,0,'Autoloot',-25,1716228739),(8422,0,1,0,'Autoloot',-25,1716228993),(8422,0,1,0,'Autoloot',-25,1716230731),(8422,0,1,0,'Autoloot',-25,1756273189),(8429,0,10,0,'Roulette Coins',-35,1756334496),(8471,0,1,0,'Autoloot',-25,1756334714),(8448,0,125,0,'Dwarf King transferred to Criei Druid',-125,1756335231),(8449,0,125,0,'Dwarf King transferred to Criei Druid',125,1756335231),(8429,0,1,0,'Zaoan Chess Box',-12,1756335548),(8429,0,50,0,'Ozymandias transferred to lula',-50,1756335633),(8462,0,50,0,'Ozymandias transferred to lula',50,1756335633),(8462,0,1,0,'Club 10000x',-10,1756335674),(8462,0,1,0,'Autoloot',-25,1756335682),(8429,0,10,0,'Roulette Coins',-35,1756335752),(8467,0,1,0,'Black Skull',-20,1756336576),(8440,0,1,0,'XP Boost +50%',-6,1756337904),(8440,0,15,0,'15 days of premium account.',-7,1756337914),(8467,0,1,0,'Rod 10000x',-10,1756337980),(8448,0,1,0,'Club 10000x',-10,1756338147),(8448,0,1,0,'Rod 10000x',-10,1756338152),(8429,0,10,0,'Roulette Coins',-35,1756339063),(8430,0,25,0,'Oppenheimer transferred to Aleska Teodoro',-25,1756339940),(8474,0,25,0,'Oppenheimer transferred to Aleska Teodoro',25,1756339940),(8474,0,1,0,'Autoloot',-25,1756339955),(8486,0,1,0,'Retro Warrior',-20,1756340018),(8430,0,25,0,'Oppenheimer transferred to Luana Moranguinho',-25,1756340218),(8468,0,25,0,'Oppenheimer transferred to Luana Moranguinho',25,1756340218),(8468,0,1,0,'Autoloot',-25,1756340234),(8489,0,1,0,'Roulette Coin',-4,1756340314),(8489,0,1,0,'Roulette Coin',-4,1756340317),(8488,0,25,0,'Dulokz transferred to Zico Dez',-25,1756340471),(8487,0,25,0,'Dulokz transferred to Zico Dez',25,1756340471),(8487,0,1,0,'Autoloot',-25,1756340488),(8488,0,1,0,'Roulette Coin',-4,1756340544),(8488,0,1,0,'Roulette Coin',-4,1756340554),(8488,0,1,0,'Roulette Coin',-4,1756340556),(8488,0,1,0,'Roulette Coin',-4,1756340558),(8488,0,1,0,'Roulette Coin',-4,1756340612),(8430,0,1,0,'Autoloot',-25,1756340742),(8486,0,1,0,'Autoloot',-25,1756340870),(8491,0,30,0,'30 days of premium account.',-12,1756340961),(8491,0,1,0,'Autoloot',-25,1756340978),(8489,0,1,0,'Roulette Coin',-4,1756341085),(8489,0,1,0,'Roulette Coin',-4,1756341089),(8482,0,1,0,'Voidborn Horse',-20,1756341469),(8491,0,1,0,'Hand Of The Inquisition',-25,1756342084),(8491,0,1,0,'Rod 1000x',-3,1756342191),(8491,0,1,0,'Sword 10000x',-10,1756342199),(8430,0,10,0,'Roulette Coins',-35,1756342258),(8430,0,10,0,'Roulette Coins',-35,1756342433),(8452,0,1,0,'Bow 1000x',-3,1756343252),(8462,0,1,0,'XP Boost +50%',-6,1756343617),(8430,0,1,0,'Hand Of The Inquisition',-25,1756343902),(8430,0,1,0,'Black Skull',-20,1756343929),(8430,0,1,0,'Flaming Horse',-20,1756343936),(8448,0,1,0,'Autoloot',-25,1756343999),(8453,0,1,0,'XP Boost +50%',-6,1756344075),(8453,0,1,0,'Conjurer Outfit',-15,1756344360),(8430,0,1,0,'XP Boost +50%',-6,1756344447),(8427,0,1,0,'Autoloot',-25,1756344454),(8453,0,1,0,'Death Crawler',-18,1756344524),(8427,0,300,0,'Mana Potion',-2,1756344770),(8452,0,1,0,'Bow 1000x',-3,1756345415),(8441,0,1,0,'Conjurer Outfit',-15,1756345745),(8429,0,10,0,'Roulette Coins',-35,1756346200),(8482,0,1,0,'Bow 10000x',-10,1756346643),(8427,0,1,0,'Wand 10000x',-10,1756350419),(8430,0,1,0,'XP Boost +50%',-6,1756352050),(8462,0,1,0,'XP Boost +50%',-6,1756352583),(8453,0,10,0,'Roulette Coins',-35,1756352752),(8422,0,1,0,'Roulette Coin',-4,1756352794),(8430,0,1,0,'Wand 10000x',-10,1756353351),(8474,0,1,0,'Rod 5000x',-6,1756353405),(8430,0,10,0,'Roulette Coins',-35,1756353425),(8482,0,30,0,'30 days of premium account.',-12,1756353430),(8430,0,10,0,'Roulette Coins',-35,1756353550),(8429,0,1,0,'Rod 10000x',-10,1756355468),(8482,0,10,0,'Roulette Coins',-35,1756356800),(8486,0,30,0,'30 days of premium account.',-12,1756360482),(8486,0,1,0,'Sword 10000x',-10,1756360516);
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
INSERT INTO `tile_store` VALUES (1,'4‚\0\0\0á\0'),(1,'4„\0\0\0à\0'),(1,'6Â\0\0\0º\0'),(2,';„\0\0\0á\0'),(2,':Â\0\0\0º\0'),(2,';‰\0\0\0à\0'),(2,'<‰\0\0\0\'\0'),(3,'4È\0\0\0á\0'),(3,'4Í\0\0\0à\0'),(3,'5Ó\0\0\0º\0'),(4,'8È\0\0\0á\0'),(4,'8Í\0\0\0à\0'),(4,'<Í\0\0\0\'\0'),(4,'9Ó\0\0\0&\0'),(4,':Ó\0\0\0º\0'),(4,'<Ì\0\0\0\'\0'),(5,'@Á\0\0\0á\0'),(5,'@Ë\0\0\0à\0'),(5,'AÎ\0\0\0&\0'),(5,'CÎ\0\0\0º\0'),(5,'DÍ\0\0\0\'\0'),(6,'@Ô\0\0\0á\0'),(6,'@\0\0\0à\0'),(6,'DÒ\0\0\0\'\0'),(6,'BÙ\0\0\0º\0'),(7,'KÌ\0\0\0á\0'),(7,'KÓ\0\0\0à\0'),(7,'LÔ\0\0\0\'\0'),(7,'I\0\0\0º\0'),(7,'K\0\0\0&\0'),(8,'\r\0\0\0â\0'),(8,'\0\0\0ä\0'),(8,'\0\0\0º\0'),(8,'\r\n\0\0\0â\0'),(8,'\n\0\0\0ä\0'),(8,'\0\0\0&\0'),(8,'\0\0\0&\0'),(9,'\0\0\0â\0'),(9,'\0\0\0ä\0'),(9,'\0\0\0º\0'),(9,'\n\0\0\0â\0'),(9,'\n\0\0\0ä\0'),(9,'\0\0\0&\0'),(9,'\0\0\0â\0'),(9,'\0\0\0ä\0'),(9,'\0\0\0\'\0'),(9,'	\0\0\0\'\0'),(9,'\n\0\0\0\'\0'),(9,'\0\0\0&\0'),(10,'\0\0\0º\0'),(10,'\0\0\0á\0'),(10,'\0\0\0à\0'),(10,'\0\0\0â\0'),(10,'\Z\0\0\0ä\0'),(11,'\"\0\0\0â\0'),(11,'#\0\0\0ä\0'),(11,'%\0\0\0á\0'),(11,'%\0\0\0à\0'),(11,'\'\0\0\0á\0'),(11,'\'\0\0\0à\0'),(11,'\"\0\0\0&\0'),(11,'\"\"\0\0\0º\0'),(11,'&\"\0\0\0&\0'),(12,'\"%\0\0\0º\0'),(12,'$*\0\0\0â\0'),(12,'%*\0\0\0ä\0'),(12,'\')\0\0\0á\0'),(12,'\'*\0\0\0à\0'),(13,'Û\0\0\0á\0'),(13,'Ù\0\0\0à\0'),(13,'Ù\0\0\0\'\0'),(13,'˜\0\0\0π\0'),(14,'¸\0\0\0á\0'),(14,'˝\0\0\0à\0'),(14,'˝\0\0\0π\0'),(14,'\0\0\0\0â\0'),(14,'\r\0\0\0\0ä\0'),(15,'˙\0\0\0º\0'),(15,'ˇ\0\0\0â\0'),(15,'ˇ\0\0\0ä\0'),(15,'\0\0\0\0&\0'),(15,'\Z\0\0\0\0&\0'),(16,'˚\0\0\0á\0'),(16,'¸\0\0\0à\0'),(16,'\"˙\0\0\0º\0'),(16,' ˛\0\0\0&\0'),(16,'\"˛\0\0\0&\0'),(16,'$¸\0\0\0\'\0'),(16,'$˝\0\0\0\'\0'),(17,'Û\0\0\0â\0'),(17,'Û\0\0\0ä\0'),(17,'Ù\0\0\0π\0'),(18,'\0\0\0á\0'),(18,'\0\0\0à\0'),(18,'\0\0\0º\0'),(19,'\0\0\0á\0'),(19,'\Z\0\0\0à\0'),(19,'\0\0\0π\0'),(19,'\0\0\0\'\0'),(20,'\0\0\0á\0'),(20,'\0\0\0à\0'),(20,'\"\0\0\0â\0'),(20,'\"\0\0\0ä\0'),(20,' \0\0\0π\0'),(21,'4Û\0\0\0á\0'),(21,'7Ú\0\0\0º\0'),(21,'4Ù\0\0\0à\0'),(21,'9ı\0\0\0\'\0'),(22,'3˘\0\0\0π\0'),(22,'6˚\0\0\0&\0'),(22,'8¯\0\0\0á\0'),(22,'8˘\0\0\0à\0'),(23,':¯\0\0\0á\0'),(23,':˘\0\0\0à\0'),(23,'?˘\0\0\0π\0'),(24,':¸\0\0\0á\0'),(24,':˝\0\0\0à\0'),(24,'?˝\0\0\0π\0'),(25,'H˜\0\0\0º\0'),(25,'C¯\0\0\0á\0'),(25,'C˘\0\0\0à\0'),(25,'E¯\0\0\0á\0'),(25,'E˘\0\0\0à\0'),(25,'J˘\0\0\0\'\0'),(25,'J˚\0\0\0\'\0'),(25,'E˛\0\0\0&\0'),(25,'G˛\0\0\0&\0'),(25,'I˛\0\0\0&\0'),(25,'J˝\0\0\0\'\0'),(26,'-,\0\0\0á\0'),(26,'--\0\0\0à\0'),(26,'0&\0\0\0º\0'),(26,'1,\0\0\0â\0'),(26,'2,\0\0\0ä\0'),(27,'M˙\0\0\0π\0'),(27,'P˘\0\0\0á\0'),(27,'P˙\0\0\0à\0'),(28,'R˘\0\0\0á\0'),(28,'R˙\0\0\0à\0'),(28,'T¯\0\0\0º\0'),(29,'B\0\0\0á\0'),(29,'B\0\0\0à\0'),(29,'F\0\0\0π\0'),(30,'J\0\0\0á\0'),(30,'J\0\0\0à\0'),(30,'L\0\0\0º\0'),(31,'Vˇ\0\0\0á\0'),(31,'O\0\0\0\0π\0'),(31,'V\0\0\0\0à\0'),(32,'Q\0\0\0\'\0'),(32,'T\0\0\0á\0'),(32,'T\0\0\0à\0'),(32,'Q\0\0\0π\0'),(33,'X\0\0\0á\0'),(33,'X\0\0\0à\0'),(33,'W	\0\0\0º\0'),(33,'X	\0\0\0&\0'),(34,'G\0\0\0á\0'),(34,'J\n\0\0\0º\0'),(34,'G\0\0\0à\0'),(35,'I\0\0\0á\0'),(35,'I\0\0\0à\0'),(35,'M\0\0\0\'\0'),(35,'M\0\0\0π\0'),(36,'T\0\0\0π\0'),(36,'[\r\0\0\0á\0'),(36,'[\0\0\0à\0'),(37,'T\0\0\0π\0'),(37,'[\0\0\0á\0'),(37,'[\0\0\0à\0'),(38,'[\0\0\0á\0'),(38,'[\0\0\0à\0'),(38,'T\0\0\0π\0'),(39,'I\0\0\0á\0'),(39,'I\0\0\0à\0'),(39,'M\0\0\0\'\0'),(39,'M\0\0\0π\0'),(40,'J\Z\0\0\0º\0'),(40,'H\0\0\0á\0'),(40,'H\0\0\0à\0'),(41,'M\0\0\0á\0'),(41,'M\0\0\0à\0'),(41,'R\0\0\0π\0'),(42,'X#\0\0\0á\0'),(42,'W%\0\0\0º\0'),(42,'X$\0\0\0à\0'),(43,'F \0\0\0á\0'),(43,'F!\0\0\0à\0'),(43,'I \0\0\0\'\0'),(43,'I!\0\0\0π\0'),(44,'U\0\0\0π\0'),(44,'U\0\0\0\'\0'),(44,'Y\0\0\0á\0'),(44,'Y\0\0\0à\0'),(45,'C&\0\0\0á\0'),(45,'C\'\0\0\0à\0'),(45,'G&\0\0\0π\0'),(46,'J*\0\0\0π\0'),(46,'N)\0\0\0á\0'),(46,'N*\0\0\0à\0'),(47,'T\'\0\0\0º\0'),(47,'R)\0\0\0á\0'),(47,'R*\0\0\0à\0'),(48,'C+\0\0\0á\0'),(48,'C,\0\0\0à\0'),(48,'G,\0\0\0\'\0'),(48,'G.\0\0\0π\0'),(49,'M/\0\0\0π\0'),(49,'M1\0\0\0\'\0'),(49,'P0\0\0\0á\0'),(49,'P1\0\0\0à\0'),(50,'?*\0\0\0á\0'),(50,'?+\0\0\0à\0'),(50,'=-\0\0\0º\0'),(50,'?-\0\0\0&\0'),(51,'?1\0\0\0á\0'),(51,'?2\0\0\0à\0'),(51,'<4\0\0\0º\0'),(51,'>4\0\0\0&\0'),(52,'F2\0\0\0â\0'),(52,'G2\0\0\0ä\0'),(52,'C4\0\0\0π\0'),(53,'~É\0\0\0ﬁ\0'),(53,'~Ñ\0\0\0ﬂ\0'),(53,'ÑÉ\0\0\0ﬁ\0'),(53,'ÑÑ\0\0\0ﬂ\0'),(53,'Çà\0\0\0œ\r\0'),(54,'C7\0\0\0º\0'),(54,'D:\0\0\0â\0'),(54,'E:\0\0\0ä\0'),(55,'1/\0\0\0â\0'),(55,'2/\0\0\0ä\0'),(55,'22\0\0\0º\0'),(55,'32\0\0\0&\0'),(56,'5/\0\0\0â\0'),(56,'6/\0\0\0ä\0'),(56,'62\0\0\0º\0'),(57,'46\0\0\0á\0'),(57,'47\0\0\0à\0'),(57,'19\0\0\0º\0'),(57,'39\0\0\0&\0'),(58,'3<\0\0\0º\0'),(58,'7?\0\0\0á\0'),(58,'7@\0\0\0à\0'),(59,'+1\0\0\0â\0'),(59,',1\0\0\0ä\0'),(59,'(4\0\0\0º\0'),(59,'+4\0\0\0&\0'),(60,'*;\0\0\0º\0'),(60,',8\0\0\0á\0'),(60,',9\0\0\0à\0'),(60,',;\0\0\0&\0'),(61,'$/\0\0\0â\0'),(61,'%/\0\0\0ä\0'),(61,'#2\0\0\0º\0'),(61,'%2\0\0\0&\0'),(62,'!6\0\0\0º\0'),(62,'$7\0\0\0á\0'),(62,'$8\0\0\0à\0'),(63,'#=\0\0\0º\0'),(63,'%>\0\0\0á\0'),(63,'%?\0\0\0à\0'),(64,'\Z3\0\0\0º\0'),(64,'3\0\0\0&\0'),(64,'0\0\0\0á\0'),(64,'1\0\0\0à\0'),(65,'6\0\0\0º\0'),(65,';\0\0\0â\0'),(65,';\0\0\0ä\0'),(66,'6\0\0\0º\0'),(66,'9\0\0\0â\0'),(66,'9\0\0\0ä\0'),(67,'3\0\0\0º\0'),(67,'3\0\0\0&\0'),(67,'1\0\0\0á\0'),(67,'2\0\0\0à\0'),(68,',\0\0\0π\0'),(68,'-\0\0\0\'\0'),(68,'-\0\0\0â\0'),(68,'-\0\0\0ä\0'),(69,'+\0\0\0º\0'),(69,',\0\0\0â\0'),(69,'\r,\0\0\0ä\0'),(70,'\r$\0\0\0º\0'),(70,'\'\0\0\0â\0'),(70,'\'\0\0\0ä\0'),(71,'#\0\0\0º\0'),(71,'&\0\0\0á\0'),(71,'\'\0\0\0à\0'),(72,'ˇ&\0\0\0á\0'),(72,'ˇ\'\0\0\0à\0'),(72,'\0#\0\0\0º\0'),(73,'˝\0\0\0â\0'),(73,'˛\0\0\0ä\0'),(73,'\0\0\0\0π\0'),(74,'\0\0\0π\0'),(74,'	\0\0\0á\0'),(74,' \0\0\0\'\0'),(74,'	 \0\0\0à\0'),(75,'\0\0\0á\0'),(75,'\0\0\0º\0'),(75,'\0\0\0à\0'),(76,'˚\0\0\0º\0'),(76,'˘\0\0\0á\0'),(76,'˘\0\0\0à\0'),(77,'\0\r\0\0\0º\0'),(77,'\0\0\0á\0'),(77,'\0\0\0à\0'),(78,'ˇ\0\0\0π\0'),(78,'˚	\0\0\0â\0'),(78,'¸	\0\0\0ä\0'),(79,'\0\0\0º\0'),(79,'\0\0\0á\0'),(79,'	\0\0\0à\0'),(80,'˝\0\0\0π\0'),(80,'\0\0\0\0\0á\0'),(80,'\0\0\0\0à\0'),(80,'\0\0\0\0á\0'),(80,'\0\0\0à\0'),(81,'Ù\0\0\0â\0'),(81,'Ù\0\0\0ä\0'),(81,'ˆ\0\0\0π\0'),(82,'	Ú\0\0\0π\0'),(82,'\nÛ\0\0\0â\0'),(82,'Û\0\0\0ä\0'),(83,'q¯\0\0\0π\0'),(83,'u¯\0\0\0π\0'),(84,',?\0\0\0º\0'),(84,'-B\0\0\0â\0'),(84,'.B\0\0\0ä\0'),(85,'B”\0\0\0π\0'),(85,'E–\0\0\0ﬁ\0'),(85,'E—\0\0\0ﬂ\0'),(85,'F”\0\0\0∫\0'),(86,'J€\0\0\0ﬁ\0'),(86,'E‹\0\0\0π\0'),(86,'I›\0\0\0º\0'),(86,'J‹\0\0\0ﬂ\0'),(87,'PŸ\0\0\0π\0'),(87,'R⁄\0\0\0‹\0'),(87,'S⁄\0\0\0›\0'),(87,'TŸ\0\0\0∫\0'),(88,'X·\0\0\0º\0'),(88,'S‰\0\0\0ﬁ\0'),(88,'SÂ\0\0\0ﬂ\0'),(88,'XÊ\0\0\0º\0'),(89,']Î\0\0\0π\0'),(89,'_È\0\0\0‹\0'),(89,'`È\0\0\0›\0'),(89,'aÎ\0\0\0∫\0'),(90,'e€\0\0\0º\0'),(90,'bﬁ\0\0\0ﬁ\0'),(90,'bﬂ\0\0\0ﬂ\0'),(90,'e‡\0\0\0º\0'),(91,'VÚ\0\0\0ﬁ\0'),(91,'VÛ\0\0\0ﬂ\0'),(91,'W\0\0\0º\0'),(91,'YÙ\0\0\0∫\0'),(92,'bÒ\0\0\0ﬁ\0'),(92,'bÚ\0\0\0ﬂ\0'),(92,'d\0\0\0º\0'),(92,'fÚ\0\0\0π\0'),(93,'æË\0\0\0‹\0'),(93,'øË\0\0\0›\0'),(93,'¿Ï\0\0\0¸\0'),(94,'√Ë\0\0\0‹\0'),(94,'ƒË\0\0\0›\0'),(94,'√Ï\0\0\0¸\0'),(95,'∆Ë\0\0\0‹\0'),(95,'«Ë\0\0\0›\0'),(95,'«Ï\0\0\0¸\0'),(96,'ÀË\0\0\0‹\0'),(96,'ÃË\0\0\0›\0'),(96,'ÃÏ\0\0\0¸\0'),(97,'ŒË\0\0\0‹\0'),(97,'œË\0\0\0›\0'),(97,'œÏ\0\0\0¸\0'),(98,'øı\0\0\0¸\0'),(98,'ø¯\0\0\0‹\0'),(98,'¿¯\0\0\0›\0'),(98,'¿˘\0\0\0D\0'),(99,'√ı\0\0\0¸\0'),(99,'√¯\0\0\0‹\0'),(99,'ƒ¯\0\0\0›\0'),(100,'«ı\0\0\0¸\0'),(100,'∆¯\0\0\0‹\0'),(100,'«¯\0\0\0›\0'),(101,'Àı\0\0\0¸\0'),(101,' ¯\0\0\0‹\0'),(101,'À¯\0\0\0›\0'),(102,'œı\0\0\0¸\0'),(102,'Œ¯\0\0\0‹\0'),(102,'œ¯\0\0\0›\0'),(103,'≈¸\0\0\0¸\0'),(103,'»˝\0\0\0ﬁ\0'),(103,'»˛\0\0\0ﬂ\0'),(104,' ˝\0\0\0ﬁ\0'),(104,' ˛\0\0\0ﬂ\0'),(104,'Ã¸\0\0\0¸\0'),(105,'ΩÂ\0\0\0‹\0'),(105,'æÂ\0\0\0›\0'),(105,'æÈ\0\0\0¸\0'),(106,'âÉ\0\0\0ﬁ\0'),(106,'èÉ\0\0\0ﬁ\0'),(106,'àá\0\0\0ÿ\r\0'),(106,'âÑ\0\0\0ﬂ\0'),(106,'èÑ\0\0\0ﬂ\0'),(107,'≈Â\0\0\0‹\0'),(107,'∆Â\0\0\0›\0'),(107,'∆È\0\0\0¸\0'),(108,'…Â\0\0\0ﬁ\0'),(108,'…Ê\0\0\0ﬂ\0'),(108,'ÃÂ\0\0\0ﬁ\0'),(108,'ÃÊ\0\0\0ﬂ\0'),(108,'ÀÈ\0\0\0¸\0'),(109,'œÈ\0\0\0¸\0'),(109,'–Â\0\0\0‹\0'),(109,'—Â\0\0\0›\0'),(110,'ø˜\0\0\0¸\0'),(110,'ø˚\0\0\0‹\0'),(110,'¿˚\0\0\0›\0'),(110,'√˚\0\0\0‹\0'),(110,'ƒ˚\0\0\0›\0'),(111,'~ç\0\0\0ﬁ\0'),(111,'~é\0\0\0ﬂ\0'),(111,'Äå\0\0\0œ\r\0'),(112,'«˜\0\0\0¸\0'),(112,'∆˙\0\0\0ﬁ\0'),(112,'∆˚\0\0\0ﬂ\0'),(113,'À˜\0\0\0¸\0'),(113,' ˚\0\0\0‹\0'),(113,'À˚\0\0\0›\0'),(114,'œ˜\0\0\0¸\0'),(114,'Œ˙\0\0\0ﬁ\0'),(114,'Œ˚\0\0\0ﬂ\0'),(115,'6&\0\0\0º\0'),(115,'4*\0\0\0á\0'),(115,'4+\0\0\0à\0'),(116,'<!\0\0\0π\0'),(116,';%\0\0\0á\0'),(116,';&\0\0\0à\0'),(117,'>\0\0\0π\0'),(117,'C\0\0\0â\0'),(117,'D\0\0\0ä\0'),(118,'\r\0\0\0‚\0'),(118,'!\r\0\0\0⁄\0'),(118,'!\0\0\0€\0'),(119,'\0\0\0‚\0'),(119,'\"\0\0\0⁄\0'),(119,'\"\0\0\0€\0'),(120,' ¸\0\0\0‚\0'),(120,'#˝\0\0\0⁄\0'),(120,'#˛\0\0\0€\0'),(121,'\0\0\0‚\0'),(121,'\"Ò\0\0\0⁄\0'),(121,'\"Ú\0\0\0€\0'),(122,' Ê\0\0\0‚\0'),(122,'#Ê\0\0\0⁄\0'),(122,'#Á\0\0\0€\0'),(123,' ·\0\0\0‚\0'),(123,'#·\0\0\0⁄\0'),(123,'#‚\0\0\0€\0'),(124,'Ÿ\0\0\0‚\0'),(124,'\"Ÿ\0\0\0⁄\0'),(124,'\"⁄\0\0\0€\0'),(125,'’\0\0\0‚\0'),(125,'\"’\0\0\0⁄\0'),(125,'\"÷\0\0\0€\0'),(126,'—\0\0\0‚\0'),(126,'\"–\0\0\0⁄\0'),(126,'\"—\0\0\0€\0'),(127,'(»\0\0\0Â\0'),(127,')…\0\0\0‡\0'),(127,'*…\0\0\0·\0'),(128,'.»\0\0\0Â\0'),(128,'/…\0\0\0‡\0'),(128,'0…\0\0\0·\0'),(129,'3»\0\0\0Â\0'),(129,'5…\0\0\0‡\0'),(129,'6…\0\0\0·\0'),(130,'9»\0\0\0Â\0'),(130,';…\0\0\0‡\0'),(130,'<…\0\0\0·\0'),(131,'B–\0\0\0‡\0'),(131,'C–\0\0\0·\0'),(131,'E—\0\0\0‚\0'),(132,'Bÿ\0\0\0‡\0'),(132,'BŸ\0\0\0⁄\0'),(132,'B⁄\0\0\0€\0'),(132,'Cÿ\0\0\0·\0'),(132,'F⁄\0\0\0‚\0'),(133,'C‚\0\0\0‡\0'),(133,'D‚\0\0\0·\0'),(133,'E‰\0\0\0‚\0'),(134,'CÍ\0\0\0‡\0'),(134,'DÍ\0\0\0·\0'),(134,'FÏ\0\0\0‚\0'),(135,'>˙\0\0\0‡\0'),(135,'?˙\0\0\0·\0'),(135,'A¯\0\0\0‚\0'),(136,'=˛\0\0\0‡\0'),(136,'>˛\0\0\0·\0'),(136,'A\0\0\0\0‚\0'),(137,'B\0\0\0⁄\0'),(137,'G\0\0\0‚\0'),(137,'B\0\0\0€\0'),(138,'B\0\0\0⁄\0'),(138,'G\0\0\0‚\0'),(138,'B\0\0\0€\0'),(139,'=*\0\0\0⁄\0'),(139,'=+\0\0\0€\0'),(139,'C)\0\0\0‚\0'),(140,'<5\0\0\0⁄\0'),(140,'<6\0\0\0€\0'),(140,'@5\0\0\0‚\0'),(141,'39\0\0\0⁄\0'),(141,'3:\0\0\0€\0'),(141,'0<\0\0\0Â\0'),(142,'$9\0\0\0⁄\0'),(142,'$:\0\0\0€\0'),(142,'&;\0\0\0Â\0'),(143,';\0\0\0Â\0'),(143,'9\0\0\0⁄\0'),(143,':\0\0\0€\0'),(144,'.\0\0\0‚\0'),(144,'/\0\0\0⁄\0'),(144,'0\0\0\0€\0'),(145,')\0\0\0‚\0'),(145,')\0\0\0⁄\0'),(145,'*\0\0\0€\0'),(146,' \0\0\0‚\0'),(146,'$\0\0\0⁄\0'),(146,'$\Z\0\0\0€\0'),(147,'+\0\0\0‡\0'),(147,',\0\0\0·\0'),(147,'&\r\0\0\0‚\0'),(148,'\'\0\0\0‚\0'),(148,'*\0\0\0‡\0'),(148,'+\0\0\0·\0'),(149,'&˛\0\0\0‚\0'),(149,'*˝\0\0\0‡\0'),(149,'+˝\0\0\0·\0'),(150,'&˙\0\0\0‚\0'),(150,'*˚\0\0\0‡\0'),(150,'+˚\0\0\0·\0'),(151,'%\0\0\0‚\0'),(151,'*Ú\0\0\0⁄\0'),(151,'*Û\0\0\0€\0'),(152,'\'Ê\0\0\0‚\0'),(152,'*Á\0\0\0⁄\0'),(152,'*Ë\0\0\0€\0'),(153,'&‡\0\0\0‚\0'),(153,'*‡\0\0\0⁄\0'),(153,'*·\0\0\0€\0'),(154,'%⁄\0\0\0‚\0'),(154,'+⁄\0\0\0⁄\0'),(154,'+€\0\0\0€\0'),(155,'&”\0\0\0‚\0'),(155,'*”\0\0\0⁄\0'),(155,'*‘\0\0\0€\0'),(156,'2œ\0\0\0Â\0'),(156,'5—\0\0\0⁄\0'),(156,'5“\0\0\0€\0'),(157,':’\0\0\0⁄\0'),(157,':÷\0\0\0€\0'),(157,'?◊\0\0\0‚\0'),(158,'9ﬁ\0\0\0⁄\0'),(158,'9ﬂ\0\0\0€\0'),(158,'>‡\0\0\0‚\0'),(159,'8È\0\0\0⁄\0'),(159,'8Í\0\0\0€\0'),(159,'?È\0\0\0‚\0'),(160,'9\0\0\0⁄\0'),(160,'9Ò\0\0\0€\0'),(160,'@\0\0\0‚\0'),(161,'8ˆ\0\0\0‡\0'),(161,'8˜\0\0\0⁄\0'),(161,'9ˆ\0\0\0·\0'),(161,'8¯\0\0\0€\0'),(161,'?¯\0\0\0‚\0'),(162,'9˛\0\0\0⁄\0'),(162,'9ˇ\0\0\0€\0'),(162,'>\0\0\0\0‚\0'),(163,';	\0\0\0⁄\0'),(163,';\n\0\0\0€\0'),(163,'?	\0\0\0‚\0'),(164,';\0\0\0‡\0'),(164,'<\0\0\0·\0'),(164,'?\r\0\0\0‚\0'),(165,'8\0\0\0‚\0'),(165,'4 \0\0\0‡\0'),(165,'5 \0\0\0·\0'),(166,'/\0\0\0⁄\0'),(166,'3\0\0\0Â\0'),(166,'0\0\0\0€\0'),(167,'\'\0\0\0‚\0'),(167,'%\0\0\0⁄\0'),(167,'&\0\0\0€\0'),(168,'“\0\0\0⁄\0'),(168,'“	\0\0\0€\0'),(168,'”\0\0\0⁄\0'),(168,'”	\0\0\0€\0'),(168,'ÿ	\0\0\0\0'),(169,'—\0\0\0‡\0'),(169,'—\0\0\0‡\0'),(169,'“\0\0\0·\0'),(169,'“\0\0\0·\0'),(169,'ÿ\0\0\0\0'),(170,'“˚\0\0\0⁄\0'),(170,'‘˚\0\0\0⁄\0'),(170,'“¸\0\0\0€\0'),(170,'‘¸\0\0\0€\0'),(170,'◊˛\0\0\0\0'),(171,'”ˆ\0\0\0⁄\0'),(171,'”˜\0\0\0€\0'),(171,'‘ˆ\0\0\0⁄\0'),(171,'‘˜\0\0\0€\0'),(171,'◊¯\0\0\0\0'),(172,'€ˆ\0\0\0‡\0'),(172,'‹ˆ\0\0\0·\0'),(172,'ﬁˆ\0\0\0⁄\0'),(172,'ﬁ˜\0\0\0€\0'),(172,'›˚\0\0\0\0'),(173,'·ˆ\0\0\0⁄\0'),(173,'·˜\0\0\0€\0'),(173,'„ˆ\0\0\0⁄\0'),(173,'„˜\0\0\0€\0'),(173,'‚˚\0\0\0\0'),(174,'È¸\0\0\0‡\0'),(174,'Í¸\0\0\0·\0'),(174,'Í\0\0\0\0'),(175,'—	\0\0\0‡\0'),(175,'“	\0\0\0·\0'),(175,'ÿ	\0\0\0\0'),(176,'—\0\0\0⁄\0'),(176,'—\0\0\0€\0'),(176,'ÿ\0\0\0\0'),(177,'€ˆ\0\0\0⁄\0'),(177,'€˜\0\0\0€\0'),(177,'ﬁˆ\0\0\0⁄\0'),(177,'ﬁ˜\0\0\0€\0'),(177,'ﬂ˚\0\0\0\0'),(177,'·ˆ\0\0\0⁄\0'),(177,'·˜\0\0\0€\0'),(177,'‰ˆ\0\0\0⁄\0'),(177,'‰˜\0\0\0€\0'),(178,'È¸\0\0\0⁄\0'),(178,'È˝\0\0\0€\0'),(178,'Ï¸\0\0\0‡\0'),(178,'Ì¸\0\0\0·\0'),(178,'Î\0\0\0\0'),(179,'—Ó\0\0\0⁄\0'),(179,'—Ô\0\0\0€\0'),(179,'‘Ó\0\0\0⁄\0'),(179,'‘Ô\0\0\0€\0'),(179,'‘Ú\0\0\0\0'),(180,'ﬁÔ\0\0\0⁄\0'),(180,'€Ú\0\0\0\0'),(180,'ﬁ\0\0\0€\0'),(181,'‡Ô\0\0\0⁄\0'),(181,'‡\0\0\0€\0'),(181,'„Ú\0\0\0\0'),(182,'€Î\0\0\0\0'),(182,'ﬁÏ\0\0\0⁄\0'),(182,'ﬁÌ\0\0\0€\0'),(183,'‡Ï\0\0\0⁄\0'),(183,'‡Ì\0\0\0€\0'),(183,'ÂÌ\0\0\0\0'),(184,'ËÏ\0\0\0\0'),(184,'ÈÓ\0\0\0‡\0'),(184,'ÍÓ\0\0\0·\0'),(185,'- \0\0\0π\0'),(185,'0«\0\0\0ﬁ\0'),(185,'0»\0\0\0ﬂ\0'),(185,'1 \0\0\0π\0'),(186,'ÈÛ\0\0\0‡\0'),(186,'ÍÛ\0\0\0·\0'),(186,'Í¯\0\0\0\0'),(187,'ÓÚ\0\0\0‡\0'),(187,'ÔÚ\0\0\0·\0'),(187,'Ô¯\0\0\0\0'),(188,'ˆÚ\0\0\0⁄\0'),(188,'ˆÛ\0\0\0€\0'),(188,'˜Ú\0\0\0⁄\0'),(188,'˜Û\0\0\0€\0'),(188,'˙Ù\0\0\0‡\0'),(188,'˙ı\0\0\0‡\0'),(188,'˚Ù\0\0\0·\0'),(188,'˚ı\0\0\0·\0'),(188,'ˆ¯\0\0\0\0'),(189,'–Ó\0\0\0⁄\0'),(189,'–Ô\0\0\0€\0'),(189,'“Ì\0\0\0\0'),(189,'’Ó\0\0\0⁄\0'),(189,'’Ô\0\0\0€\0'),(190,'‹Î\0\0\0\0'),(190,'⁄Ò\0\0\0‡\0'),(190,'€Ò\0\0\0·\0'),(190,'›\0\0\0⁄\0'),(190,'›Ò\0\0\0€\0'),(191,'‡Î\0\0\0\0'),(191,'„Ï\0\0\0‡\0'),(191,'‰Ï\0\0\0·\0'),(191,'ﬂ\0\0\0⁄\0'),(191,'ﬂÒ\0\0\0€\0'),(191,'‰\0\0\0⁄\0'),(191,'‰Ò\0\0\0€\0'),(192,'˜Ú\0\0\0\0'),(192,'ıı\0\0\0‡\0'),(192,'ı˜\0\0\0‡\0'),(192,'ˆı\0\0\0·\0'),(192,'ˆ˜\0\0\0·\0'),(192,'˚ˆ\0\0\0⁄\0'),(192,'˚˜\0\0\0€\0'),(193,'»ˆ\0\0\0‡\0'),(193,'»˜\0\0\0‡\0'),(193,'…ˆ\0\0\0·\0'),(193,'…˜\0\0\0·\0'),(193,'Õ¯\0\0\0\0'),(194,'»\0\0\0\0‡\0'),(194,'»\0\0\0‡\0'),(194,'…\0\0\0\0·\0'),(194,'…\0\0\0·\0'),(194,'Õ\0\0\0\0'),(195,'≈Ç\0\0\0ﬁ\0'),(195,'≈É\0\0\0ﬂ\0'),(195,' Å\0\0\0œ\r\0'),(195,'≈Ñ\0\0\0ﬁ\0'),(195,'≈Ö\0\0\0ﬂ\0'),(196,'…\0\0\0⁄\0'),(196,'…\0\0\0€\0'),(196,'Õ\r\0\0\0\0'),(197,' \0\0\0⁄\0'),(197,' \0\0\0€\0'),(197,'Õ\0\0\0\0'),(198,'«ˆ\0\0\0\0'),(198,'Ãı\0\0\0⁄\0'),(198,'Ãˆ\0\0\0€\0'),(198,'»˘\0\0\0‡\0'),(198,'…˘\0\0\0·\0'),(199,'«ˇ\0\0\0\0'),(199,'Ã˛\0\0\0⁄\0'),(199,'Ãˇ\0\0\0€\0'),(199,'»\0\0\0‡\0'),(199,'»\0\0\0‡\0'),(199,'…\0\0\0·\0'),(199,'…\0\0\0·\0'),(200,'»\0\0\0\0'),(200,'…\0\0\0‡\0'),(200,' \0\0\0·\0'),(201,'Í\0\0\0\0'),(201,'Ë\0\0\0T‡\r\0\0\0e‡\0e‡\0e‡\0e‡\0¨	\0Á{\0e‡\0e‡\0)\0)\0c‡\0á§\0â§\0\0'),(201,'Ë\0\0\0‡\0'),(201,'Ë\0\0\0ƒd\0'),(201,'È\0\0\0`‡\0\0\0ê£\0ê£\0`∞\0^∞\0\0'),(201,'È\0\0\0·\0'),(201,'È\0\0\0≠\"\0'),(201,'Í\0\0\0&,\0'),(201,'Í\0\0\0≠\"\0å‡\0'),(201,'Î\0\0\0&,\0'),(201,'Î\0\0\0&,\0'),(201,'Î\0\0\0¢	\0'),(201,'Ï\0\0\0`‡\0\0\0T‡\0\0\0\0\0\0'),(201,'Ï\0\0\0&,\0'),(201,'Ï\0\0\0&,\0'),(201,'Ï\0\0\0¢	\0'),(201,'Ë\0\0\0‡\0'),(201,'Ë\0\0\0‡\0'),(201,'È\0\0\0·\0'),(201,'È\0\0\0•	\0'),(201,'È\0\0\0·\0'),(201,'Í\0\0\02\0'),(201,'Í\0\0\0ì\0'),(201,'Î\0\0\02\0'),(201,'Î\0\0\0Õ&\0'),(201,'Ï\0\0\02\0'),(201,'Ï\0\0\02\0'),(202,'Ú\0\0\0\0'),(202,'Ò\0\0\0⁄\0'),(202,'Ò\0\0\0€\0'),(202,'Ù\0\0\0⁄\0'),(202,'Ù\0\0\0€\0'),(203,'Û\0\0\0\0'),(203,'Ú	\0\0\0‡\0'),(203,'Ú\0\0\0‡\0'),(203,'Û	\0\0\0·\0'),(203,'Û\0\0\0·\0'),(204,'¯\0\0\0\0'),(204,'˜\0\0\0‡\0'),(204,'˜\0\0\0‡\0'),(204,'¯\0\0\0·\0'),(204,'¯\0\0\0·\0'),(205,'Ì¸\0\0\0‡\0'),(205,'Ì˛\0\0\0‡\0'),(205,'Ó¸\0\0\0·\0'),(205,'Ó˛\0\0\0·\0'),(205,'Ó\0\0\0\0'),(206,'Ú¸\0\0\0‡\0'),(206,'Ú˛\0\0\0‡\0'),(206,'Û¸\0\0\0·\0'),(206,'Û˛\0\0\0·\0'),(206,'Û\0\0\0\0'),(207,'˚˚\0\0\0⁄\0'),(207,'˝˚\0\0\0⁄\0'),(207,'¯˛\0\0\0\0'),(207,'˚¸\0\0\0€\0'),(207,'˝¸\0\0\0€\0'),(208,'—\0\0\0⁄\0'),(208,'—\0\0\0€\0'),(208,'”\0\0\0⁄\0'),(208,'”\0\0\0€\0'),(208,'◊\0\0\0⁄\0'),(208,'◊\0\0\0€\0'),(208,'’\0\0\0\0'),(209,'‹\0\0\0⁄\0'),(209,'‹\0\0\0€\0'),(209,'ﬁ\0\0\0\0'),(210,'·\0\0\0\0'),(210,'„\0\0\0⁄\0'),(210,'„\0\0\0€\0'),(211,'È\0\0\0⁄\0'),(211,'È\0\0\0€\0'),(211,'Î\0\0\0⁄\0'),(211,'Î\0\0\0€\0'),(211,'Í\0\0\0\0'),(212,'Ú\0\0\0⁄\0'),(212,'Ú\0\0\0€\0'),(212,'Ù\0\0\0\0'),(213,'˙\0\0\0⁄\0'),(213,'˙\0\0\0€\0'),(213,'˘\0\0\0\0'),(214,'Ô¸\0\0\0⁄\0'),(214,'Ô˝\0\0\0€\0'),(214,'Ù¸\0\0\0⁄\0'),(214,'Ù˝\0\0\0€\0'),(214,'Ó\0\0\0\0'),(214,'Û\0\0\0‡\0'),(214,'Ù\0\0\0·\0'),(215,'˘˚\0\0\0⁄\0'),(215,'˚˚\0\0\0⁄\0'),(215,'˘¸\0\0\0€\0'),(215,'˚¸\0\0\0€\0'),(215,'˝\0\0\0\0\0'),(216,'¬w\0\0\0‹\0'),(216,'√w\0\0\0›\0'),(216,'≈w\0\0\0ﬁ\0'),(216,'≈x\0\0\0ﬂ\0'),(216,'∆|\0\0\0ÿ\r\0'),(217,'…t\0\0\0ﬁ\0'),(217,'…u\0\0\0ﬂ\0'),(217,'Ãt\0\0\0ﬁ\0'),(217,'Ãu\0\0\0ﬂ\0'),(217,'Ày\0\0\0œ\r\0'),(218,'–u\0\0\0ﬁ\0'),(218,'–v\0\0\0ﬂ\0'),(218,'“y\0\0\0œ\r\0'),(219,'–\0\0\0œ\r\0'),(219,'“Ç\0\0\0ﬁ\0'),(219,'“É\0\0\0ﬂ\0'),(220,'q‹\0\0\0˛\0'),(220,'qﬁ\0\0\0œ\r\0'),(220,'r‹\0\0\0ˇ\0'),(221,'x‹\0\0\0˛\0'),(221,'xﬁ\0\0\0œ\r\0'),(221,'y‹\0\0\0ˇ\0'),(222,'r„\0\0\0˛\0'),(222,'s„\0\0\0ˇ\0'),(222,'t‰\0\0\0ÿ\r\0'),(223,'~‚\0\0\0ÿ\r\0'),(223,'Ç·\0\0\0¸\0'),(223,'Ç‚\0\0\0˝\0'),(224,'sÍ\0\0\0˛\0'),(224,'tÍ\0\0\0ˇ\0'),(224,'tÌ\0\0\0œ\r\0'),(225,'xÍ\0\0\0¸\0'),(225,'xÎ\0\0\0˝\0'),(225,'|Ï\0\0\0ÿ\r\0'),(226,'ÄÍ\0\0\0ÿ\r\0'),(226,'ÉË\0\0\0˛\0'),(226,'ÑË\0\0\0ˇ\0'),(227,'âÁ\0\0\0¸\0'),(227,'âË\0\0\0˝\0'),(227,'ãÈ\0\0\0œ\r\0'),(228,'sÚ\0\0\0˛\0'),(228,'tÚ\0\0\0ˇ\0'),(228,'uı\0\0\0œ\r\0'),(229,'xÛ\0\0\0¸\0'),(229,'zÒ\0\0\0œ\r\0'),(229,'xÙ\0\0\0˝\0'),(230,'ÉÔ\0\0\0œ\r\0'),(230,'Ä\0\0\0¸\0'),(230,'ÄÒ\0\0\0˝\0'),(231,'ãÌ\0\0\0˛\0'),(231,'åÌ\0\0\0ˇ\0'),(231,'ã\0\0\0œ\r\0'),(232,'ìÓ\0\0\0¸\0'),(232,'ìÔ\0\0\0˝\0'),(232,'ëÒ\0\0\0ÿ\r\0'),(233,'v˙\0\0\0¸\0'),(233,'v˚\0\0\0˝\0'),(233,'x˘\0\0\0œ\r\0'),(234,'}ˇ\0\0\0œ\r\0'),(234,'}\0\0\0˛\0'),(234,'~\0\0\0ˇ\0'),(235,'ëı\0\0\0œ\r\0'),(235,'ìˆ\0\0\0¸\0'),(235,'ì˜\0\0\0˝\0'),(236,'é˛\0\0\0ÿ\r\0'),(236,'ë˛\0\0\0˛\0'),(236,'í˛\0\0\0ˇ\0'),(237,'à˛\0\0\0¸\0'),(237,'àˇ\0\0\0˝\0'),(237,'á\0\0\0œ\r\0'),(238,'è\0\0\0œ\r\0'),(238,'í\0\0\0¸\0'),(238,'í\0\0\0˝\0'),(239,'É\0\0\0¸\0'),(239,'É\0\0\0˝\0'),(239,'à	\0\0\0ÿ\r\0'),(240,'è\n\0\0\0œ\r\0'),(240,'è\r\0\0\0˛\0'),(240,'ê\r\0\0\0ˇ\0'),(241,'ô\0\0\0œ\r\0'),(241,'ú\0\0\0¸\0'),(241,'ú\0\0\0˝\0'),(242,'ñ\0\0\0¸\0'),(242,'ñ\0\0\0˝\0'),(242,'ô\r\0\0\0œ\r\0'),(243,'°\0\0\0˛\0'),(243,'¢\0\0\0ˇ\0'),(243,'ü\0\0\0ÿ\r\0'),(244,'âã\0\0\0œ\r\0'),(244,'áå\0\0\0‹\0'),(244,'áé\0\0\0‹\0'),(244,'àå\0\0\0›\0'),(244,'àé\0\0\0›\0'),(245,'®°\0\0\0|\0'),(245,'©°\0\0\0}\0'),(245,'®•\0\0\0|\0'),(245,'©•\0\0\0}\0'),(245,'≠§\0\0\0é\0'),(246,'è\0Ä\0\0\0‹\0'),(246,'ê\0Ä\0\0\0›\0'),(246,'ï\0É\0\0\0⁄\0'),(247,'è\0á\0\0\0ﬁ\0'),(247,'è\0à\0\0\0ﬂ\0'),(247,'è\0å\0\0\0ﬁ\0'),(247,'è\0ç\0\0\0ﬂ\0'),(247,'ï\0ã\0\0\0⁄\0'),(248,'è\0è\0\0\0ﬁ\0'),(248,'ë\0è\0\0\0ﬁ\0'),(248,'è\0ê\0\0\0ﬂ\0'),(248,'ë\0ê\0\0\0ﬂ\0'),(248,'ï\0ë\0\0\0⁄\0'),(249,'è\0ñ\0\0\0ﬁ\0'),(249,'è\0ó\0\0\0ﬂ\0'),(249,'è\0ö\0\0\0ﬁ\0'),(249,'è\0õ\0\0\0ﬂ\0'),(249,'ï\0ö\0\0\0⁄\0'),(250,'è\0†\0\0\0ﬁ\0'),(250,'è\0°\0\0\0ﬂ\0'),(250,'è\0£\0\0\0ﬁ\0'),(250,'è\0§\0\0\0ﬂ\0'),(250,'ï\0¢\0\0\0⁄\0'),(251,'è\0¶\0\0\0ﬁ\0'),(251,'è\0ß\0\0\0ﬂ\0'),(251,'è\0®\0\0\0ﬁ\0'),(251,'è\0©\0\0\0ﬂ\0'),(251,'ï\0®\0\0\0⁄\0'),(252,'ü\0¶\0\0\0ﬁ\0'),(252,'ü\0ß\0\0\0ﬂ\0'),(252,'õ\0®\0\0\0⁄\0'),(252,'†\0¶\0\0\0‹\0'),(252,'°\0¶\0\0\0›\0'),(253,'†\0û\0\0\0‹\0'),(253,'°\0û\0\0\0›\0'),(253,'õ\0°\0\0\0⁄\0'),(254,'õ\0ô\0\0\0⁄\0'),(254,'†\0ñ\0\0\0‹\0'),(254,'°\0ñ\0\0\0›\0'),(254,'†\0ò\0\0\0‹\0'),(254,'°\0ò\0\0\0›\0'),(255,'ü\0è\0\0\0ﬁ\0'),(255,'°\0è\0\0\0ﬁ\0'),(255,'õ\0ë\0\0\0⁄\0'),(255,'ü\0ê\0\0\0ﬂ\0'),(255,'°\0ê\0\0\0ﬂ\0'),(256,'ú\0á\0\0\0‹\0'),(256,'ù\0á\0\0\0›\0'),(256,'õ\0ä\0\0\0⁄\0'),(256,'ú\0ç\0\0\0‹\0'),(256,'ù\0ç\0\0\0›\0'),(257,'õ\0É\0\0\0⁄\0'),(257,'ú\0Ä\0\0\0‹\0'),(257,'ù\0Ä\0\0\0›\0'),(258,'KÉ\0\0\0‹\0'),(258,'LÉ\0\0\0›\0'),(258,'JÖ\0\0\0ÿ\r\0'),(258,'NÑ\0\0\0ÿ\r\0'),(259,'CÇ\0\0\0–\r\0'),(259,'EÉ\0\0\0ﬁ\0'),(259,'CÜ\0\0\0–\r\0'),(259,'EÑ\0\0\0ﬂ\0'),(260,':Å\0\0\0–\r\0'),(260,'<Ç\0\0\0ﬁ\0'),(260,'<É\0\0\0ﬂ\0'),(260,'=Ñ\0\0\0ÿ\r\0'),(261,'8t\0\0\0ﬁ\0'),(261,'8u\0\0\0ﬂ\0'),(261,'=v\0\0\0ÿ\r\0'),(261,':x\0\0\0–\r\0'),(262,'5n\0\0\0ﬁ\0'),(262,'5o\0\0\0ﬂ\0'),(262,'7l\0\0\0–\r\0'),(262,'8p\0\0\0–\r\0'),(263,'@l\0\0\0–\r\0'),(263,'Bn\0\0\0ﬁ\0'),(263,'Bo\0\0\0ﬂ\0'),(263,'Ap\0\0\0–\r\0'),(264,'Kk\0\0\0–\r\0'),(264,'Il\0\0\0ﬁ\0'),(264,'Im\0\0\0ﬂ\0'),(264,'Kp\0\0\0–\r\0'),(265,'Ui\0\0\0–\r\0'),(265,'Rl\0\0\0ﬁ\0'),(265,'Rm\0\0\0ﬂ\0'),(265,'Vn\0\0\0–\r\0'),(266,'ci\0\0\0–\r\0'),(266,'ej\0\0\0‹\0'),(266,'fj\0\0\0›\0'),(266,'dn\0\0\0–\r\0'),(267,'az\0\0\0ÿ\r\0'),(267,'ey\0\0\0‹\0'),(267,'fy\0\0\0›\0'),(267,'c|\0\0\0–\r\0'),(268,'Rz\0\0\0ﬁ\0'),(268,'R{\0\0\0ﬂ\0'),(268,'Wx\0\0\0–\r\0'),(268,'W|\0\0\0–\r\0'),(269,'Fw\0\0\0ﬁ\0'),(269,'Hv\0\0\0–\r\0'),(269,'Fx\0\0\0ﬂ\0'),(269,'H|\0\0\0–\r\0'),(270,'*Z\0\0\0É\0'),(270,'*[\0\0\0Ñ\0'),(270,'&]\0\0\0Ü\0'),(270,'*]\0\0\0Ü\0'),(270,'(^\0\0\0Â\0'),(271,'.c\0\0\0Ü\0'),(271,'/d\0\0\0Â\0'),(271,'0b\0\0\0Ü\0'),(272,'6f\0\0\0Ü\0'),(272,'5i\0\0\0É\0'),(272,'5j\0\0\0Ñ\0'),(272,'7k\0\0\0Â\0'),(273,'Gf\0\0\0É\0'),(273,'Gg\0\0\0Ñ\0'),(273,'If\0\0\0É\0'),(273,'Ig\0\0\0Ñ\0'),(273,'Gk\0\0\0Â\0'),(275,'ND\0\0\0Ü\0'),(275,'OF\0\0\0‚\0'),(276,'E?\0\0\0Â\0'),(276,'EB\0\0\0É\0'),(276,'EC\0\0\0Ñ\0'),(276,'GB\0\0\0É\0'),(276,'GC\0\0\0Ñ\0'),(276,'GB\0\0\0É\0'),(276,'GC\0\0\0Ñ\0'),(277,'7@\0\0\0É\0'),(277,'7A\0\0\0Ñ\0'),(277,'9@\0\0\0É\0'),(277,'<A\0\0\0‚\0'),(278,',S\0\0\0É\0'),(278,'/P\0\0\0Â\0'),(278,',T\0\0\0Ñ\0'),(278,'0S\0\0\0É\0'),(278,'0T\0\0\0Ñ\0'),(279,',J\0\0\0É\0'),(279,',K\0\0\0Ñ\0'),(279,'/M\0\0\0Â\0'),(279,'0J\0\0\0É\0'),(279,'0K\0\0\0Ñ\0'),(280,'&S\0\0\0É\0'),(280,'(P\0\0\0Â\0'),(280,'*S\0\0\0É\0'),(280,'&T\0\0\0Ñ\0'),(280,'*T\0\0\0Ñ\0'),(281,'&J\0\0\0É\0'),(281,'&K\0\0\0Ñ\0'),(281,'*J\0\0\0É\0'),(281,'*K\0\0\0Ñ\0'),(281,')M\0\0\0Â\0'),(282,'S\0\0\0É\0'),(282,'T\0\0\0Ñ\0'),(282,'!P\0\0\0Â\0'),(282,'$S\0\0\0É\0'),(282,'$T\0\0\0Ñ\0'),(283,'J\0\0\0É\0'),(283,'K\0\0\0Ñ\0'),(283,'$J\0\0\0É\0'),(283,'$K\0\0\0Ñ\0'),(283,'\"M\0\0\0Â\0'),(284,'S\0\0\0É\0'),(284,'P\0\0\0Â\0'),(284,'S\0\0\0É\0'),(284,'T\0\0\0Ñ\0'),(284,'T\0\0\0Ñ\0'),(285,'J\0\0\0É\0'),(285,'K\0\0\0Ñ\0'),(285,'J\0\0\0É\0'),(285,'K\0\0\0Ñ\0'),(285,'M\0\0\0Â\0'),(286,'J\0\0\0Ü\0'),(286,'O\0\0\0Ü\0'),(286,'O\0\0\0‚\0'),(286,'T\0\0\0Ü\0'),(287,';E\0\0\0É\0'),(287,';F\0\0\0Ñ\0'),(287,'>E\0\0\0É\0'),(287,'>F\0\0\0Ñ\0'),(287,'<K\0\0\0Â\0'),(288,'<N\0\0\0Â\0'),(288,';Q\0\0\0Ü\0'),(288,';S\0\0\0Ü\0'),(289,'d\0\0\0º\0'),(289,'f\0\0\0⁄\0'),(289,'f\0\0\0€\0'),(289,'e\0\0\0º\0'),(290,'k\0\0\0⁄\0'),(290,'m\0\0\0º\0'),(290,'k\0\0\0€\0'),(290,'m\0\0\0º\0'),(291,'l\0\0\0‡\0'),(291,'m\0\0\0·\0'),(291,'n\Z\0\0\0º\0'),(291,'n\0\0\0º\0'),(292,'f\0\0\0º\0'),(292,'e\0\0\0º\0'),(292,'f\0\0\0‡\0'),(292,'g\0\0\0·\0'),(294,'Ûó\0\0\0⁄\0'),(294,'Ûò\0\0\0€\0'),(294,'˜ô\0\0\0i\0'),(295,'Ûû\0\0\0⁄\0'),(295,'Ûü\0\0\0€\0'),(295,'˜†\0\0\0i\0'),(296,'Û•\0\0\0⁄\0'),(296,'Û¶\0\0\0€\0'),(296,'˜ß\0\0\0i\0'),(297,'ÛØ\0\0\0‡\0'),(297,'ÙØ\0\0\0·\0'),(297,'˜Æ\0\0\0i\0'),(298,'Û≥\0\0\0⁄\0'),(298,'Û¥\0\0\0€\0'),(298,'˜µ\0\0\0i\0'),(299,'Û∫\0\0\0‡\0'),(299,'Ù∫\0\0\0·\0'),(299,'ÛΩ\0\0\0‡\0'),(299,'ÙΩ\0\0\0·\0'),(299,'˜º\0\0\0i\0'),(300,'Û¡\0\0\0⁄\0'),(300,'Û¬\0\0\0€\0'),(300,'˜√\0\0\0i\0'),(301,'ˇï\0\0\0⁄\0'),(301,'ˇñ\0\0\0€\0'),(301,'ô\0\0\0l\0'),(302,'ó\0\0\0⁄\0'),(302,'ò\0\0\0€\0'),(302,'õ\0\0\0l\0'),(303,'ó\0\0\0⁄\0'),(303,'ò\0\0\0€\0'),(303,'õ\0\0\0l\0'),(304,'ó\0\0\0‡\0'),(304,'ó\0\0\0·\0'),(304,'õ\0\0\0l\0'),(305,'#ó\0\0\0⁄\0'),(305,'#ò\0\0\0€\0'),(305,'%õ\0\0\0l\0'),(306,'*ó\0\0\0‡\0'),(306,'+ó\0\0\0·\0'),(306,',õ\0\0\0l\0'),(307,'.û\0\0\0i\0'),(307,'2ú\0\0\0⁄\0'),(307,'2ù\0\0\0€\0'),(308,'ˇ•\0\0\0⁄\0'),(308,'ˇ¶\0\0\0€\0'),(308,'©\0\0\0l\0'),(309,'•\0\0\0⁄\0'),(309,'¶\0\0\0€\0'),(309,'©\0\0\0l\0'),(310,'\r•\0\0\0‡\0'),(310,'•\0\0\0·\0'),(310,'©\0\0\0l\0'),(311,'•\0\0\0⁄\0'),(311,'¶\0\0\0€\0'),(311,'©\0\0\0l\0'),(312,'•\0\0\0‡\0'),(312,'•\0\0\0·\0'),(312,'©\0\0\0l\0'),(313,'\"•\0\0\0⁄\0'),(313,'\"¶\0\0\0€\0'),(313,'%•\0\0\0⁄\0'),(313,'%¶\0\0\0€\0'),(313,'$©\0\0\0l\0'),(314,')•\0\0\0⁄\0'),(314,')¶\0\0\0€\0'),(314,'+©\0\0\0l\0'),(315,'-¨\0\0\0i\0'),(315,'1™\0\0\0⁄\0'),(315,'1´\0\0\0€\0'),(316,'+Æ\0\0\0l\0'),(316,')≤\0\0\0‡\0'),(316,'*≤\0\0\0·\0'),(317,'$Æ\0\0\0l\0'),(317,'\"≤\0\0\0‡\0'),(317,'#≤\0\0\0·\0'),(318,'Æ\0\0\0l\0'),(318,'Ø\0\0\0⁄\0'),(318,'∞\0\0\0€\0'),(319,'Æ\0\0\0l\0'),(319,'≤\0\0\0‡\0'),(319,'≤\0\0\0·\0'),(320,'Æ\0\0\0l\0'),(320,'\r≤\0\0\0‡\0'),(320,'≤\0\0\0·\0'),(321,'Æ\0\0\0l\0'),(321,'≤\0\0\0‡\0'),(321,'≤\0\0\0·\0'),(322,'ˇ≤\0\0\0‡\0'),(322,'Æ\0\0\0l\0'),(322,'\0≤\0\0\0·\0'),(323,'π\0\0\0⁄\0'),(323,'∫\0\0\0€\0'),(323,'Ω\0\0\0l\0'),(324,'	π\0\0\0⁄\0'),(324,'	∫\0\0\0€\0'),(324,'Ω\0\0\0l\0'),(325,'\rπ\0\0\0⁄\0'),(325,'\r∫\0\0\0€\0'),(325,'Ω\0\0\0l\0'),(326,'π\0\0\0⁄\0'),(326,'∫\0\0\0€\0'),(326,'Ω\0\0\0l\0'),(327,'π\0\0\0‡\0'),(327,'π\0\0\0·\0'),(327,'Ω\0\0\0l\0'),(328,'#π\0\0\0⁄\0'),(328,'#∫\0\0\0€\0'),(328,'&π\0\0\0⁄\0'),(328,'&∫\0\0\0€\0'),(328,'%Ω\0\0\0l\0'),(329,'*π\0\0\0⁄\0'),(329,'*∫\0\0\0€\0'),(329,'-π\0\0\0⁄\0'),(329,'-∫\0\0\0€\0'),(329,',Ω\0\0\0l\0'),(330,'/æ\0\0\0‡\0'),(330,'0æ\0\0\0·\0'),(330,'2æ\0\0\0⁄\0'),(330,'2ø\0\0\0€\0'),(330,'.¿\0\0\0i\0'),(331,',¬\0\0\0l\0'),(331,'*∆\0\0\0‡\0'),(331,'+∆\0\0\0·\0'),(332,'%¬\0\0\0l\0'),(332,'&ƒ\0\0\0⁄\0'),(332,'&≈\0\0\0€\0'),(333,'¬\0\0\0l\0'),(333,'∆\0\0\0‡\0'),(333,'∆\0\0\0·\0'),(334,'¬\0\0\0l\0'),(334,'ƒ\0\0\0⁄\0'),(334,'≈\0\0\0€\0'),(335,'¬\0\0\0l\0'),(335,'\r∆\0\0\0‡\0'),(335,'∆\0\0\0·\0'),(336,'¬\0\0\0l\0'),(336,'∆\0\0\0‡\0'),(336,'∆\0\0\0·\0'),(337,'¬\0\0\0l\0'),(337,'ƒ\0\0\0⁄\0'),(337,'≈\0\0\0€\0'),(338,'˝z\0\0\0i\0'),(338,'v\0\0\0⁄\0'),(338,'w\0\0\0€\0'),(338,'}\0\0\0‡\0'),(338,'}\0\0\0·\0'),(339,'ë‚\0\0\0l\0'),(339,'ì‰\0\0\0i\0'),(340,'ú⁄\0\0\0l\0'),(341,'™ﬁ\0\0\0l\0'),(341,'™·\0\0\0l\0'),(342,'•‘\0\0\0l\0'),(342,'¶ÿ\0\0\0l\0'),(343,'≠«\0\0\0l\0'),(343,'¨ \0\0\0l\0'),(344,'π°\0\0\0⁄\0'),(344,'π¢\0\0\0€\0'),(344,'∫¶\0\0\0l\0'),(345,'√†\0\0\0l\0'),(345,'√•\0\0\0‹\0'),(345,'ƒ•\0\0\0›\0'),(346,' °\0\0\0‹\0'),(346,'À°\0\0\0›\0'),(346,' ¶\0\0\0l\0'),(347,'“†\0\0\0l\0'),(347,'–•\0\0\0‡\0'),(347,'—•\0\0\0·\0'),(348,'‹°\0\0\0⁄\0'),(348,'‹¢\0\0\0€\0'),(348,'⁄¶\0\0\0l\0'),(349,'Â°\0\0\0‹\0'),(349,'Ê°\0\0\0›\0'),(349,'Ë¶\0\0\0l\0'),(350,'Ô†\0\0\0l\0'),(350,'§\0\0\0ﬁ\0'),(350,'•\0\0\0ﬂ\0'),(351,'˘°\0\0\0ﬁ\0'),(351,'˘¢\0\0\0ﬂ\0'),(351,'¯¶\0\0\0l\0'),(352,'˛•\0\0\0‡\0'),(352,'ˇ•\0\0\0·\0'),(352,'\0†\0\0\0l\0'),(353,'°\0\0\0⁄\0'),(353,'¢\0\0\0€\0'),(353,'¶\0\0\0l\0'),(354,'∑Ø\0\0\0i\0'),(354,'π∞\0\0\0ﬁ\0'),(354,'π±\0\0\0ﬂ\0'),(355,'æ´\0\0\0l\0'),(355,'Ω∞\0\0\0ﬁ\0'),(355,'Ω±\0\0\0ﬂ\0'),(356,'ƒØ\0\0\0i\0'),(356,'¬±\0\0\0‹\0'),(356,'√±\0\0\0›\0'),(357,'œØ\0\0\0i\0'),(357,'–¨\0\0\0‹\0'),(357,'—¨\0\0\0›\0'),(358,'÷´\0\0\0l\0'),(358,'÷∞\0\0\0ﬁ\0'),(358,'÷±\0\0\0ﬂ\0'),(359,'⁄¨\0\0\0ﬁ\0'),(359,'⁄≠\0\0\0ﬂ\0'),(359,'ﬁ≠\0\0\0i\0'),(359,'⁄∞\0\0\0‹\0'),(359,'€∞\0\0\0›\0'),(360,'„≠\0\0\0i\0'),(360,'Á¨\0\0\0ﬁ\0'),(360,'Á≠\0\0\0ﬂ\0'),(360,'Á∞\0\0\0ﬁ\0'),(360,'Á±\0\0\0ﬂ\0'),(361,'Î´\0\0\0l\0'),(361,'ÏÆ\0\0\0ﬁ\0'),(361,'ÏØ\0\0\0ﬂ\0'),(362,'ÚØ\0\0\0i\0'),(362,'±\0\0\0‹\0'),(362,'Ò±\0\0\0›\0'),(363,'˝Ø\0\0\0i\0'),(363,'˛±\0\0\0‹\0'),(363,'ˇ±\0\0\0›\0'),(364,'´\0\0\0l\0'),(364,'≠\0\0\0ﬁ\0'),(364,'Æ\0\0\0ﬂ\0'),(365,'\nØ\0\0\0i\0'),(365,'	±\0\0\0›\0'),(366,'∏µ\0\0\0ﬁ\0'),(366,'∏∂\0\0\0ﬂ\0'),(366,'ª∑\0\0\0l\0'),(367,'¬∂\0\0\0‹\0'),(367,'¬∑\0\0\0l\0'),(367,'√∂\0\0\0›\0'),(368,'–µ\0\0\0‹\0'),(368,'—µ\0\0\0›\0'),(368,'“∑\0\0\0l\0'),(369,'Óµ\0\0\0‹\0'),(369,'Ôµ\0\0\0›\0'),(369,'∑\0\0\0l\0'),(370,'\0∑\0\0\0l\0'),(370,'µ\0\0\0ﬁ\0'),(370,'∂\0\0\0ﬂ\0'),(371,'∑\0\0\0l\0'),(371,'	µ\0\0\0ﬁ\0'),(371,'	∂\0\0\0ﬂ\0'),(372,'ΩΩ\0\0\0l\0'),(372,'¿ƒ\0\0\0‡\0'),(372,'¡ƒ\0\0\0·\0'),(373,'Ω\0\0\0l\0'),(373,'\0√\0\0\0⁄\0'),(373,'\0ƒ\0\0\0€\0'),(374,'∏…\0\0\0⁄\0'),(374,'∏ \0\0\0€\0'),(374,'Ω–\0\0\0l\0'),(375,'œ\0\0\0‡\0'),(375,'	œ\0\0\0·\0'),(375,'–\0\0\0l\0'),(376,'„›\0\0\0û\0'),(376,'„‡\0\0\0û\0'),(377,'Îﬂ\0\0\0û\0'),(377,'Í‚\0\0\0û\0'),(378,'§™\0\0\0~\0'),(378,'§´\0\0\0\0'),(378,'®¨\0\0\0é\0'),(379,'∆o\0\0\0\0⁄\0'),(379,'√q\0\0\0\0ı\Z\0'),(379,'∆p\0\0\0\0€\0'),(380,'æs\0\0\0\0‡\0'),(380,'øs\0\0\0\0·\0'),(380,'¡q\0\0\0\0ı\Z\0'),(381,'∑f\0\0\0\0ı\Z\0'),(381,'∫e\0\0\0\0⁄\0'),(381,'∫f\0\0\0\0€\0'),(382,'Øh\0\0\0\0‡\0'),(382,'≤g\0\0\0\0ı\Z\0'),(382,'∞h\0\0\0\0·\0'),(383,'Øa\0\0\0\0‡\0'),(383,'∞a\0\0\0\0·\0'),(383,'≤c\0\0\0\0ı\Z\0'),(384,'Ø]\0\0\0\0‡\0'),(384,'Ø_\0\0\0\0‡\0'),(384,'∞]\0\0\0\0·\0'),(384,'∞_\0\0\0\0·\0'),(384,'¥`\0\0\0\0Ï\Z\0'),(385,'∂]\0\0\0\0⁄\0'),(385,'∂^\0\0\0\0€\0'),(385,'∏`\0\0\0\0Ï\Z\0'),(386,'øV\0\0\0\0⁄\0'),(386,'øW\0\0\0\0€\0'),(386,'¬Z\0\0\0\0ı\Z\0'),(387,'√T\0\0\0\0⁄\0'),(387,'√U\0\0\0\0€\0'),(387,'ƒX\0\0\0\0Ï\Z\0'),(388,'»W\0\0\0\0‡\0'),(388,'…W\0\0\0\0·\0'),(388,'∆Z\0\0\0\0ı\Z\0'),(389,'“U\0\0\0\0ı\Z\0'),(389,'’W\0\0\0\0‡\0'),(389,'÷T\0\0\0\0⁄\0'),(389,'÷U\0\0\0\0€\0'),(389,'÷W\0\0\0\0·\0'),(390,'ÂM\0\0\0\0⁄\0'),(390,'ÂN\0\0\0\0€\0'),(390,'ÈP\0\0\0\0z\0'),(391,'ÔR\0\0\0\0É\0'),(391,'ÚP\0\0\0\0⁄\0'),(391,'ÚQ\0\0\0\0€\0'),(392,'ÓT\0\0\0\0z\0'),(392,'ÒU\0\0\0\0⁄\0'),(392,'ÒV\0\0\0\0€\0'),(393,'œm\0\0\0\0‡\0'),(393,'–j\0\0\0\0Ï\Z\0'),(393,'–m\0\0\0\0·\0'),(394,'“o\0\0\0\0⁄\0'),(394,'Õp\0\0\0\0ı\Z\0'),(394,'“p\0\0\0\0€\0'),(395,'’n\0\0\0\0Û\Z\0'),(395,'‘q\0\0\0\0‡\0'),(395,'’q\0\0\0\0·\0'),(395,'◊q\0\0\0\0ı\Z\0'),(396,'–w\0\0\0\0‡\0'),(396,'—w\0\0\0\0·\0'),(396,'—w\0\0\0\0Ï\Z\0'),(397,'”z\0\0\0\0⁄\0'),(397,'”{\0\0\0\0€\0'),(397,'—z\0\0\0\0Ï\Z\0'),(398,'‘u\0\0\0\0⁄\0'),(398,'‘v\0\0\0\0€\0'),(398,'÷u\0\0\0\0⁄\0'),(398,'÷v\0\0\0\0€\0'),(398,'”y\0\0\0\0ı\Z\0'),(399,'‘{\0\0\0\0‡\0'),(399,'’{\0\0\0\0·\0'),(399,'Ÿz\0\0\0\0Ï\Z\0'),(400,'“\\\0\0\0\0‡\0'),(400,'”\\\0\0\0\0·\0'),(400,'”_\0\0\0\0Î\Z\0'),(400,'’\\\0\0\0\0⁄\0'),(400,'’]\0\0\0\0€\0'),(400,'÷_\0\0\0\0Î\Z\0'),(400,'“b\0\0\0\0‡\0'),(400,'”b\0\0\0\0·\0'),(400,'‘a\0\0\0\0ı\Z\0'),(400,'’c\0\0\0\0Ï\Z\0'),(400,'”e\0\0\0\0ı\Z\0'),(401,'“\\\0\0\0\0⁄\0'),(401,'“]\0\0\0\0€\0'),(401,'◊]\0\0\0\0ı\Z\0'),(402,'’U\0\0\0\0ı\Z\0'),(402,'÷W\0\0\0\0‡\0'),(402,'◊W\0\0\0\0·\0'),(403,'ﬁk\0\0\0\0ı\Z\0'),(403,'·j\0\0\0\0⁄\0'),(403,'·k\0\0\0\0€\0'),(404,'∂]\0\0\0\0⁄\0'),(404,'∂^\0\0\0\0€\0'),(404,'∏`\0\0\0\0Ï\Z\0'),(405,'Ø]\0\0\0\0‡\0'),(405,'Ø_\0\0\0\0‡\0'),(405,'∞]\0\0\0\0·\0'),(405,'∞_\0\0\0\0·\0'),(405,'¥`\0\0\0\0Ï\Z\0'),(406,'Øc\0\0\0\0Ô\Z\0'),(406,'±a\0\0\0\0⁄\0'),(406,'±b\0\0\0\0€\0'),(406,'≤e\0\0\0\0ı\Z\0'),(407,'æo\0\0\0\0⁄\0'),(407,'æp\0\0\0\0€\0'),(407,'¿n\0\0\0\0Ï\Z\0'),(407,'¿r\0\0\0\0Ï\Z\0'),(408,'√o\0\0\0\0⁄\0'),(408,'≈n\0\0\0\0Ï\Z\0'),(408,'√p\0\0\0\0€\0'),(408,'≈r\0\0\0\0Ï\Z\0'),(409,'ﬂj\0\0\0\0‡\0'),(409,'‡j\0\0\0\0·\0'),(409,'„i\0\0\0\0Ï\Z\0'),(409,'·l\0\0\0\0ı\Z\0'),(410,'Âh\0\0\0\0ı\Z\0'),(410,'Áj\0\0\0\0Ï\Z\0'),(410,'Ëk\0\0\0\0⁄\0'),(410,'Ël\0\0\0\0€\0'),(411,'¯K\0\0\0\0⁄\0'),(411,'ˆN\0\0\0\0Ï\Z\0'),(411,'¯L\0\0\0\0€\0'),(412,'˚S\0\0\0\0⁄\0'),(412,'˚T\0\0\0\0€\0'),(412,'˙T\0\0\0\0ı\Z\0'),(413,'¯K\0\0\0\0⁄\0'),(413,'ÙM\0\0\0\0ı\Z\0'),(413,'¯L\0\0\0\0€\0'),(414,'›J\0\0\0\0‡\0'),(414,'ﬁJ\0\0\0\0·\0'),(414,'‡M\0\0\0\0Î\Z\0'),(415,'ÆÆ\0\0\0|\0'),(415,'ØÆ\0\0\0}\0'),(415,'´∞\0\0\0é\0'),(416,'¨≥\0\0\0|\0'),(416,'≠≥\0\0\0}\0'),(416,'¨∂\0\0\0|\0'),(416,'≠∂\0\0\0}\0'),(416,'µ¥\0\0\0é\0'),(417,'®°\0\0\0~\0'),(417,'®¢\0\0\0\0'),(417,'≠¢\0\0\0é\0'),(417,'®•\0\0\0|\0'),(417,'©•\0\0\0}\0'),(418,'¨Æ\0\0\0|\0'),(418,'≠Æ\0\0\0}\0'),(418,'¨±\0\0\0|\0'),(418,'≠±\0\0\0}\0'),(418,'µ∞\0\0\0é\0'),(419,'¨≥\0\0\0|\0'),(419,'≠≥\0\0\0}\0'),(419,'Æ∑\0\0\0ê\0'),(420,'±≥\0\0\0|\0'),(420,'≤≥\0\0\0}\0'),(420,'≥∑\0\0\0ê\0'),(421,'±Æ\0\0\0|\0'),(421,'≤Æ\0\0\0}\0'),(421,'µ±\0\0\0é\0'),(422,'ªÆ\0\0\0~\0'),(422,'ªØ\0\0\0\0'),(422,'ΩÆ\0\0\0|\0'),(422,'æÆ\0\0\0}\0'),(422,'√∞\0\0\0é\0'),(423,'ª≥\0\0\0~\0'),(423,'ª¥\0\0\0\0'),(423,'Ω¥\0\0\0|\0'),(423,'æ¥\0\0\0}\0'),(423,'√≥\0\0\0é\0'),(424,'ªÆ\0\0\0~\0'),(424,'ªØ\0\0\0\0'),(424,'æÆ\0\0\0~\0'),(424,'æØ\0\0\0\0'),(424,'Ωµ\0\0\0ê\0'),(425,'¬Æ\0\0\0~\0'),(425,'¬Ø\0\0\0\0'),(425,'¡µ\0\0\0ê\0'),(426,'…Æ\0\0\0~\0'),(426,'…Ø\0\0\0\0'),(426,'À≠\0\0\0ê\0'),(427,'–Æ\0\0\0~\0'),(427,'–Ø\0\0\0\0'),(427,'—±\0\0\0é\0'),(428,'…≥\0\0\0|\0'),(428,' ≥\0\0\0}\0'),(428,'»µ\0\0\0é\0'),(429,'Œ≥\0\0\0|\0'),(429,'œ≥\0\0\0}\0'),(429,'—∂\0\0\0é\0'),(430,'…Æ\0\0\0|\0'),(430,' Æ\0\0\0}\0'),(430,'…±\0\0\0|\0'),(430,' ±\0\0\0}\0'),(430,'—∞\0\0\0é\0'),(431,'…≥\0\0\0|\0'),(431,' ≥\0\0\0}\0'),(431,'…∂\0\0\0|\0'),(431,' ∂\0\0\0}\0'),(431,'—µ\0\0\0é\0'),(432,'¿º\0\0\0|\0'),(432,'¡º\0\0\0}\0'),(432,'∆æ\0\0\0é\0'),(432,'¿¿\0\0\0|\0'),(432,'¡¿\0\0\0}\0'),(433,'¿º\0\0\0~\0'),(433,'¿Ω\0\0\0\0'),(433,'≈º\0\0\0~\0'),(433,'≈Ω\0\0\0\0'),(433,'∆¿\0\0\0é\0'),(434,'Ãø\0\0\0|\0'),(434,'Õø\0\0\0}\0'),(434,'Ã¬\0\0\0|\0'),(434,'Õ¬\0\0\0}\0'),(434,'‘¡\0\0\0é\0'),(435,'Ãƒ\0\0\0|\0'),(435,'Ã«\0\0\0|\0'),(435,'Õƒ\0\0\0}\0'),(435,'Õ«\0\0\0}\0'),(435,'‘∆\0\0\0é\0'),(436,'Ãø\0\0\0|\0'),(436,'Õø\0\0\0}\0'),(436,'Ã¬\0\0\0|\0'),(436,'Õ¬\0\0\0}\0'),(436,'‘¡\0\0\0é\0'),(437,'Ãƒ\0\0\0|\0'),(437,'Ã«\0\0\0|\0'),(437,'Õƒ\0\0\0}\0'),(437,'Õ«\0\0\0}\0'),(437,'‘∆\0\0\0é\0'),(438,'ÿ¥\0\0\0|\0'),(438,'Ÿ¥\0\0\0}\0'),(438,'›∑\0\0\0é\0'),(438,'ÿπ\0\0\0|\0'),(438,'Ÿπ\0\0\0}\0'),(439,'⁄ø\0\0\0~\0'),(439,'›ø\0\0\0~\0'),(439,'‡ø\0\0\0~\0'),(439,'⁄¿\0\0\0\0'),(439,'›¿\0\0\0\0'),(439,'ﬂ¬\0\0\0ë\0'),(439,'ﬁ»\0\0\0ê\0'),(439,'‡¿\0\0\0\0'),(440,'ÿ¥\0\0\0|\0'),(440,'Ÿ¥\0\0\0}\0'),(440,'ÿπ\0\0\0|\0'),(440,'Ÿπ\0\0\0}\0'),(440,'›∏\0\0\0é\0'),(441,'⁄ø\0\0\0|\0'),(441,'€ø\0\0\0}\0'),(441,'⁄¬\0\0\0|\0'),(441,'€¬\0\0\0}\0'),(441,'·¡\0\0\0é\0'),(442,'⁄ƒ\0\0\0|\0'),(442,'⁄«\0\0\0|\0'),(442,'€ƒ\0\0\0}\0'),(442,'€«\0\0\0}\0'),(442,'·∆\0\0\0é\0'),(443,'Êæ\0\0\0~\0'),(443,'Êø\0\0\0\0'),(443,'ËΩ\0\0\0ê\0'),(444,'Îæ\0\0\0~\0'),(444,'Îø\0\0\0\0'),(444,'ÌΩ\0\0\0ê\0'),(445,'Êæ\0\0\0~\0'),(445,'Êø\0\0\0\0'),(445,'È¬\0\0\0ê\0'),(446,'Îæ\0\0\0~\0'),(446,'Îø\0\0\0\0'),(446,'Ï¬\0\0\0ê\0'),(447,'È«\0\0\0|\0'),(447,'Í«\0\0\0}\0'),(447,'Ó»\0\0\0é\0'),(448,'Ù«\0\0\0~\0'),(448,'ˆ∆\0\0\0ê\0'),(448,'Ù»\0\0\0\0'),(448,'ÙÃ\0\0\0|\0'),(448,'ıÃ\0\0\0}\0'),(449,'˚∆\0\0\0ê\0'),(449,'˘…\0\0\0|\0'),(449,'˙…\0\0\0}\0'),(449,'˘Ã\0\0\0|\0'),(449,'˙Ã\0\0\0}\0'),(450,'Ù«\0\0\0~\0'),(450,'˜«\0\0\0~\0'),(450,'Ù»\0\0\0\0'),(450,'˜»\0\0\0\0'),(450,'ıÕ\0\0\0ê\0'),(451,'˘«\0\0\0|\0'),(451,'˙«\0\0\0}\0'),(451,'˝»\0\0\0é\0'),(451,'˘Ã\0\0\0|\0'),(451,'˙Ã\0\0\0}\0'),(452,'Û◊\0\0\0|\0'),(452,'Ù◊\0\0\0}\0'),(452,'ˆ÷\0\0\0ê\0'),(452,'Û€\0\0\0|\0'),(452,'Ù€\0\0\0}\0'),(453,'ˇ‘\0\0\0ê\0'),(453,'˝ÿ\0\0\0~\0'),(453,'˝Ÿ\0\0\0\0'),(454,'’\0\0\0~\0'),(454,'÷\0\0\0\0'),(454,'◊\0\0\0é\0'),(455,'˝’\0\0\0~\0'),(455,'˝÷\0\0\0\0'),(455,'˝ÿ\0\0\0~\0'),(455,'˝Ÿ\0\0\0\0'),(455,'◊\0\0\0è\0'),(455,'⁄\0\0\0ê\0'),(456,'¸ﬁ\0\0\0|\0'),(456,'˝ﬁ\0\0\0}\0'),(456,'ˇ‚\0\0\0ê\0'),(457,'·\0\0\0é\0'),(458,'BE\0\0\0É\0'),(458,'BF\0\0\0Ñ\0'),(458,'FE\0\0\0É\0'),(458,'FF\0\0\0Ñ\0'),(458,'EJ\0\0\0Â\0'),(459,'EO\0\0\0Â\0'),(459,'DS\0\0\0É\0'),(459,'GS\0\0\0É\0'),(459,'DT\0\0\0Ñ\0'),(459,'GT\0\0\0Ñ\0'),(460,'LK\0\0\0É\0'),(460,'HM\0\0\0‚\0'),(460,'LL\0\0\0Ñ\0'),(460,'LN\0\0\0Ü\0'),(461,'0Y\0\0\0Ü\0'),(461,'1]\0\0\0Â\0'),(462,'7\\\0\0\0É\0'),(462,'7]\0\0\0Ñ\0'),(462,'9`\0\0\0Â\0'),(463,'GW\0\0\0É\0'),(463,'GX\0\0\0Ñ\0'),(463,'J[\0\0\0Â\0'),(464,'JK\0\0\0Â\0'),(464,'FP\0\0\0É\0'),(464,'FQ\0\0\0Ñ\0'),(464,'IP\0\0\0É\0'),(464,'IQ\0\0\0Ñ\0'),(465,'=J\0\0\0É\0'),(465,'=K\0\0\0Ñ\0'),(465,'?J\0\0\0É\0'),(465,'?K\0\0\0Ñ\0'),(465,'AJ\0\0\0É\0'),(465,'AK\0\0\0Ñ\0'),(465,'CH\0\0\0‚\0'),(466,'3P\0\0\0É\0'),(466,'3Q\0\0\0Ñ\0'),(466,'6P\0\0\0É\0'),(466,'6Q\0\0\0Ñ\0'),(466,'9P\0\0\0É\0'),(466,'9Q\0\0\0Ñ\0'),(466,'7Y\0\0\0Â\0'),(467,'BO\0\0\0É\0'),(467,'EO\0\0\0É\0'),(467,'HO\0\0\0É\0'),(467,'BP\0\0\0Ñ\0'),(467,'EP\0\0\0Ñ\0'),(467,'HP\0\0\0Ñ\0'),(467,'FW\0\0\0Â\0'),(468,'NN\0\0\0É\0'),(468,'NO\0\0\0Ñ\0'),(468,'MP\0\0\0‚\0'),(468,'OS\0\0\0Ü\0'),(470,'Ÿz\0\0\0ﬁ\0'),(470,'Ÿ{\0\0\0ﬂ\0'),(470,'›{\0\0\0œ\0'),(471,'‹Ç\0\0\0ﬁ\0'),(471,'‹É\0\0\0ﬂ\0'),(471,'€Ö\0\0\0“\0'),(472,'·k\0\0\0‹\0'),(472,'‚k\0\0\0›\0'),(472,'Âj\0\0\0œ\0'),(473,'·p\0\0\0ﬁ\0'),(473,'·q\0\0\0ﬂ\0'),(473,'Âr\0\0\0œ\0'),(474,'Ê{\0\0\0œ\0'),(474,'‚|\0\0\0‹\0'),(474,'„|\0\0\0›\0'),(475,'ÂÇ\0\0\0ﬁ\0'),(475,'ÂÉ\0\0\0ﬂ\0'),(475,'‰Ö\0\0\0“\0'),(476,'·ç\0\0\0‹\0'),(476,'‚ç\0\0\0›\0'),(476,'Âå\0\0\0œ\0'),(477,'·ë\0\0\0ﬁ\0'),(477,'·í\0\0\0ﬂ\0'),(477,'Âì\0\0\0œ\0'),(478,'·õ\0\0\0‹\0'),(478,'‚õ\0\0\0›\0'),(478,'Âö\0\0\0œ\0'),(479,'`\0\0\0ﬁ\0'),(479,'a\0\0\0ﬂ\0'),(479,'d\0\0\0“\0'),(480,'π\0\0\0“\0'),(480,'\0Ω\0\0\0‹\0'),(480,'Ω\0\0\0›\0'),(481,'\nπ\0\0\0“\0'),(481,'º\0\0\0ﬁ\0'),(481,'Ω\0\0\0ﬂ\0'),(482,'π\0\0\0“\0'),(482,'∫\0\0\0ﬁ\0'),(482,'ª\0\0\0ﬂ\0'),(483,'Ï†\0\0\0ã\0'),(483,'Ï°\0\0\0å\0'),(483,'¢\0\0\0·\0'),(484,'Ï™\0\0\0ç\0'),(484,'Ì™\0\0\0é\0'),(484,'©\0\0\0·\0'),(485,'¯∞\0\0\0‰\0'),(485,'ˆ¥\0\0\0ç\0'),(485,'˜¥\0\0\0é\0'),(486,'¯b\0\0\0ã\0'),(486,'¯c\0\0\0å\0'),(486,'˚f\0\0\0‰\0'),(487,'k\0\0\0ç\0'),(487,'k\0\0\0é\0'),(487,'p\0\0\0ç\0'),(487,'p\0\0\0é\0'),(487,'q\0\0\0‰\0'),(488,'v\0\0\0ã\0'),(488,'w\0\0\0å\0'),(488,'x\0\0\0·\0'),(489,'z\0\0\0ã\0'),(489,'{\0\0\0å\0'),(489,'}\0\0\0‰\0'),(490,'Ö\0\0\0ç\0'),(490,'Ö\0\0\0é\0'),(490,'Ñ\0\0\0·\0'),(491,'á\0\0\0ã\0'),(491,'à\0\0\0å\0'),(491,'ä\0\0\0·\0'),(492,'ë\0\0\0ã\0'),(492,'í\0\0\0å\0'),(492,'î\0\0\0·\0'),(493,'ñ\0\0\0ç\0'),(493,'ñ\0\0\0é\0'),(493,'ö\0\0\0ç\0'),(493,'ö\0\0\0é\0'),(493,'õ\0\0\0‰\0'),(494,'±\0\0\0ã\0'),(494,'≤\0\0\0å\0'),(494,'∞\0\0\0‰\0'),(495,'í\0\0\0‰\0'),(495,'ï\0\0\0ç\0'),(495,'\rï\0\0\0é\0'),(496,'ó\0\0\0ã\0'),(496,'ò\0\0\0å\0'),(496,'ô\0\0\0·\0'),(497,'†\0\0\0ã\0'),(497,'°\0\0\0å\0'),(497,'§\0\0\0‰\0'),(498,'¨\0\0\0‰\0'),(498,'©\0\0\0ã\0'),(498,'™\0\0\0å\0'),(499,'∞\0\0\0‰\0'),(499,'¥\0\0\0ç\0'),(499,'\r¥\0\0\0é\0'),(500,'ï\0\0\0·\0'),(500,'ó\0\0\0ç\0'),(500,'ó\0\0\0é\0'),(501,'$ì\0\0\0ã\0'),(501,'$î\0\0\0å\0'),(501,'\'ï\0\0\0·\0'),(502,'-ó\0\0\0ç\0'),(502,'.ó\0\0\0é\0'),(502,'/ñ\0\0\0·\0'),(503,'4ó\0\0\0ç\0'),(503,'5ó\0\0\0é\0'),(503,'6ñ\0\0\0·\0'),(504,'Úv\0\0\0ﬁ\0'),(504,'Úw\0\0\0ﬂ\0'),(504,'Òu\0\0\0œ\0'),(505,'Ìx\0\0\0ﬁ\0'),(505,'Ìy\0\0\0ﬂ\0'),(505,'Òy\0\0\0œ\0'),(506,'Ùv\0\0\0œ\0'),(506,'¯t\0\0\0ﬁ\0'),(506,'¯u\0\0\0ﬂ\0'),(507,'Ìà\0\0\0‹\0'),(507,'Óà\0\0\0›\0'),(507,'ÒÜ\0\0\0œ\0'),(508,'ÙÜ\0\0\0œ\0'),(508,'¯Ñ\0\0\0ﬁ\0'),(508,'¯Ö\0\0\0ﬂ\0'),(509,'Ìó\0\0\0‹\0'),(509,'Óó\0\0\0›\0'),(509,'Òï\0\0\0œ\0'),(510,'¯ì\0\0\0ﬁ\0'),(510,'Ùï\0\0\0œ\0'),(510,'¯î\0\0\0ﬂ\0'),(511,'¯¢\0\0\0‹\0'),(511,'˘¢\0\0\0›\0'),(511,'¸§\0\0\0œ\0'),(512,'¯®\0\0\0‹\0'),(512,'˘®\0\0\0›\0'),(512,'¸®\0\0\0œ\0'),(513,'ˇ•\0\0\0œ\0'),(513,'\0¢\0\0\0ﬁ\0'),(513,'\0£\0\0\0ﬂ\0'),(513,'¢\0\0\0ﬁ\0'),(513,'£\0\0\0ﬂ\0'),(514,'ÓÖ\0\0\0ﬁ\0'),(514,'ÓÜ\0\0\0ﬂ\0'),(514,'â\0\0\0“\0'),(515,'ÙÖ\0\0\0‹\0'),(515,'ıÖ\0\0\0›\0'),(515,'˜â\0\0\0“\0'),(516,'Óî\0\0\0‹\0'),(516,'Ôî\0\0\0›\0'),(516,'ò\0\0\0“\0'),(517,'¯î\0\0\0ﬁ\0'),(517,'¯ï\0\0\0ﬂ\0'),(517,'˜ò\0\0\0“\0'),(518,'˙§\0\0\0ﬁ\0'),(518,'˙•\0\0\0ﬂ\0'),(518,'•\0\0\0œ\0'),(519,'Ï£\0\0\0ç\0'),(519,'Ì£\0\0\0é\0'),(519,'¢\0\0\0·\0'),(520,'Ïß\0\0\0ã\0'),(520,'Ï®\0\0\0å\0'),(520,'©\0\0\0·\0'),(521,'˙≥\0\0\0·\0'),(521,'ˆ¥\0\0\0ç\0'),(521,'˜¥\0\0\0é\0'),(522,'±\0\0\0ã\0'),(522,'≤\0\0\0å\0'),(522,'≥\0\0\0·\0'),(523,'ô\0\0\0ã\0'),(523,'ö\0\0\0å\0'),(523,'ò\0\0\0·\0'),(524,'ì\0\0\0·\0'),(524,'î\0\0\0ç\0'),(524,'î\0\0\0é\0'),(525,'&ì\0\0\0ã\0'),(525,'%ó\0\0\0‰\0'),(525,'&î\0\0\0å\0'),(526,',û\0\0\0œ\0'),(526,'-°\0\0\0‹\0'),(526,'.°\0\0\0›\0'),(527,'6û\0\0\0œ\0'),(527,'4°\0\0\0‹\0'),(527,'5°\0\0\0›\0'),(528,',®\0\0\0œ\0'),(528,'-´\0\0\0‹\0'),(528,'.´\0\0\0›\0'),(529,'4´\0\0\0‹\0'),(529,'5´\0\0\0›\0'),(529,'6®\0\0\0œ\0'),(530,'-≥\0\0\0‹\0'),(530,'.≥\0\0\0›\0'),(530,'/≤\0\0\0œ\0'),(531,'3≤\0\0\0œ\0'),(531,'4≥\0\0\0‹\0'),(531,'5≥\0\0\0›\0'),(532,'-ª\0\0\0‹\0'),(532,'.ª\0\0\0›\0'),(532,'/∫\0\0\0œ\0'),(533,'4ª\0\0\0‹\0'),(533,'5ª\0\0\0›\0'),(533,'5º\0\0\0“\0'),(534,'n\0\0\0ã\0'),(534,'o\0\0\0å\0'),(534,'n\0\0\0ã\0'),(534,'o\0\0\0å\0'),(534,'p\0\0\0œ\0'),(535,'~\0\0\0ã\0'),(535,'\0\0\0å\0'),(535,'~\0\0\0ã\0'),(535,'\0\0\0å\0'),(535,'Ä\0\0\0œ\0'),(536,'%n\0\0\0ç\0'),(536,'&n\0\0\0é\0'),(536,'$q\0\0\0œ\0'),(536,'%s\0\0\0ç\0'),(536,'&s\0\0\0é\0'),(537,'%~\0\0\0ç\0'),(537,'&~\0\0\0é\0'),(537,'$Å\0\0\0œ\0'),(537,'%É\0\0\0ç\0'),(537,'&É\0\0\0é\0'),(542,'<o\0\0\0ã\0'),(542,'<p\0\0\0å\0'),(542,'?x\0\0\0“\0'),(542,'Co\0\0\0ã\0'),(542,'Cp\0\0\0å\0'),(543,'æ\0\0\0ﬁ\0'),(543,'æ\0\0\0ﬂ\0'),(543,'¬\0\0\0ı\Z\0'),(544,'Â\0\0\0ﬁ\0'),(544,'Â\0\0\0ﬂ\0'),(544,'Ï\0\0\0ﬁ\0'),(544,'Ï\0\0\0ﬂ\0'),(544,'Ë	\0\0\0Ï\Z\0'),(545,'Àı\0\0\0ﬁ\0'),(545,'Àˆ\0\0\0ﬂ\0'),(545,'ŒÙ\0\0\0Ï\Z\0'),(545,'—ı\0\0\0ﬁ\0'),(545,'—ˆ\0\0\0ﬂ\0'),(546,'ÿˆ\0\0\0ı\Z\0'),(546,'€ı\0\0\0ﬁ\0'),(546,'€ˆ\0\0\0ﬂ\0'),(547,'ÀÏ\0\0\0‹\0'),(547,'ÃÏ\0\0\0›\0'),(547,'ÕÔ\0\0\0Ï\Z\0'),(548,'“Ï\0\0\0ﬁ\0'),(548,'“Ì\0\0\0ﬂ\0'),(548,'÷Ô\0\0\0Ï\Z\0'),(548,'ÿÏ\0\0\0ﬁ\0'),(548,'ÿÌ\0\0\0ﬂ\0'),(549,'À‘\0\0\0‹\0'),(549,'Ã‘\0\0\0›\0'),(549,'ÀŸ\0\0\0‹\0'),(549,'ÃŸ\0\0\0›\0'),(549,'Œ⁄\0\0\0Ï\Z\0'),(550,'Îı\0\0\0ﬁ\0'),(550,'Îˆ\0\0\0ﬂ\0'),(550,'ÓÙ\0\0\0Ï\Z\0'),(551,'Ô\0\0\0Ï\Z\0'),(551,'ÚÏ\0\0\0ﬁ\0'),(551,'ÚÌ\0\0\0ﬂ\0'),(552,'ÍŸ\0\0\0ﬁ\0'),(552,'Í⁄\0\0\0ﬂ\0'),(552,'Í‹\0\0\0Ï\Z\0'),(553,'\0\0\0ﬁ\0'),(553,'\0\0\0ﬂ\0'),(553,'\0\0\0\0Ï\Z\0'),(554,'ˇı\0\0\0ﬁ\0'),(554,'ˇˆ\0\0\0ﬂ\0'),(554,'Ù\0\0\0Ï\Z\0'),(555,'Ô\0\0\0ı\Z\0'),(555,'Ï\0\0\0‹\0'),(555,'Ï\0\0\0›\0'),(556,'¸◊\0\0\0ﬁ\0'),(556,'¸ÿ\0\0\0ﬂ\0'),(556,'ˇ‹\0\0\0Ï\Z\0'),(556,'◊\0\0\0ﬁ\0'),(556,'ÿ\0\0\0ﬂ\0'),(557,'◊\0\0\0‹\0'),(557,'◊\0\0\0›\0'),(557,'‹\0\0\0Ï\Z\0'),(558,'æ\0\0\0‹\0'),(558,'ø\0\0\0›\0'),(558,'¬\0\0\0ı\Z\0'),(559,'Ÿı\0\0\0‹\0'),(559,'⁄ı\0\0\0›\0'),(559,'⁄¯\0\0\0Ï\Z\0'),(560,'ÀÏ\0\0\0ﬁ\0'),(560,'ÀÌ\0\0\0ﬂ\0'),(560,'ŒÔ\0\0\0Ï\Z\0'),(561,'“Ï\0\0\0‹\0'),(561,'”Ï\0\0\0›\0'),(561,'÷Ô\0\0\0Ï\Z\0'),(562,'À‘\0\0\0ﬁ\0'),(562,'À’\0\0\0ﬂ\0'),(562,'—‘\0\0\0ﬁ\0'),(562,'—’\0\0\0ﬂ\0'),(562,'“ÿ\0\0\0ı\Z\0'),(563,'Ï\0\0\0ﬁ\0'),(563,'Ï\0\0\0ﬂ\0'),(563,'Ë	\0\0\0Ï\Z\0'),(564,'Îı\0\0\0ﬁ\0'),(564,'Îˆ\0\0\0ﬂ\0'),(564,'Ú˜\0\0\0ı\Z\0'),(565,'Ô\0\0\0Ï\Z\0'),(565,'ÚÏ\0\0\0ﬁ\0'),(565,'ÚÌ\0\0\0ﬂ\0'),(566,'ÁŸ\0\0\0‹\0'),(566,'ËŸ\0\0\0›\0'),(566,'Î€\0\0\0ı\Z\0'),(567,'Ï\0\0\0ﬁ\0'),(567,'Ì\0\0\0ﬂ\0'),(567,'Ú\0\0\0Ï\Z\0'),(568,'¸◊\0\0\0‹\0'),(568,'˝◊\0\0\0›\0'),(568,'˛‹\0\0\0Ï\Z\0'),(569,'◊\0\0\0ﬁ\0'),(569,'ÿ\0\0\0ﬂ\0'),(569,'‹\0\0\0Ï\Z\0'),(570,'•\0˘\0\0\0‡\0'),(570,'¶\0˘\0\0\0·\0'),(570,'†\0˛\0\0\0⁄\0'),(570,'†\0ˇ\0\0\0€\0'),(570,'¶\0˛\0\0\0⁄\0'),(570,'¶\0ˇ\0\0\0€\0'),(570,'®\0¸\0\0\0âM\0'),(571,'Ÿ\0˘\0\0\0⁄\0'),(571,'Ÿ\0˙\0\0\0€\0'),(571,'ﬂ\0˘\0\0\0⁄\0'),(571,'ﬂ\0˙\0\0\0€\0'),(571,'‹\0¸\0\0\0ÄM\0'),(572,'°\0\0\0\0q\0'),(572,'£\0\0\0\0s\0'),(572,'¶\0\0\0\0s\0'),(572,'¶\0\0\0\0Ó\Z\0'),(572,'®\0\0\0\0r\0'),(572,'¢\0\0\0\0Ó\Z\0'),(572,'•\0\n\0\0\0⁄\0'),(572,'•\0\0\0\0€\0'),(572,'ß\0\n\0\0\0⁄\0'),(572,'ß\0\0\0\0€\0'),(572,'†\0\0\0\0‡\0'),(572,'†\0\0\0\0‡\0'),(572,'°\0\0\0\0·\0'),(572,'°\0\0\0\0·\0'),(572,'ß\0\0\0\0b\0'),(572,'™\0\0\0\0˜\Z\0'),(572,'£\0\0\0\0Ó\Z\0'),(572,'¶\0\0\0\0Ó\Z\0'),(573,'ü\0\0\0\0t\0'),(573,'ü\0\0\0\0r\0'),(573,'ü\0\r\0\0\0t\0'),(573,'¶\0\0\0\0q\0'),(573,'†\0\0\0\0⁄\0'),(573,'†\0\0\0\0€\0'),(573,'¢\0\0\0\0⁄\0'),(573,'¢\0\0\0\0€\0'),(573,'¢\0\0\0\0˜\Z\0'),(573,'£\0\0\0\0‡\0'),(573,'§\0\0\0\0·\0'),(573,'¶\0\0\0\0‡\0'),(573,'¶\0\0\0\0‡\0'),(573,'ß\0\0\0\0·\0'),(573,'ß\0\0\0\0·\0'),(573,'®\0\0\0\0t\0'),(573,'®\0\0\0\0t\0'),(573,'®\0\0\0\0r\0'),(573,'¢\0\n\0\0\0˜\Z\0'),(573,'ß\0\0\0\0˜\Z\0'),(573,'®\0\n\0\0\0t\0'),(573,'®\0\0\0\0r\0'),(573,'†\0\r\0\0\0⁄\0'),(573,'†\0\0\0\0€\0'),(573,'¢\0\r\0\0\0⁄\0'),(573,'¢\0\0\0\0€\0'),(573,'•\0\0\0\0Ó\Z\0'),(574,'π\0\0\0\0⁄\0'),(574,'π\0\0\0\0€\0'),(574,'ª\0\0\0\0⁄\0'),(574,'ª\0\0\0\0€\0'),(574,'¡\0\0\0\0âM\0'),(575,'æ\0\0\0\0‡\0'),(575,'ø\0\0\0\0·\0'),(575,'Ω\0	\0\0\0ÄM\0'),(575,'æ\0\0\0\0âM\0'),(575,'¿\0\0\0\0ÄM\0'),(576,'†\0\0\0\0⁄\0'),(576,'†\0\0\0\0€\0'),(576,'°\0\0\0\0q\0'),(576,'°\0\0\0\0⁄\0'),(576,'°\0\0\0\0€\0'),(576,'§\0\0\0\0q\0'),(576,'¶\0\0\0\0Ù\Z\0'),(577,'§\0\0\0\0‡\0'),(577,'•\0\0\0\0·\0'),(577,'§\0\0\0\0‡\0'),(577,'•\0\0\0\0·\0'),(577,'¶\0\0\0\0t\0'),(577,'¶\0\0\0\0Ù\Z\0'),(577,'¢\0\0\0\0s\0'),(577,'¢\0\0\0\0q\0'),(578,'¶\0\0\0\0Ù\Z\0'),(578,'¶\0\0\0\0r\0'),(579,'≥\0\0\0\0r\0'),(579,'≥\0\0\0\0Ù\Z\0'),(579,'∑\0\0\0\0t\0'),(579,'µ\0\0\0\0‡\0'),(579,'µ\0\0\0\0s\0'),(579,'∂\0\0\0\0·\0'),(580,'±\0\0\0\0t\0'),(580,'≤\0\Z\0\0\0⁄\0'),(580,'≤\0\0\0\0€\0'),(580,'≤\0\0\0\0Ù\Z\0'),(580,'≤\0\Z\0\0\0⁄\0'),(580,'≤\0\0\0\0€\0'),(580,'π\0\Z\0\0\0t\0'),(580,'π\0\Z\0\0\0r\0'),(580,'¥\0\0\0\0q\0'),(580,'∑\0\0\0\0s\0'),(580,'¥\0\0\0\0s\0'),(580,'∑\0\0\0\0q\0'),(581,'π\0\0\0\0q\0'),(581,'∫\0\0\0\0⁄\0'),(581,'∫\0\0\0\0€\0'),(581,'∫\0\0\0\0⁄\0'),(581,'∫\0\0\0\0€\0'),(581,'∫\0\0\0\0s\0'),(581,'¿\0\0\0\0Ù\Z\0'),(582,'ø\0\0\0\0⁄\0'),(582,'ø\0\0\0\0€\0'),(582,'Ω\0\0\0\0q\0'),(582,'Ω\0\0\0\0s\0'),(582,'¿\0\0\0\0⁄\0'),(582,'¿\0\0\0\0€\0'),(582,'¡\0\0\0\0t\0'),(582,'¡\0\Z\0\0\0r\0'),(582,'¡\0\0\0\0r\0'),(582,'¡\0\Z\0\0\0Ù\Z\0'),(582,'¿\0\0\0\0q\0'),(583,'Œ\0\Z\0\0\0⁄\0'),(583,'Œ\0\0\0\0€\0'),(583,'œ\0\Z\0\0\0⁄\0'),(583,'œ\0\0\0\0€\0'),(583,'Õ\0\0\0\0N\0'),(584,'·\0\0\0\0‡\0'),(584,'‚\0\0\0\0·\0'),(584,'·\0\Z\0\0\0‡\0'),(584,'‚\0\Z\0\0\0·\0'),(584,'‡\0\0\0\0N\0'),(585,'›\0%\0\0\0⁄\0'),(585,'›\0&\0\0\0€\0'),(585,'›\0%\0\0\0⁄\0'),(585,'›\0&\0\0\0€\0'),(585,'›\0%\0\0\0⁄\0'),(585,'›\0&\0\0\0€\0'),(585,'›\0(\0\0\0N\0'),(586,'‚\0%\0\0\0‡\0'),(586,'‚\0\'\0\0\0‡\0'),(586,'„\0%\0\0\0·\0'),(586,'„\0\'\0\0\0·\0'),(586,'Á\0%\0\0\0⁄\0'),(586,'Á\0&\0\0\0€\0'),(586,'‚\0(\0\0\0‡\0'),(586,'„\0(\0\0\0·\0'),(586,'„\0)\0\0\0N\0'),(586,'Â\0(\0\0\0‡\0'),(586,'Ê\0(\0\0\0·\0'),(587,'Õ\0%\0\0\0⁄\0'),(587,'Õ\0&\0\0\0€\0'),(587,'Ã\0\'\0\0\0âM\0'),(587,'’\0%\0\0\0⁄\0'),(587,'’\0&\0\0\0€\0'),(588,'≥\0+\0\0\0ÅM\0'),(588,'¥\0(\0\0\0‡\0'),(588,'¥\0*\0\0\0‡\0'),(588,'µ\0(\0\0\0·\0'),(588,'µ\0*\0\0\0·\0'),(588,'¥\0(\0\0\0‡\0'),(588,'¥\0*\0\0\0‡\0'),(588,'µ\0(\0\0\0·\0'),(588,'µ\0*\0\0\0·\0'),(589,'ß\0(\0\0\0N\0'),(590,'¶\07\0\0\0åM\0'),(590,'¢\0:\0\0\0⁄\0'),(590,'¢\0;\0\0\0€\0'),(590,'§\09\0\0\0ÉM\0'),(590,'•\0:\0\0\0⁄\0'),(590,'•\0;\0\0\0€\0'),(590,'¶\0=\0\0\0N\0'),(591,'é\06\0\0\0⁄\0'),(591,'é\07\0\0\0€\0'),(591,'è\06\0\0\0⁄\0'),(591,'è\07\0\0\0€\0'),(591,'ë\0;\0\0\0N\0'),(591,'î\09\0\0\0N\0'),(591,'ò\0;\0\0\0\0'),(592,'†\0E\0\0\0‡\0'),(592,'°\0E\0\0\0·\0'),(592,'§\0G\0\0\0åM\0'),(592,'ß\0F\0\0\0‡\0'),(592,'§\0G\0\0\0N\0'),(592,'¶\0E\0\0\0N\0'),(592,'®\0F\0\0\0·\0'),(592,'†\0H\0\0\0‡\0'),(592,'°\0H\0\0\0·\0'),(592,'£\0K\0\0\0N\0'),(592,'§\0K\0\0\0åM\0'),(592,'ß\0H\0\0\0‡\0'),(592,'ß\0J\0\0\0‡\0'),(592,'®\0H\0\0\0·\0'),(592,'®\0J\0\0\0·\0'),(592,'ß\0L\0\0\0‡\0'),(592,'®\0L\0\0\0·\0'),(592,'©\0L\0\0\0N\0'),(593,'è\0M\0\0\0‡\0'),(593,'è\0N\0\0\0‡\0'),(593,'î\0K\0\0\0⁄\0'),(593,'ï\0K\0\0\0⁄\0'),(593,'ê\0M\0\0\0·\0'),(593,'ê\0N\0\0\0·\0'),(593,'í\0O\0\0\0N\0'),(593,'î\0L\0\0\0€\0'),(593,'ï\0L\0\0\0€\0'),(593,'ñ\0M\0\0\0N\0'),(593,'ñ\0R\0\0\0\0'),(594,'º\03\0\0\0ÂN\0'),(594,'º\04\0\0\0ÊN\0'),(594,'¬\02\0\0\0âM\0'),(595,'À\02\0\0\0âM\0'),(595,'“\02\0\0\0ÂN\0'),(595,'“\03\0\0\0ÊN\0');
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

-- Dump completed on 2025-08-28  5:00:05
