using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Shaa.Business.Extensions;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class UserRepository : Repository<User, Guid>, IUserRepository
{
    #region Ctor

    public UserRepository(ShaaDbContext context) : base(context)
    {

    }

    #endregion

    public async Task<bool> IsExistUserByEmail(string email)
    {
        return await _dbSet.AnyAsync(p => p.Email == email);
    }

    public async Task<bool> IsExistByNationalNo(string nationalNo)
    {
        return await _dbSet.AnyAsync(p => p.NationalNo == nationalNo);
    }

    public async Task<User> GetUserByEmail(string email)
    {
        return await _dbSet.FirstOrDefaultAsync(p => p.Email == email);
    }

    public async Task<User?> GetUserByNationNo(string? nationalNo)
    {
        return await _dbSet.FirstOrDefaultAsync(p => p.NationalNo == nationalNo);
    }

    public async Task<User> GetUserByActivationCode(string activationCode)
    {
        return await _dbSet.FirstOrDefaultAsync(p => p.EmailActivationCode == activationCode);
    }

    public async Task<User> GetUserById(Guid userId)
    {
        return await _dbSet.Where(p => p.Id == userId).FirstOrDefaultAsync();
    }

    public User GetUserWithRolePermissionById(Guid userId)
    {
        return _dbSet.Where(p => p.Id == userId)
            .Include(p => p.Roles).ThenInclude(p => p.Permissions).FirstOrDefault();
    }

    public async Task<IQueryable<User>> GetAllUsers()
    {
        return _dbSet.AsQueryable();
    }
}