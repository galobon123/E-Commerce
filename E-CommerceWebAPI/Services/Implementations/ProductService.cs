using E_CommerceWebAPI.DTOs;
using E_CommerceWebAPI.Models;
using E_CommerceWebAPI.Repositories.Interfaces;
using E_CommerceWebAPI.Services.Interfaces;
using Microsoft.IdentityModel.Tokens;
using System.Threading.Tasks;

namespace E_CommerceWebAPI.Services.Implementations
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _repository;

        public ProductService(IProductRepository repository)
        {
            _repository = repository;
        }

        public async Task<VerificationDTO> CreateProduct(CreateProductDTO productDTO)
        {
            var product = MapToProduct(productDTO);

            var result = await _repository.CreateProduct(product);

            return result;
        }

        public async Task<VerificationDTO> DeleteProduct(int id)
        {
            var result = await _repository.DeleteProduct(id);

            return result;
        }

        public async Task<List<GetProductDTO>> GetProducts(int? id)
        {
            var products = await _repository.GetProduct(id);

            if (!products.Any())
                throw new KeyNotFoundException("No se encontró ningún producto.");

            return products
                .Select(p => MapToDTO(p))
                .ToList();
        }

        public async Task<VerificationDTO> UpdateProduct(int id, UpdateProductDTO productDTO)
        {
            var producto = MapToProduct(productDTO);

            var result = await _repository.UpdateProduct(id, producto);

            return result;
        }

        #region

        public GetProductDTO MapToDTO(Product product)
        {
            GetProductDTO p = new GetProductDTO();

            p.NameProd = product.NameProd;
            p.DescrProd = product.DescrProd;
            p.PriceProd = product.PriceProd;
            p.StockProd = product.StockProd;

            return p;
        }

        public Product MapToProduct(CreateProductDTO productDTO)
        {
            var product = new Product();

            product.NameProd = productDTO.NameProd;
            product.DescrProd = productDTO.DescrProd;
            product.PriceProd = productDTO.PriceProd;
            product.StockProd = productDTO.StockProd;

            return product;
        }

        public Product MapToProduct(UpdateProductDTO productDTO)
        {
            var product = new Product();
        
            product.NameProd = productDTO.NameProd ?? "";
            product.DescrProd = productDTO.DescrProd ?? "";
            product.PriceProd = productDTO.PriceProd ?? 0;
            product.StockProd = productDTO.StockProd ?? -1;

            return product;
        }

        #endregion
    }
}
