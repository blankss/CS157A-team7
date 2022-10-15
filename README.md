# CS157A-team7

## Create needed schema and tables using the following MySQL DDL statements

CREATE SCHEMA `hospibase` ;

CREATE TABLE `hospibase`.`Patients` (
  `idPatients` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `medicalHistory` VARCHAR(500) NULL,
  `prescriptions` VARCHAR(50) NULL,
  `doctorID` VARCHAR(45) NOT NULL,
  `roomNumber` INT NULL,
  `insurance` VARCHAR(45) NULL,
  `hospitalFee` DECIMAL(10,2) NULL,
  PRIMARY KEY (`idPatients`));