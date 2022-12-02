using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Extensions;
using Shaa.Business.Generators;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.Req;

namespace Shaa.WebUI.Controllers;

public class RequestServiceController : BaseController
{
    #region Ctor

    private readonly IBaseInfoService _baseInfoService;
    private readonly IRequestService _requestService; 
    private readonly IUserRepository _userRepository; 

    public RequestServiceController(IBaseInfoService baseInfoService, IRequestService requestService, IUserRepository userRepository)
    {
        _baseInfoService = baseInfoService;
        _requestService = requestService; 
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
 

    #region LaboratoryService

    [HttpPost] 
    public async Task<IActionResult> ListTab(Guid Id)
    {  
        //var result = //await _wardService.FilterWard(filter);
        return PartialView(); 
    }

    [HttpPost]
    public async Task<IActionResult> LaboratoryServiceWindow(Guid? Id)
    {
        return PartialView();
    }
 
    public async Task<IActionResult> SaveLaboratoryService(/*RegisterLaboratory_WardViewModel model*/)
    {
        //if (!ModelState.IsValid)
        //    return Ok(new HassError() { Data = model }
        //        .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));

        //var result = await _registerLaboratoryService.RegisterWard(model);

        //switch (result)
        //{
        //    case RegisterWardResult.WardExists:
        //        return Ok(new HassError() { Data = model }
        //            .AddError(new ModelError("*", "بخشی با این عنوان قبلا ثبت شده است")));
        //    case RegisterWardResult.Success:
        //        return Ok(new Success() { Data = model });
        //}

        //return BadRequest(model);

        return Ok(new Success() { });
    }

    #endregion
 
    [HttpPost]
    public async Task<IActionResult> AttachmentTab(Guid Id)
    { 
        return PartialView();
    } 

}