using Microsoft.EntityFrameworkCore;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class MainInfoRepository : Repository<Laboratory, Guid>, IMainInfoRepository
{
    #region Ctor

    public MainInfoRepository(ShaaDbContext context) : base(context)
    {
    }

    #endregion

    public async Task<bool> IsExistLaboratoryByPhoneNumber(string phoneNumber)
    {
        return await _dbSet.AnyAsync(p => p.PhoneNumber == phoneNumber);
    }

    public async Task<bool> IsExistLaboratoryByTitle(string title)
    {
        return await _dbSet.AnyAsync(p => p.Title == title);
    }

    public async Task<Laboratory> GetLaboratoryByPhoneNumber(string phoneNumber)
    {
        return await _dbSet.FirstOrDefaultAsync(p => p.PhoneNumber == phoneNumber);
    }

    public async Task<Laboratory> GetLaboratoryByTitle(string title)
    {
        return await _dbSet.FirstOrDefaultAsync(p => p.Title == title);
    }

    public async Task<List<Laboratory>> GetAllLaboratories()
    {
        return await _dbSet.ToListAsync();
    }
}