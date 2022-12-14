using Microsoft.EntityFrameworkCore;
using Shaa.Business.Security;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.BasicInfo;
using Shaa.Domain.ViewModels.Common;

namespace Shaa.Business.Services.Implementations;

public class BaseInfoService : IBaseInfoService
{
    #region Ctor

    private readonly IBaseInfoRepository _baseInfoRepository;
    private readonly IWardRepository _wardRepository;
    private readonly IMainInfoRepository _mainInfoRepository;
    private readonly IEquipmentRepository _equipmentRepository;

    public BaseInfoService(IBaseInfoRepository baseInfoRepository, IWardRepository wardRepository,
        IMainInfoRepository mainInfoRepository, IEquipmentRepository equipmentRepository)
    {
        _baseInfoRepository = baseInfoRepository;
        _wardRepository = wardRepository;
        _mainInfoRepository = mainInfoRepository;
        _equipmentRepository = equipmentRepository;
    }

    #endregion

    #region Filter

    public async Task<FilterBaseInfoViewModel> FilterBaseInfo(FilterBaseInfoViewModel filter)
    {
        var query =
            (await _baseInfoRepository.GetAllBaseInfos()).Where(p => p.BaseTableTypeId == filter.BaseTableTypeId);

        if (!string.IsNullOrEmpty(filter.Title))
        {
            query = query.Where(p => p.Title.Contains(filter.Title.SanitizeText().Trim()));
        }

        var result = query
            .Include(s => s.BaseTableType)
            .Select(s => new BaseInfoListViewModel()
            {
                Title = s.Title,
                BaseTableTypeId = s.BaseTableTypeId
            }).AsQueryable();

        switch (filter.Sort)
        {
            case FilterBaseInfoEnum.AlphabeticASC:
                query = query.OrderBy(p => p.Title);
                break;
            case FilterBaseInfoEnum.AlphabeticDESC:
                query = query.OrderByDescending(p => p.Title);
                break;
        }

        await filter.SetPaging(result);

        return filter;
    }

    #endregion

    #region BaseInfo

    public async Task<int> GetBaseTableTypeId(int baseTableTypeId)
    {
        return await _baseInfoRepository.GetBaseTableTypeId(baseTableTypeId);
    }

    public async Task<RegisterBaseInfoResult> RegisterBaseInfo(RegisterBaseInfoViewModel baseInfo)
    {
        if (await _baseInfoRepository.IsExistedBaseInfoByTitleAndBaseTableTypeId(baseInfo.Title,
                baseInfo.BaseTableTypeId))
            return RegisterBaseInfoResult.IsExistBaseInfo;

        var baseInfoModel = new BaseInfo()
        {
            BaseTableTypeId = baseInfo.BaseTableTypeId,
            Title = baseInfo.Title.SanitizeText().Trim()
        };

        await _baseInfoRepository.AddAsync(baseInfoModel);
        await _baseInfoRepository.Save();

        return RegisterBaseInfoResult.Success;
    }

    public async Task<List<SelectListViewModel>> GetAllPassiveDefences(int? baseTableTypeId)
    {
        var passiveDefences = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return passiveDefences.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllApprovalAuthorities(int? baseTableTypeId)
    {
        var approvalAuthorites = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return approvalAuthorites.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllResearchCenters(int? baseTableTypeId)
    {
        var researchCenters = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return researchCenters.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllLaboratoryTypes(int? baseTableTypeId)
    {
        var laboratoryTypes = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return laboratoryTypes.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllStandardStatus(int? baseTableTypeId)
    {
        var standardsStatus = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return standardsStatus.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllEquipmentTypes(int? baseTableTypeId)
    {
        var equipmentTypes = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return equipmentTypes.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllUsageTypes(int? baseTableTypeId)
    {
        var usageTypes = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return usageTypes.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllCountries(int? baseTableTypeId)
    {
        var countries = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return countries.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllAbilityTitles(int? baseTableTypeId)
    {
        var abilityTitles = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return abilityTitles.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllEquipmentSupplyTypes(int? baseTableTypeId)
    {
        var equipmentSupplyTypes = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return equipmentSupplyTypes.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllRelatedSections(int? baseTableTypeId)
    {
        var RelatedSections = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return RelatedSections.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllEquipmentsStatus(int? baseTableTypeId)
    {
        var EquipmentsStatus = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return EquipmentsStatus.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllEmploymentsStatus(int? baseTableTypeId)
    {
        var EmploymentsStatus = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return EmploymentsStatus.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllRequestTypes(int? baseTableTypeId)
    {
        var requestTypes = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return requestTypes.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllServices(int? baseTableTypeId)
    {
        var services = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return services.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllRequestStatus(int? baseTableTypeId)
    {
        var requestStatus = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return requestStatus.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<SelectListViewModel>> GetAllProjects(int? baseTableTypeId)
    {
        var projects = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return projects.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    public async Task<List<GuidSelectListViewModel>> GetAllWards(Guid? laboratoryId)
    {
        var wards = await _wardRepository.GetAllWards(laboratoryId);

        return wards.Select(s => new GuidSelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).OrderBy(p => p.Title).ToList();
    }

    public async Task<List<GuidSelectListViewModel>> GetAllEquipments(Guid? laboratoryId)
    {
        var equipments = await _equipmentRepository.GetAllEquipments(laboratoryId);

        return equipments.Select(s => new GuidSelectListViewModel()
        {
            Id = s.Id,
            Title = s.PersianTitle!
        }).ToList();
    }

    public async Task<List<GuidSelectListViewModel>> GetAllLaboratories()
    {
        var laboratories = await _mainInfoRepository.GetAllLaboratories();

        return laboratories.Select(s => new GuidSelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    #endregion
}