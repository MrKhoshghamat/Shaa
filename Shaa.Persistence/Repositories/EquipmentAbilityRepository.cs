using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class EquipmentAbilityRepository : Repository<EquipmentAbility, long>, IEquipmentAbilityRepository
{
    public EquipmentAbilityRepository(ShaaDbContext context) : base(context)
    {
    }
}