using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Shaa.Business.Generators;
using Shaa.Business.Services.Interfaces;
using Shaa.Business.Statics;
using Shaa.Domain;
using Shaa.Domain.ViewModels;
using Shaa.Domain.ViewModels.Attachment;
using Shaa.Domain.ViewModels.Lab;
using Shaa.WebUI.ActionFilters;

namespace Shaa.WebUI.Controllers;

public class LaboratoryController : BaseController
{
    #region Ctor

    private readonly IBaseInfoService _baseInfoService;
    private readonly IRegisterLaboratoryService _registerLaboratoryService;
    private readonly IWardService _wardService;
    private readonly IEquipmentService _equipmentService;
    private readonly IAbilityService _abilityService;
    private readonly IAttachmentService _attachmentService;

    public LaboratoryController(
        IBaseInfoService baseInfoService,
        IRegisterLaboratoryService registerLaboratoryService,
        IWardService wardService,
        IEquipmentService equipmentService,
        IAbilityService abilityService,
        IAttachmentService attachmentService
    )
    {
        _baseInfoService = baseInfoService;
        _registerLaboratoryService = registerLaboratoryService;
        _wardService = wardService;
        _equipmentService = equipmentService;
        _abilityService = abilityService;
        _attachmentService = attachmentService;
    }

    #endregion


    [HttpGet]
    [Authorize]
    [CustomAutorize("LaboratoryIndex")]
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
    public async Task<IActionResult> MainPartial(RegisterLaboratory_MainViewModel model, IFormFile attachmentFile)
    {
        if (model.LaboratoryImagePath == null) model.LaboratoryImagePath = PathTools.DefaultLabImage;

        if (!ModelState.IsValid)
            return Ok(new HassError() { Data = model }
                .AddError(new ModelError("*", "???? ???????? ???????????? ?????????? ???? ???????? ??????")));


        #region Create Attachment

        byte[] bytes = new byte[] { };
        AttachmentViewModel am = null;

        if (attachmentFile != null)
        {
            am = new AttachmentViewModel()
            {
                EntityName = "Equipment",
                FileName = attachmentFile.FileName,
                FileType = attachmentFile.ContentType,
                FileSize = attachmentFile.Length.ToString(),
                Description = "",
                RegisterTime = DateTime.Now,
                UniqueId = CodeGenerator.CreateId()
            };

            using (var ms = new MemoryStream())
            {
                ms.Position = 0;
                attachmentFile.CopyTo(ms);
                bytes = ms.ToArray();
            }
        }

        #endregion

        var result = (model.Id != null)
            ? await _registerLaboratoryService.UpdateMainInfo(model)
            : await _registerLaboratoryService.RegisterMainInfo(model);

        if (attachmentFile != null)
        {
            am.EntityRecordId = model.Id.ToString();
            await _attachmentService.AddAttachment(am, bytes);
        }

        switch (result)
        {
            case RegisterMainResult.MainExists:
                return Ok(new HassError() { Data = model }
                    .AddError(new ModelError("*", "???????????????????? ???? ?????? ?????????????? ???????? ???????? ?????? ?????? ??????")));
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


    public async Task<ActionResult> WardWindow(FilterWardViewModel model)
    {
        FilterWardViewModel wardViewModel = new FilterWardViewModel();

        if (model.Id != null)
        {
            var dbModel = await _wardService.GetWardById((Guid)model.Id);

            wardViewModel.Id = dbModel.Id;
            wardViewModel.WardTitle = dbModel.Title;
        }

        return PartialView(wardViewModel);
    }

    [HttpPost]
    [Authorize]
    public async Task<IActionResult> SaveWard(RegisterLaboratory_WardViewModel model)
    {
        if (!ModelState.IsValid)
            return Ok(new HassError() { Data = model }
                .AddError(new ModelError("*", "???? ???????? ???????????? ?????????? ???? ???????? ??????")));

        RegisterWardResult result = new RegisterWardResult();
 
        if (model.Id != null)
        {
            result = await _registerLaboratoryService.SaveWard(model);
        }
        else
        {
            result = await _registerLaboratoryService.RegisterWard(model);
        }

        switch (result)
        {
            case RegisterWardResult.WardExists:
                return Ok(new HassError() { Data = model }
                    .AddError(new ModelError("*", "???????? ???? ?????? ?????????? ???????? ?????? ?????? ??????")));
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
    public async Task<IActionResult> SaveEquipment(RegisterLaboratory_EquipmentViewModel model,
        IFormFile attachmentFile)
    {
        if (model.EquipmentImage == null) model.EquipmentImage = PathTools.DefaultLabPath;

        if (!ModelState.IsValid)
            return Ok(new HassError() { Data = model }
                .AddError(new ModelError("*", "???? ???????? ???????????? ?????????? ???? ???????? ??????")));

        #region Create Attachment

        AttachmentViewModel am = null;
        byte[] bytes = new byte[] { };

        if (attachmentFile != null)
        {
            am = new AttachmentViewModel()
            {
                EntityName = "Equipment",
                FileName = attachmentFile.FileName,
                FileType = attachmentFile.ContentType,
                FileSize = attachmentFile.Length.ToString(),
                Description = "",
                RegisterTime = DateTime.Now,
                UniqueId = CodeGenerator.CreateId()
            };

            using (var ms = new MemoryStream())
            {
                ms.Position = 0;
                attachmentFile.CopyTo(ms);
                bytes = ms.ToArray();
            }
        }

        #endregion

        var result = await _registerLaboratoryService.RegisterEquipment(model);

        if (attachmentFile != null)
        {
            am.EntityRecordId = model.Id.ToString();
            await _attachmentService.AddAttachment(am, bytes);
        }

        switch (result)
        {
            case RegisterEquipmentResult.EquipmentExists:
                return Ok(new HassError() { Data = model }
                    .AddError(new ModelError("*", "???????????? ???? ?????? ???????????? ???????? ?????? ?????? ??????")));
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
                .AddError(new ModelError("*", "???? ???????? ???????????? ?????????? ???? ???????? ??????")));

        var result = await _registerLaboratoryService.RegisterAbility(model);

        switch (result)
        {
            case RegisterAbilityResult.AbilityExists:
                return Ok(new HassError() { Data = model }
                    .AddError(new ModelError("*", "???????????????? ???? ?????? ???????????? ???????? ?????? ?????? ??????")));
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