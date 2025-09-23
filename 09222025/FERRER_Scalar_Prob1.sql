SELECT	lastname, salary, FORMAT(salary * 1.05, 2) AS "INC-Y-SALARY", FORMAT((salary * 1.05) / 12, 2) AS "INC-M-SALARY"
FROM 	EMPLOYEE
WHERE	salary * 1.05 <= 60000.00
ORDER BY salary;