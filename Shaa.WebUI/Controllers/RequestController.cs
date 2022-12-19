using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Extensions;
using Shaa.Business.Generators;
using Shaa.Business.Services.Interfaces;
using Shaa.Business.Statics;
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
    private readonly IRequestServiceService _requestServiceService;

    public RequestController(IBaseInfoService baseInfoService, IRequestService requestService,
        ILaboratoryRepository laboratoryRepository,
        IUserRepository userRepository, IRequestRepository requestRepository,
        IRequestServiceService requestServiceService)
    {
        _baseInfoService = baseInfoService;
        _requestService = requestService;
        _laboratoryRepository = laboratoryRepository;
        _userRepository = userRepository;
        _requestRepository = requestRepository;
        _requestServiceService = requestServiceService;
    }

    #endregion

    [HttpGet]
    public async Task<IActionResult> RequestIndex()
    {
        // var user = await _userRepository.GetUserById(HttpContext.User.GetUserId());
        // filter.User = user;
        // filter.UserName = user.GetUserName();
        //
        // var inboxRequest = await _requestService.FilterInboxRequest(filter);
        //
        // var outBoxRequest = await _requestService.FilterOutboxRequest(filter);
        //
        // ViewData["InboxRequest"] = inboxRequest;
        // ViewData["OutBoxRequest"] = outBoxRequest;
        //

        return View();
    }


    [HttpPost]
    public async Task<IActionResult> RequestIndexPartial(FilterRequestViewModel filter)
    {
        var user = await _userRepository.GetUserById(HttpContext.User.GetUserId());
        filter.User = user;
        filter.UserName = user.GetUserName();
        filter.UserId = user.Id;
        var requestList = await _requestService.FilterInboxRequest(filter);

        return PartialView(requestList);
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
        // if (model.LetterPath == null) model.LetterPath = "DefaultRequestPath.docs";
        if (!ModelState.IsValid)
            return Ok(new HassError() { Data = model }
                .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));

        model.UserId = HttpContext.User.GetUserId();

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


    [HttpPost]
    public async Task<IActionResult> CheckRequestWindow(Guid? Id)
    {
        var request = await _requestService.GetForCheckRequest((Guid)Id);
        //GetForCheckRequest
        CheckRequestViewModel requestViewModel = new CheckRequestViewModel()
        {
            Id = request.Id,
            LaboratoryId = request.LaboratoryId,
            LaboratoryTitle = request.Laboratory.Title,
            UserName = request.UserName,
            UserId = request.UserId,
            //RequestDate = request.RequestDate,
            Title = request.Title,
            Description = request.Description,
            RequestTypeId = request.RequestTypeId,
            LetterPath = request.LetterPath,
            TraceCode = request.TraceCode,
            IndicatorNo = request.IndicatorNo,
            RequestAttachmentUniqueId = request.RequestAttachment?.UniqueId,
            //User = request.User,
        };

        ViewData["Laboratories"] = await _baseInfoService.GetAllLaboratories();
        ViewData["RequestTypes"] = await _baseInfoService.GetAllRequestTypes((int)BaseTableTypeId.RequestType);
        ViewData["Projects"] = await _baseInfoService.GetAllProjects((int)BaseTableTypeId.Projects);

        var user = await _userRepository.GetUserById(HttpContext.User.GetUserId());
        requestViewModel.User = user;

        ViewBag.RequestNo = CodeGenerator.CreateRequestNo();

        return PartialView(requestViewModel);
    }

    [HttpPost]
    public async Task<IActionResult> RequestInfoWindow(Guid? Id)
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
            DescForCheck = request.DescForCheck,
            RequestAttachmentUniqueId = request.RequestAttachment?.UniqueId
        };

        ViewData["Laboratories"] = await _baseInfoService.GetAllLaboratories();
        ViewData["RequestTypes"] = await _baseInfoService.GetAllRequestTypes((int)BaseTableTypeId.RequestType);
        ViewData["Projects"] = await _baseInfoService.GetAllProjects((int)BaseTableTypeId.Projects);

        var filterModel = new FilterRequestServiceViewModel() { RequestId = (Guid)requestViewModel.Id };
        var result = await _requestServiceService.FilterRequestService(filterModel);

        requestViewModel.FilterRequestServiceViewModel = result;

        var user = await _userRepository.GetUserById(HttpContext.User.GetUserId());
        requestViewModel.User = user;


        //ViewBag.RequestNo = CodeGenerator.CreateRequestNo();

        return PartialView(requestViewModel);
    }

    [HttpPost]
    // [Authorize]
    public async Task<IActionResult> CheckRequest(Guid id, bool accept, string descForCheck)
    {
        if (accept)
        {
            await _requestService.AcceptRequest(id, descForCheck);
        }
        else
        {
            await _requestService.RejectRequest(id, descForCheck);
        }

        return Ok(new Success() { });
    }

    [HttpPost]
    // [Authorize]
    public async Task<IActionResult> SetRequestStatus(Guid id, byte requestStatus)
    {
        await _requestService.SetRequestStatus(id, (RequestStatus)requestStatus);
        return Ok(new Success() { });
    }

    [HttpGet]
    public async Task<IActionResult> RequestTraceCode(string traceCode)
    {
        ViewBag.TraceCode = traceCode;

        return View();
    }

    public async Task<IActionResult> SaveLetter(IFormFile letterPath)
    {
        var fileName = Guid.NewGuid() + Path.GetExtension(letterPath.FileName);

        var validFormats = new List<string>()
        {
            ".png",
            ".jpg",
            ".jpeg",
            ".pdf"
        };

        var result = letterPath.UploadFile(fileName, PathTools.DefaultLetterServerPath, validFormats);

        if (!result)
        {
            return new JsonResult(new { status = "Error" });
        }

        // await _requestService.SaveLetter(requestId, fileName);
        var finalPath = PathTools.DefaultLetterServerPath + fileName;

        TempData[SuccessMessage] = "عملیات با موفقیت انجام شد.";
        return new JsonResult(new { status = "Success", letterPath = finalPath.ToLower() });
    }
}