import 'dart:async';
import 'package:grpc/grpc.dart';
import 'gen/login.pbgrpc.dart';
import 'package:flutter/services.dart' show rootBundle;

class LoginService {
  Future<int> requestLogin(String userName, String userEmail) async {
    final trustedRoot =
        await rootBundle.load('assets/certificates/localhost.cer');
    final channelCredentials = new ChannelCredentials.secure(
        certificates: trustedRoot.buffer.asUint8List().toList(),
        authority: 'localhost');

    final channel = ClientChannel(
      '10.0.2.2',
      port: 5001,
      options: ChannelOptions(credentials: channelCredentials),
    );

    final client = LoginClient(channel,
        options: CallOptions(
          timeout: Duration(seconds: 30),
        ));

    var request = LoginRequest()
      ..userEmail = userEmail
      ..userName = userName;

    try {
      print('opening connection');
      var response = await client.requestLogin(request);
      return response.userId;
    } catch (e) {
      print('Caught error: $e');
    }

    await channel.shutdown();
    return -1;
  }
}
