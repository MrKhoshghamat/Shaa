using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface ILaboratoryRepository : IRepository<Laboratory, Guid>
{
    Task<bool> IsExistLaboratoryByPhoneNumber(string phoneNumber);
    Task<bool> IsExistLaboratoryByTitle(string title);
}