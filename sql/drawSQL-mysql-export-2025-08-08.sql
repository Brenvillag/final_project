CREATE DATABASE IF NOT EXISTS leed_cert;
USE leed_cert;

CREATE TABLE `Country`(
    `Country_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `CountryName` VARCHAR(255) NOT NULL
);  
 
 CREATE TABLE `State`(
    `State_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Country_Id` BIGINT UNSIGNED NOT NULL,
    `StateName` VARCHAR(255) NOT NULL,
    CONSTRAINT `fk_state_country` FOREIGN KEY (`Country_Id`) REFERENCES `Country`(`Country_Id`)
);

CREATE TABLE `City`(
    `City_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `State_Id` BIGINT UNSIGNED NOT NULL,
    `CityName` VARCHAR(255) NOT NULL,
    CONSTRAINT `fk_city_state` FOREIGN KEY (`State_Id`) REFERENCES `State`(`State_Id`)
);

CREATE TABLE `Location`(
    `Location_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `City_Id` BIGINT UNSIGNED NOT NULL,
    `Zipcode` VARCHAR(255) NOT NULL,
	CONSTRAINT `fk_location_city` FOREIGN KEY (`City_Id`) REFERENCES `City`(`City_Id`)
);

CREATE TABLE `Projects`(
    `Project_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Location_Id` BIGINT UNSIGNED NOT NULL,
    `ProjectName` VARCHAR(255) NOT NULL,
    `GrossFloorAreaSqm` FLOAT(53) NOT NULL,
    `ProjectTypes` VARCHAR(255) NOT NULL,
    `IsCertified` VARCHAR(10) NOT NULL,
    CONSTRAINT `fk_project_location` FOREIGN KEY (`Location_Id`) REFERENCES `Location`(`Location_Id`)
);

CREATE TABLE `Certification`(
    `Certification_Id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Project_Id` BIGINT UNSIGNED NOT NULL UNIQUE,
    `RatingSystem` VARCHAR(255) NOT NULL,
    `PointsAchieved` BIGINT NOT NULL,
    `CertLevel` VARCHAR(50) NOT NULL,
    `CertDate` DATETIME NOT NULL,
    CONSTRAINT `fk_certification_project` FOREIGN KEY (`Project_Id`) REFERENCES `Projects`(`Project_Id`)
);

CREATE TABLE `Sustainability_Metrics`(
    `Metric_Id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Project_Id` BIGINT UNSIGNED NOT NULL UNIQUE,
    `EnergySaving` BIGINT UNSIGNED NOT NULL,
    `CO2Avoided` FLOAT(53) NOT NULL,
    `WaterSaving` FLOAT(53) NOT NULL,
    `WasteAvoided` FLOAT(53) NOT NULL,
    CONSTRAINT `fk_sustainability_project` FOREIGN KEY (`Project_Id`) REFERENCES `Projects`(`Project_Id`)
);




