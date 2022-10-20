using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class EquipmentAbility
    {
        public long Id { get; set; }
        public Guid AbilityId { get; set; }
        public Guid EquipmentId { get; set; }

        public virtual Ability Ability { get; set; } = null!;
        public virtual Equipment Equipment { get; set; } = null!;
    }
}
