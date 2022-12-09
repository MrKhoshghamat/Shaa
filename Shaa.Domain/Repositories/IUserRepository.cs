using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IUserRepository : IRepository<User, Guid>
{
    Task<bool> IsExistUserByEmail(string email);
    Task<bool> IsExistByNationalNo(string nationalNo);
    Task<User> GetUserByEmail(string email);
    Task<User?> GetUserByNationNo(string nationalNo);
    Task<User> GetUserByActivationCode(string activationCode);
    Task<User> GetUserById(Guid userId);
    User GetUserWithRolePermissionById(Guid userId);
    Task<IQueryable<User>> GetAllUsers();
}