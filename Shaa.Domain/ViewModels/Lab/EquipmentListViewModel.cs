namespace Shaa.Domain.ViewModels.BasicInfo;

public class EquipmentListViewModel
{
    public Guid EquipmentId { get; set; }
    public string? Title { get; set; }
    public string? UsageTypeTitle { get; set; }
    public string? EquipmentUsage { get; set; }
    public string? InstallationDate { get; set; }
    public string? SupplyType { get; set; }
    public string? PurchasePriceConstruction { get; set; }
}