# CS157A-team7

## Create needed schema and tables using the following MySQL DDL statements

CREATE SCHEMA `hospibase` ;

CREATE TABLE `hospibase`.`Patients` (
  `idPatients` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `medicalHistory` VARCHAR(500) NULL,
  `prescriptions` VARCHAR(50) NULL,
  `doctorID` INT NOT NULL,
  `roomNumber` INT NULL,
  `insurance` VARCHAR(45) NULL,
  `hospitalFee` DECIMAL(10,2) NULL,
  PRIMARY KEY (`idPatients`));

CREATE TABLE `hospibase`.`Doctors` (
  `idDoctors` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `patientIDs` VARCHAR(45) NULL,
  `salary` DECIMAL(10,2) NULL,
  PRIMARY KEY (`idDoctors`));

CREATE TABLE `hospibase`.`appointment` (
  `appointmentID` int NOT NULL,
  `patientID` int DEFAULT NULL,
  `patientName` varchar(45) DEFAULT NULL,
  `doctorID` int DEFAULT NULL,
  `doctorName` varchar(45) DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  PRIMARY KEY (`appointmentID`),
  UNIQUE KEY `appointmentID_UNIQUE` (`appointmentID`));  
  
 CREATE TABLE `hospibase`.`medication` (
  `medicine` varchar(45) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `medDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`medicine`),
  UNIQUE KEY `medicine_UNIQUE` (`medicine`),
  UNIQUE KEY `brand_UNIQUE` (`brand`));
  
 CREATE TABLE `hospibase`.`HospitalRooms` (
  `roomNumber` int NOT NULL,
  `patientID` int DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roomNumber`),
  UNIQUE KEY `roomNumber_UNIQUE` (`roomNumber`));


  ### Dummy data for patients 
INSERT INTO `hospibase`.`Patients` (`idPatients`, `firstName`, `lastName`, `medicalHistory`, `prescriptions`, `doctorID`, `insurance`, `hospitalFee`) VALUES ('1', 'Bob', 'Bobby', 'Headache', 'OTC advil', '1', 'Blue Shield', '5.00');

INSERT INTO `hospibase`.`Patients` (`idPatients`, `firstName`, `lastName`, `medicalHistory`, `prescriptions`, `doctorID`, `insurance`, `hospitalFee`) VALUES ('2', 'John', 'Smith', 'Diabetes', 'insulin', '2', 'Covered California', '35.78');

INSERT INTO `hospibase`.`Patients` (`idPatients`, `firstName`, `lastName`, `medicalHistory`, `prescriptions`, `doctorID`, `roomNumber`, `insurance`, `hospitalFee`) VALUES ('3', 'John', 'Doe', 'Cancer', 'Bleomycin', '1', '1', 'Blue Shield', '1000');

INSERT INTO `hospibase`.`Patients` (`idPatients`, `firstName`, `lastName`, `medicalHistory`, `prescriptions`, `doctorID`, `roomNumber`, `hospitalFee`) VALUES ('4', 'Sarah', 'Tri', 'Heart palpitations', 'Beta-blockers', '3', '2', '78.5');

INSERT INTO `hospibase`.`Patients` (`idPatients`, `firstName`, `lastName`, `medicalHistory`, `prescriptions`, `doctorID`, `roomNumber`, `insurance`, `hospitalFee`) VALUES ('5', 'Johnny', 'S.', 'Lung cancer', 'Afinitor', '2', '1', 'Blue Shield', '800.50');

ALTER TABLE `hospibase`.`Patients` 
ADD COLUMN `username` VARCHAR(45) NOT NULL AFTER `hospitalFee`,
ADD COLUMN `password` VARCHAR(45) NOT NULL AFTER `username`;

ALTER TABLE `hospibase`.`Patients` 
CHANGE COLUMN `medicalHistory` `medicalIssues` VARCHAR(500) NULL DEFAULT NULL ;

UPDATE `hospibase`.`Patients` SET `username` = 'bobs', `password` = 'bobby123' WHERE (`idPatients` = '1');
UPDATE `hospibase`.`Patients` SET `username` = 'jsmith', `password` = 'johnsmith1' WHERE (`idPatients` = '2');
UPDATE `hospibase`.`Patients` SET `username` = 'jdoe', `password` = 'strongpass' WHERE (`idPatients` = '3');
UPDATE `hospibase`.`Patients` SET `username` = 'tri', `password` = 'password' WHERE (`idPatients` = '4');
UPDATE `hospibase`.`Patients` SET `username` = 'silver', `password` = 'password' WHERE (`idPatients` = '5');


  ### Dummy data for doctors
INSERT INTO `hospibase`.`Doctors` (`idDoctors`, `firstName`, `lastName`, `patientIDs`, `salary`) VALUES ('1', 'Stephen', 'Strange', '1, 3', '250000.54');

INSERT INTO `hospibase`.`Doctors` (`idDoctors`, `firstName`, `lastName`, `patientIDs`, `salary`) VALUES ('2', 'Bob', 'Bobs', '2, 5', '200000');

INSERT INTO `hospibase`.`Doctors` (`idDoctors`, `firstName`, `lastName`, `patientIDs`, `salary`) VALUES ('3', 'Bill', 'N', '4', '210000');

  ### Dummy data for appointment
INSERT INTO `hospibase`.`Appointment` (`appointmentID`, `patientID`, `patientName`, `doctorID`, `doctorName`, `startTime`, `endTime`) VALUES (1,1,'Bob Bobby',1,'Stephen Strange','09:00:00','10:00:00');

  ### Dummy data for medication
INSERT INTO `hospibase`.`Medication` (`medicine`, `brand`, `medDescription`) VALUES ('Atenolol','Tenormin','beta blockers used to treat high blood pressure and chest pain');

INSERT INTO `hospibase`.`Medication` (`medicine`, `brand`, `medDescription`) VALUES ('Everolimus','Afinitor','chemotherapy cancer treatment');

INSERT INTO `hospibase`.`Medication` (`medicine`, `brand`, `medDescription`) VALUES ('Ibuprofen','Advil','nonsteroidal anti-inflammatory drug (NSAID) used to treat mild to moderate pain');


  ### Dummy data for hospital rooms
INSERT INTO `hospibase`.`hospitalrooms` (`roomNumber`, `patientID`, `firstName`, `lastName`) VALUES (101,5,'Johnny', 'S.');

INSERT INTO `hospibase`.`hospitalrooms` (`roomNumber`, `patientID`, `firstName`, `lastName`) VALUES (210,4,'Sarah', 'Tri');





