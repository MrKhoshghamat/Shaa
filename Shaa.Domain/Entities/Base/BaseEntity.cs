namespace Shaa.Domain.Entities.Base;

public class BaseEntity<T> : IPersistentObject<T>
{
    public T Id { get; set; }
    
}