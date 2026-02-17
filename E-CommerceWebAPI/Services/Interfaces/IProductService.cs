using E_CommerceWebAPI.DTOs;

namespace E_CommerceWebAPI.Services.Interfaces
{
    public interface IProductService
    {
        Task<List<GetProductDTO>> GetProducts(int? id);

        Task<VerificationDTO> CreateProduct(CreateProductDTO productDTO);

        Task<VerificationDTO> DeleteProduct(int id);

        Task<VerificationDTO> UpdateProduct(int id, UpdateProductDTO productDTO);
    }
}
