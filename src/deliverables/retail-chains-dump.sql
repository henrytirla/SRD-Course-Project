-- MySQL dump 10.13  Distrib 8.0.31, for macos13.0 (arm64)
--
-- Host: 127.0.0.1    Database: retail_chains
-- ------------------------------------------------------
-- Server version	8.0.31

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

DROP DATABASE IF EXISTS `retail_chains`;
CREATE DATABASE IF NOT EXISTS `retail_chains`;

USE `retail_chains`;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

INSERT INTO `category` VALUES (1,'Beverages','Soft drinks, coffees, teas, beers, and ales'),(2,'Condiments','Sweet and savory sauces, relishes, spreads, and seasonings'),(3,'Confections','Desserts, candies, and sweet breads'),(4,'Dairy Products','Cheeses'),(5,'Grains/Cereals','Breads, crackers, pasta, and cereal'),(6,'Meat/Poultry','Prepared meats'),(7,'Produce','Dried fruit and bean curd'),(8,'Seafood','Seaweed and fish'),(9,'Spices','Domestic product'),(10,'Personal Hygiene','Washroom item'),(11,'Noodle','fast food');

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `code` char(4) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

INSERT INTO `country` VALUES (1,'Andorra','AD','ca'),(2,'United Arab Emirates','AE','ar'),(3,'Afghanistan','AF','fa'),(4,'Antigua and Barbuda','AG','en'),(5,'Anguilla','AI','en'),(6,'Albania','AL','sq'),(7,'Armenia','AM','hy'),(8,'Netherlands Antilles','AN','nl'),(9,'Angola','AO','pt'),(10,'Argentina','AR','es'),(11,'Austria','AT','de'),(12,'Australia','AU','en'),(13,'Aruba','AW','nl'),(14,'Azerbaijan','AZ','az'),(15,'Bosnia and Herzegovina','BA','bs'),(16,'Barbados','BB','en'),(17,'Bangladesh','BD','bn'),(18,'Belgium','BE','nl'),(19,'Burkina Faso','BF','fr'),(20,'Bulgaria','BG','bg'),(21,'Bahrain','BH','ar'),(22,'Burundi','BI','fr'),(23,'Benin','BJ','fr'),(24,'Bermuda','BM','en'),(25,'Brunei Darussalam','BN','ms'),(26,'Bolivia','BO','es'),(27,'Brazil','BR','pt'),(28,'Bahamas','BS','en'),(29,'Bhutan','BT','dz'),(30,'Botswana','BW','en'),(31,'Belarus','BY','be'),(32,'Belize','BZ','en'),(33,'Canada','CA','en'),(34,'Cocos (Keeling) Islands','CC','en'),(35,'Democratic Republic of the Congo','CD','fr'),(36,'Central African Republic','CF','fr'),(37,'Congo','CG','fr'),(38,'Switzerland','CH','de'),(39,'Cote D\'Ivoire (Ivory Coast)','CI','fr'),(40,'Cook Islands','CK','en'),(41,'Chile','CL','es'),(42,'Cameroon','CM','fr'),(43,'China','CN','zh'),(44,'Colombia','CO','es'),(45,'Costa Rica','CR','es'),(46,'Cuba','CU','es'),(47,'Cape Verde','CV','pt'),(48,'Christmas Island','CX','en'),(49,'Cyprus','CY','el'),(50,'Czech Republic','CZ','cs'),(51,'Germany','DE','de'),(52,'Djibouti','DJ','fr'),(53,'Denmark','DK','da'),(54,'Dominica','DM','en'),(55,'Dominican Republic','DO','es'),(56,'Algeria','DZ','ar'),(57,'Ecuador','EC','es'),(58,'Estonia','EE','et'),(59,'Egypt','EG','ar'),(60,'Western Sahara','EH','ar'),(61,'Eritrea','ER','ti'),(62,'Spain','ES','es'),(63,'Ethiopia','ET','am'),(64,'Finland','FI','fi'),(65,'Fiji','FJ','en'),(66,'Falkland Islands (Malvinas)','FK','en'),(67,'Federated States of Micronesia','FM','en'),(68,'Faroe Islands','FO','fo'),(69,'France','FR','fr'),(70,'Gabon','GA','fr'),(71,'Great Britain (UK)','GB','en'),(72,'Grenada','GD','en'),(73,'Georgia','GE','ka'),(74,'French Guiana','GF','fr'),(75,'Guernsey','GG','en'),(76,'Ghana','GH','en'),(77,'Gibraltar','GI','en'),(78,'Greenland','GL','kl'),(79,'Gambia','GM','en'),(80,'Guinea','GN','fr'),(81,'Guadeloupe','GP','fr'),(82,'Equatorial Guinea','GQ','es'),(83,'Greece','GR','el'),(84,'S. Georgia and S. Sandwich Islands','GS','en'),(85,'Guatemala','GT','es'),(86,'Guinea-Bissau','GW','pt'),(87,'Guyana','GY','en'),(88,'Hong Kong','HK','zh'),(89,'Honduras','HN','es'),(90,'Croatia (Hrvatska)','HR','hr'),(91,'Haiti','HT','fr'),(92,'Hungary','HU','hu'),(93,'Indonesia','ID','id'),(94,'Ireland','IE','en'),(95,'Israel','IL','he'),(96,'India','IN','hi'),(97,'Iraq','IQ','ar'),(98,'Iran','IR','fa'),(99,'Iceland','IS','is'),(100,'Italy','IT','it'),(101,'Jamaica','JM','en'),(102,'Jordan','JO','ar'),(103,'Japan','JP','ja'),(104,'Kenya','KE','sw'),(105,'Kyrgyzstan','KG','ky'),(106,'Cambodia','KH','km'),(107,'Kiribati','KI','en'),(108,'Comoros','KM','ar'),(109,'Saint Kitts and Nevis','KN','en'),(110,'Korea (North)','KP','ko'),(111,'Korea (South)','KR','ko'),(112,'Kuwait','KW','ar'),(113,'Cayman Islands','KY','en'),(114,'Kazakhstan','KZ','kk'),(115,'Laos','LA','lo'),(116,'Lebanon','LB','ar'),(117,'Saint Lucia','LC','en'),(118,'Liechtenstein','LI','de'),(119,'Sri Lanka','LK','si'),(120,'Liberia','LR','en'),(121,'Lesotho','LS','en'),(122,'Lithuania','LT','lt'),(123,'Luxembourg','LU','lb'),(124,'Latvia','LV','lv'),(125,'Libya','LY','ar'),(126,'Morocco','MA','fr'),(127,'Monaco','MC','fr'),(128,'Moldova','MD','ro'),(129,'Madagascar','MG','mg'),(130,'Marshall Islands','MH','en'),(131,'Macedonia','MK','mk'),(132,'Mali','ML','fr'),(133,'Myanmar','MM','my'),(134,'Mongolia','MN','mn'),(135,'Macao','MO','zh'),(136,'Northern Mariana Islands','MP','en'),(137,'Martinique','MQ','fr'),(138,'Mauritania','MR','ar'),(139,'Montserrat','MS','en'),(140,'Malta','MT','mt'),(141,'Mauritius','MU','mfe'),(142,'Maldives','MV','dv'),(143,'Malawi','MW','en'),(144,'Mexico','MX','es'),(145,'Malaysia','MY','ms'),(146,'Mozambique','MZ','pt'),(147,'Namibia','NA','en'),(148,'New Caledonia','NC','fr'),(149,'Niger','NE','fr'),(150,'Norfolk Island','NF','en'),(151,'Nigeria','NG','en'),(152,'Nicaragua','NI','es'),(153,'Netherlands','NL','nl'),(154,'Norway','NO','nb'),(155,'Nepal','NP','ne'),(156,'Nauru','NR','na'),(157,'Niue','NU','niu'),(158,'New Zealand (Aotearoa)','NZ','mi'),(159,'Oman','OM','ar'),(160,'Panama','PA','es'),(161,'Peru','PE','es'),(162,'French Polynesia','PF','fr'),(163,'Papua New Guinea','PG','en'),(164,'Philippines','PH','en'),(165,'Pakistan','PK','en'),(166,'Poland','PL','pl'),(167,'Saint Pierre and Miquelon','PM','fr'),(168,'Pitcairn','PN','en'),(169,'Palestinian Territory','PS','ar'),(170,'Portugal','PT','pt'),(171,'Palau','PW','en'),(172,'Paraguay','PY','es'),(173,'Qatar','QA','ar'),(174,'Reunion','RE','fr'),(175,'Romania','RO','ro'),(176,'Russian Federation','RU','ru'),(177,'Rwanda','RW','rw'),(178,'Saudi Arabia','SA','ar'),(179,'Solomon Islands','SB','en'),(180,'Seychelles','SC','fr'),(181,'Sudan','SD','ar'),(182,'Sweden','SE','sv'),(183,'Singapore','SG','zh'),(184,'Saint Helena','SH','en'),(185,'Slovenia','SI','sl'),(186,'Svalbard and Jan Mayen','SJ','no'),(187,'Slovakia','SK','sk'),(188,'Sierra Leone','SL','en'),(189,'San Marino','SM','it'),(190,'Senegal','SN','fr'),(191,'Somalia','SO','so'),(192,'Suriname','SR','nl'),(193,'Sao Tome and Principe','ST','pt'),(194,'El Salvador','SV','es'),(195,'Syria','SY','ar'),(196,'Swaziland','SZ','en'),(197,'Turks and Caicos Islands','TC','en'),(198,'Chad','TD','fr'),(199,'French Southern Territories','TF','fr'),(200,'Togo','TG','fr'),(201,'Thailand','TH','th'),(202,'Tajikistan','TJ','tg'),(203,'Tokelau','TK','tkl'),(204,'Turkmenistan','TM','tk'),(205,'Tunisia','TN','ar'),(206,'Tonga','TO','en'),(207,'Turkey','TR','tr'),(208,'Trinidad and Tobago','TT','en'),(209,'Tuvalu','TV','en'),(210,'Taiwan','TW','zh'),(211,'Tanzania','TZ','sw'),(212,'Ukraine','UA','uk'),(213,'Uganda','UG','en'),(214,'Uruguay','UY','es'),(215,'Uzbekistan','UZ','uz'),(216,'Saint Vincent and the Grenadines','VC','en'),(217,'Venezuela','VE','es'),(218,'Virgin Islands (British)','VG','en'),(219,'Virgin Islands (U.S.)','VI','en'),(220,'Viet Nam','VN','vi'),(221,'Vanuatu','VU','bi'),(222,'Wallis and Futuna','WF','fr'),(223,'Samoa','WS','sm'),(224,'Yemen','YE','ar'),(225,'Mayotte','YT','fr'),(226,'South Africa','ZA','en'),(227,'Zambia','ZM','en'),(228,'Zaire (former)','ZR','fr'),(229,'Zimbabwe','ZW','en'),(230,'United States of America','US','en');

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` VALUES (1,'Maria','Anders','Anders@gmail.com','030-0074321','Germany, Berlin, Obere Str. 57','Other','1999-06-23'),(2,'Ana','Trujillo','Trujillo@gmail.com','(5) 555-4729','Mexico, México D.F., Avda. de la Constitución 2222','Female','1998-03-25'),(3,'Antonio','Moreno','Moreno@gmail.com','(5) 555-3932','Mexico, México D.F., Mataderos  2312','Female','1999-06-08'),(4,'Thomas','Hardy','Hardy@gmail.com','(171) 555-7788','UK, London, 120 Hanover Sq.','Other','1976-10-17'),(5,'Christina','Berglund','Berglund@gmail.com','0921-12 34 65','Sweden, Luleå, Berguvsvägen  8','Other','1989-11-12'),(6,'Hanna','Moos','Moos@gmail.com','0621-08460','Germany, Mannheim, Forsterstr. 57','Female','1987-11-15'),(7,'Frédérique','Citeaux','Citeaux@gmail.com','88.60.15.31','France, Strasbourg, 24, place Kléber','Female','1974-04-11'),(8,'Martín','Sommer','Sommer@gmail.com','(91) 555 22 82','Spain, Madrid, C/ Araquil, 67','Female','1989-04-11'),(9,'Laurence','Lebihan','Lebihan@gmail.com','91.24.45.40','France, Marseille, 12, rue des Bouchers','Male','1999-05-27'),(10,'Elizabeth','Lincoln','Lincoln@gmail.com','(604) 555-4729','Canada, Tsawassen, 23 Tsawassen Blvd.','Male','1999-12-22'),(11,'Victoria','Ashworth','Ashworth@gmail.com','(171) 555-1212','UK, London, Fauntleroy Circus','Other','1976-06-18'),(12,'Patricio','Simpson','Simpson@gmail.com','(1) 135-5555','Argentina, Buenos Aires, Cerrito 333','Male','1978-09-07'),(13,'Francisco','Chang','Chang@gmail.com','(5) 555-3392','Mexico, México D.F., Sierras de Granada 9993','Male','1977-01-21'),(14,'Yang','Wang','Wang@gmail.com','0452-076545','Switzerland, Bern, Hauptstr. 29','Male','1982-12-13'),(15,'Pedro','Afonso','Afonso@gmail.com','(11) 555-7647','Brazil, São Paulo, Av. dos Lusíadas, 23','Other','1995-12-30'),(16,'Elizabeth','Brown','Brown@gmail.com','(171) 555-2282','UK, London, Berkeley Gardens 12  Brewery ','Other','1992-03-16'),(17,'Sven','Ottlieb','Ottlieb@gmail.com','0241-039123','Germany, Aachen, Walserweg 21','Male','1973-02-02'),(18,'Janine','Labrune','Labrune@gmail.com','40.67.88.88','France, Nantes, 67, rue des Cinquante Otages','Male','1984-07-10'),(19,'Ann','Devon','Devon@gmail.com','(171) 555-0297','UK, London, 35 King George','Other','1976-06-17'),(20,'Roland','Mendel','Mendel@gmail.com','7675-3425','Austria, Graz, Kirchgasse 6','Female','1975-10-30'),(21,'Aria','Cruz','Cruz@gmail.com','(11) 555-9857','Brazil, São Paulo, Rua Orós, 92','Other','1979-07-29'),(22,'Diego','Roel','Roel@gmail.com','(91) 555 94 44','Spain, Madrid, C/ Moralzarzal, 86','Male','1999-09-10'),(23,'Martine','Rancé','Rancé@gmail.com','20.16.10.16','France, Lille, 184, chaussée de Tournai','Other','1979-04-20'),(24,'Maria','Larsson','Larsson@gmail.com','0695-34 67 21','Sweden, Bräcke, Åkergatan 24','Other','1978-05-22'),(25,'Peter','Franken','Franken@gmail.com','089-0877310','Germany, München, Berliner Platz 43','Female','1974-04-26'),(26,'Carine','Schmitt','Schmitt@gmail.com','40.32.21.21','France, Nantes, 54, rue Royale','Male','1990-04-11'),(27,'Paolo','Accorti','Accorti@gmail.com','011-4988260','Italy, Torino, Via Monte Bianco 34','Male','1989-08-14'),(28,'Lino','Rodriguez ','Rodriguez @gmail.com','(1) 354-2534','Portugal, Lisboa, Jardim das rosas n. 32','Female','1975-05-19'),(29,'Eduardo','Saavedra','Saavedra@gmail.com','(93) 203 4560','Spain, Barcelona, Rambla de Cataluña, 23','Female','1994-07-19'),(30,'José','Pedro Freyre','Pedro Freyre@gmail.com','(95) 555 82 82','Spain, Sevilla, C/ Romero, 33','Male','1976-01-17'),(31,'André','Fonseca','Fonseca@gmail.com','(11) 555-9482','Brazil, Campinas, Av. Brasil, 442','Female','1991-03-07'),(32,'Howard','Snyder','Snyder@gmail.com','(503) 555-7555','USA, Eugene, 2732 Baker Blvd.','Female','1991-04-06'),(33,'Manuel','Pereira','Pereira@gmail.com','(2) 283-2951','Venezuela, Caracas, 5ª Ave. Los Palos Grandes','Male','1998-06-27'),(34,'Mario','Pontes','Pontes@gmail.com','(21) 555-0091','Brazil, Rio de Janeiro, Rua do Paço, 67','Other','1993-01-30'),(35,'Carlos','Hernández','Hernández@gmail.com','(5) 555-1340','Venezuela, San Cristóbal, Carrera 22 con Ave. Carlos Soublette #8-35','Male','1995-09-15'),(36,'Yoshi','Latimer','Latimer@gmail.com','(503) 555-6874','USA, Elgin, City Center Plaza 516 Main St.','Male','1980-08-20'),(37,'Patricia','McKenna','McKenna@gmail.com','2967 542','Ireland, Cork, 8 Johnstown Road','Other','1982-11-07'),(38,'Helen','Bennett','Bennett@gmail.com','(198) 555-8888','UK, Cowes, Garden House Crowther Way','Other','1990-05-03'),(39,'Philip','Cramer','Cramer@gmail.com','0555-09876','Germany, Brandenburg, Maubelstr. 90','Male','1999-01-26'),(40,'Daniel','Tonini','Tonini@gmail.com','30.59.84.10','France, Versailles, 67, avenue de lEurope','Female','1984-02-29'),(41,'Annette','Roulet','Roulet@gmail.com','61.77.61.10','France, Toulouse, 1 rue Alsace-Lorraine','Male','1991-03-25'),(42,'Yoshi','Tannamuri','Tannamuri@gmail.com','(604) 555-3392','Canada, Vancouver, 1900 Oak St.','Other','1975-11-03'),(43,'John','Steel','Steel@gmail.com','(509) 555-7969','USA, Walla Walla, 12 Orchestra Terrace','Female','1988-10-10'),(44,'Renate','Messner','Messner@gmail.com','069-0245984','Germany, Frankfurt a.M. , Magazinweg 7','Other','1975-10-13'),(45,'Jaime','Yorres','Yorres@gmail.com','(415) 555-5938','USA, San Francisco, 87 Polk St. Suite 5','Other','1981-05-25'),(46,'Carlos','González','González@gmail.com','(9) 331-6954','Venezuela, Barquisimeto, Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Other','1977-12-25'),(47,'Felipe','Izquierdo','Izquierdo@gmail.com','(8) 34-56-12','Venezuela, I. de Margarita, Ave. 5 de Mayo Porlamar','Female','1976-02-07'),(48,'Fran','Wilson','Wilson@gmail.com','(503) 555-9573','USA, Portland, 89 Chiaroscuro Rd.','Male','1999-07-01'),(49,'Giovanni','Rovelli','Rovelli@gmail.com','035-640230','Italy, Bergamo, Via Ludovico il Moro 22','Male','1978-06-26'),(50,'Catherine','Dewey','Dewey@gmail.com','(02) 201 24 67','Belgium, Bruxelles, Rue Joseph-Bens 532','Male','1992-12-31'),(51,'Jean','Fresnière','Fresnière@gmail.com','(514) 555-8054','Canada, Montréal, 43 rue St. Laurent','Male','1975-06-20'),(52,'Alexander','Feuer','Feuer@gmail.com','0342-023176','Germany, Leipzig, Heerstr. 22','Female','1994-03-03'),(53,'Simon','Crowther','Crowther@gmail.com','(171) 555-7733','UK, London, South House 300 Queensbridge','Other','1996-06-19'),(54,'Yvonne','Moncada','Moncada@gmail.com','(1) 135-5333','Argentina, Buenos Aires, Ing. Gustavo Moncada 8585 Piso 20-A','Other','1985-05-04'),(55,'Rene','Phillips','Phillips@gmail.com','(907) 555-7584','USA, Anchorage, 2743 Bering St.','Male','1980-04-05'),(56,'Henriette','Pfalzheim','Pfalzheim@gmail.com','0221-0644327','Germany, Köln, Mehrheimerstr. 369','Other','1983-12-01'),(57,'Marie','Bertrand','Bertrand@gmail.com','(1) 42.34.22.66','France, Paris, 265, boulevard Charonne','Female','1985-07-19'),(58,'Guillermo','Fernández','Fernández@gmail.com','(5) 552-3745','Mexico, México D.F., Calle Dr. Jorge Cash 321','Female','1983-08-19'),(59,'Georg','Pipps','Pipps@gmail.com','6562-9722','Austria, Salzburg, Geislweg 14','Male','1989-04-29'),(60,'Isabel','de Castro','de Castro@gmail.com','(1) 356-5634','Portugal, Lisboa, Estrada da saúde n. 58','Other','1972-11-18'),(61,'Bernardo','Batista','Batista@gmail.com','(21) 555-4252','Brazil, Rio de Janeiro, Rua da Panificadora, 12','Male','1978-01-27'),(62,'Lúcia','Carvalho','Carvalho@gmail.com','(11) 555-1189','Brazil, São Paulo, Alameda dos Canàrios, 891','Other','1997-09-14'),(63,'Horst','Kloss','Kloss@gmail.com','0372-035188','Germany, Cunewalde, Taucherstraße 10','Other','1983-06-04'),(64,'Sergio','Gutiérrez','Gutiérrez@gmail.com','(1) 123-5555','Argentina, Buenos Aires, Av. del Libertador 900','Female','1989-06-17'),(65,'Paula','Wilson','Wilson@gmail.com','(505) 555-5939','USA, Albuquerque, 2817 Milton Dr.','Other','1977-04-18'),(66,'Maurizio','Moroni','Moroni@gmail.com','0522-556721','Italy, Reggio Emilia, Strada Provinciale 124','Male','1975-08-11'),(67,'Janete','Limeira','Limeira@gmail.com','(21) 555-3412','Brazil, Rio de Janeiro, Av. Copacabana, 267','Male','1996-04-16'),(68,'Michael','Holz','Holz@gmail.com','0897-034214','Switzerland, Genève, Grenzacherweg 237','Male','1978-10-07'),(69,'Alejandra','Camino','Camino@gmail.com','(91) 745 6200','Spain, Madrid, Gran Vía, 1','Male','1998-11-04'),(70,'Jonas','Bergulfsen','Bergulfsen@gmail.com','07-98 92 35','Norway, Stavern, Erling Skakkes gate 78','Male','1998-11-06'),(71,'Jose','Pavarotti','Pavarotti@gmail.com','(208) 555-8097','USA, Boise, 187 Suffolk Ln.','Male','1988-06-24'),(72,'Hari','Kumar','Kumar@gmail.com','(171) 555-1717','UK, London, 90 Wadhurst Rd.','Other','1990-02-07'),(73,'Jytte','Petersen','Petersen@gmail.com','31 12 34 56','Denmark, København, Vinbæltet 34','Female','1972-05-14'),(74,'Dominique','Perrier','Perrier@gmail.com','(1) 47.55.60.10','France, Paris, 25, rue Lauriston','Male','1989-09-17'),(75,'Art','Braunschweiger','Braunschweiger@gmail.com','(307) 555-4680','USA, Lander, P.O. Box 555','Female','1996-06-12'),(76,'Pascale','Cartrain','Cartrain@gmail.com','(071) 23 67 22 20','Belgium, Charleroi, Boulevard Tirou, 255','Other','1996-09-01'),(77,'Liz','Nixon','Nixon@gmail.com','(503) 555-3612','USA, Portland, 89 Jefferson Way Suite 2','Female','1997-01-22'),(78,'Liu','Wong','Wong@gmail.com','(406) 555-5834','USA, Butte, 55 Grizzly Peak Rd.','Male','1974-02-10'),(79,'Karin','Josephs','Josephs@gmail.com','0251-031259','Germany, Münster, Luisenstr. 48','Female','1988-08-04'),(80,'Miguel','Angel Paolino','Angel Paolino@gmail.com','(5) 555-2933','Mexico, México D.F., Avda. Azteca 123','Other','1987-11-07'),(81,'Anabela','Domingues','Domingues@gmail.com','(11) 555-2167','Brazil, São Paulo, Av. Inês de Castro, 414','Other','1985-04-19'),(82,'Helvetius','Nagy','Nagy@gmail.com','(206) 555-8257','USA, Kirkland, 722 DaVinci Blvd.','Other','1971-11-30'),(83,'Palle','Ibsen','Ibsen@gmail.com','86 21 32 43','Denmark, Århus, Smagsløget 45','Other','1995-11-30'),(84,'Mary','Saveley','Saveley@gmail.com','78.32.54.86','France, Lyon, 2, rue du Commerce','Male','1976-06-13'),(85,'Paul','Henriot','Henriot@gmail.com','26.47.15.10','France, Reims, 59 rue de lAbbaye','Female','1986-08-17'),(86,'Rita','Müller','Müller@gmail.com','0711-020361','Germany, Stuttgart, Adenauerallee 900','Male','1986-03-16'),(87,'Pirkko','Koskitalo','Koskitalo@gmail.com','981-443655','Finland, Oulu, Torikatu 38','Other','1971-09-26'),(88,'Paula','Parente','Parente@gmail.com','(14) 555-8122','Brazil, Resende, Rua do Mercado, 12','Male','1984-05-21'),(89,'Karl','Jablonski','Jablonski@gmail.com','(206) 555-4112','USA, Seattle, 305 - 14th Ave. S. Suite 3B','Other','1986-01-30'),(90,'Matti','Karttunen','Karttunen@gmail.com','90-224 8858','Finland, Helsinki, Keskuskatu 45','Other','1989-07-31'),(91,'Zbyszek','Piestrzeniewicz','Piestrzeniewicz@gmail.com','(26) 642-7012','Poland, Warszawa, ul. Filtrowa 68','Other','1984-01-14');

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `store_id` int NOT NULL,
  `job_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id_index` (`store_id`),
  KEY `job_id_index` (`job_id`),
  CONSTRAINT `fk_employee_job_id` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `fk_employee_store_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` VALUES (1,'Nancy','Davolio','Davolio@gmail.com','(206) 555-9857','1992-05-01',1,1),(2,'Andrew','Fuller','Fuller@gmail.com','(206) 555-9482','1992-08-14',1,2),(3,'Janet','Leverling','Leverling@gmail.com','(206) 555-3412','1992-04-01',1,3),(4,'Margaret','Peacock','Peacock@gmail.com','(206) 555-8122','1993-05-03',1,4),(5,'Steven','Buchanan','Buchanan@gmail.com','(71) 555-4848','1993-10-17',1,5),(6,'Michael','Suyama','Suyama@gmail.com','(71) 555-7773','1993-10-17',1,6),(7,'Robert','King','King@gmail.com','(71) 555-5598','1994-01-02',1,7),(8,'Laura','Callahan','Callahan@gmail.com','(206) 555-1189','1994-03-05',1,8),(9,'Anne','Dodsworth','Dodsworth@gmail.com','(71) 555-4444','1994-11-15',1,9),(10,'Victoria','Ashworth','Ashworth@gmail.com','(171) 555-1212','1994-11-15',1,10),(11,'Patricio','Simpson','Simpson@gmail.com','(1) 135-5555','1994-11-15',1,11),(12,'Francisco','Chang','Chang@gmail.com','(5) 555-3392','1994-11-15',1,7),(13,'Yang','Wang','Wang@gmail.com','0452-076545','1994-11-15',1,11),(14,'Pedro','Afonso','Afonso@gmail.com','(11) 555-7647','1994-11-15',1,8),(15,'Elizabeth','Brown','Brown@gmail.com','(171) 555-2282','1994-11-15',1,9),(16,'Sven','Ottlieb','Ottlieb@gmail.com','0241-039123','1994-11-15',1,10),(17,'Janine','Labrune','Labrune@gmail.com','40.67.88.88','1994-11-15',1,11),(18,'Ann','Devon','Devon@gmail.com','(171) 555-0297','1994-11-15',1,10),(19,'Roland','Mendel','Mendel@gmail.com','7675-3425','1994-11-15',1,8);

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(35) NOT NULL,
  `min_salary` decimal(6,0) DEFAULT NULL,
  `max_salary` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

INSERT INTO `job` VALUES (1,'Stock Clerk',28000,30000),(2,'Assistant Store Manager',32000,36000),(3,'Store Manager',39000,44000),(4,'Sales Representative',30000,33000),(5,'Vice President, Sales',28000,31000),(6,'Sales Manager',33000,36000),(7,'Inside Sales Coordinator',24000,26000),(8,'Cashier',28000,32000),(9,'Custodian',20000,23000),(10,'Shopping Cart Attendant',24000,26000),(11,'Floral Assistant',25000,27000);

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street_address` varchar(255) DEFAULT NULL,
  `postal_code` varchar(12) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `region` varchar(25) DEFAULT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id_index` (`country_id`),
  CONSTRAINT `location_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

