using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Extensions;
using Shaa.Business.Generators;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.Req;
using Shaa.Domain.ViewModels.ReqService;

namespace Shaa.WebUI.Controllers;

public class RequestServiceController : BaseController
{
    #region Ctor

    private readonly IBaseInfoService _baseInfoService;
    private readonly IRequestService _requestService;
    private readonly IRequestServiceService _requestServiceService;
    private readonly IUserRepository _userRepository;

    public RequestServiceController(
        IBaseInfoService baseInfoService,
        IRequestService requestService,
        IRequestServiceService requestServiceService,
        IUserRepository userRepository)
    {
        _baseInfoService = baseInfoService;
        _requestService = requestService;
        _requestServiceService = requestServiceService;
        _userRepository = userRepository;
    }

    #endregion

    [HttpPost]
    public async Task<IActionResult> Index(Guid Id)
    {
        ViewBag.Id = Id;
        return PartialView();
    }

    [HttpPost]
    public async Task<IActionResult> RequestInfoTab(Guid Id)
    {
        var request = await _requestService.GetForCheckRequest((Guid)Id);

        CheckRequestViewModel requestViewModel = new CheckRequestViewModel()
        {
            Id = request.Id,
            LaboratoryId = request.LaboratoryId,
            LaboratoryTitle = request.Laboratory.Title,
            UserName = request.UserName,
            UserId = request.UserId,
            Title = request.Title,
            Description = request.Description,
            RequestTypeId = request.RequestTypeId,
            LetterPath = request.LetterPath,
            TraceCode = request.TraceCode,
            IndicatorNo = request.IndicatorNo,
            DescForCheck = request.DescForCheck
        };

        ViewData["Laboratories"] = await _baseInfoService.GetAllLaboratories();
        ViewData["RequestTypes"] = await _baseInfoService.GetAllRequestTypes((int)BaseTableTypeId.RequestType);
        ViewData["Projects"] = await _baseInfoService.GetAllProjects((int)BaseTableTypeId.Projects);

        var user = await _userRepository.GetUserById(HttpContext.User.GetUserId());
        requestViewModel.User = user;

        return PartialView(requestViewModel);
    }

    //public async Task<IActionResult> RequestServiceTab()
    //{

    //    return PartialView();
    //}


    #region RequestService


    [HttpPost]
    public async Task<IActionResult> ListTab(Guid id)
    {
        var filterModel = new FilterRequestServiceViewModel() { RequestId = id };
        return PartialView(filterModel);
    }


    [HttpPost]
    public async Task<IActionResult> ListData(Guid id)
    {
        var filterModel = new FilterRequestServiceViewModel() { RequestId = id };
        var result = await _requestServiceService.FilterWard(filterModel);
        return PartialView(result);
    }

    [HttpPost]
    public async Task<IActionResult> RequestServiceWindow(Guid Id)
    {
        ViewData["Services"] = await _baseInfoService.GetAllServices((int)BaseTableTypeId.Service);
        return PartialView(new RegisterRequestServiceViewModel() { RequestId = Id });
    }

    public async Task<IActionResult> SaveRequestService(RegisterRequestServiceViewModel model)
    {
        if (!ModelState.IsValid)
            return Ok(new HassError() { Data = model }
                .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));

        await _requestServiceService.RegisterRequestService(model);

        return Ok(new Success() { });
    }

    #endregion

    // [HttpPost]
    // public async Task<IActionResult> AttachmentTab(Guid Id)
    // { 
    //     return PartialView();
    // } 

}