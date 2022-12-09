using Shaa.Domain;
using Shaa.Domain.Entities;
using Shaa.Domain.ViewModels.Req;

namespace Shaa.Business.Services.Interfaces;

public interface IRequestService
{
    Task<FilterRequestViewModel> FilterInboxRequest(FilterRequestViewModel filter);
    Task<FilterRequestViewModel> FilterOutboxRequest(FilterRequestViewModel filter);
    Task<RequestResult> RegisterRequest(CreateRequestViewModel model); 
    Task<Request> GetForCheckRequest(Guid Id);
    Task<bool> AcceptRequest(Guid Id,string DescForCheck);
    Task<bool> RejectRequest(Guid Id,string DescForCheck);
    Task<bool> SetRequestStatus(Guid Id, RequestStatus requestStatus);
    Task SaveLetter(Guid requestId, string fileName);
}