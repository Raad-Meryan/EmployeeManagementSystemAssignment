using EmpAssignment.DTOs;
using EmpAssignment.Services;
using Microsoft.AspNetCore.Mvc;

namespace EmpAssignment.Controllers
{
    [Route("api/Employee")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly IEmpService _empService;

        public EmployeeController(IEmpService empService)
        {
            _empService = empService;
        }

        [HttpGet("GetAllEmployees")]
        public async Task<IActionResult> GetEmps()
        {
            var emps = await _empService.GetEmpAsync();
            return Ok(emps);
        }

        [HttpPost("AddEmployee")]
        public async Task<IActionResult> AddEmp([FromBody] EmpDto empDto)
        {
            var result = await _empService.AddEmpAsync(empDto);
            if (result.Contains("Employee Added Successfully ;)"))
                return Ok(result);

            return NotFound(result);
        }

        [HttpPut("UpdateEmployee/{id}")]
        public async Task<IActionResult> UpdateEmp(int id, [FromBody] UpdateEmpDto empDto)
        {
            empDto.employeeId = id;
            var result = await _empService.UpdateEmpAsync(empDto);
            if (result.Contains("Employee updated successfully! :)"))
                return Ok(result);

            return NotFound(result);
        }

        [HttpDelete("DeleteEmployee{id}")]
        public async Task<IActionResult> DeleteEmployee(int id)
        {
            var result = await _empService.DeleteEmpAsync(id);
            if (result.Contains("Employee Deleted Successfully :)"))
                return Ok(result);

            return NotFound(result);
        }

        [HttpGet("ViewTopSalaries")]
        public async Task<IActionResult> ViewTopSalaries()
        {
            var result = await _empService.ViewTopSalaries();
            return Ok(result);
        }

        [HttpGet("ViewTopExperience")]
        public async Task<IActionResult> ViewTopExperience()
        {
            var result = await _empService.ViewTopExperience();
            return Ok(result);
        }
    }
}
