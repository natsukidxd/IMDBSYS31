SELECT	e.empno, CONCAT(e.firstname, ' ', COALESCE(midinit, ''), '. ', e.lastname) AS 'name', d.deptname, YEAR(CURDATE()) - YEAR(e.birthdate) AS 'AGE'
FROM 	EMPLOYEE e JOIN DEPARTMENT d
		ON e.workdept = d.deptno
WHERE 	YEAR(CURDATE()) - YEAR(e.birthdate) < 25
ORDER BY 4, 1;