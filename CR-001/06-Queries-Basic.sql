--1. List all airlines and their country of registration, ordered alphabetically by airline name

SELECT Name, Country
FROM Airline
ORDER BY Name ASC;

--2. Show all gates and the airport they belong to.

select * from Gate
select * from Airport

SELECT g.Gate_Code, g.Terminal, a.Name AS Airport_Name
FROM Gate g
JOIN Airport a
ON g.Airport_ID = a.Airport_ID;

--3. List all baggage records and their type, ordered by weight from heaviest to lightest.
select * from Baggage

SELECT Baggage_ID, Tag_Number, Weight_KG, Type
FROM Baggage
ORDER BY Weight_KG DESC;

--4. Show all delay log records and the flight they belong to, ordered by recorded datetime.

SELECT d.Delay_ID, d.Reason, d.Duration_Minutes, d.Recorded_At,
       f.Flight_Number
FROM FlightDelayLog d
JOIN Flight f
ON d.Flight_ID = f.Flight_ID
ORDER BY d.Recorded_At ASC; 

--5. List all flights that currently have no gate assigned.
SELECT Flight_ID, Flight_Number
FROM Flight
WHERE Gate_ID IS NULL;