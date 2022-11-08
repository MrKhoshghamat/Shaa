using Shaa.Business.Services.Interfaces;
using Shaa.Domain.Entities;
using Shaa.Domain.Repositories;
namespace Shaa.Business.Services.Implementations;

public class IndicatorService : IIndicatorService
{
    private readonly SemaphoreSlim readLock = new SemaphoreSlim(1, 1);
    private readonly IIndicatorRepository _indicatorRepository;

    public IndicatorService(IIndicatorRepository indicatorRepository)
    {
        _indicatorRepository = indicatorRepository;
    }

    public async Task<IndicatorNo> GetNewIndicatorNo(string info)
    {
        IndicatorNo newModel = new IndicatorNo();
        await readLock.WaitAsync();
        try
        {
            var lastIndicator = await _indicatorRepository.GetLastIndicator(1);

            newModel = new IndicatorNo()
            {
                Id = $"1390-{lastIndicator.IndicatedNumber + 1}",
                IndicatorId = 1,
                IndicatorDate = DateTime.Now,
                IndicatedNumber = lastIndicator.IndicatedNumber + 1,
                ReqInfo = info
            };

            await _indicatorRepository.AddAsync(newModel);
        }
        finally
        {
            readLock.Release();
        }

        return newModel;
    }
}