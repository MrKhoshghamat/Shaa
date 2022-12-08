using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IAbilityRepository : IRepository<Ability, Guid>
{
    Task<bool> IsExistAbilityByTitle(int title, Guid? laboratoryId);
    Task<Ability> GetAbilityByTitle(int title);
    Task<IQueryable<Ability>> GetAllAbility();
}