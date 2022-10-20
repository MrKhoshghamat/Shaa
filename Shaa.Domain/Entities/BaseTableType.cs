using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class BaseTableType
    {
        public BaseTableType()
        {
            BaseInfos = new HashSet<BaseInfo>();
        }

        public int Id { get; set; }
        public string Title { get; set; } = null!;

        public virtual ICollection<BaseInfo> BaseInfos { get; set; }
    }
}
