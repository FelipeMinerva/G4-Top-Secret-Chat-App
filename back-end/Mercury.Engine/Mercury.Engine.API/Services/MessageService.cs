using System.Threading.Tasks;
using Grpc.Core;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.UnitOfWork;
using Microsoft.Extensions.Logging;

namespace Mercury.Engine.API.Services
{
    public class MessageService : Message.MessageBase
    {
        private readonly ILogger<MessageService> _logger;
        private readonly IUnitOfWork _unitOfWork;

        public MessageService(ILogger<MessageService> logger, IUnitOfWork unitOfWork)
        {
            _logger = logger;
            _unitOfWork = unitOfWork;
        }

        public override async Task Subscribe(
            MessageRequest request,
            IServerStreamWriter<MessageReply> responseStream,
            ServerCallContext context)
        {
            var messages = _unitOfWork.TbMessageRepository.GetMessagesByUser(request.User).ConfigureAwait(false);

            await foreach (var message in messages)
            {
                await responseStream.WriteAsync(new MessageReply
                {
                    Message = message
                });
            }
        }

        public override async ValueTask<bool> Push(PushRequest request, ServerCallContext context)
        {
            if

            _unitOfWork.TbMessageRepository.Add(new TbMessage
            {
                FkGroup
            });
        }
    }
}