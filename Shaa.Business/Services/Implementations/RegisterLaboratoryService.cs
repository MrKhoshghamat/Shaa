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
            PassiveDefenceId = model.PassiveDefenceId,
            ApprovalAuthorityId = model.ApprovalAuthorityId,
            StandardStatusId = model.StandardStatusId,
            ResearchCenterId = model.ResearchCenterId,
            PhoneNumber = model.PhoneNumber.SanitizeText().Trim(),
            ImagePath = model.LaboratoryImagePath,
            Address = model.Address.SanitizeText().Trim(),
            LaboratoryTypeId = model.LaboratoryTypeId
        };

        await _mainInfoRepository.AddAsync(mainInfo);
        await _mainInfoRepository.Save();

        model.Id = mainInfo.Id;

        return RegisterMainResult.Success;
    }

    #endregion

    #region Ward

    public Task<RegisterWardResult> RegisterWard(RegisterLaboratory_WardViewModel model)
    {
        throw new NotImplementedException();
    }

    #endregion

    #region Equipment

    public Task<RegisterEquipmentResult> RegisterEquipment(RegisterLaboratory_EquipmentViewModel model)
    {
        throw new NotImplementedException();
    }

    #endregion

    #region Ability

    public Task<RegisterAbilityResult> RegisterAbility(RegisterLaboratory_AbilityViewModel model)
    {
        throw new NotImplementedException();
    }

    #endregion
}