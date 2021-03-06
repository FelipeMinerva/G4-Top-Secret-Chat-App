using System.Collections.Generic;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.Models.GrpcGenerated;

namespace Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces
{
    public interface ITbMessageRepository : IBaseRepository<TbMessage>
    {
        IAsyncEnumerable<Message> GetMessagesByUser(int userId);
    }
}