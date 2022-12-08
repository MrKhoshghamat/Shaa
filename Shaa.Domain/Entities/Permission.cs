using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class Permission
    {
        public int Id { get; set; }
        public byte[] Code { get; set; } = null!;
        public string Description { get; set; } = null!;
    }
}
