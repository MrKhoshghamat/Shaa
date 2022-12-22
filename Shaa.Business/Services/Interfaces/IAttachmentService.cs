using Shaa.Domain.Entities;
using Shaa.Domain.ViewModels.Attachment;

namespace Shaa.Business.Services.Interfaces;

public interface IAttachmentService
{
    Task<FilterAttachmentViewModel> Filter(FilterAttachmentViewModel filter);
    Task AddAttachment(AttachmentViewModel model, byte[] fileContent);
    Attachment CreateAttachment(AttachmentViewModel model, byte[] fileContent);
    Task<Attachment?> GetAttachment(Guid Id, bool withContent = false);
    Task DeleteAttachment(Guid Id);
}