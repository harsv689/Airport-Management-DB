# AIRPORT MANAGEMENT SYSTEM

### Members :
- Ashutosh Srivastava (2021101056)
- Amogha A Halhalli (2021101007)
- Harshvardhan (2021111017)
----

### Introduction
- The miniworld selected is of an Airport. This database stores all the information regarding the functioning of an Airport.
- The design and structure of the database would provide a more efficient data system for reporting and retrieving data regarding the daily functioning of a particular Airport.
---

### Purpose
- To safely store all the information regarding the Flights, Passengers , Crew Staff , Airport Personnels etc.
- To organise all the data regarding the daily flights in a logical manner so as to allow for easy and quick retrieval , as and when required.
- To retrieve information as swiftly as possible ,when required,, using simple queries in the form of Views; at the same time restricting the access of the information regarding the Database to only the Authorised Users.
---

### Applications
We can use our database for the following :-
- By the Crew Members to check their upcoming Flight.
- By ATC specialists to check for the flight schedules to give the clearances for takeoff and landing ,respectively
- By all the passenger to view their Current flight status and Updated Departure time (in case a flight is delayed)
- To find out the details regarding daily Operational load of an Airport to avoid overloading a ATC tower (i.e. they’ll have to build more tower if load goes above a particular threshold or increase the Air Traffic controllers)
- To get the Employee details or Passenger details in case an accident at the Airport happens or Aircraft crash takes place
---

### List of commands:
1. Upcoming Flights<br />
View all the upcoming flights.

2.  Passenger details<br />
View the passenger details of a paricular flight.

3.  Crew Members<br />
View the crew member details of a paricular flight.

4. Employee Statistics<br />
Search for an Employee's details.

5. Fire an Employee<br />
Remove an Employee details from the database.

6. Cancel Tickets<br />
Cancellation of tickets by the passengers.

7. Cancelled Flight<br />
Cancel a flight due to some unavoidable situation.

8. Duration of a flight<br />
Get the duration of a particular flight.

9. Occupancy vs Price<br />
Compare the values of ticket prices with occupancy rates.

10. Cheapest one<br />
Find a cheapest flight for a particular route.

11. Average rates<br />
Get the average ticket price over a paricular route.

12. New ticket<br />
Insert the details of a new ticket.

13. New Flight<br />
Insert the details of a new flight.

14. Added Employee<br />
Insert the details of a new employee.

15. Updated Flight status<br />
Updated the details of a cancelled flight.

16. Updated Salaries<br />
Updated the salaries of a designation.

17. Logout<br />
Logs you out of the your database.
---

### Retrievals
1. Query Functions
    - Selection
        * View all the Upcoming Flight
        * View all the Passenger details of a particular flight
    - Projection:
        * Estimating Inflation in ticket Prices
        * Expected Occupancy (in %) in a flight depending on the season
        * Expected increase in Salary of Employees working in the airport
    - Aggregate:
        * Duration of a flight
        * Average Ticket Price over a route
    - Search:
        * Crew members of a particular flight.
        * Search for a Employee’s and Passenger’s details
2. Analysis:
    - Variation of Ticket prices with varying occupancies <br/>
        (>90%, 50%-90%, <50%) (Check)
    - Finding the cheapest flight on a route (Check)
---

### Modifications
1. Insert
    - Ticket details (on booking by passengers)
    - Flight details (newly introduced by Airline)
    - Employee (newly appointed in a airport)
2. Delete
    - Passenger (on cancellation of ticket)
    - Employee (on retirement)
    - Flight (on cancellation)
3. Update
    - Flight details (if any changes)
    - Employee details (if any changes)
    - Ticket details (if any changes)
    - Updating the Occupancy Rate (On every ticket booking)