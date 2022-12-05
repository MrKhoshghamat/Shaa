using System;
using System.Collections.Generic;

namespace Shaa.Domain.Entities
{
    public partial class AttachmentContent
    {
        public long Id { get; set; }
        public byte[] FileContent { get; set; } = null!;

        public virtual Attachment IdNavigation { get; set; } = null!;
    }
}
