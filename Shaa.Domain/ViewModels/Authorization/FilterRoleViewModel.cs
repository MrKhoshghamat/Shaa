using Shaa.Domain.Entities;
using Shaa.Domain.ViewModels.Common;

namespace Shaa.Domain.ViewModels.Authorization;

public class FilterRoleViewModel : PagingViewModel<RoleListViewModel>
{
    public Guid? RoleId { get; set; }
    public Role Role { get; set; }
}