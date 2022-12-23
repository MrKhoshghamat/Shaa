using Shaa.Business.Security;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.BasicInfo;

public class WardService : IWardService
{
    private readonly IWardRepository _wardRepository;

    public WardService(IWardRepository wardRepository)
    {
        _wardRepository = wardRepository;
    }

    public async Task<FilterWardViewModel> FilterWard(FilterWardViewModel filter)
    {
        var query = (await _wardRepository.GetAllWards(filter.LaboratoryId)).Where(p =>
            p.LaboratoryId == filter.LaboratoryId);

        if (!string.IsNullOrEmpty(filter.Title))
        {
            query = query.Where(p => p.Title.Contains(filter.Title.SanitizeText().Trim()));
        }

        var result = query
            .Select(s => new WardListViewModel()
            {
                Title = s.Title,
                WardId = s.Id
            }).OrderBy(p=>p.Title).AsQueryable();

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

    public async Task<Ward> GetWardById(Guid id)
    {
        var result = await _wardRepository.GetByIdAsync(id);
        return result;
    }

}