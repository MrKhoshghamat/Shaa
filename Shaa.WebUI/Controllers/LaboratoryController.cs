using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Services.Interfaces;
using Shaa.Business.Statics;
using Shaa.Domain;
using Shaa.Domain.ViewModels;
using Shaa.Domain.ViewModels.Lab;

namespace Shaa.WebUI.Controllers;

public class LaboratoryController : BaseController
{
    #region Ctor

    private readonly IBaseInfoService _baseInfoService;
    private readonly IRegisterLaboratoryService _registerLaboratoryService;
    private readonly IWardService _wardService;
    private readonly IEquipmentService _equipmentService;
    private readonly IAbilityService _abilityService;

    public LaboratoryController(
        IBaseInfoService baseInfoService,
        IRegisterLaboratoryService registerLaboratoryService,
        IWardService wardService,
        IEquipmentService equipmentService,
        IAbilityService abilityService
    )
    {
        _baseInfoService = baseInfoService;
        _registerLaboratoryService = registerLaboratoryService;
        _wardService = wardService;
        _equipmentService = equipmentService;
        _abilityService = abilityService;
    }

    #endregion


    [HttpGet]
    [Authorize]
    public async Task<IActionResult> LaboratoryIndex(FilterLaboratoryViewModel filter)
    {
        var result = await _registerLaboratoryService.FilterLaboratory(filter);
        return View(result);
    }


    [HttpGet]
    [Authorize]
    public async Task<IActionResult> RegisterLaboratory(Guid? id)
    {
        LaboratoryViewModel model =
            (id != null) ? new LaboratoryViewModel() { LaboratoryId = (Guid)id } : new LaboratoryViewModel();


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


        ViewData["EquipmentSupplyTypes"] =
            await _baseInfoService.GetAllEquipmentSupplyTypes((int)BaseTableTypeId.EquipmentSupplyType);

        ViewData["RelatedSection"] =
            await _baseInfoService.GetAllWards(model.LaboratoryId);

        ViewData["EquipmentsStatus"] =
            await _baseInfoService.GetAllEquipmentsStatus((int)BaseTableTypeId.EquipmentStatus);

        ViewData["EmploymentsStatus"] =
            await _baseInfoService.GetAllEmploymentsStatus((int)BaseTableTypeId.EmploymentStatus);

        return View(model);
    }


    [HttpGet]
    [Authorize]
    public async Task<IActionResult> MainPartial(Guid? id)
    {
        RegisterLaboratory_MainViewModel model =
            (id != null)
                ? await _registerLaboratoryService.GetMainInfo((Guid)id)
                : new RegisterLaboratory_MainViewModel();

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

        return PartialView(model);
    }

    [HttpPost]
    [Authorize]
    public async Task<IActionResult> MainPartial(RegisterLaboratory_MainViewModel model)
    {
        if (model.LaboratoryImagePath == null) model.LaboratoryImagePath = PathTools.DefaultLabImage;

        if (!ModelState.IsValid)
            return Ok(new HassError() { Data = model }
                .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));

        var result = (model.Id != null)
            ? await _registerLaboratoryService.UpdateMainInfo(model)
            : await _registerLaboratoryService.RegisterMainInfo(model);

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


    #region Ward

    [HttpGet]
    [Authorize]
    public async Task<IActionResult> WardPartial(FilterWardViewModel filter)
    {
        //if (laboratoryId != Guid.Empty && !string.IsNullOrEmpty(filter.Title))
        //{
        //    var registerLaboratoryWardViewModel = new RegisterLaboratory_WardViewModel()
        //    {
        //        LaboratoryId = laboratoryId,
        //        WardTitle = wardTitle
        //    };
        //    var res = await _registerLaboratoryService.RegisterWard(registerLaboratoryWardViewModel);
        //    ViewBag.LaboratoryId = laboratoryId;
        //}

        //if (id != Guid.Empty) ViewBag.LaboratoryId = id;

        var result = await _wardService.FilterWard(filter);
        return PartialView(result);

        // ViewData["LaboratoryId"] = id;
        // return PartialView(new RegisterLaboratory_WardViewModel() { laboratoryId = id});
    }

    [HttpPost]
    [Authorize]
    public IActionResult WardPartial()
    {
        return Ok(new Success() { Data = new { id = 0 } });
    }


    public ActionResult WardWindow(FilterWardViewModel model)
    {
        return PartialView(model);
    }

