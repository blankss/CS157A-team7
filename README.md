# CS157A-team7
## Code Review 1: Login and registration barebones complete. Search in progress. Temporarily created most of tables needed for project.
## Code Review 2: Appointment complete, search complete, update patients information complete. Doctors update in progress, filter in progress, and patient bill in progress. Tables/schema DDL statements reflect our ERD.

Image References:

https://www.pexels.com/photo/medical-stethoscope-with-red-paper-heart-on-white-surface-4386467/

https://www.logolynx.com/topic/red+cross#&gid=1&pid=2

https://www.cleanpng.com/png-lean-manufacturing-industry-microsoft-dynamics-365-6345668/

https://www.kindpng.com/imgv/ixmTxRo_registration-logo-hd-png-download/

https://www.pexels.com/photo/person-holding-white-printer-paper-4226138/

http://clipart-library.com/clipart/Doctor-Symbol-Caduceus-PNG-Picture.htm

https://www.pexels.com/photo/set-of-white-pills-on-yellow-background-4210661/

https://www.pexels.com/photo/syringe-and-pills-on-blue-background-3786159/

https://www.pexels.com/photo/face-mask-on-blue-background-3786153/

https://www.pexels.com/photo/grayscale-photo-of-an-empty-hallway-6234634/

https://www.pexels.com/photo/heart-rate-monitor-3845129/

https://www.pexels.com/photo/person-holding-syringe-3786215/

https://www.pexels.com/photo/person-in-white-dress-shirt-writing-on-white-paper-7578802/



CREATE SCHEMA hospibase ;

CREATE TABLE hospibase.Doctor ( idDoctor INT NOT NULL AUTO_INCREMENT, firstName VARCHAR(50) NULL, lastName VARCHAR(50) NULL, specialization VARCHAR(60) NULL, username VARCHAR(45) NULL, password VARCHAR(45) NULL, PRIMARY KEY (idDoctor), UNIQUE INDEX username_UNIQUE (username ASC) VISIBLE);

INSERT INTO hospibase.Doctor (idDoctor, firstName, lastName, specialization, username, password) VALUES ('1', 'Lily', 'Scott', 'Dermatology', 'lilys', 'GzeGjx'); 
INSERT INTO hospibase.Doctor (idDoctor, firstName, lastName, specialization, username, password) VALUES ('2', 'Katherine', 'Elsher', 'Neurology', 'katherineE', 'DqwxaM'); 
INSERT INTO hospibase.Doctor (idDoctor, firstName, lastName, specialization, username, password) VALUES ('3', 'Lincoln', 'McKenna', 'Pediatrics', 'lincolnpark', 'Pliigr'); 
INSERT INTO hospibase.Doctor (idDoctor, firstName, lastName, specialization, username, password) VALUES ('4', 'Trinity', 'Cullen', 'Pediatrics', 'trinitylock', 'cullen1!'); 
INSERT INTO hospibase.Doctor (idDoctor, firstName, lastName, specialization, username, password) VALUES ('5', 'Alayna', 'Anderson', 'Immunology', 'alaynaology', '8OD1kS'); 
INSERT INTO hospibase.Doctor (idDoctor, firstName, lastName, specialization, username, password) VALUES ('6', 'Harrison', 'Nora', 'Internal Medicine', 'norasmoke', '0iLtZe'); 
INSERT INTO hospibase.Doctor (idDoctor, firstName, lastName, specialization, username, password) VALUES ('7', 'Melanie', 'Melenia', 'Internal Medicine', 'malenia', '#shattering'); 
INSERT INTO hospibase.Doctor (idDoctor, firstName, lastName, specialization, username, password) VALUES ('8', 'Chase', 'Solace', 'Urologist', 'solstice', 'winter4!@'); 
INSERT INTO hospibase.Doctor (idDoctor, firstName, lastName, specialization, username, password) VALUES ('9', 'Ian', 'June', 'Pathology', 'ijuly', 'SoaGSk'); 
INSERT INTO hospibase.Doctor (idDoctor, firstName, lastName, specialization, username, password) VALUES ('10', 'Tristan', 'Clark', 'Heart surgeon', 'clarkent', 'superman6');

