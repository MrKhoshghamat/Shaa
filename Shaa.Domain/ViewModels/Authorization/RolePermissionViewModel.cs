namespace Shaa.Domain.ViewModels.Authorization;

public class RolePermissionViewModel
{
    public int PermissionId { get; set; }
    public string? PermissionTitle { get; set; }
    public Guid RoleId { get; set; }
    public string? RoleTitle { get; set; }
    
}