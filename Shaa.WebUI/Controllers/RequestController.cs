using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain;
using Shaa.Domain.ViewModels.Lab;
using Shaa.Domain.ViewModels.Req;

namespace Shaa.WebUI.Controllers;

public class RequestController : BaseController
{
    #region Ctor

    private readonly IBaseInfoService _baseInfoService;
    private readonly IIndicatorService _indicatorService;
    public RequestController(IBaseInfoService baseInfoService, IIndicatorService indicatorService)
    {
        _baseInfoService = baseInfoService;
        _indicatorService = indicatorService;
    }

    #endregion


    [HttpGet]
    public async Task<IActionResult> CreateRequest()
    {
        CreateRequestViewModel requestViewModel = new CreateRequestViewModel();
        ViewData["Laboratories"] = await _baseInfoService.GetAllLaboratories();
        ViewData["RequestTypes"] = await _baseInfoService.GetAllRequestTypes((int)BaseTableTypeId.RequestType);

        return View(requestViewModel);
    }

    [HttpPost]
    // [Authorize]
    public async Task<IActionResult> CreateRequest(CreateRequestViewModel model)
    {
        if (!ModelState.IsValid) return Ok(new HassError() { Data = model }
            .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));

        var indicatorNo = await _indicatorService.GetNewIndicatorNo("ثبت درخواست");
        Shaa.Domain.Entities.Request request = new Domain.Entities.Request()
        {
            IndicatorNo = indicatorNo.Id
        };


        //var result = null;//await _registerLaboratoryService.RegisterMainInfo(model);

        //switch (result)
        //{
        //    case RegisterMainResult.MainExists:
        //        return Ok(new HassError() { Data = model }
        //            .AddError(new ModelError("*", "آزمایشگاهی با این اطلاعات اصلی قبلا ثبت شده است")));
        //    case RegisterMainResult.Success:
        //        return Ok(new Success() { Data = model });
        //}

        return BadRequest(model);
    }

    [HttpGet]
    public async Task<IActionResult> RequestTraceCode(string traceCode)
    {
        var model = new RequestTraceCodeViewModel()
        {

        };

        //ViewData["Laboratories"] = await _baseInfoService.GetAllLaboratories();
        //ViewData["RequestTypes"] = await _baseInfoService.GetAllRequestTypes((int)BaseTableTypeId.RequestType);

        return View(model);
    }
}