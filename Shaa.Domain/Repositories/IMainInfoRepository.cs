using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IMainInfoRepository : IRepository<Laboratory, Guid>
{
    Task<bool> IsExistLaboratoryByPhoneNumber(string phoneNumber);
    Task<bool> IsExistLaboratoryByTitle(string title);
    Task<Laboratory> GetLaboratoryByPhoneNumber(string phoneNumber);
    Task<Laboratory> GetLaboratoryByTitle(string title); 
    Task<List<Laboratory>> GetAllLaboratories();
}