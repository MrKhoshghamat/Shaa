using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.ViewModels.BasicInfo;

namespace Shaa.WebUI.Controllers;

public class BaseInfoController : BaseController
{
    #region Ctor

    private readonly IBaseInfoTypeService _baseInfoTypeService;
    private readonly IBaseInfoService _baseInfoService;

    public BaseInfoController(IBaseInfoTypeService baseInfoTypeService, IBaseInfoService baseInfoService)
    {
        _baseInfoTypeService = baseInfoTypeService;
        _baseInfoService = baseInfoService;
    }

    #endregion

    [HttpGet]
    public async Task<IActionResult> BaseInfoList(FilterBaseInfoViewModel filter)
    {
        var baseTableTypeId = await _baseInfoService.GetBaseTableTypeId(filter.BaseTableTypeId);
        var result = await _baseInfoService.FilterBaseInfo(filter);
        ViewBag.baseTableTypeId = baseTableTypeId;

        return View(result);
    }

    public async Task<IActionResult> BaseInfoWindow(FilterBaseInfoViewModel model)
    {
        return PartialView(model);
    }

    public async Task<IActionResult> SaveBaseInfo(FilterAbilityViewModel model)
    {
        return Ok(new Success() { Data = model });
    }
}