SELECT	workdept, job, lastname, firstname, 'BEFORE A RAISE' AS "WHEN", FORMAT(salary, 2) AS 'SALARY'
FROM	EMPLOYEE
WHERE	job != 'MANAGER' AND workdept = 'D21'
UNION ALL
SELECT	workdept, job, lastname, firstname, 'AFTER A 10% RAISE' AS "WHEN", FORMAT((salary * 1.10), 2) AS 'SALARY'
FROM	EMPLOYEE
WHERE	job != 'MANAGER' AND workdept = 'D21'
ORDER BY 3;