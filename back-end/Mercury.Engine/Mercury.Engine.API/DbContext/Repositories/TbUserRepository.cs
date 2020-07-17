using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces;
using Microsoft.EntityFrameworkCore;

namespace Mercury.Engine.API.DbContext.Repositories
{
    public class TbUserRepository : BaseRepository<TbUser>, ITbUserRepository
    {
        public TbUserRepository(DbMercuryContext context) : base(context)
        {
        }

        public Task<TbUser> GetUserByEmail(string email) => _context.TbUser.FirstOrDefaultAsync(z => z.TxEmail == email);

        public Task<TbUser> GetUserByTag(string tag) => _context.TbUser.FirstOrDefaultAsync(z => z.TxUserTag == tag);

        public async IAsyncEnumerable<TbUser> GetUserByTag(ICollection<string> tags)
        {
            var result = _context.TbUser.Where(z => tags.Contains(z.TxUserTag)).AsAsyncEnumerable();

            await foreach (var item in result)
                yield return item;
        }
    }
}