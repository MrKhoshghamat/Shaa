using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class Request
    {
        public Guid Id { get; set; }
        public Guid? LaboratoryId { get; set; }
        public string UserName { get; set; } = null!;
        public string RequestLetterNo { get; set; } = null!;
        public DateTime RequestLetterDate { get; set; }
        public string RequestTitle { get; set; } = null!;
        public string RequestDescription { get; set; } = null!;
        public int RequestTypeId { get; set; }
        public Guid IndicatorNoId { get; set; }
        public string? LetterPath { get; set; }

        public virtual IndicatorNo IndicatorNo { get; set; } = null!;
        public virtual Laboratory? Laboratory { get; set; }
        public virtual BaseInfo RequestType { get; set; } = null!;
    }
}
