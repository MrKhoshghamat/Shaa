namespace Shaa.Domain.ViewModels;

public class RegisterViewModel
{
    public string FirstName { get; set; }
    
    public string LastName { get; set; }

    public string NationalNo { get; set; }
    
    public string Password { get; set; }

    public string RePassword { get; set; }
}

public enum RegisterResult
{
    UserExists,
    Success
}