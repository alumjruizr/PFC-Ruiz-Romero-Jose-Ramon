CREATE DATABASE  IF NOT EXISTS `roleapp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `roleapp`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: roleapp
-- ------------------------------------------------------
-- Server version	5.7.42-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add character class',7,'add_characterclass'),(26,'Can change character class',7,'change_characterclass'),(27,'Can delete character class',7,'delete_characterclass'),(28,'Can view character class',7,'view_characterclass'),(29,'Can add item',8,'add_item'),(30,'Can change item',8,'change_item'),(31,'Can delete item',8,'delete_item'),(32,'Can view item',8,'view_item'),(33,'Can add race',9,'add_race'),(34,'Can change race',9,'change_race'),(35,'Can delete race',9,'delete_race'),(36,'Can view race',9,'view_race'),(37,'Can add character sheet',10,'add_charactersheet'),(38,'Can change character sheet',10,'change_charactersheet'),(39,'Can delete character sheet',10,'delete_charactersheet'),(40,'Can view character sheet',10,'view_charactersheet'),(41,'Can add set att',11,'add_setatt'),(42,'Can change set att',11,'change_setatt'),(43,'Can delete set att',11,'delete_setatt'),(44,'Can view set att',11,'view_setatt'),(45,'Can add armor',12,'add_armor'),(46,'Can change armor',12,'change_armor'),(47,'Can delete armor',12,'delete_armor'),(48,'Can view armor',12,'view_armor'),(49,'Can add magic item',13,'add_magicitem'),(50,'Can change magic item',13,'change_magicitem'),(51,'Can delete magic item',13,'delete_magicitem'),(52,'Can view magic item',13,'view_magicitem'),(53,'Can add weapon',14,'add_weapon'),(54,'Can change weapon',14,'change_weapon'),(55,'Can delete weapon',14,'delete_weapon'),(56,'Can view weapon',14,'view_weapon');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$PDnh0LHE2lkm2N3wAY334B$0KDg9KeAdMDZK6U+0hzyTw6GZD6HVafoWn6Fp4qQ//Q=','2023-06-14 18:14:22.587632',1,'root','','','alum.jruizr.2021@iesalixar.org',1,1,'2023-05-31 22:44:15.311150'),(2,'pbkdf2_sha256$260000$TVX7sll6Y1LC97ChLr3z2S$Kbw0ML0Do56S9wIIYGbl8lv2k4GGgQTE8hr3fRlaZFc=','2023-06-11 16:52:52.278459',0,'user1','','','',0,1,'2023-05-31 22:54:34.741274'),(3,'pbkdf2_sha256$260000$x7dF2DPw7B0iXTHEp1JO6Z$kkw4SKPbbu5QfDeF137YbOtXzKqohEGRe97xgNQOoHU=','2023-06-14 18:13:06.380460',0,'user2','','','',0,1,'2023-06-14 18:13:06.249462');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-05-31 22:54:34.804273','2','user1',1,'[{\"added\": {}}]',4,1),(2,'2023-05-31 23:32:35.824269','1','Armadura de cuero',1,'[{\"added\": {}}]',12,1),(3,'2023-05-31 23:32:54.508694','2','Ojo de Agamotto',1,'[{\"added\": {}}]',13,1),(4,'2023-05-31 23:33:11.401668','3','Espada corta',1,'[{\"added\": {}}]',14,1),(5,'2023-05-31 23:42:42.700596','1','Glorfindel',2,'[{\"changed\": {\"fields\": [\"Equipment\"]}}]',10,1),(6,'2023-05-31 23:42:47.878088','1','Glorfindel',2,'[{\"changed\": {\"fields\": [\"Equipment\"]}}]',10,1),(7,'2023-05-31 23:43:26.251934','1','Glorfindel',2,'[{\"changed\": {\"fields\": [\"Equipment\"]}}]',10,1),(8,'2023-06-01 11:30:32.057275','7','La brújula dorada',1,'[{\"added\": {}}]',13,1),(9,'2023-06-14 10:41:19.897971','1','Elladan',2,'[{\"changed\": {\"fields\": [\"Race\", \"ExperiencePoints\"]}}]',10,1),(10,'2023-06-14 10:53:48.353593','2','Gandalf',2,'[{\"changed\": {\"fields\": [\"CharacterClass\", \"ExperiencePoints\"]}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'roleapp','armor'),(7,'roleapp','characterclass'),(10,'roleapp','charactersheet'),(8,'roleapp','item'),(13,'roleapp','magicitem'),(9,'roleapp','race'),(11,'roleapp','setatt'),(14,'roleapp','weapon'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-05-31 22:37:50.352663'),(2,'auth','0001_initial','2023-05-31 22:37:50.682267'),(3,'admin','0001_initial','2023-05-31 22:37:50.754380'),(4,'admin','0002_logentry_remove_auto_add','2023-05-31 22:37:50.758938'),(5,'admin','0003_logentry_add_action_flag_choices','2023-05-31 22:37:50.763395'),(6,'contenttypes','0002_remove_content_type_name','2023-05-31 22:37:50.813621'),(7,'auth','0002_alter_permission_name_max_length','2023-05-31 22:37:50.824528'),(8,'auth','0003_alter_user_email_max_length','2023-05-31 22:37:50.836544'),(9,'auth','0004_alter_user_username_opts','2023-05-31 22:37:50.841543'),(10,'auth','0005_alter_user_last_login_null','2023-05-31 22:37:50.866063'),(11,'auth','0006_require_contenttypes_0002','2023-05-31 22:37:50.867380'),(12,'auth','0007_alter_validators_add_error_messages','2023-05-31 22:37:50.872389'),(13,'auth','0008_alter_user_username_max_length','2023-05-31 22:37:50.883072'),(14,'auth','0009_alter_user_last_name_max_length','2023-05-31 22:37:50.893191'),(15,'auth','0010_alter_group_name_max_length','2023-05-31 22:37:50.905216'),(16,'auth','0011_update_proxy_permissions','2023-05-31 22:37:50.910216'),(17,'auth','0012_alter_user_first_name_max_length','2023-05-31 22:37:50.920968'),(18,'roleapp','0001_initial','2023-05-31 22:37:51.147069'),(19,'roleapp','0002_auto_20230519_1424','2023-05-31 22:37:51.268439'),(20,'roleapp','0003_auto_20230519_1440','2023-05-31 22:37:51.350150'),(21,'roleapp','0004_alter_characterclass_subclass','2023-05-31 22:37:51.381413'),(22,'roleapp','0005_alter_characterclass_name','2023-05-31 22:37:51.385415'),(23,'roleapp','0006_auto_20230526_2039','2023-05-31 22:37:51.407788'),(24,'roleapp','0007_delete_customer','2023-05-31 22:37:51.416805'),(25,'roleapp','0008_auto_20230526_2104','2023-05-31 22:37:51.469476'),(26,'roleapp','0009_setatt','2023-05-31 22:37:51.520141'),(27,'roleapp','0010_auto_20230531_1955','2023-05-31 22:37:51.573724'),(28,'roleapp','0011_armor_magicitem_weapon','2023-05-31 22:37:51.708473'),(29,'roleapp','0012_auto_20230531_2009','2023-05-31 22:37:51.735733'),(30,'sessions','0001_initial','2023-05-31 22:37:51.791489'),(31,'users','0001_initial','2023-05-31 22:37:51.810489'),(32,'users','0002_delete_user','2023-05-31 22:37:51.816080'),(33,'roleapp','0013_auto_20230601_0130','2023-05-31 23:30:19.158135'),(34,'roleapp','0014_auto_20230604_1138','2023-06-04 09:38:53.817875'),(35,'roleapp','0015_auto_20230611_1959','2023-06-11 18:03:06.449482');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('59d7und5wi2n0felfpkb1ptidr3onaos','e30:1q8IYY:g_fkaC8NGuXUFOw7ITi24UcjLOJLQEuREZqyBvHiQ6s','2023-06-25 10:44:22.780659'),('7ihoapnsd8ekw66mg8gu298s3m9q3hzt','e30:1q8IXj:-h1HcicDyeu-_WierTc2UXLxAAB-oKTS1MkN2onjBuA','2023-06-25 10:43:31.087470'),('j1tw9y6odtsxjqbeqo1h9a5ucn3a867l','.eJxVjDsOwjAQRO_iGln-O6akzxmsXa-DA8iR4qRC3B1HSgHNFDPvzZtF2LcS95bXOBO7Mskuvx1CeuZ6DPSAel94Wuq2zsgPhJ9r4-NC-XU72b-DAq10WwGh0lJYYfKQ_AQwpNAjWHQuGSk1UjAe0bvgySew3RCQNWWUWk3s8wXvGjiA:1q9SoD:xaC5PSsaBY8w51qbfoqNj-gjgit85pr7Y_KxpwZqEn8','2023-06-28 15:53:21.572960'),('jjnapzdj5qei7tz4lny90zdqlpx8zstz','.eJxVjDsOwjAQRO_iGln-O6akzxmsXa-DA8iR4qRC3B1HSgHNFDPvzZtF2LcS95bXOBO7Mskuvx1CeuZ6DPSAel94Wuq2zsgPhJ9r4-NC-XU72b-DAq10WwGh0lJYYfKQ_AQwpNAjWHQuGSk1UjAe0bvgySew3RCQNWWUWk3s8wXvGjiA:1q87Cm:JD_h-B1AKcJY4Im-hrjAa5DB5gT5oVuXuGqzHgZb4So','2023-06-24 22:37:08.775445'),('odi2kdbygqn61mzzkzm4uiby1xivg03v','e30:1q8IYI:rcsGtU43vcqNtJvDILCPEkEtZUYrK1dfLOEWDiA6xGI','2023-06-25 10:44:06.665078'),('ohg86pjqjbywkh9vqtn2ldxzf8pkvxz0','e30:1q7JZl:tvA_xZ0FwC_2BNAsrKbrUM5Nmtado4qJBAXxBAn1CP0','2023-06-22 17:37:33.358860');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleapp_armor`
--

