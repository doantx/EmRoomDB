DROP SCHEMA emergencyRoomDB;
CREATE SCHEMA emergencyRoomDB;
USE emergencyRoomDB;

CREATE TABLE Person (
	persID varchar(6) PRIMARY KEY,
    persName varchar(20) NOT NULL
);

CREATE TABLE PersonPhone (
	persID varchar(6),
    phone varchar(12) not null,
    constraint PersonPhone_persID_fk FOREIGN KEY (persID) references Person(persID)
);

CREATE TABLE Patient (
	pID varchar(6) PRIMARY KEY,
    persID varchar(6),
    
    constraint Patient_persID_fk FOREIGN KEY (persID) references Person(persID)
);

CREATE TABLE Worker (
	wID varchar(6) PRIMARY KEY,
    persID varchar(6),
    wType varchar(6) NOT NULL,
    
    constraint Worker_persID_fk FOREIGN KEY (persID) references Person(persID),
    constraint Worker_wType_TC CHECK (wType = 'doctor' OR wType = 'nurse')
);

CREATE TABLE Doctor (
	dID varchar(6) PRIMARY KEY,
    wID varchar(6),
    
    constraint Doctor_wID_fk FOREIGN KEY (wID) references Worker(wID)
);

CREATE TABLE Medication (
	mID varchar(6) PRIMARY KEY,
    medName varchar(20)
);

CREATE TABLE Nurse (
	nID varchar(6) PRIMARY KEY,
    wID varchar(6),
    
    constraint Nurse_wID_fk FOREIGN KEY (wID) references Worker(wID)
);

CREATE TABLE Shift (
	sID varchar(6) PRIMARY KEY,
    sDate date,
    startTime varchar(4),
    endTime varchar(4)
);

CREATE TABLE prescription (
	pID varchar(6),
    dID varchar(6),
    mID varchar(6),
    pDate date,
    dosage varchar(15),
    docType varchar(6),
    
    constraint Prescr_pID_fk FOREIGN KEY (pID) references Patient(pID),
    constraint Prescr_dID_fk FOREIGN KEY (dID) references Doctor(dID),
    constraint Prescr_mID_fk FOREIGN KEY (mID) references Medication(mID)
);

CREATE TABLE worksIn (
	wID varchar(6),
    sID varchar(6),
    
    constraint worksIn_wID_fk FOREIGN KEY (wID) references Worker(wID),
    constraint worksIn_sID_fk FOREIGN KEY (sID) references Shift(sID)
);

CREATE TABLE visits (
	pID varchar(6),
    sID varchar(6),
    result varchar(30),
    
     constraint visits_pID_fk FOREIGN KEY (pID) references Patient(pID),
     constraint visits_sID_fk FOREIGN KEY (sID) references Shift(sID),
     constraint visits_result CHECK (result = 'sent home' OR result = 'admitted' or result = 'sent home with medication')
);

-- Person
insert into Person (persID, persName) values ('PE1001', 'Dione Royce');
insert into Person (persID, persName) values ('PE1002', 'Chuck Rainford');
insert into Person (persID, persName) values ('PE1003', 'Neil Beadle');
insert into Person (persID, persName) values ('PE1004', 'Gregorius Woodburne');
insert into Person (persID, persName) values ('PE1005', 'Taddeo Posselow');
insert into Person (persID, persName) values ('PE1006', 'Gregory House');
insert into Person (persID, persName) values ('PE1007', 'Wandis Harbin');
insert into Person (persID, persName) values ('PE1008', 'Kelley Akred');
insert into Person (persID, persName) values ('PE1009', 'Charmion McKeighen');
insert into Person (persID, persName) values ('PE1010', 'Van Brookhouse');
insert into Person (persID, persName) values ('PE1011', 'Emory Kegg');
insert into Person (persID, persName) values ('PE1012', 'Yule Lambarton');
insert into Person (persID, persName) values ('PE1013', 'Melinde Caldecott');
insert into Person (persID, persName) values ('PE1014', 'Harwilll Dalloway');
insert into Person (persID, persName) values ('PE1015', 'Reiko Sandeman');

