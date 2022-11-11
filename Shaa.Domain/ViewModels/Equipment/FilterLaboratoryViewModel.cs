using Shaa.Domain.ViewModels.BasicInfo;
using Shaa.Domain.ViewModels.Common;

public class FilterLaboratoryViewModel : PagingViewModel<LaboratoryListViewModel>
{
    public string? Search { get; set; } 
    public FilterEnum Sort { get; set; }
}
 