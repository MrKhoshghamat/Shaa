using Shaa.Domain.ViewModels.BasicInfo;
using Shaa.Domain.ViewModels.Common;

namespace Shaa.Business.Services.Interfaces;

public interface IBaseInfoService
{
    Task<FilterBaseInfoViewModel> FilterBaseInfo(FilterBaseInfoViewModel filter);
    Task<int> GetBaseTableTypeId(int filter);
    Task<RegisterBaseInfoResult> RegisterBaseInfo(RegisterBaseInfoViewModel baseInfo);
    Task<List<SelectListViewModel>> GetAllPassiveDefences(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllApprovalAuthorities(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllResearchCenters(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllLaboratoryTypes(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllStandardStatus(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllEquipmentTypes(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllUsageTypes(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllCountries(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllAbilityTitles(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllEquipmentSupplyTypes(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllEquipmentsStatus(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllEmploymentsStatus(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllRequestTypes(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllServices(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllRequestStatus(int? baseTableTypeId);
    Task<List<SelectListViewModel>> GetAllProjects(int? baseTableTypeId);
    Task<List<GuidSelectListViewModel>> GetAllWards(Guid? laboratoryId);
    Task<List<GuidSelectListViewModel>> GetAllEquipments(Guid? laboratoryId);
    Task<List<GuidSelectListViewModel>> GetAllLaboratories();
}