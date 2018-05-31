-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: DBMS_Project
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `Disease`
--

DROP TABLE IF EXISTS `Disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Disease` (
  `DID` int(11) NOT NULL AUTO_INCREMENT,
  `DName` varchar(20) NOT NULL,
  `SArray` varchar(50) NOT NULL,
  PRIMARY KEY (`DID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disease`
--

LOCK TABLES `Disease` WRITE;
/*!40000 ALTER TABLE `Disease` DISABLE KEYS */;
INSERT INTO `Disease` VALUES (1,'Brain Tumor','headache,vomiting,seizures'),(2,'Common Cold','cough,runny nose,sore throat,sneezing'),(3,'Dengue','fever,headache,muscle pain'),(4,'Diabetes','dehydration,hunger,increased urination'),(5,'Flu','fever,chills,cough,headache,fatigue'),(6,'Lung Cancer','cough,breath shortness,wheezing,chest pain'),(7,'Pneumonia','cough,breath shortness,fever');
/*!40000 ALTER TABLE `Disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctor` (
  `DocID` int(11) NOT NULL AUTO_INCREMENT,
  `DocName` varchar(20) NOT NULL,
  `HID` int(11) NOT NULL,
  `Speciality` varchar(50) NOT NULL,
  `Contact` varchar(11) DEFAULT NULL,
  `Degree` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`DocID`),
  KEY `HID` (`HID`),
  CONSTRAINT `Doctor_ibfk_1` FOREIGN KEY (`HID`) REFERENCES `Hospital` (`HID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
INSERT INTO `Doctor` VALUES (1,'Dr S M Jadhav',4,'Diabetes','9876543210',NULL),(2,'Dr K P Agarwal',2,'Flu,Diabetes,Brain Tumor','5469831257',NULL),(3,'Dr R N Singal',1,'Common Cold,Flu','1586497215',NULL),(4,'Dr R N Sawant',6,'Flu,Dengue,Pneumonia','7364218657',NULL),(5,'Dr P S Nikam',5,'Common Cold,Lung Cancer','9853164720',NULL),(6,'Dr H C Verma',3,'Brain Tumor,Lung Cancer,Diabetes','9856472168',NULL),(7,'Dr A P Sharma',4,'Common Cold,Pneumonia','9164852347',NULL),(8,'Dr K R Jain',1,'Diabetes,Brain Tumor','7154862957',NULL),(9,'Dr U V Potdar',6,'Brain Tumor','8731654892',NULL),(10,'Dr K C Chandra',4,'Lung Cancer','7754882651',NULL),(11,'Dr A S Mahajan',3,'Common Cold,Lung Cancer','9865123490',NULL),(12,'Dr H K Deshpande',2,'Pneumonia,Dengue','7875496251',NULL),(13,'Dr P S Golait',5,'Dengue,Flu','9845716325',NULL),(14,'Dr A R Pophale',7,'Dengue,Pneumonia','9153246872','MBBS');
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hospital`
--

DROP TABLE IF EXISTS `Hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hospital` (
  `HID` int(11) NOT NULL AUTO_INCREMENT,
  `HName` varchar(40) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Contact` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`HID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hospital`
--

LOCK TABLES `Hospital` WRITE;
/*!40000 ALTER TABLE `Hospital` DISABLE KEYS */;
INSERT INTO `Hospital` VALUES (1,'Krishna Hospital','Pune','2 Anjanwel Prashant Society,Paud Road','02025965867'),(2,'Nanavati Hospital','Mumbai','S.V. Road Vile Parle','02229517863'),(3,'Avanti Hospital','Nagpur','157, Abhyankar Marg, Dhantoli','07123196487'),(4,'Sahyadri Hospital','Pune','Plot No. 9-B, Opp. Vanaz Factory,Neena Society','02024324617'),(5,'Kohinoor Hospital','Mumbai','Kirol Road, Off LBS Road, Kurla West Kurla','02229616248'),(6,'Lata Mangeshkar Hospital','Nagpur','Ymca Complex, Maharajbagh Road, Sitabuldi','07129545314'),(7,'Fortis Hospital','Mumbai','Mini Sea Shore Road, Sector 10, Vashi, Navi Mumbai','02258762481'),(8,'Rubi Hall','Pune','40, Sassoon Road, Pune','02026163391');
/*!40000 ALTER TABLE `Hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient` (
  `Name` varchar(30) NOT NULL,
  `Contact` varchar(12) NOT NULL,
  `Age` int(11) NOT NULL,
  `Weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-01  7:11:51
