using System;
using System.Collections.Generic;
using System.Linq;

namespace Newzic.Data
{
    public class DataCRUD<T> : IDataCRUD<T> where T : class, IEntity
    {
        protected NewzicDataContext db = new NewzicDataContext();

        public void Dispose()
        {
            db.Dispose();
        }

        public virtual Guid create(T entity)
        {
            entity.Id = Guid.NewGuid();
            db.GetTable<T>().InsertOnSubmit(entity);
            return entity.Id;
        }

        public virtual void update(T entity)
        {
            
        }

        public virtual void remove(T entity)
        {
            if (entity is ISoftDelete)
            {
                var soft = (ISoftDelete)entity;
                soft.Deleted = true;
            }
            else
            {
                db.GetTable<T>().DeleteOnSubmit(entity);
            }

        }

        public void Save()
        {
            db.SubmitChanges();
        }

        public virtual T fetch(Guid id)
        {
            var result = db.GetTable<T>().Single(n=> n.Id== id);
            return result;
        }


        public IQueryable<T> fetchAll()
        {
            return db.GetTable<T>();
        }
    }
}