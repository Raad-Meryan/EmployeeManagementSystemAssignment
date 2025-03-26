// Fetch and display all employees
async function fetchEmployees() {
    const response = await fetch('/api/Employee/GetAllEmployees');
    const employees = await response.json();

    const employeeTableBody = document.getElementById("employee-table-body");
    employeeTableBody.innerHTML = "";

    employees.forEach(employee => {
        const row = `
            <tr>
                <td>${employee.employeeId}</td>
                <td>${employee.firstName}</td>
                <td>${employee.lastName}</td>
                <td>${employee.jobTitle}</td>
                <td>${employee.dateHired}</td>
                <td>${employee.salary}</td>
                <td>
                    <button class="btn btn-warning btn-sm" onclick="updateEmployee(${employee.employeeId})">Update</button>
                    <button class="btn btn-danger btn-sm" onclick="deleteEmployee(${employee.employeeId})">Delete</button>
                </td>
            </tr>
        `;
        employeeTableBody.innerHTML += row;
    });
}

// Display Top Salaries
document.getElementById("viewTopSalariesBtn").addEventListener("click", async function () {
    const response = await fetch('/api/Employee/ViewTopSalaries');
    const salaries = await response.json();

    const salaryTableBody = document.getElementById("salary-experience-table-body");
    salaryTableBody.innerHTML = "";

    salaries.forEach(emp => {
        const row = `
            <tr>
                <td>${emp.employeeId || 'N/A'}</td>
                <td>${emp.fullName}</td>
                <td>${emp.jobTitle}</td>
                <td>${emp.salary}</td>
            </tr>
        `;
        salaryTableBody.innerHTML += row;
    });
});

// Add Employee
document.getElementById("addEmployeeBtn").addEventListener("click", async function () {
    const employee = {
        firstName: document.getElementById("firstName").value,
        lastName: document.getElementById("lastName").value,
        jobTitle: document.getElementById("jobTitle").value,
        dateHired: document.getElementById("dateHired").value,
        salary: parseFloat(document.getElementById("salary").value)
    };

    const response = await fetch('/api/Employee/AddEmployee', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(employee)
    });

    const result = await response.text();
    alert(result);
    fetchEmployees();
});

// Update Employee
async function updateEmployee(id) {
    const updatedEmployee = {
        firstName: prompt("Enter First Name"),
        lastName: prompt("Enter Last Name"),
        jobTitle: prompt("Enter Job Title"),
        dateHired: prompt("Enter Date Hired (yyyy-mm-dd)"),
        salary: parseFloat(prompt("Enter Salary"))
    };

    const response = await fetch(`/api/Employee/UpdateEmployee/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(updatedEmployee)
    });

    const result = await response.text();
    alert(result);
    fetchEmployees();
}

// Delete Employee
async function deleteEmployee(id) {
    const confirmation = confirm("Are you sure you want to delete this employee?");
    if (!confirmation) return;

    const response = await fetch(`/api/Employee/DeleteEmployee${id}`, {
        method: 'DELETE'
    });

    const result = await response.text();
    alert(result);
    fetchEmployees();
}

// Initial Load
document.addEventListener("DOMContentLoaded", fetchEmployees);