insert into Person (persID, persName) values ('PE1016', 'Nelle Castelot');
insert into Person (persID, persName) values ('PE1017', 'Bennett Fyndon');
insert into Person (persID, persName) values ('PE1018', 'Kirsten De Brett');
insert into Person (persID, persName) values ('PE1019', 'Melisa Brant');
insert into Person (persID, persName) values ('PE1020', 'Minerva Arnaudon');

-- Person phone
insert into PersonPhone (persID, phone) values ('PE1001', '869-241-2129');
insert into PersonPhone (persID, phone) values ('PE1002', '607-418-6597');
insert into PersonPhone (persID, phone) values ('PE1003', '362-556-9732');
insert into PersonPhone (persID, phone) values ('PE1004', '922-153-3042');
insert into PersonPhone (persID, phone) values ('PE1005', '868-238-3054');
insert into PersonPhone (persID, phone) values ('PE1006', '918-613-4286');
insert into PersonPhone (persID, phone) values ('PE1007', '886-593-0750');
insert into PersonPhone (persID, phone) values ('PE1008', '265-195-5619');
insert into PersonPhone (persID, phone) values ('PE1008', '355-818-3515');
insert into PersonPhone (persID, phone) values ('PE1009', '227-727-0240');
insert into PersonPhone (persID, phone) values ('PE1010', '150-201-1400');
insert into PersonPhone (persID, phone) values ('PE1011', '640-434-9561');
insert into PersonPhone (persID, phone) values ('PE1011', '559-670-3000');
insert into PersonPhone (persID, phone) values ('PE1012', '883-991-4661');
insert into PersonPhone (persID, phone) values ('PE1013', '366-492-0850');
insert into PersonPhone (persID, phone) values ('PE1014', '233-578-2880');
insert into PersonPhone (persID, phone) values ('PE1015', '318-593-1266');
insert into PersonPhone (persID, phone) values ('PE1015', '487-806-0088');

insert into PersonPhone (persID, phone) values ('PE1016', '620-233-1919');
insert into PersonPhone (persID, phone) values ('PE1017', '787-171-9572');
insert into PersonPhone (persID, phone) values ('PE1018', '354-257-5170');
insert into PersonPhone (persID, phone) values ('PE1019', '570-714-4011');
insert into PersonPhone (persID, phone) values ('PE1020', '224-340-0526');

-- Patient
insert into Patient (persID, pID) values ('PE1001', 'PA1001');
insert into Patient (persID, pID) values ('PE1002', 'PA1002');
insert into Patient (persID, pID) values ('PE1003', 'PA1003');
insert into Patient (persID, pID) values ('PE1004', 'PA1004');
insert into Patient (persID, pID) values ('PE1005', 'PA1005');
insert into Patient (persID, pID) values ('PE1006', 'PA1006');
insert into Patient (persID, pID) values ('PE1012', 'PA1007');

insert into Patient (persID, pID) values ('PE1016', 'PA1008');
insert into Patient (persID, pID) values ('PE1017', 'PA1009');
insert into Patient (persID, pID) values ('PE1018', 'PA1010');
insert into Patient (persID, pID) values ('PE1019', 'PA1011');
insert into Patient (persID, pID) values ('PE1020', 'PA1012');

-- Worker
insert into Worker (persID, wID, wType) values ('PE1006', 'WK1001', 'doctor');
insert into Worker (persID, wID, wType) values ('PE1007', 'WK1002', 'doctor');
insert into Worker (persID, wID, wType) values ('PE1008', 'WK1003', 'doctor');
insert into Worker (persID, wID, wType) values ('PE1009', 'WK1004', 'doctor');
insert into Worker (persID, wID, wType) values ('PE1010', 'WK1005', 'doctor');
insert into Worker (persID, wID, wType) values ('PE1011', 'WK1006', 'nurse');
insert into Worker (persID, wID, wType) values ('PE1012', 'WK1007', 'nurse');
insert into Worker (persID, wID, wType) values ('PE1013', 'WK1008', 'nurse');
insert into Worker (persID, wID, wType) values ('PE1014', 'WK1009', 'nurse');
insert into Worker (persID, wID, wType) values ('PE1015', 'WK1010', 'nurse');

