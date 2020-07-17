///
//  Generated code. Do not modify.
//  source: services/chat.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chat.pb.dart' as $0;
export 'chat.pb.dart';

class ChatClient extends $grpc.Client {
  static final _$subscribe =
      $grpc.ClientMethod<$0.SubscriptionRequest, $0.SubscriptionReply>(
          '/chat.Chat/Subscribe',
          ($0.SubscriptionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SubscriptionReply.fromBuffer(value));
  static final _$push = $grpc.ClientMethod<$0.PushRequest, $0.PushReply>(
      '/chat.Chat/Push',
      ($0.PushRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PushReply.fromBuffer(value));

  ChatClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseStream<$0.SubscriptionReply> subscribe(
      $0.SubscriptionRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$subscribe, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$0.PushReply> push($0.PushRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$push, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.Chat';

  ChatServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.SubscriptionRequest, $0.SubscriptionReply>(
            'Subscribe',
            subscribe_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.SubscriptionRequest.fromBuffer(value),
            ($0.SubscriptionReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PushRequest, $0.PushReply>(
        'Push',
        push_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PushRequest.fromBuffer(value),
        ($0.PushReply value) => value.writeToBuffer()));
  }

  $async.Stream<$0.SubscriptionReply> subscribe_Pre($grpc.ServiceCall call,
      $async.Future<$0.SubscriptionRequest> request) async* {
    yield* subscribe(call, await request);
  }

  $async.Future<$0.PushReply> push_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PushRequest> request) async {
    return push(call, await request);
  }

  $async.Stream<$0.SubscriptionReply> subscribe(
      $grpc.ServiceCall call, $0.SubscriptionRequest request);
  $async.Future<$0.PushReply> push(
      $grpc.ServiceCall call, $0.PushRequest request);
}
