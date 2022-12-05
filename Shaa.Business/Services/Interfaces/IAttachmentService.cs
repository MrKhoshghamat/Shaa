using Shaa.Domain.ViewModels.Attachment;

namespace Shaa.Business.Services.Interfaces;

public interface IAttachmentService
{
    Task<FilterAttachmentViewModel> Filter(FilterAttachmentViewModel filter);
    Task RegisterRequestService(AttachmentViewModel model, byte[] fileContent);
}