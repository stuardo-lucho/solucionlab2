-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: hr-sw2
-- ------------------------------------------------------
-- Server version	8.0.12


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

--
-- Create schema hr
--
DROP DATABASE IF EXISTS `hr-sw2`;
CREATE DATABASE  IF NOT EXISTS `hr-sw2`;
USE `hr-sw2`;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `countries` (
  `country_id` char(2) NOT NULL,
  `country_name` varchar(40) DEFAULT NULL,
  `region_id` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  KEY `countr_reg_fk` (`region_id`),
  CONSTRAINT `countr_reg_fk` FOREIGN KEY (`region_id`) REFERENCES `regions` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('AR','Argentina',2);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('AU','Australia',3);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('BE','Belgium',1);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('BR','Brazil',2);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('CA','Canada',2);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('CH','Switzerland',1);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('CN','China',3);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('DE','Germany',1);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('DK','Denmark',1);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('EG','Egypt',4);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('FR','France',1);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('HK','HongKong',3);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('IL','Israel',4);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('IN','India',3);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('IT','Italy',1);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('JP','Japan',3);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('KW','Kuwait',4);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('MX','Mexico',2);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('NG','Nigeria',4);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('NL','Netherlands',1);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('SG','Singapore',3);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('UK','United Kingdom',1);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('US','United States of America',2);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('ZM','Zambia',4);
INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES ('ZW','Zimbabwe',4);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departments` (
  `department_id` int(4) NOT NULL,
  `department_name` varchar(30) NOT NULL,
  `manager_id` varchar(6) DEFAULT NULL,
  `location_id` int(4) DEFAULT NULL,
  `department_short_name` char(2) NOT NULL,
  PRIMARY KEY (`department_id`),
  KEY `dept_location_ix` (`location_id`),
  KEY `dept_mgr_fk` (`manager_id`),
  CONSTRAINT `dept_loc_fk` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  CONSTRAINT `dept_mgr_fk` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (10,'Administration','200_AD',1700,'AD');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (20,'Marketing','201_MK',1800,'MK');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (30,'Purchasing','114_PU',1700,'PU');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (40,'Human Resources','203_HR',2400,'HR');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (50,'Shipping','121_SH',1500,'SH');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (60,'IT','103_IT',1400,'IT');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (70,'Public Relations','204_PR',2700,'PR');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (80,'Sales','145_SA',2500,'SA');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (90,'Executive','100_EX',1700,'EX');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (100,'Finance','108_FI',1700,'FI');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (110,'Accounting','205_AC',1700,'AC');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (120,'Treasury',NULL,1700,'TR');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (130,'Corporate Tax',NULL,1700,'CT');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (140,'Control And Credit',NULL,1700,'CC');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (150,'Shareholder Services',NULL,1700,'SS');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (160,'Benefits',NULL,1700,'BE');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (170,'Manufacturing',NULL,1700,'MA');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (180,'Construction',NULL,1700,'CU');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (190,'Contracting',NULL,1700,'CA');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (200,'Operations',NULL,1700,'OP');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (210,'IT Support',NULL,1700,'IS');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (220,'NOC',NULL,1700,'NC');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (230,'IT Helpdesk',NULL,1700,'IH');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (240,'Government Sales',NULL,1700,'GS');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (250,'Retail Sales',NULL,1700,'RS');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (260,'Recruiting',NULL,1700,'RE');
INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`, `department_short_name`) VALUES (270,'Payroll',NULL,1700,'PA');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employees` (
  `employee_id` varchar(6) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `hire_date` datetime NOT NULL,
  `job_id` varchar(10) NOT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `commission_pct` decimal(2,2) DEFAULT NULL,
  `manager_id` varchar(6) DEFAULT NULL,
  `department_id` int(4) NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `emp_email_uk` (`email`),
  KEY `emp_department_ix` (`department_id`),
  KEY `emp_job_ix` (`job_id`),
  KEY `emp_manager_ix` (`manager_id`),
  KEY `emp_name_ix` (`last_name`,`first_name`),
  KEY `emp_job_fk` (`job_id`),
  CONSTRAINT `emp_dept_fk` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `emp_job_fk` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  CONSTRAINT `emp_manager_fk` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('100_EX','Steven','King','SKING','515.123.4567','1987-06-17 00:00:00','AD_PRES',24000.00,NULL,NULL,90);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('101_EX','Neena','Kochhar','NKOCHHAR','515.123.4568','1989-09-21 00:00:00','AD_VP',17000.00,NULL,'100_EX',90);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('102_EX','Lex','De Haan','LDEHAAN','515.123.4569','1993-01-13 00:00:00','AD_VP',17000.00,NULL,'100_EX',90);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('103_IT','Alexander','Hunold','AHUNOLD','590.423.4567','1990-01-03 00:00:00','IT_PROG',9000.00,NULL,'102_EX',60);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('104_IT','Bruce','Ernst','BERNST','590.423.4568','1991-05-21 00:00:00','IT_PROG',6000.00,NULL,'103_IT',60);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('105_IT','David','Austin','DAUSTIN','590.423.4569','1997-06-25 00:00:00','IT_PROG',4800.00,NULL,'103_IT',60);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('106_IT','Valli','Pataballa','VPATABAL','590.423.4560','1998-02-05 00:00:00','IT_PROG',4800.00,NULL,'103_IT',60);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('107_IT','Diana','Lorentz','DLORENTZ','590.423.5567','1999-02-07 00:00:00','IT_PROG',4200.00,NULL,'103_IT',60);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('108_FI','Nancy','Greenberg','NGREENBE','515.124.4569','1994-08-17 00:00:00','FI_MGR',12000.00,NULL,'101_EX',100);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('109_FI','Daniel','Faviet','DFAVIET','515.124.4169','1994-08-16 00:00:00','FI_ACCOUNT',9000.00,NULL,'108_FI',100);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('110_FI','John','Chen','JCHEN','515.124.4269','1997-09-28 00:00:00','FI_ACCOUNT',8200.00,NULL,'108_FI',100);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('111_FI','Ismael','Sciarra','ISCIARRA','515.124.4369','1997-09-30 00:00:00','FI_ACCOUNT',7700.00,NULL,'108_FI',100);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('112_FI','Jose Manuel','Urman','JMURMAN','515.124.4469','1998-03-07 00:00:00','FI_ACCOUNT',7800.00,NULL,'108_FI',100);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('113_FI','Luis','Popp','LPOPP','515.124.4567','1999-12-07 00:00:00','FI_ACCOUNT',6900.00,NULL,'108_FI',100);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('114_PU','Den','Raphaely','DRAPHEAL','515.127.4561','1994-12-07 00:00:00','PU_MAN',11000.00,NULL,'100_EX',30);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('115_PU','Alexander','Khoo','AKHOO','515.127.4562','1995-05-18 00:00:00','PU_CLERK',3100.00,NULL,'114_PU',30);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('116_PU','Shelli','Baida','SBAIDA','515.127.4563','1997-12-24 00:00:00','PU_CLERK',2900.00,NULL,'114_PU',30);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('117_PU','Sigal','Tobias','STOBIAS','515.127.4564','1997-07-24 00:00:00','PU_CLERK',2800.00,NULL,'114_PU',30);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('118_PU','Guy','Himuro','GHIMURO','515.127.4565','1998-11-15 00:00:00','PU_CLERK',2600.00,NULL,'114_PU',30);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('119_PU','Karen','Colmenares','KCOLMENA','515.127.4566','1999-08-10 00:00:00','PU_CLERK',2500.00,NULL,'114_PU',30);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('120_SH','Matthew','Weiss','MWEISS','650.123.1234','1996-07-18 00:00:00','OP_MAN',8000.00,NULL,'100_EX',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('121_SH','Adam','Fripp','AFRIPP','650.123.2234','1997-04-10 00:00:00','OP_MAN',8200.00,NULL,'100_EX',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('122_SH','Payam','Kaufling','PKAUFLIN','650.123.3234','1995-05-01 00:00:00','OP_MAN',7900.00,NULL,'100_EX',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('123_SH','Shanta','Vollman','SVOLLMAN','650.123.4234','1997-10-10 00:00:00','OP_MAN',6500.00,NULL,'100_EX',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('124_SH','Kevin','Mourgos','KMOURGOS','650.123.5234','1999-11-16 00:00:00','OP_MAN',5800.00,NULL,'100_EX',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('125_SH','Julia','Nayer','JNAYER','650.124.1214','1997-07-16 00:00:00','OP_CLERK',3200.00,NULL,'120_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('126_SH','Irene','Mikkilineni','IMIKKILI','650.124.1224','1998-09-28 00:00:00','OP_CLERK',2700.00,NULL,'120_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('127_SH','James','Landry','JLANDRY','650.124.1334','1999-01-14 00:00:00','OP_CLERK',2400.00,NULL,'120_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('128_SH','Steven','Markle','SMARKLE','650.124.1434','2000-03-08 00:00:00','OP_CLERK',2200.00,NULL,'120_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('129_SH','Laura','Bissot','LBISSOT','650.124.5234','1997-08-20 00:00:00','OP_CLERK',3300.00,NULL,'121_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('130_SH','Mozhe','Atkinson','MATKINSO','650.124.6234','1997-10-30 00:00:00','OP_CLERK',2800.00,NULL,'121_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('131_SH','James','Marlow','JAMRLOW','650.124.7234','1997-02-16 00:00:00','OP_CLERK',2500.00,NULL,'121_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('132_SH','TJ','Olson','TJOLSON','650.124.8234','1999-04-10 00:00:00','OP_CLERK',2100.00,NULL,'121_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('133_SH','Jason','Mallin','JMALLIN','650.127.1934','1996-06-14 00:00:00','OP_CLERK',3300.00,NULL,'122_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('134_SH','Michael','Rogers','MROGERS','650.127.1834','1998-08-26 00:00:00','OP_CLERK',2900.00,NULL,'122_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('135_SH','Ki','Gee','KGEE','650.127.1734','1999-12-12 00:00:00','OP_CLERK',2400.00,NULL,'122_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('136_SH','Hazel','Philtanker','HPHILTAN','650.127.1634','2000-02-06 00:00:00','OP_CLERK',2200.00,NULL,'122_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('137_SH','Renske','Ladwig','RLADWIG','650.121.1234','1995-07-14 00:00:00','OP_CLERK',3600.00,NULL,'123_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('138_SH','Stephen','Stiles','SSTILES','650.121.2034','1997-10-26 00:00:00','OP_CLERK',3200.00,NULL,'123_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('139_SH','John','Seo','JSEO','650.121.2019','1998-02-12 00:00:00','OP_CLERK',2700.00,NULL,'123_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('140_SH','Joshua','Patel','JPATEL','650.121.1834','1998-04-06 00:00:00','OP_CLERK',2500.00,NULL,'123_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('141_SH','Trenna','Rajs','TRAJS','650.121.8009','1995-10-17 00:00:00','OP_CLERK',3500.00,NULL,'124_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('142_SH','Curtis','Davies','CDAVIES','650.121.2994','1997-01-29 00:00:00','OP_CLERK',3100.00,NULL,'124_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('143_SH','Randall','Matos','RMATOS','650.121.2874','1998-03-15 00:00:00','OP_CLERK',2600.00,NULL,'124_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('144_SH','Peter','Vargas','PVARGAS','650.121.2004','1998-07-09 00:00:00','OP_CLERK',2500.00,NULL,'124_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('145_SA','John','Russell','JRUSSEL','011.44.1344.429268','1996-10-01 00:00:00','SA_MAN',14000.00,0.40,'100_EX',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('146_SA','Karen','Partners','KPARTNER','011.44.1344.467268','1997-01-05 00:00:00','SA_MAN',13500.00,0.30,'100_EX',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('147_SA','Alberto','Errazuriz','AERRAZUR','011.44.1344.429278','1997-03-10 00:00:00','SA_MAN',12000.00,0.30,'100_EX',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('148_SA','Gerald','Cambrault','GCAMBRAU','011.44.1344.619268','1999-10-15 00:00:00','SA_MAN',11000.00,0.30,'100_EX',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('149_SA','Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','2000-01-29 00:00:00','SA_MAN',10500.00,0.20,'100_EX',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('150_SA','Peter','Tucker','PTUCKER','011.44.1344.129268','1997-01-30 00:00:00','SA_REP',10000.00,0.30,'145_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('151_SA','David','Bernstein','DBERNSTE','011.44.1344.345268','1997-03-24 00:00:00','SA_REP',9500.00,0.25,'145_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('152_SA','Peter','Hall','PHALL','011.44.1344.478968','1997-08-20 00:00:00','SA_REP',9000.00,0.25,'145_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('153_SA','Christopher','Olsen','COLSEN','011.44.1344.498718','1998-03-30 00:00:00','SA_REP',8000.00,0.20,'145_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('154_SA','Nanette','Cambrault','NCAMBRAU','011.44.1344.987668','1998-12-09 00:00:00','SA_REP',7500.00,0.20,'145_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('155_SA','Oliver','Tuvault','OTUVAULT','011.44.1344.486508','1999-11-23 00:00:00','SA_REP',7000.00,0.15,'145_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('156_SA','Janette','King','JKING','011.44.1345.429268','1996-01-30 00:00:00','SA_REP',10000.00,0.35,'146_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('157_SA','Patrick','Sully','PSULLY','011.44.1345.929268','1996-03-04 00:00:00','SA_REP',9500.00,0.35,'146_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('158_SA','Allan','McEwen','AMCEWEN','011.44.1345.829268','1996-08-01 00:00:00','SA_REP',9000.00,0.35,'146_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('159_SA','Lindsey','Smith','LSMITH','011.44.1345.729268','1997-03-10 00:00:00','SA_REP',8000.00,0.30,'146_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('160_SA','Louise','Doran','LDORAN','011.44.1345.629268','1997-12-15 00:00:00','SA_REP',7500.00,0.30,'146_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('161_SA','Sarath','Sewall','SSEWALL','011.44.1345.529268','1998-11-03 00:00:00','SA_REP',7000.00,0.25,'146_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('162_SA','Clara','Vishney','CVISHNEY','011.44.1346.129268','1997-11-11 00:00:00','SA_REP',10500.00,0.25,'147_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('163_SA','Danielle','Greene','DGREENE','011.44.1346.229268','1999-03-19 00:00:00','SA_REP',9500.00,0.15,'147_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('164_SA','Mattea','Marvins','MMARVINS','011.44.1346.329268','2000-01-24 00:00:00','SA_REP',7200.00,0.10,'147_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('165_SA','David','Lee','DLEE','011.44.1346.529268','2000-02-23 00:00:00','SA_REP',6800.00,0.10,'147_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('166_SA','Sundar','Ande','SANDE','011.44.1346.629268','2000-03-24 00:00:00','SA_REP',6400.00,0.10,'147_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('167_SA','Amit','Banda','ABANDA','011.44.1346.729268','2000-04-21 00:00:00','SA_REP',6200.00,0.10,'147_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('168_SA','Lisa','Ozer','LOZER','011.44.1343.929268','1997-03-11 00:00:00','SA_REP',11500.00,0.25,'148_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('169_SA','Harrison','Bloom','HBLOOM','011.44.1343.829268','1998-03-23 00:00:00','SA_REP',10000.00,0.20,'148_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('170_SA','Tayler','Fox','TFOX','011.44.1343.729268','1998-01-24 00:00:00','SA_REP',9600.00,0.20,'148_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('171_SA','William','Smith','WSMITH','011.44.1343.629268','1999-02-23 00:00:00','SA_REP',7400.00,0.15,'148_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('172_SA','Elizabeth','Bates','EBATES','011.44.1343.529268','1999-03-24 00:00:00','SA_REP',7300.00,0.15,'148_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('173_SA','Sundita','Kumar','SKUMAR','011.44.1343.329268','2000-04-21 00:00:00','SA_REP',6100.00,0.10,'148_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('174_SA','Ellen','Abel','EABEL','011.44.1644.429267','1996-05-11 00:00:00','SA_REP',11000.00,0.30,'149_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('175_SA','Alyssa','Hutton','AHUTTON','011.44.1644.429266','1997-03-19 00:00:00','SA_REP',8800.00,0.25,'149_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('176_SA','Jonathon','Taylor','JTAYLOR','011.44.1644.429265','1998-03-24 00:00:00','SA_REP',8600.00,0.20,'149_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('177_SA','Jack','Livingston','JLIVINGS','011.44.1644.429264','1998-04-23 00:00:00','SA_REP',8400.00,0.20,'149_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('178_SA','Kimberely','Grant','KGRANT','011.44.1644.429263','1999-05-24 00:00:00','SA_REP',7000.00,0.15,'149_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('179_SA','Charles','Johnson','CJOHNSON','011.44.1644.429262','2000-01-04 00:00:00','SA_REP',6200.00,0.10,'149_SA',80);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('180_SH','Winston','Taylor','WTAYLOR','650.507.9876','1998-01-24 00:00:00','SH_CLERK',3200.00,NULL,'120_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('181_SH','Jean','Fleaur','JFLEAUR','650.507.9877','1998-02-23 00:00:00','SH_CLERK',3100.00,NULL,'120_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('182_SH','Martha','Sullivan','MSULLIVA','650.507.9878','1999-06-21 00:00:00','SH_CLERK',2500.00,NULL,'120_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('183_SH','Girard','Geoni','GGEONI','650.507.9879','2000-02-03 00:00:00','SH_CLERK',2800.00,NULL,'120_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('184_SH','Nandita','Sarchand','NSARCHAN','650.509.1876','1996-01-27 00:00:00','SH_CLERK',4200.00,NULL,'121_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('185_SH','Alexis','Bull','ABULL','650.509.2876','1997-02-20 00:00:00','SH_CLERK',4100.00,NULL,'121_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('186_SH','Julia','Dellinger','JDELLING','650.509.3876','1998-06-24 00:00:00','SH_CLERK',3400.00,NULL,'121_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('187_SH','Anthony','Cabrio','ACABRIO','650.509.4876','1999-02-07 00:00:00','SH_CLERK',3000.00,NULL,'121_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('188_SH','Kelly','Chung','KCHUNG','650.505.1876','1997-06-14 00:00:00','SH_CLERK',3800.00,NULL,'122_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('189_SH','Jennifer','Dilly','JDILLY','650.505.2876','1997-08-13 00:00:00','SH_CLERK',3600.00,NULL,'122_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('190_SH','Timothy','Gates','TGATES','650.505.3876','1998-07-11 00:00:00','SH_CLERK',2900.00,NULL,'122_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('191_SH','Randall','Perkins','RPERKINS','650.505.4876','1999-12-19 00:00:00','SH_CLERK',2500.00,NULL,'122_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('192_SH','Sarah','Bell','SBELL','650.501.1876','1996-02-04 00:00:00','SH_CLERK',4000.00,NULL,'123_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('193_SH','Britney','Everett','BEVERETT','650.501.2876','1997-03-03 00:00:00','SH_CLERK',3900.00,NULL,'123_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('194_SH','Samuel','McCain','SMCCAIN','650.501.3876','1998-07-01 00:00:00','SH_CLERK',3200.00,NULL,'123_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('195_SH','Vance','Jones','VJONES','650.501.4876','1999-03-17 00:00:00','SH_CLERK',2800.00,NULL,'123_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('196_SH','Alana','Walsh','AWALSH','650.507.9811','1998-04-24 00:00:00','SH_CLERK',3100.00,NULL,'124_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('197_SH','Kevin','Feeney','KFEENEY','650.507.9822','1998-05-23 00:00:00','SH_CLERK',3000.00,NULL,'124_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('198_SH','Donald','OConnell','DOCONNEL','650.507.9833','1999-06-21 00:00:00','SH_CLERK',2600.00,NULL,'124_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('199_SH','Douglas','Grant','DGRANT','650.507.9844','2000-01-13 00:00:00','SH_CLERK',2600.00,NULL,'124_SH',50);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('200_AD','Jennifer','Whalen','JWHALEN','515.123.4444','1987-09-17 00:00:00','AD_ASST',4400.00,NULL,'101_EX',10);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('201_MK','Michael','Hartstein','MHARTSTE','515.123.5555','1996-02-17 00:00:00','MK_MAN',13000.00,NULL,'100_EX',20);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('202_MK','Pat','Fay','PFAY','603.123.6666','1997-08-17 00:00:00','MK_REP',6000.00,NULL,'201_MK',20);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('203_HR','Susan','Mavris','SMAVRIS','515.123.7777','1994-06-07 00:00:00','HR_REP',6500.00,NULL,'101_EX',40);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('204_PR','Hermann','Baer','HBAER','515.123.8888','1994-06-07 00:00:00','PR_REP',10000.00,NULL,'101_EX',70);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('205_AC','Shelley','Higgins','SHIGGINS','515.123.8080','1994-06-07 00:00:00','AC_MGR',12000.00,NULL,'101_EX',110);
INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES ('206_AC','William','Gietz','WGIETZ','515.123.8181','1994-06-07 00:00:00','AC_ACCOUNT',8300.00,NULL,'205_AC',110);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_history`
--

