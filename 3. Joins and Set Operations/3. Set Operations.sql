USE EmpDb

--UNION 

(SELECT FirstName, City FROM EMPLOYEE WHERE City = 'Los Angeles')
UNION
(SELECT FirstName, City FROM EMPLOYEE WHERE City = 'Chicago')

(SELECT FirstName, City FROM EMPLOYEE WHERE City = 'Los Angeles')
UNION
(SELECT FirstName, City FROM EMPLOYEE WHERE City = 'Los Angeles')

--UNION ALL 

(SELECT FirstName, City FROM EMPLOYEE WHERE City = 'Los Angeles')
UNION ALL
(SELECT FirstName, City FROM EMPLOYEE WHERE City = 'Los Angeles')


--INTERSECT

(SELECT FirstName, City FROM EMPLOYEE WHERE City != 'Los Angeles')       
INTERSECT
(SELECT FirstName, City FROM EMPLOYEE  WHERE City != 'Miami')     


--EXCEPT  

(SELECT FirstName, City FROM EMPLOYEE )
EXCEPT
(SELECT FirstName, City FROM EMPLOYEE WHERE City = 'Los Angeles')