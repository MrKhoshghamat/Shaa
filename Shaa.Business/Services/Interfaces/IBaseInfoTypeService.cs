using Shaa.Domain.ViewModels;

namespace Shaa.Business.Services.Interfaces;

public interface IBaseInfoTypeService
{
    Task<BaseInfoTypeResult> RegisterBaseInfoType(BaseInfoTypeViewModel baseInfoType);
}