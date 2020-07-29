using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces;
using Microsoft.EntityFrameworkCore;

namespace Mercury.Engine.API.DbContext.Repositories
{
    public class TbUserGroupRepository : BaseRepository<TbUserGroup>, ITbUserGroupRepository
    {
        public TbUserGroupRepository(DbMercuryContext context) : base(context)
        {
        }

        public Task BulkInsertAsync(ICollection<int> members, int groupId)
        {
            return _context.TbUserGroup
                    .AddRangeAsync(
                        members.Select(member => new TbUserGroup
                        {
                            FkGroup = groupId,
                            FkUser = member
                        }));
        }

        public async IAsyncEnumerable<TbGroup> GetGroupsByUserId(int userId)
        {
            var result = _context.TbUserGroup
                .Include(z => z.FkGroupNavigation)
                .Where(z => z.FkUser == userId)
                .Select(z => z.FkGroupNavigation)
                .AsAsyncEnumerable();

            await foreach (var item in result)
                yield return item;
        }

        public async IAsyncEnumerable<int> GetAllUsersByGroupIdAsync(int groupId, int? exceptUserId = null)
        {
            var query = _context.TbUserGroup.Where(z => z.FkGroup == groupId);

            if (exceptUserId.HasValue)
                query = query.Where(z => z.FkUser != exceptUserId);

            var result = query.Select(z => z.FkUser).AsAsyncEnumerable();

            await foreach (var item in result)
                yield return item;
        }

        public IEnumerable<int> GetAllUsersByGroupId(int groupId, int? exceptUserId = null)
        {
            var query = _context.TbUserGroup.Where(z => z.FkGroup == groupId);

            if (exceptUserId.HasValue)
                query = query.Where(z => z.FkUser != exceptUserId);

            return query.Select(z => z.FkUser);
        }
    }
}