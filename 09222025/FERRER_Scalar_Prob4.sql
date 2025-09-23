SELECT	d.deptname, CONCAT(SUBSTRING(e.firstname, 1, 1), '.', COALESCE(e.midinit, ''), '. ', e.lastname) AS 'EMP-NAME', (e.salary + COALESCE(e.comm, 0) + COALESCE(e.bonus, 0)) AS 'INCOME'
FROM	DEPARTMENT d JOIN EMPLOYEE e
		ON d.deptno = e.workdept
WHERE e.workdept = 'D11' AND (e.salary + COALESCE(e.comm, 0) + COALESCE(e.bonus, 0)) > (e.salary + (e.salary * 0.10))
ORDER BY 3 DESC;