INSERT INTO `location` VALUES (1,'49 Gilbert St.','EC1 4SD','London','',71),(2,'P.O. Box 78934','70117','New Orleans','LA',230),(3,'707 Oxford Rd.','48104','Ann Arbor','MI',230),(4,'9-8 Sekimai Musashino-shi','100','Tokyo','',103),(5,'Calle del Rosal 4','33007','Oviedo','Asturias',62),(6,'92 Setsuko Chuo-ku','545','Osaka','',103),(7,'74 Rose St. Moonie Ponds','3058','Melbourne','Victoria',12),(8,'29 Kings Way','M14 GSD','Manchester','',71),(9,'Kaloadagatan 13','S-345 67','Göteborg','',182),(10,'Av. das Americanas 12.890','5442','São Paulo','',27),(11,'Tiergartenstraße 5','10785','Berlin','',51),(12,'Bogenallee 51','60439','Frankfurt','',51),(13,'Frahmredder 112a','27478','Cuxhaven','',51),(14,'Viale Dante, 75','48100','Ravenna','',100),(15,'Hatlevegen 5','1320','Sandvika','',154),(16,'3400 - 8th Avenue Suite 210','97101','Bend','OR',230),(17,'Brovallavägen 231','S-123 45','Stockholm','',182),(18,'203, Rue des Francs-Bourgeois','75004','Paris','',69),(19,'Order Processing Dept. 2100 Paul Revere Blvd.','02134','Boston','MA',230),(20,'471 Serangoon Loop, Suite #402','0512','183','',183),(21,'Lyngbysild Fiskebakken 10','2800','Lyngby','',53),(22,'Verkoop Rijnweg 22','9999 ZZ','Zaandam','',153),(23,'Valtakatu 12','53120','Lappeenranta','',64),(24,'170 Prince Edward Parade Hunters Hill','2042','Sydney','NSW',12),(25,'2960 Rue St. Laurent','H1J 1C3','Montréal','Québec',33),(26,'Via dei Gelsomini, 153','84100','Salerno','',100),(27,'22, rue H. Voiron','71300','Montceau','',69),(28,'Bat. B 3, rue des Alpes','74000','Annecy','',69),(29,'Avenida Infante Dom Henrique','2735-115','Agualva-Cacém','',170),(30,'Avenida dos Descobrimentos','8200-260','Albufeira','',170),(31,'Avenida da Quinta Grande, (perto Rua Indústria)','2610-153','Alfragide','',170),(32,'Avenida 5 de Outubro','2050-281','Almancil','',170),(33,'Rua Manuel António Gomes','2820-026','Lisboa','',170),(34,'Azinhaga das Fainhas','2820-026','Alverca do Ribatejo','',170),(35,'EN 3, cruzamento Av., Feira de Maio','2735-473','Azambuja','',170),(36,'Avenida Prof. Dr. Aníbal Ant. Cavaco Silva','8100-069','Boliqueime','',170),(37,'Avenida Timor Lorosae','2500-272','Caldas da Rainha','',170),(38,'Quinta do Alconchel','2580-374','Carregado','',170),(39,'Avenida de Lisboa','2605-002','Casal de Cambra','',170);

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `l_table` varchar(250) DEFAULT NULL,
  `l_action` varchar(250) DEFAULT NULL,
  `row_identifier` varchar(250) DEFAULT NULL,
  `new_value` text,
  `logged_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--


--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `order_id` int NOT NULL,
  `store_product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`,`store_product_id`),
  KEY `order_id_index` (`order_id`),
  KEY `store_product_id_index` (`store_product_id`),
  CONSTRAINT `fk_order_products_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_order_products_store_products_id` FOREIGN KEY (`store_product_id`) REFERENCES `store_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_order_products_BINSERT` BEFORE INSERT ON `order_products` FOR EACH ROW BEGIN
    DECLARE storeID INT DEFAULT 0;
    DECLARE pQuantity INT DEFAULT 0;
    DECLARE pPrice INT DEFAULT 0;
    SELECT `orders`.store_id INTO storeID FROM `orders` WHERE `orders`.id = NEW.order_id;
    IF storeID > 0 THEN
        SELECT store_products.quantity, store_products.price INTO pQuantity, pPrice
                     FROM store_products WHERE store_products.id= NEW.store_product_id;
        IF pQuantity > NEW.quantity THEN
            SET NEW.unit_price = pPrice;
            SET NEW.amount = pPrice * NEW.quantity;
        ELSE
            SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = 'Store Dose not have This Product / Product Out Of Stock / Requested Quantity Exceeded';
        END IF;
    ELSE
        SIGNAL SQLSTATE '40001'
        SET MESSAGE_TEXT = 'Invalid Store ID / Check Order ID If Exists';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_order_products_AINSERT` AFTER INSERT ON `order_products` FOR EACH ROW BEGIN
    DECLARE storeID INT DEFAULT 0;
    SELECT orders.store_id INTO storeID FROM orders WHERE orders.id = NEW.order_id;
    IF storeID > 0 THEN
        UPDATE orders SET status = 'InProgress', amount = amount + NEW.amount, updated_at = NOW() WHERE orders.id = NEW.order_id;
        INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('orders', 'UPDATE', concat('order_id=', NEW.order_id), concat('status updated to: ', 'InProgress'));
        UPDATE store_products SET quantity = quantity - NEW.quantity WHERE product_id = NEW.store_product_id;
        INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('store_products', 'UPDATE', concat('product_id=', NEW.store_product_id), concat('quantity updated to: -', NEW.quantity));
    ELSE
        SIGNAL SQLSTATE '40001'
        SET MESSAGE_TEXT = 'Invalid Store ID / Check Order ID If Exists';
    END IF;
    INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('order_products', 'INSERT', concat('order_id=', NEW.order_id,', product_id=', NEW.store_product_id), 'New Order Product Been Added');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `store_id` int NOT NULL,
  `code` varchar(25) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(255) NOT NULL,
  `payment_method` enum('Cash','Net Banking','Credit Card','Debit Card') NOT NULL DEFAULT 'Cash',
  `type` enum('Online','Store') DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('Pending','InProgress','Done') DEFAULT 'Pending',
  `employee_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `code_index` (`code`),
  KEY `time_index` (`time`),
  KEY `customer_id_index` (`customer_id`),
  KEY `store_id_index` (`store_id`),
  KEY `employee_id_index` (`employee_id`),
  CONSTRAINT `fk_order_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_order_store_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_orders_BINSERT` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
    IF NOT (NEW.code) THEN
            SET NEW.code = LPAD(FLOOR(RAND() * 999999.99), 13, '0');
    END IF;
    INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('orders', 'INSERT', concat('customer_id=', NEW.customer_id,', store_id=', NEW.store_id), 'New Order Been Added');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_orders_AUPDATE` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
    DECLARE tTotal INT DEFAULT 0;
    DECLARE tDiscount INT DEFAULT 0;
    DECLARE tTaxRate INT DEFAULT 5;
    DECLARE tTax INT DEFAULT 0;
    IF NEW.status IN ('Done') THEN
        SET tTax = (tTaxRate/100) * OLD.amount;
        SET tTotal = OLD.amount + tTax;
        SET tDiscount = 0;
        INSERT INTO transaction (
         customer_id, store_id, order_id, sub_total, total,
         discount,tax_rate, tax, date_of_purchase, payment_method,
         employee_id) VALUES
              (OLD.customer_id, OLD.store_id, OLD.id, OLD.amount, tTotal,
              tDiscount, tTaxRate, tTax, OLD.time, OLD.payment_method, OLD.employee_id);
        INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('transaction', 'INSERT', concat('order_id=', OLD.id,', customer_id=', OLD.customer_id, ', store_id=', OLD.store_id), 'New Transaction Been Added');
        INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('orders', 'UPDATE', concat('order_id=', OLD.id), concat('status updated to: ', 'Done'));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `picture` varchar(250) NOT NULL DEFAULT 'No_image_available.svg',
  `weight` double NOT NULL,
  `category_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id_index` (`category_id`),
  KEY `supplier_id_index` (`supplier_id`),
  CONSTRAINT `fk_product_category_od` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_product_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

