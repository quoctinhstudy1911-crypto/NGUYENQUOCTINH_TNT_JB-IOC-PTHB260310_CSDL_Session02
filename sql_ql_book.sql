--                                 [ Khá ] Tạo cơ sở dữ liệu và bảng quản lý sách

-- 1. Tạo một database có tên LibraryDB
create database LibraryDB;

-- 2. Trong database LibraryDB, tạo schema có tên library
create schema library;

-- 3. Trong schema library, tạo bảng Books với các cột sau:
	-- a. book_id (số nguyên, khóa chính, tự tăng)
	-- b.title (chuỗi, tối đa 100 ký tự, không được null)
	-- c.author (chuỗi, tối đa 50 ký tự, không được null)
	-- d.published_year (số nguyên)
	-- e.price (số thực)

create table library.Books (
	book_id serial primary key,
	title varchar(100) not null,
	author varchar(50) not null,
	published_year int,
	price float
);
-- 4. Thực hành các câu lệnh:
	--a.Xem tất cả các database
SELECT datname FROM pg_database;
	--b.Xem tất cả các schema trong database
	
SELECT schema_name
FROM information_schema.schemata;

	--c.Xem cấu trúc bảng Books
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'books';







	