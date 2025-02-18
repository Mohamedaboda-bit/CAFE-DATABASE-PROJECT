-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: Cafeteria
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'hot_drinks');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Product`
--

DROP TABLE IF EXISTS `Order_Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_Product` (
  `Product_ID` int NOT NULL,
  `Order_ID` tinyint NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`Product_ID`,`Order_ID`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `Order_Product_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `Order_Product_ibfk_2` FOREIGN KEY (`Order_ID`) REFERENCES `Orders` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Product`
--

LOCK TABLES `Order_Product` WRITE;
/*!40000 ALTER TABLE `Order_Product` DISABLE KEYS */;
INSERT INTO `Order_Product` VALUES (1,1,2),(1,2,2),(1,3,2),(2,1,2),(2,2,2);
/*!40000 ALTER TABLE `Order_Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `ID` tinyint NOT NULL AUTO_INCREMENT,
  `Notes` varchar(100) DEFAULT NULL,
  `Status` enum('Prossing','Done','Delivering') DEFAULT NULL,
  `Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `Customer_ID` tinyint DEFAULT NULL,
  `Room_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Room_ID` (`Room_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`Room_ID`) REFERENCES `Room` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `User` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,'3bod','Delivering','2025-02-18 04:47:29',5,1),(2,'diab','Prossing','2025-02-18 04:47:52',6,1),(3,'diab','Prossing','2025-02-18 04:51:23',6,1);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL,
  `Category_ID` int DEFAULT NULL,
  `Status` enum('Available','Not_available') DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Category_ID` (`Category_ID`),
  CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `Category` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'tea',1,'Available',10,'/uploads/tea.png'),(2,'cofe',1,'Available',15,'/uploads/tea.png');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (2,'1000'),(1,'1001'),(3,'1002');
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `ID` tinyint NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Ext_no` varchar(4) DEFAULT NULL,
  `Role` enum('Admin','User') DEFAULT NULL,
  `Password` varchar(60) DEFAULT NULL,
  `Room_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Room_ID` (`Room_ID`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`Room_ID`) REFERENCES `Room` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (4,'KISS MY SPEAR 0#EUNE','uploads/Screenshot from 2025-02-15 19-30-02.png','mohamedabod477@gmail.com','1001','User','$2y$10$46WKF0gRBbnZFgdCpYtgBeD/ybuooET1oe67layCekyb69uOpBZLe',3),(5,'abahl','uploads/Screenshot from 2025-02-16 10-39-54.png','mohamedabod477@gmail.com','132','User','$2y$10$yDc390tlV1Mgu8JreFzZNuwDmuUvYZQ7VVZokdSMSms7WbHkLL8WG',3),(6,'mohamed','uploads/Screenshot from 2025-02-15 19-30-02.png','mohamedabod477@gmail.com','1001','User','$2y$10$qoazprpRHs6qYCFbjrSlIOXQPIEC8NaLu9JpYYx9FywHFKPupwe6q',1);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_amount`
--

DROP TABLE IF EXISTS `order_amount`;
/*!50001 DROP VIEW IF EXISTS `order_amount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_amount` AS SELECT 
 1 AS `Date`,
 1 AS `amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `order_proccssing`
--

DROP TABLE IF EXISTS `order_proccssing`;
/*!50001 DROP VIEW IF EXISTS `order_proccssing`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_proccssing` AS SELECT 
 1 AS `Date`,
 1 AS `name`,
 1 AS `Ext_no`,
 1 AS `room`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `order_proccssings`
--

DROP TABLE IF EXISTS `order_proccssings`;
/*!50001 DROP VIEW IF EXISTS `order_proccssings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_proccssings` AS SELECT 
 1 AS `Date`,
 1 AS `name`,
 1 AS `Ext_no`,
 1 AS `ID`,
 1 AS `room`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_total_amount`
--

DROP TABLE IF EXISTS `user_total_amount`;
/*!50001 DROP VIEW IF EXISTS `user_total_amount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_total_amount` AS SELECT 
 1 AS `total_amount`,
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `order_amount`
--

/*!50001 DROP VIEW IF EXISTS `order_amount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_amount` AS select `Orders`.`Date` AS `Date`,sum((`Product`.`Price` * `Order_Product`.`quantity`)) AS `amount` from ((`Orders` join `Order_Product` on((`Order_Product`.`Order_ID` = `Orders`.`ID`))) join `Product` on((`Order_Product`.`Product_ID` = `Product`.`ID`))) group by `Orders`.`Date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_proccssing`
--

/*!50001 DROP VIEW IF EXISTS `order_proccssing`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_proccssing` AS select `Orders`.`Date` AS `Date`,`User`.`Name` AS `name`,`User`.`Ext_no` AS `Ext_no`,(select `get_room`(`Orders`.`Room_ID`)) AS `room` from (`User` join `Orders` on((`User`.`ID` = `Orders`.`Customer_ID`))) where (`Orders`.`Status` = 'Prossing') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_proccssings`
--

/*!50001 DROP VIEW IF EXISTS `order_proccssings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_proccssings` AS select `Orders`.`Date` AS `Date`,`User`.`Name` AS `name`,`User`.`Ext_no` AS `Ext_no`,`Orders`.`ID` AS `ID`,(select `get_room`(`Orders`.`Room_ID`)) AS `room` from (`User` join `Orders` on((`User`.`ID` = `Orders`.`Customer_ID`))) where (`Orders`.`Status` = 'Prossing') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_total_amount`
--

/*!50001 DROP VIEW IF EXISTS `user_total_amount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_total_amount` AS select sum((`Product`.`Price` * `Order_Product`.`quantity`)) AS `total_amount`,`User`.`Name` AS `Name` from (((`Orders` join `User` on((`Orders`.`Customer_ID` = `User`.`ID`))) join `Order_Product` on((`Order_Product`.`Order_ID` = `Orders`.`ID`))) join `Product` on((`Order_Product`.`Product_ID` = `Product`.`ID`))) group by `User`.`Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-18  8:49:17
