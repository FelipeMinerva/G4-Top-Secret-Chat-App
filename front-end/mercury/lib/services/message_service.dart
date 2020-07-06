import 'package:mercury/services/service_base.dart';

import 'gen/sub.pbgrpc.dart';

class MessageService extends ServiceBase {
  Stream<SubReply> requestMessages(User user) async* {
    final _clientChannel = await setup.clientChannel;
    final client = SubscribeClient(_clientChannel);

    var request = SubRequest()..user = user;

    try {
      await for (var message in client.subscribe(request)) {
        print(message.message);
        yield message;
      }
      await _clientChannel.shutdown();
    } catch (e) {
      print('Caught error: $e');
    }
  }
}
