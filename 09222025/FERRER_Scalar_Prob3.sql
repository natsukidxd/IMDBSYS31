SELECT d.deptno, d.deptname, e.lastname, e.salary, 
	CASE
		WHEN e.workdept = 'D11' AND e.salary >= 50000.00 * 0.80 AND e.salary <= 50000.00 * 1.20 THEN e.salary - 1000.00
	END AS 'DECR-SALARY'
FROM 	DEPARTMENT d JOIN EMPLOYEE e
		ON d.deptno = e.workdept
ORDER BY e.salary;