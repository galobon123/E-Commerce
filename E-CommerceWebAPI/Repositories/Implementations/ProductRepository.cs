using E_CommerceWebAPI.DTOs;
using E_CommerceWebAPI.Models;
using E_CommerceWebAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Reflection.Metadata.Ecma335;

namespace E_CommerceWebAPI.Repositories.Implementations
{
    public class ProductRepository : IProductRepository
    {

        private readonly commerce_dbContext _context;

        public ProductRepository(commerce_dbContext context)
        {
            _context = context;
        }

        public async Task<VerificationDTO> CreateProduct(Product product)
        {
            if(product != null)
            {
                product.Active = "Y";
                await _context.Products.AddAsync(product);
                await _context.SaveChangesAsync();

                return new VerificationDTO()
                {
                    Sucess = true,
                    Code = 201,
                    Message = "Se creo el producto con exito!!"
                };
            }

            return new VerificationDTO()
            {
                Sucess = false,
                Code = 400,
                Message = "No se pudo crear el producto..."
            };
        }

        public async Task<VerificationDTO> DeleteProduct(int id)
        {
            var product = await _context.Products.FindAsync(id);

            if (product == null)
            {
                return new VerificationDTO()
                {
                    Sucess = false,
                    Code = 404,
                    Message = $"No se encontro un producto con esa {id}"
                };
            }

            product.Active = "N";

            await _context.SaveChangesAsync();

            return new VerificationDTO()
            {
                Sucess = true,
                Code = 200,
                Message = "Se elimino el producto con exito!!!"
            };
        }

        public async Task<List<Product>> GetProduct(int? id)
        {
            if (id == null)
                return await _context.Products.Where(p => p.Active == "Y").ToListAsync();

            var product = await _context.Products.Where(p => p.IdProd == id
            && p.Active == "Y").ToListAsync();

            if (product == null)
                return new List<Product>();

            return product;
        }

        public async Task<VerificationDTO> UpdateProduct(int id, Product product)
        {
            var p = await _context.Products.FindAsync(id);

            if (p == null)
            {
                return new VerificationDTO()
                {
                    Sucess = false,
                    Code = 404,
                    Message = $"No se encontro un producto con esa {id}"
                };
            }

            if(!string.IsNullOrWhiteSpace(product.NameProd))
                p.NameProd = product.NameProd;
            if (!string.IsNullOrWhiteSpace(product.DescrProd))
                p.DescrProd = product.DescrProd;
            if (product.PriceProd > 0)
                p.PriceProd = product.PriceProd;
            if (product.StockProd > 0)
                p.StockProd = product.StockProd;

            await _context.SaveChangesAsync();

            return new VerificationDTO()
            {
                Sucess = true,
                Code = 200,
                Message = "Se actualizo el producto con exito"
            };
        }
    }
}
