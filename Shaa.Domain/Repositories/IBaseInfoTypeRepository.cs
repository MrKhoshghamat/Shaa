using Shaa.Domain.Entities;

namespace Shaa.Domain.Repositories;

public interface IBaseInfoTypeRepository 
{
    Task<bool> IsExistBaseInfoTypeByTitle(string title);
    Task AddAsync(BaseTableType baseTableType);
    Task SaveAsync();
}