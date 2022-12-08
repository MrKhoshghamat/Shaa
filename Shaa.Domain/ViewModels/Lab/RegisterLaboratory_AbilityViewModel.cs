using System.ComponentModel.DataAnnotations;

namespace Shaa.Domain.ViewModels.Lab;

public class RegisterLaboratory_AbilityViewModel
{
    public int AbilityTitle { get; set; }
    public string? FurtherDetailsAndProcedure { get; set; }
    public string? DescriptionOfConsumables { get; set; }
    public string? ConsumableCost { get; set; }
    public string? HumanResourceCost { get; set; }
    public string? EquipmentCost { get; set; }
    public string? OtherCost { get; set; }
    public string? ImplementationCost { get; set; }
    public Guid EquipmentId { get; set; }

    [RegularExpression(@"^\d{4}/((0[1-9])|(1[012]))/((0[1-9]|[12]\d)|3[01])$",
        ErrorMessage = "تاریخ وارد شده معتبر نمیباشد")]
    public string? ImplementationTime { get; set; }

    public string? FileAttachment { get; set; }
    public Guid? LaboratoryId { get; set; }
}

public enum RegisterAbilityResult
{
    AbilityExists,
    Success
}