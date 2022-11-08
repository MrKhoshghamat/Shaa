using Shaa.Domain.Entities; 

namespace Shaa.Business.Services.Interfaces;

public interface IIndicatorService
{ 
    Task<IndicatorNo> GetNewIndicatorNo(string info); 
}