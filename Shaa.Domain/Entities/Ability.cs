using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class Ability
    {
        public Ability()
        {
            EquipmentAbilities = new HashSet<EquipmentAbility>();
        }

        public Guid Id { get; set; }
        public int Title { get; set; }
        public Guid LaboratoryId { get; set; }
        public string? FurtherDetailsAndProcedure { get; set; }
        public string? DescriptionOfConsumables { get; set; }
        public long? ConsumableCost { get; set; }
        public long? HumanResourceCost { get; set; }
        public long? OtherCost { get; set; }
        public long? ImplementationCost { get; set; }
        public DateTime? ImplementationTime { get; set; }
        public string? FileAttachment { get; set; }

        public virtual Laboratory Laboratory { get; set; } = null!;
        public virtual BaseInfo TitleNavigation { get; set; } = null!;
        public virtual ICollection<EquipmentAbility> EquipmentAbilities { get; set; }
    }
}
