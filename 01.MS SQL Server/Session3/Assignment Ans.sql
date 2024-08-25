
--1. List all products with their respective categories and brands.
select pro.product_name,bra.brand_name,cat.category_name from production.products pro
join production.categories cat on pro.category_id = cat.category_id 
join production.brands bra on pro.brand_id = bra.brand_id

-- 2. Find the total quantity of each product sold.
select pro.product_id,pro.product_name,Sum(ord.quantity) from production.products pro 
join sales.order_items ord on ord.product_id = pro.product_id
group by pro.product_id,pro.product_name

-- 3. Get the list of customers who have placed orders along with the store where they placed the order.
select cus.first_name, ord.* , sto.store_name from sales.customers cus 
join sales.orders ord on cus.customer_id = ord.customer_id
join sales.stores sto on sto.store_id = ord.store_id

-- 4. Find the total sales amount for each store.
select sto.store_id, count(ord.order_id) from sales.stores sto 
join sales.orders ord on ord.store_id = sto.store_id 
group by sto.store_id

-- 5. Retrieve the details of orders along with the customer name, store name, and the staff who processed the order.
select ord.*, cus.first_name 'customer', sto.store_name, sta.first_name 'staff name' from sales.orders ord 
join sales.customers cus on cus.customer_id = ord.customer_id
join sales.stores sto on sto.store_id = ord.store_id
join sales.staffs sta on ord.staff_id = sta.staff_id 

-- 6. Get the list of products that have never been ordered.
select * from production.products pro
where pro.product_id not in (select distinct product_id from sales.order_items)

select * from production.products pro
left join sales.order_items ord on pro.product_id = ord.product_id
where ord.product_id is null

-- 7. Find the average price of products in each category.
select category_name,AVG(list_price) from production.categories cat 
join  production.products pro on cat.category_id = pro.category_id
group by cat.category_name

-- 8. List all products along with their current stock quantities.
select pro.product_name, sto.quantity from production.products pro
join production.stocks sto on sto.product_id = pro.product_id


-- 9. Find the number of orders placed by each customer.
select cus.customer_id, COUNT(cus.customer_id) 'Number of orders'from sales.customers cus 
join sales.orders ord on cus.customer_id = ord.customer_id
group by cus.customer_id

-- 10. Get the total number of distinct products sold by each store.
select sto.store_id,store_name,COUNT(pro.product_id)'Number of sold products' from sales.stores sto 
join sales.orders ord on sto.store_id = ord.store_id
join sales.order_items orditem on ord.order_id = orditem.order_id
join production.products pro on pro.product_id = orditem.product_id
group by sto.store_id,store_name




-- 1. List all products along with their categories. Include products that do not belong to any category.
select * from production.products pro 
left join production.categories cat on pro.category_id = cat.category_id

-- 2. Find the total quantity of each product sold. Include products that have never been sold.
select pro.product_id,sum(ord.quantity) 'Quantity Sold'from production.products pro 
left join sales.order_items ord on ord.product_id =pro.product_id
group by pro.product_id

-- 3. Retrieve the details of all orders along with the customer name. Include orders placed by customers who are not yet registered.
select ord.*,cus.first_name from sales.orders ord 
left join sales.customers cus on ord.customer_id = cus.customer_id

-- 4. List all staff members along with the store they are assigned to. Include staff members who are not currently assigned to any store
select * from  sales.staffs sta 
left join sales.stores sto on sta.store_id = sto.store_id

--5. Find the average rating of products in each category. Include categories that do not have any products yet.
select * /*cat.category_id,cat.category_name,Avg()*/ from production.categories cat 
left join production.products pro on cat.category_id  = pro.category_id
--Group by cat.category_id,cat.category_name


-- 6. Get the list of all customers along with the total number of orders they have placed.Include customers who have not placed any orders.
select cus.customer_id, cus.first_name, COUNT(ord.order_id) 'Total orders' from sales.customers cus 
join sales.orders ord on cus.customer_id = ord.customer_id
group by cus.customer_id, cus.first_name
