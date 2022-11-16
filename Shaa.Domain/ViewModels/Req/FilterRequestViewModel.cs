using Shaa.Domain.ViewModels.BasicInfo;
using Shaa.Domain.ViewModels.Common;

namespace Shaa.Domain.ViewModels.Req;
public class FilterRequestViewModel : PagingViewModel<RequestListViewModel>
{
    public Guid? Id { get; set; }
    
    public string? Search { get; set; }
    public Guid LaboratoryId { get; set; } = Guid.Parse("B6EEEEB1-7FEA-458E-983E-F1EEB7D816A5");

    public string UserName { get; set; } = "sdbsdb";
    public FilterEnum Sort { get; set; }
} 