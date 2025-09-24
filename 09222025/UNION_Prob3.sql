SELECT 	deptno, 'DEPARTMENT' AS "INFO", deptname
FROM 	DEPARTMENT
WHERE	deptno IN('A00', 'B01', 'C01')
UNION ALL
SELECT	deptno, projno AS 'INFO', projname AS 'deptname'
FROM	PROJECT
WHERE	deptno IN('A00', 'B01', 'C01')
UNION ALL
SELECT	workdept AS 'deptno', empno AS 'INFO', lastname
FROM	EMPLOYEE
WHERE	workdept IN('A00', 'B01', 'C01')
ORDER BY 1;