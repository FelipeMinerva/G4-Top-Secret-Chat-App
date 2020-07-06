
namespace Mercury.Engine.API.Services
{

    public class ChatGroupService : ChatGroup.ChatGroupBase
    {
        private readonly IUnitOfWork _unitOfWork;

        public ChatGroupService(IUnitOfWork unitOfWork) => _unitOfWork = unitOfWork;

        public async ValueTask<int> Create(CreateRequest request, ServerCallContext context){

        }
    }
}