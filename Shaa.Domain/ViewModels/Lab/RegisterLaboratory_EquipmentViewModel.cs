using System.ComponentModel.DataAnnotations;

namespace Shaa.Domain.ViewModels.Lab;

public class RegisterLaboratory_EquipmentViewModel
{
    public Guid? Id { get; set; }
    public int EquipmentTypeId { get; set; }
    public string EquipmentTitle { get; set; } = null!;
    public string? PersianTitle { get; set; }
    public string? GeneralTechnicalSpecification { get; set; }
    public string? EquipmentUsage { get; set; }
    public int UsageTypeId { get; set; }
    public int? CountryId { get; set; }
    public string? CompanyName { get; set; }
    public string? ModelTitle { get; set; }
    public string? SerialNumber { get; set; }

    [RegularExpression(@"^\d{4}/((0[1-9])|(1[012]))/((0[1-9]|[12]\d)|3[01])$",
        ErrorMessage = "تاریخ وارد شده معتبر نمیباشد")]
    public string? InstallationDate { get; set; }

    [RegularExpression(@"^\d{4}/((0[1-9])|(1[012]))/((0[1-9]|[12]\d)|3[01])$",
        ErrorMessage = "تاریخ وارد شده معتبر نمیباشد")]
    public string? ExploitationDate { get; set; }

    public int? SupplyTypeId { get; set; }
    public string? EquipmentImage { get; set; }
    public int? RelatedSectionId { get; set; }
    public string? BaitulMalNo { get; set; }
    public int? EquipmentStatusId { get; set; }
    public int? EmploymentStatusId { get; set; }
    public string? PurchasePriceConstruction { get; set; }
    public string? EquipmentCost { get; set; }
    public bool IsNeededToCalibrate { get; set; }

    [RegularExpression(@"^\d{4}/((0[1-9])|(1[012]))/((0[1-9]|[12]\d)|3[01])$",
        ErrorMessage = "تاریخ وارد شده معتبر نمیباشد")]
    public string? LastCalibrationDate { get; set; }

    [RegularExpression(@"^\d{4}/((0[1-9])|(1[012]))/((0[1-9]|[12]\d)|3[01])$",
        ErrorMessage = "تاریخ وارد شده معتبر نمیباشد")]
    public string? WarrantyExpirationDate { get; set; }

    [RegularExpression(@"^\d{4}/((0[1-9])|(1[012]))/((0[1-9]|[12]\d)|3[01])$",
        ErrorMessage = "تاریخ وارد شده معتبر نمیباشد")]
    public string? InsuranceExpirationDate { get; set; }

    public string? SpecialCharacteristic { get; set; }
    public string? TitlesAttachedToEquipment { get; set; }
    public Guid? WardId { get; set; }
    public Guid? LaboratoryId { get; set; }
}

public enum RegisterEquipmentResult
{
    EquipmentExists,
    Success
}