using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Extensions;
using Shaa.Business.Generators;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.Authorization;
using Shaa.Domain.ViewModels.Req;
using Shaa.Persistence.Repositories;

namespace Shaa.WebUI.Controllers
{
    public class AuthorizationController : Controller
    {
        // #region Ctor

        // private readonly IAuthorizationService _authorizationService;
        // private readonly IUserRepository _userRepository;
        //
        // public AuthorizationController(IAuthorizationService authorizationService, IUserRepository userRepository)
        // {
        //     _authorizationService = authorizationService;
        //     _userRepository = userRepository;
        // }
        //
        // #endregion
        //
        [HttpGet]
        public IActionResult AuthorizationIndex()
        {
            return View();
        }
        //
        // [HttpPost]
        // public async Task<IActionResult> RoleIndexPartial(FilterRoleViewModel filter)
        // {
        //     var user = await _userRepository.GetUserById(HttpContext.User.GetUserId());
        //     filter.User = user;
        //     filter.UserName = user.GetUserName();
        //     filter.UserId = user.Id;
        //     var requestList = await _requestService.FilterInboxRequest(filter);
        //
        //     return PartialView(requestList);
        // }
        //
        // public async Task<IActionResult> UserPermissionIndexPartial(FilterUserPermissionViewModel filter)
        // {
        //     var user = await _userRepository.GetUserById(HttpContext.User.GetUserId());
        //     filter.User = user;
        //     filter.UserName = user.GetUserName();
        //     filter.UserId = user.Id;
        //     
        //     var permission = await _
        // }
        //
        // [HttpGet]
        // public async Task<IActionResult> CreateRole()
        // {
        //     CreateRequestViewModel requestViewModel = new CreateRequestViewModel();
        //     ViewData["Laboratories"] = await _baseInfoService.GetAllLaboratories();
        //     ViewData["RequestTypes"] = await _baseInfoService.GetAllRequestTypes((int)BaseTableTypeId.RequestType);
        //     ViewData["Projects"] = await _baseInfoService.GetAllProjects((int)BaseTableTypeId.Projects);
        //
        //     var user = await _userRepository.GetUserById(HttpContext.User.GetUserId());
        //     requestViewModel.User = user;
        //
        //     ViewBag.RequestNo = CodeGenerator.CreateRequestNo();
        //
        //     return View(requestViewModel);
        // }
        //
        // [HttpPost]
        // public async Task<IActionResult> CreateRole(CreateRequestViewModel model)
        // {
        //     // if (model.LetterPath == null) model.LetterPath = "DefaultRequestPath.docs";
        //
        //     if (!ModelState.IsValid)
        //         return Ok(new HassError() { Data = model }
        //             .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));
        //
        //     model.UserId = HttpContext.User.GetUserId();
        //
        //     var result = await _requestService.RegisterRequest(model);
        //
        //     switch (result)
        //     {
        //         case RequestResult.IsExist:
        //             return Ok(new HassError() { Data = model }
        //                 .AddError(new ModelError("*", "این درخواست با این شماره نامه قبلا ثبت شده است")));
        //         case RequestResult.Success:
        //             return Ok(new Success() { Data = model });
        //     }
        //
        //     return Ok(new HassError() { Data = model });
        // }
        //
        // [HttpPost]
        // public async Task<IActionResult> CheckRequestWindow(Guid? Id)
        // {
        //     var request = await _requestService.GetForCheckRequest((Guid)Id);
        //     //GetForCheckRequest
        //     CheckRequestViewModel requestViewModel = new CheckRequestViewModel()
        //     {
        //         Id = request.Id,
        //         LaboratoryId = request.LaboratoryId,
        //         LaboratoryTitle = request.Laboratory.Title,
        //         UserName = request.UserName,
        //         UserId = request.UserId,
        //         //RequestDate = request.RequestDate,
        //         Title = request.Title,
        //         Description = request.Description,
        //         RequestTypeId = request.RequestTypeId,
        //         LetterPath = request.LetterPath,
        //         TraceCode = request.TraceCode,
        //         IndicatorNo = request.IndicatorNo,
        //         //User = request.User,
        //     };
        //
        //     ViewData["Laboratories"] = await _baseInfoService.GetAllLaboratories();
        //     ViewData["RequestTypes"] = await _baseInfoService.GetAllRequestTypes((int)BaseTableTypeId.RequestType);
        //     ViewData["Projects"] = await _baseInfoService.GetAllProjects((int)BaseTableTypeId.Projects);
        //
        //     var user = await _userRepository.GetUserById(HttpContext.User.GetUserId());
        //     requestViewModel.User = user;
        //
        //     ViewBag.RequestNo = CodeGenerator.CreateRequestNo();
        //
        //     return PartialView(requestViewModel);
        // }
        //
        // [HttpPost]
        // public async Task<IActionResult> RequestInfoWindow(Guid? Id)
        // {
        //     var request = await _requestService.GetForCheckRequest((Guid)Id);
        //
        //     CheckRequestViewModel requestViewModel = new CheckRequestViewModel()
        //     {
        //         Id = request.Id,
        //         LaboratoryId = request.LaboratoryId,
        //         LaboratoryTitle = request.Laboratory.Title,
        //         UserName = request.UserName,
        //         UserId = request.UserId,
        //         Title = request.Title,
        //         Description = request.Description,
        //         RequestTypeId = request.RequestTypeId,
        //         LetterPath = request.LetterPath,
        //         TraceCode = request.TraceCode,
        //         IndicatorNo = request.IndicatorNo,
        //         DescForCheck = request.DescForCheck
        //     };
        //
        //     ViewData["Laboratories"] = await _baseInfoService.GetAllLaboratories();
        //     ViewData["RequestTypes"] = await _baseInfoService.GetAllRequestTypes((int)BaseTableTypeId.RequestType);
        //     ViewData["Projects"] = await _baseInfoService.GetAllProjects((int)BaseTableTypeId.Projects);
        //
        //     var user = await _userRepository.GetUserById(HttpContext.User.GetUserId());
        //     requestViewModel.User = user;
        //
        //     //ViewBag.RequestNo = CodeGenerator.CreateRequestNo();
        //
        //     return PartialView(requestViewModel);
        // }
        //
        // [HttpPost]
        // // [Authorize]
        // public async Task<IActionResult> CheckRequest(Guid id, bool accept, string descForCheck)
        // {
        //     if (accept)
        //     {
        //         await _requestService.AcceptRequest(id, descForCheck);
        //     }
        //     else
        //     {
        //         await _requestService.RejectRequest(id, descForCheck);
        //     }
        //
        //     return Ok(new Success() { });
        // }
        //
        // [HttpPost]
        // // [Authorize]
        // public async Task<IActionResult> SetRequestStatus(Guid id, byte requestStatus)
        // {
        //     await _requestService.SetRequestStatus(id, (RequestStatus)requestStatus);
        //     return Ok(new Success() { });
        // }
        //
        // [HttpGet]
        // public async Task<IActionResult> RequestTraceCode(string traceCode)
        // {
        //     ViewBag.TraceCode = traceCode;
        //
        //     return View();
        // }
    }
}