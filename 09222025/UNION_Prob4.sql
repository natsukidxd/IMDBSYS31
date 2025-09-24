SELECT	'PROJECT' AS "PROJECT", projno, respemp, prstdate, prendate
FROM	PROJECT
WHERE	projno LIKE 'IF%'
UNION ALL
SELECT	'' AS "PROJECT", projno, empno AS 'respemp', emstdate AS 'prstdate', emendate AS 'prendate'
FROM	EMP_ACT
WHERE	projno LIKE 'IF%'
ORDER BY 2, 3, 4;