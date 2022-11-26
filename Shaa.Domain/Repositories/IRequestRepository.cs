using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IRequestRepository : IRepository<Request, Guid>
{
    Task<Request> GetForCheckRequest(Guid id);
    Task<IQueryable<Request>> GetAllRequest();
    Task<bool> IsExistRequestByRequestNo(string requestNo);
}