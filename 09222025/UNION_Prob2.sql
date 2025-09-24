SELECT 	workdept AS 'deptno', empno, lastname, job, FORMAT(salary, 2) AS "SALARY"
FROM	EMPLOYEE
WHERE	workdept = 'A00'
UNION
SELECT 	'' AS "deptno", '' AS "empno", '' AS "lastname", 'SUM SALARY: ' AS "SALARY", FORMAT(SUM(salary), 2)
FROM 	EMPLOYEE
WHERE	workdept = 'A00';