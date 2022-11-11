namespace Shaa.Business.Services.Interfaces;

public interface IAbilityService
{
    Task<FilterAbilityViewModel> FilterAbility(FilterAbilityViewModel filter);
} 