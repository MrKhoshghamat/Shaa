using Microsoft.EntityFrameworkCore;

namespace Shaa.Domain.ViewModels.Common;

public class PagingViewModel<T>
{
    #region Ctor

    public PagingViewModel()
    {
        CurrentPage = 1;
        HowManyShowBeforeAfter = 3;
        TakeEntity = 5;
        Entities = new List<T>();
    }

    #endregion
    
    public List<T> Entities { get; set; }
    public int CurrentPage { get; set; }
    public int StartPage { get; set; }
    public int EndPage { get; set; }
    public int TotalPage { get; set; }
    public int HowManyShowBeforeAfter { get; set; }
    public int TakeEntity { get; set; }
    public int SkipEntity { get; set; }
    public int AllEntitiesCount { get; set; }

    public async Task SetPaging(IQueryable<T> query)
    {
        AllEntitiesCount = query.Count();
        TotalPage = (int)Math.Ceiling(AllEntitiesCount / (double)TakeEntity);
        CurrentPage = CurrentPage < 1 ? 1 : CurrentPage;
        CurrentPage = CurrentPage > TotalPage ? TotalPage : CurrentPage;
        SkipEntity = (CurrentPage - 1) * TakeEntity;
        StartPage = CurrentPage - HowManyShowBeforeAfter > 0 ? CurrentPage - HowManyShowBeforeAfter : 1;
        EndPage = CurrentPage + HowManyShowBeforeAfter > TotalPage ? TotalPage : CurrentPage + HowManyShowBeforeAfter;
        Entities = await query.Skip(SkipEntity).Take(TakeEntity).ToListAsync();
    }
}