insert into Worker (persID, wID, wType) values ('PE1016', 'WK1011', 'doctor');
insert into Worker (persID, wID, wType) values ('PE1017', 'WK1012', 'doctor');
insert into Worker (persID, wID, wType) values ('PE1018', 'WK1013', 'doctor');
insert into Worker (persID, wID, wType) values ('PE1019', 'WK1014', 'doctor');

-- Doctor
insert into Doctor (dID, wID) values ('DO1001', 'WK1001');
insert into Doctor (dID, wID) values ('DO1002', 'WK1002');
insert into Doctor (dID, wID) values ('DO1003', 'WK1003');
insert into Doctor (dID, wID) values ('DO1004', 'WK1004');
insert into Doctor (dID, wID) values ('DO1005', 'WK1005');

insert into Doctor (dID, wID) values ('DO1006', 'WK1011');
insert into Doctor (dID, wID) values ('DO1007', 'WK1012');
insert into Doctor (dID, wID) values ('DO1008', 'WK1013');
insert into Doctor (dID, wID) values ('DO1009', 'WK1014');

-- Nurse
insert into Nurse (nID, wID) values ('NU1001', 'WK1006');
insert into Nurse (nID, wID) values ('NU1002', 'WK1007');
insert into Nurse (nID, wID) values ('NU1003', 'WK1008');
insert into Nurse (nID, wID) values ('NU1004', 'WK1009');
insert into Nurse (nID, wID) values ('NU1005', 'WK1010');

-- Medication
insert into Medication (mID, medName) values ('ME1001', 'Paracetamol');
insert into Medication (mID, medName) values ('ME1002', 'Ibuprofen');
insert into Medication (mID, medName) values ('ME1003', 'Cyclobenzaprine');
insert into Medication (mID, medName) values ('ME1004', 'Naproxen');
insert into Medication (mID, medName) values ('ME1005', 'Amoxicillin');

-- Shift
insert into Shift (sID, sDate, startTime, endTime) values ('SH1001', '2020-06-29', '1200', '1900');
insert into Shift (sID, sDate, startTime, endTime) values ('SH1002', '2020-06-12', '1000', '1800');
insert into Shift (sID, sDate, startTime, endTime) values ('SH1003', '2020-06-30', '0800', '1700');
insert into Shift (sID, sDate, startTime, endTime) values ('SH1004', '2021-01-03', '0600', '1600');
insert into Shift (sID, sDate, startTime, endTime) values ('SH1005', '2020-06-20', '0400', '1500');

insert into Shift (sID, sDate, startTime, endTime) values ('SH1006', '2020-02-11', '0300', '0900');
insert into Shift (sID, sDate, startTime, endTime) values ('SH1007', '2020-03-20', '0500', '1300');
insert into Shift (sID, sDate, startTime, endTime) values ('SH1008', '2020-04-05', '0700', '1200');
insert into Shift (sID, sDate, startTime, endTime) values ('SH1009', '2020-05-30', '0900', '1730');

-- Prescription
insert into prescription (pID, dID, mID, pDate, dosage, docType) values ('PA1001', 'DO1002', 'ME1002', '2020-06-29', '50mg', 'Triage');
insert into prescription (pID, dID, mID, pDate, dosage, docType) values ('PA1001', 'DO1002', 'ME1003', '2020-06-29', '25mg', 'Triage');
insert into prescription (pID, dID, mID, pDate, dosage, docType) values ('PA1002', 'DO1005', 'ME1004', '2020-06-30', '100mg', 'Case');
insert into prescription (pID, dID, mID, pDate, dosage, docType) values ('PA1003', 'DO1004', 'ME1001', '2020-06-20', '10mg', 'Case');
insert into prescription (pID, dID, mID, pDate, dosage, docType) values ('PA1003', 'DO1004', 'ME1005', '2020-06-20', '20mg', 'Case');
insert into prescription (pID, dID, mID, pDate, dosage, docType) values ('PA1006', 'DO1001', 'ME1004', '2020-06-29', '100mg', 'Triage');

