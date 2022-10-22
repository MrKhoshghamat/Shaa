using Microsoft.EntityFrameworkCore;
using Shaa.Business.Security;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.BasicInfo;
using Shaa.Domain.ViewModels.Common;

namespace Shaa.Business.Services.Implementations;

public class BaseInfoService : IBaseInfoService
{
    #region Ctor

    private readonly IBaseInfoRepository _baseInfoRepository;

    public BaseInfoService(IBaseInfoRepository baseInfoRepository)
    {
        _baseInfoRepository = baseInfoRepository;
    }

    #endregion

    #region Filter

    public async Task<FilterBaseInfoViewModel> FilterBaseInfo(FilterBaseInfoViewModel filter)
    {
        var query = await _baseInfoRepository.GetAllBaseInfos();

        if (!string.IsNullOrEmpty(filter.Title))
        {
            query = query.Where(p => p.Title.Contains(filter.Title.SanitizeText().Trim()));
        }

        var result = query
            .Include(s=>s.BaseTableType)
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

    public async Task<int> GetBaseTableTypeId(int baseTableTypeId)
    {
        return await _baseInfoRepository.GetBaseTableTypeId(baseTableTypeId);
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
        var approvalAuthority = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return approvalAuthority.Select(s => new SelectListViewModel()
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
        var standardStatus = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return standardStatus.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }
    
    public async Task<List<SelectListViewModel>> GetAllEquipmentTypes(int? baseTableTypeId)
    {
        var equiomentType = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return equiomentType.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }
    
    public async Task<List<SelectListViewModel>> GetAllUsageTypes(int? baseTableTypeId)
    {
        var usageType = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return usageType.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }
    
    public async Task<List<SelectListViewModel>> GetAllCountries(int? baseTableTypeId)
    {
        var country = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return country.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }
    
    public async Task<List<SelectListViewModel>> GetAllAbilityTitles(int? baseTableTypeId)
    {
        var abilityTitle = await _baseInfoRepository.GetAllBaseInfoByBaseTableTypeId(baseTableTypeId);

        return abilityTitle.Select(s => new SelectListViewModel()
        {
            Id = s.Id,
            Title = s.Title
        }).ToList();
    }

    #endregion

    #region Passive Defence

    

    #endregion
}