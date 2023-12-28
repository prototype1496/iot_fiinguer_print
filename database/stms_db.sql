-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table stms_db.address
DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `AddressID` int(11) NOT NULL AUTO_INCREMENT,
  `PrimaryAddress` varchar(50) NOT NULL,
  `SecondaryAddress` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(50) NOT NULL DEFAULT '10010',
  `DistrictID` int(11) NOT NULL,
  `IdentificationID` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`AddressID`),
  KEY `FK_address_district` (`DistrictID`),
  CONSTRAINT `FK_address_district` FOREIGN KEY (`DistrictID`) REFERENCES `district` (`DistrictID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 ;

-- Dumping data for table stms_db.address: ~4 rows (approximately)
REPLACE INTO `address` (`AddressID`, `PrimaryAddress`, `SecondaryAddress`, `ZipCode`, `DistrictID`, `IdentificationID`, `UpdatedOn`) VALUES
	(5, 'test', NULL, '10010', 3, 'TECH0000000003', '2020-11-20 11:52:45'),
	(6, 'This is a test', NULL, '10010', 49, 'TECH00000000023', '2023-12-20 05:44:00'),
	(7, 'This is a test', NULL, '10010', 49, 'TECH00000000023', '2023-12-20 05:46:33'),
	(8, 'Lusaka, Chelenge', 'Lusaka, Chelenge', '10010', 38, 'TECH00000000029', '2023-12-21 04:05:35'),
	(9, 'Lusaka Region HQ PO BOX 30133', 'Lusaka Region HQ PO BOX 30133', '10010', 49, 'TECH00000000076', '2023-12-22 09:14:26');

-- Dumping structure for table stms_db.classmaster
DROP TABLE IF EXISTS `classmaster`;
CREATE TABLE IF NOT EXISTS `classmaster` (
  `ClassMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassMasterPublicID` varchar(50) NOT NULL,
  `ClassTeacherID` varchar(50) NOT NULL,
  `GradeMasterID` int(11) NOT NULL,
  `ClassName` varchar(50) NOT NULL,
  `ClassCode` char(4) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `AddedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `TenantID` varchar(400) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ClassMasterID`) USING BTREE,
  UNIQUE KEY `ClassPublicID` (`ClassMasterPublicID`) USING BTREE,
  UNIQUE KEY `ClassCode` (`ClassCode`,`TenantID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 ;

-- Dumping data for table stms_db.classmaster: ~20 rows (approximately)
REPLACE INTO `classmaster` (`ClassMasterID`, `ClassMasterPublicID`, `ClassTeacherID`, `GradeMasterID`, `ClassName`, `ClassCode`, `Description`, `UpdatedBy`, `UpdatedOn`, `AddedOn`, `IsActive`, `TenantID`) VALUES
	(1, 'CLAS0000000004', 'TECH0000000003', 8, 'Grade 8', '8 A', NULL, 'it', '2021-08-15 14:35:39', '2021-05-16 12:04:00', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(2, 'CLAS0000000005', 'TECH0000000003', 8, 'Grade 8', '8 B', NULL, 'it', '2021-08-15 14:35:40', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(3, 'CLAS0000000006', 'TECH0000000003', 8, 'Grade 8', '8 C', NULL, 'it', '2021-08-15 14:35:41', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(4, 'CLAS0000000007', 'TECH0000000003', 8, 'Grade 8', '8 D', NULL, 'it', '2021-08-15 14:35:41', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(5, 'CLAS0000000008', 'TECH0000000003', 9, 'Grade 9', '9 A', NULL, 'it', '2021-08-15 14:35:42', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(6, 'CLAS0000000009', 'TECH0000000003', 9, 'Grade 9', '9 B', NULL, 'it', '2021-08-15 14:35:43', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(7, 'CLAS0000000010', 'TECH0000000003', 9, 'Grade 9', '9 C', NULL, 'it', '2021-08-15 14:35:44', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(8, 'CLAS0000000011', 'TECH0000000003', 10, 'Grade 10', '10 A', NULL, 'it', '2021-08-15 14:35:44', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(9, 'CLAS0000000012', 'TECH0000000003', 10, 'Grade 10', '10 B', NULL, 'it', '2021-08-15 14:35:45', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(10, 'CLAS0000000013', 'TECH0000000003', 11, 'Grade 11', '11 A', NULL, 'it', '2021-08-15 14:35:46', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(11, 'CLAS0000000014', 'TECH0000000003', 11, 'Grade 11', '11 B', NULL, 'it', '2021-08-15 14:35:46', '2021-05-20 16:53:51', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(21, 'CLAS00000000063', 'TECH0000000003', 7, 'Grade 7', '7 F', NULL, 'it', '2021-08-18 15:28:04', '2021-08-18 06:19:54', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(27, 'CLAS00000000067', 'TECH000000000103', 14, 'Grade 1', 'G1', 'DISCRIPTION', 'ta', '2021-10-13 09:51:14', '2021-10-13 09:51:14', '1', 'rrr6140a8c632d934.43595166'),
	(28, 'CLAS00000000068', 'TECH000000000104', 20, 'Grade 10', '10A', NULL, 'ali_admin', '2021-10-18 11:35:19', '2021-10-18 11:35:19', '1', 'Ama616d2ea1a78213.69918222'),
	(29, 'CLAS00000000069', 'TECH00000000079', 6, 'Grade 6', '6A', 'testing', 'it', '2021-11-20 22:18:43', '2021-11-20 21:23:20', '1', '5fe7597e-f7a1-11eb-a81c-1062e5c23529'),
	(39, 'CLAS00000000076', 'TECH000000000106', 23, 'Grade 1', 'G1', 'Grade 1 teacher', 'Madmin', '2022-04-13 00:20:18', '2022-04-13 00:20:18', '1', 'Thr6255f612d73866.53144529'),
	(40, 'CLAS00000000077', 'TECH000000000106', 24, 'Grade 2', 'G2', 'G2', 'Madmin', '2022-04-13 03:07:56', '2022-04-13 03:07:56', '1', 'Thr6255f612d73866.53144529'),
	(41, 'CLAS00000000078', 'TECH000000000108', 25, 'Grade 1', '1 A', NULL, 'boston', '2022-05-07 16:44:34', '2022-05-07 16:14:35', '1', 'Ali62763c730ca728.22561562'),
	(42, 'CLAS00000000079', 'TECH000000000108', 26, 'Grade 2', '2 A', NULL, 'boston', '2022-05-07 16:15:03', '2022-05-07 16:15:03', '1', 'Ali62763c730ca728.22561562'),
	(43, 'CLAS00000000080', 'TECH000000000108', 26, 'Grade 2', '2 B', NULL, 'boston', '2022-05-07 16:46:01', '2022-05-07 16:42:40', '1', 'Ali62763c730ca728.22561562');

-- Dumping structure for table stms_db.country
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `CountryID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(50) NOT NULL,
  `ConuntryCode` char(5) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CountryID`),
  UNIQUE KEY `ConuntryCode` (`ConuntryCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 ;

-- Dumping data for table stms_db.country: ~0 rows (approximately)
REPLACE INTO `country` (`CountryID`, `CountryName`, `ConuntryCode`, `IsActive`) VALUES
	(1, 'Zambia ', '+260', '1');

-- Dumping structure for table stms_db.department
DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `DepartmentID` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(50) NOT NULL,
  `ShortHand` char(4) NOT NULL,
  PRIMARY KEY (`DepartmentID`),
  UNIQUE KEY `ShortHand` (`ShortHand`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.department: ~4 rows (approximately)
REPLACE INTO `department` (`DepartmentID`, `DepartmentName`, `ShortHand`) VALUES
	(1, 'Religious Education', 'RE'),
	(2, 'Mathermatics', 'MATH'),
	(3, 'Home Ecomomics', 'HE'),
	(4, 'Science', 'SCEN');

-- Dumping structure for table stms_db.district
DROP TABLE IF EXISTS `district`;
CREATE TABLE IF NOT EXISTS `district` (
  `DistrictID` int(11) NOT NULL AUTO_INCREMENT,
  `DistrictName` varchar(50) NOT NULL,
  `ProvinceID` int(11) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DistrictID`),
  KEY `FK_PROVINCEID` (`ProvinceID`),
  CONSTRAINT `FK_PROVINCEID` FOREIGN KEY (`ProvinceID`) REFERENCES `province` (`ProvinceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 ;

-- Dumping data for table stms_db.district: ~103 rows (approximately)
REPLACE INTO `district` (`DistrictID`, `DistrictName`, `ProvinceID`, `IsActive`) VALUES
	(2, 'Chibombo District', 1, '1'),
	(3, 'Kabwe District', 1, '1'),
	(4, 'Kapiri Mposhi District', 1, '1'),
	(5, 'Mkushi District', 1, '1'),
	(6, 'Mumbwa District', 1, '1'),
	(7, 'Serenje District', 1, '1'),
	(8, 'Luano District', 1, '1'),
	(9, 'Chitambo District', 1, '1'),
	(10, 'Ngabwe District', 1, '1'),
	(11, 'Chisamba District', 1, '1'),
	(12, 'Itezhi-Tezhi District', 1, '1'),
	(13, 'Shibuyunji District', 1, '1'),
	(14, 'Chililabombwe District', 2, '1'),
	(15, 'Chingola District', 2, '1'),
	(16, 'Kalulushi District', 2, '1'),
	(17, 'Kitwe District', 2, '1'),
	(18, 'Luanshya District', 2, '1'),
	(19, 'Lufwanyama District', 2, '1'),
	(20, 'Masaiti District', 2, '1'),
	(21, 'Mpongwe District', 2, '1'),
	(22, 'Mufulira District', 2, '1'),
	(23, 'Ndola District', 2, '1'),
	(24, 'Chadiza District', 3, '1'),
	(25, 'Chipata District', 3, '1'),
	(26, 'Katete District', 3, '1'),
	(27, 'Lundazi District', 3, '1'),
	(28, 'Mambwe District', 3, '1'),
	(29, 'Nyimba District', 3, '1'),
	(30, 'Petauke District', 3, '1'),
	(31, 'Sinda District', 3, '1'),
	(32, 'Vubwi District', 3, '1'),
	(33, 'Chiengi District', 4, '1'),
	(34, 'Chipili District', 4, '1'),
	(35, 'Chembe District', 4, '1'),
	(36, 'Kawambwa District', 4, '1'),
	(37, 'Lunga District', 4, '1'),
	(38, 'Mansa District', 4, '1'),
	(39, 'Milenge District', 4, '1'),
	(40, 'Mwansabombwe District', 4, '1'),
	(41, 'Mwense District', 4, '1'),
	(42, 'Nchelenge District', 4, '1'),
	(43, 'Samfya District', 4, '1'),
	(44, 'Chilanga District', 5, '1'),
	(45, 'Chirundu District', 5, '1'),
	(46, 'Chongwe District', 5, '1'),
	(47, 'Kafue District', 5, '1'),
	(48, 'Luangwa District', 5, '1'),
	(49, 'Lusaka District', 5, '1'),
	(50, 'Rufunsa District', 5, '1'),
	(51, 'Chama District', 6, '1'),
	(52, 'Chinsali District', 6, '1'),
	(53, 'Isoka District', 6, '1'),
	(54, 'Mafinga District', 6, '1'),
	(55, 'Mpika District', 6, '1'),
	(56, 'Nakonde District', 6, '1'),
	(57, 'Shiwangandu District', 6, '1'),
	(58, 'Chilubi District', 7, '1'),
	(59, 'Kaputa District', 7, '1'),
	(60, 'Kasama District', 7, '1'),
	(61, 'Luwingu District', 7, '1'),
	(62, 'Mbala District', 7, '1'),
	(63, 'Mporokoso District', 7, '1'),
	(64, 'Mpulungu District', 7, '1'),
	(65, 'Mungwi District', 7, '1'),
	(66, 'Nsama District', 7, '1'),
	(67, 'Chavuma District', 8, '1'),
	(68, 'Ikelenge District', 8, '1'),
	(69, 'Kabompo District', 8, '1'),
	(70, 'Kasempa District', 8, '1'),
	(71, 'Mufumbwe District', 8, '1'),
	(72, 'Mwinilunga District', 8, '1'),
	(73, 'Solwezi District', 8, '1'),
	(74, 'Zambezi District', 8, '1'),
	(75, 'Manyinga District', 8, '1'),
	(76, 'Chikankata District', 9, '1'),
	(77, 'Choma District', 9, '1'),
	(78, 'Gwembe District', 9, '1'),
	(79, 'Kalomo District', 9, '1'),
	(80, 'Kazungula District', 9, '1'),
	(81, 'Livingstone District', 9, '1'),
	(82, 'Mazabuka District', 9, '1'),
	(83, 'Monze District', 9, '1'),
	(84, 'Namwala District', 9, '1'),
	(85, 'Pemba District', 9, '1'),
	(86, 'Siavonga District', 9, '1'),
	(87, 'Sinazongwe District', 9, '1'),
	(88, 'Zimba District', 9, '1'),
	(89, 'Kalabo District', 10, '1'),
	(90, 'Kaoma District', 10, '1'),
	(91, 'Lukulu District', 10, '1'),
	(92, 'Mongu District', 10, '1'),
	(93, 'Mulobezi District', 10, '1'),
	(94, 'Senanga District', 10, '1'),
	(95, 'Sesheke District', 10, '1'),
	(96, 'Shangombo District', 10, '1'),
	(97, 'Nalolo District', 10, '1'),
	(98, 'Limulunga District', 10, '1'),
	(99, 'Nkeyema District', 10, '1'),
	(100, 'Sikongo District', 10, '1'),
	(101, 'Sioma District', 10, '1'),
	(102, 'Mitete District', 10, '1'),
	(103, 'Mwandi District', 10, '1'),
	(104, 'Luampa District', 10, '1');

-- Dumping structure for table stms_db.emailservice
DROP TABLE IF EXISTS `emailservice`;
CREATE TABLE IF NOT EXISTS `emailservice` (
  `EmailServiceID` int(11) NOT NULL AUTO_INCREMENT,
  `EmailSerial` varchar(20) NOT NULL DEFAULT '0',
  `EmailAddress` varchar(500) NOT NULL,
  `EmailSubject` varchar(100) NOT NULL,
  `SendData` varchar(15000) NOT NULL,
  `Status` char(4) NOT NULL,
  `UpdatedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`EmailServiceID`),
  UNIQUE KEY `EmailSerial` (`EmailSerial`),
  KEY `FK_emailservice_statusmaster` (`Status`),
  CONSTRAINT `FK_emailservice_statusmaster` FOREIGN KEY (`Status`) REFERENCES `statusmaster` (`StatueCode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.emailservice: ~0 rows (approximately)
REPLACE INTO `emailservice` (`EmailServiceID`, `EmailSerial`, `EmailAddress`, `EmailSubject`, `SendData`, `Status`, `UpdatedBy`, `UpdatedOn`) VALUES
	(1, 'EMIL0000000001', 'prototype1496@gmail.com', 'Teacher Time Management System Temp Login Cridentials', 'Wellcome to T.T.M.S<br><b>Username: </b> alinuswemwandobo@gmail.com<br><b>Temp Password: </b>VIJOE<br>Please login in to system and to change your password<br><br><b>If this message dose not belong to you please ignore it and have a good day </b> ', 'COMP', 'admin', '2020-11-20 11:52:46');

-- Dumping structure for table stms_db.gendermaster
DROP TABLE IF EXISTS `gendermaster`;
CREATE TABLE IF NOT EXISTS `gendermaster` (
  `GenderMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `Gender` text NOT NULL,
  `ShortName` char(1) NOT NULL DEFAULT 'M',
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`GenderMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.gendermaster: ~2 rows (approximately)
REPLACE INTO `gendermaster` (`GenderMasterID`, `Gender`, `ShortName`, `IsActive`) VALUES
	(1, 'Male', 'M', '1'),
	(2, 'Female', 'F', '1');

-- Dumping structure for table stms_db.holidymaster
DROP TABLE IF EXISTS `holidymaster`;
CREATE TABLE IF NOT EXISTS `holidymaster` (
  `HolidyMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `HolidayDate` date NOT NULL,
  `Name` varchar(50) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`HolidyMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.holidymaster: ~6 rows (approximately)
REPLACE INTO `holidymaster` (`HolidyMasterID`, `HolidayDate`, `Name`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(1, '2020-11-29', 'Black Fiday', 'Sys', '2019-12-15 09:39:30', '1'),
	(2, '2020-12-25', 'Christmas', 'Sys', '2019-12-15 10:13:39', '1'),
	(3, '2020-04-13', 'Easter Monday', 'SYS', '2020-03-29 10:37:18', '1'),
	(8, '2021-01-01', 'New Year', 'Sys', '2020-04-13 16:35:44', '1'),
	(9, '2020-05-01', 'Labor Day', 'Sys', '2020-04-13 16:37:25', '1'),
	(10, '2020-10-24', 'Independence Day ', 'admin', '2020-04-13 16:49:37', '1');

-- Dumping structure for table stms_db.leavetypemaster
DROP TABLE IF EXISTS `leavetypemaster`;
CREATE TABLE IF NOT EXISTS `leavetypemaster` (
  `LeaveTypeMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `LeaveType` varchar(50) NOT NULL,
  PRIMARY KEY (`LeaveTypeMasterID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.leavetypemaster: ~9 rows (approximately)
REPLACE INTO `leavetypemaster` (`LeaveTypeMasterID`, `LeaveType`) VALUES
	(1, 'Parental Leave '),
	(2, 'Marternity Leave '),
	(3, 'Vacation Leave '),
	(4, 'Mothers Day Leave '),
	(5, 'Bereavement Leave '),
	(6, 'Absence Leave '),
	(7, 'Study Leave '),
	(8, 'Sick Leave '),
	(9, 'Long leave of absence');

-- Dumping structure for table stms_db.maritalstatusmaster
DROP TABLE IF EXISTS `maritalstatusmaster`;
CREATE TABLE IF NOT EXISTS `maritalstatusmaster` (
  `MaritalStatusMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `MaritalStatus` varchar(10) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MaritalStatusMasterID`),
  UNIQUE KEY `MaritalStatus` (`MaritalStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.maritalstatusmaster: ~4 rows (approximately)
REPLACE INTO `maritalstatusmaster` (`MaritalStatusMasterID`, `MaritalStatus`, `IsActive`) VALUES
	(1, 'Married', '1'),
	(2, 'Widow', '1'),
	(3, 'Devorced', '1'),
	(4, 'Single', '1');

-- Dumping structure for table stms_db.province
DROP TABLE IF EXISTS `province`;
CREATE TABLE IF NOT EXISTS `province` (
  `ProvinceID` int(11) NOT NULL AUTO_INCREMENT,
  `ProvinceName` varchar(50) NOT NULL,
  `CountryID` int(11) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProvinceID`),
  KEY `FK_province_country` (`CountryID`),
  CONSTRAINT `FK_province_country` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 ;

-- Dumping data for table stms_db.province: ~10 rows (approximately)
REPLACE INTO `province` (`ProvinceID`, `ProvinceName`, `CountryID`, `IsActive`) VALUES
	(1, 'Central', 1, '1'),
	(2, 'Copperbelt', 1, '1'),
	(3, 'Eastern', 1, '1'),
	(4, 'Luapula', 1, '1'),
	(5, 'Lusaka', 1, '1'),
	(6, 'Muchinga', 1, '1'),
	(7, 'Northern', 1, '1'),
	(8, 'Northwestern', 1, '1'),
	(9, 'Southern', 1, '1'),
	(10, 'Western', 1, '1');

-- Dumping structure for table stms_db.school
DROP TABLE IF EXISTS `school`;
CREATE TABLE IF NOT EXISTS `school` (
  `SchoolID` int(11) NOT NULL AUTO_INCREMENT,
  `PublicID` varchar(50) NOT NULL DEFAULT '',
  `SchoolName` varchar(50) NOT NULL,
  `SchoolMotto` varchar(50) NOT NULL,
  `SchoolURl` varchar(50) NOT NULL,
  `SchoolDescription` varchar(50) DEFAULT NULL,
  `MaxTerms` int(11) NOT NULL,
  `Longitude` double NOT NULL DEFAULT 0,
  `Latitude` double NOT NULL DEFAULT 0,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SchoolID`),
  UNIQUE KEY `PublicID` (`PublicID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.school: ~0 rows (approximately)
REPLACE INTO `school` (`SchoolID`, `PublicID`, `SchoolName`, `SchoolMotto`, `SchoolURl`, `SchoolDescription`, `MaxTerms`, `Longitude`, `Latitude`, `IsActive`, `UpdatedBy`, `UpdatedOn`) VALUES
	(2, 'SCH0000001', 'Mufwambe Primery School', 'Quality And Ealencey', '', 'ThisSchool Aims at bringing out the best n your ch', 3, 3.3311, 322.2252, '1', 'Admin', '2020-01-24 16:56:52');

-- Dumping structure for table stms_db.sequencemaster
DROP TABLE IF EXISTS `sequencemaster`;
CREATE TABLE IF NOT EXISTS `sequencemaster` (
  `SequenceMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `SequnceCode` char(4) NOT NULL,
  `LastInsertedID` int(11) NOT NULL DEFAULT 0,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SequenceMasterID`),
  UNIQUE KEY `SequnceCode` (`SequnceCode`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.sequencemaster: ~8 rows (approximately)
REPLACE INTO `sequencemaster` (`SequenceMasterID`, `SequnceCode`, `LastInsertedID`, `UpdatedOn`) VALUES
	(1, 'TECH', 83, '2019-11-01 19:08:09'),
	(2, 'HEAD', 0, '2019-11-01 19:49:01'),
	(3, 'TOKN', 47, '2019-11-01 20:00:03'),
	(4, 'EMIL', 1, '2019-11-15 05:28:12'),
	(5, 'TRPD', 4, '2019-11-17 07:13:19'),
	(6, 'SCHL', 1, '2019-11-17 18:52:58'),
	(7, 'TRD', 2, '2019-11-18 21:59:20'),
	(8, 'STUD', 100, '2023-12-21 00:33:08');

-- Dumping structure for table stms_db.session
DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `SessionID` int(11) NOT NULL AUTO_INCREMENT,
  `UserMasterPublicID` varchar(50) NOT NULL,
  `SerialID` varchar(50) NOT NULL,
  `TokenID` varchar(50) NOT NULL,
  `TokenCreatedTime` varchar(50) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SessionID`),
  KEY `FK_session_usermaster` (`UserMasterPublicID`),
  CONSTRAINT `FK_session_usermaster` FOREIGN KEY (`UserMasterPublicID`) REFERENCES `usermaster` (`PublicID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.session: ~4 rows (approximately)
REPLACE INTO `session` (`SessionID`, `UserMasterPublicID`, `SerialID`, `TokenID`, `TokenCreatedTime`, `UpdatedBy`, `UpdatedOn`) VALUES
	(12, 'TECH0000000003', 'TOKN00000000012', '4b434bd9df36b74c49b65ae9933da201078d34e7b0a158fcd3', '1702958173', 't', '2023-12-19 05:56:13'),
	(39, 'TECH00000000023', 'TOKN00000000039', '152ef7b44f2a1b66cf403c2af7c2b87a2576d247480cf25457', '1703223394', 't', '2023-12-22 07:36:34'),
	(46, 'TECH00000000076', 'TOKN00000000046', '60fb4773389e5718aeb0982ece3ae2fc8e00c79455c13025d4', '1703256864', '0966800644', '2023-12-22 16:54:24'),
	(47, 'TECH0000000001', 'TOKN00000000047', '12cc610944925f8225c1c26c35f5864d6669b27443cd8d4e53', '1703315675', 'a', '2023-12-23 09:14:35');

-- Dumping structure for table stms_db.sessionhistory
DROP TABLE IF EXISTS `sessionhistory`;
CREATE TABLE IF NOT EXISTS `sessionhistory` (
  `SessionHistoryID` int(11) NOT NULL AUTO_INCREMENT,
  `SessionID` varchar(50) NOT NULL,
  `UserMasterPublicID` varchar(50) NOT NULL,
  `SerialID` varchar(50) NOT NULL,
  `TokenID` varchar(50) NOT NULL,
  `TokenCreatedTime` varchar(50) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SessionHistoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.sessionhistory: ~45 rows (approximately)
REPLACE INTO `sessionhistory` (`SessionHistoryID`, `SessionID`, `UserMasterPublicID`, `SerialID`, `TokenID`, `TokenCreatedTime`, `UpdatedBy`, `UpdatedOn`) VALUES
	(1, '1', 'TECH0000000001', 'TOKN0000000001', '64d926b784107779164db639f50a5f68b1888586752e331a4b', '1605864961', 'admin', '2020-11-20 11:36:02'),
	(2, '2', 'TECH0000000001', 'TOKN0000000002', 'aa8e5dd9595b7a66ce959cb2d71619da0af4199035a14bc8ec', '1605865002', 'admin', '2020-11-20 11:36:42'),
	(3, '3', 'TECH0000000001', 'TOKN0000000003', 'fa237851bfcf54fb18d2c0c3cba6a04c5f1b6c616bebf27a5f', '1605865046', 'admin', '2020-11-20 11:37:26'),
	(4, '4', 'TECH0000000001', 'TOKN0000000004', '19c7491a7d01db407e4c7ff1ae6f2e5168aaa4988d83ca5a62', '1606111681', 'admin', '2020-11-23 08:08:01'),
	(5, '5', 'TECH0000000001', 'TOKN0000000005', '23cb61825bb5473fbba5c0b278fbd8cc7557008851f5a644ae', '1618033062', 'admin', '2021-04-10 07:37:43'),
	(6, '6', 'TECH0000000001', 'TOKN0000000006', 'c29e0cb2aac3f58ee2ecd4f0956d6ff715408830df91ba4ae1', '1618033210', 'admin', '2021-04-10 07:40:10'),
	(7, '7', 'TECH0000000001', 'TOKN0000000007', '7cd4b228a123b131b3ecd8e250540bb2cd78b483a7d879cde3', '1619931612', 'admin', '2021-05-02 07:00:13'),
	(8, '8', 'TECH0000000001', 'TOKN0000000008', '7c7e841d0513dcabd3a7aae78b66fdeb217ae32b0b11495452', '1702956905', 'admin', '2023-12-19 05:35:05'),
	(9, '9', 'TECH0000000003', 'TOKN0000000009', '5078d4bdaa0c23f5efba4d796b108d944fe7f3fec3ca8d916a', '1702957017', 't', '2023-12-19 05:36:57'),
	(10, '10', 'TECH0000000003', 'TOKN00000000010', 'c1954e789109bc1947f642951c3c51ffdcce88d797fb9d2921', '1702957633', 't', '2023-12-19 05:47:13'),
	(11, '11', 'TECH0000000003', 'TOKN00000000011', '15d97a9747a0c05c9d7a51bb00494ab942ab8b449c2db3a964', '1702957764', 't', '2023-12-19 05:49:24'),
	(12, '12', 'TECH0000000003', 'TOKN00000000012', '4b434bd9df36b74c49b65ae9933da201078d34e7b0a158fcd3', '1702958173', 't', '2023-12-19 05:56:13'),
	(13, '13', 'TECH0000000001', 'TOKN00000000013', '96f433c7eac601a5335092621920c799825e44061589e7faa5', '1702958223', 'admin', '2023-12-19 05:57:03'),
	(14, '14', 'TECH0000000001', 'TOKN00000000014', 'ae83a19b1158102a0803777483495052791a276724a7def702', '1703033527', 'a', '2023-12-20 02:52:07'),
	(15, '15', 'TECH0000000001', 'TOKN00000000015', '104e4fd9179df66e225a20f6923ec79c26dba061ef32b6e457', '1703034223', 'a', '2023-12-20 03:03:44'),
	(16, '16', 'TECH0000000001', 'TOKN00000000016', '67419de891d6875dcd1a2f4da2e8c64e0dc3072cc708628e23', '1703034228', 'a', '2023-12-20 03:03:48'),
	(17, '17', 'TECH0000000001', 'TOKN00000000017', '457631648983752885e453925c37ed699c22360e7ffd19e581', '1703034631', 'a', '2023-12-20 03:10:31'),
	(18, '18', 'TECH0000000001', 'TOKN00000000018', '14fded6b316e5f70f76b3cd3ca057a3041c824ac7a7d20f994', '1703034636', 'a', '2023-12-20 03:10:36'),
	(19, '19', 'TECH0000000001', 'TOKN00000000019', '657955edbfffb8dfb975c7c0f7f5aa34ae124d1f567b793c3f', '1703034680', 'a', '2023-12-20 03:11:20'),
	(20, '20', 'TECH0000000001', 'TOKN00000000020', '045411bc7349b2dbcef3f4cd72f84b51ad1a283226e0ba93da', '1703034886', 'a', '2023-12-20 03:14:46'),
	(21, '21', 'TECH0000000001', 'TOKN00000000021', '4f662462e447129947485890723d586eaafdfdca17b98e9e8a', '1703035919', 'a', '2023-12-20 03:31:59'),
	(22, '22', 'TECH0000000001', 'TOKN00000000022', 'b6f93047adfe5fea209713c907aa413bd27c3f565d000447a7', '1703036094', 'a', '2023-12-20 03:34:54'),
	(23, '23', 'TECH0000000001', 'TOKN00000000023', '46e9bea0f0494064aca8de03f6f6ef3535e8d8118417be0410', '1703036857', 'a', '2023-12-20 03:47:37'),
	(24, '24', 'TECH0000000001', 'TOKN00000000024', 'eff15bda9c068be7f132a88cccf821be0ae6feb3d85d050c22', '1703038063', 'a', '2023-12-20 04:07:44'),
	(25, '25', 'TECH00000000023', 'TOKN00000000025', '98865af6ae1bc763bd07f7d84d21cb025c501809b6d1f554ef', '1703044031', '0973658985', '2023-12-20 05:47:11'),
	(26, '26', 'TECH00000000023', 'TOKN00000000026', 'bece4f75657649172448d2ba370e8e0c63f413d7f578e0b5fa', '1703044051', '0973658985', '2023-12-20 05:47:32'),
	(27, '27', 'TECH00000000023', 'TOKN00000000027', 'b9d15b67607a7abd770a5a494608726ffc32735718c8b9bbc8', '1703044094', '0973658985', '2023-12-20 05:48:14'),
	(28, '28', 'TECH0000000001', 'TOKN00000000028', '02572effada820c15040988f485b57e9be3345fae7a163ed00', '1703044104', 'a', '2023-12-20 05:48:24'),
	(29, '29', 'TECH00000000023', 'TOKN00000000029', '8bb9150c733160005e5c06e859ba8b5973d6bc30cba58ea340', '1703128542', 't', '2023-12-21 05:15:42'),
	(30, '30', 'TECH00000000023', 'TOKN00000000030', '387a0d9401a02ea1d4554a67c4c390a42ccd596d734547046e', '1703128561', 't', '2023-12-21 05:16:02'),
	(31, '31', 'TECH00000000023', 'TOKN00000000031', '5cf3d39c5d92482f25a870a63c7deda6990ca86ef6749cbf74', '1703128758', 't', '2023-12-21 05:19:19'),
	(32, '32', 'TECH00000000023', 'TOKN00000000032', 'e91d7aae2163992df2c02d239fc3e4661eff84b11399470169', '1703129317', 't', '2023-12-21 05:28:37'),
	(33, '33', 'TECH00000000023', 'TOKN00000000033', '1241078730b22698f4a5c5abba93388a9000ab01867575bcc8', '1703129348', 't', '2023-12-21 05:29:08'),
	(34, '34', 'TECH00000000023', 'TOKN00000000034', 'c8b87bf78090b4a7a81bee791b77b3e3651b7f5bfe9d0ea6fd', '1703192106', 't', '2023-12-21 22:55:06'),
	(35, '35', 'TECH00000000023', 'TOKN00000000035', 'a59c1324dc3cc5cfbd2df8acd946c5a3b6b2069d36cb859b9d', '1703220909', 't', '2023-12-22 06:55:09'),
	(36, '36', 'TECH0000000001', 'TOKN00000000036', '95a86648d7dda1e003328fb2f8e57fa6094eb958a6dc68f9b9', '1703222935', 'a', '2023-12-22 07:28:55'),
	(37, '37', 'TECH00000000023', 'TOKN00000000037', 'e6b86e6404549baaa11f42ed3e5a804def06e9fa95a2475a1c', '1703223145', 't', '2023-12-22 07:32:25'),
	(38, '38', 'TECH0000000001', 'TOKN00000000038', '30147c8437465c934ab41b43727183a1de90b65b413c892dd9', '1703223294', 'a', '2023-12-22 07:34:55'),
	(39, '39', 'TECH00000000023', 'TOKN00000000039', '152ef7b44f2a1b66cf403c2af7c2b87a2576d247480cf25457', '1703223394', 't', '2023-12-22 07:36:34'),
	(40, '40', 'TECH0000000001', 'TOKN00000000040', 'f6cf9fc9929802e0b2e885d3b3113010297f6a9ac5e14cace0', '1703228621', 'a', '2023-12-22 09:03:41'),
	(41, '41', 'TECH00000000076', 'TOKN00000000041', 'ba14492ba560aca9c9fc3fba783feeef6fdfb029dc4c530434', '1703229375', '0966800644', '2023-12-22 09:16:15'),
	(42, '42', 'TECH0000000001', 'TOKN00000000042', 'ff4de54478599e53c9487222300808edfbf511137b2a15c187', '1703232520', 'a', '2023-12-22 10:08:40'),
	(43, '43', 'TECH00000000076', 'TOKN00000000043', 'c8f02b6d5064091f819e7f989aa16217f9a6c5101a02727e05', '1703232557', '0966800644', '2023-12-22 10:09:18'),
	(44, '44', 'TECH0000000001', 'TOKN00000000044', '40e7bb09a552bd0c3504ed44429e8bd76a5f10a3215bca3103', '1703232572', 'a', '2023-12-22 10:09:32'),
	(45, '45', 'TECH00000000076', 'TOKN00000000045', 'acacf8e51b4aa6428e7a5e93618608263c9525e609596c68b4', '1703232640', '0966800644', '2023-12-22 10:10:41'),
	(46, '46', 'TECH00000000076', 'TOKN00000000046', '60fb4773389e5718aeb0982ece3ae2fc8e00c79455c13025d4', '1703256864', '0966800644', '2023-12-22 16:54:24'),
	(47, '47', 'TECH0000000001', 'TOKN00000000047', '12cc610944925f8225c1c26c35f5864d6669b27443cd8d4e53', '1703315675', 'a', '2023-12-23 09:14:35');

-- Dumping structure for table stms_db.statusmaster
DROP TABLE IF EXISTS `statusmaster`;
CREATE TABLE IF NOT EXISTS `statusmaster` (
  `StatusMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `StatueCode` char(4) NOT NULL,
  `Statue` varchar(50) NOT NULL,
  PRIMARY KEY (`StatusMasterID`),
  UNIQUE KEY `StatueCode` (`StatueCode`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.statusmaster: ~12 rows (approximately)
REPLACE INTO `statusmaster` (`StatusMasterID`, `StatueCode`, `Statue`) VALUES
	(1, 'SUCC', 'Success'),
	(2, 'PEND', 'Pending'),
	(3, 'ERRO', 'Error'),
	(4, 'FAIL', 'Failed'),
	(5, 'APPR', 'Approved'),
	(6, 'REQU', 'Requested'),
	(7, 'REGE', 'Rejection'),
	(8, 'MODI', 'Modified'),
	(9, 'COMP', 'Complited'),
	(10, 'PROC', 'Processing'),
	(11, 'STAT', 'Started'),
	(12, 'FRJC', 'Final Rejection');

-- Dumping structure for table stms_db.studentmaster
DROP TABLE IF EXISTS `studentmaster`;
CREATE TABLE IF NOT EXISTS `studentmaster` (
  `StudentMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentMasterPublicID` varchar(50) NOT NULL,
  `ProfilePic` varchar(10000) DEFAULT NULL,
  `StudentNo` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `OtherName` varchar(50) DEFAULT NULL,
  `GenderID` int(11) NOT NULL DEFAULT 0,
  `MaritalStatusID` int(11) NOT NULL DEFAULT 0,
  `ClassMasterD` int(11) NOT NULL DEFAULT 0,
  `DOB` date NOT NULL,
  `EmailAddress` varchar(50) DEFAULT NULL,
  `GuardianContactNo` varchar(10) NOT NULL,
  `GuardianMaleName` varchar(50) DEFAULT NULL,
  `GuardianFemaleName` varchar(50) DEFAULT NULL,
  `Address` varchar(5000) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `Year` year(4) DEFAULT 2023,
  `IsActive` char(1) NOT NULL DEFAULT '1',
  `IsGraduated` char(1) NOT NULL DEFAULT '0',
  `FinguerPrint` blob NOT NULL,
  PRIMARY KEY (`StudentMasterID`) USING BTREE,
  UNIQUE KEY `StudentNo` (`StudentNo`),
  UNIQUE KEY `StudentMasterPublicID` (`StudentMasterPublicID`),
  KEY `FK_studentmaster_gendermaster` (`GenderID`),
  KEY `FK_studentmaster_maritalstatusmaster` (`MaritalStatusID`),
  KEY `FK_studentmaster_classmaster` (`ClassMasterD`) USING BTREE,
  CONSTRAINT `FK_studentmaster_gendermaster` FOREIGN KEY (`GenderID`) REFERENCES `gendermaster` (`GenderMasterID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_studentmaster_maritalstatusmaster` FOREIGN KEY (`MaritalStatusID`) REFERENCES `maritalstatusmaster` (`MaritalStatusMasterID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.studentmaster: ~29 rows (approximately)
REPLACE INTO `studentmaster` (`StudentMasterID`, `StudentMasterPublicID`, `ProfilePic`, `StudentNo`, `FirstName`, `LastName`, `OtherName`, `GenderID`, `MaritalStatusID`, `ClassMasterD`, `DOB`, `EmailAddress`, `GuardianContactNo`, `GuardianMaleName`, `GuardianFemaleName`, `Address`, `UpdatedBy`, `UpdatedOn`, `Year`, `IsActive`, `IsGraduated`, `FinguerPrint`) VALUES
	(3, 'SDNT0000000001', '../../uploads/3EDU20210005_images.png', 'SN2021028', 'Alinuswe', 'Banda', NULL, 1, 4, 4, '1996-05-22', NULL, '097785684', 'Ali Mwanza', 'Tina Type', 'North mind Bwigimfumu', 'it', '2021-05-22 18:01:06', '2023', '1', '0', _binary 0x00f87301c82ae3735cc0413709ab71304b15559215257bae701caf98994d8a3e3b24e822a905f3966579b27ca931bb32a2c68f83dff329eb0ced7975c882987f843919a437bd64ea4c46a1ff5088e5021eeede5d33740b836b86624dec2ea331f878ea9c116d902d7379df77c35a298997db143c8bc8ee0611f91a0ac19acb7801a08fba05b346686b5b4a0dfe3c5b02030b32014436ede22ad148f33a778c64ee713685b77b9425bf2bfdb8f2fc998eab8aef21c46022474ef035ab86b57a2656885d6c23fe45d58da9ac9ceaf8cb2b430277e807e6b2c594567c11a696dc42f20e3d0549256f341d5d3c4222f4acfaa059f323d772d9ba17266849a57144625cd0e9d788f48cff9475e43aa21702f79734ff25ee8c17fec3d4eeefa0ce3daaa93bf3f7290247c9fbb830532d9c4c39f5a2b7ec167e9424ec812f447de295fb4d20540aa9289574cd57ba55c6a3c747b73e0cb4339a955c26ad10064bac1171ebd14eeedd6eb8380e82dc1d406fec04cfde1eab8952246f00f88101c82ae3735cc0413709ab7130ba145592bb52351d733306a1228a32a777325d9a4aa973f1e525f9e327bfa06aa1043cf3cee8ec28573b3877a93c3b45cd316e0d432fa9bb013379056688e571de422a66400edfccaffe0bda68490cd36cbf541dc9bbd8f56349e325c13376047f101cf767bde9ba49cfb0471319aff28fa8ea2939c2487f8fec4dade995b8c0f1e4628b67c78367b73c7ea1b0a17daf8b5c77aac5fee1c9d2dc119bf62354bec47a8cdaff16f2e4bfb7f18e59337810e0962c180bfa52fdbd9d0e251252291d226faa12d2db7fc16fd8ee0a3652a2b4035b424e3edbdcdf66deacc1f71414d72e925c1491e5c07f4f94101b76b2cc5575d6ea29a7d0f75bc85a001e0972767940e4bcb3c22f627ab352780f15c8f5a730645a42bb361757e4c1bd573c3d6e5af3b8a4e04a51a292683db1d0314aeea772608a8609cf0c343fa7d7d8d2626b52032e27e3430891c7690ccc2dacea4300515f897a3796d47327529c1b785ef0caa574ced11ba7ad4a4c0ca4cc3eb48e7e1a952bf5766f00f88001c82ae3735cc0413709ab71b04d15559279cbb88f9d1be568283dd75d53257ea83cad4dd083b95b6ee17a7854b917ac0f22420c6b3e6c473cd96151c1e334f25991e3b05ee13be06b7e97021b91281a130fe8b05732da04f33d8760143fdccb03ce7c53a6d555c2edb78bfa18b04f8e80aa9aa3d5713a5c5bad85482787b7d9d0b710a696c12404dfac6813f16a640ae331159a96308514d6037a3ff8cf113e185305a6e75ed3835edad2783a754ae213df8314943ac67e2490d0406340ce9dff3875a68d4dce959c246c4feffc372015228d6adfb7498ae0c69b3f5480bc4b0943fed72fa5504dbe479c4d5ffae0942084e535384e1ef56c487120236d41dadffcd1636360cf0d8fd324ec28721eeec4084fcbe0a7580f3933b96e1df164c906a5beeacc1838e1b0b34f35b333839099ab76230277ff96590c483982ad7da4ddd20ef7f6d437ef14fefc3dd52549d083b2d146b4212bb64f8fe840ba975b804a259df7b9e9c0dac0c3ca9c5cd7f02d54f0d1c69b270744b77f4eea28155938586f00e87301c82ae3735cc0413709ab71304b15559215257bae701caf98994d8a3e3b24e822a905f3966579b27ca931bb32a2c68f83dff329eb0ced7975c882987f843919a437bd64ea4c46a1ff5088e5021eeede5d33740b836b86624dec2ea331f878ea9c116d902d7379df77c35a298997db143c8bc8ee0611f91a0ac19acb7801a08fba05b346686b5b4a0dfe3c5b02030b32014436ede22ad148f33a778c64ee713685b77b9425bf2bfdb8f2fc998eab8aef21c46022474ef035ab86b57a2656885d6c23fe45d58da9ac9ceaf8cb2b430277e807e6b2c594567c11a696dc42f20e3d0549256f341d5d3c4222f4acfaa059f323d772d9ba17266849a57144625cd0e9d788f48cff9475e43aa21702f79734ff25ee8c17fec3d4eeefa0ce3daaa93bf3f7290247c9fbb830532d9c4c39f5a2b7ec167e9424ec812f447de295fb4d20540aa9289574cd57ba55c6a3c747b73e0cb4339a955c26ad10064bac1171ebd14eeedd6eb8380e82dc1d406fec04cfde1eab8952246f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000),
	(9, 'SDNT0000000005', '../../uploads/3EDU202100010_reri.jpg', 'SN2021029', 'Samuel', 'Banda', 'Liabwa', 1, 3, 4, '1992-01-01', NULL, '0977856258', 'Mwamba Liabwa Banda', 'Mwape Liabwa', 'North Mid Lusaka', 'it', '2021-05-22 22:23:33', '2023', '1', '0', _binary 0x31),
	(17, 'SDNT00000000015', '../../uploads/3EDU20210008_lady.png', 'SN2021030', 'Mwaka', 'Vwalika', 'Candy', 1, 4, 4, '2004-01-01', NULL, '0977856258', 'Mwamba Liabwa Vwalika', 'Mwape Vwalika', '204 B provident road Fairview', 'it', '2021-05-22 23:57:34', '2023', '1', '0', _binary 0x31),
	(20, 'SDNT00000000018', '../../uploads/defult.png', 'SN2021031', 'Myday', 'Kasalwe', NULL, 2, 1, 4, '2004-05-14', NULL, '0977100587', 'Mwamba Liabwa Banda', NULL, 'Luska Zambia', 'it', '2021-05-23 00:13:35', '2023', '1', '0', _binary 0x31),
	(22, 'SDNT00000000026', '../../uploads/defult.png', 'SN2021032', 'Emmanuel', 'Mwando', 'Lukulu', 1, 2, 13, '2021-05-07', NULL, '0977100587', 'sdsd', NULL, 'Lusaka, Chelenge', 'it', '2021-05-23 00:31:30', '2023', '1', '0', _binary 0x31),
	(24, 'SDNT00000000028', '../../uploads/3EDU202100033_lady.png', 'SN2021033', 'Test', 'Pupile', NULL, 1, 4, 13, '2000-01-01', 'alinuswemwandobo@gmail.com4', '0977100587', 'Mwamba Liabwa Banda', 'Mwape Liabwa', 'Lusaka, Chelenge', 'it', '2021-05-23 21:59:44', '2023', '1', '0', _binary 0x31),
	(27, 'SDNT00000000029', '../../uploads/defult.png', 'SN2021034', 'Mwazube', 'Mkonde', NULL, 1, 4, 8, '2021-07-04', NULL, '', 'Mwaba Kaenga', NULL, 'Lusaka Xelston', 'it', '2021-07-04 12:03:36', '2023', '1', '0', _binary 0x31),
	(29, 'SDNT00000000030', '../../uploads/defult.png', 'SN2021035', 'Emmanuel', 'Mwando', 'Mwando', 1, 4, 4, '1996-01-01', 'prototype1496@gmail.com', '0977100587', 'Mwamba Liabwa Banda', 'Banda', '204 B provident road Fairview', 'it', '2021-08-07 16:37:46', '2023', '1', '0', _binary 0x31),
	(30, 'SDNT00000000031', '../../uploads/3EDU202100036_marcal.jpg', 'SN2021036', 'Student', 'X', 'Mwando', 1, 4, 4, '1996-01-01', 'prototype1496@gmail.com', '0977100587', 'Mwamba Liabwa Banda', 'Banda', '204 B provident road Fairview', 'it', '2021-08-07 16:38:56', '2023', '1', '0', _binary 0x31),
	(31, 'SDNT00000000032', '../../uploads/3EDU20210005_images.png', 'SN2021037', 'Test', 'John', 'Kambondo', 1, 4, 8, '2003-12-31', 'prototype1496@gmail.com', '0977100583', 'Mwamba Liabwa', 'Mwandobo BK', 'Accara, Zambia', 'it', '2021-08-07 18:31:50', '2023', '1', '0', _binary 0x31),
	(34, 'SDNT00000000035', '../../uploads/defult.png', 'SN2021040', 'Tenant', 'Tenat Nwe', NULL, 1, 1, 4, '1996-01-01', 'prototype1496@gmail.com', '0977100587', 'sdsd', 'Mwando', 'Lusaka, Chelenge', 'it', '2021-08-08 07:45:28', '2023', '1', '0', _binary 0x31),
	(35, 'SDNT00000000036', '../../uploads/SN2021041_images.png', 'SN2021041', 'Liko', 'Mwnza', NULL, 2, 4, 42, '2003-01-01', 'prototype1496@gmail.com', '0977100587', 'Mwamba Liabwa Banda', 'Mwandobo', 'C/O.Mr.A.B.Mwandobo Flat 23C MURAMBA ROAD CHILENJE', 'ta', '2021-10-14 17:46:42', '2023', '1', '0', _binary 0x31),
	(36, 'SDNT00000000037', '../../uploads/SN2021042_images.png', 'SN2021042', 'Muke', 'Mambwe', NULL, 2, 4, 42, '2003-01-01', NULL, '0973609319', 'Mwamba Liabwa Banda', 'Banda', '204 B provident road Fairview', 'Mwaka', '2021-10-14 17:48:40', '2023', '1', '0', _binary 0x31),
	(37, 'SDNT00000000038', '../../uploads/SN2021043_images.png', 'SN2021043', 'Vilkinga', 'Makayi', NULL, 2, 4, 42, '2003-01-01', NULL, '0973609319', 'Mwamba Liabwa Banda', 'Banda', '204 B provident road Fairview', 'Mwaka', '2021-10-14 17:49:55', '2023', '1', '0', _binary 0x31),
	(38, 'SDNT00000000039', '../../uploads/SN2021044_images.png', 'SN2021044', 'Minza', 'Munati', NULL, 1, 4, 42, '2003-12-31', 'prototype1496@gmail.com', '0977100587', 'Mwamba Liabwa Banda', 'Mwando', 'Lusaka, Chelenge', 'ali_admin', '2021-10-18 11:36:10', '2023', '1', '0', _binary 0x31),
	(39, 'SDNT00000000040', '../../uploads/SN2022045_Tukozani194614694.jpg', 'SN2022045', 'Tokozani', 'Lungu', NULL, 1, 4, 42, '2022-04-13', 'alimwanza@gmail.com', '0971145232', 'Peter Mwanza', 'Alice Mwiche', '4 Azikwe Road Lusaka', 'Madmin', '2022-04-13 00:22:31', '2023', '1', '0', _binary 0x31),
	(40, 'SDNT00000000041', '../../uploads/SN2022046_Chileshe194653423.jpg', 'SN2022046', 'Thandi', 'Zimba', NULL, 2, 4, 42, '2022-04-11', 'alimwanza@gmail.com', '0971145232', 'Peter Mwanza', 'Alice Mwiche', '4 Azikwe Road lusaka', 'Madmin', '2022-04-13 00:23:42', '2023', '1', '0', _binary 0x31),
	(41, 'SDNT00000000042', '../../uploads/SN2022047_CholaChanda192556708.png', 'SN2022047', 'Luka', 'Nyrenda', NULL, 1, 4, 42, '2022-04-11', 'alimwanza@gmail.com', '0971145232', 'Peter Mwanza', 'Alice Mwiche', 'Lusaka Zambia', 'Madmin', '2022-04-13 00:25:13', '2023', '1', '0', _binary 0x31),
	(42, 'SDNT00000000043', '../../uploads/SN2022048_Francis190715338.jpg', 'SN2022048', 'Francis', 'Lili', NULL, 1, 4, 42, '2022-04-12', 'alimwanza@gmail.com', '0971145232', 'Peter Mwanza', 'Alice Mwiche', 'Lusaka Zambia', 'Madmin', '2022-04-13 00:40:58', '2023', '1', '0', _binary 0x31),
	(44, 'SDNT00000000045', '../../uploads/SN2022050_boy.png', 'SN2022050', 'student 1', 'Test', NULL, 1, 4, 42, '2022-05-05', NULL, 'sds', 'sdsds', 'sdsd', 'ssd', 'boston', '2022-05-07 16:30:38', '2023', '1', '0', _binary 0x31),
	(45, 'SDNT00000000046', '../../uploads/SN2022051_WhatsApp Image 2021-12-10 at 5.24.05 PM.jpeg', 'SN2022051', 'Student 2', 'test', NULL, 2, 4, 42, '2022-05-05', NULL, '0977100587', 'Mwamba Liabwa Banda', 'Mwandobo', 'sdsx', 'boston', '2022-05-07 16:31:44', '2023', '1', '0', _binary 0x31),
	(46, 'SDNT00000000047', '../../uploads/defult.png', 'SN2022052', 'Merry', 'Levens', NULL, 2, 4, 42, '2022-05-04', NULL, '0977100583', 'sdsd', 'sds', 'sefwsv', 'boston', '2022-05-07 16:47:13', '2023', '1', '0', _binary 0x31),
	(53, 'STUD00000000031', NULL, 'SN2023032', 'Mwaka', 'Valika', 'Mukondo', 2, 4, 42, '1996-01-01', 'ali123@gmai.com', '973609319', 'The destoryer', 'The calmer', 'Lusaka, Chelenge', 'a', '2023-12-21 03:58:20', '2023', '1', '0', _binary 0x31),
	(54, 'STUD00000000033', NULL, 'SN2023034', 'Mwaka', 'Valika', 'Mukondo', 2, 4, 2, '1996-01-01', 'ali123@gmai.com', '973609319', 'The destoryer', 'The calmer', 'Lusaka, Chelenge', 'a', '2023-12-21 04:00:04', '2023', '1', '0', _binary 0x31),
	(55, 'STUD00000000035', NULL, 'SN2023036', 'Mwaka', 'Valika', 'Mukondo', 2, 4, 2, '1996-01-01', 'ali123@gmai.com', '973609319', 'The destoryer', 'The calmer', 'Lusaka, Chelenge', 'a', '2023-12-21 04:01:47', '2023', '1', '0', _binary 0x31),
	(57, 'STUD00000000037', NULL, 'SN2023038', 'Mwaka', 'Valika', 'Mukondo', 2, 4, 2, '1996-01-01', 'ali123@gmai.com', '973609319', 'The destoryer', 'The calmer', 'Lusaka, Chelenge', 'a', '2023-12-21 04:02:54', '2023', '1', '0', _binary 0x31),
	(59, 'STUD00000000039', NULL, 'SN2023040', 'Mwaka', 'Valika', 'Mukondo', 2, 4, 2, '1996-01-01', 'ali123@gmai.com', '973609319', 'The destoryer', 'The calmer', 'Lusaka, Chelenge', 'a', '2023-12-21 04:03:10', '2023', '1', '0', _binary 0x31),
	(60, 'STUD00000000043', NULL, 'SN2023044', 'Mwaka', 'Valika', 'Mukondo', 2, 4, 2, '1996-01-01', 'ali123@gmai.com', '973609319', 'The destoryer', 'The calmer', 'Lusaka, Chelenge', 'a', '2023-12-21 04:04:35', '2023', '1', '0', _binary 0x31),
	(61, 'STUD00000000047', NULL, 'SN2023048', 'Mwaka', 'Valika', 'Mukondo', 2, 4, 2, '1996-01-01', 'ali123@gmai.com', '973609319', 'The destoryer', 'The calmer', 'Lusaka, Chelenge', 'a', '2023-12-21 04:09:26', '2023', '1', '0', _binary 0x31);

-- Dumping structure for table stms_db.studentrreportdetails
DROP TABLE IF EXISTS `studentrreportdetails`;
CREATE TABLE IF NOT EXISTS `studentrreportdetails` (
  `StudentReportDetailsPublicID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentPublicID` varchar(50) NOT NULL,
  `TimeIn` datetime NOT NULL DEFAULT current_timestamp(),
  `TimeOut` datetime DEFAULT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CreatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`StudentReportDetailsPublicID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.studentrreportdetails: ~5 rows (approximately)
REPLACE INTO `studentrreportdetails` (`StudentReportDetailsPublicID`, `StudentPublicID`, `TimeIn`, `TimeOut`, `UpdatedBy`, `UpdatedOn`, `CreatedOn`) VALUES
	(1, 'SDNT0000000004', '2023-12-19 05:39:57', NULL, 't', '2023-12-22 03:03:37', '2023-12-19 05:39:57'),
	(3, 'SDNT00000000015', '2023-12-22 01:55:16', '2023-12-22 03:36:30', 'a', '2023-12-22 03:03:32', '2023-12-22 01:55:16'),
	(7, 'SDNT0000000001', '2023-12-22 02:35:20', '2023-12-23 08:54:47', 't', '2023-12-23 08:54:47', '2023-12-22 02:35:20'),
	(8, 'SDNT00000000018', '2023-12-22 02:58:39', NULL, '', '2023-12-22 03:03:45', '2023-12-22 02:58:39'),
	(9, 'SDNT0000000001', '2023-11-22 05:00:12', '2023-11-22 10:00:16', 't', '2023-12-22 03:03:41', '2023-11-22 05:00:12'),
	(12, 'SDNT0000000001', '2023-12-23 09:12:11', '2023-12-23 09:13:00', '0966800644', '2023-12-23 09:13:00', '2023-12-23 09:12:11');

-- Dumping structure for table stms_db.teacherawarded
DROP TABLE IF EXISTS `teacherawarded`;
CREATE TABLE IF NOT EXISTS `teacherawarded` (
  `TeacherAwardedID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Award` varchar(50) NOT NULL,
  `UpdatednOn` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedBy` varchar(50) NOT NULL,
  PRIMARY KEY (`TeacherAwardedID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 ;

-- Dumping data for table stms_db.teacherawarded: ~0 rows (approximately)
REPLACE INTO `teacherawarded` (`TeacherAwardedID`, `Name`, `Award`, `UpdatednOn`, `UpdatedBy`) VALUES
	(1, 'Admin', 'Best System Admin', '2020-04-18 06:19:00', 'SYS');

-- Dumping structure for table stms_db.teacherdeatails
DROP TABLE IF EXISTS `teacherdeatails`;
CREATE TABLE IF NOT EXISTS `teacherdeatails` (
  `TeacherDeatailsID` int(11) NOT NULL AUTO_INCREMENT,
  `TeacherMasterID` varchar(50) NOT NULL,
  `TeacherDetailsPublicID` varchar(50) NOT NULL,
  `ReasonForLeave` varchar(500) NOT NULL,
  `LeaveFrom` date NOT NULL,
  `LeaveTo` date NOT NULL,
  `ReturnedDate` timestamp NULL DEFAULT NULL,
  `LeaveTypeID` int(11) NOT NULL,
  `StatusCode` char(4) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `ApprovedBy` varchar(50) DEFAULT NULL,
  `AuthorizedBy` varchar(50) DEFAULT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`TeacherDeatailsID`),
  KEY `StatusCode` (`StatusCode`),
  KEY `FK_teacherdeatails_teachermaster` (`TeacherMasterID`),
  KEY `FK_teacherdeatails_leavetypemaster` (`LeaveTypeID`),
  CONSTRAINT `FK_teacherdeatails_leavetypemaster` FOREIGN KEY (`LeaveTypeID`) REFERENCES `leavetypemaster` (`LeaveTypeMasterID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_teacherdeatails_statusmaster` FOREIGN KEY (`StatusCode`) REFERENCES `statusmaster` (`StatueCode`) ON UPDATE CASCADE,
  CONSTRAINT `FK_teacherdeatails_teachermaster` FOREIGN KEY (`TeacherMasterID`) REFERENCES `teachermaster` (`PublicUserID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.teacherdeatails: ~0 rows (approximately)

-- Dumping structure for table stms_db.teachermaster
DROP TABLE IF EXISTS `teachermaster`;
CREATE TABLE IF NOT EXISTS `teachermaster` (
  `TeacherMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `PublicUserID` varchar(50) NOT NULL,
  `PositionID` int(11) NOT NULL,
  `DepartmentCode` char(4) DEFAULT NULL,
  `StartDate` datetime NOT NULL DEFAULT current_timestamp(),
  `EndDate` datetime DEFAULT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsOnLeave` char(1) NOT NULL DEFAULT '0',
  `IsActive` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`TeacherMasterID`),
  KEY `FK_teachermaster_teacherpositionmaster` (`PositionID`),
  KEY `FK_teachermaster_usermaster` (`PublicUserID`),
  KEY `FK_teachermaster_department` (`DepartmentCode`),
  CONSTRAINT `FK_teachermaster_department` FOREIGN KEY (`DepartmentCode`) REFERENCES `department` (`ShortHand`) ON UPDATE CASCADE,
  CONSTRAINT `FK_teachermaster_teacherpositionmaster` FOREIGN KEY (`PositionID`) REFERENCES `teacherpositionmaster` (`TeacherPositionMasterID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_teachermaster_usermaster` FOREIGN KEY (`PublicUserID`) REFERENCES `usermaster` (`PublicID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.teachermaster: ~4 rows (approximately)
REPLACE INTO `teachermaster` (`TeacherMasterID`, `PublicUserID`, `PositionID`, `DepartmentCode`, `StartDate`, `EndDate`, `UpdatedBy`, `UpdatedOn`, `IsOnLeave`, `IsActive`) VALUES
	(1, 'TECH0000000001', 3, 'MATH', '2020-11-20 11:36:28', NULL, 'a', '2020-11-20 11:36:31', '0', '1'),
	(2, 'TECH0000000003', 1, 'MATH', '2020-11-20 11:52:45', NULL, 'admin', '2020-11-20 11:52:45', '0', '0'),
	(4, 'TECH00000000023', 4, 'SCEN', '2023-12-20 05:46:33', NULL, 'a', '2023-12-20 05:46:33', '0', '1'),
	(5, 'TECH00000000029', 4, 'MATH', '2023-12-21 04:05:35', NULL, 'a', '2023-12-21 04:05:35', '0', '1'),
	(6, 'TECH00000000076', 4, 'SCEN', '2023-12-22 09:14:26', NULL, 'a', '2023-12-22 09:14:26', '0', '1');

-- Dumping structure for table stms_db.teacherpositionmaster
DROP TABLE IF EXISTS `teacherpositionmaster`;
CREATE TABLE IF NOT EXISTS `teacherpositionmaster` (
  `TeacherPositionMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `PositionName` varchar(50) NOT NULL,
  `PositionDescription` varchar(500) DEFAULT NULL,
  `UpdatedBy` varchar(20) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`TeacherPositionMasterID`),
  UNIQUE KEY `PositionName` (`PositionName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.teacherpositionmaster: ~0 rows (approximately)
REPLACE INTO `teacherpositionmaster` (`TeacherPositionMasterID`, `PositionName`, `PositionDescription`, `UpdatedBy`, `UpdatedOn`, `IsActive`) VALUES
	(4, 'Teacher', 'Teacher Role is to mange classes and pupils', 'admin', '2019-11-12 14:43:48', '1');

-- Dumping structure for table stms_db.termdetails
DROP TABLE IF EXISTS `termdetails`;
CREATE TABLE IF NOT EXISTS `termdetails` (
  `TermDetailsID` int(11) NOT NULL AUTO_INCREMENT,
  `TermMasterID` int(11) NOT NULL,
  `TermStart` date NOT NULL,
  `TermEnd` date NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TermDetailsID`),
  KEY `FK_termdetails_termmaster` (`TermMasterID`),
  CONSTRAINT `FK_termdetails_termmaster` FOREIGN KEY (`TermMasterID`) REFERENCES `termmaster` (`TermMasterID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.termdetails: ~0 rows (approximately)

-- Dumping structure for table stms_db.termmaster
DROP TABLE IF EXISTS `termmaster`;
CREATE TABLE IF NOT EXISTS `termmaster` (
  `TermMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `TermName` varchar(50) NOT NULL,
  PRIMARY KEY (`TermMasterID`),
  UNIQUE KEY `TermDetails` (`TermName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.termmaster: ~3 rows (approximately)
REPLACE INTO `termmaster` (`TermMasterID`, `TermName`) VALUES
	(1, 'Term 1'),
	(2, 'Term 2'),
	(3, 'Term 3');

-- Dumping structure for table stms_db.usermaster
DROP TABLE IF EXISTS `usermaster`;
CREATE TABLE IF NOT EXISTS `usermaster` (
  `UserMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `PublicID` varchar(20) NOT NULL,
  `NRC` varchar(10) DEFAULT NULL,
  `Passport` varchar(50) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(300) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `OtherName` varchar(50) DEFAULT NULL,
  `EmailAddress` varchar(100) DEFAULT NULL,
  `ContactNo` varchar(13) NOT NULL,
  `GenderID` int(1) NOT NULL,
  `MaritalStatusID` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `UserTypeID` int(11) NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `IsActive` char(1) NOT NULL DEFAULT '1',
  `LoginAttempts` char(1) NOT NULL DEFAULT '0',
  `IsLocked` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserMasterID`),
  UNIQUE KEY `ContactNo` (`ContactNo`),
  UNIQUE KEY `PublicID` (`PublicID`),
  UNIQUE KEY `UserName` (`UserName`),
  UNIQUE KEY `NRC` (`NRC`),
  UNIQUE KEY `Passport` (`Passport`),
  UNIQUE KEY `EmailAddress` (`EmailAddress`),
  KEY `FK_usermaster_usertypemaster` (`UserTypeID`),
  KEY `FK_usermaster_maritalstatusmaster` (`MaritalStatusID`),
  KEY `FK_usermaster_gendermaster` (`GenderID`),
  CONSTRAINT `FK_usermaster_gendermaster` FOREIGN KEY (`GenderID`) REFERENCES `gendermaster` (`GenderMasterID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_usermaster_maritalstatusmaster` FOREIGN KEY (`MaritalStatusID`) REFERENCES `maritalstatusmaster` (`MaritalStatusMasterID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_usermaster_usertypemaster` FOREIGN KEY (`UserTypeID`) REFERENCES `usertypemaster` (`UserTypeMasterID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.usermaster: ~5 rows (approximately)
REPLACE INTO `usermaster` (`UserMasterID`, `PublicID`, `NRC`, `Passport`, `UserName`, `Password`, `FirstName`, `LastName`, `OtherName`, `EmailAddress`, `ContactNo`, `GenderID`, `MaritalStatusID`, `DOB`, `UserTypeID`, `UpdatedBy`, `UpdatedOn`, `IsActive`, `LoginAttempts`, `IsLocked`) VALUES
	(1, 'TECH0000000001', '55445/16/1', 'cc', 'a', '$2y$10$HB0sebWRfgUERgffPstyIeKC8./BoKM.VV7ltF8rVOK/aUJphE2Aq', 'Head', 'System', 'Teacher', 'prototype1496@gmail.com', '988755487', 1, 4, '1997-01-02', 1, 'Sys', '2019-11-14 08:56:25', '1', '0', '0'),
	(2, 'TECH0000000003', '515151/8/8', '74444/45/45', 'tt', '$2y$10$HB0sebWRfgUERgffPstyIeKC8./BoKM.VV7ltF8rVOK/aUJphE2Aq', 'Alinuswe', 'Mwandobo', NULL, 'alinuswemwandobo@gmail.com', '977100587', 1, 1, '1996-01-01', 1, 'admin', '2020-11-20 11:52:45', '1', '0', '0'),
	(4, 'TECH00000000023', '25151/16/5', NULL, 't', '$2y$10$vZfrIt8GE1a.4EFBe7aeB.WP88KekSdYK3uAWMN/Qcxzn7fI621iu', 'Lupupa', 'Kachnga', NULL, NULL, '973658985', 2, 1, '1990-01-01', 3, 'a', '2023-12-20 05:46:33', '1', '0', '0'),
	(6, 'TECH00000000029', '255151/16/', NULL, 'proto444type1496@gmail.com', '$2y$10$u5gu.rIIsMRpHVO6mSSlpOwpz2DY30JnApy2T9qaTWMgBOs7i.pMi', 'Emmanuel', 'Mwando', NULL, 'proto444type1496@gmail.com', '+260977100587', 1, 4, '1995-01-01', 3, 'a', '2023-12-21 04:05:35', '1', '0', '0'),
	(7, 'TECH00000000076', '263003/68/', NULL, '0966800644', '$2y$10$G2vwhAuJzXcVy30fQZxUpeFIa4CkBV22sfkmT1pXhlyZFniGTQq12', 'Manyovwe', 'Chiwela', 'Mashilipa', 'chiwelajoem@gmail.com', '0955800644', 1, 1, '1990-06-06', 3, 'a', '2023-12-22 09:14:26', '1', '0', '0');

-- Dumping structure for table stms_db.usertypemaster
DROP TABLE IF EXISTS `usertypemaster`;
CREATE TABLE IF NOT EXISTS `usertypemaster` (
  `UserTypeMasterID` int(11) NOT NULL AUTO_INCREMENT,
  `UserType` varchar(20) NOT NULL,
  `IsActive` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserTypeMasterID`),
  UNIQUE KEY `UserType` (`UserType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.usertypemaster: ~2 rows (approximately)
REPLACE INTO `usertypemaster` (`UserTypeMasterID`, `UserType`, `IsActive`) VALUES
	(1, 'Admin', '1'),
	(3, 'Teacher', '1');

-- Dumping structure for table stms_db.workingdays
DROP TABLE IF EXISTS `workingdays`;
CREATE TABLE IF NOT EXISTS `workingdays` (
  `WorkingDaysID` int(11) NOT NULL AUTO_INCREMENT,
  `Day` varchar(50) NOT NULL,
  PRIMARY KEY (`WorkingDaysID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table stms_db.workingdays: ~5 rows (approximately)
REPLACE INTO `workingdays` (`WorkingDaysID`, `Day`) VALUES
	(1, 'Monday'),
	(2, 'Tuesday'),
	(3, 'Wednesday'),
	(4, 'Thursday'),
	(5, 'Friday');

-- Dumping structure for procedure stms_db.ActivateUser
DROP PROCEDURE IF EXISTS `ActivateUser`;
DELIMITER //
CREATE PROCEDURE `ActivateUser`(
	IN `UserMasterID_` INT
)
BEGIN
			DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;
		
		SET @PUBLCID  = (SELECT UM.PublicID FROM usermaster UM WHERE UM.UserMasterID = UserMasterID_);
		
		UPDATE teachermaster SET `IsActive` = 1 WHERE PublicUserID = @PUBLCID;
		UPDATE usermaster  SET `IsActive` = 1 , `Password` = '$2y$10$JL396wwdluH7joCFCxZ8ceWJDwbanf4DycWODBtuhokcw.gqRKz1y' WHERE `UserMasterID` = UserMasterID_ ;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.CheckCheckedInStatus
DROP PROCEDURE IF EXISTS `CheckCheckedInStatus`;
DELIMITER //
CREATE PROCEDURE `CheckCheckedInStatus`(
	IN `TeacherMasterPublicID_` VARCHAR(50)
)
BEGIN
			SELECT IF(TRD.TimeIn IS NULL, '0' , TRD.TimeIn) AS 'IsCheckedIn'
			FROM teacherreportdetails TRD WHERE DATE(TRD.UpdatedOn) = DATE(CURDATE()) AND TRD.TeacherMasterPublicID = TeacherMasterPublicID_ ;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.CheckChekedOutStatus
DROP PROCEDURE IF EXISTS `CheckChekedOutStatus`;
DELIMITER //
CREATE PROCEDURE `CheckChekedOutStatus`(
	IN `TeacherMasterPublicID_` VARCHAR(50)

)
BEGIN
			SELECT IF(TRD.TimeIn IS NULL, NULL, TRD.TimeIn) AS 'IsCheckedOut'
FROM teacherreportdetails TRD WHERE DATE(TRD.UpdatedOn) = DATE(CURDATE()) AND TRD.TimeOut IS NULL AND TRD.TimeIn IS NOT NULL AND TRD.TeacherMasterPublicID = TeacherMasterPublicID_;

END//
DELIMITER ;

-- Dumping structure for procedure stms_db.CheckTeacherOut
DROP PROCEDURE IF EXISTS `CheckTeacherOut`;
DELIMITER //
CREATE PROCEDURE `CheckTeacherOut`(
	IN `TeacherMasterPublicID_` INT



)
BEGIN
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT '' AS message;
		     ROLLBACK;
		END;
		UPDATE teacherreportdetails  SET TimeOut = CURRENT_TIMESTAMP() 
		WHERE TeacherMasterPublicID = TeacherMasterPublicID_ AND DATE(UpdatedOn) = CURRENT_DATE();
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.DeactivateUser
DROP PROCEDURE IF EXISTS `DeactivateUser`;
DELIMITER //
CREATE PROCEDURE `DeactivateUser`(
	IN `UserMasterID_` INT



)
BEGIN
			DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;
		
		SET @PUBLCID  = (SELECT UM.PublicID FROM usermaster UM WHERE UM.UserMasterID = UserMasterID_);
		
		UPDATE teachermaster SET `IsActive` = 0 WHERE PublicUserID = @PUBLCID;
		UPDATE usermaster  SET `IsActive` = 0 , `Password` = 'DEACTIVATED' WHERE `UserMasterID` = UserMasterID_ ;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetAllApprovedLeaveRequest
DROP PROCEDURE IF EXISTS `GetAllApprovedLeaveRequest`;
DELIMITER //
CREATE PROCEDURE `GetAllApprovedLeaveRequest`(
	IN `StatusCode` CHAR(4)

)
BEGIN
			SELECT   CONCAT(UM.FirstName," ", IF (UM.OtherName IS NULL, '', UM.OtherName)," ",UM.LastName)	AS 'TeacherName',
					TCD.TeacherMasterID																							AS 'TeacherMasterID',
					TCD.TeacherDetailsPublicID																					AS 'TeacherDetailsPublicID',
					DATE_FORMAT(TCD.UpdatedOn, '%D %b %Y')																	AS 'UpdatedOn'
			FROM teacherdeatails TCD
			JOIN usermaster UM ON UM.PublicID = TCD.TeacherMasterID 
			WHERE UM.IsActive = 1 AND TCD.StatusCode = StatusCode ORDER BY TCD.UpdatedOn DESC;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetAllAwardedTeachers
DROP PROCEDURE IF EXISTS `GetAllAwardedTeachers`;
DELIMITER //
CREATE PROCEDURE `GetAllAwardedTeachers`()
BEGIN
		SELECT 	TAW.Name		AS 'Name',
					TAW.Award	AS 'Award'
		FROM teacherawarded TAW  ORDER BY TAW.Name ASC;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetAllClassDetails
DROP PROCEDURE IF EXISTS `GetAllClassDetails`;
DELIMITER //
CREATE PROCEDURE `GetAllClassDetails`()
BEGIN
SELECT CM.ClassMasterID,
		 CONCAT(CM.ClassName," (", CM.ClassCode,")") AS 'ClassName'
 FROM classmaster CM ORDER BY CM.ClassName ASC;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetAllDepartments
DROP PROCEDURE IF EXISTS `GetAllDepartments`;
DELIMITER //
CREATE PROCEDURE `GetAllDepartments`()
BEGIN
		SELECT 	DPT.ShortHand 		AS 'DepartmentID',
					DPT.DepartmentName	AS 'DepartmentName' 
		FROM department DPT;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetAllHolidays
DROP PROCEDURE IF EXISTS `GetAllHolidays`;
DELIMITER //
CREATE PROCEDURE `GetAllHolidays`(
	IN `limitstart_` INT,
	IN `limitend_` INT
)
BEGIN
     		SELECT 	HM.HolidyMasterID 	AS 'HolidyMasterID',
     					HM.Name					AS 'Name',
						HM.HolidayDate			AS 'HolidayDate',
						HM.IsActive				AS 'IsActive' ,
						IF(HM.IsActive = 1,'Yes', 'No')	AS 'ActiveStatus'	 
			FROM holidymaster HM ORDER BY HM.HolidayDate ASC LIMIT limitstart_, limitend_;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetAllLeaveRequest
DROP PROCEDURE IF EXISTS `GetAllLeaveRequest`;
DELIMITER //
CREATE PROCEDURE `GetAllLeaveRequest`(
	IN `StatusCode` CHAR(4)

)
BEGIN
			SELECT   CONCAT(UM.FirstName," ", IF (UM.OtherName IS NULL, '', UM.OtherName)," ",UM.LastName)	AS 'TeacherName',
					TCD.TeacherMasterID																							AS 'TeacherMasterID',
					TCD.TeacherDetailsPublicID																					AS 'TeacherDetailsPublicID',
					DATE_FORMAT(TCD.UpdatedOn, '%D %b %Y')																	AS 'UpdatedOn'
			FROM teacherdeatails TCD
			JOIN usermaster UM ON UM.PublicID = TCD.TeacherMasterID 
			WHERE UM.IsActive = 1 AND TCD.StatusCode = StatusCode ORDER BY TCD.UpdatedOn ASC;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetAllLeveRequestCount
DROP PROCEDURE IF EXISTS `GetAllLeveRequestCount`;
DELIMITER //
CREATE PROCEDURE `GetAllLeveRequestCount`()
BEGIN
		
		SET @REQUESTS  = (
								SELECT COUNT(TCD.TeacherDeatailsID) FROM teacherdeatails TCD 
								JOIN teachermaster TM ON TM.PublicUserID = TCD.TeacherMasterID
								WHERE TCD.StatusCode = 'PROC' AND TM.IsActive = 1 );
								
		
			SET @APPROVED  = (
								SELECT COUNT(TCD.TeacherDeatailsID) FROM teacherdeatails TCD 
								JOIN teachermaster TM ON TM.PublicUserID = TCD.TeacherMasterID
								WHERE TCD.StatusCode = 'APPR' AND TM.IsActive = 1 );
								
								
								
     	SET @REJECTED  = (
								SELECT COUNT(TCD.TeacherDeatailsID) FROM teacherdeatails TCD 
								JOIN teachermaster TM ON TM.PublicUserID = TCD.TeacherMasterID
								WHERE TCD.StatusCode = 'FRJC' AND TM.IsActive = 1 );
		

		
		
		SELECT @REQUESTS	AS 'LeaveRequests',
			    @APPROVED	AS 'LeaveApproved',
				 @REJECTED	AS 'LeaveRejected';

END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetAllStudentAttendanceReport
DROP PROCEDURE IF EXISTS `GetAllStudentAttendanceReport`;
DELIMITER //
CREATE PROCEDURE `GetAllStudentAttendanceReport`()
BEGIN
SELECT 
       IF(SRPD.TimeIn IS NULL,'Absent', SRPD.TimeIn) AS 'TimeIn',
       IF(SRPD.TimeOut IS NULL,'Absent', SRPD.TimeOut)  AS 'TimeOut',
		SRM.StudentMasterPublicID,
		SRM.StudentNo,
      CONCAT(SRM.FirstName," ", IF (SRM.OtherName IS NULL, '', SRM.OtherName)," ",SRM.LastName)	AS 'StudentName',
      GM.ShortName,
      MR.MaritalStatus,
      CONCAT("Grade ", CM.ClassCode) AS 'Class',
      SRM.DOB,
      SRM.EmailAddress,
      SRM.GuardianContactNo,
      SRM.GuardianMaleName,
      SRM.GuardianFemaleName,
      SRM.Address
FROM studentmaster SRM JOIN gendermaster GM ON GM.GenderMasterID = SRM.GenderID 
JOIN maritalstatusmaster MR ON MR.MaritalStatusMasterID = SRM.MaritalStatusID 
JOIN studentrreportdetails SRPD ON SRPD.StudentPublicID =  SRM.StudentMasterPublicID
JOIN classmaster CM ON CM.ClassMasterID =  SRM.ClassMasterD;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetAllStudentAttendanceReportByClass
DROP PROCEDURE IF EXISTS `GetAllStudentAttendanceReportByClass`;
DELIMITER //
CREATE PROCEDURE `GetAllStudentAttendanceReportByClass`(
	IN `ClassMasterID` INT
)
BEGIN
SELECT 
       IF(SRPD.TimeIn IS NULL,'Absent', SRPD.TimeIn) AS 'TimeIn',
       IF(SRPD.TimeOut IS NULL,'Absent', SRPD.TimeOut)  AS 'TimeOut',
		SRM.StudentMasterPublicID,
		SRM.StudentNo,
      CONCAT(SRM.FirstName," ", IF (SRM.OtherName IS NULL, '', SRM.OtherName)," ",SRM.LastName)	AS 'StudentName',
      GM.ShortName,
      MR.MaritalStatus,
      CONCAT("Grade ", CM.ClassCode) AS 'Class',
      SRM.DOB,
      SRM.EmailAddress,
      SRM.GuardianContactNo,
      SRM.GuardianMaleName,
      SRM.GuardianFemaleName,
      SRM.Address
FROM studentmaster SRM JOIN gendermaster GM ON GM.GenderMasterID = SRM.GenderID 
JOIN maritalstatusmaster MR ON MR.MaritalStatusMasterID = SRM.MaritalStatusID 
JOIN studentrreportdetails SRPD ON SRPD.StudentPublicID =  SRM.StudentMasterPublicID
JOIN classmaster CM ON CM.ClassMasterID =  SRM.ClassMasterD WHERE CM.ClassMasterID = ClassMasterID ORDER BY SRPD.CreatedOn desc; 

END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetAllStudents
DROP PROCEDURE IF EXISTS `GetAllStudents`;
DELIMITER //
CREATE PROCEDURE `GetAllStudents`()
BEGIN
SELECT SRM.StudentNo,
      CONCAT(SRM.FirstName," ", IF (SRM.OtherName IS NULL, '', SRM.OtherName)," ",SRM.LastName)	AS 'StudentName',
      GM.ShortName,
      MR.MaritalStatus,
      CONCAT("Grade ", CM.ClassCode) AS 'Class',
      SRM.DOB,
      SRM.EmailAddress,
      SRM.GuardianContactNo,
      SRM.GuardianMaleName,
      SRM.GuardianFemaleName,
      SRM.Address,
      SRM.StudentMasterPublicID
FROM studentmaster SRM JOIN gendermaster GM ON GM.GenderMasterID = SRM.GenderID 
JOIN maritalstatusmaster MR ON MR.MaritalStatusMasterID = SRM.MaritalStatusID 
JOIN classmaster CM ON CM.ClassMasterID =  SRM.ClassMasterD ORDER BY SRM.FirstName, SRM.IsActive ASC;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetAwardedTeachers
DROP PROCEDURE IF EXISTS `GetAwardedTeachers`;
DELIMITER //
CREATE PROCEDURE `GetAwardedTeachers`(
	IN `limitstart_` INT,
	IN `limitend_` INT
)
BEGIN
		SELECT 	TAW.TeacherAwardedID	AS 'TeacherAwardedID',
					TAW.Name					AS 'Name',
					TAW.Award				AS 'Award'
		FROM teacherawarded TAW  ORDER BY TAW.Name ASC LIMIT limitstart_, limitend_;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetCheckoutStudentByID
DROP PROCEDURE IF EXISTS `GetCheckoutStudentByID`;
DELIMITER //
CREATE PROCEDURE `GetCheckoutStudentByID`(
	IN `STUDENTMASTERID` INT
)
BEGIN
SELECT SRPD.StudentReportDetailsPublicID, 
		SRM.StudentMasterPublicID,
		SRM.StudentNo,
      CONCAT(SRM.FirstName," ", IF (SRM.OtherName IS NULL, '', SRM.OtherName)," ",SRM.LastName)	AS 'StudentName',
      GM.ShortName,
      MR.MaritalStatus,
      CONCAT("Grade ", CM.ClassCode) AS 'Class',
      SRM.DOB,
      SRM.EmailAddress,
      SRM.GuardianContactNo,
      SRM.GuardianMaleName,
      SRM.GuardianFemaleName,
      SRM.Address
FROM studentmaster SRM JOIN gendermaster GM ON GM.GenderMasterID = SRM.GenderID 
JOIN maritalstatusmaster MR ON MR.MaritalStatusMasterID = SRM.MaritalStatusID 
JOIN studentrreportdetails SRPD ON SRPD.StudentPublicID =  SRM.StudentMasterPublicID
JOIN classmaster CM ON CM.ClassMasterID =  SRM.ClassMasterD WHERE SRM.StudentMasterID =STUDENTMASTERID AND SRM.StudentMasterPublicID IN (SELECT SRD.StudentPublicID FROM studentrreportdetails SRD WHERE DATE(SRD.TimeIn) = DATE(CURDATE()) AND SRD.TimeOut IS NULL) AND DATE(SRPD.TimeIn) = DATE(CURDATE()) AND SRPD.TimeOut IS NULL;

END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetClassByID
DROP PROCEDURE IF EXISTS `GetClassByID`;
DELIMITER //
CREATE PROCEDURE `GetClassByID`(
	IN `GradeMasterID` INT
)
BEGIN
SELECT * FROM classmaster CM WHERE CM.GradeMasterID =  GradeMasterID;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetClassDetails
DROP PROCEDURE IF EXISTS `GetClassDetails`;
DELIMITER //
CREATE PROCEDURE `GetClassDetails`(
	IN `ClassMasterID` INT
)
BEGIN
SELECT * FROM classmaster CM WHERE CM.ClassMasterID = ClassMasterID;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetCountryCode
DROP PROCEDURE IF EXISTS `GetCountryCode`;
DELIMITER //
CREATE PROCEDURE `GetCountryCode`()
BEGIN
		SELECT   CT.CountryID		AS 'CountryID',
					CT.ConuntryCode 	AS 'ConuntryCode'
		FROM country CT WHERE CT.IsActive=1;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetDashboaredNumbers
DROP PROCEDURE IF EXISTS `GetDashboaredNumbers`;
DELIMITER //
CREATE PROCEDURE `GetDashboaredNumbers`()
BEGIN
		SET @USERCOIUNT = (SELECT COUNT(UM.PublicID) FROM usermaster UM WHERE UM.IsActive = 1);
		
		SET @SURVEYCOUNT  = (SELECT COUNT(SM.SurvayMasterID) FROM survaymaster SM WHERE SM.IsActive = 1);
		
		SET @SURVAYDAYADDEDCOUNT = (SELECT COUNT(SM.SurvayMasterID) FROM survaymaster SM WHERE SM.IsActive = 1 AND DATE(SM.UpdatedOn) = CURDATE());
		
		SET @SURVAYDAYRESPONSESCOUNT  = (SELECT SUM(SDR.Response) FROM surveydayresponse SDR);
		
		SELECT @USERCOIUNT					AS 'UserCount',
				 @SURVEYCOUNT					AS 'SurveyCount',
				 @SURVAYDAYADDEDCOUNT 		AS 'SurveyDayCount',
				 @SURVAYDAYRESPONSESCOUNT	AS 'SurveyDayResponseCount';
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetDepartmentByCode
DROP PROCEDURE IF EXISTS `GetDepartmentByCode`;
DELIMITER //
CREATE PROCEDURE `GetDepartmentByCode`(
	IN `DEPARTMENTCODE_` CHAR(4)
)
BEGIN
		SET @DEPARTMENTCODE = DEPARTMENTCODE_;

		SELECT 	DP.DepartmentID		AS 'DepartmentID',
					DP.DepartmentName		AS 'DepartmentName',
					DP.ShortHand			AS 'ShortHand'
		FROM department DP
		WHERE DP.ShortHand = @DEPARTMENTCODE;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetDistrictByProvinceId
DROP PROCEDURE IF EXISTS `GetDistrictByProvinceId`;
DELIMITER //
CREATE PROCEDURE `GetDistrictByProvinceId`(
	IN `Provinceid` INT



)
BEGIN
		SET @ProvinceId = Provinceid;
		SELECT	DST.DistrictID AS districtId,
		 			DST.DistrictName		AS name
		FROM district DST WHERE DST.ProvinceID = @ProvinceId AND DST.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetEmailAdressByPositionID
DROP PROCEDURE IF EXISTS `GetEmailAdressByPositionID`;
DELIMITER //
CREATE PROCEDURE `GetEmailAdressByPositionID`(
	IN `PositionID_` INT

)
BEGIN
			SELECT IF (UM.EmailAddress IS NULL, '', UM.EmailAddress)	AS 'EmailAddress'
			FROM usermaster UM 
			JOIN teachermaster TM  ON UM.PublicID = TM.PublicUserID WHERE TM.PositionID = PositionID_ AND UM.IsActive = 1 AND TM.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetEmailData
DROP PROCEDURE IF EXISTS `GetEmailData`;
DELIMITER //
CREATE PROCEDURE `GetEmailData`()
BEGIN
		DECLARE STATUSCODE CHAR(4);
		DECLARE NEWSTATUSCODE CHAR(4);
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;
		
		SET STATUSCODE = 'PEND', NEWSTATUSCODE = 'PROC';
		UPDATE emailservice SET `Status` = NEWSTATUSCODE WHERE `Status` = STATUSCODE ;
		 
		SELECT   EM.EmailSerial		AS 'EmailSerial',
					EM.SendData			AS 'SendData',
					EM.`Status`			AS 'Status',
					EM.EmailSubject	AS 'EmailSubject',
					EM.EmailAddress	AS 'EmailAddress'
		FROM emailservice EM WHERE EM.`Status` = NEWSTATUSCODE;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetEmptyResult
DROP PROCEDURE IF EXISTS `GetEmptyResult`;
DELIMITER //
CREATE PROCEDURE `GetEmptyResult`()
BEGIN
			SELECT 1  AS 'Nothing'
						LIMIT 0;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetGender
DROP PROCEDURE IF EXISTS `GetGender`;
DELIMITER //
CREATE PROCEDURE `GetGender`()
BEGIN
		SELECT 	GM.GenderMasterID AS 'genderId',
					GM.Gender		AS 'gender'
		FROM gendermaster GM;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetHODEmailAdressByDepartment
DROP PROCEDURE IF EXISTS `GetHODEmailAdressByDepartment`;
DELIMITER //
CREATE PROCEDURE `GetHODEmailAdressByDepartment`(
	IN `DepartmentCode_` VARCHAR(50)
,
	IN `PositionID` INT
)
BEGIN

		SET @POSITIONID = PositionID;
		
		SELECT IF (UM.EmailAddress IS NULL, Null, UM.EmailAddress)		AS 'EmailAddress'
		FROM usermaster UM 
		JOIN teachermaster TM  ON TM.PublicUserID = UM.PublicID
		WHERE TM.DepartmentCode = DepartmentCode_ AND TM.IsActive = 1 AND TM.PositionID =  @POSITIONID;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetLeaveRequestDetails
DROP PROCEDURE IF EXISTS `GetLeaveRequestDetails`;
DELIMITER //
CREATE PROCEDURE `GetLeaveRequestDetails`(
	IN `TeacherDetailsPublicID_` VARCHAR(50)


)
BEGIN
		SELECT CONCAT (UM.FirstName," ", IF(UM.OtherName IS NULL ,'',UM.OtherName), " ", UM.LastName)   AS 'Names',
			TD.TeacherMasterID																						   AS 'TeacherMasterID',
			TD.TeacherDetailsPublicID																       			AS 'TeacherDetailsPublicID',
			DP.DepartmentName																								AS 'DepartmentName',
			TD.LeaveFrom																									AS 'LeaveFrom',
			TD.LeaveTo																										AS 'LeaveTo',
			DATEDIFF(TD.LeaveTo,TD.LeaveFrom) 																		AS 'NumberOfDays',
			TD.ReasonForLeave																								AS 'ReasonForLeave',
			TD.ApprovedBy																									AS 'ApprovedBy',
			TD.AuthorizedBy																								AS 'AuthorizedBy',
			DATE_FORMAT(TD.UpdatedOn, '%D %b %Y')																	AS 'Days',
			LTM.LeaveType																									AS 'LeaveType'				
		FROM usermaster UM
		JOIN teachermaster TM ON TM.PublicUserID = UM.PublicID
		JOIN teacherdeatails TD ON TD.TeacherMasterID = TM.PublicUserID
		JOIN department DP ON DP.ShortHand = TM.DepartmentCode
		JOIN leavetypemaster LTM ON LTM.LeaveTypeMasterID = TD.LeaveTypeID
		WHERE TD.TeacherDetailsPublicID = TeacherDetailsPublicID_ ;

END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetLeaveRequests
DROP PROCEDURE IF EXISTS `GetLeaveRequests`;
DELIMITER //
CREATE PROCEDURE `GetLeaveRequests`(
	IN `StatusCode` CHAR(4)

,
	IN `DepatmentCode_` CHAR(4)


)
BEGIN
		SELECT   CONCAT(UM.FirstName," ", IF (UM.OtherName IS NULL, '', UM.OtherName)," ",UM.LastName)	AS 'TeacherName',
					TCD.TeacherMasterID																							AS 'TeacherMasterID',
					TCD.TeacherDetailsPublicID																					AS 'TeacherDetailsPublicID',
					DATE_FORMAT(TCD.UpdatedOn, '%D %b %Y')																	AS 'UpdatedOn'
		FROM teacherdeatails TCD
		JOIN usermaster UM ON UM.PublicID = TCD.TeacherMasterID
		JOIN teachermaster TM ON TM.PublicUserID = TCD.TeacherMasterID
		WHERE UM.IsActive = 1 AND TCD.StatusCode = StatusCode AND TM.DepartmentCode = DepatmentCode_  ORDER BY TCD.UpdatedOn ASC;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetLeaveStatusByID
DROP PROCEDURE IF EXISTS `GetLeaveStatusByID`;
DELIMITER //
CREATE PROCEDURE `GetLeaveStatusByID`(
	IN `USERPUBLICID_` VARCHAR(50)
)
BEGIN
		SELECT IF (TM.PublicUserID IS NULL OR TM.PublicUserID = '', 0, TM.IsOnLeave) AS 'TeacherLeaveStatus'
		FROM teachermaster TM WHERE TM.PublicUserID = USERPUBLICID_;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetLeaveTeachersRequests
DROP PROCEDURE IF EXISTS `GetLeaveTeachersRequests`;
DELIMITER //
CREATE PROCEDURE `GetLeaveTeachersRequests`(
	IN `StatusCode` CHAR(4),
	IN `DepatmentCode_` CHAR(4),
	IN `TEACHERID_` VARCHAR(50),
	IN `StatusCode_Two` CHAR(4)
)
BEGIN
		SELECT   CONCAT(UM.FirstName," ", IF (UM.OtherName IS NULL, '', UM.OtherName)," ",UM.LastName)	AS 'TeacherName',
					TCD.TeacherMasterID																							AS 'TeacherMasterID',
					TCD.TeacherDetailsPublicID																					AS 'TeacherDetailsPublicID',
					DATE_FORMAT(TCD.UpdatedOn, '%D %b %Y')																	AS 'UpdatedOn'
		FROM teacherdeatails TCD
		JOIN usermaster UM ON UM.PublicID = TCD.TeacherMasterID
		JOIN teachermaster TM ON TM.PublicUserID = TCD.TeacherMasterID
		WHERE ((TCD.StatusCode = StatusCode OR TCD.StatusCode = StatusCode_Two ) AND (UM.IsActive = 1 AND TM.DepartmentCode = DepatmentCode_ AND TCD.TeacherMasterID = TEACHERID_  ) ) ORDER BY TCD.UpdatedOn ASC;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetLeaveTeachersRequests2
DROP PROCEDURE IF EXISTS `GetLeaveTeachersRequests2`;
DELIMITER //
CREATE PROCEDURE `GetLeaveTeachersRequests2`(
	IN `StatusCode` CHAR(4),
	IN `DepatmentCode_` CHAR(4),
	IN `TEACHERID_` VARCHAR(50)
)
    COMMENT 'This sp was added because it did not know the effect it would do to modify the other '
BEGIN
		SELECT   CONCAT(UM.FirstName," ", IF (UM.OtherName IS NULL, '', UM.OtherName)," ",UM.LastName)	AS 'TeacherName',
					TCD.TeacherMasterID																							AS 'TeacherMasterID',
					TCD.TeacherDetailsPublicID																					AS 'TeacherDetailsPublicID',
					DATE_FORMAT(TCD.UpdatedOn, '%D %b %Y')																	AS 'UpdatedOn'
		FROM teacherdeatails TCD
		JOIN usermaster UM ON UM.PublicID = TCD.TeacherMasterID
		JOIN teachermaster TM ON TM.PublicUserID = TCD.TeacherMasterID
		WHERE UM.IsActive = 1 AND TCD.StatusCode = StatusCode AND TM.DepartmentCode = DepatmentCode_ AND TCD.TeacherMasterID = TEACHERID_ ORDER BY TCD.UpdatedOn ASC;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetLeaveTeken
DROP PROCEDURE IF EXISTS `GetLeaveTeken`;
DELIMITER //
CREATE PROCEDURE `GetLeaveTeken`(
	IN `TeacherID_` VARCHAR(50),
	IN `START_DATE_` DATE,
	IN `ENDE_DATE` DATE
)
BEGIN
		SET @STATUS_  = 'APPR';
		SET @TEACHER_ID = TeacherID_;

		SELECT	TD.ReasonForLeave		 							AS 'ReasonForLeave',
					TD.LeaveFrom			 							AS 'LeaveFrom',
					TD.LeaveTo				 							AS 'LeaveTo',
					DATE(TD.ReturnedDate) 							AS 'ReturnedDate',
					LTM.LeaveType			 							AS 'LeaveType',
					TD.AuthorizedBy		 							AS 'AuthorizedBy',	
					DATEDIFF(TD.LeaveTo,TD.LeaveFrom)	   	AS 'LeaveApplied',
					DATEDIFF(TD.ReturnedDate, TD.LeaveFrom)   AS 'LeaveTaken'
	FROM teacherdeatails TD 
	JOIN leavetypemaster LTM ON LTM.LeaveTypeMasterID =  TD.LeaveTypeID 
	WHERE TD.StatusCode = @STATUS_
	AND TD.TeacherMasterID = @TEACHER_ID
	AND DATE(TD.LeaveFrom) BETWEEN START_DATE_ AND ENDE_DATE
	ORDER BY TD.LeaveFrom;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetLeaveTypes
DROP PROCEDURE IF EXISTS `GetLeaveTypes`;
DELIMITER //
CREATE PROCEDURE `GetLeaveTypes`()
BEGIN
		SELECT 	LTM.LeaveTypeMasterID	AS 'LeaveTypeMasterID',
					LTM.LeaveType			AS 'LeaveType'
		FROM leavetypemaster LTM;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetLeveRequestCount
DROP PROCEDURE IF EXISTS `GetLeveRequestCount`;
DELIMITER //
CREATE PROCEDURE `GetLeveRequestCount`(
	IN `DepartmentCode_` CHAR(4)


)
BEGIN
		
		SET @REQUESTS  = (
								SELECT COUNT(TCD.TeacherDeatailsID) FROM teacherdeatails TCD 
								JOIN teachermaster TM ON TM.PublicUserID = TCD.TeacherMasterID
								WHERE TCD.StatusCode = 'PEND' AND TM.DepartmentCode = DepartmentCode_ AND TM.IsActive = 1 );
								
		
			SET @APPROVED  = (
								SELECT COUNT(TCD.TeacherDeatailsID) FROM teacherdeatails TCD 
								JOIN teachermaster TM ON TM.PublicUserID = TCD.TeacherMasterID
								WHERE TCD.StatusCode = 'PROC' AND TM.DepartmentCode = DepartmentCode_ AND TM.IsActive = 1);
								
								
								
     	SET @REJECTED  = (
								SELECT COUNT(TCD.TeacherDeatailsID) FROM teacherdeatails TCD 
								JOIN teachermaster TM ON TM.PublicUserID = TCD.TeacherMasterID
								WHERE TCD.StatusCode = 'REGE' AND TM.DepartmentCode = DepartmentCode_ AND TM.IsActive = 1);
		

		
		
		SELECT @REQUESTS	AS 'LeaveRequests',
			    @APPROVED	AS 'LeaveApproved',
				 @REJECTED	AS 'LeaveRejected';

END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetLeveTeacherRequestCount
DROP PROCEDURE IF EXISTS `GetLeveTeacherRequestCount`;
DELIMITER //
CREATE PROCEDURE `GetLeveTeacherRequestCount`(
	IN `DepartmentCode_` CHAR(4),
	IN `TeacherID` VARCHAR (50)
)
BEGIN
		
		SET @REQUESTS  = (
								SELECT COUNT(TCD.TeacherDeatailsID) FROM teacherdeatails TCD 
								JOIN teachermaster TM ON TM.PublicUserID = TCD.TeacherMasterID
								WHERE TCD.StatusCode = 'PEND' AND TM.DepartmentCode = DepartmentCode_ AND TCD.TeacherMasterID = TeacherID AND TM.IsActive = 1);
								
		
			SET @APPROVED  = (
								SELECT COUNT(TCD.TeacherDeatailsID) FROM teacherdeatails TCD 
								JOIN teachermaster TM ON TM.PublicUserID = TCD.TeacherMasterID
								WHERE TCD.StatusCode = 'APPR' AND TM.DepartmentCode = DepartmentCode_ AND TCD.TeacherMasterID = TeacherID  AND TM.IsActive = 1);
								
								
								
     	SET @REJECTED  = (
								SELECT COUNT(TCD.TeacherDeatailsID) FROM teacherdeatails TCD 
								JOIN teachermaster TM ON TM.PublicUserID = TCD.TeacherMasterID
								WHERE (TCD.StatusCode = 'FRJC' OR TCD.StatusCode = 'REGE' ) AND TM.DepartmentCode = DepartmentCode_ AND TCD.TeacherMasterID = TeacherID   AND TM.IsActive = 1);
		

		
		
		SELECT @REQUESTS	AS 'LeaveRequests',
			    @APPROVED	AS 'LeaveApproved',
				 @REJECTED	AS 'LeaveRejected';

END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetMaritalStatus
DROP PROCEDURE IF EXISTS `GetMaritalStatus`;
DELIMITER //
CREATE PROCEDURE `GetMaritalStatus`()
BEGIN
			SELECT 	MS.MaritalStatusMasterID   	 AS 'MaritalStatusMasterID',
						MS.MaritalStatus			   	AS 'MaritalStatus'
			FROM maritalstatusmaster MS WHERE MS.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetMaxTems
DROP PROCEDURE IF EXISTS `GetMaxTems`;
DELIMITER //
CREATE PROCEDURE `GetMaxTems`()
BEGIN
		SELECT SCH.MaxTerms	'MaxTerms' 
		FROM school SCH;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetNextHoliday
DROP PROCEDURE IF EXISTS `GetNextHoliday`;
DELIMITER //
CREATE PROCEDURE `GetNextHoliday`()
BEGIN
		SET @NEXT_HOILDAY = (SELECT HM.HolidayDate FROM holidymaster HM WHERE HM.HolidayDate >= CURDATE() AND HM.IsActive=1 ORDER BY HM.HolidayDate ASC LIMIT 1);

		SELECT DATEDIFF(@NEXT_HOILDAY,CURDATE()) AS 'NextHolidy';
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetNoOfTeacherReportTimes
DROP PROCEDURE IF EXISTS `GetNoOfTeacherReportTimes`;
DELIMITER //
CREATE PROCEDURE `GetNoOfTeacherReportTimes`(
	IN `TeacherMasterID_` VARCHAR(50)
)
BEGIN
		SELECT COUNT(TRD.TeacherDetailsPublicID) AS 'Reportedtimes'
		FROM teacherreportdetails TRD 
		WHERE TRD.TeacherMasterPublicID = TeacherMasterID_ AND TRD.TimeIn IS NOT NULL AND TRD.TimeOut IS NOT NULL;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetPositionDetails
DROP PROCEDURE IF EXISTS `GetPositionDetails`;
DELIMITER //
CREATE PROCEDURE `GetPositionDetails`(
	IN `limitstart_` INT,
	IN `limitend_` INT
)
BEGIN
		
       
     		SELECT 	TPM.TeacherPositionMasterID 	AS 'TeacherPositionMasterID',
						TPM.PositionName					AS 'PositionName',
						TPM.PositionDescription			AS 'PositionDescription',
						TPM.IsActive						AS 'IsActive' 			 
			FROM teacherpositionmaster TPM ORDER BY TPM.TeacherPositionMasterID ASC LIMIT limitstart_, limitend_;
	END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetPositions
DROP PROCEDURE IF EXISTS `GetPositions`;
DELIMITER //
CREATE PROCEDURE `GetPositions`()
    COMMENT 'The sp is used to get the aviable defined positions'
BEGIN
			SELECT   TPM.TeacherPositionMasterID	AS 'TeacherPositionMasterID',
						TPM.PositionName					AS 'PositionName'
			FROM teacherpositionmaster TPM WHERE TPM.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetPositonPages
DROP PROCEDURE IF EXISTS `GetPositonPages`;
DELIMITER //
CREATE PROCEDURE `GetPositonPages`(
	IN `limit_` VARCHAR(50)
)
BEGIN
		SET @LIMIT_ = limit_;
		SET @NUMBEROFTERMS  = (SELECT COUNT(TPM.TeacherPositionMasterID)  AS COUNT FROM teacherpositionmaster TPM );
		
		SET @NUMBEROFPAGES = @NUMBEROFTERMS/@LIMIT_;
		
		SELECT CEILING(@NUMBEROFPAGES) AS 'Pages',@NUMBEROFTERMS AS 'TotalRecords';
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetProvinces
DROP PROCEDURE IF EXISTS `GetProvinces`;
DELIMITER //
CREATE PROCEDURE `GetProvinces`()
BEGIN
			SELECT	PV.ProvinceID		AS 'ProvinceID',
						PV.ProvinceName	AS 'ProvinceName'
			FROM province PV;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetSequence
DROP PROCEDURE IF EXISTS `GetSequence`;
DELIMITER //
CREATE PROCEDURE `GetSequence`(
	IN `SequenceID` INT


)
    COMMENT 'This sp is used to get the defined sequnce'
BEGIN
				DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
			     SELECT 0 AS message;
			     ROLLBACK;
 END;
				
				SET @LASTINSERTEDID = (SELECT SM.LastInsertedID FROM sequencemaster SM WHERE SM.SequenceMasterID = SequenceID );
				
				SET @NEWLASTINSETEDID  = (( SELECT SM.LastInsertedID FROM sequencemaster SM WHERE SM.SequenceMasterID = SequenceID)+1 );
				
				SET @SEQUNCECODE = (SELECT SM.SequnceCode FROM sequencemaster SM WHERE SM.SequenceMasterID = SequenceID);
				
				SET @SEQUNCE  = ( CONCAT(@SEQUNCECODE,"000000000",@NEWLASTINSETEDID) );
				
				UPDATE sequencemaster SET `LastInsertedID` = @NEWLASTINSETEDID WHERE SequenceMasterID = SequenceID;
				
				SELECT @SEQUNCE	AS 'SequnceNumber';
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetSessionDetails
DROP PROCEDURE IF EXISTS `GetSessionDetails`;
DELIMITER //
CREATE PROCEDURE `GetSessionDetails`(
	IN `UserMasterID` INT,
	IN `SerialID` VARCHAR(50),
	IN `TokenID` VARCHAR(50)

)
    COMMENT 'Used to get the details about user sessions '
BEGIN
		SELECT 	SES.UserMasterPublicID		AS 'UserMasterPublicID',
					SES.SerialID					AS 'SerialID',
					SES.TokenID						AS 'TokenID' 
		FROM `session` SES WHERE SES.UserMasterPublicID  = UserMasterID AND SES.SerialID = SerialID AND SES.TokenID = TokenID;

END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetSessionDetailsByUserMasterPublicID
DROP PROCEDURE IF EXISTS `GetSessionDetailsByUserMasterPublicID`;
DELIMITER //
CREATE PROCEDURE `GetSessionDetailsByUserMasterPublicID`(
	IN `UserMasterPublicID` VARCHAR(50)

)
BEGIN
		SELECT 	SN.SerialID				AS 'SerialID',
					SN.TokenID				AS 'TokenID',
					SN.TokenCreatedTime	AS 'TokenCreatedTime',
					SN.UpdatedBy			AS 'Username',
					SN.UserMasterPublicID AS 'UserMasterPublicID'
		FROM `session` SN WHERE SN.UserMasterPublicID = UserMasterPublicID;

END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetStudentNo
DROP PROCEDURE IF EXISTS `GetStudentNo`;
DELIMITER //
CREATE PROCEDURE `GetStudentNo`(
	IN `SequenceID` INT
)
BEGIN

 			DECLARE LASTINSERTEDID VARCHAR(50);
			DECLARE NEWLASTINSETEDID VARCHAR(50);
			DECLARE SEQUNCECODE CHAR(4);
		
    
         SELECT SM.LastInsertedID INTO LASTINSERTEDID FROM sequencemaster SM WHERE SM.SequenceMasterID = SequenceID;
			
			SELECT SM.LastInsertedID+1 INTO NEWLASTINSETEDID FROM sequencemaster SM  WHERE SM.SequenceMasterID = SequenceID;
				
			SELECT SM.SequnceCode INTO  SEQUNCECODE FROM sequencemaster SM  WHERE SM.SequenceMasterID = SequenceID;
				
			UPDATE sequencemaster SET `LastInsertedID` = NEWLASTINSETEDID WHERE SequenceMasterID = SequenceID;
				
			-- return the Sequence
		 SELECT	CONCAT('SN',YEAR(CURDATE()),"0",NEWLASTINSETEDID) AS SequnceNumber;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetStudetDetailsByID
DROP PROCEDURE IF EXISTS `GetStudetDetailsByID`;
DELIMITER //
CREATE PROCEDURE `GetStudetDetailsByID`(
	IN `StuentMasterID` INT
)
BEGIN
SELECT SRM.StudentMasterPublicID,
		SRM.StudentNo,
      CONCAT(SRM.FirstName," ", IF (SRM.OtherName IS NULL, '', SRM.OtherName)," ",SRM.LastName)	AS 'StudentName',
      GM.ShortName,
      MR.MaritalStatus,
      CONCAT("Grade ", CM.ClassCode) AS 'Class',
      SRM.DOB,
      SRM.EmailAddress,
      SRM.GuardianContactNo,
      SRM.GuardianMaleName,
      SRM.GuardianFemaleName,
      SRM.Address
FROM studentmaster SRM JOIN gendermaster GM ON GM.GenderMasterID = SRM.GenderID 
JOIN maritalstatusmaster MR ON MR.MaritalStatusMasterID = SRM.MaritalStatusID 
JOIN classmaster CM ON CM.ClassMasterID =  SRM.ClassMasterD WHERE SRM.StudentMasterID =StuentMasterID AND SRM.StudentMasterPublicID NOT IN (SELECT SRD.StudentPublicID FROM studentrreportdetails SRD WHERE DATE(SRD.TimeIn) = DATE(CURDATE()));
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetTeacherAbsentTime
DROP PROCEDURE IF EXISTS `GetTeacherAbsentTime`;
DELIMITER //
CREATE PROCEDURE `GetTeacherAbsentTime`(
	IN `STARTDATE_` DATE,
	IN `ENDDATE_` DATE
)
BEGIN
	
		SET @START_DATE = STARTDATE_;
		SET @END_DATE = ENDDATE_;
		SET @STATUS_CODE = 'APPR';
		
		SET @TOTAL_DAYS  = (SELECT count_no_weekdays(@START_DATE,@END_DATE));
		
		
		SET @TOTAL_HOIDAYS = (SELECT COUNT(HM.HolidyMasterID) FROM holidymaster HM WHERE DATE(HM.HolidayDate) BETWEEN STARTDATE_ AND ENDDATE_ AND HM.IsActive = 1);
		
		SET @TOTAL_DAYS_EX_HOLIDAYS = @TOTAL_DAYS - @TOTAL_HOIDAYS;
		
				
		SELECT 	UM.PublicID																																												AS 'TeacherID',
				   CONCAT(UM.FirstName, ' ',IF(UM.OtherName IS NULL,'', UM.OtherName),' ',UM.LastName)																				AS 'Names', 
					CONCAT('+260 ',UM.ContactNo)																																						AS 'ContactNo',
					IF (
							UM.EmailAddress IS NULL,	
							'None',
							UM.EmailAddress
						) 																																														AS 'EmailAddress',
				   
					@TOTAL_DAYS_EX_HOLIDAYS  																																							AS 'TotalDaysAbsent',
					IF (
							((@TOTAL_DAYS_EX_HOLIDAYS - SUM(DISTINCT count_no_weekdays(TD.LeaveFrom,TD.LeaveTo))) - COUNT(TRD.TeacherMasterPublicID)) IS NULL ,
							( @TOTAL_DAYS_EX_HOLIDAYS  - COUNT(TRD.TeacherMasterPublicID)),
								
								IF( 
									(@TOTAL_DAYS_EX_HOLIDAYS  - COUNT(TRD.TeacherMasterPublicID)) 
										< 
									(SUM(DISTINCT count_no_weekdays(TD.LeaveFrom,TD.LeaveTo))),
									0,
									((@TOTAL_DAYS_EX_HOLIDAYS - SUM(DISTINCT count_no_weekdays(TD.LeaveFrom,TD.LeaveTo))) - COUNT(TRD.TeacherMasterPublicID))	
									) 
						)																																														AS 'DaysAbsentNoPermision',
						
				
					IF(
							SUM(DISTINCT count_no_weekdays(TD.LeaveFrom,TD.LeaveTo)) IS NULL,
							0, 
								IF(
									SUM(DISTINCT count_no_weekdays(TD.LeaveFrom,TD.LeaveTo)) 
									>
									(@TOTAL_DAYS_EX_HOLIDAYS  - COUNT(TRD.TeacherMasterPublicID)),
									(@TOTAL_DAYS_EX_HOLIDAYS  - COUNT(TRD.TeacherMasterPublicID)),
									SUM(DISTINCT count_no_weekdays(TD.LeaveFrom,TD.LeaveTo))
									)
						)																																														AS 'DaysAbsentPermision'
				
		FROM ve_teacherreportdetails VTRD 
		LEFT JOIN teacherreportdetails TRD ON VTRD.ID = TRD.TeacherDetailsID AND DATE (TRD.UpdatedOn) BETWEEN @START_DATE AND @END_DATE
		AND TRD.TimeIn IS NOT NULL AND TRD.TimeOut IS NOT NULL  
		JOIN usermaster UM ON UM.PublicID = VTRD.TeacherMasterID 
		LEFT JOIN teacherdeatails TD ON TD.TeacherMasterID = VTRD.TeacherMasterID AND TD.LeaveFrom BETWEEN @START_DATE AND @END_DATE AND TD.StatusCode= @STATUS_CODE
		GROUP BY  VTRD.TeacherMasterID,TD.TeacherMasterID ORDER BY UM.FirstName;	


	



END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetTeacherAbsentTimeByDepatemntCode
DROP PROCEDURE IF EXISTS `GetTeacherAbsentTimeByDepatemntCode`;
DELIMITER //
CREATE PROCEDURE `GetTeacherAbsentTimeByDepatemntCode`(
	IN `STARTDATE_` DATE,
	IN `ENDDATE_` DATE,
	IN `DepartmentCode_` CHAR(4)
)
BEGIN
		
		SET @START_DATE = STARTDATE_;
		SET @END_DATE = ENDDATE_;
		SET @STATUS_CODE = 'APPR';
		
		SET @TOTAL_DAYS  = (SELECT count_no_weekdays(@START_DATE,@END_DATE));
		
		
		SET @TOTAL_HOIDAYS = (SELECT COUNT(HM.HolidyMasterID) FROM holidymaster HM WHERE DATE(HM.HolidayDate) BETWEEN STARTDATE_ AND ENDDATE_ AND HM.IsActive = 1);
		
		SET @TOTAL_DAYS_EX_HOLIDAYS = @TOTAL_DAYS - @TOTAL_HOIDAYS;
		
				
		SELECT 	UM.PublicID																																												AS 'TeacherID',
				   CONCAT(UM.FirstName, ' ',IF(UM.OtherName IS NULL,'', UM.OtherName),' ',UM.LastName)																				AS 'Names', 
					CONCAT('+260 ',UM.ContactNo)																																						AS 'ContactNo',
					IF (
							UM.EmailAddress IS NULL,	
							'None',
							UM.EmailAddress
						) 																																														AS 'EmailAddress',
				   
					@TOTAL_DAYS_EX_HOLIDAYS  																																							AS 'TotalDaysAbsent',
					IF (
							((@TOTAL_DAYS_EX_HOLIDAYS - SUM(DISTINCT count_no_weekdays(TD.LeaveFrom,TD.LeaveTo))) - COUNT(TRD.TeacherMasterPublicID)) IS NULL ,
							( @TOTAL_DAYS_EX_HOLIDAYS  - COUNT(TRD.TeacherMasterPublicID)),
								
								IF( 
									(@TOTAL_DAYS_EX_HOLIDAYS  - COUNT(TRD.TeacherMasterPublicID)) 
										< 
									(SUM(DISTINCT count_no_weekdays(TD.LeaveFrom,TD.LeaveTo))),
									0,
									((@TOTAL_DAYS_EX_HOLIDAYS - SUM(DISTINCT count_no_weekdays(TD.LeaveFrom,TD.LeaveTo))) - COUNT(TRD.TeacherMasterPublicID))	
									) 
						)																																														AS 'DaysAbsentNoPermision',
						
				
					IF(
							SUM(DISTINCT count_no_weekdays(TD.LeaveFrom,TD.LeaveTo)) IS NULL,
							0, 
								IF(
									SUM(DISTINCT count_no_weekdays(TD.LeaveFrom,TD.LeaveTo)) 
									>
									(@TOTAL_DAYS_EX_HOLIDAYS  - COUNT(TRD.TeacherMasterPublicID)),
									(@TOTAL_DAYS_EX_HOLIDAYS  - COUNT(TRD.TeacherMasterPublicID)),
									SUM(DISTINCT count_no_weekdays(TD.LeaveFrom,TD.LeaveTo))
									)
						)																																														AS 'DaysAbsentPermision'
				
		FROM ve_teacherreportdetails VTRD 
		LEFT JOIN teacherreportdetails TRD ON VTRD.ID = TRD.TeacherDetailsID AND DATE (TRD.UpdatedOn) BETWEEN @START_DATE AND @END_DATE
		AND TRD.TimeIn IS NOT NULL AND TRD.TimeOut IS NOT NULL  
		JOIN usermaster UM ON UM.PublicID = VTRD.TeacherMasterID 
		JOIN teachermaster TM ON TM.PublicUserID = UM.PublicID
		LEFT JOIN teacherdeatails TD ON TD.TeacherMasterID = VTRD.TeacherMasterID AND TD.LeaveFrom BETWEEN @START_DATE AND @END_DATE AND TD.StatusCode= @STATUS_CODE WHERE TM.DepartmentCode = DepartmentCode_
		GROUP BY  VTRD.TeacherMasterID,TD.TeacherMasterID ORDER BY UM.FirstName;	


	

END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetTeacherLeaveReportByUsername
DROP PROCEDURE IF EXISTS `GetTeacherLeaveReportByUsername`;
DELIMITER //
CREATE PROCEDURE `GetTeacherLeaveReportByUsername`(
	IN `USERNAME_` VARCHAR(50),
	IN `START_DATE_` DATE,
	IN `END_DATE_` DATE,
	IN `STATUS_CODE_` VARCHAR(50)
)
BEGIN
		SET @TEACHERMASTERID = (SELECT UM.PublicID FROM usermaster UM WHERE UM.UserName = USERNAME_);
		SET @START_DATE 		= START_DATE_;
		SET @END_DATE   		= END_DATE_;
		SET @LEAVE_STATUS		= STATUS_CODE_;
		
		
		SELECT TRD.TeacherMasterID																								AS 'TeacherMasterID',
				 CONCAT (UM.FirstName,' ',IF(UM.OtherName IS NULL,'',UM.OtherName),' ',UM.LastName)			AS 'Names',
				 LTM.LeaveType 																									AS 'LeaveType',
				 TRD.ReasonForLeave																								AS 'ReasonForLeave',
				 TRD.LeaveFrom																										AS 'LeaveFrom',
				 TRD.LeaveTo																										AS 'LeaveTo',
				 DATE(TRD.ReturnedDate)																							AS 'ReturnedDate',
				 count_no_weekdays(TRD.LeaveFrom, TRD.LeaveTo)  														AS 'LeaveDays',
				 count_no_weekdays(TRD.LeaveFrom, TRD.ReturnedDate)  													AS 'DaysOut'
		FROM	 teacherdeatails TRD
		JOIN   leavetypemaster LTM 
		ON 	 LTM.LeaveTypeMasterID = TRD.LeaveTypeID 
		JOIN   usermaster UM 
		ON 	 UM.PublicID = TRD.TeacherMasterID
		WHERE  TRD.TeacherMasterID = @TEACHERMASTERID
		AND 	 TRD.LeaveFrom BETWEEN @START_DATE AND @END_DATE AND TRD.StatusCode = @LEAVE_STATUS;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetTeacherPositions
DROP PROCEDURE IF EXISTS `GetTeacherPositions`;
DELIMITER //
CREATE PROCEDURE `GetTeacherPositions`()
    COMMENT 'The GetTeacherPositions is used to get the defined teacher positions'
BEGIN
		SELECT	TPM.TeacherPositionMasterID AS 'TeacherPositionMasterID',
					TPM.PositionName				AS 'PositionName',
				 	TPM.PositionDescription		AS 'PositionDescription',
				 	TPM.IsActive					AS 'IsActive'
		FROM teacherpositionmaster TPM;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetTeachersInDepartmentByDepartmentCode
DROP PROCEDURE IF EXISTS `GetTeachersInDepartmentByDepartmentCode`;
DELIMITER //
CREATE PROCEDURE `GetTeachersInDepartmentByDepartmentCode`(
	IN `DEPARTMENT_CODE_` VARCHAR(4)
)
BEGIN
		SET @DEPARTMENT_CODE  = DEPARTMENT_CODE_;


		SELECT   	CONCAT(UM.FirstName, ' ',IF(UM.OtherName IS NULL, '',UM.OtherName ),' ', UM.LastName)	AS 'Names',
						CONCAT('+260',UM.ContactNo)																				AS 'ContactNo',
						IF (UM.EmailAddress IS NULL, 'None', UM.EmailAddress)												AS 'EmailAddress',
						TPM.PositionName																								AS 'PositionName',
						DPT.DepartmentName																							AS 'DepartmentName',
						IF (TM.IsOnLeave = 1,'YES','NO')																			AS 'IsOnLeave' 
		FROM 			teachermaster TM 
		JOIN 			teacherpositionmaster TPM  
				ON 	TM.PositionID = TPM.TeacherPositionMasterID
		JOIN 			department DPT 
				ON 	DPT.ShortHand = TM.DepartmentCode
		JOIN 			usermaster UM 
				ON		UM.PublicID = TM.PublicUserID
		WHERE			TM.DepartmentCode = @DEPARTMENT_CODE AND TPM.TeacherPositionMasterID <> 3 AND UM.IsActive = 1   ORDER BY TPM.PositionName;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetTeacherWorkedTime
DROP PROCEDURE IF EXISTS `GetTeacherWorkedTime`;
DELIMITER //
CREATE PROCEDURE `GetTeacherWorkedTime`(
	IN `STARTDATE_` DATE,
	IN `ENDDATE_` DATE

)
BEGIN
	
		SET @STARTDATE = STARTDATE_;
		SET @ENDDATE = ENDDATE_;
		
		 
		SELECT 
		UM.PublicID	AS 'TeachersID', 
		CONCAT(UM.FirstName," ",IF(UM.OtherName IS NULL , '',UM.OtherName)," ",UM.LastName) AS 'Names',
		GM.ShortName		AS 'Gender',
		CONCAT ("+26097",UM.ContactNo) AS 'ContactNo',
		
		IF (UM.EmailAddress IS NULL,'None',UM.EmailAddress) AS 'EmailAddress',
		
		COUNT(TRD.TeacherMasterPublicID)		AS 'DaysWorked' ,
		
		(CASE WHEN TRD.TimeIn IS NULL OR TRD.TimeOut IS NULL 
			THEN 
				0
		ELSE
			IF (SUM(MINUTE((TIMEDIFF(TIME(TRD.TimeOut) ,TIME(TRD.TimeIn))))) > 59,(SUM(HOUR((TIMEDIFF(TIME(TRD.TimeOut) ,TIME(TRD.TimeIn)))))) + (ROUND((SUM(MINUTE((TIMEDIFF(TIME(TRD.TimeOut) ,TIME(TRD.TimeIn)))))/59),0)),SUM(HOUR((TIMEDIFF(TIME(TRD.TimeOut) ,TIME(TRD.TimeIn))))) )
		END) AS 'TotalWokedHours',
		
		(CASE WHEN TRD.TimeIn IS NULL OR TRD.TimeOut IS NULL 
			THEN 
				0
		ELSE
			(SUM(MINUTE((TIMEDIFF(TIME(TRD.TimeOut) ,TIME(TRD.TimeIn)))))) % 59 
		END) AS 'TotalWokedMin'
		
		FROM teacherreportdetails TRD
		JOIN usermaster UM ON UM.PublicID = TRD.TeacherMasterPublicID
		JOIN gendermaster GM ON GM.GenderMasterID = UM.GenderID
		WHERE ( DATE(TRD.UpdatedOn) BETWEEN @STARTDATE AND @ENDDATE) AND (TRD.TimeIn IS NOT NULL) AND (TRD.TimeOut IS NOT NULL)
		GROUP BY TRD.TeacherMasterPublicID;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetTeacherWorkedTimeByDeparment
DROP PROCEDURE IF EXISTS `GetTeacherWorkedTimeByDeparment`;
DELIMITER //
CREATE PROCEDURE `GetTeacherWorkedTimeByDeparment`(
	IN `STARTDATE_` DATE,
	IN `ENDDATE_` DATE,
	IN `DepartmentCode_` CHAR(4)
)
BEGIN
		SET @STARTDATE = STARTDATE_;
		SET @ENDDATE = ENDDATE_;
		
		 
		SELECT 
		UM.PublicID	AS 'TeachersID', 
		CONCAT(UM.FirstName," ",IF(UM.OtherName IS NULL , '',UM.OtherName)," ",UM.LastName) AS 'Names',
		GM.ShortName		AS 'Gender',
		CONCAT ("+26097",UM.ContactNo) AS 'ContactNo',
		
		IF (UM.EmailAddress IS NULL,'None',UM.EmailAddress) AS 'EmailAddress',
		
		COUNT(TRD.TeacherMasterPublicID)		AS 'DaysWorked' ,
		
		(CASE WHEN TRD.TimeIn IS NULL OR TRD.TimeOut IS NULL 
			THEN 
				0
		ELSE
			IF (SUM(MINUTE((TIMEDIFF(TIME(TRD.TimeOut) ,TIME(TRD.TimeIn))))) > 59,(SUM(HOUR((TIMEDIFF(TIME(TRD.TimeOut) ,TIME(TRD.TimeIn)))))) + (ROUND((SUM(MINUTE((TIMEDIFF(TIME(TRD.TimeOut) ,TIME(TRD.TimeIn)))))/59),0)),SUM(HOUR((TIMEDIFF(TIME(TRD.TimeOut) ,TIME(TRD.TimeIn))))) )
		END) AS 'TotalWokedHours',
		
		(CASE WHEN TRD.TimeIn IS NULL OR TRD.TimeOut IS NULL 
			THEN 
				0
		ELSE
			(SUM(MINUTE((TIMEDIFF(TIME(TRD.TimeOut) ,TIME(TRD.TimeIn)))))) % 59 
		END) AS 'TotalWokedMin'
		
		FROM teacherreportdetails TRD
		JOIN usermaster UM ON UM.PublicID = TRD.TeacherMasterPublicID
		JOIN gendermaster GM ON GM.GenderMasterID = UM.GenderID
		JOIN teachermaster TM ON TM.PublicUserID = TRD.TeacherMasterPublicID
		WHERE (( DATE(TRD.UpdatedOn) BETWEEN @STARTDATE AND @ENDDATE) AND (TRD.TimeIn IS NOT NULL) AND (TRD.TimeOut IS NOT NULL) ) AND TM.DepartmentCode = DepartmentCode_ 
		GROUP BY TRD.TeacherMasterPublicID;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetTeacherWorkedTimeByID
DROP PROCEDURE IF EXISTS `GetTeacherWorkedTimeByID`;
DELIMITER //
CREATE PROCEDURE `GetTeacherWorkedTimeByID`(
	IN `TEACHER_ID_` VARCHAR(50),
	IN `STARTDATE_` DATE,
	IN `ENDDATE_` DATE
)
BEGIN
		SET @TEACHER_ID = TEACHER_ID_;
		SET @STARTDATE = STARTDATE_;
		SET @ENDDATE = ENDDATE_;
		
	SET @DAYSABSENT  = (SELECT COUNT(TRD.TeacherMasterPublicID)
FROM teacherreportdetails TRD WHERE ( DATE(TRD.UpdatedOn) BETWEEN @STARTDATE AND @ENDDATE) AND (TRD.TeacherMasterPublicID = @TEACHER_ID) AND (TRD.TimeIn IS NULL) OR (TRD.TimeOut IS NULL)
);

SET @DAYSWORKED  = (SELECT COUNT(TRD.TeacherMasterPublicID)
FROM teacherreportdetails TRD WHERE ( DATE(TRD.UpdatedOn) BETWEEN @STARTDATE AND @ENDDATE) AND (TRD.TeacherMasterPublicID = @TEACHER_ID) AND (TRD.TimeIn IS NOT NULL) AND (TRD.TimeOut IS NOT NULL)
);

SET @TOTALHOURSSWORKED = (SELECT 
SUM(HOUR((TIMEDIFF(TRD.TimeOut ,TRD.TimeIn))))
FROM teacherreportdetails TRD  WHERE ( DATE(TRD.UpdatedOn) BETWEEN @STARTDATE AND @ENDDATE) AND TRD.TeacherMasterPublicID = @TEACHER_ID);


SET @TOTALMINETSSWORKED = (SELECT 
SUM(MINUTE((TIMEDIFF(TRD.TimeOut ,TRD.TimeIn))))
FROM teacherreportdetails TRD  WHERE ( DATE(TRD.UpdatedOn) BETWEEN @STARTDATE AND @ENDDATE) AND TRD.TeacherMasterPublicID = @TEACHER_ID);


# THE FOLOWING BELOW QUERY IS TO GET THE CORERECT SECONDS A TEACHER HAS WORKED FROM THE TIME IN AMD TIME OUT 
SET @MINE_ROGINAL = (
SELECT if (@TOTALMINETSSWORKED > 59,  (@TOTALMINETSSWORKED%59),@TOTALMINETSSWORKED));

SET @MINETO = (
SELECT if (@TOTALMINETSSWORKED > 59,  ROUND((@TOTALMINETSSWORKED/59),0),0));

SET @QUERYMIN_CONVERTED_HOURS  = (@TOTALHOURSSWORKED + @MINETO);


SET @TIMEIN = ( CONCAT(@QUERYMIN_CONVERTED_HOURS,":00:00") );


SET @TIMEIN_ORIGINAL_MIN = ( CONCAT("00:",@MINE_ROGINAL,":00"));

SET @TIMEADDED_ONE = (SELECT  ADDTIME(@TIMEIN, @TIMEIN_ORIGINAL_MIN));



SELECT  @TEACHER_ID	AS 'TeachersID', 
		  CONCAT(UM.FirstName," ",IF(UM.OtherName IS NULL , '',UM.OtherName)," ",UM.LastName) AS 'Names',
		  GM.ShortName		AS 'Gender',
		  CONCAT ("+26097",UM.ContactNo) AS 'ContactNo',
		   IF (UM.EmailAddress IS NULL,'None',UM.EmailAddress) AS 'EmailAddress',
		  IF (@TIMEADDED_ONE IS NULL,0, @TIMEADDED_ONE) AS 'TotalWokedTime',
		  @DAYSWORKED AS 'DaysWorked' ,
		  @DAYSABSENT AS 'DaysAbsent' 
		  FROM usermaster UM
		  JOIN gendermaster GM ON GM.GenderMasterID = UM.GenderID WHERE UM.PublicID = @TEACHER_ID AND UM.IsActive = 1 ;

		   
		 
				   
				
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetTeacherWorkingDays
DROP PROCEDURE IF EXISTS `GetTeacherWorkingDays`;
DELIMITER //
CREATE PROCEDURE `GetTeacherWorkingDays`()
BEGIN
SELECT IF(DAYNAME(CURRENT_DATE()) IN (SELECT WD.Day FROM workingdays WD),1,0) AS 'WokingDay';
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetTermDetails
DROP PROCEDURE IF EXISTS `GetTermDetails`;
DELIMITER //
CREATE PROCEDURE `GetTermDetails`()
BEGIN
		SELECT TM.TermMasterID	AS 'TermMasterID',
				 TM.TermName		AS 'TermName' 
		FROM termmaster TM ORDER BY TM.TermMasterID ASC;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetTermPages
DROP PROCEDURE IF EXISTS `GetTermPages`;
DELIMITER //
CREATE PROCEDURE `GetTermPages`(
	IN `limit_` VARCHAR(50)



)
BEGIN
		SET @LIMIT_ = limit_;
		SET @NUMBEROFTERMS  = (SELECT COUNT(TM.TermMasterID)  AS COUNT FROM termmaster TM );
		
		SET @NUMBEROFPAGES = @NUMBEROFTERMS/@LIMIT_;
		
		SELECT CEILING(@NUMBEROFPAGES) AS 'Pages',@NUMBEROFTERMS AS 'TotalRecords';
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetUserByUsername
DROP PROCEDURE IF EXISTS `GetUserByUsername`;
DELIMITER //
CREATE PROCEDURE `GetUserByUsername`(
	IN `username` VARCHAR(50)
)
    COMMENT 'This sp gets the user details by user name'
BEGIN
		SELECT UM.PublicID		AS 'PublicID',
				 UM.UserName		AS 'UserName',
				 UM.Password		AS 'Password',
				 UM.UserTypeID		AS 'UserTypeID',
				 UM.IsActive  		AS 'IsActive',
				 IF(UM.EmailAddress IS NULL , Null, UM.EmailAddress)	AS 'EmailAddress',
				 CONCAT(UM.FirstName," ",IF(UM.OtherName IS NULL, '', UM.OtherName)," ",UM.LastName)	AS 'Name',
				 TM.PositionID		AS 'PositionID',
				 DP.ShortHand		AS 'ShortHand'
		FROM usermaster UM
		JOIN usertypemaster UTM ON UTM.UserTypeMasterID = UM.UserTypeID
		LEFT JOIN teachermaster TM ON TM.PublicUserID = UM.PublicID
		LEFT JOIN department DP ON DP.ShortHand = TM.DepartmentCode
	
		WHERE UM.UserName = username ;

END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetUserDetailsByID
DROP PROCEDURE IF EXISTS `GetUserDetailsByID`;
DELIMITER //
CREATE PROCEDURE `GetUserDetailsByID`(
	IN `UserID_` VARCHAR(50)

)
BEGIN
				SELECT   UM.PublicID												AS 'PublicID',
							UM.FirstName											AS 'FirstName',
							IF(UM.OtherName IS NULL, '',UM.OtherName)		AS	'OtherName',
							UM.LastName												AS 'LastName', 
							IF(UM.NRC IS NULL, 'None', UM.NRC)				AS 'NRC',
							TPM.PositionName										AS 'PositionName',
							DP.DepartmentName										AS 'DepartmentName',
							GM.Gender												AS	'Gender',
							IF(UM.Passport IS NULL,'None',UM.Passport)	AS 'Passport',
							UM.ContactNo											AS 'ContactNo',
							UM.EmailAddress										AS 'EmailAddress',
							UM.UserMasterID										AS 'UserMasterID'
								
				FROM usermaster UM
				LEFT JOIN teachermaster TM ON TM.PublicUserID = UM.PublicID 
				LEFT JOIN department DP ON DP.ShortHand = TM.DepartmentCode
				LEFT JOIN gendermaster GM ON GM.GenderMasterID = UM.GenderID
				LEFT JOIN teacherpositionmaster TPM ON TPM.TeacherPositionMasterID = TM.PositionID
				WHERE UM.PublicID = UserID_;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetUserDetailsByPublicID
DROP PROCEDURE IF EXISTS `GetUserDetailsByPublicID`;
DELIMITER //
CREATE PROCEDURE `GetUserDetailsByPublicID`(
	IN `PublicID` VARCHAR(50)
)
BEGIN
			SET @PublicID = PublicID;
			SELECT	UM.PublicID 														AS 'PublicID',
						IF(UM.NRC IS NULL, 'None',UM.NRC)							AS 'NRC',
						IF(UM.Passport IS NULL, 'None',UM.Passport)				AS 'Passport',
						UM.UserName															AS 'UserName',
						UM.FirstName														AS 'FirstName',
						IF(UM.OtherName IS NULL, 'None',UM.OtherName)		   AS 'OtherName',
						IF(UM.EmailAddress IS NULL, 'None',UM.EmailAddress)	AS 'EmailAddress',	
						UM.ContactNo														AS 'ContactNo',
						GM.Gender															AS 'Gender',
						MRS.MaritalStatus													AS 'MaritalStatus',
						UM.DOB																AS 'DOB',
						TPM.PositionName													AS 'PositionName',
						TM.StartDate														AS 'StartDate',
						TM.IsOnLeave														AS 'IsOnLeave'
					  
			FROM usermaster UM 
			JOIN teachermaster TM ON TM.PublicID = UM.PublicID
			JOIN address AD ON AD.IdentificationID = TM.PublicID
			JOIN gendermaster GM ON GM.GenderMasterID = UM.GenderID
			JOIN maritalstatusmaster MRS ON MRS.MaritalStatusMasterID = UM.MaritalStatusID
			JOIN teacherpositionmaster TPM ON TPM.TeacherPositionMasterID = TM.PositionID  WHERE GM.IsActive = 1 AND TPM.IsActive = 1 AND  UM.IsActive = 1 AND UM.PublicID =  @PublicID ; 

END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetUserEmailByID
DROP PROCEDURE IF EXISTS `GetUserEmailByID`;
DELIMITER //
CREATE PROCEDURE `GetUserEmailByID`(
	IN `TEACHERID` VARCHAR(50)
)
BEGIN
		SELECT IF(UM.EmailAddress IS NULL, '' , UM.EmailAddress)	AS 'EmailAddress'
		FROM usermaster UM WHERE UM.PublicID = TEACHERID AND UM.IsActive = 1;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.GetWorkedHours
DROP PROCEDURE IF EXISTS `GetWorkedHours`;
DELIMITER //
CREATE PROCEDURE `GetWorkedHours`(
	IN `TeacherMasterPublicID_` VARCHAR(50)
)
BEGIN
	
			
	
	
	SET @WORKTIME = (SELECT IF(TRD.TimeOut IS NULL, CURRENT_TIMESTAMP(),TRD.TimeOut)
		FROM teacherreportdetails TRD WHERE TeacherMasterPublicID = TeacherMasterPublicID_ AND DATE(UpdatedOn) = CURRENT_DATE());
	
	SELECT IFNULL((SELECT IF(TRD.TeacherDetailsID IS NULL, '0', HOUR(SUBTIME(TIME(@WORKTIME),TIME(TRD.TimeIn))) ) AS 'HoursWorks'
		FROM teacherreportdetails TRD WHERE TRD.TeacherMasterPublicID = TeacherMasterPublicID_ AND DATE(TRD.UpdatedOn) = CURRENT_DATE()),'0') AS 'HoursWorks';
		
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.ProcessFinalLeaveRequest
DROP PROCEDURE IF EXISTS `ProcessFinalLeaveRequest`;
DELIMITER //
CREATE PROCEDURE `ProcessFinalLeaveRequest`(
	IN `StatusCode_` CHAR(4),
	IN `UpdatedBy_` VARCHAR(50),
	IN `ApprovedBy_` VARCHAR(50),
	IN `TeacherDetailsPublicID_` VARCHAR(50)
)
BEGIN
			DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;	
		UPDATE teacherdeatails SET StatusCode  = StatusCode_, UpdatedBy = UpdatedBy_, AuthorizedBy = ApprovedBy_ WHERE TeacherDetailsPublicID = TeacherDetailsPublicID_;

END//
DELIMITER ;

-- Dumping structure for procedure stms_db.ProcessLeaveRequest
DROP PROCEDURE IF EXISTS `ProcessLeaveRequest`;
DELIMITER //
CREATE PROCEDURE `ProcessLeaveRequest`(
	IN `StatusCode_` CHAR(4),
	IN `UpdatedBy_` VARCHAR(50),
	IN `ApprovedBy_` VARCHAR(50),
	IN `TeacherDetailsPublicID_` VARCHAR(50)


)
BEGIN
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;	
		UPDATE teacherdeatails  SET StatusCode  = StatusCode_, UpdatedBy = UpdatedBy_, ApprovedBy = ApprovedBy_ WHERE TeacherDetailsPublicID = TeacherDetailsPublicID_;
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.SearchActivatedUsers
DROP PROCEDURE IF EXISTS `SearchActivatedUsers`;
DELIMITER //
CREATE PROCEDURE `SearchActivatedUsers`(
	IN `UserName_` VARCHAR(50),
	IN `FirstName_` VARCHAR(50),
	IN `LastName_` VARCHAR(50)

)
BEGIN
		SET @USERNAMEC =    (SELECT IF ( UserName_ IS NULL OR UserName_='' , NULL , CONCAT("%",UserName_,"%")) );
		SET @FIRSTNAMEC =   (SELECT IF ( FirstName_ IS NULL OR FirstName_='' , NULL , CONCAT("%",FirstName_,"%")) );
		SET @LASTNAMEC = 		(SELECT IF ( LastName_ IS NULL OR LastName_='' , NULL , CONCAT("%",LastName_,"%")) );

		SELECT   UM.PublicID												AS 'PublicID',
					UM.FirstName											AS 'FirstName',
					IF(UM.OtherName IS NULL, '',UM.OtherName)		AS	'OtherName',
					UM.LastName												AS 'LastName', 
					IF(UM.NRC IS NULL, 'None', UM.NRC)				AS 'NRC',
					TPM.PositionName										AS 'PositionName',
					DP.DepartmentName										AS'DepartmentName'			
		FROM usermaster UM
		LEFT JOIN teachermaster TM ON TM.PublicUserID = UM.PublicID 
		LEFT JOIN department DP ON DP.ShortHand = TM.DepartmentCode
		LEFT JOIN teacherpositionmaster TPM ON TPM.TeacherPositionMasterID = TM.PositionID
		WHERE ((UM.UserName LIKE @USERNAMEC) OR  (UM.FirstName  LIKE @FIRSTNAMEC) OR (UM.LastName LIKE @LASTNAMEC)) AND ( UM.IsActive = 1 );
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.SearchUsers
DROP PROCEDURE IF EXISTS `SearchUsers`;
DELIMITER //
CREATE PROCEDURE `SearchUsers`(
	IN `UserName_` VARCHAR(50),
	IN `FirstName_` VARCHAR(50),
	IN `LastName_` VARCHAR(50)

)
BEGIN
		SET @USERNAMEC =    (SELECT IF ( UserName_ IS NULL OR UserName_='' , NULL , CONCAT("%",UserName_,"%")) );
		SET @FIRSTNAMEC =   (SELECT IF ( FirstName_ IS NULL OR FirstName_='' , NULL , CONCAT("%",FirstName_,"%")) );
		SET @LASTNAMEC = 		(SELECT IF ( LastName_ IS NULL OR LastName_='' , NULL , CONCAT("%",LastName_,"%")) );

		SELECT   UM.PublicID												AS 'PublicID',
					UM.FirstName											AS 'FirstName',
					IF(UM.OtherName IS NULL, '',UM.OtherName)		AS	'OtherName',
					UM.LastName												AS 'LastName', 
					IF(UM.NRC IS NULL, 'None', UM.NRC)				AS 'NRC',
					TPM.PositionName										AS 'PositionName',
					DP.DepartmentName										AS'DepartmentName'			
		FROM usermaster UM
		LEFT JOIN teachermaster TM ON TM.PublicUserID = UM.PublicID 
		LEFT JOIN department DP ON DP.ShortHand = TM.DepartmentCode
		LEFT JOIN teacherpositionmaster TPM ON TPM.TeacherPositionMasterID = TM.PositionID
		WHERE ((UM.UserName LIKE @USERNAMEC) OR  (UM.FirstName  LIKE @FIRSTNAMEC) OR (UM.LastName LIKE @LASTNAMEC)) AND ( UM.IsActive = 0 );
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.SetLeaveTeacherLeveFlug
DROP PROCEDURE IF EXISTS `SetLeaveTeacherLeveFlug`;
DELIMITER //
CREATE PROCEDURE `SetLeaveTeacherLeveFlug`(
	IN `PUBLICUSERID_` VARCHAR(50)
,
	IN `flag_` INT





)
BEGIN
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;	
		
		SET @a = (flag_);
		
		
		SET @TeacherDetailsPublicID = (
		SELECT TD.TeacherDetailsPublicID
		FROM teacherdeatails TD 
		WHERE TD.StatusCode = 'APPR' AND TD.TeacherMasterID = PUBLICUSERID_ ORDER BY TD.UpdatedOn DESC LIMIT 1
		);
		
		SET @CURRENTUSERNAME = (SELECT UM.UserName FROM usermaster UM WHERE UM.PublicID = PUBLICUSERID_);

		UPDATE teacherdeatails
		SET ReturnedDate = IF (@a = 0 , CURRENT_TIMESTAMP(),NULL),
			 UpdatedBy = @CURRENTUSERNAME
		WHERE TeacherDetailsPublicID = @TeacherDetailsPublicID AND ReturnedDate IS NULL;
	
		UPDATE teachermaster  SET `IsOnLeave` = flag_ WHERE `PublicUserID` = PUBLICUSERID_;

END//
DELIMITER ;

-- Dumping structure for procedure stms_db.UpdateEmailSatusCode
DROP PROCEDURE IF EXISTS `UpdateEmailSatusCode`;
DELIMITER //
CREATE PROCEDURE `UpdateEmailSatusCode`(
	IN `EMAILESERIAL` VARCHAR(50),
	IN `STATUSCODE` CHAR(4),
	IN `CURRENTCODE` CHAR(4)
)
    COMMENT 'This sp is used to update the statuse code of the emailservice table'
BEGIN
		
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;
		
		UPDATE emailservice  SET `Status` = STATUSCODE WHERE EmailSerial = EMAILESERIAL And `Status` = CURRENTCODE;
		 
	
END//
DELIMITER ;

-- Dumping structure for procedure stms_db.UpdatePasswordByUsername
DROP PROCEDURE IF EXISTS `UpdatePasswordByUsername`;
DELIMITER //
CREATE PROCEDURE `UpdatePasswordByUsername`(
	IN `username_` VARCHAR(50)
,
	IN `password_` VARCHAR(300)





)
BEGIN
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
		BEGIN
		     SELECT 0 AS message;
		     ROLLBACK;
		END;
		
		SET @PUBLICID  = (SELECT UM.PublicID FROM usermaster UM WHERE UM.UserName = username_ );
		
		UPDATE usermaster SET `Password` = password_, IsActive = 1 WHERE UserName = username_;
		
		UPDATE teachermaster SET IsActive = 1 WHERE PublicUserID = @PUBLICID ;
END//
DELIMITER ;

-- Dumping structure for function stms_db.GetSequence
DROP FUNCTION IF EXISTS `GetSequence`;
DELIMITER //
CREATE FUNCTION `GetSequence`(`SequenceID` INT


) RETURNS varchar(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    DETERMINISTIC
    COMMENT 'This Function is used to get a sequnce based on the defined sequnces'
BEGIN
   
 			DECLARE LASTINSERTEDID VARCHAR(50);
			DECLARE NEWLASTINSETEDID VARCHAR(50);
			DECLARE SEQUNCECODE CHAR(4);
		
    
         SELECT SM.LastInsertedID INTO LASTINSERTEDID FROM sequencemaster SM WHERE SM.SequenceMasterID = SequenceID;
			
			SELECT SM.LastInsertedID+1 INTO NEWLASTINSETEDID FROM sequencemaster SM  WHERE SM.SequenceMasterID = SequenceID;
				
			SELECT SM.SequnceCode INTO  SEQUNCECODE FROM sequencemaster SM  WHERE SM.SequenceMasterID = SequenceID;
				
			UPDATE sequencemaster SET `LastInsertedID` = NEWLASTINSETEDID WHERE SequenceMasterID = SequenceID;
				
			-- return the Sequence
			RETURN CONCAT(SEQUNCECODE,"000000000",NEWLASTINSETEDID) ;
				
			
			
    
   
END//
DELIMITER ;

-- Dumping structure for trigger stms_db.SessionHistory
DROP TRIGGER IF EXISTS `SessionHistory`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `SessionHistory` AFTER INSERT ON `session` FOR EACH ROW BEGIN
			INSERT INTO sessionhistory  (	
													SessionID,
													UserMasterPublicID,
													SerialID,TokenID,
													TokenCreatedTime,
													UpdatedBy,UpdatedOn 
									)
			SELECT * 
			FROM `session` SH WHERE SH.SessionID = (SELECT MAX(SN.SessionID) FROM `session` SN );
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
