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
        public Guid LaboratoryId { get; set; }
        public string Title { get; set; } = null!;
        public int Row { get; set; }

        public virtual Laboratory Laboratory { get; set; } = null!;
        public virtual ICollection<Equipment> Equipment { get; set; }
    }
}
