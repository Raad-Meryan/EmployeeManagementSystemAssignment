CREATE PROCEDURE GetEmployees
AS
BEGIN
	SET NOCOUNT ON;

	SELECT EmployeeID, FirstName, LastName, JobTitle, DateHired, Salary
	FROM Employees
	ORDER BY FirstName ASC;
END;

EXEC GetEmployees