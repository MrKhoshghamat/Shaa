using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;
using Shaa.Domain.ViewModels.Authorization;

namespace Shaa.Domain.Repositories;

public interface IRoleRepository : IRepository<Role, Guid>
{
    Task<IQueryable<Role>> GetAllRole();
}

public interface IPermissionRepository : IRepository<Permission, int>
{
    
}
