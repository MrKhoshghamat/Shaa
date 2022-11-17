using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class RequestIndicator
    {
        public long Id { get; set; }
        public Guid RequestId { get; set; }
        public string IndicatorNo { get; set; } = null!;
        public string TraceCode { get; set; } = null!;

        public virtual Request Request { get; set; } = null!;
    }
}
