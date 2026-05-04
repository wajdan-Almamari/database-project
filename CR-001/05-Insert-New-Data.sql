-- 1. Insert Airlines
INSERT INTO Airline (IATA_Code, Name, Country, Email) VALUES
('WY', 'Oman Air', 'Oman', 'info@omanair.com'),
('EK', 'Emirates', 'UAE', 'info@emirates.com'),
('QR', 'Qatar Airways', 'Qatar', 'info@qatarairways.com'),
('BA', 'British Airways', 'UK', 'info@britishairways.com');


-- 2. Insert Gates
-- Make sure Airport_ID values already exist in Airport table
INSERT INTO Gate (Gate_Code, Terminal, Airport_ID) VALUES
('A1', 'Terminal 1', 1),
('A2', 'Terminal 1', 1),
('B1', 'Terminal 2', 2),
('B2', 'Terminal 2', 2),
('C1', 'Terminal 1', 3),
('C2', 'Terminal 1', 3),
('D1', 'Terminal 3', 4),
('E1', 'Terminal 4', 5);

-- 3. Update existing flights with Airline and Gate
UPDATE Flight SET Airline_ID = 1, Gate_ID = 1 WHERE Flight_ID = 1;
UPDATE Flight SET Airline_ID = 2, Gate_ID = 3 WHERE Flight_ID = 2;
UPDATE Flight SET Airline_ID = 3, Gate_ID = 5 WHERE Flight_ID = 3;
UPDATE Flight SET Airline_ID = 4, Gate_ID = 7 WHERE Flight_ID = 4;
UPDATE Flight SET Airline_ID = 1, Gate_ID = 2 WHERE Flight_ID = 5;
UPDATE Flight SET Airline_ID = 2, Gate_ID = 4 WHERE Flight_ID = 6;

-- 4. Insert Baggage records
INSERT INTO Baggage (Tag_Number, Weight_KG, Type, Booking_ID) VALUES
('BG001', 7.50, 'Cabin', 2),
('BG002', 22.00, 'Checked', 2),
('BG003', 8.00, 'Cabin', 3),
('BG004', 18.50, 'Checked', 4),
('BG005', 24.00, 'Checked', 6),
('BG006', 6.80, 'Cabin', 7),
('BG007', 20.00, 'Checked', 8),
('BG008', 7.20, 'Cabin', 10),
('BG009', 25.00, 'Checked', 3),
('BG010', 19.00, 'Checked', 4);

-- 5. Insert Delay Logs
-- Use only flights with status Delayed or Cancelled
INSERT INTO FlightDelayLog (Reason, Duration_Minutes, Recorded_At, Flight_ID) VALUES
('Weather conditions', 45, '2026-05-02 08:30', 2),
('Technical issue', 60, '2026-05-03 07:45', 6),
('Late arrival', 30, '2026-05-06 10:30', 8),
('Operational delay', 50, '2026-05-08 12:40', 2);

SELECT Booking_ID, Passenger_ID, Flight_ID
FROM Booking;

SELECT * FROM Baggage;

SELECT Flight_ID, Flight_Number, Status
FROM Flight;