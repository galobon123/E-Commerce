namespace E_CommerceWebAPI.DTOs
{
    public class CartDTO
    {
        public int IdCart { get; set; }

        public int IdUser { get; set; }

        public List<ProductShoppingDTO> Products { get; set; } = new List<ProductShoppingDTO>();

    }
}
