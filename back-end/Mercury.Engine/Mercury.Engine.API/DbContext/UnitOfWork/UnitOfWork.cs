using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.Repositories;
using Mercury.Engine.API.DbContext.Repositories.RepositoriesInterfaces;

namespace Mercury.Engine.API.DbContext.UnitOfWork
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly DbMercuryContext _context;

        public UnitOfWork(DbMercuryContext context) => _context = context;

        #region methods

        public void Save() => _context.SaveChanges();

        #endregion

        #region entities

        private ITbUserRepository _tbUserRepository;
        private ITbGroupRepository _tbGroupRepository;
        private ITbUserGroupRepository _tbUserGroupRepository;
        private ITbMessageRepository _tbMessageRepository;

        #endregion

        #region singleton setting

        public ITbUserRepository TbUserRepository
        {
            get
            {
                if (_tbUserRepository is null)
                    _tbUserRepository = new TbUserRepository(_context);

                return _tbUserRepository;
            }
        }

        public ITbGroupRepository TbGroupRepository
        {
            get
            {
                if (_tbGroupRepository is null)
                    _tbGroupRepository = new TbGroupRepository(_context);

                return _tbGroupRepository;
            }
        }

        public ITbUserGroupRepository TbUserGroupRepository
        {
            get
            {
                if (_tbUserGroupRepository is null)
                    _tbUserGroupRepository = new TbUserGroupRepository(_context);

                return _tbUserGroupRepository;
            }
        }

        public ITbMessageRepository TbMessageRepository
        {
            get
            {
                if (_tbMessageRepository is null)
                    _tbMessageRepository = new TbMessageRepository(_context);

                return _tbMessageRepository;
            }
        }

        #endregion
    }
}