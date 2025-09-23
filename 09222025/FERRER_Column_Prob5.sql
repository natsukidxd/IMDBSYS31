SELECT		e.workdept, d.deptname, e.sex AS Gender, FORMAT(AVG(e.salary), 2) AS 'AVG-SALARY', FORMAT(AVG(e.bonus), 2) AS 'AVG-BONUS', FORMAT(AVG(e.comm), 2) AS 'AVG-COMM', COUNT(e.empno) AS 'No. of EMP'
FROM 		EMPLOYEE e JOIN DEPARTMENT d 
			ON e.workdept = d.deptno
WHERE		e.workdept LIKE '_1_'
GROUP BY 	e.workdept, d.deptname, e.sex
HAVING		COUNT(e.empno) >= 3
ORDER BY	3;