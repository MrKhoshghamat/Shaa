namespace Shaa.Domain.ViewModels.BasicInfo;

public class LaboratoryListViewModel
{
    public Guid LaboratoryId { get; set; }
    public string? Title { get; set; } 
    public string? LaboratoryTypeTitle { get; set; }
    public string? ApprovalAuthorityTitle { get; set; }
    public string? ResearchCenterTitle { get; set; }
    public string? StandardStatusTitle { get; set; }
    public string? PassiveDefenceTitle { get; set; } 
}