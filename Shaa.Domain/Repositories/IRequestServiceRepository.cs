using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IRequestServiceRepository : IRepository<RequestService, Guid>
{
     IQueryable<RequestService> GetAllRequestServices(Guid? requestId);
}