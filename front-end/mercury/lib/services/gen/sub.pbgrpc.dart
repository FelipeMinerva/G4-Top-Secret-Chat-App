///
//  Generated code. Do not modify.
//  source: sub.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'sub.pb.dart' as $0;
export 'sub.pb.dart';

class SubscribeClient extends $grpc.Client {
  static final _$subscribe = $grpc.ClientMethod<$0.SubRequest, $0.SubReply>(
      '/sub.Subscribe/Subscribe',
      ($0.SubRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SubReply.fromBuffer(value));

  SubscribeClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseStream<$0.SubReply> subscribe($0.SubRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$subscribe, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class SubscribeServiceBase extends $grpc.Service {
  $core.String get $name => 'sub.Subscribe';

  SubscribeServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SubRequest, $0.SubReply>(
        'Subscribe',
        subscribe_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SubRequest.fromBuffer(value),
        ($0.SubReply value) => value.writeToBuffer()));
  }

  $async.Stream<$0.SubReply> subscribe_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SubRequest> request) async* {
    yield* subscribe(call, await request);
  }

  $async.Stream<$0.SubReply> subscribe(
      $grpc.ServiceCall call, $0.SubRequest request);
}
