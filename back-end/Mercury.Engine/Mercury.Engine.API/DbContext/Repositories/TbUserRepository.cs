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

    }
}