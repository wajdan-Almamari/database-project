CREATE DATABASE SkyTrackAirlineDB;
USE SkyTrackAirlineDB;


CREATE TABLE Airport (
    Airport_ID INT IDENTITY(1,1) PRIMARY KEY,
    IATA_Code VARCHAR(10) NOT NULL UNIQUE,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL
);


CREATE TABLE Aircraft (
    Aircraft_ID INT IDENTITY(1,1) PRIMARY KEY,
    Registration_Number VARCHAR(50) NOT NULL UNIQUE,
    Model VARCHAR(100) NOT NULL,
    Manufacturer VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL CHECK (Capacity > 0),
    Year_Of_Manufacture INT
);


CREATE TABLE Passenger (
    Passenger_ID INT IDENTITY(1,1) PRIMARY KEY,
    National_ID VARCHAR(50) NOT NULL UNIQUE,
    Full_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20),
    Nationality VARCHAR(50) NOT NULL,
    Date_Of_Birth DATE NOT NULL
);

CREATE TABLE CrewMember (
    Crew_ID INT IDENTITY(1,1) PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Role VARCHAR(30) NOT NULL CHECK 
        (Role IN ('Pilot', 'Co-Pilot', 'Flight Attendant', 'Engineer')),
    License_Number VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Flight (
    Flight_ID INT IDENTITY(1,1) PRIMARY KEY,
    Flight_Number VARCHAR(20) NOT NULL UNIQUE,
    Departure_Datetime DATETIME NOT NULL,
    Arrival_Datetime DATETIME NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'Scheduled',

    Aircraft_ID INT NOT NULL,
    Origin_Airport_ID INT NOT NULL,
    Destination_Airport_ID INT NOT NULL,

    CHECK (Status IN ('Scheduled', 'Delayed', 'Cancelled', 'Completed')),
    CHECK (Arrival_Datetime > Departure_Datetime)
);

CREATE TABLE Booking (
    Booking_ID INT IDENTITY(1,1) PRIMARY KEY,
    Seat_Number VARCHAR(10) NOT NULL,
    Class VARCHAR(20) NOT NULL CHECK 
        (Class IN ('Economy', 'Business', 'First')),
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    Booking_Date DATE NOT NULL DEFAULT GETDATE(),

    Passenger_ID INT NOT NULL,
    Flight_ID INT NOT NULL
);

CREATE TABLE FlightCrew (
    Flight_ID INT NOT NULL,
    Crew_ID INT NOT NULL,

    PRIMARY KEY (Flight_ID, Crew_ID)
);

ALTER TABLE Flight
DROP CONSTRAINT FK_Flight_Aircraft;

ALTER TABLE Flight
ADD CONSTRAINT FK_Flight_Aircraft
FOREIGN KEY (Aircraft_ID)
REFERENCES Aircraft(Aircraft_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Flight
ADD CONSTRAINT FK_Flight_OriginAirport
FOREIGN KEY (Origin_Airport_ID)
REFERENCES Airport(Airport_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Flight
ADD CONSTRAINT FK_Flight_DestinationAirport
FOREIGN KEY (Destination_Airport_ID)
REFERENCES Airport(Airport_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_Passenger
FOREIGN KEY (Passenger_ID)
REFERENCES Passenger(Passenger_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_Flight
FOREIGN KEY (Flight_ID)
REFERENCES Flight(Flight_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE FlightCrew
ADD CONSTRAINT FK_FlightCrew_Flight
FOREIGN KEY (Flight_ID)
REFERENCES Flight(Flight_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE FlightCrew
ADD CONSTRAINT FK_FlightCrew_Crew
FOREIGN KEY (Crew_ID)
REFERENCES CrewMember(Crew_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Flight
ADD CONSTRAINT FK_Flight_DestinationAirport
FOREIGN KEY (Destination_Airport_ID)
REFERENCES Airport(Airport_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

--error FOREIGN KEY (Destination_Airport_ID)
--DestinationAirport uses NO ACTION because SQL Server prevents multiple cascade paths
-- when Flight has two foreign keys referencing Airport.
ALTER TABLE Flight
ADD CONSTRAINT FK_Flight_DestinationAirport
FOREIGN KEY (Destination_Airport_ID)
REFERENCES Airport(Airport_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;