using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IEquipmentRepository : IRepository<Equipment, Guid>
{
    Task<bool> IsExistEquipmentBySerialNumber(string serialNumber);
    Task<Equipment> GetEquipmentBySerialNumber(string serialnumber);
    Task<Guid?> GetLaboratoryIdByWardId(Guid? wardId);

}