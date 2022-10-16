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

  ### Dummy data for patients 
INSERT INTO `hospibase`.`Patients` (`idPatients`, `firstName`, `lastName`, `medicalHistory`, `prescriptions`, `doctorID`, `insurance`, `hospitalFee`) VALUES ('1', 'Bob', 'Bobby', 'Headache', 'OTC advil', '1', 'Blue Shield', '5.00');

INSERT INTO `hospibase`.`Patients` (`idPatients`, `firstName`, `lastName`, `medicalHistory`, `prescriptions`, `doctorID`, `insurance`, `hospitalFee`) VALUES ('2', 'John', 'Smith', 'Diabetes', 'insulin', '2', 'Covered California', '35.78');

INSERT INTO `hospibase`.`Patients` (`idPatients`, `firstName`, `lastName`, `medicalHistory`, `prescriptions`, `doctorID`, `roomNumber`, `insurance`, `hospitalFee`) VALUES ('3', 'John', 'Doe', 'Cancer', 'Bleomycin', '1', '1', 'Blue Shield', '1000');

INSERT INTO `hospibase`.`Patients` (`idPatients`, `firstName`, `lastName`, `medicalHistory`, `prescriptions`, `doctorID`, `roomNumber`, `hospitalFee`) VALUES ('4', 'Sarah', 'Tri', 'Heart palpitations', 'Beta-blockers', '3', '2', '78.5');

INSERT INTO `hospibase`.`Patients` (`idPatients`, `firstName`, `lastName`, `medicalHistory`, `prescriptions`, `doctorID`, `roomNumber`, `insurance`, `hospitalFee`) VALUES ('5', 'Johnny', 'S.', 'Lung cancer', 'Afinitor', '2', '1', 'Blue Shield', '800.50');
