CREATE PROCEDURE DeleteEmployee
	@Id INT
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM Employees WHERE EmployeeID = @Id)
	BEGIN
		DELETE FROM Employees WHERE EmployeeID = @Id;
		SELECT 'Employee Deleted Successfully :)' AS MESSAGE;
	END
	ELSE
	BEGIN
		SELECT 'Employee Not Found :(' AS MESSAGE;
	END
END;

EXEC DeleteEmployee @Id = 5