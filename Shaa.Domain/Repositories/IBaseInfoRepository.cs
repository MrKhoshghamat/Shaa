using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IBaseInfoRepository : IRepository<BaseInfo, int>
{
    Task<IQueryable<BaseInfo>> GetAllBaseInfos();
    Task<int> GetBaseTableTypeId(int tableTypeId);
    Task<List<BaseInfo>> GetAllBaseInfoByBaseTableTypeId(int? baseTableTypeId);
}