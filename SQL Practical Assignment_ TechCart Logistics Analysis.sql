create database TechCart_Logistics;
show databases;
use TechCart_Logistics;
create table Orders(order_id int,customer_name varchar(50),device varchar(50),category varchar(30),quantity int,unit_price decimal(10,2),city varchar(30),payment_method varchar(30));
set sql_safe_updates=0;

desc orders;
INSERT INTO Orders (Order_ID, Customer_Name, Device, Category, Quantity, Unit_Price, City,
Payment_Method) VALUES (101, 'Aarav Sharma', 'Smartwatch Pro', 'Wearables', 2, 4500.00,
'Ahilyanagar', 'UPI'), (102, 'Pooja Patil', 'Wireless Earbuds', 'Audio', 5, 1800.00, 'Pune',
'Credit Card'), (103, 'Rohan Deshmukh', 'Bluetooth Speaker', 'Audio', 1, 3200.00, 'Mumbai',
'COD'), (104, 'Ananya Joshi', 'Tablet 10-inch', 'Computing', 1, 22000.00, 'Nashik', 'Net
Banking'), (105, 'Kunal Shinde', 'Fitness Band', 'Wearables', 4, 2100.00, 'Pune', 'UPI'), (106,
'Snehal Kadam', 'Wireless Earbuds', 'Audio', 3, 1800.00, 'Ahilyanagar', 'UPI'), (107, 'Vikas
More', 'Mechanical Keyboard', 'Computing', 2, 3500.00, 'Chhatrapati Sambhajinagar', 'Credit
Card'), (108, 'Neha Thorat', 'Smartwatch Pro', 'Wearables', 1, 4500.00, 'Mumbai', 'COD'), (109,
'Tanmay Pawar', 'Gaming Headset', 'Audio', 2, 4200.00, 'Pune', 'UPI'), (110, 'Priya Jagtap',
'Tablet 10-inch', 'Computing', 2, 21500.00, 'Mumbai', 'Credit Card'), (111, 'Saurabh Gaikwad',
'Wireless Mouse', 'Computing', 6, 750.00, 'Nashik', 'UPI'), (112, 'Aditi Kulkarni', 'Bluetooth
Speaker', 'Audio', 3, 3100.00, 'Pune', 'COD'), (113, 'Nitin Chavan', 'Power Bank 20k',
'Accessories', 5, 1600.00, 'Chhatrapati Sambhajinagar', 'UPI'), (114, 'Swati Salunke', 'Fitness
Band', 'Wearables', 2, 2100.00, 'Ahilyanagar', 'Credit Card'), (115, 'Akash Kale', 'Smartwatch
Pro', 'Wearables', 3, 4400.00, 'Pune', 'Net Banking'), (116, 'Rutuja Bhise', 'Gaming Headset',
'Audio', 1, 4200.00, 'Nashik', 'COD'), (117, 'Omkar Wagh', 'Mechanical Keyboard', 'Computing', 3,
3400.00, 'Mumbai', 'UPI'), (118, 'Shraddha Gite', 'Power Bank 20k', 'Accessories', 4, 1550.00,
'Pune', 'UPI'), (119, 'Pratik Sonawane', 'Wireless Mouse', 'Computing', 8, 700.00, 'Ahilyanagar',
'COD'), (120, 'Divya Nalawade', 'Bluetooth Speaker', 'Audio', 2, 3200.00, 'Chhatrapati
Sambhajinagar', 'Credit Card');
select*from orders;
alter table orders rename column payment_method to payment_mode;
select customer_name,device,unit_price from orders;
select * from orders where city='pune';
select * from orders where category='audio';
select * from orders where unit_price>4000;
select * from orders where quantity>3;
select * from orders where payment_mode='UPI';
select * from orders where unit_price>1500 and unit_price<5000;
select * from orders where city='ahilyanagar' or city='pune';
select * from orders where payment_mode='UPI';
select * from orders where device like '%speaker%';
select * from orders where device like '%speaker%';
select * from orders order by unit_price desc;
select * from orders order by unit_price desc limit 4;
update orders set city='pune' where order_id=103;
update orders set unit_price=unit_price+800 where device='Wireless Mouse';
update orders set payment_mode='UPI' where order_id=114;
update orders set unit_price=unit_price*5/100 where category='computing';
update orders set unit_price=unit_price*20 where category='computing';
update orders set unit_price=unit_price-unit_price*5/100 where category='computing';
update orders set category='Gaming gear' where device='Gaming Headset';
delete from orders where order_id=116;
delete from orders where payment_mode='cod';
select*from orders;
delete from orders where quantity<2;
delete from orders where category='accessories';
select count(*) from orders;
select sum(quantity) as units from orders;
select avg(unit_price) as avg_price from orders;
select max(unit_price) as max_price from orders;
select min(unit_price) as min_price from orders;
select count(*) as UPL_mode from orders where payment_mode='upi';
select count(quantity) as del_pune from orders where city='pune';
select category,count(quantity) as del_pune from orders group by category;
select city,count(order_id) as total_order from orders group by city;
select category,avg(unit_price) as avg_price from orders group by category;
select payment_mode,count(quantity)as UPI_sold from orders group by payment_mode;
select category,max(unit_price)as max_price from orders group by category;
select city,min(unit_price)as min_price from orders group by city;
select category,max(unit_price)as max_price from orders group by category;
select device,count(*)as units_sold from orders group by device;
select payment_mode,count(*)as num_order from orders group by payment_mode;
select city,category,count(quantity)as units_sold from orders group by city,category;
select device,payment_mode,count(*)as orders from orders group by device,payment_mode;
select*from orders;
select category,sum(quantity) as exceeds from orders group by category having sum(quantity)>10;
select city,sum(quantity) as more_4 from orders group by city having sum(quantity)>4;
select payment_mode,count(quantity) as more_4 from orders group by payment_mode having count(quantity)>4; 
select category,avg(unit_price) as more_3000 from orders group by category having avg(unit_price)>3000 ; 
select device,sum(quantity) as order_6 from orders group by device having sum(quantity)>6; 
select city,sum(quantity) as delivered_8 from orders group by city having sum(quantity)>8;
select payment_mode,sum(quantity) as more_12 from orders group by payment_mode having sum(quantity)>12; 
select city,avg(unit_price) as avg_price from orders group by city having avg(unit_price)>3500 ; 
select payment_mode,max(unit_price) as max_price from orders group by payment_mode having max(unit_price)>1500; 


