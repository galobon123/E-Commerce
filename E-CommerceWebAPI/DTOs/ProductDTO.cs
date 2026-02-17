using System.ComponentModel.DataAnnotations;

namespace E_CommerceWebAPI.DTOs
{
    public class GetProductDTO
    {
        public string NameProd { get; set; } = string.Empty;

        public string DescrProd { get; set; } = string.Empty;

        public decimal PriceProd { get; set; }

        public int StockProd { get; set; }
    }

    public class CreateProductDTO
    {
        [Required]
        public string NameProd { get; set; } = string.Empty;

        [Required]
        public string DescrProd { get; set; } = string.Empty;

        [Required]
        [Range(0,int.MaxValue)]
        public decimal PriceProd { get; set; }

        [Required]
        [Range(0,int.MaxValue)]
        public int StockProd { get; set; }
    }

    public class UpdateProductDTO
    {
        public string? NameProd { get; set; } = string.Empty;

        public string? DescrProd { get; set; } = string.Empty;

        public decimal? PriceProd { get; set; }

        public int? StockProd { get; set; }
    }

    public class ProductCartDTO
    {
        public string NameProd { get; set; } = string.Empty;

        public string DescrProd { get; set; } = string.Empty;

        public decimal PriceProd { get; set; }
    }
}
