using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces;

namespace Mercury.Engine.API.DbContext.Repositories
{
    public class TbUserGroupRepository : BaseRepository<TbUserGroup>, ITbUserGroupRepository
    {
        private readonly DbMercuryContext _context;

        public TbUserGroupRepository(DbMercuryContext context) : base(context)
        {
        }
    }
}