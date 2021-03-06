///
//  Generated code. Do not modify.
//  source: services/users.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'users.pb.dart' as $0;
export 'users.pb.dart';

class UsersClient extends $grpc.Client {
  static final _$getUserByTag =
      $grpc.ClientMethod<$0.GetUserByTagRequest, $0.GetUserByTagReply>(
          '/users.Users/GetUserByTag',
          ($0.GetUserByTagRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetUserByTagReply.fromBuffer(value));

  UsersClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.GetUserByTagReply> getUserByTag(
      $0.GetUserByTagRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getUserByTag, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class UsersServiceBase extends $grpc.Service {
  $core.String get $name => 'users.Users';

  UsersServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetUserByTagRequest, $0.GetUserByTagReply>(
            'GetUserByTag',
            getUserByTag_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetUserByTagRequest.fromBuffer(value),
            ($0.GetUserByTagReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetUserByTagReply> getUserByTag_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetUserByTagRequest> request) async {
    return getUserByTag(call, await request);
  }

  $async.Future<$0.GetUserByTagReply> getUserByTag(
      $grpc.ServiceCall call, $0.GetUserByTagRequest request);
}
