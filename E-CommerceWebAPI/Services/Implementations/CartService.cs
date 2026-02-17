using E_CommerceWebAPI.DTOs;
using E_CommerceWebAPI.Models;
using E_CommerceWebAPI.Repositories.Interfaces;
using E_CommerceWebAPI.Services.Interfaces;

namespace E_CommerceWebAPI.Services.Implementations
{
    public class CartService : ICartService
    {
        private readonly ICartRepository _repository;

        public CartService(ICartRepository repository)
        {
            _repository = repository;
        } 
        public async Task<VerificationDTO> AddProduct(int idProd, int idCart, int quantity)
        {
            return await _repository.AddProduct(idProd, idCart, quantity);
        }

        public async Task<VerificationDTO> DeleteProduct(int idProd, int idCart)
        {
            return await _repository.DeleteProduct(idProd, idCart);
        }

        public async Task<CartDTO> GetCart(int id)
        {
            var cart = await _repository.GetCart(id);

            return MapToDTO(cart);
            
        }

        public async Task<VerificationDTO> UpdateQuantity(int idProd, int idCart, int quantity)
        {
            return await _repository.UpdateQuantity(idProd, idCart, quantity);
        }

        private CartDTO MapToDTO(ShoppingCart cart)
        {
            return new CartDTO()
            {
                IdCart = cart.IdCart,
                IdUser = cart.IdUser,
                Products = cart.ProductShoppings.Select(pc => new ProductShoppingDTO()
                {
                    Product = new ProductCartDTO()
                    {
                        NameProd = pc.IdProdNavigation.NameProd,
                        DescrProd = pc.IdProdNavigation.DescrProd,
                        PriceProd = pc.IdProdNavigation.PriceProd
                    },
                    Quantity = pc.Quantity
                    
                }).ToList()
            };
        } 
    }
}
