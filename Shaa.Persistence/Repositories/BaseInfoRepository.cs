using Microsoft.EntityFrameworkCore;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class BaseInfoRepository : Repository<BaseInfo, int>, IBaseInfoRepository
{
    public BaseInfoRepository(ShaaDbContext context) : base(context)
    {
    }

    public async Task<IQueryable<BaseInfo>> GetAllBaseInfos()
    {
        return _dbSet.AsQueryable();
    }

    public async Task<int> GetBaseTableTypeId(int tableTypeId)
    {
        return await _dbSet.Select(p => p.BaseTableTypeId).FirstOrDefaultAsync();
    }

    public async Task<List<BaseInfo>> GetAllBaseInfoByBaseTableTypeId(int? baseTableTypeId)
    {
        var baseInfos = _dbSet.AsQueryable();

        if (baseTableTypeId.HasValue)
            baseInfos = baseInfos.Where(p => p.BaseTableTypeId == baseTableTypeId);

        return await baseInfos.ToListAsync();
    }
}