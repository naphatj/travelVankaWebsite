DROP SCHEMA IF EXISTS travelVanka;
CREATE SCHEMA travelVanka;
use travelVanka;

CREATE TABLE Department (
  deptName VARCHAR(20) not null,
  telno varchar(10) not null,
  primary key(deptName)
  
);

CREATE TABLE Employee (
  employeeID integer(5) not null auto_increment,
  firstName VARCHAR(20) not null,
  lastName VARCHAR(20) not null,
  dateOfBirth date not null,
  telno varchar(10),
  empType varchar(20),
  deptName varchar(20) not null,
  PRIMARY KEY (employeeID),
  
  CONSTRAINT FK_Employee_deptName
    FOREIGN KEY (deptName)
    REFERENCES Department(deptName)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Driver (
  driverID integer(5) not null auto_increment,
  rating float(3,2),
  primary key (driverID),
  CONSTRAINT FK_Driver_driverID
  FOREIGN KEY (driverID)
  REFERENCES Employee(employeeID)
  ON DELETE CASCADE
  ON UPDATE CASCADE
    
    
);

CREATE TABLE Technician (
  techID integer(5) not null auto_increment,
  techType varchar(20) not null,
 
  PRIMARY KEY (techID),
  CONSTRAINT FK_Techician_techID
  FOREIGN KEY (techID)
  REFERENCES Employee(employeeID)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

CREATE TABLE Manager (
  managerID integer(5) not null auto_increment,
  managerType varchar(20) not null,
  deptName varchar(20) not null,
  PRIMARY KEY (managerID),
  
  CONSTRAINT FK_Manager_DeptName
    FOREIGN KEY (deptName)
    REFERENCES Department(deptname)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    CONSTRAINT FK_Manager_managerID
    FOREIGN KEY (managerID)
    REFERENCES Employee(employeeID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Station (
  stationID integer(5) not null auto_increment,
  stationName varchar(20) not null,
  Location varchar(250) not null,
  PRIMARY KEY (stationID)
);


CREATE TABLE Station_Staff (
  staffID integer(5) not null auto_increment,
  staffType varchar(20) not null,
  stationID integer(5) not null,
  PRIMARY KEY (staffID),
  
  CONSTRAINT FK_Station_Staff_stationID
    FOREIGN KEY (stationID)
    REFERENCES Station(stationID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Route (
  routeID integer(5) auto_increment,
  fare integer(3) not null,
  DeptStationID integer(5) not null,
  ArrvStationID integer(5) not null,
  PRIMARY KEY (routeID),
  
  CONSTRAINT FK_Route_DeptStationID
    FOREIGN KEY (DeptStationID)
    REFERENCES Station(stationID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    CONSTRAINT FK_Route_ArrvStationID
    FOREIGN KEY (ArrvStationID)
    REFERENCES Station(stationID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Van (
  vanID integer(5) not null auto_increment,
  mileage integer(7) not null,
  maintainCount integer(3) not null,
  vanRemark varchar(20) not null,
  PRIMARY KEY (vanID)
  
);

CREATE TABLE Van_maintenance (
  maintainNo integer(3) not null,
  description varchar(250) not null,
  vanID integer(5) not null,
  techID integer(5) not null,
  PRIMARY KEY (maintainNo,vanID),
  
  CONSTRAINT FK_Van_Maintenance_vanID
    FOREIGN KEY (vanID)
    REFERENCES van(vanID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    CONSTRAINT FK_Van_Maintenance_techID
    FOREIGN KEY (techID)
    REFERENCES Technician(techID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Trip (
  tripNo integer(10) auto_increment,
  deptTime dateTime not null,
  arrvTime dateTime not null,
  tripRemark varchar(20) ,
  vanID integer(5) not null,
  driverID integer(5) not null,
  availSeat integer(2) not null,
  routeID integer(5) not null,
  PRIMARY KEY (tripNo),
  
  CONSTRAINT FK_Trip_vanID
    FOREIGN KEY (vanID)
    REFERENCES van(vanID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    CONSTRAINT FK_Trip_driverID
    FOREIGN KEY (driverID)
    REFERENCES driver(driverID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    CONSTRAINT FK_Trip_RouteID
    FOREIGN KEY (routeID)
    REFERENCES Route(routeID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Customer (
  customerID integer(10) not null auto_increment,
  firstName varchar(20) not null,
  lastName varchar(20) not null,
  primary key(customerID)
  
);

CREATE TABLE Reservation (
  reservationCode integer(10) not null auto_increment,
  reservationTime datetime not null,
  totalFare integer(4) not null,
  tripNo integer(10) not null,
  customerID integer(5) not null,
  PRIMARY KEY (reservationCode),
  
  CONSTRAINT FK_Reservation_tripNo
    FOREIGN KEY (tripNo)
    REFERENCES Trip(tripNo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    CONSTRAINT FK_Reservation_customerID
    FOREIGN KEY (customerID)
    REFERENCES Customer(customerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Payment(
    paymentID integer(10) not null auto_increment,
    paymentTime datetime not null,
    reservationCode integer(6) not null,
    primary key(paymentID),
    
    CONSTRAINT FK_Payment_reservationCode
    FOREIGN KEY (reservationCode)
    REFERENCES Reservation(reservationCode)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Feedback(
    rating float(3,2) not null,
    comment varchar(250),
    tripNo integer(10) not null,
    customerID integer(5) not null,
    primary key(tripNo,customerID),
    
  CONSTRAINT FK_Feedback_tripNo
    FOREIGN KEY (tripNo)
    REFERENCES Trip(tripNo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    CONSTRAINT FK_Feedback_customerID
    FOREIGN KEY (customerID)
    REFERENCES Customer(customerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE

);

use travelVanka;

INSERT INTO department (deptName,Telno) 
values ('HumanResources','021111111'),
		('IT','022222222'),
		('Operation','029999999');

INSERT INTO station(stationName,Location)
values('Mochit','39 1, Chatuchak, Bangkok,Thailand 10900'),
	  ('Victory Monument',' Ratchawithi 11 Alley PhayaThai Rd., Ratchawithi, Bangkok,Thailand 10400'),
	  ('Rangsit', 'Future Park Rangsit ,Prachathipat, Thanyaburi 12130'),
	  ('Pakkred','Popular 3 Rd.,Banmai,Pakkred, Nonthaburi 11120');

INSERT INTO route(deptStationID,ArrvStationID,fare)
values(1,2,30),
	  (2,1,30),
	  (1,3,25),
	  (3,1,25),
	  (2,3,20),
	  (3,2,20),
	  (3,4,35),
	  (4,3,35);	 

INSERT INTO customer(firstName,Lastname)
values ('John','Smith'),
	    ('Harry','Potter'),
	    ('Michael','Bay'),
	    ('Sarah','Sarahah'),
	    ('Jane','Doe'),
	    ('Mary','Jones');

INSERT INTO van(mileage,maintainCount,vanRemark)
values (4500,2,'available'),
	   (3600,2,'available'),
	   (2000,3,'maintenance'),
	   (1000,0,'available'),
	   (300,0,'available');

INSERT INTO employee(firstName,LastName,dateOfBirth,Telno,deptname,empType)
values ('Tony','Stark','1966-06-13','0812345678','Operation','Driver'),
       ('Captain','America','1890-03-12','022020202','Operation','Driver'),
       ('Donald','Trump','1992-02-13','029988112','Operation','StationStaff'),
       ('Prayudd','Chan-O-char','1856-03-23','044444444','Operation','StationStaff'),
       ('Mark','Zuckerberg','1945-04-12','023232321','IT','Technician'),
       ('Morgan','freeman','1920-07-02','0898989898','HumanResources','Manager'),
       ('2Morgan','freeman2','1930-02-02','000000000','HumanResources','Manager'),
       ('Nelson','Stand','1930-02-02','000000000','Operation','Technician');
       
INSERT INTO driver(driverID,rating)
values (1,3.8),
	   (2,4.5);

INSERT INTO station_Staff(staffID,staffType,stationID)
values (3,'General',1),(4,'Reception',2);

INSERT INTO technician(techID,techType)
values (5,'General'),(8,'Repairer');

INSERT INTO manager(managerID,managerType,deptName)
valueS (6,'Executive','IT'),
	   (7,'ViceExecutive','IT');

INSERT INTO trip(routeID,vanID,driverID,deptTime,arrvTime,availSeat,tripRemark)
values
	  (5,3,1,'2018-11-28 15:45:00','2018-11-28 16:30:00',13,'ended'),
	  (1,1,1,'2018-11-28 12:00:00','2018-11-28 13:00:00',5,'ended'),
	  (1,1,1,'2018-11-29 08:00:00','2018-11-29 10:00:00',2,'departed'),
	  (3,2,2,'2018-11-29 09:15:00','2018-11-29 09:45:00',5,'boarding'),
	  (4,2,1,'2018-11-29 10:00:00','2018-11-29 10:30:00',12,null),	 
	  (2,1,2,'2018-11-29 10:30:00','2018-11-29 11:30:00',13,null),
      (1,2,2,'2018-12-01 12:00:00','2018-12-01 13:00:00',4,null),
      (3,1,1,'2018-12-01 08:00:00','2018-12-01 09:00:00',2,null),
      (5,3,1,'2018-12-02 09:00:00','2018-12-02 09:30:00',13,null);
      
INSERT INTO van_maintenance(maintainNo,description,vanID,techID) 
values 
	(1,"2 Broken front tires. Replace with new ones. ",1,5), 
	(2,"Van battery burnt. Buy new battery.",1,5), 
	(1,"Engine overheated. Repair Engine.",2,5),
    (1,"New van but old engine. Buy new engine and change it.",3,5), 
    (2,"The AC smells bad. Clean the AC",3,8), 
    (2,"4 Broken windows. Buy new windows.",2,8),
    (3,"Broken front window. Replace with new window.",3,5); 


INSERT INTO reservation(reservationTime,totalFare,tripNo,customerID)
values
       ('2018-11-26 06:30:00',20,1,3),
       ('2018-11-28 07:15:00',20,4,2),
        ('2018-11-29 07:30:00',20,4,5),
       ('2018-11-16 12:30:00',30,2,2),
       ('2018-11-26 06:30:00',30,7,1),
	   ('2018-11-28 07:00:00',30,7,2),
	   ('2018-11-29 07:00:00',25,8,2);

INSERT INTO payment(paymentTime,reservationCode)
values ('2018-11-26 06:32:00',1),
	   ('2018-11-28 07:15:20',2),
	   ('2018-11-29 07:31:00',3),
	   ('2018-11-16 12:30:00',4);

INSERT INTO feedback(rating,comment,tripNo,customerID)
values ('4.51','Good driver good car good service !!',1,3),
	   ('2.1','good van but driver drives too fast. im scared.',2,2),
       ('4.55','safe and fast and furious.',4,2),
       ('0.02','driver is really impolite. Bad service. Please fire him.',4,5);