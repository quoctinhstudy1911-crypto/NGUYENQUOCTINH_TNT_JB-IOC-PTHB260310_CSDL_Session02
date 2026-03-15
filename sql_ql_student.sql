--                       [ Khá ] Thực hành thiết kế cơ sở dữ liệu quản lý sinh viên

-- Tạo database UniversityDB
create database UniversityDB;

-- Trong database, tạo schema university
create schema university;

-- Trong schema, tạo 2 bảng:
	-- Students:
		-- student_id (số nguyên, khóa chính, tự tăng)
		-- first_name (chuỗi, tối đa 50 ký tự, không null)
		-- last_name (chuỗi, tối đa 50 ký tự, không null)
		-- birth_date (ngày)
		-- email (chuỗi, không null, duy nhất)
create table university.Students (
	student_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	birth_date date,
	email varchar(100) not null unique
);

	-- Courses:
		-- course_id (số nguyên, khóa chính, tự tăng)
		-- course_name (chuỗi, tối đa 100 ký tự, không null)
		-- credits (số nguyên)
create table university.Courses(
	course_id serial primary key,
	course_name varchar(100) not null,
	credits int
);

--Tạo bảng phụ Enrollments để lưu thông tin sinh viên đăng ký khóa học:
	-- enrollment_id (số nguyên, khóa chính, tự tăng)
	-- student_id (khóa ngoại tham chiếu Students)
	-- course_id (khóa ngoại tham chiếu Courses)
	-- enroll_date (ngày đăng ký)
create table university.Enrollments(
	enrollment_id serial primary key,
	student_id int references university.Students(student_id),
	course_id int references university.Courses(course_id),
	enroll_date date
);

-- Thực hành các câu lệnh:
	-- Xem danh sách database
select datname
from pg_database;

	-- Xem danh sách schema
select schema_name 
from information_schema.schemata;

	-- Xem cấu trúc bảng Students, Courses, Enrollments
select column_name, data_type
from information_schema.columns
where table_schema = 'university'
and table_name in ('students','courses','enrollments');


















