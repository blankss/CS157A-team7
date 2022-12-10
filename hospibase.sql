-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: hospibase
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `administers`
--

DROP TABLE IF EXISTS `administers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administers` (
  `idAdmin` int NOT NULL,
  `idRoom` int NOT NULL,
  PRIMARY KEY (`idAdmin`,`idRoom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administers`
--

LOCK TABLES `administers` WRITE;
/*!40000 ALTER TABLE `administers` DISABLE KEYS */;
INSERT INTO `administers` VALUES (1,1),(1,3),(1,9),(1,11),(1,13),(2,10),(2,12),(3,6),(4,4),(4,7),(9,8),(9,14),(10,2),(11,5);
/*!40000 ALTER TABLE `administers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Appointment`
--

DROP TABLE IF EXISTS `Appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Appointment` (
  `idAppointment` int NOT NULL AUTO_INCREMENT,
  `patientName` varchar(80) DEFAULT NULL,
  `appointmentDateTime` datetime DEFAULT NULL,
  `idPatient` int DEFAULT NULL,
  `idAppointmentDoctor` int DEFAULT NULL,
  PRIMARY KEY (`idAppointment`),
  KEY `idPatient_idx` (`idPatient`),
  KEY `idDoctor_idx` (`idAppointmentDoctor`),
  CONSTRAINT `idAppointmentDoctor` FOREIGN KEY (`idAppointmentDoctor`) REFERENCES `Doctor` (`idDoctor`),
  CONSTRAINT `idPatient` FOREIGN KEY (`idPatient`) REFERENCES `Patient` (`idPatient`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointment`
--

LOCK TABLES `Appointment` WRITE;
/*!40000 ALTER TABLE `Appointment` DISABLE KEYS */;
INSERT INTO `Appointment` VALUES (1,'Natalie Kora','2022-10-10 12:00:00',1,1),(2,'Amy Sanchez','2022-10-10 12:30:00',2,1),(3,'Ivy Noel','2022-10-12 13:15:00',3,2),(4,'Eli Sanchez','2022-10-14 15:30:00',4,3),(5,'Richard Nelson','2022-10-14 16:00:00',5,5),(6,'Nicholas June','2022-10-18 14:45:00',10,6),(7,'Natalie Kora','2022-10-19 12:00:00',1,1),(8,'Joshua Gonzales','2022-10-20 15:45:00',8,9),(9,'Freya Kora','2022-10-24 16:30:00',6,7),(10,'Alan Nora','2022-10-31 13:45:00',9,1),(14,'Nicholas June','2022-11-18 12:15:00',10,6),(15,'Natalie Kora','2022-12-01 16:25:00',1,1),(16,'Natalie Kora','2022-12-02 14:10:00',1,1),(17,'Matthew','2022-12-02 12:45:00',12,2),(19,'Natalie','2022-12-12 10:00:00',1,1);
/*!40000 ALTER TABLE `Appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Doctor` (
  `idDoctor` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `specialization` varchar(60) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDoctor`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
INSERT INTO `Doctor` VALUES (1,'Lily','Scotty','Pediatrics','lilys','GzeGjx'),(2,'Katherine','Elsher','Neurology','katherineE','DqwxaM'),(3,'Lincoln','McKenna','Pediatrics','lincolnpark','Pliigr'),(4,'Trinity','Cullen','Pediatrics','trinitylock','cullen1!'),(5,'Alayna','Anderson','Immunology','alaynaology','8OD1kS'),(6,'Harrison','Nora','Internal Medicine','norasmoke','0iLtZe'),(7,'Melanie','Melenia','Internal Medicine','malenia','#shattering'),(8,'Chase','Solace','Urologist','solstice','winter4!@'),(9,'Ian','June','Pathology','ijuly','SoaGSk'),(10,'Tristan','Clark','Heart surgeon','clarkent','superman6');
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipment` (
  `idequipment` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `equipCondition` varchar(45) DEFAULT NULL,
  `idAdmin` int DEFAULT NULL,
  PRIMARY KEY (`idequipment`),
  UNIQUE KEY `idequipment_UNIQUE` (`idequipment`),
  KEY `idAdmin_idx` (`idAdmin`),
  CONSTRAINT `idAdmin` FOREIGN KEY (`idAdmin`) REFERENCES `hospitaladministrators` (`idAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES (1,11,'working',1),(2,10,'new',2),(3,15,'new',2),(4,21,'working',4),(5,9,'new',5),(6,20,'new',6),(7,14,'needs repairs',7),(8,88,'working',8),(9,3,'needs repair',9),(10,50,'broken',10),(11,10,'working',1),(12,84,'repair',4);
/*!40000 ALTER TABLE `Equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has a`
--

DROP TABLE IF EXISTS `has a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has a` (
  `idPatient` int NOT NULL,
  `idMedicalHistory` varchar(45) NOT NULL,
  PRIMARY KEY (`idPatient`,`idMedicalHistory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has a`
--

LOCK TABLES `has a` WRITE;
/*!40000 ALTER TABLE `has a` DISABLE KEYS */;
INSERT INTO `has a` VALUES (1,'2'),(2,'1'),(3,'3'),(4,'6'),(5,'8'),(6,'4'),(7,'5'),(8,'7'),(9,'9'),(10,'10');
/*!40000 ALTER TABLE `has a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Health Plan`
--

DROP TABLE IF EXISTS `Health Plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Health Plan` (
  `idPlan` int NOT NULL,
  `planName` varchar(45) DEFAULT NULL,
  `planCost` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`idPlan`),
  UNIQUE KEY `planName_UNIQUE` (`planName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Health Plan`
--

LOCK TABLES `Health Plan` WRITE;
/*!40000 ALTER TABLE `Health Plan` DISABLE KEYS */;
INSERT INTO `Health Plan` VALUES (1001,'Kaiser',400.50),(1002,'Blue Shield',601.53),(1003,'Amerigroup',396.78),(1004,'Cigna',485.00),(1005,'Health Net',413.54),(1006,'Medi-Cal',487.57),(1007,'Sutter Health',418.44),(1008,'Humana',644.15),(1009,'Molina',352.45),(1010,'Aetna',256.20);
/*!40000 ALTER TABLE `Health Plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitaladministrators`
--

DROP TABLE IF EXISTS `hospitaladministrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospitaladministrators` (
  `idAdmin` int NOT NULL AUTO_INCREMENT,
  `adminName` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `loggedin` tinyint NOT NULL,
  PRIMARY KEY (`idAdmin`),
  UNIQUE KEY `idAdmin_UNIQUE` (`idAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitaladministrators`
--

LOCK TABLES `hospitaladministrators` WRITE;
/*!40000 ALTER TABLE `hospitaladministrators` DISABLE KEYS */;
INSERT INTO `hospitaladministrators` VALUES (1,'Megan','meg1','r@!nydaze115',1),(2,'Travis','trlee48','n0tn(_)1l',1),(3,'Natalia','narios21','34p!edra',0),(4,'Steven','ststevens01','m0stgo@ts!',0),(5,'Kelvin','keburns68','53degree$',0),(6,'Juan','juhill91','mh@v3is',0),(7,'Noor','noisa29','aren@5h07',0),(8,'Hope','howilliams42','sit30ft3ar5',0),(9,'Esteban','esuribe56','aalmp#72',0),(10,'Drake','drpato57','3/@ding',0),(11,'Lily','lilys','GzeGjx',0),(12,'Katherine','katherineE','DqwxaM',0),(13,'Lincoln','lincolnpark','Pliigr',0),(14,'Trinity','trinitylock','cullen1!',0),(15,'Alayna','alaynaology','8OD1kS',0),(16,'Harrison','norasmoke','0iLtZe',0),(17,'Melanie','malenia','#shattering',0),(18,'Chase','solstice','winter4!@',0),(19,'Ian','ijuly','SoaGSk',0),(20,'Tristan','clarkent','superman6',0),(21,'Dominic','dom1','erkledirk',1),(22,'Donovan','donny','12345678',1),(26,'Mob','mob123','12345678',1);
/*!40000 ALTER TABLE `hospitaladministrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HospitalRooms`
--

DROP TABLE IF EXISTS `HospitalRooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HospitalRooms` (
  `roomNumber` int NOT NULL AUTO_INCREMENT,
  `roomCost` int DEFAULT NULL,
  `roomCondition` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roomNumber`),
  UNIQUE KEY `roomNumber_UNIQUE` (`roomNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HospitalRooms`
--

LOCK TABLES `HospitalRooms` WRITE;
/*!40000 ALTER TABLE `HospitalRooms` DISABLE KEYS */;
INSERT INTO `HospitalRooms` VALUES (1,50,'clean'),(2,50,'dirty'),(3,50,'clean'),(4,50,'needs repairs'),(5,50,'needs repairs'),(6,50,'dirty'),(7,50,'needs repairs'),(8,50,'needs repairs'),(9,50,'clean'),(10,50,'clean'),(11,100,'new'),(12,40,'new'),(13,100,'new'),(14,100,'working');
/*!40000 ALTER TABLE `HospitalRooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medical History`
--

DROP TABLE IF EXISTS `Medical History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medical History` (
  `idHistory` int NOT NULL AUTO_INCREMENT,
  `medications` varchar(100) DEFAULT NULL,
  `symptoms` varchar(100) DEFAULT NULL,
  `surgeries` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idHistory`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medical History`
--

LOCK TABLES `Medical History` WRITE;
/*!40000 ALTER TABLE `Medical History` DISABLE KEYS */;
INSERT INTO `Medical History` VALUES (1,'Advil','Headache',NULL),(2,'antibiotics','abdominal pains','general surgery'),(3,'flurbiprofen','gallstones','general surgery'),(4,'Cetuximab','blood in throat - throat cancer','thoracic surgery'),(5,'Cetuximab','blood in stool','colon'),(6,'tylenol','high fever',NULL),(7,NULL,'eyesight vision disorders','Ophthalmic'),(8,'opiods','immobile hands','hand'),(9,'fentanyl','spine degernation','spine'),(10,'steroids','brain tumor','neuraloglical');
/*!40000 ALTER TABLE `Medical History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medication`
--

DROP TABLE IF EXISTS `Medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medication` (
  `idMedication` int NOT NULL AUTO_INCREMENT,
  `medicationCost` decimal(8,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  `idDoctor` int DEFAULT NULL,
  `idPatient` int DEFAULT NULL,
  PRIMARY KEY (`idMedication`),
  KEY `idDoctor_idx` (`idDoctor`),
  CONSTRAINT `idDoctor` FOREIGN KEY (`idDoctor`) REFERENCES `Doctor` (`idDoctor`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medication`
--

LOCK TABLES `Medication` WRITE;
/*!40000 ALTER TABLE `Medication` DISABLE KEYS */;
INSERT INTO `Medication` VALUES (1,40.00,140,'Duramed',2,1),(2,10.00,300,'Wyeth Pharmaceuticals',3,2),(3,75.00,200,'Nono Nordisk',7,3),(4,400.00,300,'PurduePharma',3,4),(5,130.00,350,'Abbott',1,5),(6,125.00,190,'Viatris Specialty',7,6),(7,65.00,50,'Abbvie',1,7),(8,400.00,90,'Viatris Specialty',7,8),(9,105000.00,40,'Porton Biopharm Limited',3,9),(10,23.00,230,'Camber Pharma',5,10),(11,55.55,234,'Duramed',NULL,NULL),(12,789.34,90,'Abbott',NULL,NULL);
/*!40000 ALTER TABLE `Medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patient` (
  `idPatient` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(10) DEFAULT NULL,
  `dateOfBirth` datetime DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `idDoctor` int NOT NULL,
  `idPlan` int DEFAULT NULL,
  `idMedication` int DEFAULT NULL,
  `idHistory` int DEFAULT NULL,
  PRIMARY KEY (`idPatient`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `idDoctor_idx` (`idDoctor`),
  KEY `idPlan_idx` (`idPlan`),
  KEY `idMedication_idx` (`idMedication`),
  CONSTRAINT `idMedication` FOREIGN KEY (`idMedication`) REFERENCES `Medication` (`idMedication`),
  CONSTRAINT `idPlan` FOREIGN KEY (`idPlan`) REFERENCES `Health Plan` (`idPlan`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (1,'Natalie','Kora','1424462552','1952-08-01 01:43:10','koraNat','lsadMO',1,1001,1,2),(2,'Amy','Sanchez','1804614495','2001-05-18 12:14:09','sanchezbar','pRonfo',1,1001,3,1),(3,'Ivy','Noel','1850800737','1983-06-20 10:04:56','ivyleague','ArdAHO',2,1009,4,3),(4,'Eli','Sanchez','1304455840','1984-08-17 11:56:34','elijah','DvyNfY',3,1010,6,6),(5,'Richard','Nelson','1544519021','2002-12-13 23:45:00','comet','aBhpDF',5,1007,9,8),(6,'Freya','Kora','1757715615','1980-09-30 23:59:00','freyja','#79Tk8',7,1004,7,4),(7,'Mackenzie','Campbell','1412441396','1999-07-05 12:12:43','maccies','aV89#2',8,1002,1,5),(8,'Joshua','Gonzales','1505384656','1990-01-29 12:12:12','joshin','fT&295',9,1005,1,7),(9,'Alan','Nora','1572369357','1995-09-05 01:23:32','noalan','EhouSt',1,1007,7,9),(10,'Nicholas','June','8452755099','1991-10-16 03:45:31','captnick','blitNE',6,1002,5,10),(12,'Matty','Chan','null','1990-08-08 00:00:00','null','654321',2,NULL,NULL,NULL),(13,'Mike','Wu',NULL,NULL,'mikew','mikewu123456',3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientbill`
--

DROP TABLE IF EXISTS `patientbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patientbill` (
  `idbill` int NOT NULL,
  `medicationcost` int DEFAULT NULL,
  `roomcost` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `idpatient` int DEFAULT NULL,
  PRIMARY KEY (`idbill`),
  UNIQUE KEY `idbill_UNIQUE` (`idbill`),
  KEY `idpatients_idx` (`idpatient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientbill`
--

LOCK TABLES `patientbill` WRITE;
/*!40000 ALTER TABLE `patientbill` DISABLE KEYS */;
INSERT INTO `patientbill` VALUES (1,0,0,0,1),(2,98,350,0,2),(3,500,3200,2300,3),(4,350,5032,5382,9),(5,334,0,82,2),(6,776,6090,6566,10),(7,2349,1500,3849,7),(8,2000,120000,122000,3),(9,124,0,124,2),(10,477,13700,12277,1);
/*!40000 ALTER TABLE `patientbill` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-09 21:14:57
