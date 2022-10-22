using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.ViewModels.BasicInfo;

namespace Shaa.WebUI.Controllers;

public class HomeController : Controller
{
    #region Ctor

    private readonly IBaseInfoService _baseInfoService;

    public HomeController(IBaseInfoService baseInfoService)
    {
        _baseInfoService = baseInfoService;
    }

    #endregion
    public IActionResult Index()
    {
        return View();
    }

    [HttpGet("BaseInfoList")]
    public async Task<IActionResult> BaseInfoList(FilterBaseInfoViewModel filter)
    {
        var basTableTypeId = await _baseInfoService.GetBaseTableTypeId(filter.BaseTableTypeId);
        var result = await _baseInfoService.FilterBaseInfo(filter);
        ViewBag.baseTableTypeId = basTableTypeId;
        
        return View(result);
    }

}