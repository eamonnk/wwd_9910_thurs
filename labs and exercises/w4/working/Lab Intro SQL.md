**Lab SQL Introduction**

1.  **Create tables and populate them**

   1. Install [PostgreSQL](https://www.postgresql.org/download/) and open the **pgAdmin** application  
   2. Open the `students.sql` script available in Brightspace.   
   3. Copy the script in the worksheet and run each command one at a time. Make sure you understand what is happening

2. **Try out some SQL statements**

   1. Insert a record for your own student information  
   2. Query the student record that you just inserted  

'''sql
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

'''
   1. Update your student record changing two of the attributes. These two updates should be done using the one update statement  
   1. Create a table `COURSE_CODES` with the following attributes. You can decide the appropriate name of the table and the data types of each attribute 

      `COURSE_ID` (contains a unique identifier for the course)  
      `COURSE_CODE` (contains the course code e.g. TU256, TU059, TU060 …) `COURSE_DESCRIPTION` (contains a description/name of the course)

'''sql
-- Create the table
--CREATE TABLE course_codes (
--	course_id VARCHAR(10) PRIMARY KEY,
--	course_code VARCHAR(10),
--	course_desc VARCHAR(100)
--);

'''
   5. Insert at least 4 records into the table created in **d** (feel free to make up course codes)

'''sql
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

'''

   6. Modify the table structure to contain a new attribute called `FULL_PART_TIME`. This attribute is to contain a value that indicates if the course is for full-time or part-time students.  

'''sql
ALTER TABLE course_codes
ADD COLUMN full_part_time BOOLEAN;
'''
   1. Update the records in the course codes table to have the correct value for the `FULL_PART_TIME` attribute.  

'''sql
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

'''
   1. Query the `COURSE_CODES` table to verify that the data is correct.  

'''sql
-- SELECT * FROM public.course_codes
''''

   1. Alter the `STUDENT` table to add `COURSE_ID` attribute as a foreign key to the `COURSE_CODES` table.  
'''sql
alter table student
add column course_id VARCHAR(10)

/*
ALTER TABLE student
ADD CONSTRAINT fk_student_course
FOREIGN KEY (course_id)
REFERENCES course_codes(course_id);
'''
   1. Update the `STUDENT` table so each student has a `COURSE_ID`  

''sql


'''
   1. Write a query that joins the STUDENT table with the course codes table, and returns the following

       `Student Name` (this should be one value that combines FIRST\_NAME and SURNAME, separated by a space. You will need to use the [CONCAT](https://www.postgresql.org/docs/9.1/functions-string.html) function)   
       `DOB`  
       `COURSE_DESCRIPTION`

'''sql
Select 
	student.first_name, 
	student.surname,
	student.dob,
	course_codes.course_desc
FROM student
INNER JOIN course_codes on student.course_id = course_codes.course_id

-- with concat
Select 
	CONCAT(student.first_name, ' ', student.surname) AS student_name,
	student.dob,
	course_codes.course_desc
FROM student
INNER JOIN course_codes on student.course_id = course_codes.course_id

'''

   12. Write a query that displays the following: COURSE\_DESCRIPTION: a count of the number of students in each course. You will need to use a COUNT function and a GROUP BY clause

'''sql

# both work below....
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
''''

       

3.  **Aggregate queries**

   1. Run the `office.sql` file on Brightspace to create the `dept` and `emp` table and insert sample data.   
   2. What is the maximum and minimum salary across all employees  

'''sql
select
	max(emp.sal),
	min(emp.sal)
FROM emp


'''
   1. What is the difference between the maximum and the average salary  
'''sql

select
	max(emp.sal)-avg(emp.sal) as max_minus_avg
FROM emp
'''

   1. What is the average salary per department  
'''sql

SELECT 
	dept.deptno,
    avg(emp.sal) as employee_sal_avg,
	dept.dname
FROM emp
INNER JOIN dept on dept.deptno = emp.deptno
GROUP BY dept.deptno

''''

   1. Select the department name and number of employees,  who have an employee count greater than 2  

'''sql
select
	dept.dname,
	COUNT(emp.empno) as num_employes
FROM emp
INNER JOIN dept on dept.deptno = emp.deptno
GROUP BY dept.dname
HAVING COUNT(emp.empno) > 2

-- ●	The WHERE clause lets us filter out rows before our aggregate functions are calculated
-- ●	The HAVING clause lets us filter out rows after our aggregate functions are calculated


'''
   1. List all employees who have a salary greater than the average salary   

'''SQL

SELECT *
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp);

this also
select
	emp.empno,
	emp.sal as salary
FROM emp
where emp.sal > (SELECT AVG(sal) FROM emp)
ORDER BY emp.sal ASC

-- need a sub query >> cannot use AVG directly in where clause....

'''

   1. List the employees who have a salary greater than the average salary for their department  
   
''sql 
SELECT 
    emp.empno,
    emp.ename,
    emp.sal,
    emp.deptno
FROM emp
WHERE emp.sal > (
    SELECT AVG(sal)
    FROM emp AS e2
    WHERE e2.deptno = emp.deptno
)
ORDER BY emp.deptno, emp.sal DESC;

''''
   1. Select the top 2 departments in terms of highest salary variance among employees. For these departments, show the maximum, minimum and average salary. You can check the [FETCH](https://www.postgresql.org/docs/current/sql-fetch.html) command to filter the top 2\.

'''sql
SELECT 
    deptno,
    MAX(sal) AS max_salary,
    MIN(sal) AS min_salary,
    AVG(sal) AS avg_salary,
    VARIANCE(sal) AS salary_variance
FROM emp
GROUP BY deptno
ORDER BY salary_variance DESC
FETCH FIRST 2 ROWS ONLY;
'''