using System;
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

        public async IAsyncEnumerable<Message> GetMessagesByUser(User user)
        {
            var query = _context.TbMessage
                .Include(z => z.FkGroupNavigation)
                .Include(z => z.FkUserNavigation)
                .Where(t => t.FkGroupNavigation.TbUserGroup
                    .Where(x => x.FkUser == user.UserId)
                    .Select(y => y.FkGroup).Contains(t.FkGroup))
                .Select(e => new Message()
                {
                    GroupId = e.FkGroup,
                    Message_ = e.TxMessage,
                    Timestamp = DateTime.Now.ToString(),
                    User = new User
                    {
                        UserId = e.FkUser,
                        UserName = e.FkUserNavigation.NmUserName
                    }
                })
                .AsAsyncEnumerable();

            await foreach (var item in query)
                yield return item;
        }
    }
}