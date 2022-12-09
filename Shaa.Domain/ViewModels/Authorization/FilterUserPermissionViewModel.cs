using Shaa.Domain.Entities;
using Shaa.Domain.ViewModels.Common;

namespace Shaa.Domain.ViewModels.Authorization;

public class FilterUserRoleViewModel : PagingViewModel<UserRoleViewModel>
{
    //public Guid UserId { get; set; }
    //public string? UserName { get; set; }
    //public int PermissionId { get; set; }
    //public string? PermissionName { get; set; } 
}

public class UserRoleViewModel
{
    public Guid UserId { get; set; }
    public string? UserName { get; set; }
    //public int PermissionId { get; set; }
    //public string? PermissionName { get; set; }
}