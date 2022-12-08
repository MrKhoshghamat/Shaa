using Shaa.Business.Security;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.BasicInfo;

public class AbilityService : IAbilityService
{
    private readonly IAbilityRepository _abilityRepository;

    public AbilityService(IAbilityRepository abilityRepository)
    {
        _abilityRepository = abilityRepository;
    }

    public async Task<FilterAbilityViewModel> FilterAbility(FilterAbilityViewModel filter)
    {
        var query = (await _abilityRepository.GetAllAbility()).Where(p => p.LaboratoryId == filter.LaboratoryId);


        var result = query
            .Select(s => new AbilityListViewModel()
            {
                Title = s.TitleNavigation.Title,
                FurtherDetailsAndProcedure = s.FurtherDetailsAndProcedure,
                ImplementationTime = s.ImplementationTime.ToString(),
                AbilityId = s.Id,
                
                
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
}