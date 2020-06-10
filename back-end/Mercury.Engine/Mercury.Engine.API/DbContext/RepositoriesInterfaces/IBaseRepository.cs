using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore.ChangeTracking;

namespace Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces
{
    public interface IBaseRepository<T> where T : class
    {
        ValueTask<EntityEntry<T>> Add(T item);
        ValueTask<T> Find(int id);
        IAsyncEnumerable<T> List();
        void Remove(T item);
    }
}