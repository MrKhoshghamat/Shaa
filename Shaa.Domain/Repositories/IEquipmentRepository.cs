using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IEquipmentRepository : IRepository<Equipment, Guid>
{
    Task<bool> IsExistEquipmentBySerialNumber(string serialNumber, Guid? laboratoryId);
    Task<Equipment> GetEquipmentBySerialNumber(string serialnumber);
    Task<Guid?> GetLaboratoryIdByWardId(Guid? wardId);
    Task<IQueryable<Equipment>> GetAllEquipments(Guid? laboratoryId);
    Task<Guid> GetEquipmentIdByRow(int row);
    Task<Equipment> GetEquipmentByRow(int row);
}