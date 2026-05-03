INSERT INTO Airport (IATA_Code, Name, City, Country) VALUES
('MCT','Muscat Intl','Muscat','Oman'),
('DXB','Dubai Intl','Dubai','UAE'),
('DOH','Hamad Intl','Doha','Qatar'),
('LHR','Heathrow','London','UK'),
('JFK','JFK Airport','New York','USA');


INSERT INTO Aircraft (Registration_Number, Model, Manufacturer, Capacity, Year_Of_Manufacture) VALUES
('REG101','A320','Airbus',180,2018),
('REG102','B737','Boeing',160,2016),
('REG103','A330','Airbus',250,2019),
('REG104','B777','Boeing',300,2020),
('REG105','E190','Embraer',100,2017);


INSERT INTO Passenger (National_ID, Full_Name, Email, Phone, Nationality, Date_Of_Birth) VALUES
('P001','Wajdan','wajdan@gmail.com','9001','Omani','2001-01-01'),
('P002','Ali','ali@gmail.com','9002','Omani','1999-05-10'),
('P003','Sara','sara@gmail.com','9003','Omani','2000-07-20'),
('P004','John','john@gmail.com','9004','American','1995-03-20'),
('P005','Emma','emma@gmail.com','9005','British','1998-11-11'),
('P006','Omar','omar@gmail.com','9006','Pakistani','1997-02-11'),
('P007','Lina','lina@gmail.com','9007','Qatari','2002-06-22'),
('P008','Mona','mona@gmail.com','9008','Egyptian','1996-09-09');

INSERT INTO CrewMember (Full_Name, Role, License_Number) VALUES
('Captain A','Pilot','L1'),
('Captain B','Pilot','L2'),
('CoPilot A','Co-Pilot','L3'),
('Engineer A','Engineer','L4'),
('Attendant A','Flight Attendant','L5'),
('Attendant B','Flight Attendant','L6');

INSERT INTO Flight (Flight_Number, Departure_Datetime, Arrival_Datetime, Status, Aircraft_ID, Origin_Airport_ID, Destination_Airport_ID) VALUES
('SK101','2026-05-01 10:00','2026-05-01 12:00','Scheduled',1,1,2),
('SK102','2026-05-02 09:00','2026-05-02 11:00','Delayed',2,2,3),
('SK103','2026-05-03 08:00','2026-05-03 10:00','Cancelled',3,3,4),
('SK104','2026-05-04 07:00','2026-05-04 09:00','Completed',4,4,5),
('SK105','2026-05-05 06:00','2026-05-05 08:00','Scheduled',5,5,1),
('SK106','2026-05-06 11:00','2026-05-06 13:00','Delayed',1,1,3),
('SK107','2026-05-07 12:00','2026-05-07 14:00','Completed',2,2,4),
('SK108','2026-05-08 13:00','2026-05-08 15:00','Cancelled',3,3,5);

INSERT INTO Booking (Seat_Number, Class, Price, Passenger_ID, Flight_ID) VALUES
('A1','Economy',50,1,1),
('A2','Business',120,2,1),
('B1','First',200,3,2),
('B2','Economy',60,4,2),
('C1','Business',130,5,3),
('C2','First',220,6,4),
('D1','Economy',55,7,5),
('D2','Business',140,8,6),
('E1','First',210,1,7),
('E2','Economy',65,2,8);

SELECT * FROM Airport;
SELECT * FROM Aircraft;
SELECT * FROM Passenger;
SELECT * FROM Flight;
SELECT * FROM Booking;
SELECT * FROM CrewMember;
SELECT * FROM FlightCrew;

INSERT INTO FlightCrew (Flight_ID, Crew_ID) VALUES
(1,1),(1,5),
(2,2),(2,6),
(3,1),(3,5),
(4,2),(4,6),
(5,1),(5,5),
(6,2),(6,6),
(7,1),(7,5),
(8,2),(8,6);
