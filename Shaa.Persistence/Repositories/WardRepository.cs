using Microsoft.EntityFrameworkCore;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class WardRepository : Repository<Ward, Guid>, IWardRepository
{
    public WardRepository(ShaaDbContext context) : base(context)
    {
    }

    public async Task<bool> IsExistWardByTitle(string title, Guid? laboratoryId)
    {
        return await _dbSet.AnyAsync(p => p.Title == title && p.LaboratoryId == laboratoryId);
    }

    public async Task<Ward> GetWardByLaboratoryId(Guid laboratoryId)
    {
        return await _dbSet.FirstOrDefaultAsync(p => p.LaboratoryId == laboratoryId);
    }

    public async Task<IQueryable<Ward>> GetAllWards(Guid? laboratoryId)
    {
        return _dbSet.Where(p=>p.LaboratoryId == laboratoryId).AsQueryable();
    }
}