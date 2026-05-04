\# SkyTrack Airline System



\## Brief Description

SkyTrack Airline System is a database system designed to manage airline operations, including airports, aircraft, flights, passengers, bookings, and crew assignments.



\## ERD Summary

The main entities are:

\- Airport

\- Aircraft

\- Flight

\- Passenger

\- Booking

\- CrewMember

\- FlightCrew



Key relationships:

\- One aircraft can be assigned to many flights.

\- One airport can be used as an origin airport for many flights.

\- One airport can be used as a destination airport for many flights.

\- One passenger can make many bookings.

\- One flight can have many bookings.

\- Flight and CrewMember have a many-to-many relationship, solved using the FlightCrew table.



Design decision:

Flight has two foreign keys to Airport: Origin\_Airport\_ID and Destination\_Airport\_ID, because each flight has one departure airport and one arrival airport.



\## Mapping Decisions

Foreign keys were placed based on the relationship type:

\- Aircraft\_ID was placed in Flight because each flight uses one aircraft.

\- Origin\_Airport\_ID and Destination\_Airport\_ID were placed in Flight because each flight has one origin airport and one destination airport.

\- Passenger\_ID and Flight\_ID were placed in Booking because each booking belongs to one passenger and one flight.

\- FlightCrew was created as an associative table to handle the many-to-many relationship between Flight and CrewMember.



\## Errors Faced

During foreign key creation, SQL Server showed a multiple cascade paths error for the Destination Airport relationship. This happened because Flight has two foreign keys referencing Airport. To solve this, ON DELETE NO ACTION and ON UPDATE NO ACTION were used for the destination airport relationship.



During DELETE testing, deleting a passenger with existing bookings affected the related bookings because ON DELETE CASCADE was enabled.



\## Difference Between WHERE and HAVING

WHERE is used to filter rows before grouping.



HAVING is used to filter groups after GROUP BY.



Example:

\- WHERE can filter flights with status = 'Cancelled'.

\- HAVING can show flights that have more than one booking.



\## Most Useful Query

The final challenge query was the most useful query because it gives a complete flight summary. It shows the flight number, origin city, destination city, aircraft model, aircraft manufacturer, total passengers booked, total crew assigned, and total revenue.





