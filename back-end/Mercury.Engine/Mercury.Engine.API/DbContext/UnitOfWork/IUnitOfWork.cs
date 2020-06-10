using Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces;

namespace Mercury.Engine.API.DbContext.UnitOfWork
{
    public interface IUnitOfWork
    {
        ITbUserRepository TbUserRepository { get; }
        ITbGroupRepository TbGroupRepository { get; }
        ITbUserGroupRepository TbUserGroupRepository { get; }
        ITbMessageRepository TbMessageRepository { get; }

        void Save();
    }
}