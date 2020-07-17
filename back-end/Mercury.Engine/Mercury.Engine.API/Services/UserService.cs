using Grpc.Core;
using System.Threading.Tasks;
using Mercury.Engine.API.DbContext.UnitOfWork;
using Mercury.Engine.API.Services.GrpcGenerated;
using Mercury.Engine.API.Models.GrpcGenerated;

namespace Mercury.Engine.API.Services
{
    public class UserService : Users.UsersBase
    {
        private readonly IUnitOfWork _unitOfWork;

        public UserService(IUnitOfWork unitOfWork) => _unitOfWork = unitOfWork;

        public override async Task<GetUserByTagReply> GetUserByTag(GetUserByTagRequest request, ServerCallContext context)
        {
            var user = await _unitOfWork.TbUserRepository.GetUserByTag(request.UserTag).ConfigureAwait(false);

            return new GetUserByTagReply
            {
                User = new User
                {
                    UserId = user.IdUser,
                    UserTag = user.TxUserTag,
                    UserEmail = user.TxEmail
                }
            };
        }
    }
}