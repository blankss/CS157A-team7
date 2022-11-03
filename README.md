# CS157A-team7

##Code Review 1: Login and registration barebones complete. Search in progress. Temporarily created most of tables needed for project.

## Temporarily create needed schema and tables using the following MySQL DDL statements

CREATE SCHEMA `hospibase` ;

CREATE TABLE `hospibase`.`Doctor` (
  `idDoctor` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(50) NULL,
  `lastName` VARCHAR(50) NULL,
  `specialization` VARCHAR(60) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`idDoctor`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE);

INSERT INTO `hospibase`.`Doctor` (`idDoctor`, `firstName`, `lastName`, `specialization`, `username`, `password`) VALUES ('1', 'Lily', 'Scott', 'Dermatology', 'lilys', 'GzeGjx');
INSERT INTO `hospibase`.`Doctor` (`idDoctor`, `firstName`, `lastName`, `specialization`, `username`, `password`) VALUES ('2', 'Katherine', 'Elsher', 'Neurology', 'katherineE', 'DqwxaM');
INSERT INTO `hospibase`.`Doctor` (`idDoctor`, `firstName`, `lastName`, `specialization`, `username`, `password`) VALUES ('3', 'Lincoln', 'McKenna', 'Pediatrics', 'lincolnpark', 'Pliigr');
INSERT INTO `hospibase`.`Doctor` (`idDoctor`, `firstName`, `lastName`, `specialization`, `username`, `password`) VALUES ('4', 'Trinity', 'Cullen', 'Pediatrics', 'trinitylock', 'cullen1!');
INSERT INTO `hospibase`.`Doctor` (`idDoctor`, `firstName`, `lastName`, `specialization`, `username`, `password`) VALUES ('5', 'Alayna', 'Anderson', 'Immunology', 'alaynaology', '8OD1kS');
INSERT INTO `hospibase`.`Doctor` (`idDoctor`, `firstName`, `lastName`, `specialization`, `username`, `password`) VALUES ('6', 'Harrison', 'Nora', 'Internal Medicine', 'norasmoke', '0iLtZe');
INSERT INTO `hospibase`.`Doctor` (`idDoctor`, `firstName`, `lastName`, `specialization`, `username`, `password`) VALUES ('7', 'Melanie', 'Melenia', 'Internal Medicine', 'malenia', '#shattering');
INSERT INTO `hospibase`.`Doctor` (`idDoctor`, `firstName`, `lastName`, `specialization`, `username`, `password`) VALUES ('8', 'Chase', 'Solace', 'Urologist', 'solstice', 'winter4!@');
INSERT INTO `hospibase`.`Doctor` (`idDoctor`, `firstName`, `lastName`, `specialization`, `username`, `password`) VALUES ('9', 'Ian', 'June', 'Pathology', 'ijuly', 'SoaGSk');
INSERT INTO `hospibase`.`Doctor` (`idDoctor`, `firstName`, `lastName`, `specialization`, `username`, `password`) VALUES ('10', 'Tristan', 'Clark', 'Heart surgeon', 'clarkent', 'superman6');

CREATE TABLE `hospibase`.`Health Plan` (
  `idPlan` INT NOT NULL,
  `planName` VARCHAR(45) NULL,
  `planCost` DECIMAL(7,2) NULL,
  PRIMARY KEY (`idPlan`),
  UNIQUE INDEX `planName_UNIQUE` (`planName` ASC) VISIBLE);

INSERT INTO `hospibase`.`Health Plan` (`idPlan`, `planName`, `planCost`) VALUES ('1001', 'Kaiser', '400.50');
INSERT INTO `hospibase`.`Health Plan` (`idPlan`, `planName`, `planCost`) VALUES ('1002', 'Blue Shield', '601.53');
INSERT INTO `hospibase`.`Health Plan` (`idPlan`, `planName`, `planCost`) VALUES ('1003', 'Amerigroup', '396.78');
INSERT INTO `hospibase`.`Health Plan` (`idPlan`, `planName`, `planCost`) VALUES ('1004', 'Cigna', '485.00');
INSERT INTO `hospibase`.`Health Plan` (`idPlan`, `planName`, `planCost`) VALUES ('1005', 'Health Net', '413.54');
INSERT INTO `hospibase`.`Health Plan` (`idPlan`, `planName`, `planCost`) VALUES ('1006', 'Medi-Cal', '487.57');
INSERT INTO `hospibase`.`Health Plan` (`idPlan`, `planName`, `planCost`) VALUES ('1007', 'Sutter Health', '418.44');
INSERT INTO `hospibase`.`Health Plan` (`idPlan`, `planName`, `planCost`) VALUES ('1008', 'Humana', '644.15');
INSERT INTO `hospibase`.`Health Plan` (`idPlan`, `planName`, `planCost`) VALUES ('1009', 'Molina', '352.45');
INSERT INTO `hospibase`.`Health Plan` (`idPlan`, `planName`, `planCost`) VALUES ('1010', 'Aetna', '256.2');

