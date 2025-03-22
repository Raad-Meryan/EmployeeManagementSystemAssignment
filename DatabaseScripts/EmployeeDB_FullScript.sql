-- Create Database and Tables
-- ==============================

CREATE DATABASE EmpAssignmentTestDB;
GO

USE EmpAssignmentTestDB;
GO

CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY,
    Username NVARCHAR(100) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    JobTitle NVARCHAR(100),
    DateHired DATE,
	Salary DECIMAL(10, 2)
);
GO

-- ==============================
-- Create Views
-- ==============================
-- View: MostExperienced Employees
CREATE VIEW MostExp AS
SELECT TOP 5 
    EmployeeId,
    FirstName + ' ' + LastName AS FullName,
    JobTitle,
    Salary,
    DATEDIFF(YEAR, DateHired, GETDATE()) AS YearOfExp
FROM Employees 
ORDER BY YearOfExp DESC;
GO

-- View: Top Salaries
CREATE VIEW TopSalaries AS
SELECT TOP 5 
    EmployeeId,
    FirstName + ' ' + LastName AS FullName,
    JobTitle,
    Salary
FROM Employees
ORDER BY Salary DESC;
GO

-- Create Stored Procedures
-- ==============================
-- Procedure: GetEmployees
CREATE PROCEDURE GetEmployees AS
BEGIN
    SET NOCOUNT ON;

    SELECT EmployeeID, FirstName, LastName, JobTitle, DateHired, Salary
    FROM Employees
    ORDER BY FirstName ASC;
END;
GO

-- Procedure: AddEmployee
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
GO

-- Procedure: UpdateEmployee
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
		SET FirstName = ISNULL(@FirstName, FirstName),
			LastName = ISNULL(@LastName, LastName),
			JobTitle = ISNULL(@JobTitle, JobTitle),
			DateHired = ISNULL(@DateHired, DateHired),
			Salary = ISNULL(@Salary, Salary)
		WHERE EmployeeID = @EmployeeId;

		SELECT 'Employee updated successfully! :)' AS Message;
	END
	ELSE
	BEGIN
		SELECT 'Employee not found :(' AS Message
	END
END;
GO

-- Procedure: DeleteEmployee
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
GO

-- Procedure: VerifyUserLogin
CREATE PROCEDURE VerifyUserLogin
    @Username NVARCHAR(100), 
    @PasswordHash NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 FROM Users
        WHERE Username = @Username
        AND PasswordHash = @PasswordHash
    )
    BEGIN 
        SELECT 'Login Successful' AS Message;
    END
    ELSE
    BEGIN
        SELECT 'Username or Password is invalid' AS Message;
    END
END;
GO


-- Insert Sample Data
-- ==============================
INSERT INTO Employees (FirstName, LastName, JobTitle, Salary, DateHired)
VALUES 
('Raad', 'Meryan', 'Software Engineer', 1300.00, '2025-04-01'),
('Sara', 'Kareem', 'HR Manager', 3000.00, '2020-11-15'),
('Omar', 'Ali', 'Marketing', 2800.00, '2021-10-10'),
('Layla', 'Hassan', 'Data Analyst', 2700.00, '2023-05-20'),
('Jamal', 'Fawzi', 'Product Manager', 3500.00, '2019-09-12');

INSERT INTO Users (Username, PasswordHash)
VALUES
('admin', '123'),
('user1', 'password1'),
('user2', 'password2');
GO
