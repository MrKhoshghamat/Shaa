namespace Shaa.Domain.ViewModels.BasicInfo;

public class RequestServiceListViewModel
{
    public Guid RequestServiceId { get; set; }
    public string ServiceTitle { get; set; }
  
    public long? TotalCost { get; set; }
    public long? RecievedPayment { get; set; }
    public int? SampleCount { get; set; }
    public string? SampleTitle { get; set; } 

}