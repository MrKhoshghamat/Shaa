using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class AttachmentRepository : Repository<Attachment, long>, IAttachmentRepository
{
    public AttachmentRepository(ShaaDbContext context) : base(context)
    {
    }
}