using Shaa.Business.Extensions;
using Shaa.Business.Generators;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.Req;

namespace Shaa.Business.Services.Implementations;

public class RequestService : IRequestService
{
    private readonly IRequestRepository _requestRepository;
    private readonly IRequestIndicatorRepository _requestIndicatorRepository;
    private readonly IUserRepository _userRepository;

    public RequestService(IRequestRepository requestRepository, IRequestIndicatorRepository requestIndicatorRepository,
        IUserRepository userRepository)
    {
        _requestRepository = requestRepository;
        _requestIndicatorRepository = requestIndicatorRepository;
        _userRepository = userRepository;
    }

    public async Task<FilterRequestViewModel> FilterInboxRequest(FilterRequestViewModel filter)
    {
        var query = (await _requestRepository.GetAllRequest());

        if (filter.IsOutBox == true)
        {
            query = query.Where(p => p.UserId == filter.UserId /*&& p.Status == 18*/);
        }
        else
        {
            query = query.Where(p => p.UserId != filter.UserId /*&& p.Status == 18*/);
        }

        // if (!string.IsNullOrEmpty(filter.Search))
        // {
        //     query = query.Where(p => p.Title.Contains(filter.Search.SanitizeText().Trim()));
        // }

        var result = query
            .Select(s => new RequestListViewModel()
            {
                RequestId = s.Id,
                TraceCode = s.TraceCode,
                Title = s.Title,
                LaboratoryTitle = s.Laboratory.Title,
                StatusId = s.Status,
                StatusTitle = ((RequestStatus)s.Status!).GetDisplayName()
            }).AsQueryable();

        query = query.OrderByDescending(p => p.RequestDate);

        //switch (filter.Sort)
        //{
        //    case FilterEnum.AlphabeticASC:
        //        query = query.OrderBy(p => p.Title);
        //        break;
        //    case FilterEnum.AlphabeticDESC:
        //        query = query.OrderByDescending(p => p.Title);
        //        break;
        //}

        await filter.SetPaging(result);
        return filter;
    }

    public async Task<FilterRequestViewModel> FilterOutboxRequest(FilterRequestViewModel filter)
    {
        var query = (await _requestRepository.GetAllRequest())
            .Where(p => p.UserName == filter.UserName && p.Status == (int)RequestStatus.InitialRegistration);

        // if (!string.IsNullOrEmpty(filter.Search))
        // {
        //     query = query.Where(p => p.Title.Contains(filter.Search.SanitizeText().Trim()));
        // }

        var result = query
            .Select(s => new RequestListViewModel()
            {
                TraceCode = s.TraceCode,
                Title = s.Title,
                LaboratoryTitle = s.Laboratory.Title,
                StatusTitle = "ثبت اولیه"
            }).OrderBy(s => s.Title).AsQueryable();

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

    public async Task<RequestResult> RegisterRequest(CreateRequestViewModel model, Attachment attachment)
    {
        if (await _requestRepository.IsExistRequestByRequestNo(model.IndicatorNo)) return RequestResult.IsExist;

        try
        {
            var traceCode = CodeGenerator.CreateRequestTraceCode(model.IndicatorNo!);

            Request request = new Request()
            {
                Id = CodeGenerator.CreateId(),
                LaboratoryId = (Guid)model.LaboratoryId!,
                UserId = (Guid)model.UserId!,
                UserName = model.UserName!,
                IndicatorNo = model.IndicatorNo!,
                Title = model.Title!,
                Description = model.Description!,
                RequestTypeId = model.RequestTypeId,
                LetterPath = model.FinalPath,
                RequestDate = model.RequestDate?.ToMiladi() ?? DateTime.Now,
                TraceCode = traceCode,
                Status = (int)RequestStatus.InitialRegistration,
                RequestAttachment = attachment
            };

            await _requestRepository.AddAsync(request);
            await _requestRepository.Save();

            attachment.EntityRecordId = request.Id.ToString();
            var requestIndicator = new RequestIndicator()
            {
                RequestId = request.Id,
                IndicatorNo = request.IndicatorNo,
                TraceCode = request.TraceCode
            };

            await _requestIndicatorRepository.AddAsync(requestIndicator);
            await _requestIndicatorRepository.Save();

            model.TraceCode = request.TraceCode;
            model.Id = request.Id;

            return RequestResult.Success;
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            throw;
        }
    }

    public async Task<Request> GetForCheckRequest(Guid Id)
    {
        return await _requestRepository.GetForCheckRequest(Id);
    }

    public async Task<bool> AcceptRequest(Guid Id, string DescForCheck)
    {
        var model = await _requestRepository.GetForCheckRequest(Id);
        model.Status = (int)RequestStatus.Confirmed;
        model.DescForCheck = DescForCheck;
        await _requestRepository.UpdateAsync(model);
        return true;
    }

    public async Task<bool> RejectRequest(Guid Id, string DescForCheck)
    {
        var model = await _requestRepository.GetForCheckRequest(Id);
        model.Status = (int)RequestStatus.Rejected;
        model.DescForCheck = DescForCheck;
        await _requestRepository.UpdateAsync(model);
        return true;
    }

    public async Task<bool> SetRequestStatus(Guid Id, RequestStatus requestStatus)
    {
        var model = await _requestRepository.GetForCheckRequest(Id);
        model.Status = (byte)requestStatus;
        await _requestRepository.UpdateAsync(model);
        return true;
    }

    public async Task SaveLetter(Guid requestId, string fileName)
    {
        var request = await _requestRepository.GetByIdAsync(requestId);

        request.LetterPath = fileName;

        await _requestRepository.UpdateAsync(request);
        await _requestRepository.Save();
    }
}