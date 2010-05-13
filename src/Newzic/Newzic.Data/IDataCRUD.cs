using System;
using System.Linq;

namespace Newzic.Core
{
    public interface IDataCRUD<T> : IDisposable where T : class, IEntity
    {
        Guid create(T entity);
        void update(T entity);
        void remove(T entity);
        void Save();
        T fetch(Guid id);
        IQueryable<T> fetchAll();
    }
}