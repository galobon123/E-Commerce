using E_CommerceWebAPI.Models;

namespace E_CommerceWebAPI.Services.Interfaces
{
    public interface IJwtService
    {
        string GenerateToken(User user);
    }
}
