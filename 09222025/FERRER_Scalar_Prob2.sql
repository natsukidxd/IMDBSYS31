SELECT	CONCAT(firstname, ' ', midinit, '. ', lastname) AS 'EMPLOYEE NAME',
	CASE
		WHEN edlevel = 18 THEN 'Eighteen'
        WHEN edlevel = 20 THEN 'Twenty'
        ELSE 'Other'
    END AS "Education Level",
FORMAT(salary + 1800.00, 2) AS "NEW-SALARY", FORMAT(COALESCE(bonus, 0) / 2, 2) AS "NEW-BONUS"
FROM	EMPLOYEE
WHERE	edlevel IN (18, 20)
ORDER BY
    CASE 
		WHEN edlevel = 20 THEN 0 
        ELSE 1 
	END, 
salary;