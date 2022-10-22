using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IAbilityRepository : IRepository<Ability, Guid>
{
    Task<bool> IsExistAbilityByTitle(string title);
    Task<Ability> GetAbilityByTitle(string title);
}