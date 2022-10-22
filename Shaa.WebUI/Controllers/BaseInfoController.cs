using Shaa.Business.Services.Interfaces;

namespace Shaa.WebUI.Controllers;

public class BaseInfoController : BaseController
{
    #region Ctor

    private readonly IBaseInfoTypeService _baseInfoTypeService;

    public BaseInfoController(IBaseInfoTypeService baseInfoTypeService)
    {
        _baseInfoTypeService = baseInfoTypeService;
    }

    #endregion
    
}