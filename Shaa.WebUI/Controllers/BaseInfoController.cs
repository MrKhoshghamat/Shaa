using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.ViewModels;
using Shaa.WebUI.ActionFilters;

namespace Shaa.WebUI.Controllers;

public class BaseInfoController : BaseController
{
    #region Ctor

    private readonly IBaseInfoTypeService _baseInfoTypeService;

    public BaseInfoController(IBaseInfoTypeService baseInfoTypeService)
    {
        _baseInfoTypeService = baseInfoTypeService;
    }

    #endregion
    
    [HttpGet("Base-Info-Type")]
    [Authorize]
    public async Task<IActionResult> BaseInfoType()
    {
        return View();
    }

    [HttpPost("Register-Base-Info-Type"), ValidateAntiForgeryToken]
    public async Task<IActionResult> BaseInfoType(BaseInfoTypeViewModel baseInfoType)
    {
        var result = await _baseInfoTypeService.RegisterBaseInfoType(baseInfoType);

        switch (result)
        {
            case BaseInfoTypeResult.BaseInfoTypeExists:
                TempData[ErrorMessage] = $"نوع اطلاعات پایه با اسم {baseInfoType.Title} قبلا ثبت شده است.";
                break;
            case BaseInfoTypeResult.Success:
                TempData[SuccessMessage] = "عملیات با موفقیت انجام شد";
                
                return RedirectToAction("BaseInfoType", "BaseInfo");
                
        }

        return View(baseInfoType);
    }
}