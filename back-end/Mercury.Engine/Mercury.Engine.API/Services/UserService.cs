using Grpc.Core;
using System.Threading.Tasks;
using Mercury.Engine.API.DbContext.UnitOfWork;

namespace Mercury.Engine.API.Services
{
    public class UserService : User.UserBase
    {
        private readonly IUnitOfWork _unitOfWork;

        public UserService(IUnitOfWork unitOfWork) => _unitOfWork = unitOfWork;

        public override async Task<GetUserByTagReply> GetUserByTag(GetUserByTagRequest request, ServerCallContext context)
        {
            var user = await _unitOfWork.TbUserRepository.GetUserByTag(request.UserTag).ConfigureAwait(false);

            return new GetUserByTagReply { UserId = user.IdUser, UserName = user.NmUserName };
        }
    }
}