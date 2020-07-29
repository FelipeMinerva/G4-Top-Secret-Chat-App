import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:grpc/grpc.dart';
import 'package:mercury/singletons/connectivity_monitor.dart';

class ServicesSetup {
  ConnectivityMonitor connectivityMonitor = ConnectivityMonitor();

  ChannelCredentials _channelCredentials;
  ClientChannel _clientChannel;

  ServicesSetup._constructor() {
    _resetChannelOnConnectivityLoss();
  }

  static final ServicesSetup _instance = ServicesSetup._constructor();

  factory ServicesSetup() => _instance;

  Future<ChannelCredentials> get channelCredentials async {
    if (_channelCredentials == null)
      _channelCredentials = await _setupChannelCredentials();

    return _channelCredentials;
  }

  void _resetChannelOnConnectivityLoss() {
    connectivityMonitor.connectivity.onConnectivityChanged.listen((status) {
      if (status != ConnectivityResult.none) {
        _clientChannel = null;
      }
    });
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
