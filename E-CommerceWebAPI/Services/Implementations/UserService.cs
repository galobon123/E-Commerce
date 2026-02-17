using E_CommerceWebAPI.DTOs;
using E_CommerceWebAPI.Models;
using E_CommerceWebAPI.Repositories.Interfaces;
using E_CommerceWebAPI.Services.Interfaces;

namespace E_CommerceWebAPI.Services.Implementations
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _repository;

        public UserService(IUserRepository repository)
        {
            _repository = repository;
        }

        public Task<User> Login(UserDTO userDTO)
        {
            var result = _repository.Login(MapToUser(userDTO));

            return result;
        }

        public Task<VerificationDTO> Register(UserDTO userDTO)
        {
            var result = _repository.Register(MapToUser(userDTO));

            return result;
        }

        private User MapToUser(UserDTO userDTO)
        {
            return new User()
            {
                NameUser = userDTO.UserName,
                PassUser = userDTO.Password
            };
        }
    }
}
