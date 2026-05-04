-- Airline
CREATE TABLE Airline (
    Airline_ID INT IDENTITY(1,1) PRIMARY KEY,
    IATA_Code VARCHAR(10) NOT NULL UNIQUE,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Country VARCHAR(100) NOT NULL,
    Contact_Email VARCHAR(100) NOT NULL UNIQUE
);

-- Gate
CREATE TABLE Gate (
    Gate_ID INT IDENTITY(1,1) PRIMARY KEY,
    Gate_Code VARCHAR(20) NOT NULL,
    Terminal VARCHAR(50) NOT NULL,
    Airport_ID INT NOT NULL,

    CONSTRAINT UQ_Gate_Code_Airport UNIQUE (Gate_Code, Airport_ID),

    CONSTRAINT FK_Gate_Airport
    FOREIGN KEY (Airport_ID)
    REFERENCES Airport(Airport_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Baggage
CREATE TABLE Baggage (
    Baggage_ID INT IDENTITY(1,1) PRIMARY KEY,
    Tag_Number VARCHAR(50) NOT NULL UNIQUE,
    Weight_KG DECIMAL(6,2) NOT NULL CHECK (Weight_KG > 0),
    Type VARCHAR(20) NOT NULL CHECK (Type IN ('Cabin', 'Checked')),
    Booking_ID INT NOT NULL,

    CONSTRAINT FK_Baggage_Booking
    FOREIGN KEY (Booking_ID)
    REFERENCES Booking(Booking_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- FlightDelayLog
CREATE TABLE FlightDelayLog (
    Delay_ID INT IDENTITY(1,1) PRIMARY KEY,
    Reason VARCHAR(255) NOT NULL,
    Duration_Minutes INT NOT NULL CHECK (Duration_Minutes > 0),
    Recorded_At DATETIME NOT NULL,
    Flight_ID INT NOT NULL,

    CONSTRAINT FK_DelayLog_Flight
    FOREIGN KEY (Flight_ID)
    REFERENCES Flight(Flight_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);