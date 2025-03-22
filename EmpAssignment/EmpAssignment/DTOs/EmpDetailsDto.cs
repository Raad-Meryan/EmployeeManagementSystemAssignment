namespace EmpAssignment.DTOs
{
    public class EmpDetailsDto
    {
        public int employeeId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string JobTitle { get; set; }
        public DateTime DateHired { get; set; }
        public decimal Salary { get; set; }
    }
}
