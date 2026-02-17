namespace E_CommerceWebAPI.DTOs
{
    public class ProductShoppingDTO
    {
        public ProductCartDTO Product { get; set; } = new ProductCartDTO();

        public int Quantity { get; set; }
    }
}
