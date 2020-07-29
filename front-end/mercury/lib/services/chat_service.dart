import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:mercury/services/service_base.dart';

import 'gen/services/chat.pbgrpc.dart';

class ChatService extends ServiceBase {
  ClientChannel _clientChannel;
  ChatClient _client;

  Future<void> _createChannel() async {
    _clientChannel = await setup.clientChannel;
    _client = ChatClient(_clientChannel);
  }

  Stream<SubscriptionReply> requestMessages(
      Stream<SubscriptionRequest> requestStream) async* {
    await _createChannel();

    try {
      var reply = _client.subscribe(requestStream);

      await for (var message in reply) {
        yield message;
      }
    } catch (e) {
      print('Caught error: $e');
    }
  }
}
