using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Grpc.Core;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.UnitOfWork;
using Mercury.Engine.API.Models.GrpcGenerated;
using Mercury.Engine.API.Services.GrpcGenerated;
using Mercury.Engine.API.Services.ServiceInterfaces;

namespace Mercury.Engine.API.Services
{
    public class ChatService : Chat.ChatBase
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly ISubscriptionService _subscriptionService;

        public ChatService(IUnitOfWork unitOfWork, ISubscriptionService subscriptionService)
        {
            _unitOfWork = unitOfWork;
            _subscriptionService = subscriptionService;
        }

        public override async Task Subscribe(
            IAsyncStreamReader<SubscriptionRequest> requestStream,
            IServerStreamWriter<SubscriptionReply> replyStream,
            ServerCallContext context)
        {
            await requestStream.MoveNext();

            int userId = requestStream.Current.UserId;

            _subscriptionService.Add(userId, requestStream, replyStream);

            await Recover(userId, replyStream);
            await Listen(requestStream);
        }

        private async ValueTask Listen(IAsyncStreamReader<SubscriptionRequest> requestStream)
        {
            await foreach (var item in requestStream.ReadAllAsync().ConfigureAwait(false))
            {
                if (item.Message is null || string.IsNullOrEmpty(item.Message.Text))
                    return;

                await Save(item.Message);

                var users = _unitOfWork.TbUserGroupRepository.GetAllUsersByGroupId(item.Message.GroupId, item.UserId);

                foreach (var reader in _subscriptionService.GetRangeByUserIds(users))
                {
                    await reader.StreamWriter.WriteAsync(new SubscriptionReply { Message = item.Message }).ConfigureAwait(false);
                }
            }
        }

        private async Task Recover(int userId, IServerStreamWriter<SubscriptionReply> replyStream)
        {
            var messages = _unitOfWork.TbMessageRepository.GetMessagesByUser(userId);

            await foreach (var message in messages)
            {
                await replyStream.WriteAsync(new SubscriptionReply { Message = message });
            }
        }

        private async Task Save(Message message)
        {
            if (await _unitOfWork.TbGroupRepository.Find(message.GroupId).ConfigureAwait(false) != null)
            {
                await _unitOfWork.TbMessageRepository.Add(new TbMessage
                {
                    DtTimestamp = DateTime.Now,
                    FkGroup = message.GroupId,
                    FkUser = message.User.UserId,
                    TxMessage = message.Text,
                })
                  .ConfigureAwait(false);

                _unitOfWork.Save();
            }
        }

    }
}