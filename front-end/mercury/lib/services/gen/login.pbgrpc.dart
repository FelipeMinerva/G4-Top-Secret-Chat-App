///
//  Generated code. Do not modify.
//  source: login.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'login.pb.dart' as $0;
export 'login.pb.dart';

class LoginClient extends $grpc.Client {
  static final _$requestLogin =
      $grpc.ClientMethod<$0.LoginRequest, $0.LoginReply>(
          '/login.Login/RequestLogin',
          ($0.LoginRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.LoginReply.fromBuffer(value));

  LoginClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.LoginReply> requestLogin($0.LoginRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$requestLogin, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class LoginServiceBase extends $grpc.Service {
  $core.String get $name => 'login.Login';

  LoginServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginReply>(
        'RequestLogin',
        requestLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginReply> requestLogin_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return requestLogin(call, await request);
  }

  $async.Future<$0.LoginReply> requestLogin(
      $grpc.ServiceCall call, $0.LoginRequest request);
}
