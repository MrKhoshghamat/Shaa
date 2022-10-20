using Microsoft.EntityFrameworkCore;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class BaseInfoTypeRepository : IBaseInfoTypeRepository
{
    #region Ctor

    private readonly ShaaDbContext _context;

    public BaseInfoTypeRepository(ShaaDbContext context)
    {
        _context = context;
    }

    #endregion

    public async Task<bool> IsExistBaseInfoTypeByTitle(string title)
    {
        return await _context.BaseTableTypes.AnyAsync(p => p.Title == title);
    }

    public async Task AddAsync(BaseTableType baseTableType)
    {
        await _context.AddAsync(baseTableType);
    }

    public async Task SaveAsync()
    {
        await _context.SaveChangesAsync();
    }
}