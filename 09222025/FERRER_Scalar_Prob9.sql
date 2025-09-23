SELECT 	projno, projname, ROUND(DATEDIFF(prendate, prstdate) / 7.0, 1) AS 'DURATION IN WEEKS'
FROM	PROJECT
WHERE	projno LIKE 'MA%' OR projno LIKE 'OP%'
ORDER BY projno;