SELECT	p.projno, COALESCE(p.majproj, 'MAIN PROJECT') AS 'majproj', CONCAT(e.firstname, ' ', e.lastname) AS 'EMP-NAME', DAYNAME(p.prstdate) AS "PRJ-START-DAY", p.prstdate
FROM 	PROJECT p JOIN EMPLOYEE e 
		ON p.respemp = e.empno
WHERE	P.projno LIKE 'MA%'
ORDER BY p.projno;