use techcart_logistics;
create table Services(servise_id int primary key,customer_name varchar(50) not null,vehicle_model varchar(40) not null,service_type varchar(30) not null,
Parts_Replaced int check (Parts_Replaced>0),Total_bill decimal(10,2) check (total_bill>0),Branch_city varchar(35) not null,Payment_Mode varchar(20)  default'UPI',
Lead_Mechanic varchar(40) not null);
select * from Services;
alter table services rename column vehicl0_model to  Vehicle_Model; 
INSERT INTO Services (Service_ID, Customer_Name, Vehicle_Model, Service_Type, Parts_Replaced, Total_Bill, Branch_City,
Payment_Mode, Lead_Mechanic) VALUES
(201, 'Nilesh Deshmukh', 'Mahindra Thar', 'Engine Overhaul', 5, 28500.00, 'Ahilyanagar', 'Credit Card', 'Tanmay'),
(202, 'Priyanka Shinde', 'Hyundai Creta', 'Periodic Maintenance', 3, 6200.00, 'Pune', 'UPI', 'Santosh'),
(203, 'Sanket Patil', 'Tata Nexon EV', 'Electrical Diagnostics', 1, 4800.00, 'Mumbai', 'UPI', 'Rajesh'),
(204, 'Aniket Jadhav', 'Maruti Swift', 'Brake Pad Replacement', 2, 3400.00, 'Nashik', 'Cash', 'Ganesh'),
(205, 'Kavita Kadam', 'Toyota Fortuner', 'Suspension Overhaul', 6, 42000.00, 'Ahilyanagar', 'Net Banking', 'Tanmay'),
(206, 'Mahesh Shirole', 'Kia Seltos', 'Periodic Maintenance', 2, 5800.00, 'Pune', 'UPI', 'Santosh'),
(207, 'Shubham More', 'Mahindra Scorpio-N', 'Engine Overhaul', 4, 24500.00, 'Chhatrapati Sambhajinagar', 'Credit Card',
'Rajesh'),
(208, 'Sneha Bhalerao', 'Honda City', 'Air Conditioning Service', 2, 7500.00, 'Mumbai', 'UPI', 'Ganesh'),
(209, 'Amol Gaikwad', 'Maruti Brezza', 'Periodic Maintenance', 3, 5200.00, 'Nashik', 'UPI', 'Santosh'),
(210, 'Vaishali Pawar', 'Toyota Innova Crysta', 'Transmission Repair', 7, 36000.00, 'Pune', 'Credit Card', 'Tanmay'),
(211, 'Rohan Jagtap', 'Tata Punch', 'Electrical Diagnostics', 1, 2900.00, 'Ahilyanagar', 'Cash', 'Rajesh'),
(212, 'Pooja Kulkarni', 'Hyundai Venue', 'Brake Pad Replacement', 2, 3800.00, 'Pune', 'UPI', 'Ganesh'),
(213, 'Deepak Salunke', 'Mahindra Thar', 'Periodic Maintenance', 4, 8500.00, 'Chhatrapati Sambhajinagar', 'UPI', 'Santosh'),
(214, 'Pallavi Joshi', 'Maruti Swift', 'Clutch Replacement', 3, 9200.00, 'Mumbai', 'Credit Card', 'Tanmay'),
(215, 'Suresh Sonawane', 'Toyota Fortuner', 'Engine Overhaul', 5, 31000.00, 'Nashik', 'Net Banking', 'Rajesh'),
(216, 'Archana Thorat', 'Tata Nexon', 'Periodic Maintenance', 2, 4900.00, 'Ahilyanagar', 'UPI', 'Santosh'),
(217, 'Gaurav Kale', 'Kia Seltos', 'Air Conditioning Service', 2, 7100.00, 'Pune', 'UPI', 'Ganesh'),
(218, 'Meera Wagh', 'Hyundai Creta', 'Suspension Overhaul', 4, 18500.00, 'Chhatrapati Sambhajinagar', 'Credit Card', 'Tanmay'),
(219, 'Prashant Bhise', 'Honda Elevate', 'Electrical Diagnostics', 1, 3100.00, 'Mumbai', 'UPI', 'Rajesh'),
(220, 'Tejas Nalawade', 'Mahindra Scorpio-N', 'Periodic Maintenance', 3, 7600.00, 'Ahilyanagar', 'Cash', 'Ganesh');
select * from Services;
select customer_name,vehicle_model,total_bill from services;
select * from services where branch_city='Ahilyanagar';
select* from services where service_type='Engine Overhaul';
select*from services where total_bill>15000;
select * from services where Parts_Replaced>=4;
select * from services where Lead_Mechanic='tanmay';
select * from services where total_bill>5000 and total_bill<20000;
select * from services where Branch_city='pune' or Branch_city='Mumbai';
select * from services where vehicle_model like '%thar%' or vehicle_model like '%scorpio%';
select * from services order by total_bill desc;
select * from services order by total_bill limit 5;
update services set Payment_Mode='UPI' where Service_ID=204;
set sql_safe_updates=0;
update services set total_bill=total_bill+total_bill*8/100 where service_type='suspension overhaul';
update services set lead_mechanic='Tanmy' where branch_city='Ahilyanagar' and lead_mechanic='Ganesh';
alter table services add constraint  Parts_Replaced check  (Parts_Replaced <=25);
delete from services where service_id=211;
delete from services where payment_mode='cash';
delete from services where total_bill<3000;
select count(*) as service_log from services;
select sum(total_bill) as total_revenue from services;
select avg(total_bill) as avg_bill from services;
select max(total_bill) as max_bill from services;
select min(total_bill) as min_bill from services;
select count(Payment_Mode) as total_upi from services where payment_mode='upi';
select sum(Parts_Replaced) as Parts_Replaced_pune from services where branch_city='pune';
select avg(total_bill) as avg_bill_maintenance from services where service_type='Periodic Maintenance';
select max(Parts_Replaced) as max_parts_replaced from services;
select min(total_bill) as min_Engine_Overhaul from services where service_type='Engine Overhaul';
select branch_city,max(total_bill) as total_bill from services group by branch_city having max(total_bill>40000);
select service_type,count(service_type) from services group by service_type having count(service_type)>3;
select Lead_Mechanic,count(Lead_Mechanic) from services group by Lead_Mechanic having count(Lead_Mechanic)>4;
select service_type,avg(total_bill)as avg_bill from services group by service_type having avg(total_bill)>10000;
select Vehicle_Model, sum(total_bill) as total_bill from services group by Vehicle_Model having sum(total_bill)>30000;
select branch_city, sum(Parts_Replaced) as total_parts from services group by branch_city  having  sum(Parts_Replaced)>8;
select payment_mode, count(payment_mode) as V_trancation from services group by payment_mode having count(payment_mode)>5;
select Lead_Mechanic, sum(total_bill) as total_bill from services group by Lead_Mechanic having sum(total_bill)>50000;
select branch_city, avg(total_bill) as repair_bill from services group by branch_city having avg(total_bill)>12000;
select service_type, max(total_bill) as max_single_bill from services group by service_type having max(total_bill)>25000;
select branch_city, sum(total_bill) as total_bill from services group by branch_city;
select lead_mechanic,count(service_type) as service_job from services group by Lead_Mechanic;
select service_type, avg(total_bill) as avg_bill from services group by service_type;
select vehicle_model, sum(Parts_Replaced) as parts_replaced from services group by vehicle_model;
select service_type, max(total_bill) as max_bill from services group by service_type;
select branch_city, max(total_bill) as max_bill_city from services group by branch_city;
select payment_mode,count(*) as total_jobs from services group by payment_mode;
select service_type, avg(parts_replaced)as avg_part_repalced from services group by service_type;
select branch_city,service_type, sum(total_bill) as total_revenue from services group by branch_city , service_type;
select Lead_Mechanic, Branch_City, count(*) as service_record from services group by Lead_Mechanic ,Branch_City;

