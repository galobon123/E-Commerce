using E_CommerceWebAPI.DTOs;
using E_CommerceWebAPI.Models;

namespace E_CommerceWebAPI.Services.Interfaces
{
    public interface IUserService
    {
        Task<User> Login(UserDTO userDTO);

        Task<VerificationDTO> Register(UserDTO userDTO);
    }
}
