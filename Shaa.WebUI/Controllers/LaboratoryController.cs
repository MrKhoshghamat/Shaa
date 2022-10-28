using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain;
using Shaa.Domain.ViewModels;
using Shaa.WebUI.ActionFilters;

namespace Shaa.WebUI.Controllers;

public class LaboratoryController : BaseController
{
    #region Ctor

    private readonly IBaseInfoService _baseInfoService;
    private readonly ILaboratoryService _laboratoryService;
    private readonly IEquipmentService _equipmentService;
    private readonly IAbilityService _abilityService;
    private readonly IWardService _wardService;

    public LaboratoryController(IBaseInfoService baseInfoService, ILaboratoryService laboratoryService,
        IEquipmentService equipmentService, IAbilityService abilityService, IWardService wardService)
    {
        _baseInfoService = baseInfoService;
        _laboratoryService = laboratoryService;
        _equipmentService = equipmentService;
        _abilityService = abilityService;
        _wardService = wardService;
    }

    #endregion

    [HttpGet("RegisterLaboratory")]
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
            await _wardService.GetAllWards();
        
        ViewData["EquipmentsStatus"] =
            await _baseInfoService.GetAllEquipmentsStatus((int)BaseTableTypeId.EquipmentStatus);
        
        ViewData["EmploymentsStatus"] =
            await _baseInfoService.GetAllEmploymentsStatus((int)BaseTableTypeId.EmploymentStatus);

        return View();
    }

    [HttpPost("RegisterLaboratory")]
    [RedirectHomeIfLoggedInActionFilter]
    public async Task<IActionResult> RegisterLaboratory(LaboratoryViewModel laboratory)
    {
        // if (!ModelState.IsValid)
        // {
        //     return View(laboratory);
        // }

        var laboratoryResult = await _laboratoryService.RegisterLaboratory(laboratory);
        var equipmentResult = await _equipmentService.RegisterEquipment(laboratory);
        var abilityResult = await _abilityService.RegisterAbility(laboratory);

        if (equipmentResult == LaboratoryResult.EquipmentExist) TempData[ErrorMessage] = "این تجهیز قبلا ثبت شده است";
        if (abilityResult == LaboratoryResult.AbilityExist) TempData[ErrorMessage] = "این توانمندی قبلا ثبت شده است";

        switch (laboratoryResult)
        {
            case LaboratoryResult.LaboratoryExists:
                TempData[ErrorMessage] = "این آزمایشگاه قبلا ثبت شده است";
                break;
            case LaboratoryResult.Success:
                TempData[SuccessMessage] = "عملیات ثبت با موفقیت انجام شد";
                return Redirect("/");
        }

        return View(laboratory);
    }
    
    // [HttpGet("RegisterLaboratoryPrepare")]
    // public IActionResult RegisterLaboratoryPrepare()
    // {
    //     return View();
    // }
}