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

    public LaboratoryController(IBaseInfoService baseInfoService, ILaboratoryService laboratoryService,
        IEquipmentService equipmentService, IAbilityService abilityService)
    {
        _baseInfoService = baseInfoService;
        _laboratoryService = laboratoryService;
        _equipmentService = equipmentService;
        _abilityService = abilityService;
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
            await _baseInfoService.GetAllApprovalAuthorities((int)BaseTableTypeId.ResearchCenter);

        ViewData["LaboratoryTypes"] =
            await _baseInfoService.GetAllApprovalAuthorities((int)BaseTableTypeId.LaboratoryType);

        ViewData["StandardStatus"] =
            await _baseInfoService.GetAllApprovalAuthorities((int)BaseTableTypeId.StandardStatus);

        ViewData["EquipmentTypes"] =
            await _baseInfoService.GetAllApprovalAuthorities((int)BaseTableTypeId.EquipmentType);

        ViewData["UsageTypes"] =
            await _baseInfoService.GetAllApprovalAuthorities((int)BaseTableTypeId.UsageType);

        ViewData["Countries"] =
            await _baseInfoService.GetAllApprovalAuthorities((int)BaseTableTypeId.CountryId);

        ViewData["AbilityTitles"] =
            await _baseInfoService.GetAllApprovalAuthorities((int)BaseTableTypeId.AbilityTitle);

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
}