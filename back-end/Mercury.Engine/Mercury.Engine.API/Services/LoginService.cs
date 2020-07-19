using System.Threading.Tasks;
using Grpc.Core;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.UnitOfWork;
using Mercury.Engine.API.Services.GrpcGenerated;
using Microsoft.Extensions.Logging;

namespace Mercury.Engine.API.Services
{
    public class LoginService : Login.LoginBase
    {
        private readonly IUnitOfWork _unitOfWork;

        public LoginService(IUnitOfWork unitOfWork) => _unitOfWork = unitOfWork;

        public override async Task<LoginReply> RequestLogin(LoginRequest request, ServerCallContext context)
        {
            var user = await _unitOfWork.TbUserRepository.GetUserByEmail(request.User.UserEmail);

            if (user is null)
            {
                user = (await _unitOfWork.TbUserRepository.Add(new TbUser
                {
                    TxEmail = request.User.UserEmail,
                    TxUserTag = request.User.UserTag
                })
                    .ConfigureAwait(false))
                    .Entity;

                _unitOfWork.Save();
            }

            return new LoginReply() { UserId = user.IdUser };
        }
    }
}