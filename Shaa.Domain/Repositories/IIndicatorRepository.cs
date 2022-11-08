using Shaa.Domain.Entities;
using Shaa.Domain.Repositories.Base;

namespace Shaa.Domain.Repositories;

public interface IIndicatorRepository : IRepository<IndicatorNo, string>
{
   Task<IndicatorNo> GetLastIndicator(int indicatorId);
}