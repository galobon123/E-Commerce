using E_CommerceWebAPI.DTOs;
using E_CommerceWebAPI.Models;

namespace E_CommerceWebAPI.Services.Interfaces
{
    public interface ICartService
    {
        Task<CartDTO> GetCart(int id);

        Task<VerificationDTO> AddProduct(int idProd, int idCart, int quantity);

        Task<VerificationDTO> UpdateQuantity(int idProd, int idCart, int quantity);

        Task<VerificationDTO> DeleteProduct(int idProd, int idCart);
    }
}
