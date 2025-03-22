CREATE PROCEDURE UpdateEmployee
	@EmployeeId INT,
	@FirstName NVARCHAR(100) = NULL,
	@LastName NVARCHAR(100)= NULL,
	@JobTitle NVARCHAR(100) = NULL,
    @DateHired DATE= NULL,
	@Salary DECIMAL(10, 2) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM Employees WHERE EmployeeID = @EmployeeId)
	BEGIN
		UPDATE Employees
		SET FirstName = COALESCE(@FirstName, FirstName),
			LastName = COALESCE(@LastName, LastName),
			JobTitle = COALESCE(@JobTitle, JobTitle),
			DateHired = COALESCE(@DateHired, DateHired),
			Salary = COALESCE(@Salary, Salary)
		WHERE EmployeeID = @EmployeeId;

		SELECT 'Employee updated successfully! :)' AS Message;
	END
	ELSE
	BEGIN
		SELECT 'Employee not found :(' AS Message
	END
END;

EXEC UpdateEmployee 
    @EmployeeId = 2,
    @LastName = 'Betaar';
