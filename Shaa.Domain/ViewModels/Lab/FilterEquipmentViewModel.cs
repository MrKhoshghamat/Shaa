using Shaa.Domain.ViewModels.BasicInfo;
using Shaa.Domain.ViewModels.Common;

public class FilterEquipmentViewModel : PagingViewModel<EquipmentListViewModel>
{
    public Guid? Id { get; set; }
    public string? Search { get; set; }

    //public string? WardTitle { get; set; }
    public Guid LaboratoryId { get; set; }
    public FilterEnum Sort { get; set; }
}

//public enum FilterEnum
//{
//    [Display(Name = "حروف الفبا صعودی")] AlphabeticASC,
//    [Display(Name = "حروف الفبا نزولی")] AlphabeticDESC,
//}