namespace Shaa.Domain.ViewModels.Lab;

public class RegisterLaboratory_WardViewModel
{
    public string? WardTitle { get; set; }
}

public enum RegisterWardResult
{
    WardExists,
    Success
}