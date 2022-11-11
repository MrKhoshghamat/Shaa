namespace Shaa.Business.Services.Interfaces;

public interface IEquipmentService
{
    Task<FilterEquipmentViewModel> FilterEquipment(FilterEquipmentViewModel filter);
}