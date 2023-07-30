
-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: AIRPORT_MANAGEMENT_DB
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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
-- Table structure for table `DEPARTMENT`
--
DROP DATABASE IF EXISTS `AIRPORT_MANAGEMENT_DB`;
CREATE SCHEMA `AIRPORT_MANAGEMENT_DB`;
USE `AIRPORT_MANAGEMENT_DB`;

--
-- Table structure for table `AIRPORT`
--
DROP TABLE IF EXISTS `AIRPORT`;
create table `AIRPORT` (
    `Name` varchar(50) NOT NULL,
    `Airport_code` varchar(3) NOT NULL,
    `Type` varchar(20) NOT NULL,
    `Country` varchar(50) NOT NULL,
    PRIMARY KEY (`Airport_code`),
    UNIQUE (`Airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AIRPORT`
--

LOCK TABLES `AIRPORT` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `AIRPORT` VALUES
('Rajiv Gandhi', 'HYD', 'International', 'India'),
('Kempegowda', 'BLR', 'International', 'India'),
('Changi Airport', 'SIN', 'International', 'Singapore'),
('Haneda Airport', 'HND', 'International', 'Japan'),
('Kota Airport', 'KTU', 'Domestic', 'India');
/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `AIRLINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table `AIRLINE` (
    `Airline_ID` varchar(50),
    `Name` varchar(50) NOT NULL,
    `Owner` varchar(50) NOT NULL,
    PRIMARY KEY (`Airline_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENT`
--

LOCK TABLES `AIRLINE` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;
INSERT INTO `AIRLINE` VALUES
(098, 'Air India', 'Ratan Tata'),
(618, 'Singapore Airlines', 'Goh Choon Phong'),
(312, 'Indigo', 'Rahul Bhatia'),
(131, 'Japan Airlines', 'Yuji Akasaka');
/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `CONTAINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table `CONTAINS` (
    `Airport_code` varchar(3),
    `Airline_ID` varchar(50),
    PRIMARY KEY (`Airport_code`, `Airline_ID`),
    FOREIGN KEY (`Airport_code`) REFERENCES `AIRPORT` (`Airport_code`),
    FOREIGN KEY (`Airline_ID`) REFERENCES `AIRLINE` (`Airline_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_ON`
--

LOCK TABLES `CONTAINS` WRITE;
/*!40000 ALTER TABLE `WORKS_ON` DISABLE KEYS */;
INSERT INTO `CONTAINS` VALUES
('BLR', 098), ('BLR', 618), ('BLR', 312), ('BLR', 131),
('HYD', 098), ('HYD', 618), ('HYD', 312), ('HYD', 131),
('SIN', 098), ('SIN', 618), ('SIN', 312), ('SIN', 131),
('HND', 098), ('HND', 618), ('HND', 312), ('HND', 131),
('KTU', 098), ('KTU', 618), ('KTU', 312), ('KTU', 131);
/*!40000 ALTER TABLE `WORKS_ON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECT`
--

DROP TABLE IF EXISTS `EMPLOYEE_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table `EMPLOYEE_1` (
    `Airport_code` varchar(3),
    `Designation` varchar(50) NOT NULL,
    `Salary` bigint NOT NULL,
    PRIMARY KEY (`Airport_code`, `Designation`) ,
    FOREIGN KEY (`Airport_code`) REFERENCES `AIRPORT` (`Airport_code`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE_1` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE_1` VALUES
('HYD', 'Janitor', 10000), ('HYD', 'Security', 20000), ('HYD', 'Baggage Handler', 30000),
('BLR', 'Janitor', 15000), ('BLR', 'Security', 25000), ('BLR', 'Baggage Handler', 35000),
('SIN', 'Janitor', 40000), ('SIN', 'Security', 80000), ('SIN', 'Baggage Handler', 100000),
('KTU', 'Janitor', 5000), ('KTU', 'Security', 10000), ('KTU', 'Baggage Handler', 20000),
('HND', 'Janitor', 50000), ('HND', 'Security', 100000), ('HND', 'Baggage Handler', 200000);
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPT_LOCATIONS`
--

DROP TABLE IF EXISTS `EMPLOYEE_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table `EMPLOYEE_2` (
    `Employee_number` bigint CHECK(`Employee_number` BETWEEN 1000000000 and 9999999999),
    `Name` varchar(50) NOT NULL,
    `Date_of_birth` date NOT NULL,
    `Designation` varchar(50) NOT NULL,
    `Phone_number` bigint CHECK(`Phone_Number` BETWEEN 100000000000 and 999999999999) NOT NULL,
    PRIMARY KEY (`Employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT_LOCATIONS`
--

LOCK TABLES `EMPLOYEE_2` WRITE;
/*!40000 ALTER TABLE `DEPT_LOCATIONS` DISABLE KEYS */;
INSERT INTO `EMPLOYEE_2` VALUES
(2021202101, 'Ramesh', '1984-11-23', 'Manager', 917092861634),
(2021202102, 'Suresh', '1979-04-13', 'Janitor', 917887900609),
(2021202103, 'Rahul', '1980-06-25', 'Security', 918161698796),
(2021202104, 'Vijay', '1983-02-28', 'Baggage Handler', 917979946984),
(2021202001, 'Arun', '1985-04-10', 'Manager', 916335069936),
(2021202002, 'Pawan', '1984-10-21', 'Security', 916127962756),
(2021202003, 'Rohit', '1983-02-20', 'Janitor', 917211162639),
(2018202101, 'Sato', '1978-06-13', 'Manager', 916511927704),
(2018202102, 'Suzuki', '1982-08-23', 'Security', 916127908139),
(2018202103, 'Takashaki', '1987-03-26', 'Baggage Handler', 917121152009),
(2018202104, 'Nakamura', '1980-12-31', 'Janitor', 918847229481),
(2018202105, 'Yamamoto', '1984-04-15', 'Security', 916127939278),
(2019202101, 'Alyssa', '1980-06-13', 'Baggage Handler', 918708563130),
(2019202102, 'Emma', '1977-05-18', 'Janitor', 916127936621),
(2019202103, 'Sophia', '1981-02-28', 'Manager', 916127978053),
(2019202104, 'Chloe', '1985-04-24', 'Security', 916127965795);
/*!40000 ALTER TABLE `DEPT_LOCATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENT`
--

DROP TABLE IF EXISTS `FLIGHT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table `FLIGHT` (
    `Flight_number` bigint CHECK(`FLight_number` BETWEEN 10000000 and 99999999),
    `Source` varchar(50) NOT NULL,
    `Destination` varchar(50) NOT NULL,
    `Status` varchar(20) NOT NULL,
    `Arrival` datetime NOT NULL,
    `Departure` datetime NOT NULL,
    `Occupancy_rate` decimal(6,2) NOT NULL,
    PRIMARY KEY (`Flight_number`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPENDENT`
--

LOCK TABLES `FLIGHT` WRITE;
/*!40000 ALTER TABLE `DEPENDENT` DISABLE KEYS */;
INSERT INTO `FLIGHT` VALUES
(28859554, 'BLR', 'HYD', 'ontime', '2008-11-11 13:23:44', '2008-11-11 12:09:14', '100.00'), 
(56289464, 'HYD', 'HND', 'delayed', '2008-10-29 14:56:59', '2008-10-29 10:28:05', '90.00'), 
(28424381, 'SIN', 'HND', 'ontime', '2008-11-09 15:45:21', '2008-11-09 11:24:12', '75.00'), 
(57353698, 'KTU', 'HYD', 'delayed', '2008-11-11 11:12:01', '2008-11-11 09:52:34', '60.00'), 
(12829364, 'BLR', 'KTU', 'ontime', '2008-11-25 08:45:21', '2008-11-25 07:15:21', '85.00'), 
(51731571, 'HND', 'BLR', 'ontime', '2008-12-19 18:24:12', '2008-12-19 14:36:59', '80.00'), 
(61738186, 'BLR', 'SIN', 'ontime', '2008-09-25 16:45:45', '2008-09-25 15:09:45', '100.00'), 
(29540819, 'SIN', 'HYD', 'delayed', '2008-08-29 20:28:05', '2008-08-29 17:58:34', '95.00'), 
(32729163, 'HND', 'SIN', 'ontime', '2008-09-09 13:45:21', '2008-09-09 09:24:12', '75.00'), 
(29664612, 'HND', 'HYD', 'ontime', '2008-04-25 02:55:59', '2008-04-24 21:58:05', '45.00');

/*!40000 ALTER TABLE `DEPENDENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `CREW_MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table `CREW_MEMBER` (
    `Name` varchar(50) NOT NULL,
    `Member_ID` bigint CHECK (`MEMBER_ID` BETWEEN 10000000 and 99999999),
    `Designation` varchar(50) NOT NULL,
    `Flight_number` bigint CHECK(`FLight_number` BETWEEN 10000000 and 99999999) NOT NULL,
    PRIMARY KEY (`Member_ID`),
    FOREIGN KEY (`Flight_number`) REFERENCES `FLIGHT` (`Flight_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT`
--

LOCK TABLES `CREW_MEMBER` WRITE;
/*!40000 ALTER TABLE `PROJECT` DISABLE KEYS */;
INSERT INTO `CREW_MEMBER` VALUES
('Felix', 20210000, 'Pilot', 28859554), ('Chelsy', 20210001, 'Pilot', 56289464), ('Marsha', 20210002, 'Pilot', 28424381),
('Kyran', 20210003, 'Pilot', 57353698), ('Akbar', 20210004, 'Pilot', 12829364), ('Arjuna', 20210005, 'Pilot', 51731571), 
('Aarush', 20210006, 'Pilot', 61738186), ('Vihaan', 20210007, 'Pilot', 29540819), ('Darrell', 20210008, 'Pilot', 32729163), 
('Blair', 20210009, 'Pilot', 29664612), ('Tristan', 20210010, 'Air Hostess', 28859554), ('Bhavani', 20210011, 'Air Hostess', 56289464), 
('Anushka', 20210012, 'Air Hostess', 28424381), ('Swapna', 20210013, 'Air Hostess', 57353698), ('Marissa', 20210014, 'Air Hostess', 12829364), 
('Annika', 20210015, 'Air Hostess', 51731571), ('Jane', 20210016, 'Air Hostess', 61738186), ('Merryn', 20210017, 'Air Hostess', 29540819), 
('Preeti', 20210018, 'Air Hostess', 32729163), ('Aarohi', 20210019, 'Air Hostess', 29664612), ('Alia', 20210020, 'Air Hostess', 28859554),
('Aditi', 20210021, 'Air Hostess', 56289464), ('Divya', 20210022, 'Air Hostess', 28424381), ('Marvin', 20210023, 'Air Hostess', 57353698),
('Ayush', 20210024, 'Air Hostess', 12829364), ('Taryn', 20210025, 'Air Hostess', 51731571), ('Issac', 20210026, 'Air Hostess', 61738186), 
('Amanda', 20210027, 'Air Hostess', 29540819), ('Asha', 20210028, 'Air Hostess', 32729163), ('Amar', 20210029, 'Air Hostess', 29664612);
/*!40000 ALTER TABLE `PROJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKS_ON`
--

DROP TABLE IF EXISTS `ATC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table `ATC` (
    `Airport_code` varchar(3),
    `Number_of_members` integer NOT NULL,
    `Airport_Name` Varchar(50) NOT NULL,
    FOREIGN KEY (`Airport_code`) REFERENCES `AIRPORT` (`Airport_code`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_ON`
--

LOCK TABLES `ATC` WRITE;
/*!40000 ALTER TABLE `WORKS_ON` DISABLE KEYS */;
INSERT INTO `ATC` VALUES
('HYD', 12, 'Rajiv Gandhi'), ('HYD', 20, 'Rajiv Gandhi'), ('HYD', 10, 'Rajiv Gandhi'), ('HYD', 4, 'Rajiv Gandhi'), 
('BLR', 11, 'Kempegowda'), ('BLR', 9, 'Kempegowda'), ('BLR', 7, 'Kempegowda'), ('BLR', 6, 'Kempegowda'), 
('SIN', 3, 'Changi Airport'), ('SIN', 8, 'Changi Airport'), ('SIN', 10, 'Changi Airport'), ('SIN', 19, 'Changi Airport'), 
('KTU', 4, 'Kota Airport'), ('KTU', 5, 'Kota Airport'), ('KTU', 17, 'Kota Airport'), ('KTU', 21, 'Kota Airport'), 
('HND', 7, 'Haneda Airport'), ('HND', 11, 'Haneda Airport'), ('HND', 12, 'Haneda Airport'), ('HND', 23, 'Haneda Airport');
/*!40000 ALTER TABLE `WORKS_ON` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `TICKET_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table `TICKET_1` (
    `Flight_number` bigint CHECK(`Flight_number` BETWEEN 10000000 and 99999999),
    `Class` varchar(20),
    `Price` integer NOT NULL,
    PRIMARY KEY (`Flight_number`, `Class`),
    FOREIGN KEY (`Flight_number`) REFERENCES FLIGHT (`Flight_number`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_ON`
--

LOCK TABLES `TICKET_1` WRITE;
/*!40000 ALTER TABLE `WORKS_ON` DISABLE KEYS */;
INSERT INTO `TICKET_1` VALUES
(28859554, 'Business', 3275), (28859554, 'Economy', 2865), 
(56289464, 'Business', 24576), (56289464, 'Economy', 22987), 
(28424381, 'Business', 45640), (28424381, 'Economy', 38762), 
(57353698, 'Business', 7665), (57353698, 'Economy', 6740), 
(12829364, 'Business', 7890), (12829364, 'Economy', 7300), 
(51731571, 'Business', 35678), (51731571, 'Economy', 32000), 
(61738186, 'Business', 45670), (61738186, 'Economy', 36700), 
(29540819, 'Business', 28500), (29540819, 'Economy', 23500), 
(32729163, 'Business', 50000), (32729163, 'Economy', 45500), 
(29664612, 'Business', 48000), (29664612, 'Economy', 43500);
/*!40000 ALTER TABLE `WORKS_ON` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `TICKET_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table `TICKET_2` (
    `Ticket_number` bigint ,
    `Flight_number` bigint CHECK(`Flight_number` BETWEEN 10000000 and 99999999) NOT NULL,
    `Seat_number` varchar(10) NOT NULL,
    `Class` varchar(20) NOT NULL,
    PRIMARY KEY (`Ticket_number`),
    FOREIGN KEY (`Flight_number`) REFERENCES FLIGHT (`Flight_number`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_ON`
--

LOCK TABLES `TICKET_2` WRITE;
/*!40000 ALTER TABLE `WORKS_ON` DISABLE KEYS */;
INSERT INTO `TICKET_2` VALUES 
(5419093924, 28859554, 'A12', 'Economy'), (9715686338, 28859554, 'A14', 'Business'), (3304661966, 28859554, 'B11', 'Business'), (6169008315, 28859554, 'B14', 'Economy'), 
(8630597824, 28859554, 'A10', 'Business'), (6718550937, 56289464, 'B02', 'Business'), (7740498303, 56289464, 'B21', 'Economy'), (7822924774, 56289464, 'C23', 'Economy'), 
(6181355454, 56289464, 'V22', 'Economy'), (7791273902, 56289464, 'B24', 'Business'), (2363144275, 28424381, 'F26', 'Economy'), (5877093634, 28424381, 'A21', 'Business'), 
(7706021656, 28424381, 'A23', 'Business'), (5315050434, 28424381, 'B22', 'Economy'), (2607169774, 28424381, 'A92', 'Business'), (3463163595, 57353698, 'G34', 'Economy'), 
(8013678897, 57353698, 'A204', 'Business'), (5597742034, 57353698, 'A614', 'Economy'), (2400637673, 57353698, 'A334', 'Business'), (9048521460, 57353698, 'A24', 'Business'), 
(4128072425, 12829364, 'G14', 'Business'), (2170093339, 12829364, 'G58', 'Economy'), (8200773749, 12829364, 'G64', 'Business'), (2527908354, 12829364, 'G24', 'Economy'), 
(7254952368, 12829364, 'G814', 'Business'), (8198597482, 51731571, 'E22', 'Economy'), (2109300764, 51731571, 'E32', 'Economy'), (9208776585, 51731571, 'E432', 'Business'), 
(4043254239, 51731571, 'E112', 'Business'), (4408321071, 51731571, 'E82', 'Economy'), (2075749014, 61738186, 'F54', 'Economy'), (7632434147, 61738186, 'F24', 'Business'), 
(5712527218, 61738186, 'F04', 'Economy'), (8125083489, 61738186, 'F44', 'Economy'), (2510015604, 61738186, 'F48', 'Economy'), (2622852953, 29540819, 'R35', 'Business'), 
(7256786175, 29540819, 'R37', 'economy'), (6150141498, 29540819, 'R63', 'Business'), (2090645537, 29540819, 'R73', 'Business'), (2239615735, 29540819, 'R83', 'Business'), 
(7631054424, 32729163, 'J23', 'Economy'), (5307330681, 32729163, 'J45', 'Business'), (8326533292, 32729163, 'J38', 'Economy'), (2187725397, 32729163, 'J34', 'Business'), 
(8545075639, 32729163, 'J31', 'Economy'), (8706285587, 29664612, 'S11', 'Business'), (3214440751, 29664612, 'S13', 'Economy'), (2069833582, 29664612, 'S15', 'Business'), 
(4075800240, 29664612, 'S19', 'Business'), (7431962358, 29664612, 'S11', 'Economy');

/*!40000 ALTER TABLE `WORKS_ON` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `PASSENGER_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table `PASSENGER_1` (
    `Passport_number` bigint,
    `Name` varchar(50) NOT NULL,
    `Date_of_birth` date NOT NULL,
    `Gender` ENUM('M','F','T') NOT NULL,
    `Head_PN` bigint NOT NULL,
    `Ticket_Number` bigint NOT NULL,
    PRIMARY KEY (`Passport_number`),
    FOREIGN KEY (`Ticket_number`) REFERENCES `TICKET_2` (`Ticket_number`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_ON`
--

LOCK TABLES `PASSENGER_1` WRITE;
/*!40000 ALTER TABLE `WORKS_ON` DISABLE KEYS */;
INSERT INTO `PASSENGER_1` VALUES 
(2055961192, 'Olin Mcdonald', '1994-07-08', 'M', 2055961192, 9715686338), (7748328058, 'Manuel Villegas', '1973-01-22', 'M', 7748328058, 5419093924), 
(2895092288, 'Jeffrey Knight', '1974-03-20', 'M', 2895092288, 3304661966), (7621874066, 'Toney Galloway', '1985-01-30', 'M', 2055961192, 6169008315), 
(9473618699, 'Bill Choi', '1979-02-23', 'M', 9473618699, 8630597824), (3238034768, 'Lynn Savage', '1980-01-22', 'F', 3238034768, 6718550937), 
(7790150844, 'Del Meza', '1981-10-29', 'F', 2055961192, 7740498303), (8672668697, 'Nikki Vargas', '1998-06-28', 'F', 8672668697, 7822924774), 
(5612664871, 'Angelita Stephenson', '1980-07-05', 'F', 5612664871, 6181355454), (2495735402, 'Ty Solomon', '1989-09-30', 'M', 2495735402, 7791273902), 
(9401173275, 'Sung Richmond', '1972-11-02', 'T', 9401173275, 2363144275), (4138755903, 'Georgina Morrison', '1972-09-17', 'F', 4138755903, 5877093634), 
(7156351857, 'Ezekiel Wyatt', '1974-01-31', 'F', 7156351857, 7706021656), (2344115132, 'Nora Ruiz', '1989-04-02', 'F', 2344115132, 5315050434), 
(9494681916, 'Candice Ellis', '1971-09-18', 'M', 9494681916, 2607169774), (7373678609, 'Dominique Ramirez', '1974-12-06', 'M', 9401173275, 3463163595), 
(8012200317, 'Christian Reilly', '1988-07-10', 'F', 8012200317, 8013678897), (7434847574, 'Cassie Sweeney', '1985-03-12', 'T', 9401173275, 5597742034), 
(2080694804, 'Bette Bradford', '1992-04-14', 'F', 4252590310, 2400637673), (7735073732, 'Lorena Guzman', '1975-01-31', 'F', 7735073732, 9048521460), 
(8200198377, 'Adolph Leonard', '1996-03-18', 'F', 2080559576, 4128072425), (4050911352, 'Jodi Sampson', '1977-11-05', 'M', 4050911352, 2170093339), 
(2080559576, 'Angela Bray', '1976-03-12', 'M', 2080559576, 8200773749), (3853599260, 'Rick Pennington', '1994-10-09', 'F', 3853599260, 2527908354), 
(7736998538, 'Claude Braun', '1978-08-29', 'M', 7736998538, 7254952368), (6510082817, 'Boyce Russell', '1985-10-11', 'F', 6510082817, 8198597482), 
(2762988299, 'Buddy Carroll', '1976-04-08', 'F', 7736998538, 2109300764), (4250145103, 'Lupe Hampton', '1982-09-26', 'F', 4250145103, 9208776585), 
(4388560988, 'Kristen Mccann', '1999-11-18', 'M', 4388560988, 4043254239), (8384197878, 'Kaye Duarte', '1995-04-12', 'M', 8384197878, 4408321071), 
(7794865844, 'Felton Fry', '1996-02-14', 'F', 7794865844, 2075749014), (8704886511, 'Garfield Rios', '1997-01-21', 'M', 8704886511, 7632434147), 
(2723039146, 'Lori Nunez', '1977-08-31', 'F', 2723039146, 5712527218), (8309532723, 'Roxanne Dyer', '1994-11-11', 'F', 8309532723, 8125083489), 
(3028580493, 'Leanne Ashley', '1973-11-22', 'F', 8704886511, 2510015604), (4252590310, 'Thad Middleton', '1975-10-29', 'M', 4252590310, 2622852953), 
(3033343982, 'Nestor Charles', '1987-09-05', 'M', 3033343982, 7256786175), (7866975797, 'Helene Chang', '1993-09-22', 'F', 2523619408, 6150141498), 
(9349424041, 'Kristofer Peters', '1981-03-26', 'M', 9349424041, 2090645537), (2523619408, 'Millard Boyd', '1981-01-18', 'M', 2523619408, 2239615735), 
(6614970496, 'Ambrose Baird', '1978-12-14', 'T', 6614970496, 7631054424), (8315288895, 'Lynnette Rosario', '1989-08-06', 'M', 8315288895, 5307330681), 
(8073651418, 'Thanh Huynh', '1982-03-04', 'T', 7160393529, 8326533292), (2564970098, 'Maggie Carpenter', '1989-12-05', 'M', 2564970098, 2187725397), 
(3089197819, 'Tonya Velazquez', '2000-05-04', 'F', 7063966930, 8545075639), (7160393529, 'Myles Abbott', '1983-11-04', 'M', 7160393529, 8706285587), 
(7063966930, 'Garland Holden', '2000-03-03', 'M', 7063966930, 3214440751), (9283611555, 'Christi Harrison', '1988-01-07', 'F', 9283611555, 2069833582), 
(2295569723, 'Dixie Hurley', '1991-12-20', 'F', 2295569723, 4075800240), (5019865652, 'Luz Rosales', '1973-11-03', 'M', 7063966930, 7431962358);

/*!40000 ALTER TABLE `WORKS_ON` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `PASSENGER_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table `PASSENGER_2` (
    `Passport_number` bigint,
    `Phone_number` bigint CHECK(`Phone_number` BETWEEN 1000000000 and 9999999999),
    PRIMARY KEY (`Passport_number`, `Phone_number`),
    FOREIGN KEY (`Passport_number`) REFERENCES `PASSENGER_1` (`Passport_number`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_ON`
--

LOCK TABLES `PASSENGER_2` WRITE;
/*!40000 ALTER TABLE `WORKS_ON` DISABLE KEYS */;
INSERT INTO `PASSENGER_2` VALUES 
(2055961192, 9867990814), (7748328058, 4129629849), (2895092288, 8459394375), (7621874066, 9792217401), (9473618699, 6263723227), (3238034768, 4068262918), 
(7790150844, 8067152239), (8672668697, 6315909633), (5612664871, 4036103891), (2495735402, 2545432656), (9401173275, 3363775842), (4138755903, 5083612657), 
(7156351857, 8020867006), (2344115132, 2533943863), (9494681916, 3400852540), (7373678609, 8573490170), (8012200317, 4430600106), (7434847574, 7039742097), 
(2080694804, 9102752224), (7735073732, 9140518937), (8200198377, 5395133522), (4050911352, 5205458317), (2080559576, 2481795253), (3853599260, 4320178136), 
(7736998538, 6419433207), (6510082817, 7758642557), (2762988299, 9516312709), (4250145103, 3072215365), (4388560988, 9312230150), (8384197878, 4138328629), 
(7794865844, 5631682657), (8704886511, 6181741513), (2723039146, 3399446781), (8309532723, 6056197351), (3028580493, 3065244072), (4252590310, 6133085230), 
(3033343982, 6673907198), (7866975797, 4701825335), (9349424041, 9806858461), (2523619408, 6469247208), (6614970496, 4014320733), (8315288895, 3098261342), 
(8073651418, 4070520001), (2564970098, 8572859112), (3089197819, 9133140052), (7160393529, 4177027073), (7063966930, 3020971653), (9283611555, 9411696648), 
(2295569723, 3616824843), (5019865652, 9791386984), (7063966930, 3647187777), (7063966930, 9419479201), (8315288895, 2090568387), (9349424041, 5130952795), 
(7866975797, 7058665084), (4252590310, 6690270906), (3028580493, 8489038812), (4250145103, 3149323725), (7373678609, 9545029437), (7790150844, 5754699219), 
(2895092288, 6827090962), (2055961192, 3095454588), (8309532723, 9343749555), (3028580493, 3461034946), (4252590310, 9144201122);

/*!40000 ALTER TABLE `WORKS_ON` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `PASSENGER_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table `PASSENGER_3` (
    `Passport_number` bigint,
    `Area` varchar(50) NOT NULL,
    `City` varchar(30) NOT NULL,
    `Country` varchar(40) NOT NULL,
    `Pin_code` integer NOT NULL,
    PRIMARY KEY (`Passport_number`),
    FOREIGN KEY (`Passport_number`) REFERENCES `PASSENGER_1` (`Passport_number`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `PASSENGER_3` WRITE;
/*!40000 ALTER TABLE `WORKS_ON` DISABLE KEYS */;
INSERT INTO `PASSENGER_3` VALUES
(2055961192, 'North', 'Hyderabad', 'India', 500032), (7748328058, 'South', 'Hyderabad', 'India', 500011), (2895092288, 'East', 'Hyderabad', 'India', 500020),
(7621874066, 'West', 'Hyderabad', 'India', 500012), (9473618699, 'Central', 'Hyderabad', 'India', 500013), (3238034768, 'North', 'Bangalore', 'India', 560048), 
(7790150844, 'South', 'Bangalore', 'India', 560043), (8672668697, 'East', 'Bangalore', 'India', 560015), (5612664871, 'West', 'Bangalore', 'India', 560009), 
(2495735402, 'Central', 'Bangalore', 'India', 560021), (9401173275, 'North', 'Kota', 'India', 324001), (4138755903, 'South', 'Kota', 'India', 324003), 
(7156351857, 'East', 'Kota', 'India', 324005), (2344115132, 'West', 'Kota', 'India', 324006), (9494681916, 'Central', 'Kota', 'India', 324007), 
(7373678609, 'North', 'Singapore', 'Singapore', 200001), (8012200317, 'South', 'Singapore', 'Singapore', 200002), (7434847574, 'East', 'Singapore', 'Singapore', 200003), 
(2080694804, 'West', 'Singapore', 'Singapore', 200004), (7735073732, 'Central', 'Singapore', 'Singapore', 200005), (8200198377, 'North', 'Tokyo', 'Japan', 100006), 
(4050911352, 'South', 'Tokyo', 'Japan', 100007), (2080559576, 'East', 'Tokyo', 'Japan', 100008), (3853599260, 'West', 'Tokyo', 'Japan', 100009), 
(7736998538, 'Central', 'Tokyo', 'Japan', 100010), (6510082817, 'North', 'Kyoto', 'Japan', 100011), (2762988299, 'South', 'Kyoto', 'Japan', 100012), 
(4250145103, 'East', 'Kyoto', 'Japan', 100013), (4388560988, 'West', 'Kyoto', 'Japan', 100014), (8384197878, 'Central', 'Kyoto', 'Japan', 100015), 
(7794865844, 'North', 'Delhi', 'India', 110032), (8704886511, 'South', 'Delhi', 'India', 110031), (2723039146, 'East', 'Delhi', 'India', 110030), 
(8309532723, 'West', 'Delhi', 'India', 110029), (3028580493, 'Central', 'Delhi', 'India', 110028), (4252590310, 'North', 'Osaka', 'Japan', 100016), 
(3033343982, 'South', 'Osaka', 'Japan', 100017), (7866975797, 'East', 'Osaka', 'Japan', 100018), (9349424041, 'West', 'Osaka', 'Japan', 100019), 
(2523619408, 'Central', 'Osaka', 'Japan', 100020), (6614970496, 'North', 'Mumbai', 'India', 400003), (8315288895, 'South', 'Mumbai', 'India', 400005), 
(8073651418, 'East', 'Mumbai', 'India', 400010), (2564970098, 'West', 'Mumbai', 'India', 400007), (3089197819, 'Central', 'Mumbai', 'India', 400012), 
(7160393529, 'North', 'Yokohama', 'Japan', 100021), (7063966930, 'South', 'Yokohama', 'Japan', 100022), (9283611555, 'East', 'Yokohama', 'Japan', 100023), 
(2295569723, 'West', 'Yokohama', 'Japan', 100024), (5019865652, 'Central', 'Yokohama', 'Japan', 100025);

/*!40000 ALTER TABLE `WORKS_ON` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `JOURNEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table `JOURNEY` (
    `Airline_ID` varchar(50),
    `Flight_number` bigint CHECK(`Flight_number` BETWEEN 10000000 and 99999999),
    `Member_ID` bigint CHECK(`Member_ID` BETWEEN 10000000 and 99999999),
    `Passport_number` integer,
    `Duration` time NOT NULL,
    PRIMARY KEY(`Airline_ID`, `Flight_number`, `Member_ID`, `Passport_number`),
    FOREIGN KEY (`Airline_ID`) REFERENCES `AIRLINE` (`Airline_ID`),
    FOREIGN KEY (`Flight_number`) REFERENCES `FLIGHT` (`Flight_number`),
    FOREIGN KEY (`Member_ID`) REFERENCES `CREW_MEMBER` (`Member_ID`),
    FOREIGN KEY (`Passport_number`) REFERENCES `PASSENGER_1` (`Passport_number`)
);ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_ON`
--

LOCK TABLES `JOURNEY` WRITE;
/*!40000 ALTER TABLE `WORKS_ON` DISABLE KEYS */;
INSERT INTO `JOURNEY` VALUES ('123456789',1,32.5),('123456789',2,7.5),('333445555',2,10.0),('333445555',3,10.0),('333445555',10,10.0),('333445555',20,10.0),('453453453',1,20.0),('453453453',2,20.0),('666884444',3,40.0),('888665555',20,NULL),('987654321',20,15.0),('987654321',30,20.0),('987987987',10,35.0),('987987987',30,5.0),('999887777',10,10.0),('999887777',30,30.0);
/*!40000 ALTER TABLE `WORKS_ON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `WORKS_ON`
--


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

DROP TABLE IF EXISTS `DEPENDENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
create table `DEPENDENTS` (
    `Employee_number` bigint CHECK (`Employee_number` BETWEEN 1000000000 and 9999999999),
    `Name` varchar(50) NOT NULL,
    `Date_of_birth` date NOT NULL,
    `Gender` ENUM('M','F','T') NOT NULL,
    `Relationship` varchar(50) NOT NULL,
    PRIMARY KEY (`Employee_number`),
    FOREIGN KEY (`Employee_number`) REFERENCES `EMPLOYEE_2` (`Employee_number`)
);ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_ON`
--

LOCK TABLES `DEPENDENTS` WRITE;
/*!40000 ALTER TABLE `WORKS_ON` DISABLE KEYS */;
INSERT INTO `DEPENDENTS` VALUES 
(2021202101, 'Arushika', '1992-11-22', 'F', 'Wife'), (2021202102, 'Soumya', '1991-07-21', 'F', 'Wife'), (2021202103, 'Krushal', '2001-11-25', 'M', 'Son'), 
(2021202104, 'Aranya', '1990-07-20', 'F', 'Wife'), (2021202001, 'Lavanya', '1993-06-11', 'F', 'Wife'), (2021202002, 'Luv', '2003-03-12', 'M', 'Son'), 
(2021202003, 'Urvashi', '2001-08-13', 'F', 'Daughter'), (2018202101, 'Harshita', '1992-05-12', 'F', 'Wife'), (2018202102, 'Kanika', '2002-05-14', 'F', 'Daughter'), 
(2018202103, 'Drishti', '1993-03-11', 'F', 'Wife'), (2018202104, 'Kush', '2003-04-13', 'M', 'Son'), (2018202105, 'Siya', '1990-05-16', 'F', 'Wife'), 
(2019202101, 'Kanishka', '2008-07-23', 'F', 'Daughter'), (2019202102, 'Anchal', '1992-01-14', 'F', 'Wife'), (2019202103, 'Cory', '2008-05-04', 'F', 'Daughter'), 
(2019202104, 'Aarav', '1988-10-24', 'M', 'Son');

/*!40000 ALTER TABLE `WORKS_ON` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/* create view JOURNEY as select AIRLINE.Airline_ID , FLIGHT.Flight_number, EMPLOYEE_2.Employee_number, PASSENGER_1.Passport_number from AIRLINE,FLIGHT,EMPLOYEE_2,PASSENGER_1;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-12 23:29:32
