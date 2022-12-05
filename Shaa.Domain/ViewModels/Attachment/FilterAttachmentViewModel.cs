using Shaa.Domain.ViewModels.Common;

namespace Shaa.Domain.ViewModels.Attachment;

public class FilterAttachmentViewModel : PagingViewModel<AttachmentViewModel>
{
    public string EntityName { get; set; }
    public string EntityRecordId { get; set; }
    public FilterEnum Sort { get; set; }
}