INSERT INTO `product` VALUES (1,'Dettol Original Soap','The original Dettol Soap','Dettol_original.jpg',75,2,26.00,8),(2,'Skincare ','The same effectiveness of the Original Dettol Soap in a different package','Dettol_skincare.jpg',75,2,25.00,8),(3,'Beauty Bar','Feel the feather touch when you bath with dove beauty soap','Dove_Beauty_Bar_Soap.jpg',100,2,60.00,12),(4,'Daily Shine ','Your hair : smoother.','Dove_Daily_Shine_Shampoo.jpg',100,2,110.00,12),(5,'Dant Kanti','Herbal Toothpaste','Dant_Kanti_Advance_Dental_toothpaste.jpg',75,7,60.00,1),(6,'Alovera shampoo','Aloevera shampoo','Patanjali_Aloe_Vera_Hair_shampoo.jpg',110,2,95.00,1),(7,'Alovera kranti soap','Alovera kranti daily wathing soap ','Patanjali_Aloe_Vera_Kranti_Soap.jpg',60,2,30.00,1),(8,'Amla chamanprash','Amla candy taste chamanprash','Patanjali_Amla_Candy_Chamanprash.jpg',250,3,550.00,1),(9,'chatpata chamanprash','Amla candy chatpata spicy taste chamanprash','Patanjali_Amla_Chatpata_Candy_Chamanprash.jpg',250,3,599.00,1),(10,'badam chamanprash','patanjali ayurvedic badam chamaprsh','Patanjali_Badam_Pak_Chamanprash.jpeg',500,3,575.00,1),(11,'gulkand chamanprash','patanjali ayurvedic gulkand flavour chamanprash','patanjali_gulkand_chamanprash.jpg',500,3,585.00,1),(12,'hing chamanprash','patanjali pure ayurvedic hing chamanprash','patanjali_hing_chamanprash.jpg',500,3,581.00,1),(13,'pachak hingpeda chamanprash','patanjali pure ayurvedic pachak chamanprash with hing ingredients','patanjali_pachak_hingpeda_chamanprash.jpg',500,3,589.00,1),(14,'50-50 maska chaska','britannia 50 50 maska chaska biscuit','britannia_50_50_maska_chaska_biscuit.jpg',50,1,10.00,25),(15,'britannia bourbon','britannia bourbon chocalte flavour cream biscuit with extra sugar ','britannia_bourbon_chocolate_flavor_cream_biscuit.jpg',100,1,10.00,25),(16,'Good day chocolate','britannia good day cookies chocolate flavour','britannia_good_day_cookies_choco_nut_biscuit.jpg',100,1,30.00,25),(17,'Good day elaichi','britannia good day nuts elaichi biscuit','britannia_good_day_nuts_elaichi_biscuit.jpg',100,1,10.00,25),(18,'Little heart','britannia heart shape namkeen and sweet little biscuits','britannia_little_hearts_biscuit.jpg',50,1,10.00,25),(19,'Marrie gold','britannia marrie gold simple tea suppliment biscuit','britannia_marie_gold_biscuit.jpg',100,1,10.00,25),(20,'Milk bikis','britannia original milk bikis biscuit','britannia_milk_bikis_biscuit.jpg',100,1,10.00,25),(21,'Cream Milk bikis','britannia milk bikis with extra milk flavour cream','britannia_milk_bikis_cream_biscuit.jpg',150,1,25.00,25),(22,'coconut biscuit','britannia coconut with sugar added showred biscuit','britannia_nice_time_sugar_showered_coconut_biscuit.jpg',100,1,10.00,25),(23,'Nutri fibre','britannia nuticious high fibre digestive biscuit','britannia_nutri_choice_hi_fibre_digestive_biscuit.jpg',250,1,50.00,25),(24,'jim-jam','britannia treat jim jam biscuit','britannia_treat_jim_jam_biscuit.jpg',150,1,20.00,25),(25,'cadbury oreo','cadbury oreo chocolate biscuit with milk flavor cream','cadbury_oreo_choco_creme_biscuit.jpg',100,1,15.00,17),(26,'Hide and Seek','parle hide and seek chocolate biscuit with extra granules of chocolates ','parle_and_hide_seek_chocolate_biscuit.jpg',150,1,25.00,26),(27,'krack-jack','parle crack jack sweet bhi and salti bhi','parle_krack_jack_biscuit.jpg',100,1,10.00,26),(28,'Sandalwood agarbatti','devdarshan aura snadalwood fragrance agarbatti','devdarshan_aura_sandalwood_agarbatti.jpg',50,9,14.00,27),(29,'Deep-sandal agarbatti','','devdarshan_deep_sandal_puja_agarbatti.jpg',40,9,85.00,27),(30,'Dhoop agarbatti','devdarshan lavender fragrance dhoop agarbatti','devdarshan_lavender_dhoop_agarbatti.jpg',60,9,55.00,27),(31,'Bouquet agarbatti','mandaldeep classic bouquet agarbatti moderate fragrance','mangaldeep_bouquet_agarbatti.jpg',40,9,49.00,28),(32,'Temple agarbatti','maggaldeep gold agarbatti especially for temple purpose','mangaldeep_temple_gold_agarbatti.jpg',60,9,80.00,28),(33,'Darvesh agarbatti','moksha classic darvesh agarbatti','moksha_darvesh_agarbatti.jpg',70,9,110.00,29),(34,'Royal agarbatti',NULL,'moksha_exotic_royal_agarbatti.jpg',30,9,240.00,29),(35,'Swarn kalash agarbatti','moksha swarn kalash moderate fragrance agarbatti','moksha_swarn_kalash_agarbatti.jpg',80,9,50.00,29),(36,'Swarn-mogra agarbatti','moksha mogra fragrance exotic agarbatti','moksha_swarna_mogara_agarbatti.jpg',90,9,45.00,29),(37,'swarn night-queen agarbatti','moksha light fragrance night use agarbatti ','moksha_swarna_night_queen_agarbatti.jpg',100,9,65.00,29),(40,'swarn-chandan agarbatti','moksha swarna chnandan moderate fragrance daily use agarbatti','moksha_swarna_chandan_agarbatti.jpg',80,9,80.00,29),(41,'Swarna-purple agarbatti','moksha premium category occassional use purple agarbatti','moksha_swarna_purple_jewel_dhoop_agarbatti.jpg',90,9,280.00,29),(46,'singapore_noodle','chings noodles of singapore style','chings_singapore_noodle.jpg',70,10,10.00,22),(47,'mast masala noodle','Knorr indian style mast masala noodle','knorr_mast_masala_noodle.jpg',70,10,12.00,23),(48,'Maggi Amritsari achari noodle','Maagi with Amritsari style noodel','maggi_amritsari_achari_noodle.jpg',70,10,12.00,31),(49,'Maggi Bengali masala noodle','Maggi in favourte west bengal style','maggi_bengali_masala_noodle.jpg',70,10,12.00,31),(50,'Maggi Hot head peri-peri noodle','Maggi in your favorite peri peri style','maggi_hot_heads_peri_peri_noodles.jpg',70,10,22.00,31),(51,'maggi masala noodle','maggi orininal masala noodle','maggi_masala_noodle.jpg',150,10,25.00,31),(52,'Maggi Mumbaiya noodle','maggi famous mumbai style noodle','maggi_mumbaiya_noodle.jpg',70,10,12.00,31),(53,'yippee magic masala','Yipee magic masala noodle pack of 2','sunfeast_magic_masala_noodle.jpg',180,10,25.00,24),(54,'Yippee noodle','Yipee normal classic noodle','Sunfeast_Yipee_normal_noodle.jpg',75,10,10.00,24),(55,'Yippee classic masala','Yipee Claasic spicy noodle pack of 2','sunfeast_yippee_classic_masala_noodle.jpg',180,10,25.00,24),(56,'Classic rock salt','Crystamin classic pure rock salt powder','crystamin_classic_rock_salt.jpg',200,8,30.00,32),(57,'Natural Himalayan pink rock salt','Pure himalyan pink rock salt powder','crystamin_natural_himalyan_pink_rock_salt.jpg',150,8,50.00,32),(58,'Tata lite','Tata lite salt','tata_lite_salt.jpg',500,8,18.00,33),(59,'Tata salt','Tata original salt','tata_salt.jpg',500,8,16.00,33),(60,'Sohan papdi','aakash classic sohan papdi','aakash_sohan_papdi.jpg',250,6,140.00,16),(61,'miniature milk silk','Cadbury miniatures dairy milk silk chocolate','cadbury_miniatures_dairy_milk_silk_chocolate.jpg',400,6,840.00,17),(62,'rocher 6 pack','Ferrero rocher 6 pack chocolate','ferrero_rocher_6pack_chocolate.jpg',240,6,480.00,18),(63,'Rocher 25 pack','Ferrerp rocher premium chocolate family pack','ferrero_rocher_premium_chocolate.jpg',500,6,1250.00,18),(64,'Rasmalai','Gits homemade rasmali powder','gits_rasmalai.jpg',500,6,240.00,19),(65,'Petha','Haldiram petha of Agra','haldiram_agra_wale_petha.jpg',250,6,85.00,7),(66,'Gold sohanpapdi','Haldiram Gold premium sohanpapdi','haldiram_gold_sohanpapdi.jpg',250,6,330.00,7),(67,'Gulabjamun','Haldiram gulab jamun','haldiram_gulab_jamun.jpg',500,6,250.00,7),(68,'Sweets pack','Haldiram festival special settes pack','haldiram_pack_fest_special_sweet.jpg',1250,6,1450.00,7),(69,'Rasgulla','Haldiram rasgulla','haldiram_rasgulla.jpg',500,6,250.00,7),(70,'Sohan papdi','Haldiram classic sohan padi','haldiram_soan_papdi.jpg',250,6,90.00,7),(71,'Gulabjamun powder','MTR premium gulab jamun powder','mtr_gulab_jamun.jpg',500,6,80.00,21),(72,'Rasgulla','Roopji rasgulla','roopji_rasgulla.jpg',500,6,190.00,20),(73,'Dabur red','Dabur red ayurvedic toothpaste','dabur_red_ayurvedic_toothpaste.jpg',100,7,60.00,6),(74,'Close-up everfresh','Close-up everfresh red hot gel toothpaste','close_up_ever_fresh_red_hot_gel_toothpaste.jpg',110,7,40.00,15),(75,'Colgate Active salt','Colgate active salt mineral toothpaste','colgate_active_salt_minerals_toothpaste.jpg',100,7,42.00,24),(76,'Colgate barbie','Colgate barbie strawberry kids toothpaste','colgate_barbie_strawberry_kids_toothpaste.jpg',100,7,76.00,14),(77,'Colgate maxfresh gel','Colgate maxfresh spicy red gel toothpaste','colgate_maxfresh_spicy_red_gel_toothpaste.jpg',200,7,96.00,4),(78,'Naturak herbal','Colgate natural herbal toothpaste','colgate_natural_herbal_toothpaste.jpg',100,7,64.00,14),(79,'Total charcoal','Colgate total charcoal toothpaste','colgate_total_charcoal_toothpaste.jpg',100,7,125.00,14),(80,'Dabur meswak','Dabur meswak toothpaste','dabur_meswak_toothpaste.jpg',100,7,65.00,16),(81,'Dant kanti Regular','Patanjali dant kanti regular toothpaste','patanjali_dant_kanti_regular_toothpaste.jpg',100,7,85.00,1),(82,'Pepsodent salt','Pepsodent clove and salt toothpaste','pepsodent_clove_and_salt_toothpaste.jpg',100,7,44.00,27),(83,'Pepsodent germicheck','Pepsodent germicheck toothpaste','pepsodent_germicheck_toothpaste.jpg',100,7,65.00,17),(84,'Himalaya Active care','Himalaya active fresh gel toothpaste','himalaya_active_fresh_gel_toothpaste.jpg',100,7,80.00,4),(85,'Complete care','Himalaya complete care toothpaste','himalaya_complete_care_toothpaste.jpg',100,7,65.00,4),(86,'Ambay santique','Ambay santique shampoo','ambay_satinique_shampoo.jpg',80,2,112.00,6),(87,'Ayur natural','Ayur natural shampoo','ayur_natural_shampoo.jpg',150,2,185.00,2),(88,'Dove intense repair','Dove intense repair conditioner','dove_intense_repair_Conditioner.jpg',100,2,114.00,12),(89,'Head and shoulder','Head and shoulder lemon shampoo','head_and_shoulder_shampoo.jpg',120,2,135.00,3),(90,'Neem soap','Himalaya neem soap','himalaya_neem_soap.jpg',50,2,23.00,4),(91,'Chandan soap','Khadi chandan soap','khadi_chandan_soap.jpg',40,2,20.00,13),(92,'Neem soap','Khadi neem soap','khadi_neem_soap.jpg',40,2,20.00,13),(93,'Lifebuoy lemonfresh','Lifebuoy lemonfresh soap','lifebuoy_lemonfresh_soap.jpg',60,2,24.00,14),(94,'Fresh splesh','Lux fresh splash soap','lux_fresh_splash_soap.jpg',60,2,18.00,10),(95,'Soft touch','Lux soft touch soap','lux_soft_touch_soap.jpg',60,2,18.00,10),(96,'Beer shampoo','Park avenue beer shampoo pack of two','park_avenue_beer_shampoo.jpg',120,2,540.00,5),(97,'Savlon','Savlon medicare soap','savlon_soap.jpg',50,2,22.00,9),(98,'Pantene shiny','Pantene shiny shampoo','pantene_shiny_shampoo.jpg',120,2,108.00,15),(99,'masala chai','Everest masala tea','everest_masala_tea.jpg',50,4,20.00,28),(100,'Darjeeling tea','Lipton darjeeling tea','lipton_darjeeling_tea.jpg',100,4,35.00,29),(101,'Green tea','Lipton green tea','lipton_green_tea.jpg',100,4,58.00,29),(102,'Agni','Tata tea agni','tata_tea_agni.jpg',50,4,18.00,33),(103,'Agni leaf','Tata tea agni leaf','tata_tea_agni_leaf.jpg',100,4,28.00,33),(104,'Chakra Gold','Tata tea chakra gold dust tea','tata_tea_chakra_gold_dust_tea.jpg',250,4,180.00,33),(105,'Elaichi tea','Tata tea elaichi chai','tata_tea_elaichi_chai.jpg',150,4,60.00,33),(106,'Gold leaf','Tata tea gold leaf','tata_tea_gold_leaf.jpg',50,4,28.00,33),(107,'Premium leaf','Tata tea premium leaf','tata_tea_premium_leaf.jpg',200,4,290.00,33),(108,'Darjeeling leaf','Tata tea premium darjeeling leaf','tata_tea_premium_darjeeling_leaf.jpg',100,4,35.00,33),(139,'Garam masala','MDH garam masala','mdh_masala_garam.jpg',50,5,50.00,30),(140,'coriander','MTR corinder powder','mtr_powder_coriander.jpg',100,5,80.00,21),(141,'Turmeric','MTR turmeric powder','mtr_powder_turmeric.jpg',100,5,40.00,21),(142,'Ajwain','MTR royal ajwain whole','mtr_royal_ajwain_whole.jpg',100,5,60.00,21),(143,'Green elaichi','MTR royal cardamomelaichi_green','mtr_royal_cardamomelaichi_green.jpg',100,5,85.00,21),(144,'Dalchini','MTR royal cinnamon dalchini','mtr_royal_cinnamon_dalchini.jpg',80,5,45.00,21),(145,'Laung','MTR royal cloves launga','mtr_royal_cloves_launga.jpg',50,5,16.00,21),(146,'Methi','MTR royal fenugreek methi','mtr_royal_fenugreek_methi.jpg',100,4,40.00,21),(147,'Sounf','MTR royal green sonf','mtr_royal_sounf_green.jpg',50,5,12.00,21),(148,'Rai','MTR royal mustard small rai','mtrroyal_mustard_rai_small.jpg',100,5,30.00,21),(149,'Bajaj Almond drop','Bajaj almond drops hair oil','bajaj_almond_drops_hair_oil.jpg',100,8,85.00,31),(150,'Brahmi Amla','Bajaj brahmi amla ayurvedic hair oil','bajaj_brahmi_amla_ayurvedic_hair_oil.jpg',80,8,40.00,11),(151,'Anti dandruff oil','Himalaya Anti-dandruff hair oil','himalaya_anti_dandruff_hair_oil.jpg',100,8,90.00,4);

