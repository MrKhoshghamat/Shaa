namespace Shaa.Domain.ViewModels.Req;

public class RequestListViewModel
{
    public Guid RequestId { get; set; }
    public string TraceCode { get; set; }
    public string LaboratoryTitle { get; set; }
    
    public int? StatusId { get; set; }
    public string StatusTitle { get; set; }
    public string? Title { get; set; }
}