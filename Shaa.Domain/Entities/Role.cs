using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class Role
    {
        public Guid Id { get; set; }
        public string Title { get; set; } = null!;
    }
}
