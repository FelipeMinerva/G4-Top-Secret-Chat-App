using System.Threading.Tasks;
using Grpc.Core;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.UnitOfWork;
using Microsoft.Extensions.Logging;

namespace Mercury.Engine.API.Services
{
    public class SubscriptionService : Subcribe.SubcribeBase
    {
        private readonly ILogger<ChatService> _logger;
        private readonly IUnitOfWork _unitOfWork;

        public SubscriptionService(ILogger<ChatService> logger, IUnitOfWork unitOfWork)
        {
            _logger = logger;
            _unitOfWork = unitOfWork;
        }

        public override async Task<SubReply> Subscribe(SubRequest request, ServerCallContext context)
        {
            return await Task.FromResult(new SubReply() { Message = new Message() { Message_ = "picles" } });
        }
    }
}