CREATE TABLE hospibase.``Health Plan(idPlan` INT NOT NULL, `planName` VARCHAR(45) NULL, `planCost` DECIMAL(7,2) NULL, PRIMARY KEY (`idPlan`), UNIQUE INDEX `planName_UNIQUE` (`planName` ASC) VISIBLE);

INSERT INTO hospibase.Health Plan (idPlan, planName, planCost) VALUES ('1001', 'Kaiser', '400.50'); INSERT INTO hospibase.Health Plan (idPlan, planName, planCost) VALUES ('1002', 'Blue Shield', '601.53'); INSERT INTO hospibase.Health Plan (idPlan, planName, planCost) VALUES ('1003', 'Amerigroup', '396.78'); INSERT INTO hospibase.Health Plan (idPlan, planName, planCost) VALUES ('1004', 'Cigna', '485.00'); INSERT INTO hospibase.Health Plan (idPlan, planName, planCost) VALUES ('1005', 'Health Net', '413.54'); INSERT INTO hospibase.Health Plan (idPlan, planName, planCost) VALUES ('1006', 'Medi-Cal', '487.57'); INSERT INTO hospibase.Health Plan (idPlan, planName, planCost) VALUES ('1007', 'Sutter Health', '418.44'); INSERT INTO hospibase.Health Plan (idPlan, planName, planCost) VALUES ('1008', 'Humana', '644.15'); INSERT INTO hospibase.Health Plan (idPlan, planName, planCost) VALUES ('1009', 'Molina', '352.45'); INSERT INTO hospibase.Health Plan (idPlan, planName, planCost) VALUES ('1010', 'Aetna', '256.2');

CREATE TABLE hospibase.Medical History ( idHistory INT NOT NULL AUTO_INCREMENT, medications VARCHAR(100) NULL, symptoms VARCHAR(100) NULL, surgeries VARCHAR(100) NULL, PRIMARY KEY (idMedical));

INSERT INTO hospibase.Medical History (idMedical, medications, symptoms) VALUES ('1', 'Advil', 'Headache'); INSERT INTO hospibase.Medical History (idMedical, medications, symptoms, surgeries) VALUES ('2', 'antibiotics', 'abdominal pains', 'general surgery'); INSERT INTO hospibase.Medical History (idMedical, medications, symptoms, surgeries) VALUES ('3', 'flurbiprofen', 'gallstones', 'general surgery'); INSERT INTO hospibase.Medical History (idMedical, medications, symptoms, surgeries) VALUES ('4', 'Cetuximab', 'blood in throat - throat cancer', 'thoracic surgery'); INSERT INTO hospibase.Medical History (idMedical, medications, symptoms, surgeries) VALUES ('5', 'Cetuximab', 'blood in stool', 'colon'); INSERT INTO hospibase.Medical History (idMedical, medications, symptoms) VALUES ('6', 'tylenol', 'high fever'); INSERT INTO hospibase.Medical History (idMedical, symptoms, surgeries) VALUES ('7', 'eyesight vision disorders', 'Ophthalmic'); INSERT INTO hospibase.Medical History (idMedical, medications, symptoms, surgeries) VALUES ('8', 'opiods', 'immobile hands', 'hand'); INSERT INTO hospibase.Medical History (idMedical, medications, symptoms, surgeries) VALUES ('9', 'fentanyl', 'spine degernation', 'spine'); INSERT INTO hospibase.Medical History (idMedical, medications, symptoms, surgeries) VALUES ('10', 'steroids', 'brain tumor', 'neuraloglical');

CREATE TABLE hospibase.Patient ( idPatient INT NOT NULL AUTO_INCREMENT, firstName VARCHAR(50) NULL, lastName VARCHAR(50) NULL, phoneNumber VARCHAR(10) NULL, dateOfBirth DATETIME NULL, username VARCHAR(45) NULL, password VARCHAR(45) NULL, idPatientDoctor INT NOT NULL, idPlan INT NULL, idMedication INT NULL, PRIMARY KEY (idPatient), UNIQUE INDEX username_UNIQUE (username ASC) VISIBLE, INDEX idDoctor_idx (idPatientDoctor ASC) VISIBLE, INDEX idPlan_idx (idPlan ASC) VISIBLE, INDEX idMedication_idx (idMedication ASC) VISIBLE, CONSTRAINT idPatientDoctor FOREIGN KEY (idPatientDoctor) REFERENCES hospibase.Doctor (idDoctor) ON DELETE NO ACTION ON UPDATE NO ACTION, CONSTRAINT idPlan FOREIGN KEY (idPlan) REFERENCES hospibase.Health Plan (idPlan) ON DELETE NO ACTION ON UPDATE NO ACTION, CONSTRAINT idMedication FOREIGN KEY (idMedication) REFERENCES hospibase.Medication (idMedication) ON DELETE NO ACTION ON UPDATE NO ACTION); ALTER TABLE hospibase.Patient ADD COLUMN idHistory INT NULL AFTER idMedication, ADD INDEX idHistory_idx (idHistory ASC) VISIBLE;

INSERT INTO hospibase.Patient (idPatient, firstName, lastName, phoneNumber, dateOfBirth, username, password, idPatientDoctor, idPlan, idMedication, idHistory) VALUES ('1', 'Natalie', 'Kora', '1424462552', '1952-08-01', 'koraNat', 'lsadMO', '1', '1001', '1'); INSERT INTO hospibase.Patient (idPatient, firstName, lastName, phoneNumber, dateOfBirth, username, password, idPatientDoctor, idPlan, idMedication, idHistory) VALUES ('2', 'Amy', 'Sanchez', '1804614495', '2001-05-18', 'sanchezbar', 'pRonfo', '1', '1001', '3'); INSERT INTO hospibase.Patient (idPatient, firstName, lastName, phoneNumber, dateOfBirth, username, password, idPatientDoctor, idPlan, idMedication) VALUES ('3', 'Ivy', 'Noel', '1850800737', '1983-06-20', 'ivyleague', 'ArdAHO', '2', '1009', '4'); INSERT INTO hospibase.Patient (idPatient, firstName, lastName, phoneNumber, dateOfBirth, username, password, idPatientDoctor, idPlan, idMedication) VALUES ('4', 'Eli', 'Sanchez', '1304455840', '1984-08-17', 'elijah', 'DvyNfY', '3', '1010', '6'); INSERT INTO hospibase.Patient (idPatient, firstName, lastName, phoneNumber, dateOfBirth, username, password, idPatientDoctor, idPlan, idMedication) VALUES ('5', 'Richard', 'Nelson', '1544519021', '2002-12-13', 'comet', 'aBhpDF', '5', '1007', '9'); INSERT INTO hospibase.Patient (idPatient, firstName, lastName, phoneNumber, dateOfBirth, username, password, idPatientDoctor, idPlan, idMedication) VALUES ('6', 'Freya', 'Kora', '1757715615', '1980-09-30', 'freyja', '#79Tk8', '7', '1004', '7'); INSERT INTO hospibase.Patient (idPatient, firstName, lastName, phoneNumber, dateOfBirth, username, password, idPatientDoctor, idPlan, idMedication) VALUES ('7', 'Mackenzie', 'Campbell', '1412441396', '1999-07-05', 'maccies', 'aV89#2', '8', '1002', '1'); INSERT INTO hospibase.Patient (idPatient, firstName, lastName, phoneNumber, dateOfBirth, username, password, idPatientDoctor, idPlan, idMedication) VALUES ('8', 'Joshua', 'Gonzales', '1505384656', '1990-01-29', 'joshin', 'fT&295', '9', '1005', '1'); INSERT INTO hospibase.Patient (idPatient, firstName, lastName, phoneNumber, dateOfBirth, username, password, idPatientDoctor, idPlan, idMedication) VALUES ('9', 'Alan', 'Nora', '1572369357', '1995-09-05', 'noalan', 'EhouSt', '1', '1007', '7'); INSERT INTO hospibase.Patient (idPatient, firstName, lastName, phoneNumber, dateOfBirth, username, password, idPatientDoctor, idPlan, idMedication) VALUES ('10', 'Nicholas', 'June', '8452755099', '1991-10-16', 'captnick', 'blitNE', '6', '1002', '5');

UPDATE hospibase.Patient SET dateOfBirth = '1952-08-01 01:043:10' WHERE (idPatient = '1'); UPDATE hospibase.Patient SET dateOfBirth = '2001-05-18 12:14:09' WHERE (idPatient = '2'); UPDATE hospibase.Patient SET dateOfBirth = '1983-06-20 10:04:56' WHERE (idPatient = '3'); UPDATE hospibase.Patient SET dateOfBirth = '1984-08-17 11:56:34' WHERE (idPatient = '4'); UPDATE hospibase.Patient SET dateOfBirth = '2002-12-13 23:45:00' WHERE (idPatient = '5'); UPDATE hospibase.Patient SET dateOfBirth = '1980-09-30 23:59:00' WHERE (idPatient = '6'); UPDATE hospibase.Patient SET dateOfBirth = '1999-07-05 12:12:43' WHERE (idPatient = '7'); UPDATE hospibase.Patient SET dateOfBirth = '1990-01-29 12:12:12' WHERE (idPatient = '8'); UPDATE hospibase.Patient SET dateOfBirth = '1995-09-05 01:23:32' WHERE (idPatient = '9'); UPDATE hospibase.Patient SET dateOfBirth = '1991-10-16 03:45:31' WHERE (idPatient = '10');

CREATE TABLE hospibase.Appointment ( idAppointment INT NOT NULL AUTO_INCREMENT, patientName VARCHAR(80) NULL, appointmentDateTime DATETIME NULL, idPatient INT NULL, idAppointmentDoctor INT NULL, PRIMARY KEY (idAppointment), INDEX idPatient_idx (idPatient ASC) VISIBLE, INDEX idDoctor_idx (idAppointmentDoctor ASC) VISIBLE, CONSTRAINT idAppointmentDoctor FOREIGN KEY (idAppointmentDoctor) REFERENCES hospibase.Doctor (idDoctor) ON DELETE NO ACTION ON UPDATE NO ACTION, CONSTRAINT idPatient FOREIGN KEY (idPatient) REFERENCES hospibase.Patient (idPatient) ON DELETE NO ACTION ON UPDATE NO ACTION);

INSERT INTO hospibase.Appointment (idAppointment, patientName, appointmentDateTime, idPatient, idAppointmentDoctor) VALUES ('1', 'Natalie Kora', '2022-10-10 12:00:00', '1', '1'); INSERT INTO hospibase.Appointment (idAppointment, patientName, appointmentDateTime, idPatient, idAppointmentDoctor) VALUES ('2', 'Amy Sanchez', '2022-10-10 12:30:00', '2', '1'); INSERT INTO hospibase.Appointment (idAppointment, patientName, appointmentDateTime, idPatient, idAppointmentDoctor) VALUES ('3', 'Ivy Noel', '2022-10-12 13:15:00', '3', '2'); INSERT INTO hospibase.Appointment (idAppointment, patientName, appointmentDateTime, idPatient, idAppointmentDoctor) VALUES ('4', 'Eli Sanchez', '2022-10-14 15:30:00', '4', '3'); INSERT INTO hospibase.Appointment (idAppointment, patientName, appointmentDateTime, idPatient, idAppointmentDoctor) VALUES ('5', 'Richard Nelson', '2022-10-14 16:00:00', '5', '5'); INSERT INTO hospibase.Appointment (idAppointment, patientName, appointmentDateTime, idPatient, idAppointmentDoctor) VALUES ('6', 'Nicholas June', '2022-10-18 14:45:00', '10', '6'); INSERT INTO hospibase.Appointment (idAppointment, patientName, appointmentDateTime, idPatient, idAppointmentDoctor) VALUES ('7', 'Natalie Kora', '2022-10-19 12:00:00', '1', '1'); INSERT INTO hospibase.Appointment (idAppointment, patientName, appointmentDateTime, idPatient, idAppointmentDoctor) VALUES ('8', 'Joshua Gonzales', '2022-10-20 15:45:00', '8', '9'); INSERT INTO hospibase.Appointment (idAppointment, patientName, appointmentDateTime, idPatient, idAppointmentDoctor) VALUES ('9', 'Freya Kora', '2022-10-24 16:30:00', '6', '7'); INSERT INTO hospibase.Appointment (idAppointment, patientName, appointmentDateTime, idPatient, idAppointmentDoctor) VALUES ('10', 'Alan Nora', '2022-10-31 13:45:00', '9', '1');

CREATE TABLE `hospibase`.`medication` (
  `idmedication` int NOT NULL,
  `medicationCost` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `manufacturer` varchar(45) DEFAULT NULL,
  `idDoctor` int DEFAULT NULL,
  `idPatient` int DEFAULT NULL,
  PRIMARY KEY (`idmedication`),
  UNIQUE KEY `medicine_UNIQUE` (`idmedication`),
  KEY `idDoctor_idx` (`idDoctor`),
  KEY `idPatient_idx` (`idPatient`),
  CONSTRAINT `idDoctor` FOREIGN KEY (`idDoctor`) REFERENCES `doctors` (`idDoctor`)
);

INSERT INTO `hospibase`.`medication` (`idmedication`, `medicationCost`, `quantity`, `manufacturer`, `idDoctor`, `idPatient`) VALUES (1,40,140,'Duramed',2,1);
INSERT INTO `hospibase`.`medication` (`idmedication`, `medicationCost`, `quantity`, `manufacturer`, `idDoctor`, `idPatient`) VALUES (2,10,300,'Wyeth Pharmaceuticals',3,2);
INSERT INTO `hospibase`.`medication` (`idmedication`, `medicationCost`, `quantity`, `manufacturer`, `idDoctor`, `idPatient`) VALUES (3,75,200,'Nono Nordisk',7,3);
INSERT INTO `hospibase`.`medication` (`idmedication`, `medicationCost`, `quantity`, `manufacturer`, `idDoctor`, `idPatient`) VALUES (4,400,300,'PurduePharma',3,4);
INSERT INTO `hospibase`.`medication` (`idmedication`, `medicationCost`, `quantity`, `manufacturer`, `idDoctor`, `idPatient`) VALUES (5,130,350,'Abbott',1,5);
INSERT INTO `hospibase`.`medication` (`idmedication`, `medicationCost`, `quantity`, `manufacturer`, `idDoctor`, `idPatient`) VALUES (6,125,190,'Viatris Specialty',7,6);
INSERT INTO `hospibase`.`medication` (`idmedication`, `medicationCost`, `quantity`, `manufacturer`, `idDoctor`, `idPatient`) VALUES (7,65,50,'Abbvie',1,7);
INSERT INTO `hospibase`.`medication` (`idmedication`, `medicationCost`, `quantity`, `manufacturer`, `idDoctor`, `idPatient`) VALUES (8,400,90,'Viatris Specialty',7,8);
INSERT INTO `hospibase`.`medication` (`idmedication`, `medicationCost`, `quantity`, `manufacturer`, `idDoctor`, `idPatient`) VALUES (9,105000,40,'Porton Biopharm Limited',3,9);
INSERT INTO `hospibase`.`medication` (`idmedication`, `medicationCost`, `quantity`, `manufacturer`, `idDoctor`, `idPatient`) VALUES (10,23,230,'Camber Pharma',5,10);

CREATE TABLE `hospitaladministrators` (
  `idAdmin` int NOT NULL AUTO_INCREMENT,
  `adminName` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAdmin`),
  UNIQUE KEY `idAdmin_UNIQUE` (`idAdmin`)
); 

