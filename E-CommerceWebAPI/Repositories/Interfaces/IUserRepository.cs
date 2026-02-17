using E_CommerceWebAPI.DTOs;
using E_CommerceWebAPI.Models;

namespace E_CommerceWebAPI.Repositories.Interfaces
{
    public interface IUserRepository
    {
        Task<User> Login(User user);

        Task<VerificationDTO> Register(User user);
    }
}
