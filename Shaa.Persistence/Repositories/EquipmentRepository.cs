using Microsoft.EntityFrameworkCore;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class EquipmentRepository : Repository<Equipment, Guid>, IEquipmentRepository
{
    public EquipmentRepository(ShaaDbContext context) : base(context)
    {
    }

    public async Task<bool> IsExistEquipmentByTitle(string title)
    {
        return await _dbSet.AnyAsync(p => p.Title == title);
    }
}