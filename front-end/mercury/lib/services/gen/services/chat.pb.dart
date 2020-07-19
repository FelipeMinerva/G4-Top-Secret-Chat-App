///
//  Generated code. Do not modify.
//  source: services/chat.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../system/message.pb.dart' as $1;

class SubscriptionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SubscriptionRequest', package: const $pb.PackageName('chat'), createEmptyInstance: create)
    ..a<$core.int>(1, 'userId', $pb.PbFieldType.O3, protoName: 'userId')
    ..aOM<$1.Message>(2, 'message', subBuilder: $1.Message.create)
    ..hasRequiredFields = false
  ;

  SubscriptionRequest._() : super();
  factory SubscriptionRequest() => create();
  factory SubscriptionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscriptionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SubscriptionRequest clone() => SubscriptionRequest()..mergeFromMessage(this);
  SubscriptionRequest copyWith(void Function(SubscriptionRequest) updates) => super.copyWith((message) => updates(message as SubscriptionRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubscriptionRequest create() => SubscriptionRequest._();
  SubscriptionRequest createEmptyInstance() => create();
  static $pb.PbList<SubscriptionRequest> createRepeated() => $pb.PbList<SubscriptionRequest>();
  @$core.pragma('dart2js:noInline')
  static SubscriptionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscriptionRequest>(create);
  static SubscriptionRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $1.Message get message => $_getN(1);
  @$pb.TagNumber(2)
  set message($1.Message v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
  @$pb.TagNumber(2)
  $1.Message ensureMessage() => $_ensure(1);
}

class SubscriptionReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SubscriptionReply', package: const $pb.PackageName('chat'), createEmptyInstance: create)
    ..aOM<$1.Message>(1, 'message', subBuilder: $1.Message.create)
    ..hasRequiredFields = false
  ;

  SubscriptionReply._() : super();
  factory SubscriptionReply() => create();
  factory SubscriptionReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscriptionReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SubscriptionReply clone() => SubscriptionReply()..mergeFromMessage(this);
  SubscriptionReply copyWith(void Function(SubscriptionReply) updates) => super.copyWith((message) => updates(message as SubscriptionReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubscriptionReply create() => SubscriptionReply._();
  SubscriptionReply createEmptyInstance() => create();
  static $pb.PbList<SubscriptionReply> createRepeated() => $pb.PbList<SubscriptionReply>();
  @$core.pragma('dart2js:noInline')
  static SubscriptionReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscriptionReply>(create);
  static SubscriptionReply _defaultInstance;

  @$pb.TagNumber(1)
  $1.Message get message => $_getN(0);
  @$pb.TagNumber(1)
  set message($1.Message v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
  @$pb.TagNumber(1)
  $1.Message ensureMessage() => $_ensure(0);
}

class PushRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PushRequest', package: const $pb.PackageName('chat'), createEmptyInstance: create)
    ..aOM<$1.Message>(1, 'message', subBuilder: $1.Message.create)
    ..hasRequiredFields = false
  ;

  PushRequest._() : super();
  factory PushRequest() => create();
  factory PushRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PushRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PushRequest clone() => PushRequest()..mergeFromMessage(this);
  PushRequest copyWith(void Function(PushRequest) updates) => super.copyWith((message) => updates(message as PushRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PushRequest create() => PushRequest._();
  PushRequest createEmptyInstance() => create();
  static $pb.PbList<PushRequest> createRepeated() => $pb.PbList<PushRequest>();
  @$core.pragma('dart2js:noInline')
  static PushRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PushRequest>(create);
  static PushRequest _defaultInstance;

  @$pb.TagNumber(1)
  $1.Message get message => $_getN(0);
  @$pb.TagNumber(1)
  set message($1.Message v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
  @$pb.TagNumber(1)
  $1.Message ensureMessage() => $_ensure(0);
}

class PushReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PushReply', package: const $pb.PackageName('chat'), createEmptyInstance: create)
    ..aOB(1, 'acknowledged')
    ..hasRequiredFields = false
  ;

  PushReply._() : super();
  factory PushReply() => create();
  factory PushReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PushReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PushReply clone() => PushReply()..mergeFromMessage(this);
  PushReply copyWith(void Function(PushReply) updates) => super.copyWith((message) => updates(message as PushReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PushReply create() => PushReply._();
  PushReply createEmptyInstance() => create();
  static $pb.PbList<PushReply> createRepeated() => $pb.PbList<PushReply>();
  @$core.pragma('dart2js:noInline')
  static PushReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PushReply>(create);
  static PushReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get acknowledged => $_getBF(0);
  @$pb.TagNumber(1)
  set acknowledged($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAcknowledged() => $_has(0);
  @$pb.TagNumber(1)
  void clearAcknowledged() => clearField(1);
}

