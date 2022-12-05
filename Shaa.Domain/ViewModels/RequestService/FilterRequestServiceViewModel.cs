using Shaa.Domain.ViewModels.BasicInfo;
using Shaa.Domain.ViewModels.Common;

public class FilterRequestServiceViewModel : PagingViewModel<RequestServiceListViewModel>
{
    public Guid RequestId { get; set; }
    public FilterEnum Sort { get; set; }
}
