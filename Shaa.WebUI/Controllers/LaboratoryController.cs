using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shaa.Domain.ViewModels;
using Shaa.WebUI.ActionFilters;

namespace Shaa.WebUI.Controllers;

public class LaboratoryController : BaseController
{
    [HttpGet("Laboratory-Wizard")]
    [Authorize]
    public IActionResult LaboratoryWizard()
    {
        return View();
    }

    [HttpPost("Register-Laboratory")]
    [RedirectHomeIfLoggedInActionFilter]
    public async Task<IActionResult> RegisterLaboratory(LaboratoryViewModel laboratory)
    {
        TempData[SuccessMessage] = "ثبت آزمایشگاه با موفقیت انجام شد";
        return Redirect("/");
    }
}