    [HttpPost]
    [Authorize]
    public async Task<IActionResult> SaveWard(RegisterLaboratory_WardViewModel model)
    {
        if (!ModelState.IsValid)
            return Ok(new HassError() { Data = model }
                .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));

        var result = await _registerLaboratoryService.RegisterWard(model);

        switch (result)
        {
            case RegisterWardResult.WardExists:
                return Ok(new HassError() { Data = model }
                    .AddError(new ModelError("*", "بخشی با این عنوان قبلا ثبت شده است")));
            case RegisterWardResult.Success:
                return Ok(new Success() { Data = model });
        }

        return BadRequest(model);
    }

    #endregion


    #region Equipment

    [HttpGet]
    [Authorize]
    public async Task<IActionResult> EquipmentPartial(FilterEquipmentViewModel filter)
    {
        var result = await _equipmentService.FilterEquipment(filter);
        return PartialView(result);
    }

    [HttpPost]
    [Authorize]
    public IActionResult EquipmentPartial()
    {
        return Ok(new Success() { Data = new { id = 0 } });
    }


    public async Task<IActionResult> EquipmentWindow(FilterWardViewModel model)
    {
        ViewData["EquipmentTypes"] =
            await _baseInfoService.GetAllEquipmentTypes((int)BaseTableTypeId.EquipmentType);

        ViewData["Countries"] =
            await _baseInfoService.GetAllCountries((int)BaseTableTypeId.CountryId);

        ViewData["Wards"] =
            await _baseInfoService.GetAllWards(model.LaboratoryId);

        ViewData["EquipmentsStatus"] =
            await _baseInfoService.GetAllEquipmentsStatus((int)BaseTableTypeId.EquipmentStatus);

        ViewData["EmploymentsStatus"] =
            await _baseInfoService.GetAllEmploymentsStatus((int)BaseTableTypeId.EmploymentStatus);

        ViewData["EquipmentSupplyTypes"] =
            await _baseInfoService.GetAllEquipmentSupplyTypes((int)BaseTableTypeId.EquipmentSupplyType);

        ViewData["UsageTypeId"] =
            await _baseInfoService.GetAllUsageTypes((int)BaseTableTypeId.UsageType);

        return PartialView(new RegisterLaboratory_EquipmentViewModel()
            { Id = model.Id, LaboratoryId = model.LaboratoryId });
    }

    [HttpPost]
    [Authorize]
    public async Task<IActionResult> SaveEquipment(RegisterLaboratory_EquipmentViewModel model)
    {
        if (model.EquipmentImage == null) model.EquipmentImage = PathTools.DefaultLabPath;

        if (!ModelState.IsValid)
            return Ok(new HassError() { Data = model }
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

    #endregion


    #region Ability

    [HttpGet]
    [Authorize]
    public async Task<IActionResult> AbilityPartial(FilterAbilityViewModel filter)
    {
        var result = await _abilityService.FilterAbility(filter);
        return PartialView(result);

        //
    }

    [HttpPost]
    [Authorize]
    public IActionResult AbilityPartial()
    {
        return Ok(new Success() { Data = new { id = 0 } });
    }

    public async Task<IActionResult> AbilityWindow(RegisterLaboratory_AbilityViewModel model)
    {
        ViewData["Equipments"] =
            await _baseInfoService.GetAllEquipments(model.LaboratoryId);

        ViewData["AbilityTitles"] =
            await _baseInfoService.GetAllAbilityTitles((int)BaseTableTypeId.AbilityTitle);

        

        return PartialView(model);
    }

    [HttpPost]
    [Authorize]
    public async Task<IActionResult> SaveAbility(RegisterLaboratory_AbilityViewModel model)
    {
        if (model.FileAttachment == null) model.FileAttachment = PathTools.DefaultLabPath;

        if (!ModelState.IsValid)
            return Ok(new HassError() { Data = model }
                .AddError(new ModelError("*", "در روند عملیات مشکلی رخ داده است")));

        var result = await _registerLaboratoryService.RegisterAbility(model);

        switch (result)
        {
            case RegisterAbilityResult.AbilityExists:
                return Ok(new HassError() { Data = model }
                    .AddError(new ModelError("*", "توانمندی با این مشخصات قبلا ثبت شده است")));
            case RegisterAbilityResult.Success:
                return Ok(new Success() { Data = model });
        }

        return BadRequest(model);
    }

    #endregion


    [HttpGet]
    [Authorize]
    public async Task<IActionResult> ConfirmPartial(Guid? laboratoryId)
    {
        return PartialView(new Laboratory_ConfirmViewModel() { LaboratoryId = laboratoryId });
    }
}