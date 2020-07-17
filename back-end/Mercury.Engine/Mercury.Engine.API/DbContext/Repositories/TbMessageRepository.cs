using System;
using System.Collections.Generic;
using System.Linq;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces;
using Mercury.Engine.API.Models.GrpcGenerated;
using Microsoft.EntityFrameworkCore;

namespace Mercury.Engine.API.DbContext.Repositories
{
    public class TbMessageRepository : BaseRepository<TbMessage>, ITbMessageRepository
    {
        public TbMessageRepository(DbMercuryContext context) : base(context)
        {
        }

        public async IAsyncEnumerable<Message> GetMessagesByUser(int userId)
        {
            var query = _context.TbMessage
                .Include(z => z.FkGroupNavigation)
                .Include(z => z.FkUserNavigation)
                .Where(t => t.FkGroupNavigation.TbUserGroup
                    .Where(x => x.FkUser == userId)
                    .Select(y => y.FkGroup).Contains(t.FkGroup))
                .Select(e => new Message()
                {
                    GroupId = e.FkGroup,
                    Text = e.TxMessage,
                    Timestamp = DateTime.Now.ToString(),
                    User = new User
                    {
                        UserId = e.FkUserNavigation.IdUser,
                        UserEmail = e.FkUserNavigation.TxEmail,
                        UserTag = e.FkUserNavigation.TxUserTag
                    },
                })
                .AsAsyncEnumerable();

            await foreach (var item in query)
                yield return item;
        }
    }
}