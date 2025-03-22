using EmpAssignment.DTOs;

namespace EmpAssignment.Services
{
    public interface IUserService
    {
        Task<string> AuthenticateUserAsync(UserDto userDto);
    }
}
