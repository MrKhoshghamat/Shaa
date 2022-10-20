namespace Shaa.Domain.ViewModels;

public class LaboratoryViewModel
{
    #region Laboratory

    public Guid LaboratoryId { get; set; }
    public string LaboratoryTitle { get; set; } = null!;
    public int LaboratoryTypeId { get; set; }
    public int PassiveDefenceId { get; set; }
    public int? ApprovalAuthorityId { get; set; }
    public Guid? ResearchCenterId { get; set; }
    public int? StandardStatusId { get; set; }
    public string? PhoneNumber { get; set; }
    public string? LaboratoryImagePath { get; set; }
    public string? Address { get; set; }
    public string? LaboratoryDescription { get; set; }

    #endregion

    #region Ward

    public Guid WardId { get; set; }
    public string WardTitle { get; set; } = null!;

    #endregion

    #region Equipment

    public Guid EquipmentId { get; set; }
    public int EquipmentTypeId { get; set; }
    public string EquipmentTitle { get; set; } = null!;
    public int UsageTypeId { get; set; }
    public int? CountryId { get; set; }
    public string? CompanyName { get; set; }
    public string? Model { get; set; }
    public string? SerialNumber { get; set; }
    public DateTime? InstallationDate { get; set; }
    public DateTime? ExploitationDate { get; set; }
    public int? SupplyTypeId { get; set; }
    public long? EquipmentCost { get; set; }

    #endregion

    #region Ability

    public Guid AbilityId { get; set; }
    public string AbilityTitle { get; set; } = null!;
    public string? FurtherDetailsAndProcedure { get; set; }
    public string? DescriptionOfConsumables { get; set; }
    public long? ConsumableCost { get; set; }
    public long? HumanResourceCost { get; set; }
    public long? OtherCost { get; set; }
    public long? ImplementationCost { get; set; }
    public DateTime? ImplementationTime { get; set; }
    public string? FileAttachment { get; set; }

    #endregion
}

public enum LaboratoryResult
{
    
    LaboratoryExists,
    WardExists,
    EquipmentExist,
    AbilityExist,
    Success
}