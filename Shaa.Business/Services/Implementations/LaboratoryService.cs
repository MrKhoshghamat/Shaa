using Shaa.Business.Generators;
using Shaa.Business.Security;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels;

namespace Shaa.Business.Services.Implementations;

public class LaboratoryService : ILaboratoryService
{
    #region Ctor

    private readonly ILaboratoryRepository _laboratoryRepository;
    private readonly IEquipmentRepository _equipmentRepository;
    private readonly IAbilityRepository _abilityRepository;

    public LaboratoryService(ILaboratoryRepository laboratoryRepository,
        IEquipmentRepository equipmentRepository, IAbilityRepository abilityRepository)
    {
        _laboratoryRepository = laboratoryRepository;
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

        if (await _equipmentRepository.IsExistEquipmentBySerialNumber(laboratory.SerialNumber.SanitizeText()))
            return LaboratoryResult.EquipmentExist;

        if (await _abilityRepository.IsExistAbilityByTitle(laboratory.AbilityTitle.SanitizeText()))
            return LaboratoryResult.AbilityExist;

        var p = laboratory.PhoneNumber.SanitizeText().Trim();
        var laboratoryModel = new Laboratory()
        {
            Id = CodeGenerator.CreateId(),
            Title = laboratory.LaboratoryTitle,
            LaboratoryTypeId = laboratory.LaboratoryTypeId,
            PassiveDefenceId = laboratory.PassiveDefenceId,
            ApprovalAuthorityId = laboratory.ApprovalAuthorityId,
            ResearchCenterId = laboratory.ResearchCenterId,
            PhoneNumber = laboratory.PhoneNumber.SanitizeText().Trim(),
            Address = laboratory.Address.SanitizeText(),
            Description = laboratory.LaboratoryDescription.SanitizeText(),
        };

        await _laboratoryRepository.AddAsync(laboratoryModel);

        return LaboratoryResult.Success;
    }
}