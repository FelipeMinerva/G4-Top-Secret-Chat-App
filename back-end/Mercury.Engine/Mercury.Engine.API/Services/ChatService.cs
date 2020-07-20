using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Grpc.Core;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.UnitOfWork;
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

        //public override async Task Subscribe(
        //    SubscriptionRequest request,
        //    IServerStreamWriter<SubscriptionReply> streamWriter,
        //    ServerCallContext context)
        //{
        //    var messages = _unitOfWork.TbMessageRepository.GetMessagesByUser(request.UserId).ConfigureAwait(false);

        //    await foreach (var message in messages)
        //    {
        //        await streamWriter.WriteAsync(new SubscriptionReply
        //        {
        //            Message = message
        //        })
        //        .ConfigureAwait(false);
        //    }
        //}

        public override async Task Subscribe(
            IAsyncStreamReader<SubscriptionRequest> requestStream,
            IServerStreamWriter<SubscriptionReply> replyStream,
            ServerCallContext context)
        {
            await requestStream.MoveNext();

            int userId = requestStream.Current.UserId;

            _subscriptionService.Add(userId, requestStream, replyStream);

            await foreach (var item in requestStream.ReadAllAsync())
            {
                var users = new List<int>();
                await foreach (var user in _unitOfWork.TbUserGroupRepository.GetAllUsersByGroupId(item.Message.GroupId, item.UserId))
                    users.Add(user);

                foreach (var reader in _subscriptionService.GetRangeByUserIds(users))
                {

                    await reader.StreamWriter.WriteAsync(new SubscriptionReply { Message = item.Message }).ConfigureAwait(false);
                }
            }

            var messages = _unitOfWork.TbMessageRepository.GetMessagesByUser(userId).ConfigureAwait(false);

            await foreach (var message in messages)
            {
                while (!context.CancellationToken.IsCancellationRequested)
                {
                    await replyStream.WriteAsync(new SubscriptionReply
                    {
                        Message = message
                    })
                    .ConfigureAwait(false);
                }
            }
        }

        public override async Task<PushReply> Push(PushRequest request, ServerCallContext context)
        {
            if (await _unitOfWork.TbGroupRepository.Find(request.Message.GroupId).ConfigureAwait(false) is null)
                return new PushReply { Acknowledged = false };

            await _unitOfWork.TbMessageRepository.Add(new TbMessage
            {
                DtTimestamp = DateTime.Now,
                FkGroup = request.Message.GroupId,
                FkUser = request.Message.User.UserId,
                TxMessage = request.Message.Text,
            })
              .ConfigureAwait(false);

            _unitOfWork.Save();

            return new PushReply { Acknowledged = true };
        }

    }
}