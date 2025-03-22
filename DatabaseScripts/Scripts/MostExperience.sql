CREATE VIEW MostExp AS
SELECT TOP 5 
	EmployeeId,
	FirstName + ' ' + LastName AS FullName,
	JobTitle,
	Salary,
	DATEDIFF(YEAR, DateHired, GETDATE()) AS YearOfExp
FROM Employees 
ORDER BY YearOfExp DESC