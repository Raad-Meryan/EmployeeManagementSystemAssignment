CREATE VIEW TopSalaries AS
SELECT TOP 5 
	EmployeeId,
	FirstName + ' ' + LastName AS FullName,
	JobTitle,
	Salary
FROM Employees
ORDER BY Salary DESC
