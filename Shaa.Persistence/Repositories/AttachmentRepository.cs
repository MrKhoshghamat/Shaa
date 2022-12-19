using Microsoft.EntityFrameworkCore;
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

    public async Task<Attachment?> GetAttachment(Guid Id, bool withContent)
    {
        var query = _dbSet.Where(p => p.UniqueId == Id);

        if (withContent)
            query = query.Include(p => p.AttachmentContent);

        return await query.FirstOrDefaultAsync();
    }

    public async Task DeleteAttachmentAsync(Attachment entity)
    {
        _context.Entry(entity.AttachmentContent!).State = EntityState.Deleted;
        _context.Entry(entity).State = EntityState.Deleted;
        await _context.SaveChangesAsync();
    }
}