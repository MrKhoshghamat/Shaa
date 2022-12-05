using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class RequestService
    {
        public Guid Id { get; set; }
        public Guid RequestId { get; set; }
        public int ServiceId { get; set; }
        public long? TotalCost { get; set; }
        public long? RecievedPayment { get; set; }
        public int? SampleCount { get; set; }
        public string? SampleTitle { get; set; }

        public virtual Request Request { get; set; } = null!;
        public virtual BaseInfo Service { get; set; } = null!;
    }
}