--
-- Table structure for table `product_rate`
--

DROP TABLE IF EXISTS `product_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `store_id` int NOT NULL,
  `product_id` int NOT NULL,
  `rate` decimal(2,1) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_id` (`customer_id`,`store_id`,`product_id`),
  KEY `store_id_index` (`store_id`),
  KEY `product_id_index` (`product_id`),
  KEY `customer_id_index` (`customer_id`),
  CONSTRAINT `fk_product_rate_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_product_rate_products_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_rate_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  CONSTRAINT `chk_Ratings` CHECK (((`rate` >= 0) and (`rate` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_rate`
--

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_product_rate_AINSERT` AFTER INSERT ON `product_rate` FOR EACH ROW BEGIN
    DECLARE totalCount INT DEFAULT 0;
    DECLARE totalSum DECIMAL DEFAULT 0;
    SELECT count(*), SUM(rate) INTO totalCount, totalSum FROM product_rate WHERE product_id = NEW.product_id AND store_id = NEW.store_id;
    UPDATE store_products SET rate = (totalSum/totalCount) WHERE store_id=NEW.store_id AND product_id = NEW.product_id;
    INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('product_rate', 'INSERT', concat('storeId=',NEW.store_id, ', product_id=', NEW.product_id,', customer_id=', NEW.customer_id), 'New Product rate Been Added');
    INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('store_products', 'UPDATE', concat('storeId=',NEW.store_id, ', product_id=', NEW.product_id), concat('rate updated to: ', (totalSum/totalCount)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `retail_chain`
--

DROP TABLE IF EXISTS `retail_chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retail_chain` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `industry` varchar(30) NOT NULL,
  `founded_year` varchar(10) DEFAULT NULL,
  `headquarter` varchar(10) DEFAULT NULL,
  `revenue` varchar(100) DEFAULT NULL,
  `url` text,
  `country_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id_index` (`country_id`),
  CONSTRAINT `retail_chain_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retail_chain`
--

INSERT INTO `retail_chain` VALUES (1,'Aldi','Retail','1964','Germany','121.1 billion$','aldi.com',170);

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_name` varchar(30) NOT NULL,
  `retail_chain_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `retail_chain_id_index` (`retail_chain_id`),
  KEY `location_id_index` (`location_id`),
  CONSTRAINT `store_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `store_retail_chain_id` FOREIGN KEY (`retail_chain_id`) REFERENCES `retail_chain` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