INSERT INTO `hospitaladministrators` VALUES (1,'Megan','mesmith01','r@!nydaze112');
INSERT INTO `hospitaladministrators` VALUES (2,'Travis','trlee48','n0tn(_)1l');
INSERT INTO `hospitaladministrators` VALUES (3,'Natalia','narios21','34p!edra');
INSERT INTO `hospitaladministrators` VALUES (4,'Steven','ststevens01','m0stgo@ts!');
INSERT INTO `hospitaladministrators` VALUES (5,'Kelvin','keburns68','53degree$');
INSERT INTO `hospitaladministrators` VALUES (6,'Juan','juhill91','mh@v3is');
INSERT INTO `hospitaladministrators` VALUES (7,'Noor','noisa29','aren@5h07');
INSERT INTO `hospitaladministrators` VALUES (8,'Hope','howilliams42','sit30ft3ar5');
INSERT INTO `hospitaladministrators` VALUES (9,'Esteban','esuribe56','aalmp#72');
INSERT INTO `hospitaladministrators` VALUES (10,'Drake','drpato57','3/@ding');
INSERT INTO `hospitaladministrators` VALUES (11,'Lily','lilys','GzeGjx');
INSERT INTO `hospitaladministrators` VALUES (12,'Katherine','katherineE','DqwxaM');
INSERT INTO `hospitaladministrators` VALUES (13,'Lincoln','lincolnpark','Pliigr');
INSERT INTO `hospitaladministrators` VALUES (14,'Trinity','trinitylock','cullen1!');
INSERT INTO `hospitaladministrators` VALUES (15,'Alayna','alaynaology','8OD1kS');
INSERT INTO `hospitaladministrators` VALUES (16,'Harrison','norasmoke','0iLtZe');
INSERT INTO `hospitaladministrators` VALUES (17,'Melanie','malenia','#shattering');
INSERT INTO `hospitaladministrators` VALUES (18,'Chase','solstice','winter4!@');
INSERT INTO `hospitaladministrators` VALUES (19,'Ian','ijuly','SoaGSk');
INSERT INTO `hospitaladministrators` VALUES (20,'Tristan','clarkent','superman6');

