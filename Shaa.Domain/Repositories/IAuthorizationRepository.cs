using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IRoleRepository : IRepository<Role, Guid>
{
    
}

public interface IPermissionRepository : IRepository<Permission, int>
{
    
}
