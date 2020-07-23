import 'package:mercury/services/service_base.dart';

import 'gen/services/chat_group.pb.dart';
import 'gen/services/chat_group.pbgrpc.dart';

class ChatGroupService extends ServiceBase {
  Future<CreateReply> requestCreate(String groupName, List<int> usersId) async {
    final clientChannel = await setup.clientChannel;
    final client = ChatGroupClient(clientChannel);

    var request = CreateRequest()
      ..groupName = groupName.trim()
      ..usersId.addAll(usersId);

    CreateReply reply;
    try {
      reply = await client.create(request);
    } catch (e) {
      print('Caught error: $e');
    }

    // await clientChannel.shutdown();
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
    // await clientChannel.shutdown();
  }
}
