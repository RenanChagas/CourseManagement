# ************************************************************
# Sequel Pro SQL dump
# Versão 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: us-cdbr-iron-east-04.cleardb.net (MySQL 5.5.46-log)
# Base de Dados: ad_217a29a3ff06bda
# Tempo de Geração: 2016-08-01 20:27:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela app_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_user`;

CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `job_desc` varchar(50) NOT NULL,
  `state` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;

INSERT INTO `app_user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `job_desc`, `state`)
VALUES
	(1,'admin','$2a$10$a75JZtRm9qiXT.4FcY9Sc.m7sjhN.T9N7gNuw3t.f7Y5FKngH/UeW','davids','behan','dbehan@teste.com.br','Web Designer','Active'),
	(12,'teste','$2a$10$3ozyO9MIH0EUyenexyN2zOhM.BbAH54FGOv.CLVOeCqvOgc/tssma','teste','teste','teste@teste','teste','Active'),
	(22,'davidbehann','$2a$10$RmKk6L4pXUvN25ICs6x4CO2t1tvaYTm6VwiVPA3Qev79IIrsKKz0G','David','Behan','teste@teste','Web Designer','Active'),
	(52,'teste1','$2a$10$sNcPqzyGdVxabl5ol0w6weBE0sV4oQcOySnWLxNuOzQg4QxOx2nq6','teste','teste','teste@teste.cm','App Developer','Active'),
	(62,'renanchagasw','$2a$10$gFoWyBK7vFM.3N1oHg.icupWGJRnKO2hgkuWtgQz9tFegPDkXBCpu','Renan','Chagas Wanderley','renanchagasw@gmail.com','App Developer','Active');

/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela app_user_team
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_user_team`;

CREATE TABLE `app_user_team` (
  `user_id` bigint(20) NOT NULL,
  `team_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`team_id`),
  KEY `FK_TEAM_APP_USER` (`team_id`),
  CONSTRAINT `FK_APP_USER_TEAM` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  CONSTRAINT `FK_TEAM_APP_USER` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `app_user_team` WRITE;
/*!40000 ALTER TABLE `app_user_team` DISABLE KEYS */;

INSERT INTO `app_user_team` (`user_id`, `team_id`)
VALUES
	(62,2);

/*!40000 ALTER TABLE `app_user_team` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela app_user_user_profile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_user_user_profile`;

CREATE TABLE `app_user_user_profile` (
  `user_id` bigint(20) NOT NULL,
  `user_profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`user_profile_id`),
  KEY `FK_USER_PROFILE` (`user_profile_id`),
  CONSTRAINT `FK_APP_USER` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  CONSTRAINT `FK_USER_PROFILE` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `app_user_user_profile` WRITE;
/*!40000 ALTER TABLE `app_user_user_profile` DISABLE KEYS */;

INSERT INTO `app_user_user_profile` (`user_id`, `user_profile_id`)
VALUES
	(12,1),
	(1,2),
	(22,2),
	(52,2),
	(62,2);

/*!40000 ALTER TABLE `app_user_user_profile` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela team
# ------------------------------------------------------------

DROP TABLE IF EXISTS `team`;

CREATE TABLE `team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(30) NOT NULL,
  `team_desc` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_name` (`team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;

INSERT INTO `team` (`id`, `team_name`, `team_desc`)
VALUES
	(2,'Globo','Team responsible for handling all Globo System using Java/Oracle');

/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela user_profile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_profile`;

CREATE TABLE `user_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;

INSERT INTO `user_profile` (`id`, `type`)
VALUES
	(2,'Admin'),
	(3,'Manager'),
	(1,'User');

/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

/* Populate Department */
INSERT INTO `department` (`id`, `name`, `desc`)
VALUES
	(1,'Consulting','Consulting department for external clients');

/* Update Team */
UPDATE TEAM
SET DEPARTMENT_ID = 1
WHERE ID = 2 OR ID = 3
	
	
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
