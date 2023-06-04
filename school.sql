-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administration`
--

DROP TABLE IF EXISTS `administration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administration` (
  `adm_id` smallint unsigned NOT NULL,
  `appointment` varchar(100) DEFAULT NULL COMMENT 'Должность',
  `work_experience` tinyint unsigned NOT NULL COMMENT 'Стаж работы',
  `adm_num_employ_contr` bigint unsigned NOT NULL COMMENT 'Номер трудового договора члена администрации',
  `phone` bigint unsigned NOT NULL,
  UNIQUE KEY `adm_id` (`adm_id`),
  UNIQUE KEY `adm_num_employ_contr` (`adm_num_employ_contr`),
  UNIQUE KEY `phone` (`phone`),
  CONSTRAINT `administration_ibfk_1` FOREIGN KEY (`adm_id`) REFERENCES `team` (`id`),
  CONSTRAINT `administration_ibfk_2` FOREIGN KEY (`adm_num_employ_contr`) REFERENCES `team` (`numb_employment_contract`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administration`
--

LOCK TABLES `administration` WRITE;
/*!40000 ALTER TABLE `administration` DISABLE KEYS */;
INSERT INTO `administration` VALUES (3,'Зам. директора по УВР',40,1020304052,89990001112),(5,'Директор',28,1020304054,89990001100),(7,'Зам. директора по безопаности',19,1020304056,89990001134);
/*!40000 ALTER TABLE `administration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_teachers`
--

DROP TABLE IF EXISTS `class_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_teachers` (
  `class_teacher_id` smallint unsigned NOT NULL,
  `class_id` tinyint unsigned NOT NULL,
  UNIQUE KEY `class_teacher_id` (`class_teacher_id`),
  UNIQUE KEY `class_id` (`class_id`),
  CONSTRAINT `class_teachers_ibfk_1` FOREIGN KEY (`class_teacher_id`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `class_teachers_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `school_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_teachers`
--

LOCK TABLES `class_teachers` WRITE;
/*!40000 ALTER TABLE `class_teachers` DISABLE KEYS */;
INSERT INTO `class_teachers` VALUES (2,1),(4,2),(8,4),(9,5),(10,6),(7,7),(6,8),(3,9),(1,10);
/*!40000 ALTER TABLE `class_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classrooms`
--

DROP TABLE IF EXISTS `classrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classrooms` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `worker_id` smallint unsigned NOT NULL COMMENT 'За каким работником закреплён кабинет',
  `num` smallint unsigned NOT NULL COMMENT 'Номер кабинета',
  `title` varchar(100) DEFAULT NULL COMMENT 'Название кабинета',
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `worker_id` (`worker_id`),
  UNIQUE KEY `num` (`num`),
  CONSTRAINT `classrooms_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classrooms`
--

LOCK TABLES `classrooms` WRITE;
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
INSERT INTO `classrooms` VALUES (1,1,432,'Кабинет математики'),(2,2,107,'Кабинет начальных классов'),(3,6,425,'Кабинет русского языка'),(4,9,255,'Кабинет информатики'),(5,10,430,'Кабинет информатики'),(6,4,103,'Кабинет начальных классов');
/*!40000 ALTER TABLE `classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parents` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL COMMENT 'Имя',
  `patronymic` varchar(50) DEFAULT NULL COMMENT 'Отчество',
  `lastname` varchar(50) DEFAULT NULL COMMENT 'Фамилия',
  `birthday` date DEFAULT NULL,
  `parent_in_ipa` char(14) DEFAULT NULL COMMENT 'СНИЛС родителя',
  `phone` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `parent_in_ipa` (`parent_in_ipa`),
  KEY `parents_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents`
--

LOCK TABLES `parents` WRITE;
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
INSERT INTO `parents` VALUES (1,'Иван','Павлович','Альтман','1977-01-14','111-111-111-00',12121212120),(2,'Юрий','Семёнович','Смольников','1976-10-03','111-111-111-01',12121212121),(3,'Лариса','Петровна','Лаврова','1991-11-08','111-111-111-02',12121212122),(4,'Анастасия','Сергеевна','Новикова','1989-06-01','111-111-111-03',12121212123),(5,'Владимир','Алексеевич','Шумов','1985-01-15','111-111-111-04',12121212124),(6,'Игорь','Иванович','Хохлов','1985-01-15','111-111-111-05',12121212125),(7,'Андрей','Петрович','Иванов','1980-02-18','111-111-111-06',12121212126);
/*!40000 ALTER TABLE `parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pupils`
--

DROP TABLE IF EXISTS `pupils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pupils` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `patronymic` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `class_id` tinyint unsigned NOT NULL COMMENT 'ID класса, в котором учится ученик',
  `pupil_in_ipa` char(14) DEFAULT NULL COMMENT 'СНИЛС ученика',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pupil_in_ipa` (`pupil_in_ipa`),
  KEY `pupils_firstname_lastname_idx` (`firstname`,`lastname`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `pupils_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `school_classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pupils`
--

LOCK TABLES `pupils` WRITE;
/*!40000 ALTER TABLE `pupils` DISABLE KEYS */;
INSERT INTO `pupils` VALUES (1,'Андрей','Юрьевич','Смольников','2010-01-01',6,'000-000-000 00'),(2,'Ирина','Олеговна','Дурова','2006-12-07',10,'000-000-000 01'),(3,'Максим','Михайлович','Попов','2006-08-14',10,'000-000-000 02'),(4,'Елена','Андреевна','Иванова','2009-03-24',7,'000-000-000 03'),(5,'Кутман','Аркадьевич','Лавров','2015-01-10',1,'000-000-000 04'),(6,'Владислав','Игоревич','Хохлов','2014-02-12',2,'000-000-000 05'),(7,'Алёна','Ивановна','Вайнерман','2011-06-10',5,'000-000-000 06'),(8,'Мадина','Омаровна','Курбанова','2007-05-30',9,'000-000-000 07'),(9,'Михаил','Сергеевич','Новиков','2012-03-03',4,'000-000-000 08'),(10,'Пётр','Владимирович','Шумов','2008-09-16',8,'000-000-000 09');
/*!40000 ALTER TABLE `pupils` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation`
--

DROP TABLE IF EXISTS `relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relation` (
  `pupil_id` smallint unsigned NOT NULL,
  `parent_id` smallint unsigned NOT NULL,
  UNIQUE KEY `pupil_id` (`pupil_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `relation_ibfk_1` FOREIGN KEY (`pupil_id`) REFERENCES `pupils` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relation_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation`
--

LOCK TABLES `relation` WRITE;
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;
INSERT INTO `relation` VALUES (1,2),(5,3),(9,4),(10,5),(6,6),(4,7);
/*!40000 ALTER TABLE `relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_classes`
--

DROP TABLE IF EXISTS `school_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_classes` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_classes`
--

LOCK TABLES `school_classes` WRITE;
/*!40000 ALTER TABLE `school_classes` DISABLE KEYS */;
INSERT INTO `school_classes` VALUES (1,'1 А'),(10,'10 А'),(2,'2 Б'),(3,'3 В'),(4,'4 Г'),(5,'5 Д'),(6,'6 Г'),(7,'7 В'),(8,'8 А'),(9,'9 Б');
/*!40000 ALTER TABLE `school_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_subjects`
--

DROP TABLE IF EXISTS `school_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_subjects` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `subj_denomination` varchar(100) DEFAULT NULL COMMENT 'Название предмета',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_subjects`
--

LOCK TABLES `school_subjects` WRITE;
/*!40000 ALTER TABLE `school_subjects` DISABLE KEYS */;
INSERT INTO `school_subjects` VALUES (1,'История'),(2,'Русский язык'),(3,'Математика'),(4,'ОБЖ'),(5,'Физика'),(6,'Химия'),(7,'Английский язык'),(8,'Биология');
/*!40000 ALTER TABLE `school_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolbooks`
--

DROP TABLE IF EXISTS `schoolbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schoolbooks` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `school_subj_id` tinyint unsigned NOT NULL,
  `book_denomination` varchar(100) DEFAULT NULL COMMENT 'Название учебника',
  `author` varchar(150) DEFAULT NULL COMMENT 'Автор учебника',
  `book_grade` varchar(2) DEFAULT NULL COMMENT 'Для какого класса предназначен',
  UNIQUE KEY `id` (`id`),
  KEY `schoolbooks_denomination_author_idx` (`book_denomination`,`author`),
  KEY `school_subj_id` (`school_subj_id`),
  CONSTRAINT `schoolbooks_ibfk_1` FOREIGN KEY (`school_subj_id`) REFERENCES `school_subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolbooks`
--

LOCK TABLES `schoolbooks` WRITE;
/*!40000 ALTER TABLE `schoolbooks` DISABLE KEYS */;
INSERT INTO `schoolbooks` VALUES (1,3,'Математика. Базовый уровень. 6 класс','А.Н. Никифоров, Б.Ю. Шпиц','6'),(2,3,'Математика. Базовый уровень. 10 класс','А.Н. Никифоров, А.Е. Версталина','10'),(3,1,'История России. XIX век.','А. Д. Фёдоров, А.Н. Торкунов','9'),(4,2,'Русский язык','А. К. Иванов, А. Е. Однорог','7'),(5,6,'Химия. Базовый уровень','Б.И. Кресс','8'),(6,8,'Биология','В.В. Шилов','5');
/*!40000 ALTER TABLE `schoolbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `teacher_id` smallint unsigned NOT NULL,
  `specialization` varchar(120) DEFAULT NULL COMMENT 'Специальность (преподаваемые предметы)',
  `work_experience` tinyint unsigned NOT NULL COMMENT 'Стаж работы по специальности',
  `teach_num_employ_contr` bigint unsigned NOT NULL COMMENT 'Номер трудового договора учителя',
  `phone` bigint unsigned NOT NULL,
  UNIQUE KEY `teacher_id` (`teacher_id`),
  UNIQUE KEY `teach_num_employ_contr` (`teach_num_employ_contr`),
  UNIQUE KEY `phone` (`phone`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `team` (`id`),
  CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`teach_num_employ_contr`) REFERENCES `team` (`numb_employment_contract`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Учитель математики',20,1020304050,12345612345),(2,'Учитель истории',6,1020304051,12345612340),(4,'Учитель ОБЖ',11,1020304053,12345612389),(6,'Учитель русского языка и литературы',4,1020304055,12345612382),(8,'Учитель физической культуры',25,1020304057,12345612410),(9,'Учитель информатики',12,1020304058,12345612416),(10,'Учитель информатики',8,1020304059,12345615691);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `patronymic` varchar(50) DEFAULT NULL COMMENT 'Отчество',
  `lastname` varchar(50) DEFAULT NULL COMMENT 'Фамилия',
  `birthday` date DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL COMMENT 'Образование',
  `numb_employment_contract` bigint unsigned NOT NULL COMMENT 'Номер трудового договора',
  `in_ipa` char(14) DEFAULT NULL COMMENT 'СНИЛС члена коллектива',
  `tin` char(12) DEFAULT NULL COMMENT 'ИНН члена коллектива',
  `email` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numb_employment_contract` (`numb_employment_contract`),
  UNIQUE KEY `in_ipa` (`in_ipa`),
  UNIQUE KEY `tin` (`tin`),
  UNIQUE KEY `email` (`email`),
  KEY `team_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Сергей','Иванович','Дементьев','1977-02-02','СпбГУ',1020304050,'123-123-123 12','123456789123','dementyev@yandex.ru'),(2,'Игорь','Андреевич','Игошин','1991-03-14','УрФУ',1020304051,'123-123-123 13','123456789124','igoshin@inbox.ru'),(3,'Мария','Дмитриевна','Саакян','1956-12-13','МГУ им. М.В. Ломоносова',1020304052,'123-123-123 14','123456789125','saakyan@yandex.ru'),(4,'Ольга','Евгеньевна','Добрякова','1986-11-30','ЛГУ',1020304053,'123-123-123 15','123456789126','dobryakova@yandex.ru'),(5,'Андрей','Ильич','Емельянов','1969-11-11','ГГПИ им. В.Г. Короленко',1020304054,'123-123-123 16','123456789127','emelyanov@yandex.ru'),(6,'Роман','Ревович','Азиатцев','1992-01-17','ГГПИ им. В.Г. Короленко',1020304055,'123-123-123 17','123456789128','roman_r@mail.ru'),(7,'Ангелина','Артуровна','Малахова','1980-04-01','КНИТУ',1020304056,'123-123-123 18','123456789129','malahova@mail.ru'),(8,'Наталия','Алексеевна','Пушкарская','1968-07-19','МГУ им. М.В. Ломоносова',1020304057,'123-123-123 19','123456789130','nataliya_p@mail.ru'),(9,'Илья','Самирович','Амадов','1982-10-03','ИжГТУ',1020304058,'123-123-123 20','123456789131','ilya_amadov@yandex.ru'),(10,'Анна','Александровна','Лучинская','1989-12-09','УрФУ',1020304059,'123-123-123 21','123456789132','anna_lu@yandex.ru');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-13  1:21:17
