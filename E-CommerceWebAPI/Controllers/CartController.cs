using E_CommerceWebAPI.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace E_CommerceWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartController : ControllerBase
    {
        private readonly ICartService _service;

        public CartController(ICartService service)
        {
            _service = service;
        }
        
        [HttpGet]
        public async Task<IActionResult> GetCart(int id)
        {
            try
            {
                var cart = await _service.GetCart(id);

                return Ok(cart);
            }
            catch (Exception err)
            {
                return StatusCode(500,new { message = $"Error interno del servido: {err.Message}" });
            }
        }

        [HttpPatch]
        public async Task<IActionResult> UpdateQuantity(int idCart, int idProd, int quantity)
        {
            try
            {
                var result = await _service.UpdateQuantity(idProd, idCart, quantity);

                if(result.Sucess)
                    return Ok(result);
                return StatusCode(result.Code, new { message = result.Message });
            }
            catch (Exception err)
            {
                return StatusCode(500, new { message = $"Error interno del servido: {err.Message}" });
            }
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteProduct(int idCart, int idProd)
        {
            try
            {
                var result = await _service.DeleteProduct(idProd, idCart);

                if (result.Sucess)
                    return Ok(result);
                return StatusCode(result.Code, new { message = result.Message });
            }
            catch (Exception err)
            {
                return StatusCode(500, new { message = $"Error interno del servido: {err.Message}" });
            }
        }

        [HttpPut]
        public async Task<IActionResult> AddProduct(int idCart, int idProd, int quantity)
        {
            try
            {
                var result = await _service.AddProduct(idProd, idCart, quantity);

                if (result.Sucess)
                    return Ok(result);
                return StatusCode(result.Code, new { message = result.Message });
            }
            catch (Exception err)
            {
                return StatusCode(500, new { message = $"Error interno del servido: {err.Message}" });
            }
        }
    }
}
