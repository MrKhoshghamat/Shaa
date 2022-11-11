using Microsoft.EntityFrameworkCore;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class EquipmentRepository : Repository<Equipment, Guid>, IEquipmentRepository
{
    public EquipmentRepository(ShaaDbContext context) : base(context)
    {
    }

    public async Task<bool> IsExistEquipmentByTitle(string title)
    {
        return await _dbSet.AnyAsync(p => p.Title == title);
    }

    public async Task<bool> IsExistEquipmentBySerialNumber(string serialNumber)
    {
        return await _dbSet.AnyAsync(p => p.SerialNumber == serialNumber);
    }

    public async Task<Equipment> GetEquipmentBySerialNumber(string serialnumber)
    {
        return await _dbSet.FirstOrDefaultAsync(p => p.SerialNumber == serialnumber);
    }

    public async Task<Guid?> GetLaboratoryIdByWardId(Guid? wardId)
    {
        var ward = await _context.Set<Ward>().FirstOrDefaultAsync(p => p.Id == wardId);
        var laboratoryId = ward.LaboratoryId;
        return laboratoryId;
    }
 
    public async Task<IQueryable<Equipment>> GetAllEquipment()
    {
        return _dbSet.AsQueryable();
    }
}