using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class RequestIndicatorRepository : Repository<RequestIndicator, long>, IRequestIndicatorRepository
{
    public RequestIndicatorRepository(ShaaDbContext context) : base(context)
    {
    }
}