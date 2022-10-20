using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace Shaa.Domain.ViewModels;

public class BaseInfoTypeViewModel
{
    public string Title { get; set; } = null!;
}

public enum BaseInfoTypeResult
{
    BaseInfoTypeExists,
    Success
}