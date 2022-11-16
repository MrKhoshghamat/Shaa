using Shaa.Business.Extensions;
using Shaa.Business.Generators;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.Req;

namespace Shaa.Business.Services.Implementations;

public class RequestService : IRequestService
{
    private readonly IRequestRepository _requestRepository;

    public RequestService(IRequestRepository requestRepository)
    {
        _requestRepository = requestRepository;
    }

    public async Task<FilterRequestViewModel> FilterInboxRequest(FilterRequestViewModel filter)
    {
        var query = (await _requestRepository.GetAllRequest())
            .Where(p => p.LaboratoryId == filter.LaboratoryId);

        // if (!string.IsNullOrEmpty(filter.Search))
        // {
        //     query = query.Where(p => p.Title.Contains(filter.Search.SanitizeText().Trim()));
        // }

        var result = query
            .Select(s => new RequestListViewModel()
            {
                Title = s.Title,
                //  AbilityId = s.Id
            }).AsQueryable();

        switch (filter.Sort)
        {
            case FilterEnum.AlphabeticASC:
                query = query.OrderBy(p => p.Title);
                break;
            case FilterEnum.AlphabeticDESC:
                query = query.OrderByDescending(p => p.Title);
                break;
        }

        await filter.SetPaging(result);
        return filter;
    }

    public async Task<FilterRequestViewModel> FilterOutboxRequest(FilterRequestViewModel filter)
    {
        var query = (await _requestRepository.GetAllRequest())
            .Where(p => p.UserName == filter.UserName && p.LaboratoryId != filter.LaboratoryId);

        // if (!string.IsNullOrEmpty(filter.Search))
        // {
        //     query = query.Where(p => p.Title.Contains(filter.Search.SanitizeText().Trim()));
        // }

        var result = query
            .Select(s => new RequestListViewModel()
            {
                Title = s.Title,
                //  AbilityId = s.Id
            }).AsQueryable();

        switch (filter.Sort)
        {
            case FilterEnum.AlphabeticASC:
                query = query.OrderBy(p => p.Title);
                break;
            case FilterEnum.AlphabeticDESC:
                query = query.OrderByDescending(p => p.Title);
                break;
        }

        await filter.SetPaging(result);
        return filter;
    }

    public async Task<Request> RegisterRequest(CreateRequestViewModel model)
    {
        Request dbModel = new Request()
        {
            Id = Guid.NewGuid(),
            LaboratoryId = (Guid)model.LaboratoryId!,
            UserName = model.UserName,
            IndicatorNo = model.IndicatorNo,
            Title = model.Title,
            Description = model.Description,
            RequestTypeId = model.RequestTypeId,
            LetterPath = model.LetterPath,
            RequestDate = model.RequestDate?.ToMiladi() ?? DateTime.Now,
            TraceCode = Guid.NewGuid().ToString("N"),
        };

        await _requestRepository.AddAsync(dbModel);

        return dbModel;
    }
}