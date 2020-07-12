///
//  Generated code. Do not modify.
//  source: services/users.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../system/user.pb.dart' as $1;

class GetUserByTagRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetUserByTagRequest', package: const $pb.PackageName('users'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetUserByTagReply', package: const $pb.PackageName('users'), createEmptyInstance: create)
    ..aOM<$1.User>(1, 'user', subBuilder: $1.User.create)
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
  $1.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($1.User v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  $1.User ensureUser() => $_ensure(0);
}

