using System.Threading.Tasks;
using Grpc.Core;
using Mercury.Engine.API.DbContext.Entity;
using Mercury.Engine.API.DbContext.UnitOfWork;
using Mercury.Engine.API.Models.GrpcGenerated;
using Mercury.Engine.API.Services.GrpcGenerated;

namespace Mercury.Engine.API.Services
{
    public class ChatGroupService : ChatGroup.ChatGroupBase
    {
        private readonly IUnitOfWork _unitOfWork;

        public ChatGroupService(IUnitOfWork unitOfWork) => _unitOfWork = unitOfWork;

        public override async Task<CreateReply> Create(CreateRequest request, ServerCallContext context)
        {
            var group = await _unitOfWork.TbGroupRepository
                .Add(new TbGroup { NmGroupName = request.GroupName })
                .ConfigureAwait(false);

            _unitOfWork.Save();

            await _unitOfWork.TbUserGroupRepository.BulkInsertAsync(request.UsersId, group.Entity.IdGroup).ConfigureAwait(false);

            _unitOfWork.Save();

            return new CreateReply { GroupId = group.Entity.IdGroup };
        }

        public override async Task GetGroupsByUser(
            GetGroupsByUserRequest request,
            IServerStreamWriter<GetGroupsByUserReply> streamWriter,
            ServerCallContext context)
        {
            var groups = _unitOfWork.TbUserGroupRepository.GetGroupsByUserId(request.UserId).ConfigureAwait(false);

            await foreach (var group in groups)
            {
                await streamWriter.WriteAsync(new GetGroupsByUserReply
                {
                    Group = new Group
                    {
                        GroupId = group.IdGroup,
                        GroupName = group.NmGroupName
                    }
                })
                .ConfigureAwait(false);
            }
        }
    }
}