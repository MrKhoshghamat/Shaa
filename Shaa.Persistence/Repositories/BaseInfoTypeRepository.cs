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
}