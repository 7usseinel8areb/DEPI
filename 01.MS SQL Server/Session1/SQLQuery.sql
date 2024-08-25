create database [Online Shopping];
Go

using [Online Shopping];
Go

create schema production;
Go

create schema sales;
Go


create table production.categories (
	category_id int primary key identity(1,1),
	category_name varchar(100) not null
);
Go

create table production.brands(
	brand_id int primary key identity(1,1),
	brand_name varchar(100) not null
);
Go


create table production.products(
	product_id int primary key identity(1,1),
	product_name varchar(100) not null ,
	brand_id int,
	category_id int,
	model_year smallint not null,
	list_price decimal(10,2) not null

	foreign key (brand_id) references production.brands(brand_id) on delete cascade on update cascade,
	foreign key (category_id) references production.categories(category_id) on delete cascade on update cascade
);
Go


create table sales.customer(
	customer_id int primary key identity(1,1),
	first_name varchar(100) not null,
	last_name varchar(100) not null,
	phone char(11),
	email varchar(250) not null,
	street varchar(250),
	city varchar(250),
	[state] varchar(250),
	zip_code varchar(5)
);
Go


create table sales.store(
	store_id int primary key identity(1,1),
	store_name varchar(250) not null,
	phone char(11),
	email varchar(250),
	street varchar(250),
	city varchar(250),
	[state] varchar(250),
	zip_code varchar(5)
);
Go

CREATE TABLE sales.staffs (
    staff_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone CHAR(11),
    email VARCHAR(250) NOT NULL,
    active BIT NOT NULL,
    store_id INT,
    manager_id INT,

    FOREIGN KEY (store_id) REFERENCES sales.store(store_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (manager_id) REFERENCES sales.staffs(staff_id) 
);
GO

create table production.stocks(
	store_id int,
	product_id int,
	quantity int ,
	[primary] as (store_id+product_id) persisted primary key,

	foreign key (store_id) references sales.store(store_id) on delete cascade on update cascade,
	foreign key (product_id) references production.products(product_id) on delete cascade on update cascade,
);
Go



create table sales.orders (
	order_id int primary key identity(1,1),
	order_status tinyint not null,
	order_date date not null,
	required_date date not null,
	shipped_date date,
	store_id int,
	staff_id int,
	customer_id int,

	foreign key (store_id) references sales.store(store_id) on delete cascade on update cascade,
	foreign key (staff_id) references sales.staffs(staff_id) on delete no action on update no action,
	foreign key (customer_id) references sales.customer(customer_id) on delete no action on update no action,
);
Go


create table sales.order_items(
	order_id int ,
	item_id int ,
	quantity int not null,
	list_price decimal(10,2) not null,
	discount decimal(4,2),
	product_id int,

	foreign key (product_id) references production.products(product_id) on delete cascade on update cascade,
	foreign key (order_id) references sales.orders(order_id) on delete cascade on update cascade,
	[primary] as (order_id + item_id) persisted primary key
);
Go