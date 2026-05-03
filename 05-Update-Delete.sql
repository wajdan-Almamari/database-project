--UPDATE and DELETE

---1 Update Flight (Scheduled → Completed)
UPDATE Flight
SET Status = 'Completed'
WHERE Status = 'Scheduled';

---2 Update Flight (Delayed → Cancelled)
UPDATE Flight
SET Status = 'Cancelled'
WHERE Status = 'Delayed';

----3 Economy 10%
UPDATE Booking
SET Price = Price * 1.10
WHERE Class = 'Economy';

-----4
UPDATE Passenger
SET Phone = '99999999'
WHERE Full_Name = 'Wajdan';


-----5
UPDATE CrewMember
SET Role = 'Engineer'
WHERE Full_Name = 'CoPilot A';

----DELETE Tasks

-- 1. Delete one cancelled flight
SELECT *
FROM Flight
WHERE Status = 'Cancelled';
DELETE FROM Flight
WHERE Flight_ID = 3;

-- 2. Delete one booking linked to a cancelled flight
SELECT b.*
FROM Booking b
JOIN Flight f ON b.Flight_ID = f.Flight_ID
WHERE f.Status = 'Cancelled';

DELETE FROM Booking
WHERE Booking_ID = 5;

-- 3. Try to delete a passenger who has existing bookings
SELECT *
FROM Passenger
WHERE Passenger_ID = 1;

SELECT *
FROM Booking
WHERE Passenger_ID = 1;

DELETE FROM Passenger
WHERE Passenger_ID = 1;
