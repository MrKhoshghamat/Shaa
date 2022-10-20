using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class WardRepository : Repository<Ward, Guid>, IWardRepository
{
    public WardRepository(ShaaDbContext context) : base(context)
    {
    }
}