show tables;
select * from bank_loans;
alter table bank_loans rename column Loan_Amountl to Loan_Amount;
alter table bank_loans drop column bank_loanscol;
alter table bank_loans drop column bank_loanscol1;

INSERT INTO Bank_Loans
(Loan_ID, Customer_Name, Age, Gender, City, Loan_Type, Loan_Amount, Interest_Rate, Loan_Tenure,
Loan_Status)
VALUES
(101, 'Rahul Sharma', 28, 'Male', 'Pune', 'Personal', 200000, 12.50, 3, 'Approved'),
(102, 'Priya Patil', 32, 'Female', 'Mumbai', 'Home', 2500000, 8.50, 20, 'Approved'),
(103, 'Amit Verma', 45, 'Male', 'Nashik', 'Business', 800000, 11.00, 5, 'Approved'),
(104, 'Sneha Joshi', 26, 'Female', 'Pune', 'Education', 300000, 9.00, 5, 'Pending'),
(105, 'Rohit Deshmukh', 35, 'Male', 'Nagpur', 'Car', 600000, 9.50, 5, 'Approved'),
(106, 'Pooja Kulkarni', 29, 'Female', 'Mumbai', 'Personal', 150000, 13.00, 2, 'Rejected'),
(107, 'Akash More', 40, 'Male', 'Pune', 'Home', 1800000, 8.75, 15, 'Approved'),
(108, 'Neha Shah', 31, 'Female', 'Nashik', 'Business', 500000, 10.50, 4, 'Pending'),
(109, 'Sagar Pawar', 27, 'Male', 'Nagpur', 'Education', 250000, 9.25, 5, 'Approved'),
(110, 'Riya Mehta', 38, 'Female', 'Mumbai', 'Car', 900000, 10.00, 7, 'Approved'),
(111, 'Kunal Jadhav', 33, 'Male', 'Pune', 'Personal', 350000, 12.00, 4, 'Approved'),
(112, 'Anjali Singh', 24, 'Female', 'Nashik', 'Education', 200000, 8.50, 5, 'Rejected'),
(113, 'Vikram Rao', 42, 'Male', 'Mumbai', 'Business', 1200000, 11.50, 6, 'Approved'),
(114, 'Meera Nair', 30, 'Female', 'Nagpur', 'Home', 2200000, 8.25, 20, 'Pending'),
(115, 'Nikhil Gupta', 36, 'Male', 'Pune', 'Car', 750000, 9.75, 6, 'Approved'),
(116, 'Kavita Pawar', 41, 'Female', 'Mumbai', 'Personal', 400000, 12.75, 3, 'Approved'),
(117, 'Omkar Shinde', 25, 'Male', 'Nashik', 'Education', 180000, 9.00, 4, 'Pending'),
(118, 'Isha Desai', 34, 'Female', 'Pune', 'Business', 650000, 10.75, 5, 'Approved'),
(119, 'Manish Yadav', 39, 'Male', 'Nagpur', 'Home', 1500000, 8.60, 15, 'Rejected'),
(120, 'Aarti Mishra', 28, 'Female', 'Mumbai', 'Car', 550000, 9.80, 5, 'Approved');

alter table bank_loans add column Monthly_Income float;
select * from bank_loans;
alter table bank_loans rename column  Customer_Name to Full_Name;
alter table bank_loans drop column Gender;
alter table bank_loans modify column city varchar(50);
desc bank_loans;
select * from bank_loans;
select Loan_ID,Full_Name, Loan_Type,Loan_Amount from bank_loans;
select * from bank_loans where city='pune';
select * from bank_loans where loan_status='approved';
select * from bank_loans where loan_amount>500000;
select * from bank_loans where age<30;
select * from bank_loans where loan_type='personal';
select * from bank_loans where interest_rate<10;
select * from bank_loans where city='Pune' and loan_status='Approved'; 
select * from bank_loans where loan_amount>500000 and loan_status='Approved'; 
select * from bank_loans where loan_type='car' or loan_type='home';
select * from bank_loans where age>25 and age<35;
select * from bank_loans where loan_status='pending' or  loan_status='Rejected';
set sql_safe_updates=0;
update bank_loans set loan_amount=250000 where full_name='rahul sharma' ;
update bank_loans set loan_status='pending' where full_name='priya patil';
update bank_loans set interest_rate=interest_rate+13.50 where loan_type='personal';
update bank_loans set city='Pune' where full_name='Amit verma';
update bank_loans set loan_tenure=7 where full_name='Rohit Deshmukh';
delete from  bank_loans where full_name='Pooja Kulkarni';
delete from bank_loans where loan_status='rejected';
delete from bank_loans where loan_amount<200000;
select count(*) from bank_loans;
select sum(loan_amount) as total_loan_amount from bank_loans;
select avg(loan_amount) as avg_loan from bank_loans;
select max(loan_amount) as max_loan from bank_loans;
select min(loan_amount) as min_loan from bank_loans;
select max(interest_rate)as highest_int from bank_loans;
select avg(age) as avg_age from bank_loans;
select city,count(*) as loan_record from bank_loans group by city;
select loan_type,sum(loan_amount) as Loan_Amount from bank_loans group by loan_type;
select * from bank_loans;
select loan_status,count(*) as Total_Customers from bank_loans group by loan_status;
select city,avg(loan_amount) as avg_amount from bank_loans group by city;
select loan_type,max(loan_amount) as max_loan from bank_loans group by loan_type;
select loan_type,avg(interest_rate) as avg_interest from bank_loans group by loan_type;
select city,sum(loan_amount) as total_amount from bank_loans where loan_status='approved' group by city;
select loan_type,sum(loan_amount) as total_amount from bank_loans where loan_amount>500000 group by loan_type;
select city,count(*) as loan_record from bank_loans group by city having count(*)>2;
select loan_type,avg(loan_amount) as avg_loan from bank_loans group by loan_type  having avg(loan_amount)>500000;
select loan_type,sum(loan_amount) as total_amount from bank_loans where loan_status='approved' group by loan_type having sum(loan_amount)>=500000;
select loan_status,count(*) from bank_loans where age>25 group by loan_status having count(*)>=3;