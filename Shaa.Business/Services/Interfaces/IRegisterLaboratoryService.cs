using Microsoft.EntityFrameworkCore.SqlServer.Query.Internal;
using Shaa.Domain.ViewModels.Lab;

namespace Shaa.Business.Services.Interfaces;

public interface IRegisterLaboratoryService
{
    Task<RegisterLaboratory_MainViewModel> GetMainInfo(Guid id);
    Task<RegisterMainResult> RegisterMainInfo(RegisterLaboratory_MainViewModel model);
    Task<RegisterMainResult> UpdateMainInfo(RegisterLaboratory_MainViewModel model);
    Task<RegisterWardResult> RegisterWard(RegisterLaboratory_WardViewModel model);
    Task<RegisterEquipmentResult> RegisterEquipment(RegisterLaboratory_EquipmentViewModel model);
    Task<RegisterAbilityResult> RegisterAbility(RegisterLaboratory_AbilityViewModel model);
}