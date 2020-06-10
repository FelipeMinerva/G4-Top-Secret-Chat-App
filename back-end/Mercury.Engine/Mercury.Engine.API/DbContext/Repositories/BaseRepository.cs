using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces;
using Microsoft.EntityFrameworkCore.ChangeTracking;

namespace Mercury.Engine.API.DbContext.Repositories
{
    public abstract class BaseRepository<T> : IDisposable, IBaseRepository<T> where T : class
    {
        private protected readonly DbMercuryContext _context;

        public BaseRepository(DbMercuryContext context) => _context = context;

        public ValueTask<T> Find(int id) => _context.Set<T>().FindAsync(id);

        public async IAsyncEnumerable<T> List()
        {
            var result = _context.Set<T>().AsAsyncEnumerable();

            await foreach (var item in result)
                yield return item;
        }

        public ValueTask<EntityEntry<T>> Add(T item) => _context.Set<T>().AddAsync(item);

        public void Remove(T item) => _context.Set<T>().Remove(item);

        public void Dispose() => _context.Dispose();
    }
}