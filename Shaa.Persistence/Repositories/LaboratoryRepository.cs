using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class LaboratoryRepository : Repository<Laboratory, Guid>, ILaboratoryRepository
{
    public LaboratoryRepository(ShaaDbContext context) : base(context)
    {
    }

    public async Task<IQueryable<Laboratory>> GetAllLaboratory()
    {
        return _dbSet.AsQueryable();
    }

}