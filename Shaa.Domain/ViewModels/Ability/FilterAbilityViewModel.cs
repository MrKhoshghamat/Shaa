using Shaa.Domain.ViewModels.BasicInfo;
using Shaa.Domain.ViewModels.Common;

public class FilterAbilityViewModel : PagingViewModel<AbilityListViewModel>
{
    public Guid? Id { get; set; }
    public string? Search { get; set; } 
    public Guid LaboratoryId { get; set; }
    public FilterEnum Sort { get; set; }
} 