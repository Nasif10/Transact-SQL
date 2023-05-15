SELECT City, Gender, SUM(Salary) FROM EMPLOYEE 
GROUP BY 
GROUPING SETS(
	(City, Gender),
	(City),
	(Gender),
	()	
)

-- -- --

SELECT City, Gender, SUM(Salary) FROM EMPLOYEE 
GROUP BY 
GROUPING SETS(
	(City, Gender),
	(City),
	(Gender),
	()	
)
ORDER BY GROUPING(City), GROUPING(Gender)


-- Rollup

SELECT City, SUM(Salary) FROM EMPLOYEE 
GROUP BY ROLLUP(City) 

SELECT City, Gender, SUM(Salary) FROM EMPLOYEE 
GROUP BY ROLLUP(City, Gender) 

SELECT 
	CASE WHEN GROUPING(City) = 1 THEN 'All' ELSE City END AS City,
	CASE WHEN GROUPING(Gender) = 1 THEN 'All' ELSE Gender END AS Gender,
AVG(Salary) FROM EMPLOYEE 
GROUP BY ROLLUP(City, Gender) 

-- Cube

SELECT City, Gender, MAX(Salary) FROM EMPLOYEE 
GROUP BY CUBE(City, Gender) 