import 'package:flutter/services.dart' show rootBundle;
import 'package:grpc/grpc.dart';

class ServicesSetup {
  ChannelCredentials _channelCredentials;
  ClientChannel _clientChannel;

  ServicesSetup._constructor();

  static final ServicesSetup _instance = ServicesSetup._constructor();

  factory ServicesSetup() {
    return _instance;
  }

  Future<ChannelCredentials> get channelCredentials async {
    if (_channelCredentials == null)
      _channelCredentials = await _setupChannelCredentials();

    return _channelCredentials;
  }

  Future<ClientChannel> get clientChannel async {
    if (_clientChannel == null) _clientChannel = await _setupClientChannel();

    return _clientChannel;
  }

  Future<ChannelCredentials> _setupChannelCredentials() async {
    final trustedRoot =
        await rootBundle.load('assets/certificates/localhost.cer');

    return ChannelCredentials.secure(
        certificates: trustedRoot.buffer.asUint8List().toList(),
        authority: 'localhost');
  }

  Future<ClientChannel> _setupClientChannel() async {
    return ClientChannel(
      '10.0.2.2',
      port: 5001,
      options: ChannelOptions(credentials: await channelCredentials),
    );
  }
}
