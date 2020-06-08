using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces;
using Mercury.Engine.API.Services;
using Microsoft.EntityFrameworkCore;

namespace Mercury.Engine.API.DbContext.Repositories
{
    public class TbMessageRepository : BaseRepository<TbMessage>, ITbMessageRepository
    {
        public TbMessageRepository(DbMercuryContext context) : base(context)
        {
        }

        public async IAsyncEnumerable<TbMessage> GetMessagesByGroup(User user)
        {
            var query = _context.TbMessage.Include(z => z.FkGroupNavigation)
                .Where(z => z.FkGroupNavigation.TbUserGroup
                    .Where(x => x.FkUser == user.UserId)
                    .Select(y => y.FkGroup).Contains(z.FkGroup))
                .AsAsyncEnumerable();

            await foreach (var item in query)
                yield return item;
        }
    }
}