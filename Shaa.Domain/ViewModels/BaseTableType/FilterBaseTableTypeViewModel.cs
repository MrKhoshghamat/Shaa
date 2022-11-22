using Shaa.Domain.ViewModels.Common;

namespace Shaa.Domain.ViewModels.BaseTableType;

public class FilterBaseTableTypeViewModel : PagingViewModel<BaseTableTypeListViewModel>
{
    public int Id { get; set; }
    public string? Title { get; set; }
}