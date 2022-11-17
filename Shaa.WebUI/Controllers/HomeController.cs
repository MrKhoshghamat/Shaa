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

    
}