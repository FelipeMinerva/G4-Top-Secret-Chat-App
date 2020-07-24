import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:grpc/grpc.dart';
import 'package:mercury/services/service_base.dart';

import 'gen/services/chat.pbgrpc.dart';

class ChatService extends ServiceBase {
  ClientChannel _clientChannel;
  ChatClient _client;
  DateTime _clientChannelTimeStamp;

  Future<void> _createChannel() async {
    _clientChannel = await setup.clientChannel;
    _client = ChatClient(_clientChannel);
    _clientChannelTimeStamp = DateTime.now();
  }

  void _listenOutStream(StreamController<SubscriptionReply> request,
      ResponseStream<SubscriptionReply> reply) {
    reply.listen((message) {
      request.add(message);
    }).onError((err) {
      print(DateTime.now().toString() + ' deu merda');
    });
  }

  Stream<SubscriptionReply> requestMessages(
      Stream<SubscriptionRequest> requestStream) async* {
    await _createChannel();

    final requestBufferStream = new StreamController<SubscriptionReply>();

    try {
      print(setup.connectivityMonitor.status);
      var reply = _client.subscribe(requestStream);

      _listenOutStream(requestBufferStream, reply);

      setup.connectivityMonitor.connectivity.onConnectivityChanged
          .listen((status) {
        if (status != ConnectivityResult.none) {
          setup.resetChannel();
          _createChannel().then((_) {
            reply = _client.subscribe(requestStream);
            _listenOutStream(requestBufferStream, reply);
          });
        }
      });

      await for (var message in requestBufferStream.stream) {
        yield message;
      }
    } catch (e) {
      print('Caught error: $e');
      _createChannel();
    }
  }
}
