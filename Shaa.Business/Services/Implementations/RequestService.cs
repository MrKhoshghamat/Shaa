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
    private readonly IRequestIndicatorRepository _requestIndicatorRepository;

    public RequestService(IRequestRepository requestRepository, IRequestIndicatorRepository requestIndicatorRepository)
    {
        _requestRepository = requestRepository;
        _requestIndicatorRepository = requestIndicatorRepository;
    }

    public async Task<FilterRequestViewModel> FilterInboxRequest(FilterRequestViewModel filter)
    {
        var query = (await _requestRepository.GetAllRequest())
            .Where(p => p.UserName != filter.UserName);

        // if (!string.IsNullOrEmpty(filter.Search))
        // {
        //     query = query.Where(p => p.Title.Contains(filter.Search.SanitizeText().Trim()));
        // }

        var result = query
            .Select(s => new RequestListViewModel()
            {
                TraceCode = s.TraceCode,
                Title = s.Title,
                LaboratoryTitle = s.Laboratory.Title
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
             .Where(p => p.UserName == filter.UserName);

        // if (!string.IsNullOrEmpty(filter.Search))
        // {
        //     query = query.Where(p => p.Title.Contains(filter.Search.SanitizeText().Trim()));
        // }

        var result = query
            .Select(s => new RequestListViewModel()
            {
                TraceCode = s.TraceCode,
                Title = s.Title,
                LaboratoryTitle = s.Laboratory.Title
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
        try
        {
            var traceCode = CodeGenerator.CreateRequestTraceCode(model.IndicatorNo!);

            Request request = new Request()
            {
                Id = CodeGenerator.CreateId(),
                LaboratoryId = (Guid)model.LaboratoryId!,
                UserName = model.UserName!,
                IndicatorNo = model.IndicatorNo!,
                Title = model.Title!,
                Description = model.Description!,
                RequestTypeId = model.RequestTypeId,
                LetterPath = model.LetterPath,
                RequestDate = model.RequestDate?.ToMiladi() ?? DateTime.Now,
                TraceCode = traceCode
            };

            await _requestRepository.AddAsync(request);
            await _requestRepository.Save();

            var requestIndicator = new RequestIndicator()
            {
                RequestId = request.Id,
                IndicatorNo = request.IndicatorNo,
                TraceCode = request.TraceCode
            };

            await _requestIndicatorRepository.AddAsync(requestIndicator);
            await _requestIndicatorRepository.Save();

            return request;
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            throw;
        }
    }
}