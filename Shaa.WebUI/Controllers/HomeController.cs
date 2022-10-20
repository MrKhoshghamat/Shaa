using Microsoft.AspNetCore.Mvc;

namespace Shaa.WebUI.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }

}