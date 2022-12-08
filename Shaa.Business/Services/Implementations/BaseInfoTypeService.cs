using Shaa.Business.Security;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.BaseTableType;
using Shaa.Domain.ViewModels.BasicInfo;

namespace Shaa.Business.Services.Implementations;

public class BaseInfoTypeService : IBaseInfoTypeService
{
    #region Ctor

    private readonly IBaseInfoTypeRepository _baseInfoTypeRepository;

    public BaseInfoTypeService(IBaseInfoTypeRepository baseInfoTypeRepository)
    {
        _baseInfoTypeRepository = baseInfoTypeRepository;
    }

    #endregion

    #region Register Base Info Type

    #endregion

    public async Task<IEnumerable<BaseTableType>> ShowBaseTableTypeSubMenu()
    {
        return await _baseInfoTypeRepository.GetAllBaseTableType();
    }

    public async Task<FilterBaseTableTypeViewModel> FilterBaseTableType(FilterBaseTableTypeViewModel filter)
    {
        var query =
            (await _baseInfoTypeRepository.GetAllBaseTableTypeAsQueryable());

        if (!string.IsNullOrEmpty(filter.Title))
        {
            query = query.Where(p => p.Title.Contains(filter.Title.SanitizeText().Trim()));
        }

        var result = query
            .Select(s => new BaseTableTypeListViewModel()
            {
                Title = s.Title
            }).OrderBy(p=>p.Title).AsQueryable();

        await filter.SetPaging(result);

        return filter;
    }

    public async Task<RegisterBaseTableTypeResult> RegisterBaseTableType(RegisterBaseTableTypeViewModel baseTableType)
    {
        if (await _baseInfoTypeRepository.IsExistedBaseTableTypeByTitleAndBaseTableTypeId(baseTableType.Title))
            return RegisterBaseTableTypeResult.IsExisted;

        var lastId = await _baseInfoTypeRepository.GetLastBaseTableTypeId();

        var baseTableTypeModel = new BaseTableType()
        {
            Id = lastId + 1,
            Title = baseTableType.Title
        };

        await _baseInfoTypeRepository.AddAsync(baseTableTypeModel);
        await _baseInfoTypeRepository.Save();

        return RegisterBaseTableTypeResult.Success;
    }
}