INSERT INTO `store` VALUES (1,'ALDI Agualva Cacém',1,29),(2,'ALDI Albufeira',1,30),(3,'ALDI Alcantarilha',1,31),(4,'ALDI Alfragide',1,31),(5,'ALDI Almancil',1,32),(6,'ALDI Alta de Lisboa',1,33),(7,'ALDI Alverca do Ribatejo',1,34),(8,'ALDI Azambuja',1,35),(9,'ALDI Boliqueime',1,36),(10,'ALDI Cacém',1,29),(11,'ALDI Caldas da Rainha',1,37),(12,'ALDI Carregado',1,38),(13,'ALDI Casal de Cambra',1,39);

--
-- Table structure for table `store_products`
--

DROP TABLE IF EXISTS `store_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `product_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `rate` decimal(2,1) DEFAULT '0.0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id_index` (`store_id`),
  KEY `product_id_index` (`product_id`),
  CONSTRAINT `fk_store_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_store_products_store_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_products`
--


--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `contact_name` varchar(100) DEFAULT NULL,
  `contact_title` varchar(100) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id_index` (`location_id`),
  CONSTRAINT `supplier_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` VALUES (1,'Exotic Liquids','Charlotte Cooper','Purchasing Manager','(171) 555-2222',1),(2,'New Orleans Cajun Delights','Shelley Burke','Order Administrator','(100) 555-4822',2),(3,'Grandma Kellys Homestead','Regina Murphy','Sales Representative','(313) 555-5735',3),(4,'Tokyo Traders','Yoshi Nagase','Marketing Manager','(03) 3555-5011',4),(5,'Cooperativa de Quesos Las Cabras','Antonio del Valle Saavedra ','Export Administrator','(98) 598 76 54',5),(6,'Mayumis','Mayumi Ohno','Marketing Representative','(06) 431-7877',6),(7,'Pavlova, Ltd.','Ian Devling','Marketing Manager','(03) 444-2343',7),(8,'Specialty Biscuits, Ltd.','Peter Wilson','Sales Representative','(161) 555-4448',8),(9,'PB Knäckebröd AB','Lars Peterson','Sales Agent','031-987 65 43',9),(10,'Refrescos Americanas LTDA','Carlos Diaz','Marketing Manager','(11) 555 4640',10),(11,'Heli Süßwaren GmbH & Co. KG','Petra Winkler','Sales Manager','(010) 9984510',11),(12,'Plutzer Lebensmittelgroßmärkte AG','Martin Bein','International Marketing Mgr.','(069) 992755',12),(13,'Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Coordinator Foreign Markets','(04721) 8713',13),(14,'Formaggi Fortini s.r.l.','Elio Rossi','Sales Representative','(0544) 60323',14),(15,'Norske Meierier','Beate Vileid','Marketing Manager','(0)2-953010',15),(16,'Bigfoot Breweries','Cheryl Saylor','Regional Account Rep.','(503) 555-9931',16),(17,'Svensk Sjöföda AB','Michael Björn','Sales Representative','08-123 45 67',17),(18,'Aux joyeux ecclésiastiques','Guylène Nodier','Sales Manager','(1) 03.83.00.68',18),(19,'New England Seafood Cannery','Robb Merchant','Wholesale Account Agent','(617) 555-3267',19),(20,'Leka Trading','Chandra Leka','Owner','555-8787',20),(21,'Lyngbysild','Niels Petersen','Sales Manager','43844108',21),(22,'Zaanse Snoepfabriek','Dirk Luchte','Accounting Manager','(12345) 1212',22),(23,'Karkki Oy','Anne Heikkonen','Product Manager','(953) 10956',23),(24,'Gday, Mate','Wendy Mackenzie','Sales Representative','(02) 555-5914',24),(25,'Ma Maison','Jean-Guy Lauzon','Marketing Manager','(514) 555-9022',25),(26,'Pasta Buttini s.r.l.','Giovanni Giudici','Order Administrator','(089) 6547665',26),(27,'Escargots Nouveaux','Marie Delamare','Sales Manager','85.57.00.07',27),(28,'Gai pâturage','Eliane Noz','Sales Representative','38.76.98.06',28),(29,'Forêts dérables','Chantal Goulet','Accounting Manager','(514) 555-2955',29),(30,'Forêts dérables','Chantal Goulet','Sales Representative','(514) 555-2955',29),(31,'Forêts dérables','Chantal Goulet','Marketing Manager','(514) 555-2955',29),(32,'Forêts dérables','Chantal Goulet','Sales Manager','(514) 555-2955',29),(33,'Forêts dérables','Chantal Goulet','Marketing Manager','(514) 555-2955',29);

--
-- Table structure for table `supply_process`
--

DROP TABLE IF EXISTS `supply_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply_process` (
  `supplier_id` int NOT NULL,
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `date` datetime NOT NULL,
  `quantity` double DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`supplier_id`,`product_id`,`store_id`,`date`),
  KEY `supplier_id_index` (`supplier_id`),
  KEY `product_id_index` (`product_id`),
  KEY `store_id_index` (`store_id`),
  CONSTRAINT `fk_supply_process_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_supply_process_store_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  CONSTRAINT `fk_supply_process_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply_process`
