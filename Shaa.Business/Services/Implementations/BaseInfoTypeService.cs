using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels;

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

    public async Task<BaseInfoTypeResult> RegisterBaseInfoType(BaseInfoTypeViewModel baseInfoType)
    {
        if (await _baseInfoTypeRepository.IsExistBaseInfoTypeByTitle(baseInfoType.Title))
            return BaseInfoTypeResult.BaseInfoTypeExists;

        int flag = 0;
        var baseInfoTypeModel = new BaseTableType()
        {
            Id = flag + 1,
            Title = baseInfoType.Title
        };

        await _baseInfoTypeRepository.AddAsync(baseInfoTypeModel);
        await _baseInfoTypeRepository.SaveAsync();

        return BaseInfoTypeResult.Success;
    }

    #endregion
}