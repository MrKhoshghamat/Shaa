using Microsoft.EntityFrameworkCore;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class RequestServiceRepository : Repository<RequestService, Guid>, IRequestServiceRepository
{
    public RequestServiceRepository(ShaaDbContext context) : base(context)
    {
    }

    public IQueryable<RequestService> GetAllRequestServices(Guid? requestId)
    {
        return _dbSet
            .Include(p => p.Service)
            .Where(p => p.RequestId == requestId).AsQueryable();
    }
     
}