namespace Shaa.Domain.ViewModels.BaseTableType;

public class RegisterBaseTableTypeViewModel
{
    public int? Id { get; set; }
    public string Title { get; set; }
}

public enum RegisterBaseTableTypeResult
{
    IsExisted,
    Success
}