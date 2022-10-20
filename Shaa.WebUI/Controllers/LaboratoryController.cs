using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Shaa.Domain.ViewModels;
using Shaa.WebUI.ActionFilters;

namespace Shaa.WebUI.Controllers
{
    public class LaboratoryController : BaseController
    {
        [HttpGet("Laboratory-Wizard")]
        public IActionResult LaboratoryWizard()
        {
            return View();
        }

        [HttpPost("Register-Laboratory")]
        [RedirectHomeIfLoggedInActionFilter]
        public Task<IActionResult> RegisterLaboratory(LaboratoryViewModel laboratory)
        {
            return null;
        }
    }
}