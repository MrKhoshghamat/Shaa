using Shaa.Domain.ViewModels.Authorization;

namespace Shaa.Business.Services.Interfaces;

public interface IAuthorizationService
{
    Task<FilterRoleViewModel> Filter(FilterRoleViewModel filter);
}