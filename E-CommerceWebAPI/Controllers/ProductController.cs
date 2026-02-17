using E_CommerceWebAPI.DTOs;
using E_CommerceWebAPI.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.ComponentModel.DataAnnotations;
using System.Reflection.Metadata.Ecma335;
using BCrypt.Net;
using Microsoft.AspNetCore.Authorization;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace E_CommerceWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductService _service;

        public ProductController(IProductService service)
        {
            _service = service;
        }


        [HttpGet]
        public async Task<IActionResult> GetProducts(int? id)
        {
            try
            {
                Console.WriteLine(BCrypt.Net.BCrypt.HashPassword("hashed_pass_123"));
                Console.WriteLine(BCrypt.Net.BCrypt.HashPassword("hashed_pass_admin"));
                Console.WriteLine(BCrypt.Net.BCrypt.HashPassword("hashed_pass_juan"));

                var result = await _service.GetProducts(id);

                return Ok(result);
            }
            catch (KeyNotFoundException err)
            {
                return NotFound(new { message = err.Message });
            }
            catch (Exception err)
            {
                return StatusCode(500, new { message = $"Error del servidor interno: {err}" });
            }
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        public async Task<IActionResult> PostProduct(CreateProductDTO productDTO)
        {
            try
            {
                var result = await _service.CreateProduct(productDTO);

                if(result.Sucess)
                    return Ok( new { message = result.Message });

                return BadRequest(new {message = result.Message});
            }
            catch (Exception err)
            {
                return StatusCode(500, new { message = $"Error del servidor interno: {err}" });
            }
        }

        [HttpPatch]
        public async Task<IActionResult> PutProduct([Range(0,int.MaxValue)]int id,UpdateProductDTO productDTO)
        {
            try
            {
                var result = await _service.UpdateProduct(id, productDTO);

                if (result.Sucess)
                    return Ok(new { message = result.Message });

                return BadRequest(new { message = result.Message });
            }
            catch (Exception err)
            {
                return StatusCode(500, new { message = $"Error del servidor interno: {err}" });
            }
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteProduct(int id)
        {
            try
            {
                var result = await _service.DeleteProduct(id);

                if (result.Sucess)
                    return Ok(new { message = result.Message });

                return BadRequest(new { message = result.Message });
            }
            catch (Exception err)
            {
                return StatusCode(500, new { message = $"Error del servidor interno: {err}" });
            }
        }
    }
}
