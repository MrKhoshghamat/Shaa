using Shaa.Domain.Entities;
using Shaa.Domain.ViewModels;
using Shaa.Domain.ViewModels.BaseTableType;
using Shaa.Domain.ViewModels.BasicInfo;

namespace Shaa.Business.Services.Interfaces;

public interface IBaseInfoTypeService
{
    Task<IEnumerable<BaseTableType>> ShowBaseTableTypeSubMenu();
    Task<FilterBaseTableTypeViewModel> FilterBaseTableType(FilterBaseTableTypeViewModel filter);
    Task<RegisterBaseTableTypeResult> RegisterBaseTableType(RegisterBaseTableTypeViewModel baseInfo);
}