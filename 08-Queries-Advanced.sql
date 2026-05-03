-------Advanced Level

-- 1. Flight details with total passengers, including flights with no bookings
SELECT 
    f.Flight_Number,
    origin.Name AS Origin_Airport,
    destination.Name AS Destination_Airport,
    a.Model AS Aircraft_Model,
    COUNT(b.Booking_ID) AS Total_Passengers
FROM Flight f
JOIN Airport origin ON f.Origin_Airport_ID = origin.Airport_ID
JOIN Airport destination ON f.Destination_Airport_ID = destination.Airport_ID
JOIN Aircraft a ON f.Aircraft_ID = a.Aircraft_ID
LEFT JOIN Booking b ON f.Flight_ID = b.Flight_ID
GROUP BY f.Flight_Number, origin.Name, destination.Name, a.Model;

----
-- 1. Flight details with total passengers, including flights with no bookings
SELECT 
    f.Flight_Number,
    origin.Name AS Origin_Airport,
    destination.Name AS Destination_Airport,
    a.Model AS Aircraft_Model,
    COUNT(b.Booking_ID) AS Total_Passengers
FROM Flight f
JOIN Airport origin ON f.Origin_Airport_ID = origin.Airport_ID
JOIN Airport destination ON f.Destination_Airport_ID = destination.Airport_ID
JOIN Aircraft a ON f.Aircraft_ID = a.Aircraft_ID
LEFT JOIN Booking b ON f.Flight_ID = b.Flight_ID
GROUP BY f.Flight_Number, origin.Name, destination.Name, a.Model;

-- 2. Passengers who never made a booking
SELECT 
    p.Full_Name
FROM Passenger p
LEFT JOIN Booking b ON p.Passenger_ID = b.Passenger_ID
WHERE b.Booking_ID IS NULL;

-- 3. Flights where total revenue exceeds 500
SELECT 
    f.Flight_Number,
    SUM(b.Price) AS Total_Revenue
FROM Flight f
JOIN Booking b ON f.Flight_ID = b.Flight_ID
GROUP BY f.Flight_Number
HAVING SUM(b.Price) > 500
ORDER BY Total_Revenue DESC;

-- 4. Crew members assigned to more than one flight
SELECT 
    c.Full_Name,
    COUNT(fc.Flight_ID) AS Total_Flights
FROM CrewMember c
JOIN FlightCrew fc ON c.Crew_ID = fc.Crew_ID
GROUP BY c.Full_Name
HAVING COUNT(fc.Flight_ID) > 1;

-- 5. Average booking price per flight above overall average
SELECT 
    f.Flight_Number,
    AVG(b.Price) AS Average_Price
FROM Flight f
JOIN Booking b ON f.Flight_ID = b.Flight_ID
GROUP BY f.Flight_Number
HAVING AVG(b.Price) > (SELECT AVG(Price) FROM Booking);

-- 6. Flight with highest number of bookings
SELECT TOP 1
    f.Flight_Number,
    origin.Name AS Origin_Airport,
    destination.Name AS Destination_Airport,
    COUNT(b.Booking_ID) AS Total_Bookings
FROM Flight f
JOIN Booking b ON f.Flight_ID = b.Flight_ID
JOIN Airport origin ON f.Origin_Airport_ID = origin.Airport_ID
JOIN Airport destination ON f.Destination_Airport_ID = destination.Airport_ID
GROUP BY f.Flight_Number, origin.Name, destination.Name
ORDER BY Total_Bookings DESC;

-- 7. Booking class revenue and price statistics
SELECT 
    Class,
    SUM(Price) AS Total_Revenue,
    COUNT(Booking_ID) AS Number_Of_Bookings,
    AVG(Price) AS Average_Price,
    MAX(Price) AS Highest_Price,
    MIN(Price) AS Lowest_Price
FROM Booking
GROUP BY Class;

-- 8. Passengers who booked cancelled flights
SELECT 
    p.Full_Name AS Passenger_Name,
    f.Flight_Number,
    b.Booking_Date
FROM Booking b
JOIN Passenger p ON b.Passenger_ID = p.Passenger_ID
JOIN Flight f ON b.Flight_ID = f.Flight_ID
WHERE f.Status = 'Cancelled';

-- 9. Flights with at least one pilot and one flight attendant
SELECT 
    f.Flight_Number,
    COUNT(fc.Crew_ID) AS Total_Crew_Count,
    f.Departure_Datetime
FROM Flight f
JOIN FlightCrew fc ON f.Flight_ID = fc.Flight_ID
JOIN CrewMember c ON fc.Crew_ID = c.Crew_ID
GROUP BY f.Flight_ID, f.Flight_Number, f.Departure_Datetime
HAVING 
    SUM(CASE WHEN c.Role = 'Pilot' THEN 1 ELSE 0 END) >= 1
    AND
    SUM(CASE WHEN c.Role = 'Flight Attendant' THEN 1 ELSE 0 END) >= 1;


-- 10. FINAL CHALLENGE: Complete flight summary
SELECT 
    f.Flight_Number,
    origin.City AS Origin_City,
    destination.City AS Destination_City,
    a.Model AS Aircraft_Model,
    a.Manufacturer AS Aircraft_Manufacturer,
    COUNT(DISTINCT b.Booking_ID) AS Total_Passengers_Booked,
    COUNT(DISTINCT fc.Crew_ID) AS Total_Crew_Assigned,
    COALESCE(SUM(b.Price), 0) AS Total_Revenue
FROM Flight f
JOIN Airport origin ON f.Origin_Airport_ID = origin.Airport_ID
JOIN Airport destination ON f.Destination_Airport_ID = destination.Airport_ID
JOIN Aircraft a ON f.Aircraft_ID = a.Aircraft_ID
LEFT JOIN Booking b ON f.Flight_ID = b.Flight_ID
LEFT JOIN FlightCrew fc ON f.Flight_ID = fc.Flight_ID
GROUP BY 
    f.Flight_Number,
    origin.City,
    destination.City,
    a.Model,
    a.Manufacturer
ORDER BY Total_Revenue DESC;



