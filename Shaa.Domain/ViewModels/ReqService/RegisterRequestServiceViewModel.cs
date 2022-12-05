namespace Shaa.Domain.ViewModels.ReqService;

public class RegisterRequestServiceViewModel
{
    public Guid Id { get; set; }
    public Guid RequestId { get; set; }
    public int ServiceId { get; set; }
    public long? TotalCost { get; set; }
    public long? RecievedPayment { get; set; }
    public int? SampleCount { get; set; }
    public string? SampleTitle { get; set; }
}