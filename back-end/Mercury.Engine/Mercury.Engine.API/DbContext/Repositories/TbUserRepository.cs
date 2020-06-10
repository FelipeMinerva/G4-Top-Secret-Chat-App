using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces;

namespace Mercury.Engine.API.DbContext.Repositories
{
    public class TbUserRepository : BaseRepository<TbUser>, ITbUserRepository 
    {
        private readonly DbMercuryContext _context;

        public TbUserRepository(DbMercuryContext context) : base(context)
        {
        }
    }
}