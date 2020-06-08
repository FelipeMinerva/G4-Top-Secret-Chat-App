using System.Threading.Tasks;
using Grpc.Core;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.UnitOfWork;
using Microsoft.Extensions.Logging;

namespace Mercury.Engine.API.Services
{
    public class SubscriptionService : Subscribe.SubscribeBase
    {
        private readonly ILogger<ChatService> _logger;
        private readonly IUnitOfWork _unitOfWork;

        public SubscriptionService(ILogger<ChatService> logger, IUnitOfWork unitOfWork)
        {
            _logger = logger;
            _unitOfWork = unitOfWork;
        }

        public override async Task Subscribe(
            SubRequest request,
            IServerStreamWriter<SubReply> responseStream,
            ServerCallContext context)
        {
            var messages = _unitOfWork.TbMessageRepository.GetMessagesByGroup(request.User).ConfigureAwait(false);

            await foreach (var message in messages)
            {
                await responseStream.WriteAsync(new SubReply
                {
                    Message = new Message()
                    {
                        GroupId = message.FkGroup,
                        Message_ = message.TxMessage,
                        Timestamp = message.DtTimestamp.ToString(),
                        User = new User
                        {
                            UserId = message.FkUser,
                            UserName = "Geraltinho"
                        }
                    }
                });
            }
        }
    }
}