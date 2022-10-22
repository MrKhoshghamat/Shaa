using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IBaseInfoTypeRepository : IRepository<BaseTableType, int>
{
    Task<IEnumerable<BaseTableType>> GetAllBaseTableType();
}