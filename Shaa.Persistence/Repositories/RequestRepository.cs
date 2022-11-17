using Microsoft.EntityFrameworkCore;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class RequestRepository : Repository<Request, Guid>, IRequestRepository
{ 
    public RequestRepository(ShaaDbContext context) : base(context)
    {
       
    } 
    
    public async Task<IQueryable<Request>> GetAllRequest()
    {
        return _dbSet.AsQueryable();
    }

}