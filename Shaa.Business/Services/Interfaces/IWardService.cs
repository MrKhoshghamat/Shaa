using Shaa.Domain.Entities;

namespace Shaa.Business.Services.Interfaces;

public interface IWardService
{
    Task<FilterWardViewModel> FilterWard(FilterWardViewModel filter);
    Task<Ward> GetWardById(Guid id);
}