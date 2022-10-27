using System.ComponentModel.DataAnnotations;

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

    public Guid? WardId { get; set; }
    public string? WardTitle { get; set; }

    #endregion

    #region Equipment

    public Guid? Id { get; set; }
    public int EquipmentTypeId { get; set; }
    public string EquipmentTitle { get; set; } = null!;
    public string? PersianTitle { get; set; }
    public string? GeneralTechnicalSpecification { get; set; }
    public string? EquipmentUsage { get; set; }
    public int UsageTypeId { get; set; }
    public int? CountryId { get; set; }
    public string? CompanyName { get; set; }
    public string? Model { get; set; }
    public string? SerialNumber { get; set; }
    
    [RegularExpression(@"^\d{4}/((0[1-9])|(1[012]))/((0[1-9]|[12]\d)|3[01])$", ErrorMessage = "تاریخ وارد شده معتبر نمیباشد")]
    public string? InstallationDate { get; set; }
    
    [RegularExpression(@"^\d{4}/((0[1-9])|(1[012]))/((0[1-9]|[12]\d)|3[01])$", ErrorMessage = "تاریخ وارد شده معتبر نمیباشد")]
    public string? ExploitationDate { get; set; }
    public int? SupplyTypeId { get; set; }
    public long? EquipmentCost { get; set; }
    public string? EquipmentImage { get; set; }
    public int? RelatedSectionId { get; set; }
    public string? BaitulMalNo { get; set; }
    public int? EquipmentStatusId { get; set; }
    public int? EmploymentStatusId { get; set; }
    public string? PurchasePriceConstruction { get; set; }
    public bool IsNeededToCalibrate { get; set; }
    
    [RegularExpression(@"^\d{4}/((0[1-9])|(1[012]))/((0[1-9]|[12]\d)|3[01])$", ErrorMessage = "تاریخ وارد شده معتبر نمیباشد")]
    public DateTime? LastCalibrationDate { get; set; }

    [RegularExpression(@"^\d{4}/((0[1-9])|(1[012]))/((0[1-9]|[12]\d)|3[01])$", ErrorMessage = "تاریخ وارد شده معتبر نمیباشد")]
    public DateTime? WarrantyExpirationDate { get; set; }

    [RegularExpression(@"^\d{4}/((0[1-9])|(1[012]))/((0[1-9]|[12]\d)|3[01])$", ErrorMessage = "تاریخ وارد شده معتبر نمیباشد")]
    public DateTime? InsuranceExpirationDate { get; set; }
    public string? SpecialCharacteristic { get; set; }
    public string? TitlesAttachedToEquipment { get; set; }

    #endregion

    #region Ability

    public Guid? AbilityId { get; set; }
    public string AbilityTitle { get; set; } = null!;
    public string? FurtherDetailsAndProcedure { get; set; }
    public string? DescriptionOfConsumables { get; set; }
    public string? ConsumableCost { get; set; }
    public string? HumanResourceCost { get; set; }
    public string? OtherCost { get; set; }
    public string? ImplementationCost { get; set; }
    
    [RegularExpression(@"^\d{4}/((0[1-9])|(1[012]))/((0[1-9]|[12]\d)|3[01])$", ErrorMessage = "تاریخ وارد شده معتبر نمیباشد")]
    public string? ImplementationTime { get; set; }
    public string? FileAttachment { get; set; }

    #endregion
}

public enum LaboratoryResult
{
    LaboratoryExists,
    EquipmentExist,
    AbilityExist,
    Success
}