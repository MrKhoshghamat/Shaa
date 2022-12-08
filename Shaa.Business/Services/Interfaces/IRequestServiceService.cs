using Shaa.Domain.ViewModels.ReqService;

namespace Shaa.Business.Services.Interfaces;

public interface IRequestServiceService
{
    Task<FilterRequestServiceViewModel> FilterRequestService(FilterRequestServiceViewModel filter);
    Task RegisterRequestService(RegisterRequestServiceViewModel model);

    //Task<FilterRequestViewModel> FilterInboxRequest(FilterRequestViewModel filter);
    //Task<FilterRequestViewModel> FilterOutboxRequest(FilterRequestViewModel filter);
    //Task<RequestResult> RegisterRequest(CreateRequestViewModel model); 
    //Task<Request> GetForCheckRequest(Guid Id);
    //Task<bool> AcceptRequest(Guid Id,string DescForCheck);
    //Task<bool> RejectRequest(Guid Id,string DescForCheck);
    //Task<bool> SetRequestStatus(Guid Id, RequestStatus requestStatus);
}