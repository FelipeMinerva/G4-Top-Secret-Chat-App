using System.Collections.Generic;
using System.Threading.Tasks;

namespace Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces
{
    public interface IBaseRepository<T> where T : class
    {
        ValueTask Add(T item);
        ValueTask<T> Find(int id);
        IAsyncEnumerable<T> List();
        void Remove(T item);
    }
}