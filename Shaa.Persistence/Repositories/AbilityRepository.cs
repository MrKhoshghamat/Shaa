using Microsoft.EntityFrameworkCore;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class AbilityRepository : Repository<Ability, Guid>, IAbilityRepository
{
    public AbilityRepository(ShaaDbContext context) : base(context)
    {
    }

    public async Task<bool> IsExistAbilityByTitle(string title)
    {
        return await _dbSet.AnyAsync(p => p.Title == title);
    }

    public async Task<Ability> GetAbilityByTitle(string title)
    {
        return await _dbSet.FirstOrDefaultAsync(p => p.Title == title);
    }

    public async Task<IQueryable<Ability>> GetAllAbility()
    {
        return _dbSet.AsQueryable();
    }
}