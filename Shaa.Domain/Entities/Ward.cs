using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class Ward
    {
        public Ward()
        {
            Equipment = new HashSet<Equipment>();
        }

        public Guid Id { get; set; }
        public Guid? LaboratoryId { get; set; }
        public string Title { get; set; } = null!;

        public virtual Laboratory? Laboratory { get; set; }
        public virtual ICollection<Equipment> Equipment { get; set; }
    }
}
