
CREATE TABLE student (
   id bigserial primary key,
   name varchar(255),
   email varchar(255),
   graduation_year varchar(4)
);


create table course (
	id bigserial primary key,
	name varchar(255),
   	description varchar(255)
);

create table enrollment (
	id bigserial primary key,
	student_id bigint references student(id),
   	course_id bigint references course(id),
   	enrollment_date date
);


insert into student(
	name, email, graduation_year
)values('Ciya' ,'ciya@email.com', '2025'),('Bran' ,'bran@email.com', '2026'),('Kei' ,'kei@email.com', '2025')

insert into course(
	name, description
)values('Basic Programming' ,'learn basic programming'),('Basic Mathematic', 'learn basic mathematic'),('Data Structure' ,'learn data structure'),('Statistic' ,'learn 
statistic'),('Object Oriented Programming' ,'learn OOP');

insert into enrollment(
	student_id, course_id, enrollment_date
) values(1, 1, '2023-04-01'),(1, 2,'2023-04-01'), (1, 3,'2023-04-01'),(1, 4,'2023-04-01'),
(2, 3,'2023-04-02'),(1, 4,'2023-04-02'), (1, 5,'2023-04-02'),
(1, 1,'2023-04-03'),(1, 2,'2023-04-03'), (1, 3,'2023-04-03'),(1, 4,'2023-04-03');


select c.name as course_name,s.name as student_name, s.graduation_year , e.enrollment_date from enrollment e
join student s on e.student_id = s.id
join course c on e.course_id = c.id
order by 1;