CREATE TABLE `hospibase`.`Medical History` (
  `idHistory` INT NOT NULL AUTO_INCREMENT,
  `medications` VARCHAR(100) NULL,
  `symptoms` VARCHAR(100) NULL,
  `surgeries` VARCHAR(100) NULL,
  PRIMARY KEY (`idMedical`));

INSERT INTO `hospibase`.`Medical History` (`idMedical`, `medications`, `symptoms`) VALUES ('1', 'Advil', 'Headache');
INSERT INTO `hospibase`.`Medical History` (`idMedical`, `medications`, `symptoms`, `surgeries`) VALUES ('2', 'antibiotics', 'abdominal pains', 'general surgery');
INSERT INTO `hospibase`.`Medical History` (`idMedical`, `medications`, `symptoms`, `surgeries`) VALUES ('3', 'flurbiprofen', 'gallstones', 'general surgery');
INSERT INTO `hospibase`.`Medical History` (`idMedical`, `medications`, `symptoms`, `surgeries`) VALUES ('4', 'Cetuximab', 'blood in throat - throat cancer', 'thoracic surgery');
INSERT INTO `hospibase`.`Medical History` (`idMedical`, `medications`, `symptoms`, `surgeries`) VALUES ('5', 'Cetuximab', 'blood in stool', 'colon');
INSERT INTO `hospibase`.`Medical History` (`idMedical`, `medications`, `symptoms`) VALUES ('6', 'tylenol', 'high fever');
INSERT INTO `hospibase`.`Medical History` (`idMedical`, `symptoms`, `surgeries`) VALUES ('7', 'eyesight vision disorders', 'Ophthalmic');
INSERT INTO `hospibase`.`Medical History` (`idMedical`, `medications`, `symptoms`, `surgeries`) VALUES ('8', 'opiods', 'immobile hands', 'hand');
INSERT INTO `hospibase`.`Medical History` (`idMedical`, `medications`, `symptoms`, `surgeries`) VALUES ('9', 'fentanyl', 'spine degernation', 'spine');
INSERT INTO `hospibase`.`Medical History` (`idMedical`, `medications`, `symptoms`, `surgeries`) VALUES ('10', 'steroids', 'brain tumor', 'neuraloglical');

