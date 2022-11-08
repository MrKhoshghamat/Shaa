using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class IndicatorNo
    {
        public IndicatorNo()
        {
            Requests = new HashSet<Request>();
        }

        public string Id { get; set; } = null!;
        public int IndicatorId { get; set; }
        public DateTime IndicatorDate { get; set; }
        public int IndicatedNumber { get; set; }
        public string? ReqInfo { get; set; }
        public string? ReqId { get; set; }

        public virtual Indicator Indicator { get; set; } = null!;
        public virtual ICollection<Request> Requests { get; set; }
    }
}
