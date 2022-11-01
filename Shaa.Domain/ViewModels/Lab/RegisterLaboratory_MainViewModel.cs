namespace Shaa.Domain.ViewModels.Lab;

public class RegisterLaboratory_MainViewModel
{
    public string LaboratoryTitle { get; set; } = null!;
    public int LaboratoryTypeId { get; set; }
    public int PassiveDefenceId { get; set; }
    public int? ApprovalAuthorityId { get; set; }
    public Guid? ResearchCenterId { get; set; }
    public int? StandardStatusId { get; set; }
    public string? PhoneNumber { get; set; }
    public string? LaboratoryImagePath { get; set; }
    public string? Address { get; set; }
}