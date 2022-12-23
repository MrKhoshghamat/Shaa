using Shaa.Business.Extensions;
using Shaa.Business.Generators;
using Shaa.Business.Security;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.BasicInfo;
using Shaa.Domain.ViewModels.Lab;

namespace Shaa.Business.Services.Implementations;

public class RegisterLaboratoryService : IRegisterLaboratoryService
{
    #region Ctor

    private readonly IMainInfoRepository _mainInfoRepository;
    private readonly IWardRepository _wardRepository;
    private readonly IEquipmentRepository _equipmentRepository;
    private readonly IAbilityRepository _abilityRepository;
    private readonly ILaboratoryRepository _laboratoryRepository;
    private readonly IEquipmentAbilityRepository _equipmentAbilityRepository;

    public RegisterLaboratoryService(IMainInfoRepository mainInfoRepository, IWardRepository wardRepository,
        IEquipmentRepository equipmentRepository, IAbilityRepository abilityRepository,
        ILaboratoryRepository laboratoryRepository, IEquipmentAbilityRepository equipmentAbilityRepository)
    {
        _mainInfoRepository = mainInfoRepository;
        _wardRepository = wardRepository;
        _equipmentRepository = equipmentRepository;
        _abilityRepository = abilityRepository;
        _laboratoryRepository = laboratoryRepository;
        _equipmentAbilityRepository = equipmentAbilityRepository;
    }

    #endregion

    #region Laboratory

    public async Task<FilterLaboratoryViewModel> FilterLaboratory(FilterLaboratoryViewModel filter)
    {
        var query = (await _laboratoryRepository.GetAllLaboratory());
        //.Where(p => p. == filter.LaboratoryId);

        if (!string.IsNullOrEmpty(filter.Search))
        {
            query = query.Where(p => p.Title.Contains(filter.Search.SanitizeText().Trim()));
        }

        var result = query
            .Select(s => new LaboratoryListViewModel()
            {
                LaboratoryId = s.Id,
                Title = s.Title,
                LaboratoryTypeTitle = s.LaboratoryType.Title,
                ApprovalAuthorityTitle = s.ApprovalAuthority.Title,
                ResearchCenterTitle = s.ResearchCenter.Title,
                StandardStatusTitle = s.StandardStatus.Title,
                PassiveDefenceTitle = s.PassiveDefence.Title
            }).AsQueryable();

        switch (filter.Sort)
        {
            case FilterEnum.AlphabeticASC:
                query = query.OrderBy(p => p.Title);
                break;
            case FilterEnum.AlphabeticDESC:
                query = query.OrderByDescending(p => p.Title);
                break;
        }

        await filter.SetPaging(result);
        return filter;
    }

    #endregion

    #region MainInfo

    public async Task<RegisterLaboratory_MainViewModel> GetMainInfo(Guid id)
    {
        var model = (await _mainInfoRepository.GetAsync(p => p.Id == id)).FirstOrDefault();
        return new RegisterLaboratory_MainViewModel()
        {
            Id = model.Id,
            LaboratoryTitle = model.Title,
            LaboratoryTypeId = model.LaboratoryTypeId,
            PassiveDefenceId = model.PassiveDefenceId,
            ApprovalAuthorityId = model.ApprovalAuthorityId,
            ResearchCenterId = model.ResearchCenterId,
            StandardStatusId = model.StandardStatusId,
            PhoneNumber = model.PhoneNumber,
            LaboratoryImagePath = model.ImagePath,
            Address = model.Address,
            Description = model.Description,
        };
    }

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

    public async Task<RegisterMainResult> UpdateMainInfo(RegisterLaboratory_MainViewModel model)
    {
        var dbModel = (await _mainInfoRepository.GetAsync(p => p.Id == model.Id)).FirstOrDefault();

        dbModel.Title = model.LaboratoryTitle.SanitizeText().Trim();
        dbModel.LaboratoryTypeId = model.LaboratoryTypeId;
        dbModel.PassiveDefenceId = model.PassiveDefenceId;
        dbModel.ApprovalAuthorityId = model.ApprovalAuthorityId;
        dbModel.StandardStatusId = model.StandardStatusId;
        dbModel.ResearchCenterId = model.ResearchCenterId;
        dbModel.PhoneNumber = model.PhoneNumber.SanitizeText().Trim();
        dbModel.ImagePath = model.LaboratoryImagePath;
        dbModel.Address = model.Address.SanitizeText().Trim();
        dbModel.Description = model.Description.SanitizeText().Trim();

        await _mainInfoRepository.UpdateAsync(dbModel);
        return RegisterMainResult.Success;
    }

    #endregion

    #region Ward
 
