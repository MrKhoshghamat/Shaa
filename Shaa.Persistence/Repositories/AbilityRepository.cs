using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class AbilityRepository : Repository<Ability, Guid>, IAbilityRepository
{
    public AbilityRepository(ShaaDbContext context) : base(context)
    {
    }
}