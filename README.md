Employee Management System (CRUD Operations with .NET Core and SQL Server)

Project Overview

This is a .NET Core Web API project that provides the following features:

- Employee Inquiry (via SQL View)
- Employee Entry (Add, Update, Delete Employees via Stored Procedures)
- Login Authentication
- Swagger Integration for API Testing

"Project Overview:

The project consists of two key screens:
1- Login Screen
2- A screen for Employee Inquiries, as well as Employee Entry and Modification.
 

Project Requirements:
1- Technology Stack: .NET Core for the backend, Microsoft SQL Server for the database.
2- Database Operations: We prefer that database operations be handled through Views and Stored Procedures for this project."



Setup Instructions:

1- Database Setup
	1- Open SQL Server Management Studio (SSMS)
	2- Run EmployeeDB_FullScript.sql script to create the database, tables, views, and stored procedures.

2- App Configuration:
	1- Open the appsettings.json file.
	2- Update the connection string if needed to match with your SQL Server instance.

3- Build and Run
	1- Open the project in Visual Studio.
	2- Run the program.
	3- Now you should be able to test via Swagger. 

4- Sample Data for Testing:
Add Employee:
	{
	  "firstName": "Ahmad",
	  "lastName": "Ali",
	  "jobTitle": "UI/UX",
	  "dateHired": "2022-01-16",
	  "salary": 1150.00
	}

Valid Login Credentials:
	Username: admin
	Password: admin123

	Username: user1	
	Password: password1


For testing update logic, try modifying one or two fields using dynamic updates with ISNULL to make it more dynamic so you don't have to update every field, the most important one is the ID.

id [1]
{
  "salary": 1500.00
}

If you have any question, please feel free to contact me at: meryanraad@gmail.com