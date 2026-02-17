using E_CommerceWebAPI.DTOs;
using E_CommerceWebAPI.Models;
using E_CommerceWebAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography.Xml;

namespace E_CommerceWebAPI.Repositories.Implementations
{
    public class CartRepository : ICartRepository
    {
        private readonly commerce_dbContext _context;

        public CartRepository(commerce_dbContext context)
        {
            _context = context;
        }

        public async Task<VerificationDTO> AddProduct(int idCart, int idProd, int quantity)
        {
            var result = await _context.ProductShoppings.FindAsync(idProd, idCart);
            var product = await _context.Products.FindAsync(idProd);

            var resultQuantity = result?.Quantity ?? 0;

            if(product == null)
            {
                return new VerificationDTO
                {
                    Code = 404,
                    Sucess = false,
                    Message = $"No existe un producto con la id {idProd}"
                };
            }

            if(product.StockProd < resultQuantity + quantity)
            {
                return new VerificationDTO
                {
                    Code = 400,
                    Sucess = false,
                    Message = $"No hay suficiente stock..."
                };
            }

            if (result == null)
            {
                ProductShopping p = new ProductShopping();

                p.IdProd = idProd;
                p.IdCart = idCart;
                p.Quantity = quantity;

                await _context.ProductShoppings.AddAsync(p);
                await _context.SaveChangesAsync();

                return new VerificationDTO
                {
                    Code = 201,
                    Sucess = true,
                    Message = $"Se sumaron {quantity} unidades del producto con exito!!!"
                };
            }
            else
            {
                result.Quantity += quantity;
                await _context.SaveChangesAsync();

                return new VerificationDTO
                {
                    Sucess = true,
                    Code = 200,
                    Message = $"Se sumaron {quantity} unidades con exito!!!"
                };
            }
        }

        public async Task<VerificationDTO> DeleteProduct(int idProd, int idCart)
        {
            var result = await _context.ProductShoppings.FindAsync(idProd, idCart);

            if (result == null)
                return new VerificationDTO
                {
                    Sucess = false,
                    Code = 404,
                    Message = "No se encontro el producto en el carrito"
                };

            _context.ProductShoppings.Remove(result);


            await _context.SaveChangesAsync();

            return new VerificationDTO
            {
                Sucess = true,
                Code = 200,
                Message = "Se actualizo el carrito correctamente"
            };
        }

        public async Task<ShoppingCart> GetCart(int id)
        {
            var cart = await _context.ShoppingCarts
                                     .Include(sc => sc.ProductShoppings)
                                        .ThenInclude(pc => pc.IdProdNavigation)
                                     .FirstOrDefaultAsync(sc => sc.IdCart == id);

            if (cart == null)
            {
                throw new KeyNotFoundException("No existe un carrito con esa id...");
            }

            return cart;
        }

        public async Task<VerificationDTO> UpdateQuantity(int idProd, int idCart, int quantity)
        {
            var result = await _context.ProductShoppings.FindAsync(idProd, idCart);
            var product = await _context.Products.FindAsync(idProd);

            if (product == null)
                return new VerificationDTO
                {
                    Sucess = false,
                    Code = 404,
                    Message = $"No se encontro un producto con la id = {idProd}"
                };

            if(product.StockProd < quantity)
                return new VerificationDTO
                {
                    Sucess = false,
                    Code = 400,
                    Message = $"No hay stock suficiente..."
                };

            if (result == null)
                return new VerificationDTO
                {
                    Sucess = false,
                    Code = 404,
                    Message = "No se encontro el producto en el carrito"
                };



            result.Quantity = quantity;
            await _context.SaveChangesAsync();

            return new VerificationDTO
            {
                Sucess = true,
                Code = 200,
                Message = "Se actualizo la cantidad con exito"
            };
        }
    }
}
