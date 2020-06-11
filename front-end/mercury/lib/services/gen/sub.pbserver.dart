///
//  Generated code. Do not modify.
//  source: sub.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'sub.pb.dart' as $0;
import 'sub.pbjson.dart';

export 'sub.pb.dart';

abstract class SubscribeServiceBase extends $pb.GeneratedService {
  $async.Future<$0.SubReply> subscribe($pb.ServerContext ctx, $0.SubRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Subscribe': return $0.SubRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Subscribe': return this.subscribe(ctx, request);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => SubscribeServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => SubscribeServiceBase$messageJson;
}

