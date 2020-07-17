import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:mercury/services/gen/system/user.pb.dart';
import 'package:mercury/services/service_base.dart';
import 'gen/services/login.pbgrpc.dart';

class LoginService extends ServiceBase {
  Future<int> requestLogin(String userEmail, String userTag) async {
    final clientChannel = await setup.clientChannel;

    final client = LoginClient(
      clientChannel,
      options: CallOptions(
        timeout: Duration(seconds: 30),
      ),
    );

    var request = LoginRequest()
      ..user = User()
      ..user.userTag = userTag
      ..user.userEmail = userEmail;

    try {
      print('opening connection');
      var response = await client.requestLogin(request);
      return response.userId;
    } catch (e) {
      print('Caught error: $e');
    }

    // await clientChannel.shutdown();
    return -1;
  }
}
