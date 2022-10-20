using System.Linq.Expressions;
using Shaa.Domain.Base;
using Shaa.Domain.Entities.Base;

namespace Shaa.Domain.Repositories.Base;

public interface IRepository<T, E> : IDisposable where T : class
{
    Task<IReadOnlyList<T>> GetAllAsync();
    Task<IEnumerable<T>> GetAsync(Expression<Func<T, bool>> expression);
    Task<T> GetByIdAsync(E id);
    Task<T> AddAsync(T entity);
    Task UpdateAsync(T entity);
    Task DeleteAsync(T entity);
    Task Save();
    
    Task<IReadOnlyList<T>> GetPagedAsync(PagedQueryRequest pagingParam, Expression<Func<T, bool>> expression);
    Task<IReadOnlyList<T>> GetPagedAsync(PagedQueryRequest pagingParam);
}