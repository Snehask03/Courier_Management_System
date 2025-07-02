create database courier_management_system;
use courier_management_system;

-- Task 1 : Database Design

-- User Table
create table users
(
user_id int primary key,
User_name varchar(255),
Email varchar(255) unique,
User_password varchar(255),
ContactNumber varchar(20),
Address text
);

desc users;

-- Courier Table
create table Courier
(
courierID int primary key,
Sender_name varchar(255),
Sender_address text,
Receiver_name varchar(255),
Receiver_address text,
weight decimal(5,2),
Courier_status varchar(50),
Tracking_number varchar(20) unique not null,
Delivery_date date
);

desc Courier;

-- CourierServices Table
create table CourierServices
(
ServiceID INT PRIMARY KEY,
ServiceName VARCHAR(100),
Cost DECIMAL(8, 2)
);

desc CourierServices;

-- Employee Table
create table Employee
(
EmployeeID INT PRIMARY KEY,
Emp_name VARCHAR(255),
Emp_email VARCHAR(255) UNIQUE,
Emp_contact_number VARCHAR(20),
Emp_role VARCHAR(50),
Salary DECIMAL(10,2)
);

desc Employee;

-- Location Table
create table Location
(
LocationID INT PRIMARY KEY,
LocationName VARCHAR(100),
Address TEXT
);

desc Location;