ALTER TABLE `hospibase`.`hospitaladministrators` 
ADD COLUMN `loggedin` TINYINT NOT NULL AFTER `password`;

CREATE TABLE `hospibase`.`patientbill` (
  `idbill` int NOT NULL,
  `medicationcost` int DEFAULT NULL,
  `roomcost` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `idpatient` int DEFAULT NULL,
  PRIMARY KEY (`idbill`),
  UNIQUE KEY `idbill_UNIQUE` (`idbill`),
  KEY `idpatients_idx` (`idpatient`)
);

INSERT INTO `hospibase`.`patientbill` (`idbill`, `medicationcost`, `roomcost`, `total`, `idpatient`) VALUES (1,0,0,0,1);
INSERT INTO `hospibase`.`patientbill` (`idbill`, `medicationcost`, `roomcost`, `total`, `idpatient`) VALUES (2,98,350,448,2);
INSERT INTO `hospibase`.`patientbill` (`idbill`, `medicationcost`, `roomcost`, `total`, `idpatient`) VALUES (3,500,3200,3700,3);
INSERT INTO `hospibase`.`patientbill` (`idbill`, `medicationcost`, `roomcost`, `total`, `idpatient`) VALUES (4,350,5032,5382,9);
INSERT INTO `hospibase`.`patientbill` (`idbill`, `medicationcost`, `roomcost`, `total`, `idpatient`) VALUES (5,334,0,334,2);
INSERT INTO `hospibase`.`patientbill` (`idbill`, `medicationcost`, `roomcost`, `total`, `idpatient`) VALUES (6,776,6090,6866,10);
INSERT INTO `hospibase`.`patientbill` (`idbill`, `medicationcost`, `roomcost`, `total`, `idpatient`) VALUES (7,2349,1500,3849,7);
INSERT INTO `hospibase`.`patientbill` (`idbill`, `medicationcost`, `roomcost`, `total`, `idpatient`) VALUES (8,2000,120000,122000,3);
INSERT INTO `hospibase`.`patientbill` (`idbill`, `medicationcost`, `roomcost`, `total`, `idpatient`) VALUES (9,124,0,124,2);
INSERT INTO `hospibase`.`patientbill` (`idbill`, `medicationcost`, `roomcost`, `total`, `idpatient`) VALUES (10,477,13700,14177,1);

