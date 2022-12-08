using Shaa.Business.Generators;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.BasicInfo;
using Shaa.Domain.ViewModels.Lab;
using Shaa.Domain.ViewModels.ReqService;

public class RequestServiceService : IRequestServiceService
{
    private readonly IRequestServiceRepository _requestServiceRepository;

    public RequestServiceService(IRequestServiceRepository requestServiceRepository)
    {
        _requestServiceRepository = requestServiceRepository;
    }

    public async Task<FilterRequestServiceViewModel> FilterRequestService(FilterRequestServiceViewModel filter)
    {
        var query = _requestServiceRepository.GetAllRequestServices(filter.RequestId).OrderBy(s => s.Service.Title);

        switch (filter.Sort)
        {
            case FilterEnum.AlphabeticASC:
                query = query.OrderBy(p => p.Service.Title);
                break;
            case FilterEnum.AlphabeticDESC:
                query = query.OrderByDescending(p => p.Service.Title);
                break;
        }

        var result = query.Select(p => new RequestServiceListViewModel()
        {
            RequestServiceId = p.Id,
            ServiceTitle = p.Service.Title,
            TotalCost = p.TotalCost,
            RecievedPayment = p.RecievedPayment,
            SampleCount = p.SampleCount,
            SampleTitle = p.SampleTitle,
        }).OrderBy(s => s.ServiceTitle).AsQueryable();

        await filter.SetPaging(result);
        return filter;
    }

    public async Task RegisterRequestService(RegisterRequestServiceViewModel model)
    {
        var requestService = new RequestService()
        {
            Id = CodeGenerator.CreateId(),
            RequestId = model.RequestId,
            ServiceId = model.ServiceId,
            TotalCost = model.TotalCost,
            RecievedPayment = model.RecievedPayment,
            SampleCount = model.SampleCount,
            SampleTitle = model.SampleTitle,
        };

        await _requestServiceRepository.AddAsync(requestService);
        await _requestServiceRepository.Save();

        model.Id = requestService.Id;
    }
}