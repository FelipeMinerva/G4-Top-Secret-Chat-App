using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces;

namespace Mercury.Engine.API.DbContext.Repositories
{
    public abstract class BaseRepository<T> : IDisposable, IBaseRepository<T> where T : class
    {
        private protected readonly DbMercuryContext _context;

        public BaseRepository(DbMercuryContext context)
        {
            _context = context;
        }

        public async ValueTask<T> Find(int id) => await _context.Set<T>().FindAsync(id).ConfigureAwait(false);

        public async IAsyncEnumerable<T> List()
        {
            var result = _context.Set<T>().AsAsyncEnumerable();

            await foreach (var item in result)
                yield return item;
        }

        public async ValueTask Add(T item) => await _context.Set<T>().AddAsync(item).ConfigureAwait(false);

        public void Remove(T item) => _context.Set<T>().Remove(item);

        public void Dispose() => _context.Dispose();
    }
}