DROP TABLE IF EXISTS `job_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_history` (
  `employee_id` varchar(6) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `job_id` varchar(10) NOT NULL,
  `department_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`employee_id`,`start_date`),
  KEY `jhist_department_ix` (`department_id`),
  KEY `jhist_employee_ix` (`employee_id`),
  KEY `jhist_job_ix` (`job_id`),
  KEY `jhist_job_fk` (`job_id`),
  CONSTRAINT `jhist_dept_fk` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `jhist_emp_fk` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `jhist_job_fk` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_history`
--

LOCK TABLES `job_history` WRITE;
/*!40000 ALTER TABLE `job_history` DISABLE KEYS */;
INSERT INTO `job_history` (`employee_id`, `start_date`, `end_date`, `job_id`, `department_id`) VALUES ('101_EX','1989-09-21 00:00:00','1993-10-27 00:00:00','AC_ACCOUNT',110);
INSERT INTO `job_history` (`employee_id`, `start_date`, `end_date`, `job_id`, `department_id`) VALUES ('101_EX','1993-10-28 00:00:00','1997-03-15 00:00:00','AC_MGR',110);
INSERT INTO `job_history` (`employee_id`, `start_date`, `end_date`, `job_id`, `department_id`) VALUES ('102_EX','1993-01-13 00:00:00','1998-07-24 00:00:00','IT_PROG',60);
INSERT INTO `job_history` (`employee_id`, `start_date`, `end_date`, `job_id`, `department_id`) VALUES ('114_PU','1998-03-24 00:00:00','1999-12-31 00:00:00','OP_CLERK',50);
INSERT INTO `job_history` (`employee_id`, `start_date`, `end_date`, `job_id`, `department_id`) VALUES ('122_SH','1999-01-01 00:00:00','1999-12-31 00:00:00','OP_CLERK',50);
INSERT INTO `job_history` (`employee_id`, `start_date`, `end_date`, `job_id`, `department_id`) VALUES ('176_SA','1998-03-24 00:00:00','1998-12-31 00:00:00','SA_REP',80);
INSERT INTO `job_history` (`employee_id`, `start_date`, `end_date`, `job_id`, `department_id`) VALUES ('176_SA','1999-01-01 00:00:00','1999-12-31 00:00:00','SA_MAN',80);
INSERT INTO `job_history` (`employee_id`, `start_date`, `end_date`, `job_id`, `department_id`) VALUES ('200_AD','1987-09-17 00:00:00','1993-06-17 00:00:00','AD_ASST',90);
INSERT INTO `job_history` (`employee_id`, `start_date`, `end_date`, `job_id`, `department_id`) VALUES ('200_AD','1994-07-01 00:00:00','1998-12-31 00:00:00','AC_ACCOUNT',90);
INSERT INTO `job_history` (`employee_id`, `start_date`, `end_date`, `job_id`, `department_id`) VALUES ('201_MK','1996-02-17 00:00:00','1999-12-19 00:00:00','MK_REP',20);
/*!40000 ALTER TABLE `job_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jobs` (
  `job_id` varchar(10) NOT NULL,
  `job_title` varchar(35) NOT NULL,
  `min_salary` int(6) DEFAULT NULL,
  `max_salary` int(6) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('AC_ACCOUNT','Public Accountant',4200,9000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('AC_MGR','Accounting Manager',8200,16000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('AD_ASST','Administration Assistant',3000,6000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('AD_PRES','President',20000,40000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('AD_VP','Administration Vice President',15000,30000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('FI_ACCOUNT','Accountant',4200,9000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('FI_MGR','Finance Manager',8200,16000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('HR_REP','Human Resources Representative',4000,9000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('IT_PROG','Programmer',4000,10000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('MK_MAN','Marketing Manager',9000,15000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('MK_REP','Marketing Representative',4000,9000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('PR_REP','Public Relations Representative',4500,10500);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('PU_CLERK','Purchasing Clerk',2500,5500);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('PU_MAN','Purchasing Manager',8000,15000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('SA_MAN','Sales Manager',10000,20000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('SA_REP','Sales Representative',6000,12000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('SH_CLERK','Shipping Clerk',2500,5500);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('OP_CLERK','Stock Clerk',2000,5000);
INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES ('OP_MAN','Stock Manager',5500,8500);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `locations` (
  `location_id` int(4) NOT NULL,
  `street_address` varchar(40) DEFAULT NULL,
  `postal_code` varchar(12) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `state_province` varchar(25) DEFAULT NULL,
  `country_id` char(2) DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `loc_city_ix` (`city`),
  KEY `loc_country_ix` (`country_id`),
  KEY `loc_SHate_province_ix` (`state_province`),
  KEY `loc_c_id_fk` (`country_id`),
  CONSTRAINT `loc_c_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (1000,'1297 Via Cola di Rie','00989','Roma',NULL,'IT');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (1100,'93091 Calle della Testa','10934','Venice',NULL,'IT');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (1300,'9450 Kamiya-cho','6823','Hiroshima',NULL,'JP');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (2000,'40-5-12 Laogianggen','190518','Beijing',NULL,'CN');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (2300,'198 Clementi North','540198','Singapore',NULL,'SG');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (2600,'9702 Chester Road','09629850293','Stretford','Manchester','UK');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (2800,'Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (3000,'Murtenstrasse 921','3095','Bern','BE','CH');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL');
INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES (3200,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `regions` (
  `region_id` decimal(22,0) NOT NULL,
  `region_name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` (`region_id`, `region_name`) VALUES (1,'Europe');
INSERT INTO `regions` (`region_id`, `region_name`) VALUES (2,'Americas');
INSERT INTO `regions` (`region_id`, `region_name`) VALUES (3,'Asia');
INSERT INTO `regions` (`region_id`, `region_name`) VALUES (4,'Middle East and Africa');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
