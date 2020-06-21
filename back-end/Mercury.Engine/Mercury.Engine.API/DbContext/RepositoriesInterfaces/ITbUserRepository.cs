using System.Threading.Tasks;
using Mercury.Engine.API.DbContext.Entity;

namespace Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces
{
    public interface ITbUserRepository : IBaseRepository<TbUser>
    {
        Task<TbUser> GetUserByEmail(string email);
    }
}