insert into prescription (pID, dID, mID, pDate, dosage, docType) values ('PA1008', 'DO1006', 'ME1002', '2020-02-11', '50mg', 'Triage');
insert into prescription (pID, dID, mID, pDate, dosage, docType) values ('PA1009', 'DO1007', 'ME1003', '2020-03-20', '25mg', 'Triage');
insert into prescription (pID, dID, mID, pDate, dosage, docType) values ('PA1010', 'DO1008', 'ME1004', '2020-06-12', '100mg', 'Case');
insert into prescription (pID, dID, mID, pDate, dosage, docType) values ('PA1011', 'DO1009', 'ME1004', '2020-04-05', '100mg', 'Case');
insert into prescription (pID, dID, mID, pDate, dosage, docType) values ('PA1012', 'DO1006', 'ME1005', '2020-05-30', '20mg', 'Case');

-- WorksIn
insert into worksIn (wID, sID) values ('WK1001', 'SH1001');
insert into worksIn (wID, sID) values ('WK1001', 'SH1002');
insert into worksIn (wID, sID) values ('WK1001', 'SH1009'); 
insert into worksIn (wID, sID) values ('WK1002', 'SH1001');
insert into worksIn (wID, sID) values ('WK1003', 'SH1002');
insert into worksIn (wID, sID) values ('WK1004', 'SH1004');
insert into worksIn (wID, sID) values ('WK1004', 'SH1005');
insert into worksIn (wID, sID) values ('WK1005', 'SH1003');
insert into worksIn (wID, sID) values ('WK1006', 'SH1001');
insert into worksIn (wID, sID) values ('WK1006', 'SH1002');
insert into worksIn (wID, sID) values ('WK1007', 'SH1001');
insert into worksIn (wID, sID) values ('WK1008', 'SH1003');
insert into worksIn (wID, sID) values ('WK1009', 'SH1002');
insert into worksIn (wID, sID) values ('WK1009', 'SH1003');
insert into worksIn (wID, sID) values ('WK1010', 'SH1004');
insert into worksIn (wID, sID) values ('WK1010', 'SH1005');

insert into worksIn (wID, sID) values ('WK1011', 'SH1006');
insert into worksIn (wID, sID) values ('WK1012', 'SH1007');
insert into worksIn (wID, sID) values ('WK1013', 'SH1002');
insert into worksIn (wID, sID) values ('WK1014', 'SH1008');
insert into worksIn (wID, sID) values ('WK1011', 'SH1009');

-- Visits 
insert into visits (pID, sID, result) values ('PA1001', 'SH1001', 'sent home with medication');
insert into visits (pID, sID, result) values ('PA1002', 'SH1003', 'sent home with medication');
insert into visits (pID, sID, result) values ('PA1002', 'SH1001', 'sent home'); 
insert into visits (pID, sID, result) values ('PA1003', 'SH1005', 'admitted'); 
insert into visits (pID, sID, result) values ('PA1004', 'SH1002', 'admitted'); 
insert into visits (pID, sID, result) values ('PA1005', 'SH1004', 'admitted');
insert into visits (pID, sID, result) values ('PA1006', 'SH1001', 'sent home with medication');
insert into visits (pID, sID, result) values ('PA1007', 'SH1002', 'sent home'); 
insert into visits (pID, sID, result) values ('PA1008', 'SH1006', 'sent home with medication');
insert into visits (pID, sID, result) values ('PA1009', 'SH1007', 'sent home with medication');
insert into visits (pID, sID, result) values ('PA1010', 'SH1002', 'sent home with medication');
insert into visits (pID, sID, result) values ('PA1011', 'SH1009', 'sent home'); 
insert into visits (pID, sID, result) values ('PA1012', 'SH1009', 'sent home with medication');
insert into visits (pID, sID, result) values ('PA1012', 'SH1002', 'sent home'); 
