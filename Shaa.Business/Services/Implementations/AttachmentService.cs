using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.Attachment;

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

    public async Task<FilterAttachmentViewModel> Filter(FilterAttachmentViewModel filter)
    {
        var query = _attachmentRepository.GetAllAttachment(null)
            .Where(p => p.EntityName == filter.EntityName && p.EntityRecordId == filter.EntityRecordId);

        //switch (filter.Sort)
        //{
        //    case FilterEnum.AlphabeticASC:
        //        query = query.OrderBy(p => p.Service.Title);
        //        break;
        //    case FilterEnum.AlphabeticDESC:
        //        query = query.OrderByDescending(p => p.Service.Title);
        //        break;
        //}

        var result = query.Select(p => new AttachmentViewModel()
        {
            Id = p.Id,
            EntityName = p.EntityName,
            EntityRecordId = p.EntityRecordId,
            FileType = p.FileType,
            FileSize = p.FileSize,
            FileName = p.FileName,
            Description = p.Description,
            DeletedDate = p.DeletedDate,
            RegisterTime = p.RegisterTime,
            UserId = p.UserId,
            UniqueId = p.UniqueId,
        }).AsQueryable();

        await filter.SetPaging(result);
        return filter;
    }

    public async Task AddAttachment(AttachmentViewModel model, byte[] fileContent)
    {
        var requestService = new Attachment()
        {
            EntityName = model.EntityName,
            EntityRecordId = model.EntityRecordId,
            FileType = model.FileType,
            FileSize = model.FileSize,
            FileName = model.FileName,
            Description = model.Description,
            DeletedDate = model.DeletedDate,
            RegisterTime = model.RegisterTime,
            UserId = model.UserId,
            UniqueId = model.UniqueId,
        };

        requestService.AttachmentContent = new AttachmentContent()
        {
            IdNavigation = requestService,
            FileContent = fileContent
        };

        await _attachmentRepository.AddAsync(requestService);
        await _attachmentRepository.Save();

        model.Id = requestService.Id;
    }

    public async Task<Attachment?> GetAttachment(Guid Id, bool withContent = false)
    {
        var dbModel = await _attachmentRepository.GetAttachment(Id, withContent);
        return dbModel;
    }

    public async Task DeleteAttachment(Guid Id)
    {
        var dbModel = await _attachmentRepository.GetAttachment(Id, true);

        await _attachmentRepository.DeleteAttachmentAsync(dbModel!);
        await _attachmentRepository.Save();
    }
}