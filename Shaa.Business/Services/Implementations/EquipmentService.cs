using Shaa.Business.Extensions;
using Shaa.Business.Generators;
using Shaa.Business.Security;
using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
using Shaa.Domain.ViewModels;

namespace Shaa.Business.Services.Implementations;

public class EquipmentService : IEquipmentService
{
    #region Ctor

    private readonly IEquipmentRepository _equipmentRepository;
    private readonly ILaboratoryRepository _laboratoryRepository;
    private readonly IWardRepository _wardRepository;

    public EquipmentService(IEquipmentRepository equipmentRepository, ILaboratoryRepository laboratoryRepository, IWardRepository wardRepository)
    {
        _equipmentRepository = equipmentRepository;
        _laboratoryRepository = laboratoryRepository;
        _wardRepository = wardRepository;
    }

    #endregion
    
    public async Task<LaboratoryResult> RegisterEquipment(LaboratoryViewModel laboratory)
    {
        if (await _equipmentRepository.IsExistEquipmentBySerialNumber(laboratory.SerialNumber))
            return LaboratoryResult.EquipmentExist;

        var lab = await _laboratoryRepository.GetLaboratoryByTitle(laboratory.LaboratoryTitle);
        var ward = new Ward()
        {
            Id = CodeGenerator.CreateId(),
            LaboratoryId = lab.Id,
            Title = "تستی"
        };

        await _wardRepository.AddAsync(ward);

        var wardModel = await _wardRepository.GetWardByLaboratoryId(lab.Id);
        
        var equipment = new Equipment()
        {
            Id = CodeGenerator.CreateId(),
            EquipmentTypeId = laboratory.EquipmentTypeId,
            Title = laboratory.EquipmentTitle,
            UsageTypeId = laboratory.UsageTypeId,
            CountryId = laboratory.CountryId,
            CompanyName = laboratory.CompanyName,
            Model = laboratory.Model,
            SerialNumber = laboratory.SerialNumber,
            InstallationDate = laboratory.InstallationDate.ToMiladi(),
            ExploitationDate = laboratory.ExploitationDate.ToMiladi(),
            LaboratoryId = lab.Id,
            WardId = wardModel.Id
        };

        await _equipmentRepository.AddAsync(equipment);

        return LaboratoryResult.Success;
    }
}