using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace Shaa.Domain.ViewModels.Lab;

public class RegisterLaboratory_WardViewModel
{
    public Guid? Id { get; set; }
    public string? WardTitle { get; set; }
    public Guid? LaboratoryId { get; set; }
}

public enum RegisterWardResult
{
    WardExists,
    Success
}