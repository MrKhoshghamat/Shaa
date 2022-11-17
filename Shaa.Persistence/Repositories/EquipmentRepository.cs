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

    public async Task<bool> IsExistEquipmentBySerialNumber(string serialNumber, Guid? laboratoryId)
    {
        return await _dbSet.AnyAsync(p => p.SerialNumber == serialNumber && p.LaboratoryId == laboratoryId);
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
 
    public async Task<IQueryable<Equipment>> GetAllEquipments(Guid? laboratoryId)
    {
        return _dbSet.Where(p=>p.LaboratoryId == laboratoryId).AsQueryable();
    }

    public async Task<Guid> GetEquipmentIdByRow(int row)
    {
        var equipment = await _dbSet.FirstOrDefaultAsync(p => p.Row == row);
        var equipmentId = equipment!.Id;
        return equipmentId;
    }
    
    public async Task<Equipment> GetEquipmentByRow(int row)
    {
        var equipment = await _dbSet.FirstOrDefaultAsync(p => p.Row == row);
        return equipment;
    }
}