using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.BaseTableType;
using Shaa.Domain.ViewModels.BasicInfo;

namespace Shaa.WebUI.Controllers
{
    public class BaseTableTypeController : BaseController
    {
        private readonly IBaseInfoTypeService _baseInfoTypeService;

        public BaseTableTypeController(IBaseInfoTypeService baseInfoTypeService)
        {
            _baseInfoTypeService = baseInfoTypeService;
        }
        
        [HttpGet]
        public async Task<IActionResult> BaseTableTypeList(FilterBaseTableTypeViewModel filter)
        {
            var result = await _baseInfoTypeService.FilterBaseTableType(filter);

            return View(result);
        }

        [HttpPost]
        public async Task<IActionResult> BaseTableTypeWindow(RegisterBaseTableTypeViewModel model)
        {
            return PartialView(model);
        }

        [HttpPost]
        public async Task<IActionResult> SaveBaseTableType(RegisterBaseTableTypeViewModel model)
        {
            if (!ModelState.IsValid)
                return Ok(new HassError() { Data = model }
                    .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));

            var result = await _baseInfoTypeService.RegisterBaseTableType(model);

            switch (result)
            {
                case RegisterBaseTableTypeResult.IsExisted:
                    return Ok(new HassError() { Data = model }
                        .AddError(new ModelError("*", "این عنوان در این نوع اطلاعات پایه قبلا ثبت شده است")));
                case RegisterBaseTableTypeResult.Success:
                    return Ok(new Success() { Data = model });
            }

            return Ok(new HassError() { Data = model });
        }
    }
}