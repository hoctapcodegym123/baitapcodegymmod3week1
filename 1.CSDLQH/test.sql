create database C0322G1;
create table student(
	id int,
    nam varchar(255),
    age int,
    address varchar(255),
    gender varchar(50)
);

alter table student add column class varchar(50);
insert into student values(1,'Hải','18','HN','nam','C0322G1');