namespace Shaa.Domain.ViewModels;

public class LoginViewModel
{
    public string? NationalNo { get; set; }
    public string? Password { get; set; }
    public string? ReturnUrl { get; set; }
    public bool RememberMe { get; set; }
}

public enum LoginResult
{
    UserIsBanned,
    UserNotFound,
    Success
}