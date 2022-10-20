using Shaa.Business.Security;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels;

namespace Shaa.Business.Services.Implementations;

public class LaboratoryService : ILaboratoryService
{
    #region Ctor

    private readonly ILaboratoryRepository _laboratoryRepository;
    private readonly IWardRepository _wardRepository;
    private readonly IEquipmentRepository _equipmentRepository;
    private readonly IAbilityRepository _abilityRepository;

    public LaboratoryService(ILaboratoryRepository laboratoryRepository, IWardRepository wardRepository,
        IEquipmentRepository equipmentRepository, IAbilityRepository abilityRepository)
    {
        _laboratoryRepository = laboratoryRepository;
        _wardRepository = wardRepository;
        _equipmentRepository = equipmentRepository;
        _abilityRepository = abilityRepository;
    }

    #endregion

    public async Task<LaboratoryResult> RegisterLaboratory(LaboratoryViewModel laboratory)
    {
        if (await _laboratoryRepository.IsExistLaboratoryByPhoneNumber(laboratory.PhoneNumber.SanitizeText()))
            return LaboratoryResult.LaboratoryExists;

        if (await _laboratoryRepository.IsExistLaboratoryByTitle(laboratory.LaboratoryTitle.SanitizeText()))
            return LaboratoryResult.LaboratoryExists;

        if (await _wardRepository.IsExistWardByTitle(laboratory.WardTitle.SanitizeText()))
            return LaboratoryResult.WardExists;

        if (await _equipmentRepository.IsExistEquipmentByTitle(laboratory.EquipmentTitle.SanitizeText()))
            return LaboratoryResult.EquipmentExist;

        if (await _abilityRepository.IsExistAbilityByTitle(laboratory.AbilityTitle.SanitizeText()))
            return LaboratoryResult.AbilityExist;

        return LaboratoryResult.Success;
    }
}