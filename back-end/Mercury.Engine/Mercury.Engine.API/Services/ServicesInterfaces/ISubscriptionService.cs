using System.Collections.Generic;
using Grpc.Core;
using Mercury.Engine.API.Models;
using Mercury.Engine.API.Services.GrpcGenerated;

namespace Mercury.Engine.API.Services.ServiceInterfaces
{
    public interface ISubscriptionService
    {
        void Add(int userId, IAsyncStreamReader<SubscriptionRequest> request, IServerStreamWriter<SubscriptionReply> reply);
        SubscriptionContainer GetByUserId(int userId);
        IEnumerable<SubscriptionContainer> GetRangeByUserIds(IEnumerable<int> userIds);
        IAsyncStreamReader<SubscriptionRequest> GetStreamReaderByUserId(int userId);
        IServerStreamWriter<SubscriptionReply> GetStreamWriterByUserId(int userId);
    }
}