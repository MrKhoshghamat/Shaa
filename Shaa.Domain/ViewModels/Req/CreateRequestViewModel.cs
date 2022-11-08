using System.ComponentModel.DataAnnotations;

namespace Shaa.Domain.ViewModels.Req;

public class CreateRequestViewModel
{
    public Guid Id { get; set; }
    public Guid? LaboratoryId { get; set; }
    public string UserName { get; set; } = null!;
    public string RequestLetterNo { get; set; } = null!;
    
    [RegularExpression(@"^\d{4}/((0[1-9])|(1[012]))/((0[1-9]|[12]\d)|3[01])$",
        ErrorMessage = "تاریخ وارد شده معتبر نمیباشد")]
    public string? RequestDate { get; set; }
    public string? Title { get; set; }
    public string? Description { get; set; }
    public int RequestTypeId { get; set; }
    public string? LetterPath { get; set; } 
}