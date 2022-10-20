using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using Shaa.Domain.Base;
using Shaa.Domain.Entities.Base;
using Shaa.Domain.Repositories.Base;
using Shaa.Persistence.Data;

namespace Shaa.Persistence.Repositories;

public class Repository<T, E> : IRepository<T, E> where T : class, IIdentityObject<E>
{
    #region Ctor

    protected readonly ShaaDbContext _context;
    protected DbSet<T> _dbSet;

    public Repository(ShaaDbContext context)
    {
        _context = context;
        _dbSet = context.Set<T>();
    }

    #endregion

    public void Dispose()
    {
        _context.DisposeAsync();
    }

    public async Task<IReadOnlyList<T>> GetAllAsync()
    {
        return await _dbSet.ToListAsync();
    }

    public async Task<IEnumerable<T>> GetAsync(Expression<Func<T, bool>> expression)
    {
        return await _dbSet.Where(expression).ToListAsync();
    }

    public async Task<T> GetByIdAsync(E id)
    {
        return await _dbSet.FirstOrDefaultAsync(s => s.Equals(id));
    }

    public async Task<T> AddAsync(T entity)
    {
        await _dbSet.AddAsync(entity);
        await _context.SaveChangesAsync();
        return entity;
    }

    public async Task UpdateAsync(T entity)
    {
        _dbSet.Update(entity);
        await _context.SaveChangesAsync();
    }

    public async Task DeleteAsync(T entity)
    {
        _context.Entry(entity).State = EntityState.Deleted;
        await _context.SaveChangesAsync();
    }

    public async Task Save()
    {
        await _context.SaveChangesAsync();
    }
    
    public async Task<IReadOnlyList<T>> GetPagedAsync(PagedQueryRequest pagingParam, Expression<Func<T, bool>> expression)
    {
        var skip = (pagingParam.Page - 1) * pagingParam.Size;
        return await _dbSet.Where(expression)
            .OrderByDescending(p => p.Id).Skip(skip).Take(pagingParam.Size).ToListAsync();
    }

    public async Task<IReadOnlyList<T>> GetPagedAsync(PagedQueryRequest pagingParam)
    {
        var skip = (pagingParam.Page - 1) * pagingParam.Size;
        return await _dbSet
            .OrderByDescending(p => p.Id).Skip(skip).Take(pagingParam.Size).ToListAsync();
    }
}