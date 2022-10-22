using System.ComponentModel.DataAnnotations;
using Shaa.Domain.ViewModels.Common;

namespace Shaa.Domain.ViewModels.BasicInfo;

public class FilterBaseInfoViewModel : PagingViewModel<BaseInfoListViewModel>
{
    public string? Title { get; set; }
    public int BaseTableTypeId { get; set; }
    public FilterBaseInfoEnum Sort { get; set; }
}

public enum FilterBaseInfoEnum
{
    [Display(Name = "حروف الفبا صعودی")] AlphabeticASC,
    [Display(Name = "حروف الفبا نزولی")] AlphabeticDESC,
}