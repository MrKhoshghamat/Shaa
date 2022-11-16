using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IRequestRepository : IRepository<Request, Guid>
{
    Task<IQueryable<Request>> GetAllRequest();
}