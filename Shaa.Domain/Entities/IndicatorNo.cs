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

        public Guid Id { get; set; }
        public int? IndicatorId { get; set; }
        public string? Template { get; set; }

        public virtual Indicator? Indicator { get; set; }
        public virtual ICollection<Request> Requests { get; set; }
    }
}
