using Shaa.Business.Extensions;
using Shaa.Business.Generators;
using Shaa.Business.Security;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels;

namespace Shaa.Business.Services.Implementations;

public class AbilityService : IAbilityService
{
    #region Ctor

    private readonly IAbilityRepository _abilityRepository;
    private readonly ILaboratoryRepository _laboratoryRepository;

    public AbilityService(IAbilityRepository abilityRepository, ILaboratoryRepository laboratoryRepository)
    {
        _abilityRepository = abilityRepository;
        _laboratoryRepository = laboratoryRepository;
    }

    #endregion
    
    public async Task<LaboratoryResult> RegisterAbility(LaboratoryViewModel laboratory)
    {
        if (await _abilityRepository.IsExistAbilityByTitle(laboratory.AbilityTitle))
            return LaboratoryResult.AbilityExist;

        var lab = await _laboratoryRepository.GetLaboratoryByTitle(laboratory.LaboratoryTitle);

        
        var ability = new Ability()
        {
            Id = CodeGenerator.CreateId(),
            Title = laboratory.AbilityTitle,
            FurtherDetailsAndProcedure = laboratory.FurtherDetailsAndProcedure,
            DescriptionOfConsumables = laboratory.DescriptionOfConsumables,
            ConsumableCost = long.Parse(string.Concat(laboratory.ConsumableCost.Split(','))),
            HumanResourceCost = long.Parse(string.Concat(laboratory.HumanResourceCost.Split(','))),
            OtherCost = long.Parse(string.Concat(laboratory.OtherCost.Split(','))),
            ImplementationCost = long.Parse(string.Concat(laboratory.ImplementationCost.Split(','))),
            FileAttachment = laboratory.FileAttachment,
            ImplementationTime = laboratory.ImplementationTime.ToMiladi(),
            LaboratoryId = lab.Id
        };

        await _abilityRepository.AddAsync(ability);

        return LaboratoryResult.Success;
    }
}