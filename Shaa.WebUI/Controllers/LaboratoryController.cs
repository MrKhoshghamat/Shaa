using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Services.Interfaces;
using Shaa.Business.Statics;
using Shaa.Domain;
using Shaa.Domain.ViewModels.Lab;

namespace Shaa.WebUI.Controllers;

public class LaboratoryController : BaseController
{
    #region Ctor

    private readonly IBaseInfoService _baseInfoService;
    private readonly IRegisterLaboratoryService _registerLaboratoryService;
    private readonly IWardService _wardService;

    public LaboratoryController(
        IBaseInfoService baseInfoService, 
        IRegisterLaboratoryService registerLaboratoryService,
        IWardService wardService
        )
    {
        _baseInfoService = baseInfoService;
        _registerLaboratoryService = registerLaboratoryService;
        _wardService = wardService;
    }

    #endregion

    [HttpGet]
    [Authorize]
    public async Task<IActionResult> RegisterLaboratory()
    {
        ViewData["PassiveDefences"] =
            await _baseInfoService.GetAllPassiveDefences((int)BaseTableTypeId.PassiveDefenceType);

        ViewData["ApprovalAuthorities"] =
            await _baseInfoService.GetAllApprovalAuthorities((int)BaseTableTypeId.ApprovalAuthority);

        ViewData["ResearchCenters"] =
            await _baseInfoService.GetAllResearchCenters((int)BaseTableTypeId.ResearchCenter);

        ViewData["LaboratoryTypes"] =
            await _baseInfoService.GetAllLaboratoryTypes((int)BaseTableTypeId.LaboratoryType);

        ViewData["StandardStatus"] =
            await _baseInfoService.GetAllStandardStatus((int)BaseTableTypeId.StandardStatus);

        ViewData["EquipmentTypes"] =
            await _baseInfoService.GetAllEquipmentTypes((int)BaseTableTypeId.EquipmentType);

        ViewData["UsageTypes"] =
            await _baseInfoService.GetAllUsageTypes((int)BaseTableTypeId.UsageType);

        ViewData["Countries"] =
            await _baseInfoService.GetAllCountries((int)BaseTableTypeId.CountryId);

        ViewData["AbilityTitles"] =
            await _baseInfoService.GetAllAbilityTitles((int)BaseTableTypeId.AbilityTitle);

        ViewData["EquipmentSupplyTypes"] =
            await _baseInfoService.GetAllEquipmentSupplyTypes((int)BaseTableTypeId.EquipmentSupplyType);

        ViewData["RelatedSection"] =
            await _baseInfoService.GetAllWards();

        ViewData["EquipmentsStatus"] =
            await _baseInfoService.GetAllEquipmentsStatus((int)BaseTableTypeId.EquipmentStatus);

        ViewData["EmploymentsStatus"] =
            await _baseInfoService.GetAllEmploymentsStatus((int)BaseTableTypeId.EmploymentStatus);

        return View();
    }


    [HttpGet]
    [Authorize]
    public async Task<IActionResult> MainPartial()
    {
        ViewData["PassiveDefences"] =
            await _baseInfoService.GetAllPassiveDefences((int)BaseTableTypeId.PassiveDefenceType);

        ViewData["ApprovalAuthorities"] =
            await _baseInfoService.GetAllApprovalAuthorities((int)BaseTableTypeId.ApprovalAuthority);

        ViewData["ResearchCenters"] =
            await _baseInfoService.GetAllResearchCenters((int)BaseTableTypeId.ResearchCenter);

        ViewData["LaboratoryTypes"] =
            await _baseInfoService.GetAllLaboratoryTypes((int)BaseTableTypeId.LaboratoryType);

        ViewData["StandardStatus"] =
            await _baseInfoService.GetAllStandardStatus((int)BaseTableTypeId.StandardStatus);

        return PartialView(new RegisterLaboratory_MainViewModel());
    }

