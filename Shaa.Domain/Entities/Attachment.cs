using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class Attachment
    {
        public Attachment()
        {
            Requests = new HashSet<Request>();
        }

        public long Id { get; set; }
        public string EntityName { get; set; } = null!;
        public string EntityRecordId { get; set; } = null!;
        public string? FileType { get; set; }
        public string FileSize { get; set; } = null!;
        public string FileName { get; set; } = null!;
        public string Description { get; set; } = null!;
        public DateTime? DeletedDate { get; set; }
        public DateTime? RegisterTime { get; set; }
        public Guid? UserId { get; set; }
        public Guid UniqueId { get; set; }

        public virtual AttachmentContent? AttachmentContent { get; set; }
        public virtual ICollection<Request> Requests { get; set; }
    }
}
