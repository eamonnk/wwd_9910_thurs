-- SELECT * FROM public.student
-- ORDER BY student_number ASC 

/*

insert into STUDENT (student_number, first_name, surname, dob, prog_code)
values ('D020150120', 'James', 'Smith', to_date('19/01/1995', 'DD/MM/YYYY'), 'TU256');

insert into STUDENT (student_number, first_name, surname, dob, prog_code)
values ('D020150121', 'John', 'Brown', to_date('18/09/1987', 'DD/MM/YYYY'), 'TU256');

insert into STUDENT (student_number, first_name, surname, dob, prog_code)
values ('D020150122', 'Patricia', 'Wilson', to_date('04/10/1973', 'DD/MM/YYYY'), 'TU256');

insert into STUDENT (student_number, first_name, surname, dob, prog_code)
values ('D020150123', 'Karen', 'Davies', to_date('28/12/2000', 'DD/MM/YYYY'), 'TU256');
*/

-- select * from public.student
-- order by student_number desc

-- select first_name from student where prog_code = 'TU256';
-- select first_name from student where first_name like 'J%';
-- select * from student where student_number = 'D020150123';

/*
update STUDENT
set prog_code = 'TU059'
where student_number = 'D24127620';
*/
-- select * from student where student_number = 'D24127620';


-- delete from STUDENT where student_number = 'D020150123';
-- delete from STUDENT where first_name like 'D%';
-- select * from STUDENT;
-- INSERT
-- insert into STUDENT (student_number, first_name, surname, dob, prog_code)
-- values ('D24127620', 'eamonn', 'kelly', to_date('17/09/1973', 'DD/MM/YYYY'), 'TU060');

-- SELECT * FROM public.course_codes

-- update STUDENT
-- set 
-- 	prog_code = 'TU061',
-- 	dob = to_date('18/09/1974', 'DD/MM/YYYY')
-- where student_number = 'D24127620';

-- Create the table
--CREATE TABLE course_codes (
--	course_id VARCHAR(10) PRIMARY KEY,
--	course_code VARCHAR(10),
--	course_desc VARCHAR(100)
--);

/*
insert into course_codes (course_id, course_code, course_desc)
values ('10', 'TU099', 'A very good course');

insert into course_codes (course_id, course_code, course_desc)
values ('11', 'TU098', 'A very not bad course');

insert into course_codes (course_id, course_code, course_desc)
values ('12', 'TU097', 'A very maybe alright  course');

insert into course_codes (course_id, course_code, course_desc)
values ('13', 'TU096', 'A very terrible course');
*/

--ALTER TABLE course_codes
--ADD COLUMN full_part_time BOOLEAN;

-- SELECT * FROM public.course_codes

/*
UPDATE course_codes
SET full_part_time = TRUE
WHERE course_code = 'TU099';

UPDATE course_codes
SET full_part_time = FALSE
WHERE course_code = 'TU098';

UPDATE course_codes
SET full_part_time = TRUE
WHERE course_code = 'TU097';

UPDATE course_codes
SET full_part_time = FALSE
WHERE course_code = 'TU096';
*/

-- select * from student
-- alter table student
-- add column course_id VARCHAR(10)

/*
ALTER TABLE student
ADD CONSTRAINT fk_student_course
FOREIGN KEY (course_id)
REFERENCES course_codes(course_id);
*/

/*
update STUDENT
set course_id = '13'
where student_number = 'D020150120';
*/
/*
SELECT 
    CONCAT(s.first_name, ' ', s.surname) AS student_name,
    s.dob,
    c.course_desc AS course_description
FROM student s
JOIN course_codes c
    ON s.course_id = c.course_id;
*/
/*
Select 
	CONCAT(student.first_name, ' ', student.surname) AS student_name,
	student.dob,
	course_codes.course_desc
FROM student
INNER JOIN course_codes on student.course_id = course_codes.course_id
*/

SELECT 
    course_codes.course_desc,
    COUNT(student.student_number) as num_students
FROM course_codes
INNER JOIN student on course_codes.course_id = student.course_id
GROUP BY course_codes.course_desc


/*
SELECT 
    course_codes.course_desc,
    COUNT(student.student_number) as num_students
FROM student
INNER JOIN course_codes on student.course_id = course_codes.course_id
GROUP BY course_codes.course_desc
*/
