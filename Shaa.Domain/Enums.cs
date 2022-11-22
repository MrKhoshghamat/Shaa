using System.ComponentModel.DataAnnotations;

namespace Shaa.Domain;

public enum BaseTableTypeId
{
    PassiveDefenceType = 1,
    ApprovalAuthority = 2,
    ResearchCenter = 3,
    LaboratoryType = 4,
    StandardStatus = 5,
    EquipmentType = 6,
    UsageType = 7,
    CountryId = 8,
    AbilityTitle = 9,
    EquipmentSupplyType = 10,
    EquipmentStatus = 11,
    EmploymentStatus = 12,
    RequestType = 13,
    Projects = 14
}

public enum RequestStatus
{
    [Display(Name = "ثبت اولیه")] InitialRegistration = 1,
    [Display(Name = "تایید شده")] Confirmed = 2,
    [Display(Name = "انجام شده")] Done = 3,
    [Display(Name = "رد شده")] Rejected = 4
}