namespace Shaa.Domain.ViewModels.BasicInfo;

public class RegisterBaseInfoViewModel
{
    public int? Id { get; set; }
    public int BaseTableTypeId { get; set; }
    public string Title { get; set; }
}

public enum RegisterBaseInfoResult
{
    IsExistBaseInfo,
    Success
}