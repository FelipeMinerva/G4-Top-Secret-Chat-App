using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces;

namespace Mercury.Engine.API.DbContext.Repositories
{
    public class TbGroupRepository : BaseRepository<TbGroup>, ITbGroupRepository
    {

        public TbGroupRepository(DbMercuryContext context) : base(context)
        {
        }
    }
}