import 'package:mercury/services/service_base.dart';

import 'gen/services/chat.pbgrpc.dart';

class ChatService extends ServiceBase {
  Stream<SubscriptionReply> requestMessages(
      Stream<SubscriptionRequest> requestStream) async* {
    final _clientChannel = await setup.clientChannel;
    final client = ChatClient(_clientChannel);

    try {
      await for (var message in client.subscribe(requestStream)) {
        print(message.message);
        yield message;
      }
    } catch (e) {
      print('Caught error: $e');
    }
  }
}
