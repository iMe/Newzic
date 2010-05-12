using System;
using System.Linq;

namespace Newzic.Data
{
    public interface IDataCRUD<T> : IDisposable where T : class, IEntity
    {
        void create(T entity);
        void update(T entity);
        void remove(T entity);
        void Save();
        T fetch(Guid id);
        IQueryable<T> fetchAll();
    }
}