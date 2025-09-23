SELECT	d.deptno, CONCAT(d.deptname, ' - ', d.mgrno) AS 'DEPT-NAME-MGRNO', FORMAT(SUM(e.salary), 2) AS 'SUM-SALARY-DEPT'
FROM 	DEPARTMENT d JOIN EMPLOYEE e 
		ON d.deptno = e.workdept
GROUP BY d.deptno
ORDER BY SUM(e.salary) DESC;