    public async Task<RegisterWardResult> RegisterWard(RegisterLaboratory_WardViewModel model)
    {
        if (await _wardRepository.IsExistWardByTitle(model.WardTitle!, model.LaboratoryId)) return RegisterWardResult.WardExists;

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

    public async Task<RegisterWardResult> SaveWard(RegisterLaboratory_WardViewModel model)
    {
        var dbModel = await _wardRepository.GetByIdAsync((Guid)model.Id);

        dbModel.Title = model.WardTitle;
 
        await _wardRepository.UpdateAsync(dbModel);
        await _wardRepository.Save();
 
        return RegisterWardResult.Success;
    }

    #endregion

    #region Equipment

    public async Task<RegisterEquipmentResult> RegisterEquipment(RegisterLaboratory_EquipmentViewModel model)
    {
        if (await _equipmentRepository.IsExistEquipmentBySerialNumber(model.SerialNumber!, model.LaboratoryId))
            return RegisterEquipmentResult.EquipmentExists;

        try
        {
            var equipment = new Equipment()
            {
                Id = CodeGenerator.CreateId(),
                LaboratoryId = model.LaboratoryId,
                EquipmentTypeId = model.EquipmentTypeId,
                Title = model.EquipmentTitle.SanitizeText().Trim(),
                PersianTitle = model.PersianTitle!.SanitizeText().Trim(),
                GeneralTechnicalSpecification = model.GeneralTechnicalSpecification!.SanitizeText().Trim(),
                EquipmentUsage = model.EquipmentUsage!.SanitizeText().Trim(),
                UsageTypeId = model.UsageTypeId,
                CountryId = model.CountryId,
                CompanyName = model.CompanyName!.SanitizeText().Trim(),
                EquipmentCost = long.Parse(model.EquipmentCost!.Replace(",", "")),
                Model = model.ModelTitle!.SanitizeText().Trim(),
                SerialNumber = model.SerialNumber!.SanitizeText().Trim(),
                InstallationDate = model.InstallationDate!.SanitizeText().ToMiladi(),
                ExploitationDate = model.ExploitationDate!.SanitizeText().ToMiladi(),
                EmploymentStatusId = model.EmploymentStatusId,
                SupplyTypeId = model.SupplyTypeId,
                WardId = model.WardId,
                EquipmentImage = model.EquipmentImage,
                BaitulMalNo = model.BaitulMalNo!.SanitizeText().Trim(),
                EquipmentStatusId = model.EquipmentStatusId,
                PurchasePriceConstruction = model.PurchasePriceConstruction!.SanitizeText().Trim(),
                IsNeededToCalibrate = model.IsNeededToCalibrate,
                LastCalibrationDate = model.LastCalibrationDate!.SanitizeText().ToMiladi(),
                WarrantyExpirationDate = model.WarrantyExpirationDate!.SanitizeText().ToMiladi(),
                InsuranceExpirationDate = model.InsuranceExpirationDate!.SanitizeText().ToMiladi(),
                SpecialCharacteristic = model.SpecialCharacteristic!.SanitizeText().Trim(),
                TitlesAttachedToEquipment = model.TitlesAttachedToEquipment!.SanitizeText().Trim(),
            };

            await _equipmentRepository.AddAsync(equipment);
            await _equipmentRepository.Save();
            model.Id = equipment.Id;
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            throw;
        }


        return RegisterEquipmentResult.Success;
    }

    #endregion

    #region Ability

    public async Task<RegisterAbilityResult> RegisterAbility(RegisterLaboratory_AbilityViewModel model)
    {
        if (await _abilityRepository.IsExistAbilityByTitle(model.AbilityTitle!, model.LaboratoryId))
            return RegisterAbilityResult.AbilityExists;
        try
        { 
            var ability = new Ability()
            {
                Id = CodeGenerator.CreateId(),
                Title = model.AbilityTitle,
                LaboratoryId = (Guid)model.LaboratoryId!,
                ConsumableCost = long.Parse(model.ConsumableCost!.Replace(",", "")),
                ImplementationCost = long.Parse(model.ImplementationCost!.Replace(",", "")),
                OtherCost = long.Parse(model.OtherCost!.Replace(",", "")),
                HumanResourceCost = long.Parse(model.HumanResourceCost!.Replace(",", "")),
                DescriptionOfConsumables = model.DescriptionOfConsumables!.SanitizeText().Trim(),
                ImplementationTime = model.ImplementationTime!.ToMiladi(),
                FileAttachment = model.FileAttachment
            };

            await _abilityRepository.AddAsync(ability);
            await _abilityRepository.Save();

            var equipmentAbilityModel = new EquipmentAbility()
            {
                AbilityId = ability.Id,
                EquipmentId = model.EquipmentId
            };

            await _equipmentAbilityRepository.AddAsync(equipmentAbilityModel);
            await _equipmentAbilityRepository.Save();
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            throw;
        }


        return RegisterAbilityResult.Success;
    }

    #endregion
}