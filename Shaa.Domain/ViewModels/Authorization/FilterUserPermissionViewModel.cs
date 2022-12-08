using Shaa.Domain.Entities;

namespace Shaa.Domain.ViewModels.Authorization;

public class FilterUserPermissionViewModel
{
    public Guid UserId { get; set; }
    public string? UserName { get; set; }
    public int PermissionId { get; set; }
    public string? PermissionName { get; set; }
    public User User { get; set; }
    public Permission Permission { get; set; }
}