select * from students;

select * from students where Status= 1;

select * from subject where Credit<10;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
where C.className ='A1';

select S.studentID, S.StudentName, Sub.Subname, M.Mark
FROM Student S join mark M on S.studentid = M.StudentID join Subject Sub on Sub.subid = M.SubID
where Sub.subname = 'CF';