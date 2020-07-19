using Grpc.Core;
using Mercury.Engine.API.Services.GrpcGenerated;

namespace Mercury.Engine.API.Models
{
    public class SubscriptionContainer
    {
        public int UserId { get; set; }
        public IAsyncStreamReader<SubscriptionRequest> StreamReader { get; set; }
        public IServerStreamWriter<SubscriptionReply> StreamWriter { get; set; }
    }
}
