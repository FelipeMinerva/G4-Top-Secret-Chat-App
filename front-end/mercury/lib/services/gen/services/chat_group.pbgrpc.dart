///
//  Generated code. Do not modify.
//  source: services/chat_group.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chat_group.pb.dart' as $0;
export 'chat_group.pb.dart';

class ChatGroupClient extends $grpc.Client {
  static final _$create = $grpc.ClientMethod<$0.CreateRequest, $0.CreateReply>(
      '/chat_group.ChatGroup/Create',
      ($0.CreateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateReply.fromBuffer(value));
  static final _$getGroupsByUser =
      $grpc.ClientMethod<$0.GetGroupsByUserRequest, $0.GetGroupsByUserReply>(
          '/chat_group.ChatGroup/GetGroupsByUser',
          ($0.GetGroupsByUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetGroupsByUserReply.fromBuffer(value));

  ChatGroupClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.CreateReply> create($0.CreateRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$create, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.GetGroupsByUserReply> getGroupsByUser(
      $0.GetGroupsByUserRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getGroupsByUser, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class ChatGroupServiceBase extends $grpc.Service {
  $core.String get $name => 'chat_group.ChatGroup';

  ChatGroupServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateRequest, $0.CreateReply>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateRequest.fromBuffer(value),
        ($0.CreateReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetGroupsByUserRequest, $0.GetGroupsByUserReply>(
            'GetGroupsByUser',
            getGroupsByUser_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.GetGroupsByUserRequest.fromBuffer(value),
            ($0.GetGroupsByUserReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateReply> create_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CreateRequest> request) async {
    return create(call, await request);
  }

  $async.Stream<$0.GetGroupsByUserReply> getGroupsByUser_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetGroupsByUserRequest> request) async* {
    yield* getGroupsByUser(call, await request);
  }

  $async.Future<$0.CreateReply> create(
      $grpc.ServiceCall call, $0.CreateRequest request);
  $async.Stream<$0.GetGroupsByUserReply> getGroupsByUser(
      $grpc.ServiceCall call, $0.GetGroupsByUserRequest request);
}
