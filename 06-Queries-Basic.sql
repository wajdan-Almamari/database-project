--Basic Level: Data Queries
-- 1. List all flights and their current status, ordered by departure datetime
SELECT Flight_Number, Status, Departure_Datetime
FROM Flight
ORDER BY Departure_Datetime ASC;

-- 2. Show all passengers, ordered alphabetically by full name
SELECT *
FROM Passenger
ORDER BY Full_Name ASC;

-- 3. List all aircraft and their seating capacity, ordered largest to smallest
SELECT Registration_Number, Model, Capacity
FROM Aircraft
ORDER BY Capacity DESC;

-- 4. Show distinct booking class values
SELECT DISTINCT Class
FROM Booking;

-- 5. List all flights with status Delayed or Cancelled
SELECT *
FROM Flight
WHERE Status IN ('Delayed', 'Cancelled');

-- 6. Show all Omani passengers
SELECT *
FROM Passenger
WHERE Nationality = 'Omani';

-- 7. List all airports, ordered by country
SELECT *
FROM Airport
ORDER BY Country ASC;