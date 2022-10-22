using Shaa.Domain.Entities;
using Shaa.Domain.ViewModels;

namespace Shaa.Business.Services.Interfaces;

public interface IBaseInfoTypeService
{
    Task<IEnumerable<BaseTableType>> ShowBaseTableTypeSubMenu();
}