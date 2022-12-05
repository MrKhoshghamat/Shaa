using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class AttachmentRepository : Repository<Attachment, long>, IAttachmentRepository
{
    public AttachmentRepository(ShaaDbContext context) : base(context)
    {
    }

    public IQueryable<Attachment> GetAllAttachment(Guid? id)
    {
        return _dbSet 
          //  .Where(p => p.RequestId == requestId)
            .AsQueryable();
    }
}