-- Payment Table
create table Payment
(
PaymentID int primary key,
CourierID int,
LocationID int, 
Amount decimal(10,2),
PaymentDate date,
FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

desc Payment;

-- Inserting values into users table
insert into users values
(1, 'Aarav Shah', 'aarav@gmail.com','pass123','9123456780','Bangalore'),
(2, 'Diya Mehra', 'diya@gmail.com','pass234','9123456712','Mumbai'),
(3, 'Ravi Kumar', 'ravi@gmail.com','pass345','9123456711','Delhi'),
(4, 'Sara Sharma', 'sarash@gmail.com','pass456','9213456780','Hyderabad'),
(5, 'Nikhil Rao', 'nikhilrao@gmail.com','pass567','9124356780','Chennai'),
(6, 'Ananya Verma', 'ananyavr@gmail.com','pass678','9123465780','Pune'),
(7, 'Priya Arora', 'priyaar@gmail.com','pass789','9123457680','Kolkata'),
(8, 'Kunal Joshi', 'kunaljoshi@gmail.com','pass890','9123456870','Ahmedabad'),
(9, 'Ishita Roy', 'ishitha@gmail.com','pass134','9876543211','Lucknow'),
(10, 'Manav Desai', 'manav@gmail.com','pass153','9123456782','Jaipur');

select * from users;

-- Inserting values into Courier table
insert into Courier values
(1, 'Aarav Shah', 'Bangalore', 'Diya Mehra', 'Mumbai', 5.50,'Delivered','TK001','2025-06-11'),
(2, 'Diya Mehra', 'Mumbai', 'Ravi Kumar', 'Delhi', 3.25, 'In Progress','TK002','2025-06-14'),
(3, 'Ravi Kumar','Delhi','Sara Sharma','Hyderabad', 7.10,'Delivered','TK003', '2025-06-10'),
(4, 'Sara Sharma','Hyderabad','Nikhil Rao','Chennai', 4.40, 'Pending', 'TK004',null),
(5, 'Nikhil Rao','Chennai','Ananya Verma','Pune',2.85,'Delivered','TK005','2025-06-09'),
(6, 'Ananya Verma','Pune','Priya Arora','Kolkata',6.30,'In Progress','TK006','2025-06-13'),
(7, 'Priya Arora','Kolkata','Kunal Joshi','Ahmedabad',8.90, 'Delivered','TK007','2025-06-12'),
(8, 'Kunal Joshi','Ahmedabad','Ishita Roy','Lucknow',5.70,'Pending', 'TK008',null),
(9, 'Ishita Roy','Lucknow','Manav Desai','Jaipur',4.20, 'Delivered','TK009','2025-06-11'),
(10,'Manav Desai','Jaipur','Aarav Shah', 'Bangalore',9.50,'Delivered','TK010','2025-06-10');

select * from Courier;

-- Inserting values into CourierServices Table
insert into CourierServices values 
(1, 'Standard Delivery', 100.0),
(2, 'Express Delivery', 200.0),
(3, 'Overnight Delivery', 300.0),
(4, 'Same Day Delivery', 250.0),
(5, 'International', 500.0),
(6, 'Bulk Delivery', 700.0),
(7, 'Drone Delivery', 450.0),
(8, 'Fragile Goods Delivery', 350.0),
(9, 'Eco Shipping', 120.0),
(10, 'Premium Delivery', 600.0);

select * from CourierServices;

-- Inserting values into Employee table
insert into Employee values
(1,'John Mathew', 'johnm@gmail.com','9871000000', 'Manager', 75000),
(2,'Anjali Reddy', 'anjalir@gmail.com','9871000001', 'Dispatcher', 55000),
(3,'Rakesh Yadav', 'rakeshy@gmail.com','9871000002', 'Driver', 35000),
(4,'Johnathon Doe', 'johndoe@gmail.com','9871000003', 'Driver', 36000),
(5,'Fatima Sheikh', 'fatimash@gmail.com','9871000004', 'Customer Support', 30000),
(6,'Neha Sinha', 'nehasinha@gmail.com','9871000005', 'Driver', 37000),
(7,'Rohan Paul', 'rohanpaul@gmail.com','9871000006', 'Manager', 76000),
(8,'Rajiv Menon', 'rajivmenon@gmail.com','9871000007', 'Warehouse staff', 32000),
(9,'Shreya Kapoor', 'shreyak@gmail.com','9871000008', 'Dispatcher', 56000),
(10,'Vikram Mehta', 'vikrammehta@gmail.com','9871000009', 'Driver', 38000);

select * from Employee;

-- Inserting Values into Location table
insert into Location values
(1, 'Bangalore hub', 'Electronic City, Bangalore'),
(2, 'Mumbai Cnetral', 'Andheri, Mumbai'),
(3, 'Delhi Depot', 'Connaught Place, Delhi'),
(4, 'Hyderabad Node', 'Gachibowli, Hyderabad'),
(5, 'Chennai Dispatch', 'T Nagar, Chennai'),
(6, 'Pune Base', 'Shivaji Nagar, Pune'),
(7, 'Kolkata Unit', 'Salt Lake, Kolkata'),
(8, 'Ahmedabad Unit', 'Navrangpura, Ahmedabad'),
(9, 'Lucknow Terminal', 'Hazratganj, Lucknow'),
(10, 'Jaipur Dispatch', 'Malviya Nagar, Jaipur');

update Location set LocationName = 'Mumbai Central'
where LocationID = 2;
select * from Location;

-- Inserting values into Payment table 
insert into Payment values
(1, 1, 1, 100.0, '2025-06-11'),
(2, 2, 2, 200.0, '2025-06-12'),
(3, 3, 3, 150.0, '2025-06-10'),
(4, 5, 5, 100.0, '2025-06-09'),
(5, 6, 6, 220.0, '2025-06-13'),
(6, 7, 7, 180.0, '2025-06-12'),
(7, 9, 9, 120.0, '2025-06-11'),
(8, 10, 10, 130.0, '2025-06-10'),
(9, 4, 4, 110.0, '2025-06-11'),
(10, 8, 8, 140.0, '2025-06-12');

select * from Payment;

-- Task 2 : Select, Where
 
-- 1.List all customers:
select user_name from users;

-- 2.List all orders for a specific customer:
select * from Courier 
where Sender_name = 'Aarav Shah' or Receiver_name = 'Aarav Shah';

-- 3.List all couriers:
select * from Courier;

-- 4.List all packages for a specific order:
select * from Courier where courierID in (1,2,3,4,5,6,7,8,9,10);

-- 5.List all deliveries for a specific courier:
select * from Courier where Courier_status = 'Delivered' and courierID in (1,2,3,4,5,6,7,8,9,10);

-- 6.List all undelivered packages:
select * from Courier where Courier_status = 'Pending' or Courier_status = 'In Progress';

-- 7.List all packages that are scheduled for delivery today:
select * from Courier where delivery_date = curdate();

-- 8.List all packages with a specific status:
select * from Courier where Courier_status = 'Delivered';
select * from Courier where Courier_status = 'In Progress';
select * from Courier where Courier_status = 'Pending';

-- 9. Calculate the total number of packages for each courier:
-- For Senders
select Sender_name , count(*) from Courier
group by Sender_name;
-- For Receivers
select Receiver_name , count(*) from Courier
group by Receiver_name;

-- Updating Schema 
alter table Courier add Dispatch_date date;
set SQL_SAFE_UPDATES = 0;
update Courier set Delivery_date = null where Courier_status = 'In Progress';
set SQL_SAFE_UPDATES = 1;
select * from Courier;
update Courier set Dispatch_date = '2025-06-08' where CourierID = 1;
update Courier set Dispatch_date = '2025-06-12' where CourierID = 2;
update Courier set Dispatch_date = '2025-06-07' where CourierID = 3;
update Courier set Dispatch_date = null where CourierID = 4;
update Courier set Dispatch_date = '2025-06-07' where CourierID = 5;
update Courier set Dispatch_date = '2025-06-11' where CourierID = 6;
update Courier set Dispatch_date = '2025-06-10' where CourierID = 7;
update Courier set Dispatch_date = null  where CourierID = 8;
update Courier set Dispatch_date = '2025-06-09' where CourierID = 9;
update Courier set Dispatch_date = '2025-06-08' where CourierID = 10;

-- 10.Find the average delivery time for each courier:
select Sender_name, avg(datediff(Delivery_date, Dispatch_date)) as avg_delivery_time
from Courier 
where Delivery_date is not null and Dispatch_date is not null
group by Sender_name;

-- 11.List all packages with a specific weight range:
select * from Courier 
where weight between 2 and 6;

-- 12.Retrieve employees whose names contain 'John':
select emp_name from employee
where emp_name like '%John%';

-- 13. Retrieve all courier records with payments greater than $50.
select c.*, p.Amount from Courier c 
inner join Payment p on c.CourierID = p.CourierID
where Amount > 50;

-- Task 3 : GroupBy, Aggregate Functions, Having, Order By, where

-- 14.Find the total number of couriers handled by each employee.
-- Answered later based on the updation of schema
select e.EmployeeID,e.Emp_name, Count(c.CourierID) as No_of_Couriers from Employee e 
left join Courier c using(EmployeeID)
group by e.EmployeeID
order by 1 asc;

-- 15.Calculate the total revenue generated by each location
select sum(p.Amount) as Total_revenue, l.LocationName from Payment p
join Location l using(LocationID)
group by locationName;

-- 16.Find the total number of couriers delivered to each location:
select Receiver_address as Location, count(*) As Total_Delivered
from Courier where Courier_status = 'Delivered'
group by Receiver_address
order by Total_Delivered desc;

-- 17.Find the courier with the highest average delivery time:
select CourierID, avg(datediff(Delivery_date, Dispatch_date)) as Avg_delivery_time from Courier 
where Delivery_date is not null and Dispatch_date is not null
group by CourierID
order by Avg_delivery_time desc
limit 1;

-- 18.Find Locations with Total Payments Less Than a Certain Amount:
select p.LocationID, l.LocationName, sum(Amount) as Total_payments from Payment p
join Location l using(LocationID)
group by p.LocationID, l.LocationName
having sum(Amount) < 1000
order by 3 asc;

-- 19.Calculate Total Payments per Location:
select p.LocationID, l.LocationName, sum(Amount) as Total_payments from Payment p
join Location l using(LocationID)
group by p.LocationID, l.LocationName
order by 1 asc;

-- Updating Columns
select * from Payment;
update Payment set Amount = 1100 where PaymentID = 5;
update Payment set Amount = 1200 where PaymentID = 6;
update Payment set Amount = 3000 where PaymentID = 2;
update Payment set Amount = 5500 where PaymentID = 3;

-- 20.Retrieve couriers who have received payments totaling more than $1000 in a specific location (LocationID = X):
select p.LocationID, sum(p.Amount) as TotalPayments, p.CourierID, l.LocationName from Payment p
join Location l using(LocationID)
group by p.LocationID, p.CourierID, l.LocationName
having sum(p.Amount) > 1000;

-- 21.Retrieve couriers who have received payments totaling more than $1000 after a certain date (PaymentDate > 'YYYY-MM-DD'): 
select CourierID , sum(Amount) as TotalPayments from Payment 
where PaymentDate > '2025-06-11'
group by CourierID 
having sum(Amount)>1000;

-- 22.Retrieve locations where the total amount received is more than $5000 before a certain date (PaymentDate > 'YYYY-MM-DD'): 
select p.LocationID , l.LocationName , sum(p.Amount) as TotalPayments from Payment p 
join Location l using(LocationID)
where p.PaymentDate < '2025-06-13'
group by p.LocationID , l.LocationName
having sum(p.Amount)>5000;
select * from Payment;

-- Task 4 : Inner Join,Full Outer Join, Cross Join, Left Outer Join,Right Outer Join

-- 23.Retrieve Payments with Courier Information:
select p.PaymentID, c.*, p.Amount, p.PaymentDate from Payment p
inner join Courier c using(CourierID);

-- 24. Retrieve Payments with Location Information
select p.PaymentID,l.*, p.Amount, p.PaymentDate from Payment p
inner join Location l using(LocationID);

-- 25. Retrieve Payments with Courier and Location Information
select p.PaymentID , l.LocationID, l.LocationName, c.*, p.Amount, p.PaymentDate from Location l
inner join Payment p using(LocationID)
inner join Courier c using(CourierID);

-- 26. List all payments with courier details:
select p.PaymentID, c.*, p.Amount, p.PaymentDate from Payment p
inner join Courier c using(CourierID);

-- 27. Total payments received for each courier:
select c.CourierID, c.Sender_name, c.Receiver_name, sum(p.Amount) as TotalPayments from Courier c 
left join Payment p using(CourierID)
group by c.CourierID, c.Sender_name, c.Receiver_name;

-- 28. List payments made on a specific date:
select p.PaymentID,p.CourierID, p.PaymentDate, p.Amount from Payment p
where PaymentDate = '2025-06-13';

-- 29. Get Courier Information for Each Payment:
select p.PaymentID,p.Amount, p.PaymentDate, c.* from Courier c
right join Payment p using(CourierID);

-- 30. Get Payment Details with Location:
select p.PaymentID, l.LocationID, p.Amount, p.PaymentDate, l.LocationName from payment p
inner join Location l using(LocationID); 

-- 31. Calculating Total Payments for Each Courier:
select c.CourierID, c.Sender_name,c.Receiver_name,c.Courier_Status, c.Weight, sum(p.Amount) from payment p
left join Courier c using(CourierID)
group by c.CourierID
order by 1 asc;

-- 32. List Payments Within a Date Range:
select * from Payment 
where PaymentDate between '2025-06-09' and '2025-06-13';

select p.PaymentID , l.LocationID, l.LocationName, c.*, p.Amount, p.PaymentDate from Location l
inner join Payment p using(LocationID)
inner join Courier c using(CourierID)
where p.PaymentDate between '2025-06-09' and '2025-06-13';

-- 33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side:
select u.user_name,'Sender' as Roles, c.* from Courier c
left join users u on u.user_name = c.Sender_name 
union
select u.user_name,'Receiver' as Roles, c.* from Courier c
left join users u on  u.user_name = c.Receiver_name;

-- Updating Schema
select * from Courier;
select * from Courierservices;
select * from Payment
order by courierID asc;
alter table Courier add column ServiceID int;
alter table Courier add constraint fk_service
foreign key (ServiceID) references CourierServices(ServiceID);
update Payment set Amount = 600 where PaymentID = 1;
update Payment set Amount = 400 where PaymentID = 9;
update Payment set Amount = 850 where PaymentID = 4;
update Payment set Amount = 500 where PaymentID = 10;
update Payment set Amount = 1200 where PaymentID = 5;
update Payment set Amount = 1100 where PaymentID = 6;
update Payment set Amount = 950 where PaymentID = 7;
update Payment set Amount = 900 where PaymentID = 8;

update Courier set ServiceID = 2 where CourierID = 1;
update Courier set ServiceID = 6  where CourierID = 2;
update Courier set ServiceID = 10 where CourierID = 3;
update Courier set ServiceID = 1 where CourierID = 4;
update Courier set ServiceID = 3 where CourierID = 5;
update Courier set ServiceID = 5 where CourierID = 6; 
update Courier set ServiceID = 8 where CourierID = 7;
update Courier set ServiceID = 9 where CourierID = 8;
update Courier set ServiceID = 7 where CourierID = 9;
update Courier set ServiceID = 4 where CourierID = 10;

-- 34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side:
select  c.*, cs.* from Courier c
left join CourierServices cs on c.ServiceID = cs.ServiceID
union 
select c.*, cs.* from CourierServices cs
left join Courier c on c.ServiceID = cs.ServiceID;

-- 35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side
select e.EmployeeID, e.Emp_name, p.PaymentID, p.Amount from Employee e 
left join Courier c using(EmployeeID)
left join Payment p using(CourierID)
union 
select e.EmployeeID, e.Emp_name, p.PaymentID, p.Amount from Employee e  
right join Courier c using(EmployeeID)
right join Payment p using(CourierID);

-- 36. List all users and all courier services, showing all possible combinations.
select u.user_name, cs.* from users u
cross join CourierServices cs;

-- 37. List all employees and all locations, showing all possible combinations:
select e.*, l.* from Employee e 
cross join Location l;

-- 38. Retrieve a list of couriers and their corresponding sender information (if available):
select c.CourierID, c.Sender_name, c.Sender_address,u.Email,u.ContactNumber, c.Weight, c.Courier_status, c.Delivery_date, C.Dispatch_date,c.Tracking_number 
from Courier c
left join users u on c.Sender_name = u.user_name;

-- 39. Retrieve a list of couriers and their corresponding receiver information (if available):
select c.CourierID, c.Receiver_name, c.Receiver_address,u.Email,u.ContactNumber, c.Weight, c.Courier_status, c.Delivery_date, C.Dispatch_date,c.Tracking_number 
from Courier c
left join users u on c.Receiver_name = u.user_name;

-- 40. Retrieve a list of couriers along with the courier service details (if available):
select c.CourierID, c.Sender_name, c.Sender_address,c.Receiver_name, c.Receiver_address, c.Weight, c.Courier_status, c.Delivery_date, C.Dispatch_date,c.Tracking_number, c.ServiceID,cs.ServiceName
from Courier c
left join CourierServices cs on c.ServiceID = cs.ServiceID;

-- Updating Schema
alter table Courier add EmployeeID int;
alter table Courier add constraint fk_EmployeeID
foreign key (EmployeeID) references Employee(EmployeeID);
update Courier set EmployeeID = 3 where CourierID = 1; 
update Courier set EmployeeID = 2 where CourierID = 2;
update Courier set EmployeeID = 4 where CourierID = 3;
update Courier set EmployeeID = 5 where CourierID = 4;
update Courier set EmployeeID = 6 where CourierID = 5;
update Courier set EmployeeID = 9 where CourierID = 6;
update Courier set EmployeeID = 10 where CourierID = 7;
update Courier set EmployeeID = 5 where CourierID = 8;
update Courier set EmployeeID = 3 where CourierID = 9;
update Courier set EmployeeID = 4 where CourierID = 10;
select * from Courier;

-- 41. Retrieve a list of employees and the number of couriers assigned to each employee:
select e.EmployeeID,e.Emp_name, Count(c.CourierID) as No_of_Couriers from Employee e 
left join Courier c using(EmployeeID)
group by e.EmployeeID
order by 1 asc;

-- 42. Retrieve a list of locations and the total payment amount received at each location:
select l.LocationID, sum(p.Amount) as TotalPayments, l.LocationName from payment p
inner join Location l using(LocationID)
group by l.LocationID, l.LocationName
order by 1 asc; 

-- 43. Retrieve all couriers sent by the same sender (based on SenderName).
select * from Courier;
select c.CourierID, c.Sender_name,c.Weight, c.Courier_status, c.Delivery_date, C.Dispatch_date,c.Tracking_number, c.ServiceID from Courier c
where c.Sender_name = 'Aarav Shah';

-- 44. List all employees who share the same role.
select e1.EmployeeID, e1.emp_name, e1.Emp_role from Employee e1
join(select Emp_role from Employee group by Emp_role having count(*) >1) shared_roles on e1.Emp_role = shared_roles.Emp_role
order by e1.Emp_role;

-- 45. Retrieve all payments made for couriers sent from the same location.
select p.PaymentID, p.CourierID,c.Sender_name,p.LocationID, l.LocationName from Courier c 
join Payment p using(CourierID)
join Location l using(LocationID)
where c.Sender_address = 'Delhi';

-- 46. Retrieve all couriers sent from the same location (based on SenderAddress).
select * from Courier;
select c.CourierID, c.Sender_address,c.Weight, c.Courier_status, c.Delivery_date, C.Dispatch_date,c.Tracking_number, c.ServiceID from Courier c
where c.Sender_address = 'Chennai';

-- 47. List employees and the number of couriers they have delivered:
select e.EmployeeID, e.Emp_name, count(c.CourierID) as No_of_couriers from Employee e 
left join  Courier c on c.EmployeeID = e.EmployeeID and c.Courier_Status = 'Delivered'
group by e.EmployeeID
order by 1 asc;

-- 48. Find couriers that were paid an amount greater than the cost of their respective courier services
select p.PaymentID, p.CourierID, p.Amount as PaidAmount, cs.Cost
from Payment p
join Courier c on p.CourierID = c.CourierID
join CourierServices cs on c.ServiceID = cs.ServiceID
where p.Amount > cs.Cost;

-- Scope : Inner Queries, Non Equi Joins, Equi joins,Exist,Any,All

-- 49. Find couriers that have a weight greater than the average weight of all couriers:
select CourierID, Weight from Courier
where Weight > (select avg(Weight) from Courier);

-- 50. Find the names of all employees who have a salary greater than the average salary:
select Emp_name from Employee
where Salary > (select avg(Salary) from Employee);

-- 51. Find the total cost of all courier services where the cost is less than the maximum cost:
select ServiceID, Cost from CourierServices
where Cost < (select max(Cost) from CourierServices);

-- 52. Find all couriers that have been paid for
Select CourierID, Sender_name, Receiver_name from Courier 
where CourierID in (select CourierID from Payment);

-- 53. Find the locations where the maximum payment amount was made:
select l.LocationName, p.PaymentID, p.Amount from Payment p 
inner join Location l using(LocationID)
where p.Amount = (Select max(Amount) from Payment);

-- 54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName'):
select * from courier 
where Weight > all (select Weight from Courier where sender_name = 'Diya Mehra');







