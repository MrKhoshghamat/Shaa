namespace Shaa.Domain.ViewModels.Attachment;

public class FilterAttachmentViewModel
{
    public long Id { get; set; }
    public byte[] FileContent { get; set; } = null!;
    public Guid? requestId { get; set; }
}