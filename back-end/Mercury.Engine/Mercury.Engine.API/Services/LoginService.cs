using System.Threading.Tasks;
using Grpc.Core;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.UnitOfWork;
using Microsoft.Extensions.Logging;

namespace Mercury.Engine.API.Services
{
    public class LoginService : Login.LoginBase
    {
        private readonly ILogger<ChatService> _logger;
        private readonly IUnitOfWork _unitOfWork;

        public LoginService(ILogger<ChatService> logger, IUnitOfWork unitOfWork)
        {
            _logger = logger;
            _unitOfWork = unitOfWork;
        }

        public override async Task<LoginReply> RequestLogin(LoginRequest request, ServerCallContext context)
        {
            var user = await _unitOfWork.TbUserRepository.GetUserByEmail(request.UserEmail);

            if (user is null)
            {
                user = (await _unitOfWork.TbUserRepository.Add(new TbUser
                {
                    NmUserName = request.UserName,
                    TxEmail = request.UserEmail
                })
                    .ConfigureAwait(false))
                    .Entity;

                _unitOfWork.Save();
            }

            return new LoginReply() { UserId = user.IdUser };
        }
    }
}