import 'package:mercury/services/service_base.dart';

import 'gen/chat_group.pbgrpc.dart';

class ChatGroupService extends ServiceBase {
  Future<CreateReply> requestCreate(String groupName) async {
    final clientChannel = await setup.clientChannel;
    final client = ChatGroupClient(clientChannel);

    var request = CreateRequest()..groupName = groupName..usersId.add(1);

    CreateReply reply;
    try {
      reply = await client.create(request);
    } catch (e) {
      print('Caught error: $e');
    }

    await clientChannel.shutdown();
    return reply;
  }

  Stream<GetGroupsByUserReply> requestGroupsByUserId(int userId) async* {
    final clientChannel = await setup.clientChannel;
    final client = ChatGroupClient(clientChannel);

    var request = GetGroupsByUserRequest()..userId = userId;

    try {
      await for (var group in client.getGroupsByUser(request)) {
        yield group;
      }

      // client.getGroupsByUser(request).listen((z) => print(z.group.groupName));
    } catch (e) {
      print('Caught error: $e');
    }
    await clientChannel.shutdown();
  }
}
