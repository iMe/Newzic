using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;

namespace Newzic.Core
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
            using (var ts = new TransactionScope())
            {
                db.SubmitChanges();
                ts.Complete();
            }
        }

        public virtual T fetch(Guid id)
        {
            var result = db.GetTable<T>().Single(n=> n.Id== id);
            return result;
        }


        public IQueryable<T> fetchAll()
        {
            if (typeof(ISoftDelete).IsAssignableFrom(typeof(T)))
            {
                return db.GetTable<T>().Cast<ISoftDelete>()
                    .Where(n => !n.Deleted)
                    .Cast<T>();
            }
            else return db.GetTable<T>();
        }
    }
}