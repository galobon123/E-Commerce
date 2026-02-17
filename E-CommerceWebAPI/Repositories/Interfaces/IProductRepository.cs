using E_CommerceWebAPI.DTOs;
using E_CommerceWebAPI.Models;

namespace E_CommerceWebAPI.Repositories.Interfaces
{
    public interface IProductRepository
    {
        Task<List<Product>> GetProduct(int? id);

        Task<VerificationDTO> CreateProduct(Product product);

        Task<VerificationDTO> UpdateProduct(int id, Product product);

        Task<VerificationDTO> DeleteProduct(int id);
    }
}
