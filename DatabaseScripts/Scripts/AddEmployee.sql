CREATE PROCEDURE AddEmployee
	@FirstName NVARCHAR(100),
	@LastName NVARCHAR(100),
	@JobTitle NVARCHAR(100),
    @DateHired DATE,
	@Salary DECIMAL(10, 2)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Employees (FirstName, LastName, JobTitle, DateHired, Salary)
	VALUES (@FirstName, @LastName, @JobTitle, @DateHired, @Salary)

	SELECT 'Employee Added Successfully ;)' AS Message;
END;


EXEC AddEmployee 
    @FirstName = 'Tala', 
    @LastName = 'Bader', 
    @JobTitle = 'Devops Engineer', 
    @Salary = 950.00, 
    @DateHired = '2025-02-01';

Select * from Employees