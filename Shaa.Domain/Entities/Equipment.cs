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
        public Guid LaboratoryId { get; set; }
        public int EquipmentTypeId { get; set; }
        public string Title { get; set; } = null!;
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

        public virtual BaseInfo? Country { get; set; }
        public virtual BaseInfo EquipmentType { get; set; } = null!;
        public virtual Laboratory Laboratory { get; set; } = null!;
        public virtual BaseInfo? SupplyType { get; set; }
        public virtual BaseInfo UsageType { get; set; } = null!;
        public virtual Ward? Ward { get; set; }
        public virtual ICollection<EquipmentAbility> EquipmentAbilities { get; set; }
    }
}
