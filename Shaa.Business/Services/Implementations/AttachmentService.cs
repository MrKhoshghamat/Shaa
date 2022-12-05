using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Repositories;

namespace Shaa.Business.Services.Implementations;

public class AttachmentService : IAttachmentService
{
    #region Ctor

    private readonly IAttachmentRepository _attachmentRepository;

    public AttachmentService(IAttachmentRepository attachmentRepository)
    {
        _attachmentRepository = attachmentRepository;
    }

    #endregion
    
}