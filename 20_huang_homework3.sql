-- 1. 顯示系統目前的日期並將表頭命名為”系統日期”。

SELECT current_date() as '系統日期';

-- 2. 顯示所有員工之員工編號,姓名,薪資及將薪資增加15%並且以整數表示，並將表頭命名為”New Salary”。

SELECT EMPNO, ENAME, SAL, ROUND(SAL * 0.15) + SAL as 'New Salary'
	FROM emp;

-- 3. 接續第二題，增加一個資料項表頭命名為Increase(將New Salary減掉salary的值)。

SELECT EMPNO, ENAME, SAL, ROUND(SAL * 0.15) + SAL as 'New Salary', ROUND(SAL * 0.15) + SAL - SAL as 'Increase'
-- SELECT EMPNO, ENAME, SAL, ROUND(SAL * 1.15) as 'New Salary', ROUND(SAL*0.15) as 'Increase' 算式簡化
	FROM emp;

-- 4. *顯示員工的姓名,進公司日期,檢討薪資的日期(指在進公司工作六個月後的第一個星期一)，將該欄命名
-- 為REVIEW，並自訂日期格式為：Sunday, the Seventh of September。(星期幾，幾月幾日)。

SELECT ENAME, HIREDATE, DATE_FORMAT(ADDDATE(ADDDATE(HIREDATE, INTERVAL 6 MONTH) , INTERVAL MOD(7 - WEEKDAY(ADDDATE(HIREDATE, INTERVAL 6 MONTH)), 7) DAY), '%W, the %D of %M') as 'REVIEW'
	FROM emp;

-- 5. 顯示每位員工的姓名，資料項(MONTHS_WORKED):計算到今天為止工作了幾個月。

SELECT ENAME, TIMESTAMPDIFF(MONTH, HIREDATE, current_date()) as 'MONTHS_WORKED' 
-- 利用年月進行數運算 
-- SELECT ENAME, (YEAR(current_date()) * 12 + MONTH(current_date())) - (YEAR(HIREDATE) * 12 + MONTH(HIREDATE)) - 
-- CASE 
-- 	WHEN DAY(current_date()) > DAY(HIREDATE) THEN 0 
--     ELSE 1 
-- END as 'MONTHS_WORKED'
-- 	FROM emp;

-- 6. 顯示如下格式：<員工姓名>earns<薪水>monthly but wants <3倍的薪水>.並將表頭顯示為Dream 
-- Salaries。

SELECT CONCAT(ENAME,' earns', SAL, 'monthly but wants ', SAL*3) as 'Dream Salaries'
	FROM emp;

7. 顯示所有員工之姓名和薪資，設定薪資長度為15個字元並且在左邊加上$符號，將表頭命名為SALARY。

SELECT ENAME, LPAD(SAL, 15, '$') as 'SALARY'
	FROM emp;

-- 8. 顯示員工之姓名,進公司日期，資料項(DAY):顯示員工被雇用的那天為星期幾，並以星期一作為一週的
-- 起始日,依星期排序。

SELECT ENAME, HIREDATE, WEEKDAY(HIREDATE)+1 as 'DAY'
	FROM emp
    ORDER BY DAY;
    

-- 9. 顯示員工的姓名和名為COMM的欄位:顯示佣金額，如果該員工沒有賺取佣金則顯示"No Commission."。

SELECT ENAME, IFNULL(COMM, 'No Commission.')
	FROM emp;

-- 10.顯示資料項命名為EMPLOYEE_AND_THEIR_SALARIES 的資料來顯示所有員工之名字和薪資，且用
-- 星號來表示他們的薪資，每一個星號表示100元，並以薪資由高到低來顯示。

SELECT ENAME, REPEAT('*', ROUND(SAL/100)) as 'EMPLOYEE_AND_THEIR_SALARIES'
	FROM emp
    ORDER BY SAL DESC;