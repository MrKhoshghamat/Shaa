using Shaa.Domain.Entities;
using Shaa.Domain.ViewModels;

namespace Shaa.Business.Services.Interfaces;

public interface ILaboratoryService
{
    Task<LaboratoryResult> RegisterLaboratory(LaboratoryViewModel laboratory);
}