namespace E_CommerceWebAPI.DTOs
{
    public class VerificationDTO
    {
        public int Code { get; set; }

        public bool Sucess { get; set; }

        public string Message { get; set; } = string.Empty;
    }
}
