**Lab SQL Introduction**

1.  **Create tables and populate them**

   1. Install [PostgreSQL](https://www.postgresql.org/download/) and open the **pgAdmin** application  
   2. Open the `students.sql` script available in Brightspace.   
   3. Copy the script in the worksheet and run each command one at a time. Make sure you understand what is happening

2. **Try out some SQL statements**

   1. Insert a record for your own student information  
   2. Query the student record that you just inserted  
   3. Update your student record changing two of the attributes. These two updates should be done using the one update statement  
   4. Create a table `COURSE_CODES` with the following attributes. You can decide the appropriate name of the table and the data types of each attribute 

      `COURSE_ID` (contains a unique identifier for the course)  
      `COURSE_CODE` (contains the course code e.g. TU256, TU059, TU060 …) `COURSE_DESCRIPTION` (contains a description/name of the course)

   5. Insert at least 4 records into the table created in **d** (feel free to make up course codes)

   

   6. Modify the table structure to contain a new attribute called `FULL_PART_TIME`. This attribute is to contain a value that indicates if the course is for full-time or part-time students.  
   7. Update the records in the course codes table to have the correct value for the `FULL_PART_TIME` attribute.  
   8. Query the `COURSE_CODES` table to verify that the data is correct.  
   9. Alter the `STUDENT` table to add `COURSE_ID` attribute as a foreign key to the `COURSE_CODES` table.  
   10. Update the `STUDENT` table so each student has a `COURSE_ID`  
   11. Write a query that joins the STUDENT table with the course codes table, and returns the following

       `Student Name` (this should be one value that combines FIRST\_NAME and SURNAME, separated by a space. You will need to use the [CONCAT](https://www.postgresql.org/docs/9.1/functions-string.html) function)   
       `DOB`  
       `COURSE_DESCRIPTION`

   12. Write a query that displays the following: COURSE\_DESCRIPTION: a count of the number of students in each course. You will need to use a COUNT function and a GROUP BY clause

   

       

3.  **Aggregate queries**

   1. Run the `office.sql` file on Brightspace to create the `dept` and `emp` table and insert sample data.   
   2. What is the maximum and minimum salary across all employees  
   3. What is the difference between the maximum and the average salary  
   4. What is the average salary per department  
   5. Select the department name and number of employees,  who have an employee count greater than 2  
   6. List all employees who have a salary greater than the average salary   
   7. List the employees who have a salary greater than the average salary for their department  
   8. Select the top 2 departments in terms of highest salary variance among employees. For these departments, show the maximum, minimum and average salary. You can check the [FETCH](https://www.postgresql.org/docs/current/sql-fetch.html) command to filter the top 2\.

