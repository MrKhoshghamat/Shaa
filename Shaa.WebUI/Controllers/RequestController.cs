using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Extensions;
using Shaa.Business.Generators;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.Req;

namespace Shaa.WebUI.Controllers;

public class RequestController : BaseController
{
    #region Ctor

    private readonly IBaseInfoService _baseInfoService;
    private readonly IRequestService _requestService;
    private readonly ILaboratoryRepository _laboratoryRepository;
    private readonly IUserRepository _userRepository;
    private readonly IRequestRepository _requestRepository;

    public RequestController(IBaseInfoService baseInfoService, IRequestService requestService,
        ILaboratoryRepository laboratoryRepository,
        IUserRepository userRepository, IRequestRepository requestRepository)
    {
        _baseInfoService = baseInfoService;
        _requestService = requestService;
        _laboratoryRepository = laboratoryRepository;
        _userRepository = userRepository;
        _requestRepository = requestRepository;
    }

    #endregion


    [HttpGet]
    public async Task<IActionResult> RequestIndex(FilterRequestViewModel filter)
    {
        var user = await _userRepository.GetUserById(HttpContext.User.GetUserId());
        filter.User = user;
        filter.UserName = user.GetUserName();
        
        var inboxRequest = await _requestService.FilterInboxRequest(filter);

        var outBoxRequest = await _requestService.FilterOutboxRequest(filter);

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
        ViewData["Projects"] = await _baseInfoService.GetAllProjects((int)BaseTableTypeId.Projects);

        var user = await _userRepository.GetUserById(HttpContext.User.GetUserId());
        requestViewModel.User = user;

        ViewBag.RequestNo = CodeGenerator.CreateRequestNo();

        return View(requestViewModel);
    }

    [HttpPost]
    // [Authorize]
    public async Task<IActionResult> CreateRequest(CreateRequestViewModel model)
    {
        if (model.LetterPath == null) model.LetterPath = "DefaultRequestPath.docs";

        var laboratory = await _laboratoryRepository.GetByRow(model.LaboratoryRow);
        model.LaboratoryId = laboratory.Id;

        if (!ModelState.IsValid)
            return Ok(new HassError() { Data = model }
                .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));

        var result = await _requestService.RegisterRequest(model);

        switch (result)
        {
            case RequestResult.IsExist:
                return Ok(new HassError() { Data = model }
                    .AddError(new ModelError("*", "این درخواست با این شماره نامه قبلا ثبت شده است")));
            case RequestResult.Success:
                return Ok(new Success() { Data = model });
        }

        return Ok(new HassError() { Data = model });

    }

    [HttpGet]
    public async Task<IActionResult> RequestTraceCode(string traceCode)
    {
        ViewBag.TraceCode = traceCode;

        return View();
    }
}