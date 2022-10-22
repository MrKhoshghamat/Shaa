using Shaa.Domain.Entities;
using Shaa.Domain.ViewModels;

namespace Shaa.Business.Services.Interfaces;

public interface IAbilityService
{
    Task<LaboratoryResult> RegisterAbility(LaboratoryViewModel laboratory);
}