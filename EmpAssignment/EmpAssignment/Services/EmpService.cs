using System.Data;
using Dapper;
using EmpAssignment.DTOs;
using Microsoft.Data.SqlClient;

namespace EmpAssignment.Services
{
    public class EmpService(IConfiguration configuration) : IEmpService
    {
        private readonly IDbConnection _dbConnection = new SqlConnection(configuration.GetConnectionString("Default"));

        public async Task<IEnumerable<EmpDetailsDto>> GetEmpAsync()
        {
            var result = await _dbConnection.QueryAsync<EmpDetailsDto>(
                "GetEmployees",
                commandType: CommandType.StoredProcedure
                );
            return result;
        }

        public async Task<string> AddEmpAsync(EmpDto empDto)
        {
            var par = new
            {
                empDto.FirstName,
                empDto.LastName,
                empDto.JobTitle,
                empDto.DateHired,
                empDto.Salary
            };

            var result = await _dbConnection.QueryFirstOrDefaultAsync<string>(
                "AddEmployee",
                par,
                commandType: CommandType.StoredProcedure
            );
            return result ?? "Failed to add employee :(";
        }

        public async Task<string> UpdateEmpAsync(UpdateEmpDto empDto)
        {
            var par = new
            {
                empDto.employeeId,
                empDto.FirstName,
                empDto.LastName,
                empDto.JobTitle,
                empDto.DateHired,
                empDto.Salary
            };

            var result = await _dbConnection.QueryFirstOrDefaultAsync<string>(
                "UpdateEmployee",
                par,
                commandType: CommandType.StoredProcedure
            );
            return result ?? "Failed to update employee :(";
        }

        public async Task<string> DeleteEmpAsync(int empId)
        {
            var parameters = new { Id = empId };
            var result = await _dbConnection.QueryFirstOrDefaultAsync<string>(
                "DeleteEmployee",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            return result ?? "Failed to delete employee.";
        }

        public async Task<IEnumerable<EmpSalaries>> ViewTopSalaries()
        {
            var result = await _dbConnection.QueryAsync<EmpSalaries>(
                "SELECT * FROM TopSalaries");
            return result;
        }

        public async Task<IEnumerable<EmpExperience>> ViewTopExperience()
        {
            var result = await _dbConnection.QueryAsync<EmpExperience>(
                "SELECT * FROM MostExp");
            return result;
        }
    }
}
