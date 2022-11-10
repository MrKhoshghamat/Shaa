using System.ComponentModel.DataAnnotations;
using Shaa.Domain.ViewModels.BasicInfo;
using Shaa.Domain.ViewModels.Common;

public class FilterWardViewModel : PagingViewModel<WardListViewModel>
{
    public string? Title { get; set; }
    public string? WardTitle { get; set; }
    public Guid LaboratoryId { get; set; } 
    public FilterEnum Sort { get; set; }
}

public enum FilterEnum
{
    [Display(Name = "حروف الفبا صعودی")] AlphabeticASC,
    [Display(Name = "حروف الفبا نزولی")] AlphabeticDESC,
}