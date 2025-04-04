# Employee Management System (CRUD Operations with .NET Core and SQL Server)

## Project Overview

This is a .NET Core Web API project that has a basic Employee Management System:

- User Login Authentication
- Employee Management (Add, Update, Delete)
- Employee Inquiry (Top Salaries and Experience via Views)
- Swagger Integration for backend API testing
- Basic frontend UI (HTML + Bootstrap + JavaScript)

The system includes two main screens:
1. **Login Screen** (`index.html`)
2. **Employee Screen** (`employee.html`) for CRUD operations and top salaries view

---

## Technology Used

- **Backend**: ASP.NET Core Web API
- **Database**: Microsoft SQL Server (Views + Stored Procedures)
- **Frontend**: HTML, Bootstrap 5, Vanilla JavaScript

---

## Setup Instructions

### 1. Database Setup

- Open SQL Server Management Studio (SSMS).
- Run `EmployeeDB_FullScript.sql` to create the full schema including:
  - Tables
  - Stored Procedures
  - Views

### 2. Application Configuration

- Open `appsettings.json`.
- Update the `"Default"` connection string to match your local SQL Server instance if needed, but it is already be the same if you run the `EmployeeDB_FullScript.sql` which already have the same connection string in the appsettings so no need to do that, but it is better to double check.

### 3. Build and Run

- Open the solution in Visual Studio.
- Run the project.
- Test the API using Swagger at `https://localhost:<port>/swagger`.

---

## Sample Data for Testing

### Add Employee (POST `/api/Employee/AddEmployee`)
```json
{
  "firstName": "Ahmad",
  "lastName": "Ali",
  "jobTitle": "UI/UX",
  "dateHired": "2022-01-16",
  "salary": 1150.00
}
```

### Valid Login Credentials (POST `/api/Login`)
- `admin` / `123`
- `user1` / `password1`

---

## Update Logic (Dynamic Partial Update)

The backend supports **dynamic partial updates** using the `ISNULL()` function inside the stored procedure. That means:
- You only need to send the fields you want to update.
- All others will remain unchanged.

Example (updating salary only for employee with ID 1):
```json
{
  "salary": 1500.00
}
```

> The ID must always be included.


> There are two views features, top salaries, and top years of experience, you can just try them and will see the results of each one.

---

## Frontend Notes

Since this is my first time working with frontend technologies, I’ve implemented the following:

- Basic login page (`index.html`), when entering the valid credentials it will direct you to the employee.html page. However you can enter the employee.html directly.
- Basic employee management page (`employee.html`) including:
  - Add, View, Update, and Delete employees (each operation was done using SQL procedures)
  - View top salaries (via SQL view)

### Limitations:

- **Backend Update is Fully Dynamic** (supports partial field updates)
- **Frontend Update Requires All Fields**  
  At the moment, due to time and learning constraints, the update form requires users to fill all fields. While the backend supports partial updates, dynamically detecting and sending only changed fields on the frontend was left out for simplicity.

- **Top Experience View Limitation:**  
  The backend provides top experience via a **view**, but extracting the exact number of experience years in the frontend was challenging (since it's calculated via SQL). A more complete solution would move the experience logic into a **stored procedure** to extract and display formatted data properly.

---

## Contact

If you have any questions or suggestions, feel free to contact me at:

**meryanraad@gmail.com**
