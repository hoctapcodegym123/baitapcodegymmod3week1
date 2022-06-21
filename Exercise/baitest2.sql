CREATE DATABASE Test2;
create table subjects(
subjectid int primary key not null auto_increment,
name varchar(50)
);
create table students(
studentid int primary key not null auto_increment,
name varchar(50),
Age int(4),
Email varchar(50)
);
create table classes(
classid int primary key not null auto_increment,
className varchar(30)
);
create table classStudent(
studentid int, foreign key (studentid) references students(studentid),
classid int, foreign key (classid) references classes(classid)
);
create table Mark(
studentid int, foreign key (studentid) references students(studentid),
subjectid int, foreign key (subjectid) references subjects(subjectid),
mark int
);
insert into students value (1,'Nguyen Quang An',18,'an@yahoo.com'),(2,'Nguyen Cong Vinh',20,'vinh@gmail.com'),
(3,'Nguyen Van Quyen',19,'quyen@gmail.com'),(4,'Pham Thanh Binh',25,'Binh@gmail.com'),(5,'Nguyen Van Tai Em',30,'taiem@sport.vn');

insert into classes value (1,'C0706L'),(2,'C0708G');

insert into subjects value (1,'SQL'),(2,'Java'),(3,'C'),(4,'Visual Basic');

insert into classstudent value (1,1),(2,1),(3,2),(4,2),(5,2);

insert into mark value (1,1,8),(1,2,4),(1,3,9),(3,1,7),(4,1,3),(5,2,5),(3,3,8),(5,3,1),(4,2,3);

select * from students;

select * from subjects;

select  Sub.subjectid,sub.Name,M.mark
From mark M join subjects Sub on M.subjectid = Sub.subjectid
 where mark = (select max(mark) from mark);
 
 select mark from mark
 order by mark DESC;
 
 alter table subjects 
  modify name varchar(255);
  update subjects
set name = 'Day la mon hoc ' + name
where subjectid <> null;

alter table students
Modify Age int check(Age>15 and age < 50);

