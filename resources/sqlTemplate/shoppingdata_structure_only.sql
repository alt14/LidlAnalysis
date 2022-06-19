CREATE DATABASE  IF NOT EXISTS `shoppingdata` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shoppingdata`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: shoppingdata
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Temporary view structure for view `item_info`
--

DROP TABLE IF EXISTS `item_info`;
/*!50001 DROP VIEW IF EXISTS `item_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `item_info` AS SELECT 
 1 AS `idpurchased_items`,
 1 AS `ItemName`,
 1 AS `NumberOfUnits`,
 1 AS `Unit`,
 1 AS `TotalPriceIncludingDiscount`,
 1 AS `TotalDiscount`,
 1 AS `TotalPriceBeforeDiscount`,
 1 AS `PricePerUnitBeforeDiscount`,
 1 AS `PricePerUnitIncludingDiscount`,
 1 AS `TaxStatus`,
 1 AS `VisitID`,
 1 AS `idItemNames`,
 1 AS `FriendlyName`,
 1 AS `IsFood`,
 1 AS `IsVeg`,
 1 AS `IsFruit`,
 1 AS `IsFavourite`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `idItemNames` int NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(80) DEFAULT NULL COMMENT 'Without spaces',
  `FriendlyName` varchar(255) DEFAULT NULL COMMENT 'CSV of how it appears on receipt. No spaces.',
  `IsFood` tinyint(1) DEFAULT NULL,
  `IsVeg` tinyint(1) DEFAULT NULL,
  `IsFavourite` tinyint(1) DEFAULT NULL,
  `IsFruit` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idItemNames`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='For looking up the Item Name of printed names. Printed names is CSV. ItemNames are unique in this table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `price_and_date`
--

DROP TABLE IF EXISTS `price_and_date`;
/*!50001 DROP VIEW IF EXISTS `price_and_date`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `price_and_date` AS SELECT 
 1 AS `idpurchased_items`,
 1 AS `ItemName`,
 1 AS `PricePerUnitBeforeDiscount`,
 1 AS `PricePerUnitIncludingDiscount`,
 1 AS `VisitID`,
 1 AS `Timestamp`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `purchased_items`
--

DROP TABLE IF EXISTS `purchased_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchased_items` (
  `idpurchased_items` int NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(45) DEFAULT NULL COMMENT 'With Spaces',
  `NumberOfUnits` decimal(5,3) DEFAULT NULL COMMENT 'See items.unit for what the unit is',
  `Unit` varchar(45) DEFAULT NULL COMMENT 'kg, each',
  `TotalPriceIncludingDiscount` decimal(5,2) DEFAULT NULL COMMENT 'Total amount paid for item(s) - may be multiple. £.',
  `TotalDiscount` decimal(5,2) DEFAULT NULL COMMENT 'e.g. £2 off or 15% off. £',
  `TaxStatus` varchar(45) DEFAULT NULL COMMENT 'A or B',
  `VisitID` int DEFAULT NULL,
  PRIMARY KEY (`idpurchased_items`)
) ENGINE=InnoDB AUTO_INCREMENT=2247 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='1 record for each receipt line item.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `purchased_items_and_visit`
--

DROP TABLE IF EXISTS `purchased_items_and_visit`;
/*!50001 DROP VIEW IF EXISTS `purchased_items_and_visit`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `purchased_items_and_visit` AS SELECT 
 1 AS `idpurchased_items`,
 1 AS `ItemName`,
 1 AS `NumberOfUnits`,
 1 AS `Unit`,
 1 AS `TotalPriceIncludingDiscount`,
 1 AS `TotalDiscount`,
 1 AS `TaxStatus`,
 1 AS `VisitID`,
 1 AS `Timestamp`,
 1 AS `TotalSpend`,
 1 AS `SpendTaxedA`,
 1 AS `SpendTaxedB`,
 1 AS `Location`,
 1 AS `NumberOfItems`,
 1 AS `NumberOfUniqueItems`,
 1 AS `TotalTripDiscount`,
 1 AS `ReceiptImagePath`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `idvisits` int NOT NULL AUTO_INCREMENT,
  `Timestamp` datetime DEFAULT NULL COMMENT 'Timestamp on receipt i.e. when paid',
  `TotalSpend` decimal(5,2) DEFAULT NULL COMMENT 'Including any discounts.',
  `SpendTaxedA` decimal(5,2) DEFAULT NULL,
  `SpendTaxedB` decimal(5,2) DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL COMMENT 'e.g. Dursley',
  `NumberOfItems` int DEFAULT NULL COMMENT 'Number of items (repeats counted seperately)',
  `NumberOfUniqueItems` int DEFAULT NULL,
  `TotalDiscount` decimal(5,2) DEFAULT NULL COMMENT '£',
  `ReceiptImagePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idvisits`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='1 row for each receipt.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'shoppingdata'
--

--
-- Final view structure for view `item_info`
--

/*!50001 DROP VIEW IF EXISTS `item_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `item_info` AS select `purchased_items`.`idpurchased_items` AS `idpurchased_items`,`purchased_items`.`ItemName` AS `ItemName`,`purchased_items`.`NumberOfUnits` AS `NumberOfUnits`,`purchased_items`.`Unit` AS `Unit`,`purchased_items`.`TotalPriceIncludingDiscount` AS `TotalPriceIncludingDiscount`,`purchased_items`.`TotalDiscount` AS `TotalDiscount`,(`purchased_items`.`TotalPriceIncludingDiscount` + `purchased_items`.`TotalDiscount`) AS `TotalPriceBeforeDiscount`,round(((`purchased_items`.`TotalPriceIncludingDiscount` + `purchased_items`.`TotalDiscount`) / `purchased_items`.`NumberOfUnits`),2) AS `PricePerUnitBeforeDiscount`,round((`purchased_items`.`TotalPriceIncludingDiscount` / `purchased_items`.`NumberOfUnits`),2) AS `PricePerUnitIncludingDiscount`,`purchased_items`.`TaxStatus` AS `TaxStatus`,`purchased_items`.`VisitID` AS `VisitID`,`items`.`idItemNames` AS `idItemNames`,`items`.`FriendlyName` AS `FriendlyName`,`items`.`IsFood` AS `IsFood`,`items`.`IsVeg` AS `IsVeg`,`items`.`IsFruit` AS `IsFruit`,`items`.`IsFavourite` AS `IsFavourite` from (`purchased_items` left join `items` on((`purchased_items`.`ItemName` = `items`.`ItemName`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `price_and_date`
--

/*!50001 DROP VIEW IF EXISTS `price_and_date`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `price_and_date` AS select `purchased_items`.`idpurchased_items` AS `idpurchased_items`,`purchased_items`.`ItemName` AS `ItemName`,round(((`purchased_items`.`TotalPriceIncludingDiscount` + `purchased_items`.`TotalDiscount`) / `purchased_items`.`NumberOfUnits`),2) AS `PricePerUnitBeforeDiscount`,round((`purchased_items`.`TotalPriceIncludingDiscount` / `purchased_items`.`NumberOfUnits`),2) AS `PricePerUnitIncludingDiscount`,`purchased_items`.`VisitID` AS `VisitID`,`visits`.`Timestamp` AS `Timestamp` from ((`purchased_items` left join `items` on((`purchased_items`.`ItemName` = `items`.`ItemName`))) left join `visits` on((`purchased_items`.`VisitID` = `visits`.`idvisits`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `purchased_items_and_visit`
--

/*!50001 DROP VIEW IF EXISTS `purchased_items_and_visit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `purchased_items_and_visit` AS select `purchased_items`.`idpurchased_items` AS `idpurchased_items`,`purchased_items`.`ItemName` AS `ItemName`,`purchased_items`.`NumberOfUnits` AS `NumberOfUnits`,`purchased_items`.`Unit` AS `Unit`,`purchased_items`.`TotalPriceIncludingDiscount` AS `TotalPriceIncludingDiscount`,`purchased_items`.`TotalDiscount` AS `TotalDiscount`,`purchased_items`.`TaxStatus` AS `TaxStatus`,`purchased_items`.`VisitID` AS `VisitID`,`visits`.`Timestamp` AS `Timestamp`,`visits`.`TotalSpend` AS `TotalSpend`,`visits`.`SpendTaxedA` AS `SpendTaxedA`,`visits`.`SpendTaxedB` AS `SpendTaxedB`,`visits`.`Location` AS `Location`,`visits`.`NumberOfItems` AS `NumberOfItems`,`visits`.`NumberOfUniqueItems` AS `NumberOfUniqueItems`,`visits`.`TotalDiscount` AS `TotalTripDiscount`,`visits`.`ReceiptImagePath` AS `ReceiptImagePath` from (`purchased_items` left join `visits` on((`purchased_items`.`VisitID` = `visits`.`idvisits`))) */;
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

-- Dump completed on 2022-06-19 14:55:58
