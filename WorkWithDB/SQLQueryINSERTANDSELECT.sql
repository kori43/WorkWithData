USE SchoolDB

INSERT INTO ConcreteClasses
SELECT 
	ClassNumber 
	,'A'
	,NULL
FROM ClassNumbers

SELECT TOP (1000) [ClassNumber]
      ,[ClassLetter]
      ,[Details]
  FROM [SchoolDB].[dbo].[ConcreteClasses]
