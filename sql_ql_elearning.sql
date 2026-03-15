--                              [ Giỏi ] Hệ thống quản lý học tập trực tuyến

-- Tạo database và schema
	-- Database: ElearningDB
create database ElearningDB;
	-- Schema: elearning
create schema elearning;
-- Tạo các bảng và cột
/* 
Bảng Students (sinh viên)
student_id: số nguyên tự tăng, khóa chính
first_name: tên, tối đa 50 ký tự, không bỏ trống
last_name: họ, tối đa 50 ký tự, không bỏ trống
email: email sinh viên, không trùng nhau, không bỏ trống
*/
create table elearning.Students(
	student_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(100) not null unique
);

/* 
Bảng Instructors (giảng viên)
instructor_id: số nguyên tự tăng, khóa chính
first_name: tên, tối đa 50 ký tự, không bỏ trống
last_name: họ, tối đa 50 ký tự, không bỏ trống
email: email giảng viên, không trùng nhau, không bỏ trống
*/
create table elearning.Instructors(
	instructor_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(100) not null unique
);

/* 
Bảng Courses (khóa học)
course_id: số nguyên tự tăng, khóa chính
course_name: tên khóa học, tối đa 100 ký tự, không bỏ trống
instructor_id: khóa ngoại liên kết với giảng viên
*/
create table elearning.Courses(
	course_id serial primary key,
	course_name varchar(100) not null,
	instructor_id int references elearning.Instructors(instructor_id)
);

/* 
Bảng Enrollments (đăng ký học, n-m giữa Students và Courses)
enrollment_id: số nguyên tự tăng, khóa chính
student_id: khóa ngoại tham chiếu Students
course_id: khóa ngoại tham chiếu Courses
enroll_date: ngày đăng ký, không bỏ trống
*/
create table elearning.Enrollments(
	enrollment_id serial primary key,
	student_id int references elearning.Students(student_id),
	course_id int references elearning.Courses(course_id),
	enroll_date date not null
);

/* 
Bảng Assignments (bài tập trong khóa học)
assignment_id: số nguyên tự tăng, khóa chính
course_id: khóa ngoại tham chiếu Courses
title: tiêu đề bài tập, tối đa 100 ký tự, không bỏ trống
due_date: ngày hết hạn, không bỏ trống
*/
create table elearning.Assignments(
	assignment_id serial primary key,
	course_id int references elearning.Courses(course_id),
	title varchar(100) not null,
	due_date date not null
);


/* 
Bảng Submissions (nộp bài của sinh viên)
submission_id: số nguyên tự tăng, khóa chính
assignment_id: khóa ngoại tham chiếu Assignments
student_id: khóa ngoại tham chiếu Students
submission_date: ngày nộp bài, không bỏ trống
grade: điểm, số thực từ 0 đến 100
*/
create table elearning.Submissions(
	submission_id serial primary key,
	assignment_id int references elearning.Assignments(assignment_id),
	student_id int references elearning.Students(student_id),
	submission_date date not null,
	grade decimal(5,2) check (grade >= 0 and grade <= 100)
);












