import 'package:mercury/services/service_base.dart';

import 'gen/services/users.pb.dart';
import 'gen/services/users.pbgrpc.dart';

class UserService extends ServiceBase {
  Future<GetUserByTagReply> getUserByTag(String tag) async {
    final clientChannel = await setup.clientChannel;
    final client = UsersClient(clientChannel);

    var request = GetUserByTagRequest()..userTag = tag;

    GetUserByTagReply reply;
    try {
      reply = await client.getUserByTag(request);
    } catch (e) {
      print(e.toString());
    }
    // await clientChannel.shutdown();
    return reply;
  }
}