CREATE TABLE `hospibase`.`Patient` (
  `idPatient` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(50) NULL,
  `lastName` VARCHAR(50) NULL,
  `phoneNumber` VARCHAR(10) NULL,
  `dateOfBirth` DATETIME NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `idPatientDoctor` INT NOT NULL,
  `idPlan` INT NULL,
  `idMedication` INT NULL,
  PRIMARY KEY (`idPatient`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  INDEX `idDoctor_idx` (`idPatientDoctor` ASC) VISIBLE,
  INDEX `idPlan_idx` (`idPlan` ASC) VISIBLE,
  INDEX `idMedication_idx` (`idMedication` ASC) VISIBLE,
  CONSTRAINT `idPatientDoctor`
    FOREIGN KEY (`idPatientDoctor`)
    REFERENCES `hospibase`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPlan`
    FOREIGN KEY (`idPlan`)
    REFERENCES `hospibase`.`Health Plan` (`idPlan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idMedication`
    FOREIGN KEY (`idMedication`)
    REFERENCES `hospibase`.`Medication` (`idMedication`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
ALTER TABLE `hospibase`.`Patient` 
ADD COLUMN `idHistory` INT NULL AFTER `idMedication`,
ADD INDEX `idHistory_idx` (`idHistory` ASC) VISIBLE;

INSERT INTO `hospibase`.`Patient` (`idPatient`, `firstName`, `lastName`, `phoneNumber`, `dateOfBirth`, `username`, `password`, `idPatientDoctor`, `idPlan`, `idMedication`, `idHistory`) VALUES ('1', 'Natalie', 'Kora', '1424462552', '1952-08-01', 'koraNat', 'lsadMO', '1', '1001', '1');
INSERT INTO `hospibase`.`Patient` (`idPatient`, `firstName`, `lastName`, `phoneNumber`, `dateOfBirth`, `username`, `password`, `idPatientDoctor`, `idPlan`, `idMedication`, `idHistory`) VALUES ('2', 'Amy', 'Sanchez', '1804614495', '2001-05-18', 'sanchezbar', 'pRonfo', '1', '1001', '3');
INSERT INTO `hospibase`.`Patient` (`idPatient`, `firstName`, `lastName`, `phoneNumber`, `dateOfBirth`, `username`, `password`, `idPatientDoctor`, `idPlan`, `idMedication`) VALUES ('3', 'Ivy', 'Noel', '1850800737', '1983-06-20', 'ivyleague', 'ArdAHO', '2', '1009', '4');
INSERT INTO `hospibase`.`Patient` (`idPatient`, `firstName`, `lastName`, `phoneNumber`, `dateOfBirth`, `username`, `password`, `idPatientDoctor`, `idPlan`, `idMedication`) VALUES ('4', 'Eli', 'Sanchez', '1304455840', '1984-08-17', 'elijah', 'DvyNfY', '3', '1010', '6');
INSERT INTO `hospibase`.`Patient` (`idPatient`, `firstName`, `lastName`, `phoneNumber`, `dateOfBirth`, `username`, `password`, `idPatientDoctor`, `idPlan`, `idMedication`) VALUES ('5', 'Richard', 'Nelson', '1544519021', '2002-12-13', 'comet', 'aBhpDF', '5', '1007', '9');
INSERT INTO `hospibase`.`Patient` (`idPatient`, `firstName`, `lastName`, `phoneNumber`, `dateOfBirth`, `username`, `password`, `idPatientDoctor`, `idPlan`, `idMedication`) VALUES ('6', 'Freya', 'Kora', '1757715615', '1980-09-30', 'freyja', '#79Tk8', '7', '1004', '7');
INSERT INTO `hospibase`.`Patient` (`idPatient`, `firstName`, `lastName`, `phoneNumber`, `dateOfBirth`, `username`, `password`, `idPatientDoctor`, `idPlan`, `idMedication`) VALUES ('7', 'Mackenzie', 'Campbell', '1412441396', '1999-07-05', 'maccies', 'aV89#2', '8', '1002', '1');
INSERT INTO `hospibase`.`Patient` (`idPatient`, `firstName`, `lastName`, `phoneNumber`, `dateOfBirth`, `username`, `password`, `idPatientDoctor`, `idPlan`, `idMedication`) VALUES ('8', 'Joshua', 'Gonzales', '1505384656', '1990-01-29', 'joshin', 'fT&295', '9', '1005', '1');
INSERT INTO `hospibase`.`Patient` (`idPatient`, `firstName`, `lastName`, `phoneNumber`, `dateOfBirth`, `username`, `password`, `idPatientDoctor`, `idPlan`, `idMedication`) VALUES ('9', 'Alan', 'Nora', '1572369357', '1995-09-05', 'noalan', 'EhouSt', '1', '1007', '7');
INSERT INTO `hospibase`.`Patient` (`idPatient`, `firstName`, `lastName`, `phoneNumber`, `dateOfBirth`, `username`, `password`, `idPatientDoctor`, `idPlan`, `idMedication`) VALUES ('10', 'Nicholas', 'June', '8452755099', '1991-10-16', 'captnick', 'blitNE', '6', '1002', '5');

UPDATE `hospibase`.`Patient` SET `dateOfBirth` = '1952-08-01 01:043:10' WHERE (`idPatient` = '1');
UPDATE `hospibase`.`Patient` SET `dateOfBirth` = '2001-05-18 12:14:09' WHERE (`idPatient` = '2');
UPDATE `hospibase`.`Patient` SET `dateOfBirth` = '1983-06-20 10:04:56' WHERE (`idPatient` = '3');
UPDATE `hospibase`.`Patient` SET `dateOfBirth` = '1984-08-17 11:56:34' WHERE (`idPatient` = '4');
UPDATE `hospibase`.`Patient` SET `dateOfBirth` = '2002-12-13 23:45:00' WHERE (`idPatient` = '5');
UPDATE `hospibase`.`Patient` SET `dateOfBirth` = '1980-09-30 23:59:00' WHERE (`idPatient` = '6');
UPDATE `hospibase`.`Patient` SET `dateOfBirth` = '1999-07-05 12:12:43' WHERE (`idPatient` = '7');
UPDATE `hospibase`.`Patient` SET `dateOfBirth` = '1990-01-29 12:12:12' WHERE (`idPatient` = '8');
UPDATE `hospibase`.`Patient` SET `dateOfBirth` = '1995-09-05 01:23:32' WHERE (`idPatient` = '9');
UPDATE `hospibase`.`Patient` SET `dateOfBirth` = '1991-10-16 03:45:31' WHERE (`idPatient` = '10');

CREATE TABLE `hospibase`.`Appointment` (
  `idAppointment` INT NOT NULL AUTO_INCREMENT,
  `patientName` VARCHAR(80) NULL,
  `appointmentDateTime` DATETIME NULL,
  `idPatient` INT NULL,
  `idAppointmentDoctor` INT NULL,
  PRIMARY KEY (`idAppointment`),
  INDEX `idPatient_idx` (`idPatient` ASC) VISIBLE,
  INDEX `idDoctor_idx` (`idAppointmentDoctor` ASC) VISIBLE,
  CONSTRAINT `idAppointmentDoctor`
    FOREIGN KEY (`idAppointmentDoctor`)
    REFERENCES `hospibase`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPatient`
    FOREIGN KEY (`idPatient`)
    REFERENCES `hospibase`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `hospibase`.`Appointment` (`idAppointment`, `patientName`, `appointmentDateTime`, `idPatient`, `idAppointmentDoctor`) VALUES ('1', 'Natalie Kora', '2022-10-10 12:00:00', '1', '1');
INSERT INTO `hospibase`.`Appointment` (`idAppointment`, `patientName`, `appointmentDateTime`, `idPatient`, `idAppointmentDoctor`) VALUES ('2', 'Amy Sanchez', '2022-10-10 12:30:00', '2', '1');
INSERT INTO `hospibase`.`Appointment` (`idAppointment`, `patientName`, `appointmentDateTime`, `idPatient`, `idAppointmentDoctor`) VALUES ('3', 'Ivy Noel', '2022-10-12 13:15:00', '3', '2');
INSERT INTO `hospibase`.`Appointment` (`idAppointment`, `patientName`, `appointmentDateTime`, `idPatient`, `idAppointmentDoctor`) VALUES ('4', 'Eli Sanchez', '2022-10-14 15:30:00', '4', '3');
INSERT INTO `hospibase`.`Appointment` (`idAppointment`, `patientName`, `appointmentDateTime`, `idPatient`, `idAppointmentDoctor`) VALUES ('5', 'Richard Nelson', '2022-10-14 16:00:00', '5', '5');
INSERT INTO `hospibase`.`Appointment` (`idAppointment`, `patientName`, `appointmentDateTime`, `idPatient`, `idAppointmentDoctor`) VALUES ('6', 'Nicholas June', '2022-10-18 14:45:00', '10', '6');
INSERT INTO `hospibase`.`Appointment` (`idAppointment`, `patientName`, `appointmentDateTime`, `idPatient`, `idAppointmentDoctor`) VALUES ('7', 'Natalie Kora', '2022-10-19 12:00:00', '1', '1');
INSERT INTO `hospibase`.`Appointment` (`idAppointment`, `patientName`, `appointmentDateTime`, `idPatient`, `idAppointmentDoctor`) VALUES ('8', 'Joshua Gonzales', '2022-10-20 15:45:00', '8', '9');
INSERT INTO `hospibase`.`Appointment` (`idAppointment`, `patientName`, `appointmentDateTime`, `idPatient`, `idAppointmentDoctor`) VALUES ('9', 'Freya Kora', '2022-10-24 16:30:00', '6', '7');
INSERT INTO `hospibase`.`Appointment` (`idAppointment`, `patientName`, `appointmentDateTime`, `idPatient`, `idAppointmentDoctor`) VALUES ('10', 'Alan Nora', '2022-10-31 13:45:00', '9', '1');
