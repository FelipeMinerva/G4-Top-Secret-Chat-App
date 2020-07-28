using System.Collections.Generic;
using System.Threading.Tasks;
using Mercury.Engine.API.DbContext.Entity;

namespace Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces
{
    public interface ITbUserGroupRepository : IBaseRepository<TbUserGroup>
    {
        Task BulkInsertAsync(ICollection<int> members, int groupId);
        IAsyncEnumerable<TbGroup> GetGroupsByUserId(int userId);
        IAsyncEnumerable<int> GetAllUsersByGroupId(int groupId, int? exceptUserId = null);
    }
}