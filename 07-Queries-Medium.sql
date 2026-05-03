---Medium Level

-- 1. Flight number with origin and destination airport names
SELECT 
    f.Flight_Number,
    origin.Name AS Origin_Airport,
    destination.Name AS Destination_Airport
FROM Flight f
JOIN Airport origin 
    ON f.Origin_Airport_ID = origin.Airport_ID
JOIN Airport destination 
    ON f.Destination_Airport_ID = destination.Airport_ID;


-- 2. Each booking with passenger name and flight number
SELECT 
    b.Booking_ID,
    p.Full_Name,
    f.Flight_Number
FROM Booking b
JOIN Passenger p 
    ON b.Passenger_ID = p.Passenger_ID
JOIN Flight f 
    ON b.Flight_ID = f.Flight_ID;

-- 3. Crew members assigned to flight 'SK101'
SELECT 
    c.Full_Name,
    c.Role
FROM FlightCrew fc
JOIN CrewMember c 
    ON fc.Crew_ID = c.Crew_ID
JOIN Flight f 
    ON fc.Flight_ID = f.Flight_ID
WHERE f.Flight_Number = 'SK101';

-- 4. Completed flights with aircraft model
SELECT 
    f.Flight_Number,
    f.Status,
    a.Model
FROM Flight f
JOIN Aircraft a 
    ON f.Aircraft_ID = a.Aircraft_ID
WHERE f.Status = 'Completed';

-- 5. Total bookings for each passenger
SELECT 
    p.Full_Name,
    COUNT(b.Booking_ID) AS Total_Bookings
FROM Passenger p
LEFT JOIN Booking b 
    ON p.Passenger_ID = b.Passenger_ID
GROUP BY p.Full_Name
ORDER BY Total_Bookings DESC;

-- 6. Total revenue for each booking class
SELECT 
    Class,
    SUM(Price) AS Total_Revenue
FROM Booking
GROUP BY Class;

-- 7. Count how many flights each aircraft has been assigned to
SELECT 
    a.Registration_Number,
    a.Model,
    COUNT(f.Flight_ID) AS Total_Flights
FROM Aircraft a
LEFT JOIN Flight f 
    ON a.Aircraft_ID = f.Aircraft_ID
GROUP BY a.Registration_Number, a.Model;

-- 8. Flights that have more than one booking
SELECT 
    f.Flight_Number,
    COUNT(b.Booking_ID) AS Booking_Count
FROM Flight f
JOIN Booking b 
    ON f.Flight_ID = b.Flight_ID
GROUP BY f.Flight_Number
HAVING COUNT(b.Booking_ID) > 1;

-- 9. Full details of all bookings
SELECT 
    p.Full_Name AS Passenger_Name,
    f.Flight_Number,
    origin.Name AS Origin_Airport,
    destination.Name AS Destination_Airport,
    b.Class,
    b.Price AS Price_Paid
FROM Booking b
JOIN Passenger p 
    ON b.Passenger_ID = p.Passenger_ID
JOIN Flight f 
    ON b.Flight_ID = f.Flight_ID
JOIN Airport origin 
    ON f.Origin_Airport_ID = origin.Airport_ID
JOIN Airport destination 
    ON f.Destination_Airport_ID = destination.Airport_ID;
