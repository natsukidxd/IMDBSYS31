SELECT		d.deptno, d.deptname, COUNT(e.empno) AS 'No. EMP', FORMAT(AVG(e.salary + COALESCE(e.comm, 0) + COALESCE(e.bonus, 0)), 2) AS 'DEPT-AVG-INCOME'
FROM		DEPARTMENT d JOIN EMPLOYEE e 
			ON d.deptno = e.workdept
GROUP BY 	d.deptno, d.deptname
HAVING 		COUNT(e.empno) >= 4
ORDER BY 	AVG(e.salary + COALESCE(e.comm, 0) + COALESCE(e.bonus, 0)) DESC;