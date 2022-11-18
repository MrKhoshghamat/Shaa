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

    [HttpPost]
    public async Task<IActionResult> BaseInfoWindow(RegisterBaseInfoViewModel model)
    {
        return PartialView(model);
    }

    [HttpPost]
    public async Task<IActionResult> SaveBaseInfo(RegisterBaseInfoViewModel model)
    {
        if (!ModelState.IsValid)
            return Ok(new HassError() { Data = model }
                .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));

        var result = await _baseInfoService.RegisterBaseInfo(model);

        switch (result)
        {
            case RegisterBaseInfoResult.IsExistBaseInfo:
                return Ok(new HassError() { Data = model }
                    .AddError(new ModelError("*", "این عنوان در این نوع اطلاعات پایه قبلا ثبت شده است")));
            case RegisterBaseInfoResult.Success:
                return Ok(new Success() { Data = model });
        }

        return Ok(new HassError() { Data = model });
    }
}