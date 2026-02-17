using E_CommerceWebAPI.DTOs;
using E_CommerceWebAPI.Services.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace E_CommerceWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;
        private readonly IJwtService _jwtService;

        public UserController(IUserService userService, IJwtService jwtService)
        {
            _userService = userService;
            _jwtService = jwtService;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login(UserDTO model)
        {
            try
            {
                var result = await _userService.Login(model);

                var token = _jwtService.GenerateToken(result);
            
                return Ok(new { token });
            }
            catch(UnauthorizedAccessException err)
            {
                return Unauthorized(new { err.Message });
            }
            catch (Exception err)
            {
                return StatusCode(500, new { err.Message });
            }

        }

        [HttpPost("register")]
        public async Task<IActionResult> Register(UserDTO model)
        {
            try
            {
                var result = await _userService.Register(model);

                if (result.Sucess)
                    return Ok(new { message = result.Message });

                return BadRequest(new { message = result.Message });
            }
            catch (Exception err)
            {
                return StatusCode(500, new { err.Message });
            }
        }
    }
}