--

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_supply_process_AINSERT` AFTER INSERT ON `supply_process` FOR EACH ROW BEGIN
    DECLARE rowsCount INT DEFAULT 0;
    DECLARE price_ INT DEFAULT 0;
    SELECT COUNT(*) INTO rowsCount FROM store_products where store_products.store_id = NEW.store_id AND store_products.product_id = NEW.product_id;
    IF rowsCount > 0 THEN
        UPDATE store_products SET quantity = quantity + NEW.quantity where store_products.store_id = NEW.store_id AND store_products.product_id = NEW.product_id;
        INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('store_products', 'UPDATE', concat('store_id=', NEW.store_id,', product_id=', NEW.product_id), concat('quantity updated to: +', NEW.quantity));
    ELSE
        SELECT price INTO price_ from product where product.id = NEW.product_id;
        INSERT INTO store_products(`store_id`, `product_id`, `price`, `quantity`, `created_at`, `updated_at`) VALUES (NEW.store_id, NEW.product_id, price_, NEW.quantity, NOW(), NOW());
        INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('store_products', 'INSERT', concat('store_id=', NEW.store_id,', product_id=', NEW.product_id), concat('New product been added with quantity=', NEW.quantity));
    END IF;
    INSERT INTO `logs` (`l_table`, `l_action`, `row_identifier`, `new_value`) VALUES ('supply_process', 'INSERT', concat('supplier_id=', NEW.supplier_id,', store_id=', NEW.store_id, ', product_id=', NEW.product_id), concat('New product been added with quantity=', NEW.quantity));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `store_id` int NOT NULL,
  `order_id` int NOT NULL,
  `discount` decimal(10,2) DEFAULT '0.00',
  `tax_rate` decimal(10,2) DEFAULT '5.00',
  `tax` decimal(10,2) DEFAULT '0.00',
  `sub_total` decimal(10,2) DEFAULT '0.00',
  `total` decimal(10,2) DEFAULT '0.00',
  `date_of_purchase` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method` varchar(40) DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_id` (`customer_id`,`store_id`,`order_id`),
  KEY `customer_id_index` (`customer_id`),
  KEY `store_id_index` (`store_id`),
  KEY `order_id_index` (`order_id`),
  KEY `employee_id_index` (`employee_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `transaction_ibfk_4` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--


