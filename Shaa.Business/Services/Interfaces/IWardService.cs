using Shaa.Domain.Entities;
using Shaa.Domain.ViewModels.Common;

namespace Shaa.Business.Services.Interfaces;

public interface IWardService
{
    Task<List<SelectListViewModel>> GetAllWards();
}