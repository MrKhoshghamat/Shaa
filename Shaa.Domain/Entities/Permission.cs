using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class Permission
    {
        public Permission()
        {
            Roles = new HashSet<Role>();
        }

        public int Id { get; set; }
        public string Code { get; set; } = null!;
        public string Description { get; set; } = null!;

        public virtual ICollection<Role> Roles { get; set; }
    }
}
