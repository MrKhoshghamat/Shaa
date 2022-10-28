using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.Common;

namespace Shaa.Business.Services.Implementations;

public class WardService : IWardService
{
    #region Ctor

    private readonly IWardRepository _wardRepository;

    public WardService(IWardRepository wardRepository)
    {
        _wardRepository = wardRepository;
    }

    #endregion


    public async Task<List<SelectListViewModel>> GetAllWards()
    {
        var wards = await _wardRepository.GetAllWards();

        return wards.Select(s => new SelectListViewModel()
        {
            Id = s.Row,
            Title = s.Title,
        }).ToList();
    }
}