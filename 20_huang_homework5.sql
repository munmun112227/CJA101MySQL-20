-- 1. 顯示所有員工之姓名,所屬部門編號,部門名稱及部門所在地點。

SELECT e. ename, e. deptno, d. dname, d. loc
FROM emp AS e JOIN dept AS d ON e. deptno = d. deptno;

-- 2. 顯示所有有賺取佣金的員工之姓名,佣金金額,部門名稱及部門所在地點。

SELECT e. ename, e. comm, d. dname, d. loc
FROM emp AS e JOIN dept AS d ON e. deptno = d. deptno
WHERE e. comm > 0;

-- 3. 顯示姓名中包含有”A”的員工之姓名及部門名稱。

SELECT e. ename, d. dname
FROM emp AS e JOIN dept AS d ON e. deptno = d. deptno
WHERE e. ename LIKE '%A%';

-- 4. 顯示所有在”DALLAS”工作的員工之姓名,職稱,部門編號及部門名稱

SELECT e. ename, e. job, e. deptno, d. dname
FROM emp AS e JOIN dept AS d ON e. deptno = d. deptno
WHERE d.loc = 'DALLAS';

-- 5. 顯示出表頭名為:Employee, Emp#, Manager, Mgr#，分別表示所有員工之姓名,員工編號,主
-- 管姓名, 主管的員工編號。

SELECT e. ename AS Employee, e. empno AS 'Emp#', m. ename AS Manager, m. empno AS 'Mgr#'
FROM emp AS e JOIN emp AS m ON e. mgr = m. empno;

-- 6. 查看SALGRADE資料表的結構，並建立一查詢顯示所有員工之姓名,職稱,部門名稱,薪資及薪
-- 資等級。

SELECT e. ename, e. job, d. dname, e. sal, sg. grade
FROM emp AS e JOIN salgrade AS sg ON e. sal BETWEEN sg. losal and sg. hisal
			  JOIN dept AS d ON e. deptno = d. deptno;

-- 7. 顯示出表頭名為: Employee, Emp Hiredate, Manager, Mgr Hiredate的資料項，來顯示所有比
-- 他的主管還要早進公司的員工之姓名,進公司日期和主管之姓名及進公司日期。

SELECT e. ename AS Employee, e. hiredate AS 'Emp Hiredate', m. ename AS Manager, m. hiredate AS 'Mgr Hiredate'
FROM emp AS e JOIN emp AS m ON e. mgr = m. empno
WHERE e. hiredate < m. hiredate;

-- 8. 顯示出表頭名為: dname, loc, Number of People, Salary的資料來顯示所有部門之部門名稱,部
-- 門所在地點,部門員工數量及部門員工的平均薪資，平均薪資四捨五入取到小數第二位。

SELECT d. dname AS dname, d. loc AS loc, COUNT(e. empno) AS 'Number of People', ROUND(AVG(e. sal), 2) AS Salary
FROM emp AS e JOIN dept AS d ON e. deptno = d. deptno
GROUP BY d. dname, d. loc;

-- 9. 顯示出所有部門之編號、名稱及部門員工人數(Emp#)，包含沒有員工的部門。

SELECT d. deptno AS deptno, d. dname AS dname, COUNT(e. empno) AS 'Emp#'
FROM emp AS e RIGHT JOIN dept AS d ON e. deptno = d. deptno
GROUP BY d. deptno, d. dname;