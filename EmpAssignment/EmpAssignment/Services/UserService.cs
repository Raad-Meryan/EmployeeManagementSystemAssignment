using System.Data;
using Dapper;
using EmpAssignment.DTOs;
using Microsoft.Data.SqlClient;

namespace EmpAssignment.Services
{
    public class UserService(IConfiguration configuration) : IUserService
    {
        private readonly IDbConnection _dbConnection = new SqlConnection(configuration.GetConnectionString("Default"));

        public async Task<string> AuthenticateUserAsync(UserDto userDto)
        {
            var par = new
            {
                Username = userDto.Username,
                PasswordHash = userDto.Password
            };

            var result = await _dbConnection.QueryFirstOrDefaultAsync<string>(
                "VerifyUserLogin",
                par,
                commandType: CommandType.StoredProcedure
            );

            return result ?? "Failed to authenticate user :(";
        }
    }
}
