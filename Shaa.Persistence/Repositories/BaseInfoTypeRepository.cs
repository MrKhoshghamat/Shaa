using Microsoft.EntityFrameworkCore;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class BaseInfoTypeRepository : Repository<BaseTableType, int>, IBaseInfoTypeRepository
{
    #region Ctor

    public BaseInfoTypeRepository(ShaaDbContext context) : base(context)
    {
    }

    #endregion

    public async Task<IEnumerable<BaseTableType>> GetAllBaseTableType()
    {
        return await _dbSet.ToListAsync();
    }

    public async Task<IQueryable<BaseTableType>> GetAllBaseTableTypeAsQueryable()
    {
        return _dbSet.AsQueryable();
    }

    public async Task<bool> IsExistedBaseTableTypeByTitleAndBaseTableTypeId(string title)
    {
        return await _dbSet.AnyAsync(s => s.Title == title);
    }

    public async Task<int> GetLastBaseTableTypeId()
    {
        var baseTableType = await _dbSet.OrderByDescending(s => s.Id).FirstAsync();
        return baseTableType.Id;
    }
}