    [HttpPost]
    [Authorize]
    public async Task<IActionResult> MainPartial(RegisterLaboratory_MainViewModel model)
    {
        if (model.LaboratoryImagePath == null) model.LaboratoryImagePath = PathTools.DefaultLabImage;

        if (!ModelState.IsValid) return Ok(new HassError() { Data = model }
            .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));

        var result = await _registerLaboratoryService.RegisterMainInfo(model);

        switch (result)
        {
            case RegisterMainResult.MainExists:
                return Ok(new HassError() { Data = model }
                    .AddError(new ModelError("*", "آزمایشگاهی با این اطلاعات اصلی قبلا ثبت شده است")));
            case RegisterMainResult.Success:
                return Ok(new Success() { Data = model });
        }

        return BadRequest(model);
    }

    [HttpGet]
    [Authorize]
    public async Task<IActionResult> WardPartial(FilterWardViewModel filter)
    {  
        var result = await _wardService.FilterWard(filter);
        return PartialView(result);
 
        // ViewData["LaboratoryId"] = id;
       // return PartialView(new RegisterLaboratory_WardViewModel() { laboratoryId = id});
    }

    [HttpPost]
    [Authorize]
    public async Task<IActionResult> WardPartial(RegisterLaboratory_WardViewModel model)
    {
        return Ok(new Success() { Data = model });
        
        // if(!ModelState.IsValid) return Ok(new HassError() { Data = model }
        //     .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));
        //
        // var result = await _registerLaboratoryService.RegisterWard(model);
        //
        // switch (result)
        // {
        //     case RegisterWardResult.WardExists:
        //         return Ok(new HassError() { Data = model }
        //             .AddError(new ModelError("*", "بخشی با این عنوان قبلا ثبت شده است")));
        //     case RegisterWardResult.Success:
        //         return Ok(new Success() { Data = model });
        // }
        //
        // return BadRequest(model);
    }

    [HttpGet]
    [Authorize]
    public async Task<IActionResult> EquipmentPartial(Guid? id)
    {
        ViewData["EquipmentTypes"] =
            await _baseInfoService.GetAllEquipmentTypes((int)BaseTableTypeId.EquipmentType);

        ViewData["Countries"] =
            await _baseInfoService.GetAllCountries((int)BaseTableTypeId.CountryId);

        ViewData["RelatedSection"] =
            await _baseInfoService.GetAllWards();

        ViewData["EquipmentsStatus"] =
            await _baseInfoService.GetAllEquipmentsStatus((int)BaseTableTypeId.EquipmentStatus);

        ViewData["EmploymentsStatus"] =
            await _baseInfoService.GetAllEmploymentsStatus((int)BaseTableTypeId.EmploymentStatus);

        ViewData["EquipmentSupplyTypes"] =
            await _baseInfoService.GetAllEquipmentSupplyTypes((int)BaseTableTypeId.EquipmentSupplyType);

        return PartialView(new RegisterLaboratory_EquipmentViewModel() {WardId = id});
    }

    [HttpPost]
    [Authorize]
    public async Task<IActionResult> EquipmentPartial(RegisterLaboratory_EquipmentViewModel model)
    {
        if (model.EquipmentImage == null) model.EquipmentImage = PathTools.DefaultLabPath;
        
        if(!ModelState.IsValid) return Ok(new HassError() { Data = model }
            .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));

        var result = await _registerLaboratoryService.RegisterEquipment(model);

        switch (result)
        {
            case RegisterEquipmentResult.EquipmentExists:
                return Ok(new HassError() { Data = model }
                    .AddError(new ModelError("*", "تجهیزی با این مشخصات قبلا ثبت شده است")));
            case RegisterEquipmentResult.Success:
                return Ok(new Success() { Data = model });
        }

        return BadRequest(model);
    }

    [HttpGet]
    [Authorize]
    public async Task<IActionResult> AbilityPartial(Guid? id)
    {
        return PartialView(new RegisterLaboratory_AbilityViewModel());
    }

    [HttpPost]
    [Authorize]
    public async Task<IActionResult> AbilityPartial(RegisterLaboratory_AbilityViewModel model)
    {
        return Ok(model);
    }
}