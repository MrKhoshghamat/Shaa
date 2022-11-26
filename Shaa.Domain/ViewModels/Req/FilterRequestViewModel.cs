using Shaa.Domain.Entities;
using Shaa.Domain.ViewModels.BasicInfo;
using Shaa.Domain.ViewModels.Common;

namespace Shaa.Domain.ViewModels.Req;

public class FilterRequestViewModel : PagingViewModel<RequestListViewModel>
{
    public Guid? Id { get; set; }

    public string? Search { get; set; }
    
    public Guid LaboratoryId { get; set; }
    public bool? IsOutBox { get; set; }
    public User User { get; set; }
    
    public Guid? UserId { get; set; }
    public string UserName { get; set; }
    public FilterEnum Sort { get; set; }
}