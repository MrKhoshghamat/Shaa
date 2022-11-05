namespace Shaa.Domain.ViewModels.Lab;

public class RegisterLaboratory_MainViewModel
{
    public Guid? Id { get; set; }
    public string LaboratoryTitle { get; set; } = null!;
    public int LaboratoryTypeId { get; set; }
    public int PassiveDefenceId { get; set; }
    public int? ApprovalAuthorityId { get; set; }
    public int? ResearchCenterId { get; set; }
    public int? StandardStatusId { get; set; }
    public string? PhoneNumber { get; set; }
    public string? LaboratoryImagePath { get; set; }
    public string? Address { get; set; }
}

public enum RegisterMainResult
{
    MainExists,
    Success
}