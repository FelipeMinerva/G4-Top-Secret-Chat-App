import 'package:mercury/services/gen/user.pb.dart';
import 'package:mercury/services/service_base.dart';

import 'gen/user.pbgrpc.dart';

class UserService extends ServiceBase {
  Future<GetUserByTagReply> getUserByTag(String tag) async {
    final clientChannel = await setup.clientChannel;
    final client = UserClient(clientChannel);

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
