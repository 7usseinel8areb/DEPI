--Select
--Q1
select * from production.products

--Q2
select product_name,list_price from production.products

--Q3
select distinct category_id from production.products

--Q4
select first_name + ' ' + last_name as 'Full Name' from sales.customers;


--Select Top
--Q5
select top(5)* from production.products
order by list_price desc



--Filtering using where
--Q6
select * from production.products
where list_price > 100

--Q7
select * from sales.customers
where city = 'New York'

--Q8
select * from sales.orders
where order_status = 1



--Ordering
--Q9
select * from production.products
order by list_price desc

--Q10
select * from sales.customers
order by last_name,first_name



--Grouping
--Q11
select sum(list_price) 'Sum of list price' from production.products
group by category_id

--Q12
select count(*) 'Total orders' from sales.orders
group by customer_id



--Having
--Q13
select sum(list_price) 'Sum of list price' from production.products
group by category_id
having sum(list_price) > 500



--Insertions
--Q14
insert into production.brands(brand_name) values('BrandX')

--Q15
insert into production.categories(category_name) values('Electronics')

--Q16
insert into sales.customers(first_name,last_name,phone,email, street, city , [state], zip_code)
values ('Alice','Johnson', '987-654-3210','alice.johnson@example.com', '456 Elm St', 'Othertown', 'TX', '54321')

--Q17
insert into sales.stores( [store_name], phone , email, street, city, [state], [zip_code]  ) 
values ('Tech Store', '555-123-4567', 'contact@techstore.com','789 Tech Ave','Techville', 'CA', '67890')

--Q18
insert into sales.staffs([first_name] ,[last_name] , email , phone,active , store_id , manager_id)
 values('Bob','Smith','bob.smith@example.com','555-987-6543',1,1,NULL)



 --Updates 
 --Q19
 update production.products set list_price = 119.99
 where product_id = 1

 --Q20
 update sales.customers set email = 'new.email@example.com'
 where customer_id = 2

 --Q21
 update sales.stores set phone =  '123-456-7890'
 where store_id = 3

 --Q22
 update production.categories set category_name = 'Home Appliances'
 where category_id = 2

 --Q23
update sales.staffs set active = 0
where store_id = 1



--Deletions
--Q24
delete from production.brands
where brand_id = 2

--Q25
delete from production.categories
where category_id = 3

--Q26
delete from sales.customers
where customer_id = 4

--Q27
delete from sales.stores
where store_id = 5

--Q28
delete from sales.staffs
where staff_id = 6 --Conflict



-- Additional Complex DML Questions
--Q29
insert into sales.orders(customer_id , order_status , order_date, required_date, shipped_date , store_id, staff_id )
values(1,1,'2024-07-01', '2024-07-10',NULL,1,1)

--Q30
update sales.orders set shipped_date = '2024-07-05'
where order_id = 1

--Q31
delete from sales.orders 
where order_status = 3

--Q32
insert into production.products(product_name,model_year,list_price,category_id,brand_id)
values ('test1',2024,200.33,1,1),('test2',2023,220.50,2,3)

--Q33
update production.stocks set quantity = 0
where store_id = 1