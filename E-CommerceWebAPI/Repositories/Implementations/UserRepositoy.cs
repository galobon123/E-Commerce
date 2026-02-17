using E_CommerceWebAPI.DTOs;
using E_CommerceWebAPI.Models;
using E_CommerceWebAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace E_CommerceWebAPI.Repositories.Implementations
{
    public class UserRepositoy : IUserRepository
    {
        private readonly commerce_dbContext _context;

        public UserRepositoy(commerce_dbContext context)
        {
            _context = context;
        }

        public async Task<User> Login(User user)
        {
            var userExist = await _context.Users.Include(u => u.IdRolNavigation).FirstOrDefaultAsync(u => u.NameUser == user.NameUser);

            if (userExist == null || !BCrypt.Net.BCrypt.Verify(user.PassUser, userExist.PassUser))
                throw new UnauthorizedAccessException("Invalid password or username");

            return userExist;
        }

        public async Task<VerificationDTO> Register(User user)
        {
            var userExist = await _context.Users.FirstOrDefaultAsync(u => u.NameUser == user.NameUser);

            if (userExist != null)
                return new VerificationDTO()
                {
                    Sucess = false,
                    Code = 404,
                    Message = "Username is alredy in use..."
                };

            user.PassUser = BCrypt.Net.BCrypt.HashPassword(user.PassUser);
            user.IdRol = 2;
            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            return new VerificationDTO()
            {
                Sucess = true,
                Code = 201,
                Message = "User created successfully"
            };

        }
    }
}
