using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IAttachmentRepository : IRepository<Attachment, long>
{
    IQueryable<Attachment> GetAllAttachment(Guid? id);
    Task<Attachment?> GetAttachment(Guid Id, bool withContent); 
    Task DeleteAttachmentAsync(Attachment entity); 
}