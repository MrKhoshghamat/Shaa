using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class Department
    {
        public Department()
        {
            InverseParent = new HashSet<Department>();
            Laboratories = new HashSet<Laboratory>();
            Users = new HashSet<User>();
        }

        public Guid Id { get; set; }
        public Guid? ParentId { get; set; }
        public int DepartmentTypeId { get; set; }
        public string Title { get; set; } = null!;

        public virtual BaseInfo DepartmentType { get; set; } = null!;
        public virtual Department? Parent { get; set; }
        public virtual ICollection<Department> InverseParent { get; set; }
        public virtual ICollection<Laboratory> Laboratories { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
