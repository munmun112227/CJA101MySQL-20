--  1. 顯示所有員工的最高、最低、總和及平均薪資，依序將表頭命名為Maximum, Minimum, Sum
-- 和Average，請將結果顯示為四捨五入的整數。

SELECT ROUND(MAX(SAL)) as 'Maximum', ROUND(MIN(SAL)) as 'Minimum', ROUND(SUM(SAL)) as 'Sum', ROUND(AVG(SAL)) as 'Average'
FROM emp;

-- 2. 顯示每種職稱的最低、最高、總和及平均薪水。

SELECT JOB, MIN(SAL), MAX(SAL), SUM(SAL), AVG(SAL)
FROM emp
GROUP BY JOB;

-- 3. 顯示每種職稱的人數。

SELECT JOB, COUNT(*)
FROM emp
GROUP BY JOB;

-- 4. 顯示資料項命名為Number of Managers來表示擔任主管的人數。

SELECT COUNT(DISTINCT MGR) AS 'Number of Managers'
FROM emp;

-- 5. 顯示資料項命名為DIFFERENCE的資料來表示公司中最高和最低薪水間的差額。

SELECT MAX(SAL) - MIN(SAL) AS 'DIFFERENCE'
FROM emp;

-- 6. 顯示每位主管的員工編號及該主管下屬員工最低的薪資，排除沒有主管和下屬員工最低薪資
-- 少於1000的主管，並以下屬員工最低薪資作降冪排列。

SELECT MGR, MIN(SAL) 
FROM emp
WHERE MGR IS NOT NULL
GROUP BY MGR
HAVING MIN(SAL) > 1000
ORDER BY MIN(SAL) DESC;


-- 7. 顯示在2011及2013年進公司的員工數量，並給該資料項一個合適的名稱。

SELECT YEAR(HIREDATE) AS 'HIRE YEAR', COUNT(*) AS 'EMPROEE NUMBER'
FROM emp
WHERE YEAR(HIREDATE) IN(2011, 2013)
GROUP BY  YEAR(HIREDATE);