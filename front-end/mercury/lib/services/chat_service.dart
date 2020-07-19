import 'package:mercury/services/service_base.dart';

import 'gen/services/chat.pbgrpc.dart';
import 'gen/system/message.pb.dart';

class ChatService extends ServiceBase {
  Stream<SubscriptionReply> requestMessages(
      int userId, Stream<SubscriptionRequest> stream) async* {
    final _clientChannel = await setup.clientChannel;
    final client = ChatClient(_clientChannel);

    var request = SubscriptionRequest()
      ..userId = userId
      ..message = null;

    try {
      await for (var message in client.subscribe(stream)) {
        print(message.message);
        yield message;
      }
      // await _clientChannel.shutdown();
    } catch (e) {
      print('Caught error: $e');
    }
  }

  Future<PushReply> push(Message message) async {
    final clientChannel = await setup.clientChannel;
    final client = ChatClient(clientChannel);

    var request = PushRequest()..message = message;

    try {
      return await client.push(request);
    } catch (e) {}

    return PushReply()..acknowledged = false;
  }

  Stream<SubscriptionRequest> createSubRequest() async* {
    int i = 0;
    while (i < 10) {
      yield SubscriptionRequest()
        ..userId = 1
        ..message = null;
      i++;
    }
  }
}
