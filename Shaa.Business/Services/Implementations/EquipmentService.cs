using Shaa.Business.Security;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels.BasicInfo;

public class EquipmentService : IEquipmentService
{
    private readonly IEquipmentRepository _equipmentRepository;

    public EquipmentService(IEquipmentRepository equipmentRepository)
    {
        _equipmentRepository = equipmentRepository;
    }

    public async Task<FilterEquipmentViewModel> FilterEquipment(FilterEquipmentViewModel filter)
    {
        var query = (await _equipmentRepository.GetAllEquipment()).Where(p => p.LaboratoryId == filter.LaboratoryId);

        if (!string.IsNullOrEmpty(filter.Search))
        {
            query = query.Where(p => p.Title.Contains(filter.Search.SanitizeText().Trim()));
        }

        var result = query
            .Select(s => new EquipmentListViewModel()
            {
                Title = s.Title,
                EquipmentId = s.Id
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