CREATE DATABASE IF NOT EXISTS leed_cert;
USE leed_cert;

CREATE TABLE `Location` (
    `Location_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `City` VARCHAR(255) NOT NULL,
    `State` VARCHAR(255) NOT NULL,
    `Zipcode` VARCHAR(255) NOT NULL,
    `Country` VARCHAR(255) NOT NULL
);
CREATE TABLE `Projects` (
    `Project_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Location_Id` BIGINT UNSIGNED NOT NULL,
    `ProjectName` VARCHAR(255) NOT NULL,
    `GrossFloorAreaSqm` FLOAT(53) NOT NULL,
    `ProjectTypes` VARCHAR(255) NOT NULL,
    `IsCertified` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`Location_Id`) REFERENCES `Location`(`Location_Id`)
);
CREATE TABLE `Certification` (
    `Certification_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Project_Id` BIGINT UNSIGNED NOT NULL UNIQUE,
    `RatingSystem` VARCHAR(255) NOT NULL,
    `PointsAchieved` BIGINT NOT NULL,
    `CertLevel` VARCHAR(255) NOT NULL,
    `CertDate` DATETIME NOT NULL,
    FOREIGN KEY (`Project_Id`) REFERENCES `Projects`(`Project_Id`)
);
CREATE TABLE `Sustaintability_Metrics` (
    `Metric_Id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Project_Id` BIGINT UNSIGNED NOT NULL UNIQUE,
    `EnergySaving` BIGINT NOT NULL,
    `CO2Avoided` BIGINT NOT NULL,
    `WaterSaving` BIGINT NOT NULL,
    `WasteAvoided` BIGINT NOT NULL,
    FOREIGN KEY (`Project_Id`) REFERENCES `Projects`(`Project_Id`)
);


