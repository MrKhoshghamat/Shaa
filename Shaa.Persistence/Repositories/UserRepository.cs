using Microsoft.EntityFrameworkCore;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class UserRepository : Repository<User, Guid>, IUserRepository
{
    #region Ctor

    private ShaaDbContext _context;
    public UserRepository(ShaaDbContext context) : base(context)
    {
        _context = context;
    }

    #endregion

    public async Task<bool> IsExistUserByEmail(string email)
    {
        return await _dbSet.AnyAsync(p => p.Email.Equals(email));
    }

    public async Task<bool> IsExistByNationalNo(string nationalNo)
    {
        return await _dbSet.AnyAsync(p => p.NationalNo == nationalNo);
    }

    public async Task<User> GetUserByEmail(string email)
    {
        return await _dbSet.FirstOrDefaultAsync(p => p.Email.Equals(email));
    }

    public async Task<User?> GetUserByNationNo(string? nationalNo)
    {
        var user = await _context.Users.FirstOrDefaultAsync(p => p.NationalNo == nationalNo);
        return user;
    }

    public async Task<User> GetUserByActivationCode(string activationCode)
    {
        return await _dbSet.FirstOrDefaultAsync(p => p.EmailActivationCode.Equals(activationCode));
    }
}