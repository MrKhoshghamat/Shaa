using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Shaa.WebUI.Controllers
{
    public class LaboratoryController : Controller
    {
        [HttpGet("LaboratoryWizard")]
        public IActionResult LaboratoryWizard()
        {
            return View();
        }
    }
}