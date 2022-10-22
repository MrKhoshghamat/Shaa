using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;

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
}