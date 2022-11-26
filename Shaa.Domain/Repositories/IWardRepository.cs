using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IWardRepository : IRepository<Ward, Guid>
{
    Task<bool> IsExistWardByTitle(string title, Guid? laboratoryId);
    Task<Ward> GetWardByLaboratoryId(Guid laboratoryId);
    Task<IQueryable<Ward>> GetAllWards(Guid? laboratoryId);
}