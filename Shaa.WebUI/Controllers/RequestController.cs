using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.Lab;
using Shaa.Domain.ViewModels.Req;

namespace Shaa.WebUI.Controllers;

public class RequestController : BaseController
{
    #region Ctor

    private readonly IBaseInfoService _baseInfoService;
    private readonly IIndicatorService _indicatorService;
    private readonly IRequestService _requestService;
    private readonly ILaboratoryRepository _laboratoryRepository;

    public RequestController(IBaseInfoService baseInfoService,
        IIndicatorService indicatorService, IRequestService requestService, ILaboratoryRepository laboratoryRepository)
    {
        _baseInfoService = baseInfoService;
        _indicatorService = indicatorService;
        _requestService = requestService;
        _laboratoryRepository = laboratoryRepository;
    }

    #endregion


    [HttpGet]
    public async Task<IActionResult> RequestIndex(FilterRequestViewModel filter)
    {
        var inboxRequest = await _requestService.FilterInboxRequest(new FilterRequestViewModel()
        {
            Search = filter.Search,
            Sort = filter.Sort,
        });

        var outBoxRequest = await _requestService.FilterOutboxRequest(new FilterRequestViewModel()
        {
            Search = filter.Search,
            Sort = filter.Sort,
        });

        // CreateRequestViewModel requestViewModel = new CreateRequestViewModel();
        // ViewData["Laboratories"] = await _baseInfoService.GetAllLaboratories();
        // ViewData["RequestTypes"] = await _baseInfoService.GetAllRequestTypes((int)BaseTableTypeId.RequestType);

        // return View(requestViewModel);

        ViewData["InboxRequest"] = inboxRequest;
        ViewData["OutBoxRequest"] = outBoxRequest;


        return View();
    }


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
        // if (!ModelState.IsValid)
        //     return Ok(new HassError() { Data = model }
        //         .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));

        var laboratory = await _laboratoryRepository.GetByRow(model.LaboratoryRow);
        var indicatorNo = await _indicatorService.GetNewIndicatorNo("ثبت درخواست");
        model.IndicatorNo = indicatorNo.Id;
        model.LaboratoryId = laboratory.Id;

        var result = await _requestService.RegisterRequest(model);

        //var result = null;//await _registerLaboratoryService.RegisterMainInfo(model);

        //switch (result)
        //{
        //    case RegisterMainResult.MainExists:
        //        return Ok(new HassError() { Data = model }
        //            .AddError(new ModelError("*", "آزمایشگاهی با این اطلاعات اصلی قبلا ثبت شده است")));
        //    case RegisterMainResult.Success:
        //        return Ok(new Success() { Data = model });
        //}

        return Ok(new Success() { Data = result });
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