DROP TABLE IF EXISTS `roleapp_armor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleapp_armor` (
  `item_ptr_id` int(11) NOT NULL,
  `armorClass` int(11) NOT NULL,
  `dexterityMod` int(11) NOT NULL,
  PRIMARY KEY (`item_ptr_id`),
  CONSTRAINT `roleapp_armor_item_ptr_id_e75bba08_fk_roleapp_item_id` FOREIGN KEY (`item_ptr_id`) REFERENCES `roleapp_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleapp_armor`
--

LOCK TABLES `roleapp_armor` WRITE;
/*!40000 ALTER TABLE `roleapp_armor` DISABLE KEYS */;
INSERT INTO `roleapp_armor` VALUES (1,13,2);
/*!40000 ALTER TABLE `roleapp_armor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleapp_characterclass`
--

DROP TABLE IF EXISTS `roleapp_characterclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleapp_characterclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subClass` varchar(30) NOT NULL,
  `hitDice` varchar(4) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleapp_characterclass`
--

LOCK TABLES `roleapp_characterclass` WRITE;
/*!40000 ALTER TABLE `roleapp_characterclass` DISABLE KEYS */;
INSERT INTO `roleapp_characterclass` VALUES (1,'Hunter','1d8','Ranger'),(2,'','1d12','Barbarian'),(3,'','1d6','Wizard'),(4,'','1d8','Bard'),(5,'','1d8','Cleric'),(6,'','1d8','Druid'),(7,'','1d10','Fighter'),(8,'','1d8','Monk'),(9,'','1d10','Paladin'),(10,'','1d8','Rogue'),(11,'','1d6','Sorcerer'),(12,'','1d8','Warlock');
/*!40000 ALTER TABLE `roleapp_characterclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleapp_charactersheet`
--

DROP TABLE IF EXISTS `roleapp_charactersheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleapp_charactersheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `strength` int(11) NOT NULL,
  `dexterity` int(11) NOT NULL,
  `constitution` int(11) NOT NULL,
  `wisdom` int(11) NOT NULL,
  `intelligence` int(11) NOT NULL,
  `charisma` int(11) NOT NULL,
  `actualLevel` int(11) NOT NULL,
  `characterClass_id` int(11) NOT NULL,
  `race_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `alignment` varchar(20) NOT NULL,
  `currentHitPoints` int(11) NOT NULL,
  `experiencePoints` int(11) DEFAULT NULL,
  `isInspired` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleapp_charactershe_characterClass_id_556fe28b_fk_roleapp_c` (`characterClass_id`),
  KEY `roleapp_charactersheet_race_id_58114aca_fk_roleapp_race_id` (`race_id`),
  KEY `roleapp_charactersheet_user_id_9fadf482_fk_auth_user_id` (`user_id`),
  CONSTRAINT `roleapp_charactershe_characterClass_id_556fe28b_fk_roleapp_c` FOREIGN KEY (`characterClass_id`) REFERENCES `roleapp_characterclass` (`id`),
  CONSTRAINT `roleapp_charactersheet_race_id_58114aca_fk_roleapp_race_id` FOREIGN KEY (`race_id`) REFERENCES `roleapp_race` (`id`),
  CONSTRAINT `roleapp_charactersheet_user_id_9fadf482_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleapp_charactersheet`
--

LOCK TABLES `roleapp_charactersheet` WRITE;
/*!40000 ALTER TABLE `roleapp_charactersheet` DISABLE KEYS */;
INSERT INTO `roleapp_charactersheet` VALUES (1,'Elladan',12,16,12,10,10,14,2,1,4,1,'Neutral',10,0,0),(2,'Gandalf',8,10,14,18,18,20,4,3,1,1,'Lawful Good',25,1,0),(3,'wijndal',10,16,16,16,16,16,1,1,1,1,'Neutral',8,1,0),(6,'Floro',16,16,16,16,16,16,1,4,1,1,'Neutral',10,0,0);
/*!40000 ALTER TABLE `roleapp_charactersheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleapp_charactersheet_equipment`
--

DROP TABLE IF EXISTS `roleapp_charactersheet_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleapp_charactersheet_equipment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `charactersheet_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleapp_charactersheet_e_charactersheet_id_item_i_3013730c_uniq` (`charactersheet_id`,`item_id`),
  KEY `roleapp_charactershe_item_id_4f75276e_fk_roleapp_i` (`item_id`),
  CONSTRAINT `roleapp_charactershe_charactersheet_id_efd09c80_fk_roleapp_c` FOREIGN KEY (`charactersheet_id`) REFERENCES `roleapp_charactersheet` (`id`),
  CONSTRAINT `roleapp_charactershe_item_id_4f75276e_fk_roleapp_i` FOREIGN KEY (`item_id`) REFERENCES `roleapp_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleapp_charactersheet_equipment`
--

LOCK TABLES `roleapp_charactersheet_equipment` WRITE;
/*!40000 ALTER TABLE `roleapp_charactersheet_equipment` DISABLE KEYS */;
INSERT INTO `roleapp_charactersheet_equipment` VALUES (4,1,7),(3,1,8),(2,1,9),(5,2,1);
/*!40000 ALTER TABLE `roleapp_charactersheet_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleapp_item`
--

DROP TABLE IF EXISTS `roleapp_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleapp_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `polymorphic_ctype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleapp_item_polymorphic_ctype_id_66458f95_fk_django_co` (`polymorphic_ctype_id`),
  CONSTRAINT `roleapp_item_polymorphic_ctype_id_66458f95_fk_django_co` FOREIGN KEY (`polymorphic_ctype_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleapp_item`
--

LOCK TABLES `roleapp_item` WRITE;
/*!40000 ALTER TABLE `roleapp_item` DISABLE KEYS */;
INSERT INTO `roleapp_item` VALUES (1,'Armadura de cuero','Ta wapa',12),(2,'Ojo de Agamotto','El ojo que todo lo ve',13),(3,'Espada corta','Pues eso, corta',14),(6,'La Gloriosa','Un hacha grande',8),(7,'La brújula dorada','Dora más que brujea',13),(8,'La Gloriosa','Un hacha grande',8),(9,'La Gloriosa','Un hacha grande',8);
/*!40000 ALTER TABLE `roleapp_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleapp_magicitem`
--

DROP TABLE IF EXISTS `roleapp_magicitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleapp_magicitem` (
  `item_ptr_id` int(11) NOT NULL,
  `rarity` varchar(20) NOT NULL,
  PRIMARY KEY (`item_ptr_id`),
  CONSTRAINT `roleapp_magicitem_item_ptr_id_c716396d_fk_roleapp_item_id` FOREIGN KEY (`item_ptr_id`) REFERENCES `roleapp_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleapp_magicitem`
--

LOCK TABLES `roleapp_magicitem` WRITE;
/*!40000 ALTER TABLE `roleapp_magicitem` DISABLE KEYS */;
INSERT INTO `roleapp_magicitem` VALUES (2,'Legendary'),(7,'Very rare');
/*!40000 ALTER TABLE `roleapp_magicitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleapp_race`
--

DROP TABLE IF EXISTS `roleapp_race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleapp_race` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subRace` longtext NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleapp_race`
--

LOCK TABLES `roleapp_race` WRITE;
/*!40000 ALTER TABLE `roleapp_race` DISABLE KEYS */;
INSERT INTO `roleapp_race` VALUES (1,'High Elf','Elf'),(2,'','Human'),(3,'','Half Orc'),(4,'','Dwarf'),(5,'','Halfling');
/*!40000 ALTER TABLE `roleapp_race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleapp_weapon`
--

DROP TABLE IF EXISTS `roleapp_weapon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleapp_weapon` (
  `item_ptr_id` int(11) NOT NULL,
  `dice` varchar(4) NOT NULL,
  `attribute` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_ptr_id`),
  CONSTRAINT `roleapp_weapon_item_ptr_id_1f19f557_fk_roleapp_item_id` FOREIGN KEY (`item_ptr_id`) REFERENCES `roleapp_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleapp_weapon`
--

LOCK TABLES `roleapp_weapon` WRITE;
/*!40000 ALTER TABLE `roleapp_weapon` DISABLE KEYS */;
INSERT INTO `roleapp_weapon` VALUES (3,'1d8','STR');
/*!40000 ALTER TABLE `roleapp_weapon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-14 21:25:53
