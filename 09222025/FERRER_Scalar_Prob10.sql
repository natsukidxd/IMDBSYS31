SELECT	p.projno, CONCAT(e.firstname, ' ', e.lastname) AS 'employee assigned', d.deptname, p.prendate AS 'ESTIMATED', DATE_ADD(p.prstdate, INTERVAL FLOOR(DATEDIFF(p.prendate, p.prstdate) * 1.10) DAY) AS 'EXPECTED'
FROM	PROJECT p JOIN EMPLOYEE e 
		ON p.respemp = e.empno
JOIN DEPARTMENT d
		ON e.workdept = d.deptno
WHERE p.projno NOT LIKE 'MA%'
ORDER BY 1;