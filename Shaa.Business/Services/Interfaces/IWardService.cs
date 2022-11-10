using Shaa.Domain.ViewModels.BasicInfo;
using Shaa.Domain.ViewModels.Common;

namespace Shaa.Business.Services.Interfaces;

public interface IWardService
{
    Task<FilterWardViewModel> FilterWard(FilterWardViewModel filter);
}