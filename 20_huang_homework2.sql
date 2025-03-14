-- 1. 顯示出所有員工薪資超過2850元的員工之姓名和薪資。

SELECT ENAME, SAL
	FROM emp
    WHERE SAL > 2850;

-- 2. 顯示員工編號為7566員工的姓名和他所屬的部門編號。

SELECT ENAME, DEPTNO
	FROM emp
    WHERE EMPNO = 7566;

-- 3. 顯示薪資不介於1500~2850元之間的所有員工之姓名和薪資。

SELECT ENAME, SAL
	FROM emp
    WHERE NOT (SAL > 1500 and SAL < 2850);

-- 4. 顯示於2011年2月20日和2011年5月1日間進入公司的員工之姓名、職稱和進公司日期，並依進公司日
-- 期由小到大排序。

SELECT ENAME, JOB, HIREDATE
	FROM emp
    WHERE HIREDATE BETWEEN  '2011-02-20' and '2011-05-01'
    ORDER BY HIREDATE;

-- 5. 顯示部門10和30所有員工之姓名和他所屬的部門編號，並依名字依英文字母順序排序。

SELECT ENAME, DEPTNO
	FROM emp
    WHERE DEPTNO IN (10, 30)
    ORDER BY ENAME;

-- 6. 顯示薪資超過1500“且”在10“或”30部門工作員工之姓名和薪資，把分別把表頭命名為Employee和
-- Monthly Salary。

SELECT ENAME as 'Employee', SAL as 'Monthly Salary'
	FROM emp
    WHERE SAL > 1500 and DEPTNO in (10, 30);

-- 7. 顯示於2012年進公司的所有員工之姓名、職稱和進公司日期。

SELECT ENAME, JOB, HIREDATE
	FROM emp
    WHERE HIREDATE <= '2012-12-31' and HIREDATE >= '2012-01-01';
    -- WHERE HIREDATE BETWEEN '2012-01-01' and '2012-12-31' 也可以這樣寫
    -- WHERE YEAR (HIREDATE) < 2012 也可以這樣寫

-- 8. 顯示沒有主管的員工之姓名和職稱。

SELECT ENAME, JOB
	FROM emp
    WHERE MGR is NULL;

-- 9. 顯示所有有賺取佣金的員工之姓名、薪資和佣金，並以薪資和佣金作降冪排列。

SELECT ENAME, SAL, COMM
	FROM emp
    WHERE COMM > 0
    ORDER BY SAL DESC, COMM DESC;

-- 10.顯示所有名字裡第三個英文字母為A的員工之姓名與職稱。

SELECT ENAME, JOB
 FROM emp
 WHERE ENAME LIKE '__A%';

-- 11.顯示名字裡有兩個“L”且在30部門工作或主管是7782的員工之姓名、主管員工編號及所屬的部門編號。

SELECT ENAME, MGR, DEPTNO
	FROM emp
    WHERE ENAME LIKE '%L%L%' and DEPTNO = 30 or MGR = 7782;

-- 12.顯示職稱為Clerk或Analyst且薪水不等於1000,3000,5000的員工之姓名、職稱和薪資。

SELECT ENAME, JOB, SAL
	FROM emp
    WHERE JOB IN ('Clerk', 'Analyst') and  SAL not IN (1000, 3000, 5000);

-- 13.顯示佣金比薪水的1.1倍還多的員工之姓名、薪資和佣金。

SELECT ENAME, SAL, COMM
	FROM emp
    WHERE COMM > SAL*1.1;

-- 14.顯示公司最資深的前三名員工之員工編號、姓名、部門編號和進公司日期。

SELECT EMPNO, ENAME, DEPTNO, HIREDATE
	FROM emp
    ORDER BY HIREDATE
    LIMIT 3;
