using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class Role
    {
        public Role()
        {
            Permissions = new HashSet<Permission>();
            Users = new HashSet<User>();
        }

        public Guid Id { get; set; }
        public string Title { get; set; } = null!;

        public virtual ICollection<Permission> Permissions { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
