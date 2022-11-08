using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class Indicator
    {
        public Indicator()
        {
            IndicatorNos = new HashSet<IndicatorNo>();
        }

        public int Id { get; set; }
        public int Year { get; set; }
        public int FromNo { get; set; }
        public int ToNo { get; set; }
        public int Increment { get; set; }
        public string Template { get; set; } = null!;

        public virtual ICollection<IndicatorNo> IndicatorNos { get; set; }
    }
}
