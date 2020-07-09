///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetUserByTagRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetUserByTagRequest', package: const $pb.PackageName('user'), createEmptyInstance: create)
    ..aOS(1, 'userTag', protoName: 'userTag')
    ..hasRequiredFields = false
  ;

  GetUserByTagRequest._() : super();
  factory GetUserByTagRequest() => create();
  factory GetUserByTagRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserByTagRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetUserByTagRequest clone() => GetUserByTagRequest()..mergeFromMessage(this);
  GetUserByTagRequest copyWith(void Function(GetUserByTagRequest) updates) => super.copyWith((message) => updates(message as GetUserByTagRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserByTagRequest create() => GetUserByTagRequest._();
  GetUserByTagRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserByTagRequest> createRepeated() => $pb.PbList<GetUserByTagRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserByTagRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserByTagRequest>(create);
  static GetUserByTagRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userTag => $_getSZ(0);
  @$pb.TagNumber(1)
  set userTag($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserTag() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserTag() => clearField(1);
}

class GetUserByTagReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetUserByTagReply', package: const $pb.PackageName('user'), createEmptyInstance: create)
    ..a<$core.int>(1, 'userId', $pb.PbFieldType.O3, protoName: 'userId')
    ..aOS(2, 'userName', protoName: 'userName')
    ..hasRequiredFields = false
  ;

  GetUserByTagReply._() : super();
  factory GetUserByTagReply() => create();
  factory GetUserByTagReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserByTagReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetUserByTagReply clone() => GetUserByTagReply()..mergeFromMessage(this);
  GetUserByTagReply copyWith(void Function(GetUserByTagReply) updates) => super.copyWith((message) => updates(message as GetUserByTagReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserByTagReply create() => GetUserByTagReply._();
  GetUserByTagReply createEmptyInstance() => create();
  static $pb.PbList<GetUserByTagReply> createRepeated() => $pb.PbList<GetUserByTagReply>();
  @$core.pragma('dart2js:noInline')
  static GetUserByTagReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserByTagReply>(create);
  static GetUserByTagReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => clearField(2);
}

