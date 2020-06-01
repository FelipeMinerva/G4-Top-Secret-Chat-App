using System.Threading.Tasks;
using Grpc.Core;
using Microsoft.Extensions.Logging;

namespace Mercury.Engine.API.Services
{
    public class ChatService : Chat.ChatBase
    {
        private readonly ILogger<ChatService> _logger;
        public ChatService(ILogger<ChatService> logger)
        {
            _logger = logger;
        }

        public override Task<MessageReply> RequestMessage(MessageRequest request, ServerCallContext context)
        {
            return Task.FromResult(new MessageReply()
            {
                Message = "picles"
            });
        }
    }
}