CREATE TABLE `hospibase`.`hasa` (
  `idPatient` int NOT NULL,
  `idHistory` int NOT NULL,
  PRIMARY KEY (`idPatient`,`idHistory`),
  KEY `idHistory_idx` (`idHistory`),
  CONSTRAINT `idHistory` FOREIGN KEY (`idHistory`) REFERENCES `medicalhistory` (`idhistory`),
  CONSTRAINT `idPatient` FOREIGN KEY (`idPatient`) REFERENCES `patients` (`idPatient`)
);

INSERT INTO `hospibase`.`hasa` (`idPatient`, `idHistory`) VALUES (1,1);
INSERT INTO `hospibase`.`hasa` (`idPatient`, `idHistory`) VALUES (2,2);
INSERT INTO `hospibase`.`hasa` (`idPatient`, `idHistory`) VALUES (3,3);
INSERT INTO `hospibase`.`hasa` (`idPatient`, `idHistory`) VALUES (4,4);
INSERT INTO `hospibase`.`hasa` (`idPatient`, `idHistory`) VALUES (5,5);
INSERT INTO `hospibase`.`hasa` (`idPatient`, `idHistory`) VALUES (6,6);
INSERT INTO `hospibase`.`hasa` (`idPatient`, `idHistory`) VALUES (7,7);
INSERT INTO `hospibase`.`hasa` (`idPatient`, `idHistory`) VALUES (8,8);
INSERT INTO `hospibase`.`hasa` (`idPatient`, `idHistory`) VALUES (9,9);
INSERT INTO `hospibase`.`hasa` (`idPatient`, `idHistory`) VALUES (10,10);

