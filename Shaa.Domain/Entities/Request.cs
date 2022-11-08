﻿using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class Request
    {
        public Guid Id { get; set; }
        public Guid LaboratoryId { get; set; }
        public string UserName { get; set; } = null!;
        public string IndicatorNo { get; set; } = null!;
        public string Title { get; set; } = null!;
        public string Description { get; set; } = null!;
        public int RequestTypeId { get; set; }
        public string? LetterPath { get; set; }
        public DateTime RequestDate { get; set; }
        public string TraceCode { get; set; } = null!;

        public virtual IndicatorNo IndicatorNoNavigation { get; set; } = null!;
        public virtual Laboratory Laboratory { get; set; } = null!;
        public virtual BaseInfo RequestType { get; set; } = null!;
    }
}