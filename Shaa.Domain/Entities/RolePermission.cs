using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class RolePermission
    {
        public int PermissionId { get; set; }
        public Guid RoleId { get; set; }

        public virtual Permission Permission { get; set; } = null!;
        public virtual Role Role { get; set; } = null!;
    }
}
