using System;
using System.Threading.Tasks;
using Grpc.Core;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.UnitOfWork;
using Mercury.Engine.API.Services.GrpcGenerated;
using Microsoft.Extensions.Logging;

namespace Mercury.Engine.API.Services
{
    public class ChatService : Chat.ChatBase
    {
        private readonly ILogger<ChatService> _logger;
        private readonly IUnitOfWork _unitOfWork;

        public ChatService(ILogger<ChatService> logger, IUnitOfWork unitOfWork)
        {
            _logger = logger;
            _unitOfWork = unitOfWork;
        }

        public override async Task Subscribe(
            SubscriptionRequest request,
            IServerStreamWriter<SubscriptionReply> streamWriter,
            ServerCallContext context)
        {
            var messages = _unitOfWork.TbMessageRepository.GetMessagesByUser(request.UserId).ConfigureAwait(false);

            await foreach (var message in messages)
            {
                await streamWriter.WriteAsync(new SubscriptionReply
                {
                    Message = message
                })
                .ConfigureAwait(false);
            }
        }

        public override async Task<PushReply> Push(PushRequest request, ServerCallContext context)
        {
            if (await _unitOfWork.TbGroupRepository.Find(request.Message.GroupId) is null)
                return new PushReply { Acknowledged = false };

            await _unitOfWork.TbMessageRepository.Add(new TbMessage
            {
                DtTimestamp = DateTime.Now,
                FkGroup = request.Message.GroupId,
                FkUser = request.Message.User.UserId,
                TxMessage = request.Message.Text,
            });

            _unitOfWork.Save();

            return new PushReply { Acknowledged = true };
        }

    }
}