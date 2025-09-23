SELECT		d.deptno, d.deptname, e.job, COUNT(e.empno) AS 'No. Analyst',
    CASE
        WHEN ROUND(AVG(e.edlevel)) = 10 THEN 'Ten'
        WHEN ROUND(AVG(e.edlevel)) = 11 THEN 'Eleven'
        WHEN ROUND(AVG(e.edlevel)) = 12 THEN 'Twelve'
        WHEN ROUND(AVG(e.edlevel)) = 13 THEN 'Thirteen'
        WHEN ROUND(AVG(e.edlevel)) = 14 THEN 'Fourteen'
        WHEN ROUND(AVG(e.edlevel)) = 15 THEN 'Fifteen'
        WHEN ROUND(AVG(e.edlevel)) = 16 THEN 'Sixteen'
        WHEN ROUND(AVG(e.edlevel)) = 17 THEN 'Seventeen'
        WHEN ROUND(AVG(e.edlevel)) = 18 THEN 'Eighteen'
        WHEN ROUND(AVG(e.edlevel)) = 19 THEN 'Nineteen'
        WHEN ROUND(AVG(e.edlevel)) = 20 THEN 'Twenty'
        ELSE 'Other'
    END AS 'AVG-EDLEVEL',
FORMAT(AVG(e.salary + COALESCE(E.comm, 0) + COALESCE(E.bonus, 0)), 2) AS 'DEPT-AVG-INCOME'
FROM		DEPARTMENT d JOIN EMPLOYEE e 
			ON D.deptno = E.workdept
WHERE		e.job LIKE 'ANALYST'
GROUP BY	d.deptno, d.deptname, e.job
ORDER BY 1;