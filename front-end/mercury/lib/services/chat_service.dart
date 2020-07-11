import 'package:mercury/services/service_base.dart';

import 'gen/chat.pbgrpc.dart';

class ChatService extends ServiceBase {
  Stream<SubscriptionReply> requestMessages(int userId) async* {
    final _clientChannel = await setup.clientChannel;
    final client = ChatClient(_clientChannel);

    var request = SubscriptionRequest()..userId = userId;

    try {
      await for (var message in client.subscribe(request)) {
        print(message.message);
        yield message;
      }
      // await _clientChannel.shutdown();
    } catch (e) {
      print('Caught error: $e');
    }
  }
}
