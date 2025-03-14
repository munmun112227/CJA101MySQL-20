-- 1. 顯示和Blake同部門的所有員工之姓名和進公司日期。

-- Sub-Queries
SELECT ename, hiredate
FROM emp 
WHERE deptno = (SELECT deptno
				FROM emp
                WHERE ename = 'Blake');

-- JOIN
SELECT e1.ename,
	   e1.hiredate
FROM emp AS e1
JOIN emp AS e2
	ON e1.deptno = e2.deptno 
WHERE e2.ename = 'Blake';

-- 2. 顯示所有在Blake之後進公司的員工之姓名及進公司日期。

-- Sub-Queries 
SELECT ename, hiredate
FROM emp
WHERE hiredate > (SELECT hiredate
				  FROM emp
                  WHERE ename = 'Blake');

-- JOIN
SELECT e1.ename, 
	   e1.hiredate
FROM emp AS e1
JOIN emp AS e2
	ON e1.hiredate > e2.hiredate
WHERE e2.ename = 'Blake';

-- 3. 顯示薪資比公司平均薪資高的所有員工之員工編號,姓名和薪資，並依薪資由高到低排列。

-- Sub-Queries
SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal)
			 FROM emp)
ORDER BY sal DESC;

-- JOIN
SELECT e1.empno, e1.ename, e1.sal
FROM emp AS e1 
JOIN (SELECT AVG(sal) AS avgsal
	  FROM emp) AS e2
	ON e1.sal > e2.avgsal;

-- 4. 顯示和姓名中包含T的人在相同部門工作的所有員工之員工編號和姓名。

-- Sub-Queries
SELECT empno, ename
FROM emp
WHERE deptno IN (SELECT deptno
				FROM emp
                WHERE ename LIKE '%T%');
-- JOIN 
SELECT e1.empno, e1.ename
FROM emp AS e1
JOIN emp AS e2
	ON e1.deptno = e2.deptno
WHERE e2.ename LIKE '%T%';

-- 5. 顯示在Dallas工作的所有員工之姓名, 部門編號和職稱。

-- Sub-Queries
SELECT ename, deptno, job
FROM emp
WHERE deptno in (SELECT deptno
				 FROM dept
                 WHERE loc = 'Dallas');
-- JOIN
SELECT e.ename, e.deptno, e.job
FROM emp AS e
JOIN  dept AS d
	ON e.deptno = d.deptno
WHERE d.loc = 'Dallas';

-- 6. 顯示直屬於”King”的員工之姓名和薪資。

-- Sub-Queries
SELECT ename, sal 
FROM emp
WHERE mgr = (SELECT empno 
			 FROM emp
             WHERE ename = 'King');
-- JOIN
SELECT e1.ename, e1.sal
FROM emp AS e1
JOIN emp AS e2
	ON e1.mgr = e2.empno
WHERE e2.ename = 'King';


-- 7. 顯示銷售部門”Sales” 所有員工之部門編號,姓名和職稱。

-- Sub-Qureies 
SELECT deptno, ename, job 
FROM emp
WHERE deptno = (SELECT deptno
				FROM dept
				WHERE dname = 'Sales');
-- JOIN
SELECT e.deptno, e.ename, job
FROM emp AS e
JOIN dept AS d
	ON e.deptno = d.deptno
WHERE d.dname = 'Sales';

-- 8. 顯示薪資比公司平均薪資還要高且和名字中有T的人在相同部門上班的所有員工之員工編號,姓名和薪資。

-- Sub-Queries
SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal)
			 FROM emp)
	AND deptno in (SELECT deptno
				  FROM emp
                  WHERE ename LIKE '%T%');
-- JOIN
SELECT e1.empno, e1.ename, e1.sal
FROM emp AS e1
JOIN (SELECT AVG(sal) AS avgs
	  FROM emp) AS e2
	ON e1.sal > e2.avgs 
JOIN (SELECT deptno AS d
	  FROM emp
      WHERE ename LIKE '%T%') AS e3
	ON e1.deptno = e3.d;

-- 9. *顯示和有賺取佣金的員工之部門編號和薪資都相同的員工之姓名,部門編號和薪資。

-- Sub-Queries 
SELECT e1. ename, e1. deptno, e1. sal
FROM emp AS e1
WHERE e1. sal IN (SELECT e2. sal
				  FROM emp AS e2
				  WHERE e2. comm > 0 AND e1. empno != e2. empno);

-- 10.*顯示和在Dallas工作的員工之薪資和佣金都相同的員工之姓名,部門編號和薪資。

SELECT e1. ename, e1. deptno, e1. sal
FROM emp AS e1
WHERE e1. deptno = (SELECT d. deptno
					FROM dept AS d
                    WHERE d. loc = 'Dallas')
	AND e1. sal IN (SELECT e2. sal
				   FROM emp AS e2
                   WHERE e1. empno != e2. empno AND IFNULL(e1.comm, -1) = IFNULL(e2.comm, -1));
--  

-- 11.*顯示薪資和佣金都和Scott相同的所有員工之姓名,進公司日期和薪資。(不要在結果中顯示Scott的資料)

SELECT e1. ename, e1. hiredate, e1. sal  
FROM emp AS e1
WHERE e1. sal = (SELECT e2. sal 
				 FROM emp AS e2
                 WHERE ename = 'Scott' AND e1. empno != e2. empno AND IFNULL(e1.comm, -1) = IFNULL(e2.comm, -1))
 AND e1. ename != 'Scott';

-- 12.*顯示薪資比所有職稱是”Clerk”還高的員工之姓名,進公司日期和薪資，並將結果依薪資由高至低顯示。

SELECT e1. ename, e1. hiredate, e1. sal
FROM emp AS e1
WHERE e1. sal > ALL (SELECT e2. sal
					 FROM emp AS e2
                     WHERE e2. job = 'Clerk')
ORDER BY e1. sal DESC;