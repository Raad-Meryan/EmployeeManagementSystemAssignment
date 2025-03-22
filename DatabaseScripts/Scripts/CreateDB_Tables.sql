CREATE DATABASE EmpAssignmentDB;
GO
USE EmpAssignmentDB;


CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY,
    Username NVARCHAR(100) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL
);


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    JobTitle NVARCHAR(100),
    DateHired DATE,
	Salary DECIMAL(10, 2)
);


INSERT INTO Users (Username, PasswordHash)
VALUES 
('admin', '123'),
('adminManager', '2025');


INSERT INTO Employees (FirstName, LastName, JobTitle, DateHired, Salary)
VALUES 
('Raad', 'Meryan', 'Full Stack Engineer', '2025-04-01', 1250.00),
('Sara', 'Hamdan', 'HR Manager', '2022-03-01', 3000.00),
('Jamal', 'Fawzan', 'Product Owner', '2019-08-01', 3500.00)