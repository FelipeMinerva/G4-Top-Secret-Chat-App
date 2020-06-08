using System.Threading.Tasks;
using Grpc.Core;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.UnitOfWork;
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

        public override async Task<MessageReply> RequestMessage(MessageRequest request, ServerCallContext context)
        {
            await _unitOfWork.TbUserRepository.Add(new TbUser() { NmUserName = "Morgana" });
            _unitOfWork.Save();

            return await Task.FromResult(

                new MessageReply()
                {
                    Message = "picles"
                })
            .ConfigureAwait(false);
        }
    }
}