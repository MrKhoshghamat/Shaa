using Shaa.Domain.Entities;
using Shaa.Domain.ViewModels.Req;

namespace Shaa.Business.Services.Interfaces;

public interface IRequestService
{
    Task<FilterRequestViewModel> FilterInboxRequest(FilterRequestViewModel filter);
    Task<FilterRequestViewModel> FilterOutboxRequest(FilterRequestViewModel filter);
    Task<Request> RegisterRequest(CreateRequestViewModel model);
}