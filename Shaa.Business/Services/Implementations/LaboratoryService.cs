using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels;

namespace Shaa.Business.Services.Implementations;

public class LaboratoryService : ILaboratoryService
{
    #region Ctor

    private readonly ILaboratoryRepository _laboratoryRepository;

    public LaboratoryService(ILaboratoryRepository laboratoryRepository)
    {
        _laboratoryRepository = laboratoryRepository;
    }

    #endregion
    
    public Task<LaboratoryResult> RegisterLaboratory(LaboratoryViewModel laboratory)
    {
        throw new NotImplementedException();
    }
}