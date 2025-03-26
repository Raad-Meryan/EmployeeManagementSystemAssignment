document.getElementById("loginBtn").addEventListener("click", async function () {
    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();
    const errorMessage = document.getElementById("error-message");

    if (!username || !password) {
        errorMessage.textContent = "Please fill in all fields.";
        errorMessage.classList.remove("d-none");
        return;
    }

    const response = await fetch('/api/Login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username, password })
    });

    const result = await response.json();

    if (response.ok) {
        alert(result.message);  // Redirect logic can be added here if needed
        window.location.href = "employee.html";  // Redirect to employee page
    } else {
        errorMessage.textContent = result.message || "Login failed. Please try again.";
        errorMessage.classList.remove("d-none");
    }
});