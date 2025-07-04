
-- 1.Retrive all data of successful bookings.
select * from bookings

-- 2. Find Average ride distance for each vehicle type.
create view avg_distance_for_each_vehicle as
select vehicle_type, avg(ride_distance) as avg_distance  from bookings
group by vehicle_type

select  * from avg_distance_for_each_vehicle

-- 3. Get the total number of cancel rides by customer.
create view number_of_cancel_rides as
select booking_status, count(*) from bookings 
where booking_status = 'Canceled by Customer'
group by booking_status

select * from number_of_cancel_rides

-- 4. List The top 5 customers who booked the highest no. of rides.
create view top_5_customers as
select customer_id, count(booking_id) as total_rides from bookings
group by customer_id
order by total_rides desc
limit 

select * from top_5_customers

-- 5. Get the number of rides canceled by drivers deu to persnol and car-related issue.
create view canceled_by_drivers as
select canceled_rides_by_driver, count(*) as number_of_rides from bookings
where canceled_rides_by_driver = 'Personal & Car related issue'
group by canceled_rides_by_driver

select * from canceled_by_drivers

-- 6. Find the maximum and minimum driver ratings for Prime Sedan Bookings.
select max(driver_ratings), min(driver_ratings) from bookings
where vehicle_type = 'Prime Sedan'

-- 7. Retrieve all rides where payments was made using UPI.
select booking_id, payment_method from bookings
where payment_method = 'UPI'

-- 8. Find the avarage customer rating per vehicle type.
select vehicle_type, avg(customer_rating) as avg_customer_rating from bookings
group by customer_rating, vehicle_type

-- 9. Calculate the total booking value of rides completed successfully.
select sum(booking_value) from bookings 
where booking_status = 'Success'

select * from bookings


-- 10. List all Incomplete rides along with the reason.
select booking_id, incomplete_rides_reason from bookings
where incomplete_rides = 'Yes'







select * from bookings
-- que Find Second highest booking value.
select max(booking_value) as second_highest_value from bookings 
where booking_value < (select max(booking_value) from bookings)

-- 4. 


