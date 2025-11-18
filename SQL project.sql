create database Ola;
use Ola;
show tables;
select * from `ola project`;
rename table `ola project` to ola_project;
select * from ola_project;
Create View Successful_Bookings As
select * from ola_project
where Booking_Status='Success';
#1. Retrieve all succesful_Bookings:
select * from Successful_Bookings;

#2. Find the avaerage ride distance for each vehical type:
create view ride_distance_for_each_vehical AS
select Vehicle_Type, avg (Ride_Distance) as avg_distance from ola_project
group by Vehicle_Type;
select * from ride_distance_for_each_vehical ;

#3. Get the total number of canceled rides by customer:
create view canceled_rides_by_customer AS
select count(*) from ola_project
where Booking_status ='Canceled by Customer';
select * from canceled_rides_by_customer;

#4. List the top 5 customer who booked the highest number of rides:
create view top_5_customer AS
select Customer_ID, count(Booking_ID) as Total_rides from ola_project
group by Customer_ID
order by Total_rides desc
limit 5;
select * from top_5_customer;

#5. GEt the number of rides canceled by drivers due to personal and car-related issue:
create view canceled_by_drivers_P_C_issue AS
select count(*) from ola_project
where Canceled_Rides_By_Driver = 'Personal & Car related issue';
select * from canceled_by_drivers_P_C_issue ;

#6. Find the maximum and minimum driver rating for Prime Sedan Bookings;
create view Max_Min_Driver_Rating AS
select * from ola_project;
select  max(Driver_Ratings) as Max_rating,
min(Driver_Ratings) as Min_rating
from ola_project where Vehicle_Type ='Prime Sedan';

#7.  Retrieve all rides where payment was made using UPI
create view UPI_payment AS
select * from ola_project 
where Payment_method = 'UPI';
select * from UPI_payment;

#8. Find the averaage customer rating per vehicle type:
create view AVG_Cust_Rating AS
select Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
from ola_project
group by Vehicle_Type;
select * from AVG_Cust_Rating;

#9. Calculate the total booking values of rides completed successfully:
create view Total_successfull_values AS
select sum(Booking_Value) as total_successful_values
from ola_project
where Booking_Status='Success';
select * from Total_successfull_values;

#10. List all incomplete rides along with the reason:
create view Incomplete_Rides_Reasons AS
select Booking_Id,Incomplete_Rides_Reason
from ola_project
where Incomplete_Rides='Yes';
select * from Incomplete_Rides_Reasons;
























