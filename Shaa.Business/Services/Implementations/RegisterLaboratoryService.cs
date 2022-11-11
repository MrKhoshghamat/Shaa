using Shaa.Business.Extensions;
using Shaa.Business.Generators;
using Shaa.Business.Security;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.Lab;

namespace Shaa.Business.Services.Implementations;

public class RegisterLaboratoryService : IRegisterLaboratoryService
{
    #region Ctor

    private readonly IMainInfoRepository _mainInfoRepository;
    private readonly IWardRepository _wardRepository;
    private readonly IEquipmentRepository _equipmentRepository;
    private readonly IAbilityRepository _abilityRepository;

    public RegisterLaboratoryService(IMainInfoRepository mainInfoRepository, IWardRepository wardRepository,
        IEquipmentRepository equipmentRepository, IAbilityRepository abilityRepository)
    {
        _mainInfoRepository = mainInfoRepository;
        _wardRepository = wardRepository;
        _equipmentRepository = equipmentRepository;
        _abilityRepository = abilityRepository;
    }

    #endregion

    #region MainInfo

    public async Task<RegisterMainResult> RegisterMainInfo(RegisterLaboratory_MainViewModel model)
    {
        if (await _mainInfoRepository.IsExistLaboratoryByTitle(model.LaboratoryTitle.SanitizeText().Trim()))
            return RegisterMainResult.MainExists;

        if (await _mainInfoRepository.IsExistLaboratoryByPhoneNumber(model.PhoneNumber.SanitizeText().Trim()))
            return RegisterMainResult.MainExists;

        var mainInfo = new Laboratory()
        {
            Id = CodeGenerator.CreateId(),
            Title = model.LaboratoryTitle.SanitizeText().Trim(),
            LaboratoryTypeId = model.LaboratoryTypeId,
            PassiveDefenceId = model.PassiveDefenceId,
            ApprovalAuthorityId = model.ApprovalAuthorityId,
            StandardStatusId = model.StandardStatusId,
            ResearchCenterId = model.ResearchCenterId,
            PhoneNumber = model.PhoneNumber.SanitizeText().Trim(),
            ImagePath = model.LaboratoryImagePath,
            Address = model.Address.SanitizeText().Trim(),
            Description = model.Description.SanitizeText().Trim()
        };

        await _mainInfoRepository.AddAsync(mainInfo);
        await _mainInfoRepository.Save();

        model.Id = mainInfo.Id;

        return RegisterMainResult.Success;
    }

    #endregion

    #region Ward

    public async Task<RegisterWardResult> RegisterWard(RegisterLaboratory_WardViewModel model)
    {
        if (await _wardRepository.IsExistWardByTitle(model.WardTitle!)) return RegisterWardResult.WardExists;

        var ward = new Ward()
        {
            Id = CodeGenerator.CreateId(),
            Title = model.WardTitle!.SanitizeText().Trim(),
            LaboratoryId = (Guid)model.LaboratoryId!,
        };

        await _wardRepository.AddAsync(ward);
        await _wardRepository.Save();

        model.Id = ward.Id;
        
        return RegisterWardResult.Success;
    }

    #endregion

    #region Equipment

    public async Task<RegisterEquipmentResult> RegisterEquipment(RegisterLaboratory_EquipmentViewModel model)
    {
        if (await _equipmentRepository.IsExistEquipmentBySerialNumber(model.SerialNumber))
            return RegisterEquipmentResult.EquipmentExists;
        
        var laboratoryId = await _equipmentRepository.GetLaboratoryIdByWardId(model.WardId);

        var equipment = new Equipment()
        {
            Id = CodeGenerator.CreateId(),
            LaboratoryId = (Guid)laboratoryId!,
            EquipmentTypeId = model.EquipmentTypeId,
            Title = model.EquipmentTitle.SanitizeText().Trim(),
            PersianTitle = model.PersianTitle.SanitizeText().Trim(),
            GeneralTechnicalSpecification = model.GeneralTechnicalSpecification.SanitizeText().Trim(),
            EquipmentUsage = model.EquipmentUsage.SanitizeText().Trim(),
            UsageTypeId = model.UsageTypeId,
            CountryId = model.CountryId,
            CompanyName = model.CompanyName.SanitizeText().Trim(),
            Model = model.Model.SanitizeText().Trim(),
            SerialNumber = model.SerialNumber.SanitizeText().Trim(),
            InstallationDate = model.InstallationDate.SanitizeText().ToMiladi(),
            ExploitationDate = model.ExploitationDate.SanitizeText().ToMiladi(),
            SupplyTypeId = model.SupplyTypeId,
            WardId = model.WardId,
            EquipmentImage = model.EquipmentImage,
            RelatedSectionId = model.RelatedSectionId,
            BaitulMalNo = model.BaitulMalNo.SanitizeText().Trim(),
            EquipmentStatusId = model.EquipmentStatusId,
            PurchasePriceConstruction = model.PurchasePriceConstruction.SanitizeText().Trim(),
            IsNeededToCalibrate = model.IsNeededToCalibrate,
            LastCalibrationDate = model.LastCalibrationDate.SanitizeText().ToMiladi(),
            WarrantyExpirationDate = model.WarrantyExpirationDate.SanitizeText().ToMiladi(),
            InsuranceExpirationDate = model.InsuranceExpirationDate.SanitizeText().ToMiladi(),
            SpecialCharacteristic = model.SpecialCharacteristic.SanitizeText().Trim(),
            TitlesAttachedToEquipment = model.TitlesAttachedToEquipment.SanitizeText().Trim()
        };

        await _equipmentRepository.AddAsync(equipment);
        await _equipmentRepository.Save();

        model.Id = equipment.Id;

        return RegisterEquipmentResult.Success;
    }

    #endregion

    #region Ability

    public Task<RegisterAbilityResult> RegisterAbility(RegisterLaboratory_AbilityViewModel model)
    {
        throw new NotImplementedException();
    }

    #endregion
}