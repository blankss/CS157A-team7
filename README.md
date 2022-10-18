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

CREATE TABLE `hospibase`.`MedicalHistory` (
  `patient_id` INT NOT NULL,
  `allergies` VARCHAR(45) NULL,
  `surgeries` VARCHAR(45) NULL,
  `family_history` VARCHAR(45) NULL,
  `medications` VARCHAR(45) NULL,
  `illnesses` VARCHAR(45) NULL,
  PRIMARY KEY (`patient_id`));

CREATE TABLE `hospibase`.`HospitalFinance` (
`transaction` INT NOT NULL,
`patient_id` INT NULL,
`patient_income` DECIMAL(65,2) NULL,
`equipment_id` INT NULL,
`equipment_expenditure` DECIMAL(65,2) NULL,
`maintenance_expenditure` DECIMAL(65,2) NULL,
`staff_expenditure` DECIMAL(65,2) NULL,
`government_income` DECIMAL(65,2) NULL,
`balance` DECIMAL(65,2) NULL,
PRIMARY KEY (`transaction`));

CREATE TABLE `hospibase`.`Healthplans` (
  `patient_id` INT NOT NULL,
  `insurance` VARCHAR(45) NULL,
  `deductible` DECIMAL(65,2) NULL,
  `allowable cost` DECIMAL(65,2) NULL,
  PRIMARY KEY (`patient_id`));

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

### Dummy data for MedicalHistory
INSERT INTO hospibase.MedicalHistory 
(patient_id, allergies, surgeries, family_history, medications, illnesses)
VALUES ('1', 'pollen', 'kneecap surgery', 'diabetes', 'OTC advil', NULl);

INSERT INTO hospibase.MedicalHistory 
(patient_id, allergies, surgeries, family_history, medications, illnesses)
VALUES ('2', 'bee venom', NULL, 'baldness', 'Amlodipine', 'fevers every winter');

INSERT INTO hospibase.MedicalHistory 
(patient_id, allergies, surgeries, family_history, medications, illnesses)
VALUES ('3', NULL, 'wrist surgery', 'cancer', 'cancer', NULl);

INSERT INTO hospibase.MedicalHistory 
(patient_id, allergies, surgeries, family_history, medications, illnesses)
VALUES ('4', 'stroke', 'eye surgery', 'stroke', 'atorvastatin', 'cholera');

INSERT INTO hospibase.MedicalHistory 
(patient_id, allergies, surgeries, family_history, medications, illnesses)
VALUES (‘5’, NULL, NULL, NULL, NULL, NULL);

### Dummy data for Hospital Finance
INSERT INTO `hospibase`.`HospitalFinance`
(`transaction`,`patient_id`,`patient_income`,`equipment_id`,`equipment_expenditure`,`maintenance_expenditure`,`staff_expenditure`,
`government_income`,`balance`)
VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, 8100000.67, 0);

INSERT INTO `hospibase`.`HospitalFinance`
(`transaction`,`patient_id`,`patient_income`,`equipment_id`,`equipment_expenditure`,`maintenance_expenditure`,`staff_expenditure`,
`government_income`,`balance`)
VALUES
(2, NULL, NULL, NULL, 1, 16528.54, NULL, NULL, 8100000.67);

INSERT INTO `hospibase`.`HospitalFinance`
(`transaction`,`patient_id`,`patient_income`,`equipment_id`,`equipment_expenditure`,`maintenance_expenditure`,`staff_expenditure`,
`government_income`,`balance`)
VALUES
(3, NULL, 2, 803.53, NULL, NULL, 203.21, NULL, 8100000.67);

### Dummy date for Healthplans

INSERT INTO `hospibase`.`Healthplans`
(`patient_id`,`insurance`,`deductible`,`allowable cost`)
VALUES (1,"Blue Shield",20,200);

INSERT INTO `hospibase`.`Healthplans`
(`patient_id`,`insurance`,`deductible`,`allowable cost`)
VALUES (2,"Covered California",50,800);

INSERT INTO `hospibase`.`Healthplans`
(`patient_id`,`insurance`,`deductible`,`allowable cost`)
VALUES (3,"Blue Shield",90,400);

INSERT INTO `hospibase`.`Healthplans`
(`patient_id`,`insurance`,`deductible`,`allowable cost`)
VALUES (5,"Blue Shield",30,250);