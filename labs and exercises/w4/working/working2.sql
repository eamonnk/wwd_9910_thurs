
/*select
	max(emp.sal) as max_salary,
	min(emp.sal) as min_salary
FROM emp
*/

--select
--	max(emp.sal)-avg(emp.sal) as max_minus_avg
-- FROM emp

/*
SELECT 
	dept.deptno,
    avg(emp.sal) as employee_sal_avg,
	dept.dname
FROM emp
INNER JOIN dept on dept.deptno = emp.deptno
GROUP BY dept.deptno
*/

/*
select
	emp.empno,
	emp.sal as salary
FROM emp
where emp.sal > (SELECT AVG(sal) FROM emp)
ORDER BY emp.sal ASC
*/
/*
SELECT *
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp);
*/
/*
select *
from emp
GROUP BY dept.dname
HAVING count > avg(emp.sal)
*/

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



	

