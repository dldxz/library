-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `arrear_record`
--

DROP TABLE IF EXISTS `arrear_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arrear_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  `money` float NOT NULL,
  `overdue_date` date NOT NULL,
  `uid` varchar(255) NOT NULL,
  `ISBN` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `ISBN` (`ISBN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrear_record`
--

LOCK TABLES `arrear_record` WRITE;
/*!40000 ALTER TABLE `arrear_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrear_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `ISBN` varchar(255) NOT NULL,
  `bname` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `publish_house` varchar(255) NOT NULL,
  `is_rare` tinyint(1) NOT NULL,
  `book_type` varchar(255) NOT NULL,
  `is_Borrowed` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('978-1-879546-05-9','Reduced homogeneous application','Robert Lin Jr.','45','DeepSkyBlue',0,'Dictionary',0),('978-0-86176-129-6','Organic content-based challenge','Scott Hamilton','43','LightYellow',0,'Biography',0),('978-0-01-381007-0','Ergonomic cohesive open system','Erin Scott','42','SlateBlue',0,'Diary',0),('978-1-55352-408-3','Object-based zero tolerance moratorium','Melissa Willis','47','SlateBlue',0,'Art',0),('978-1-253-42192-7','Realigned impactful help-desk','Tanya Farmer','36','Aqua',0,'Biography',0),('978-0-230-83814-7','Multi-lateral actuating infrastructure','Justin Jordan','35','MediumSpringGreen',0,'Art',0),('978-0-270-08882-3','Customizable fault-tolerant initiative','Kirk Lawson','41','DarkSlateBlue',0,'Autobiography',0),('978-1-5293-4033-4','Optional next generation instruction set','Brian Clark','38','DeepSkyBlue',0,'Autobiography',0),('978-0-515-86950-7','Compatible regional emulation','Jessica Vazquez','41','MidnightBlue',0,'Autobiography',0),('978-0-8373-4917-6','Profound grid-enabled concept','Melanie Perkins','30','MediumVioletRed',0,'Diary',0),('978-0-13-543653-0','Optional optimizing architecture','Amy Hernandez','28','PaleVioletRed',0,'Cookbook',0),('978-0-285-23193-1','User-friendly contextually-based application','John Larsen','33','FireBrick',0,'Autobiography',0),('978-1-920198-82-4','Balanced modular installation','Nichole Johnson','21','Moccasin',0,'Art',0),('978-0-935957-43-3','Open-architected systemic parallelism','Kurt Swanson','40','DarkRed',0,'Art',0),('978-1-5002-8903-4','Synchronized transitional access','Glenn Williams','44','Turquoise',0,'Dictionary',0),('978-0-7606-7801-5','Switchable interactive access','Tyler Blanchard','31','DarkOrange',0,'Autobiography',0),('978-0-698-63346-9','Function-based object-oriented Graphic Interface','Maria Lewis','43','DarkOrange',0,'Autobiography',0),('978-1-4381-2002-7','Re-engineered 24/7 moratorium','Walter Taylor','49','HotPink',0,'Cookbook',0),('978-0-04-313017-9','Mandatory context-sensitive parallelism','Jessica Hamilton','35','DarkKhaki',0,'Diary',0),('978-0-7885-4280-0','Down-sized analyzing budgetary management','Paula Hubbard','22','MediumSpringGreen',0,'Autobiography',0),('978-0-7959-7627-8','Devolved system-worthy migration','Robin Moses','25','OrangeRed',0,'Diary',0),('978-1-105-02771-0','Persevering didactic success','Scott Wilson','35','Brown',0,'Art',0),('978-1-86483-262-4','Enterprise-wide maximized paradigm','Cindy Farmer MD','26','LightSeaGreen',0,'Dictionary',0),('978-1-5063-0256-0','Ergonomic demand-driven initiative','Adam Rosales','45','DarkBlue',0,'Cookbook',0),('978-1-908269-08-9','Customizable real-time flexibility','Tammy Torres','49','Black',0,'Diary',0),('978-1-9866-6306-9','Expanded optimizing superstructure','Francis Brewer','47','ForestGreen',0,'Cookbook',0),('978-0-7503-7576-4','Implemented well-modulated interface','Jesus Sheppard','48','DarkSalmon',0,'Cookbook',0),('978-1-08-449129-8','Pre-emptive coherent hierarchy','Richard Hurst','25','LightYellow',0,'Autobiography',0),('978-1-82867-343-0','Progressive interactive solution','Joel Jordan','43','AliceBlue',0,'Dictionary',0),('978-1-5221-6688-7','Fully-configurable 3rdgeneration standardization','Erica Baker','29','GreenYellow',0,'Biography',0),('978-1-64945-938-1','Virtual 24hour productivity','Lawrence Patrick','34','Salmon',0,'Autobiography',0),('978-1-01-154167-6','Future-proofed coherent leverage','Charlotte Camacho','46','Bisque',0,'Diary',0),('978-1-874144-15-1','Profound actuating project','Sabrina Smith','42','Brown',0,'Art',0),('978-1-912139-51-4','Switchable cohesive process improvement','Jackie Cooper','30','DarkGreen',0,'Dictionary',0),('978-1-80818-049-1','Multi-lateral modular parallelism','Alexis Anderson','22','DarkGreen',0,'Dictionary',0),('978-0-8127-0123-4','Object-based bi-directional challenge','Nicholas Zamora','29','GreenYellow',0,'Cookbook',0),('978-0-9532956-6-1','Visionary national framework','Vanessa Williams','48','Coral',0,'Cookbook',0),('978-1-00-298981-4','Exclusive heuristic algorithm','Pamela Smith','36','MediumPurple',0,'Dictionary',0),('978-0-460-90551-0','Digitized secondary instruction set','Mrs. Theresa Price','33','Brown',0,'Autobiography',0),('978-1-190-98013-6','Realigned intermediate initiative','Thomas Nelson','23','MediumBlue',0,'Diary',0),('978-0-13-951371-8','Reduced disintermediate paradigm','Shane Newton','45','ForestGreen',0,'Autobiography',0),('978-1-06-484833-3','Business-focused motivating initiative','Erika Cook','34','Violet',0,'Art',0),('978-0-04-927929-2','Multi-tiered directional hierarchy','Seth Bennett','32','LawnGreen',0,'Dictionary',0),('978-0-915588-71-8','Advanced national moderator','Carla Cook','23','Pink',0,'Art',0),('978-0-261-16618-9','Exclusive static productivity','Loretta Thomas','25','MediumSeaGreen',0,'Dictionary',0),('978-0-7807-3357-2','Extended non-volatile application','Mr. David Macdonald MD','38','FireBrick',0,'Cookbook',0),('978-1-163-97825-2','Robust homogeneous architecture','Troy Smith','38','Green',0,'Biography',0),('978-0-400-55799-1','Face-to-face stable alliance','Steven Shaffer','28','DarkGray',0,'Art',0),('978-1-60857-614-2','Re-engineered mission-critical conglomeration','Billy Smith','27','Orange',0,'Cookbook',0),('978-0-538-74133-0','Cloned maximized neural-net','Tiffany Young DDS','31','LavenderBlush',0,'Autobiography',0),('978-0-585-10108-8','Extended global parallelism','Beverly Moreno','25','PaleVioletRed',0,'Art',0),('978-1-336-95946-0','Diverse dedicated data-warehouse','Ashley Lewis','37','WhiteSmoke',0,'Diary',0),('978-0-379-95364-0','Streamlined optimal moderator','Jessica Washington','28','Lavender',0,'Art',0),('978-1-09-747781-4','Enhanced holistic matrix','Karen Dodson','32','Turquoise',0,'Autobiography',0),('978-1-02-984405-9','Self-enabling transitional hierarchy','April Carpenter','47','DarkGoldenRod',0,'Cookbook',0),('978-0-9835692-9-9','Object-based client-server attitude','Donna Gonzalez','38','Bisque',0,'Art',0),('978-0-13-545720-7','Assimilated even-keeled algorithm','John Adams','33','SaddleBrown',0,'Cookbook',0),('978-1-300-28878-7','Function-based mission-critical groupware','Sophia Walker','46','Violet',0,'Autobiography',0),('978-0-04-699202-6','Cloned fault-tolerant forecast','Kyle Hardy','37','Sienna',0,'Diary',0),('978-1-4527-7753-5','Multi-channeled asymmetric throughput','Heather Gray','30','LightSteelBlue',0,'Art',0),('978-0-276-55763-7','Switchable reciprocal instruction set','Michael Miller','20','Moccasin',0,'Cookbook',0),('978-0-290-43972-8','Exclusive motivating structure','Chad Walker','38','PaleGoldenRod',0,'Cookbook',0),('978-1-60265-832-5','Cloned actuating synergy','Michael White','24','Lavender',0,'Autobiography',0),('978-1-4370-0894-4','Multi-lateral logistical info-mediaries','Jessica Baker','31','Orchid',0,'Autobiography',0),('978-1-69833-208-6','Intuitive clear-thinking neural-net','Elizabeth Anderson','31','DarkRed',0,'Cookbook',0),('978-0-7745-4137-4','Total modular infrastructure','Julie Williams','21','DarkSlateBlue',0,'Dictionary',0),('978-0-87919-889-3','Fully-configurable systemic leverage','Adam Moreno','22','MediumAquaMarine',0,'Diary',0),('978-1-903830-55-0','Up-sized regional algorithm','Linda Brennan','45','SlateBlue',0,'Biography',0),('978-0-940976-90-0','Re-engineered client-server initiative','Carla Brown','26','Blue',0,'Autobiography',0),('978-0-561-41917-6','Diverse asynchronous leverage','Danielle Silva','36','DarkOrange',0,'Autobiography',0),('978-0-7173-2359-3','Automated regional artificial intelligence','Jordan Kaiser','45','Thistle',0,'Autobiography',0),('978-1-5392-4996-2','Grass-roots optimizing challenge','Zachary Pope','43','LightGoldenRodYellow',0,'Cookbook',0),('978-1-72624-429-9','Object-based impactful Graphical User Interface','Michael Daniels','23','LightGray',0,'Dictionary',0),('978-0-434-35991-2','Realigned asymmetric infrastructure','David Friedman','20','MediumTurquoise',0,'Diary',0),('978-1-972086-36-0','Compatible mission-critical benchmark','Marc Harris','47','CornflowerBlue',0,'Cookbook',0),('978-1-5458-3659-0','Multi-layered tangible utilization','Adrian Griffin','44','PaleTurquoise',0,'Dictionary',0),('978-0-311-85225-3','Monitored 6thgeneration firmware','Jason Gilmore','45','Gainsboro',0,'Biography',0),('978-0-13-133806-7','Adaptive dynamic hardware','Troy Bennett Jr.','21','Tomato',0,'Dictionary',0),('978-0-19-311349-7','Reduced system-worthy concept','Alexander Griffin','35','PaleTurquoise',0,'Cookbook',0),('978-1-935893-88-2','Robust even-keeled success','Samuel Robinson','27','Wheat',0,'Autobiography',0),('978-0-01-885141-2','Proactive didactic hardware','Michael Beard','26','Silver',0,'Art',0),('978-1-71636-890-5','Optional actuating firmware','Amy Dodson','33','MistyRose',0,'Art',0),('978-1-60071-239-5','Devolved eco-centric strategy','Deanna Miles DDS','42','Aqua',0,'Biography',0),('978-1-953880-61-1','Ergonomic even-keeled intranet','Michael Brown','20','PaleGreen',0,'Autobiography',0),('978-0-658-47294-7','Function-based neutral hub','Steven Patel','47','LawnGreen',0,'Biography',0),('978-1-873407-95-0','Open-architected bifurcated website','Jamie Moon','47','Lime',0,'Art',0),('978-1-78040-053-2','Automated systematic hub','Mark Skinner','30','LightSkyBlue',0,'Diary',0),('978-0-85157-218-5','Programmable discrete encryption','Barbara Anderson','36','Violet',0,'Biography',0),('978-0-2284-0858-1','Robust modular project','Brian Ramirez','28','GreenYellow',0,'Art',0),('978-1-4925-3381-8','Visionary optimal migration','Tara Mckee','50','HoneyDew',0,'Cookbook',0),('978-1-07-474087-0','Triple-buffered fresh-thinking time-frame','Jorge Mills','48','DarkSlateBlue',0,'Autobiography',0),('978-0-661-95631-1','Cloned disintermediate initiative','Scott Perkins','48','Orange',0,'Dictionary',0),('978-1-336-32920-1','Devolved homogeneous standardization','Hunter Young','34','LightPink',0,'Autobiography',0),('978-1-76056-633-3','Optional zero administration interface','Eugene Ramirez','39','MistyRose',0,'Cookbook',0),('978-0-7638-0470-1','Open-architected transitional Internet solution','Rita Harmon','20','SpringGreen',0,'Art',0),('978-1-06-249029-9','Optional zero tolerance open architecture','Jessica Green','49','BlanchedAlmond',0,'Art',0),('978-0-8495-9643-8','Ameliorated zero administration project','Jake Gonzalez','40','PaleVioletRed',0,'Autobiography',0),('978-1-77912-643-6','Function-based full-range capacity','Margaret Fernandez','47','LightGoldenRodYellow',0,'Biography',0),('978-1-124-03863-6','Assimilated homogeneous projection','Audrey Stone','31','SlateBlue',0,'Autobiography',0),('978-1-392-53844-9','Operative next generation alliance','Angela Taylor','31','MidnightBlue',0,'Cookbook',0);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow_record`
--

DROP TABLE IF EXISTS `borrow_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrow_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrowed` date NOT NULL,
  `returned` date DEFAULT NULL,
  `ISBN` varchar(255) NOT NULL,
  `uname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ISBN` (`ISBN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow_record`
--

LOCK TABLES `borrow_record` WRITE;
/*!40000 ALTER TABLE `borrow_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrow_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_record`
--

DROP TABLE IF EXISTS `inbound_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inbound_date` date NOT NULL,
  `uname` varchar(255) NOT NULL,
  `ISBN` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ISBN` (`ISBN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_record`
--

LOCK TABLES `inbound_record` WRITE;
/*!40000 ALTER TABLE `inbound_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_record`
--

DROP TABLE IF EXISTS `reserve_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `reserve_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ISBN` (`ISBN`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_record`
--

LOCK TABLES `reserve_record` WRITE;
/*!40000 ALTER TABLE `reserve_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserve_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `types` varchar(255) NOT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'dldxz','123456','admin'),(2,'charlotte88','35o4zn','schoolfellow'),(3,'briggshunter','9xvq0p','student'),(4,'tdonovan','3gusl8','schoolfellow'),(5,'michaelburns','l9gp9j','student'),(6,'sarafields','3j3umx','schoolfellow'),(7,'masonsmith','87w75l','schoolfellow'),(8,'nataliebailey','6uxk3m','teacher'),(9,'lauren07','mux73f','teacher'),(10,'jessica05','h03iep','student'),(11,'morganjennifer','c6ij1f','teacher'),(12,'andrewlane','e49t1v','student'),(13,'sroberts','zpl0rb','student'),(14,'sharonkeller','t7nsjz','schoolfellow'),(15,'keithaudrey','vw7gv4','teacher'),(16,'ifisher','7jq3r9','student'),(17,'hwilson','kjv0e0','teacher'),(18,'xpotts','054opj','student'),(19,'xgarrison','sg5vce','teacher'),(20,'paulsean','ocz8en','student'),(21,'gstanley','0w0kay','teacher'),(22,'kelly20','3df8xp','schoolfellow'),(23,'shannonsmith','6tu5hw','teacher'),(24,'lmcintyre','1ta9ke','schoolfellow'),(25,'stewartmelissa','b00wko','teacher'),(26,'david66','7gefgb','schoolfellow'),(27,'jeffreyallen','s7mfva','schoolfellow'),(28,'garciacristian','m3grcd','student'),(29,'ssalas','86w15k','schoolfellow'),(30,'loran','123','admin'),(31,'Tademzysy','456','admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-17 21:38:06
