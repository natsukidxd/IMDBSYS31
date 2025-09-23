SELECT	DATE_FORMAT(prstdate, '%M') AS 'MONTH', DATE_FORMAT(prstdate, '%Y') AS 'YEAR', projno
FROM	PROJECT
WHERE	prendate = '2002-12-01'
ORDER BY 3;