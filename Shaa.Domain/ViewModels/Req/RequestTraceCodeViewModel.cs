namespace Shaa.Domain.ViewModels.Req;

public class RequestTraceCodeViewModel : CreateRequestViewModel
{  
    public string IndicatorNo { get; set; } = null!;
    public string IndicatorDate { get; set; } = null!;
    public string TraceCode { get; set; } = null!;

    public string LaboratoryTitle { get; set; } = null!;
    public string RequestTypeTitle { get; set; } = null!;

}