--
-- Temporary view structure for view `vw_invoice_details`
--

DROP TABLE IF EXISTS `vw_invoice_details`;
/*!50001 DROP VIEW IF EXISTS `vw_invoice_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_invoice_details` AS SELECT
 1 AS `invoiceId`,
 1 AS `ProductName`,
 1 AS `unitCost`,
 1 AS `QTY`,
 1 AS `AMOUNT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_invoice_summary`
--

DROP TABLE IF EXISTS `vw_invoice_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_invoice_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_invoice_summary` AS SELECT
 1 AS `invoiceId`,
 1 AS `invoiceNumber`,
 1 AS `dateOfIssue`,
 1 AS `subTotal`,
 1 AS `Discount`,
 1 AS `taxRate`,
 1 AS `Tax`,
 1 AS `Total`,
 1 AS `clientName`,
 1 AS `clientAddress`,
 1 AS `storeName`,
 1 AS `storeCity`,
 1 AS `storeAddress`,
 1 AS `storePostalCode`,
 1 AS `employeeName`,
 1 AS `employeeEmail`,
 1 AS `employeeJobtitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_invoice_details`
--

/*!50001 DROP VIEW IF EXISTS `vw_invoice_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_invoice_details` AS select `orders`.`id` AS `invoiceId`,`product`.`name` AS `ProductName`,`order_product`.`unit_price` AS `unitCost`,`order_product`.`quantity` AS `QTY`,`order_product`.`amount` AS `AMOUNT` from (((`orders` join `order_products` `order_product` on((`order_product`.`order_id` = `orders`.`id`))) join `store_products` `store_product` on((`store_product`.`id` = `order_product`.`store_product_id`))) join `product` on((`store_product`.`product_id` = `product`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_invoice_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_invoice_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_invoice_summary` AS select `orders`.`id` AS `invoiceId`,`orders`.`code` AS `invoiceNumber`,`orders`.`time` AS `dateOfIssue`,`transaction`.`sub_total` AS `subTotal`,`transaction`.`discount` AS `Discount`,`transaction`.`tax_rate` AS `taxRate`,`transaction`.`tax` AS `Tax`,`transaction`.`total` AS `Total`,concat(`customer`.`first_name`,' ',`customer`.`last_name`) AS `clientName`,`customer`.`address` AS `clientAddress`,`store`.`store_name` AS `storeName`,`location`.`city` AS `storeCity`,`location`.`street_address` AS `storeAddress`,`location`.`postal_code` AS `storePostalCode`,concat(`employee`.`first_name`,' ',`employee`.`last_name`) AS `employeeName`,`employee`.`email` AS `employeeEmail`,`job`.`title` AS `employeeJobtitle` from ((((((`orders` join `transaction` on((`transaction`.`order_id` = `orders`.`id`))) join `store` on((`store`.`id` = `orders`.`store_id`))) join `location` on((`location`.`id` = `store`.`location_id`))) join `customer` on((`customer`.`id` = `orders`.`customer_id`))) join `employee` on((`employee`.`id` = `orders`.`employee_id`))) join `job` on((`job`.`id` = `employee`.`job_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

DROP PROCEDURE IF EXISTS `GET_AvgSales`;
DELIMITER $$
CREATE PROCEDURE `GET_AvgSales`(IN storeId int, IN fromYear int, IN toYear int)
BEGIN
        SELECT CONCAT(fromYear, '-', toYear) as PeriodOfSales, SUM(yearlySales.TotalSales) as TotalSales,
               floor(avg(yearlySales.TotalSales)) as avgYearlySales,
               floor(avg(monthlySales.TotalSales)) as avgMonthlySales
        FROM
        (
            SELECT SUM(amount) AS TotalSales
            FROM orders o WHERE store_id = storeId AND YEAR(time) BETWEEN fromYear AND toYear
            GROUP BY store_id, YEAR(time)
        ) as yearlySales,
        (
            SELECT SUM(amount) AS TotalSales
            FROM orders WHERE store_id = storeId AND YEAR(time) BETWEEN fromYear AND toYear
            GROUP BY store_id, YEAR(time), MONTH(time)
        ) as monthlySales;
    END$$
DELIMITER ;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-12 18:59:21
