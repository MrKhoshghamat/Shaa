using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain;

namespace Shaa.WebUI.Controllers;

public class RequestController : BaseController
{
    #region Ctor

    private readonly IBaseInfoService _baseInfoService;

    public RequestController(IBaseInfoService baseInfoService)
    {
        _baseInfoService = baseInfoService;
    }

    #endregion
    
    
    [HttpGet]
    public async Task<IActionResult> RequestPartial()
    {
        ViewData["Laboratories"] = await _baseInfoService.GetAllLaboratories();
        ViewData["RequestTypes"] = await _baseInfoService.GetAllRequestTypes((int)BaseTableTypeId.RequestType);
        return View();
    }
}