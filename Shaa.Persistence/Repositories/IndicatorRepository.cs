using Microsoft.EntityFrameworkCore;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class IndicatorRepository : Repository<IndicatorNo, string>, IIndicatorRepository
{ 
    public IndicatorRepository(ShaaDbContext context) : base(context)
    {
       
    }

    public async Task<IndicatorNo?> GetLastIndicator(int indicatorId)
    {
        return await _dbSet.Where(p => p.IndicatorId == indicatorId)
            .OrderByDescending(p => p.IndicatedNumber).FirstOrDefaultAsync();
    }

    //    public Task<IndicatorNo> GetNewIndicatorNo(string info)
    //    {
    //        IndicatorNo newModel = new IndicatorNo() {
    //                 Id { get; set; } = null!;
    //        IndicatorId { get; set; }
    //        IndicatorDate { get; set; }
    //       IndicatedNumber { get; set; }
    //        ReqInfo { get; set; }
    //        ReqId { get; set; }
    //};

    //        return await _dbSet.AnyAsync(p => p.Email == email);
    //    }

    //    //public async Task<bool> IsExistUserByEmail(string email)
    //    //{
    //    //    return await _dbSet.AnyAsync(p => p.Email == email);
    //    //}

}