CREATE TABLE `hospibase`.`Equipment` (
  `idequipment` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `equipCondition` varchar(45) DEFAULT NULL,
  `idAdmin` int DEFAULT NULL,
  PRIMARY KEY (`idequipment`),
  UNIQUE KEY `idequipment_UNIQUE` (`idequipment`),
  KEY `idAdmin_idx` (`idAdmin`),
  CONSTRAINT `idAdmin` FOREIGN KEY (`idAdmin`) REFERENCES `hospitaladministrators` (`idAdmin`)
);

INSERT INTO `hospibase`.`Equipment` VALUES (1,11,'working',1),
(2,10,'new',2),
(3,15,'new',2),
(4,21,'working',4),
(5,9,'new',5),
(6,20,'new',6),
(7,14,'needs repairs',7),
(8,88,'working',8),
(9,3,'needs repair',9),
(10,50,'broken',10);

CREATE TABLE `hospibase`.`HospitalRooms` (
  `roomNumber` int NOT NULL AUTO_INCREMENT,
  `roomCost` int DEFAULT NULL,
  `roomCondition` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roomNumber`),
  UNIQUE KEY `roomNumber_UNIQUE` (`roomNumber`)
);

INSERT INTO `hospibase`.`HospitalRooms` VALUES (1,50,'clean'),
(2,50,'dirty'),
(3,50,'clean'),
(4,50,'needs repairs'),
(5,50,'needs repairs'),
(6,50,'dirty'),
(7,50,'needs repairs'),
(8,50,'needs repairs'),
(9,50,'clean'),
(10,50,'clean');
