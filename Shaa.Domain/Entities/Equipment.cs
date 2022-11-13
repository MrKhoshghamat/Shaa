using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class Equipment
    {
        public Equipment()
        {
            EquipmentAbilities = new HashSet<EquipmentAbility>();
        }

        public Guid Id { get; set; }
        public Guid? LaboratoryId { get; set; }
        public int EquipmentTypeId { get; set; }
        public string Title { get; set; } = null!;
        public string? PersianTitle { get; set; }
        public string? GeneralTechnicalSpecification { get; set; }
        public string? EquipmentUsage { get; set; }
        public int UsageTypeId { get; set; }
        public int? CountryId { get; set; }
        public string? CompanyName { get; set; }
        public string? Model { get; set; }
        public string? SerialNumber { get; set; }
        public DateTime? InstallationDate { get; set; }
        public DateTime? ExploitationDate { get; set; }
        public int? SupplyTypeId { get; set; }
        public Guid? WardId { get; set; }
        public long? EquipmentCost { get; set; }
        public string? EquipmentImage { get; set; }
        public int? RelatedSectionId { get; set; }
        public string? BaitulMalNo { get; set; }
        public int? EquipmentStatusId { get; set; }
        public int? EmploymentStatusId { get; set; }
        public string? PurchasePriceConstruction { get; set; }
        public bool? IsNeededToCalibrate { get; set; }
        public DateTime? LastCalibrationDate { get; set; }
        public DateTime? WarrantyExpirationDate { get; set; }
        public DateTime? InsuranceExpirationDate { get; set; }
        public string? SpecialCharacteristic { get; set; }
        public string? TitlesAttachedToEquipment { get; set; }
        public int Row { get; set; }

        public virtual BaseInfo? Country { get; set; }
        public virtual BaseInfo? EmploymentStatus { get; set; }
        public virtual BaseInfo? EquipmentStatus { get; set; }
        public virtual BaseInfo EquipmentType { get; set; } = null!;
        public virtual Laboratory? Laboratory { get; set; }
        public virtual BaseInfo? RelatedSection { get; set; }
        public virtual BaseInfo? SupplyType { get; set; }
        public virtual BaseInfo UsageType { get; set; } = null!;
        public virtual Ward? Ward { get; set; }
        public virtual ICollection<EquipmentAbility> EquipmentAbilities { get; set; }
    }
}
