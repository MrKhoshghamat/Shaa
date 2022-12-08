using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class RoleRepository : Repository<Role, Guid>, IRoleRepository
{
    public RoleRepository(ShaaDbContext context) : base(context)
    {
    }
}

public class PermissionRepository : Repository<Permission, int>, IPermissionRepository
{
    public PermissionRepository(ShaaDbContext context) : base(context)
    {
    }
}