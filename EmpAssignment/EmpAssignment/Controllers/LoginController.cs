using EmpAssignment.DTOs;
using EmpAssignment.Services;
using Microsoft.AspNetCore.Mvc;

namespace EmpAssignment.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController(IUserService userService) : ControllerBase
    {
        private readonly IUserService _userService = userService;

        [HttpPost]
        public async Task<IActionResult> Login([FromBody] UserDto userDto)
        {
            var result = await _userService.AuthenticateUserAsync(userDto);
            if (result == "Login Successful")
                return Ok(new { message = result });

            return Unauthorized(new { message = result });
        }
    }
}
