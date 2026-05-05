--1. Show each flight with its flight number, airline name, and gate code.

SELECT Flight_Number, Name, Gate_Code
FROM Flight
JOIN Airline ON Flight.Airline_ID = Airline.Airline_ID
LEFT JOIN Gate ON Flight.Gate_ID = Gate.Gate_ID;

--2. List all baggage items along with the passenger name and flight number they are linked to.

SELECT b.Tag_Number, p.Full_Name, f.Flight_Number
FROM Baggage b
JOIN Booking bk ON bk.Booking_ID = b.Booking_ID
JOIN Passenger p ON p.Passenger_ID = bk.Passenger_ID
JOIN Flight f ON bk.Flight_ID = f.Flight_ID;

--3. Count the total number of baggage items per booking. Show the booking ID, passenger name, and baggage count.

SELECT  bk.Booking_ID ,P.Full_Name ,COUNT(b.Baggage_ID) AS Baggage_Count
FROM Booking bk
JOin Passenger P ON P.Passenger_ID = bk.Passenger_ID
left join Baggage b ON b.Booking_ID = bk.Booking_Id  
GROUP BY 
    bk.Booking_ID, 
    p.Full_Name;

--4. Show all delay logs including the flight number, airline name, delay reason, and duration in minutes.
SELECT f.Flight_Number , a.Name as Airline_Name  ,d.Reason as delay_Reason , d.Duration_Minutes
from Flight f
join Airline a on a.Airline_ID = f.Airline_ID 
join FlightDelayLog d ON f.Flight_ID = d.Flight_ID 

--5. Find the total weight of checked baggage per flight. Show the flight number and total checked weight.
SELECT F.Flight_Number , SUM (b.Weight_KG)as total_checked_weight
from Flight F
join Booking bk on f.Flight_ID = bk.Flight_ID 
join  Baggage b on bk.Booking_ID = b.Booking_ID
WHERE b.Type = 'Checked' 
GROUP BY 
F.Flight_Number;

--6. Count how many flights each airline operates. Order from highest to lowest.

SELECT A.Name,COUNT(F.Flight_ID) AS flights
FROM Airline A
LEFT JOIN Flight F ON A.Airline_ID = F.Airline_ID
GROUP BY A.Name
ORDER BY flights DESC;

--7. Show all flights that have been delayed more than once. Display the flight number and total number of delay records
SELECT f.Flight_Number, COUNT(d.Delay_ID) AS Total_Delay_Records
FROM Flight f
JOIN FlightDelayLog d  ON f.Flight_ID = d.Flight_ID
GROUP BY f.Flight_Number
HAVING COUNT(d.Delay_ID) > 1;