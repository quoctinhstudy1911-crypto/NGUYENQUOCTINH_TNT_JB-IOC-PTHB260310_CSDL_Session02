--                      [ Giỏi ] Thiết kế hệ thống quản lý bán hàng

-- Tạo database và schema
	-- Database: SalesDB
create database SalesDB;

	-- Schema: sales (giúp nhóm các bảng lại với nhau)
create schema sales;

-- Tạo các bảng và cột
/* 
	Bảng Customers (khách hàng)
customer_id: số nguyên tự tăng, khóa chính
first_name: tên, tối đa 50 ký tự, không được bỏ trống
last_name: họ, tối đa 50 ký tự, không được bỏ trống
email: email khách hàng, không trùng nhau, không được bỏ trống
phone: số điện thoại (có thể bỏ trống)
*/
create table sales.Customers(
	customer_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(100) not null unique,
	phone char(10)
);

/*
	Bảng Products (sản phẩm)
product_id: số nguyên tự tăng, khóa chính
product_name: tên sản phẩm, tối đa 100 ký tự, không bỏ trống
price: giá sản phẩm, kiểu số thực, không bỏ trống
stock_quantity: số lượng còn trong kho, kiểu số nguyên, không bỏ trống
*/
	create table sales.Products(
	product_id serial primary key,
	product_name varchar(100) not null,
	price float not null,
	stock_quantity int not null
);

/*
	Bảng Orders (đơn hàng)
order_id: số nguyên tự tăng, khóa chính
customer_id: tham chiếu đến khách hàng (khóa ngoại)
order_date: ngày đặt hàng, không được bỏ trống
*/
create table sales.Orders(
	order_id serial primary key,
	customer_id int references sales.Customers(customer_id),
	order_date date not null
);

/*
	Bảng OrderItems (chi tiết đơn hàng, mỗi đơn hàng có nhiều sản phẩm)
order_item_id: số nguyên tự tăng, khóa chính
order_id: tham chiếu đến bảng Orders (khóa ngoại)
product_id: tham chiếu đến bảng Products (khóa ngoại)
quantity: số lượng sản phẩm trong đơn, không được nhỏ hơn 1
*/

create table sales.OrderItems(
	order_item_id serial primary key,
	order_id int references sales.Orders(order_id),
	product_id int references sales.Products(product_id),
	quantity int check( quantity>=1)
);

















