using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.Authorization;

namespace Shaa.Business.Services.Implementations;

public class AuthorizationService : IAuthorizationService
{
    private readonly IRoleRepository _roleRepository;

    public AuthorizationService(IRoleRepository roleRepository)
    {
        _roleRepository = roleRepository;
    }

    public async Task<FilterRoleViewModel> Filter(FilterRoleViewModel filter)
    {
        var query = await _roleRepository.GetAllRole();

        //if (!string.IsNullOrEmpty(filter.Title))
        //{
        //    query = query.Where(p => p.Title.Contains(filter.Title.SanitizeText().Trim()));
        //}

        //switch (filter.Sort)
        //{
        //    case FilterEnum.AlphabeticASC:
        //        query = query.OrderBy(p => p.Title);
        //        break;
        //    case FilterEnum.AlphabeticDESC:
        //        query = query.OrderByDescending(p => p.Title);
        //        break;
        //}

        var result = query
            .Select(s => new RoleListViewModel()
            {
                Id = s.Id,
                Title = s.Title,
            }).OrderBy(p => p.Title).AsQueryable();



        await filter.SetPaging(result);
        return filter;
    }
}