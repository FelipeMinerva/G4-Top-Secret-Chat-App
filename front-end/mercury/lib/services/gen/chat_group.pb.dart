///
//  Generated code. Do not modify.
//  source: chat_group.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CreateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateRequest', package: const $pb.PackageName('chat_group'), createEmptyInstance: create)
    ..p<$core.int>(1, 'usersId', $pb.PbFieldType.P3, protoName: 'usersId')
    ..aOS(2, 'groupName', protoName: 'groupName')
    ..hasRequiredFields = false
  ;

  CreateRequest._() : super();
  factory CreateRequest() => create();
  factory CreateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateRequest clone() => CreateRequest()..mergeFromMessage(this);
  CreateRequest copyWith(void Function(CreateRequest) updates) => super.copyWith((message) => updates(message as CreateRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateRequest create() => CreateRequest._();
  CreateRequest createEmptyInstance() => create();
  static $pb.PbList<CreateRequest> createRepeated() => $pb.PbList<CreateRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRequest>(create);
  static CreateRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get usersId => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => clearField(2);
}

class CreateReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateReply', package: const $pb.PackageName('chat_group'), createEmptyInstance: create)
    ..a<$core.int>(1, 'groupId', $pb.PbFieldType.O3, protoName: 'groupId')
    ..hasRequiredFields = false
  ;

  CreateReply._() : super();
  factory CreateReply() => create();
  factory CreateReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateReply clone() => CreateReply()..mergeFromMessage(this);
  CreateReply copyWith(void Function(CreateReply) updates) => super.copyWith((message) => updates(message as CreateReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReply create() => CreateReply._();
  CreateReply createEmptyInstance() => create();
  static $pb.PbList<CreateReply> createRepeated() => $pb.PbList<CreateReply>();
  @$core.pragma('dart2js:noInline')
  static CreateReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateReply>(create);
  static CreateReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get groupId => $_getIZ(0);
  @$pb.TagNumber(1)
  set groupId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);
}

class GetGroupsByUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetGroupsByUserRequest', package: const $pb.PackageName('chat_group'), createEmptyInstance: create)
    ..a<$core.int>(1, 'userId', $pb.PbFieldType.O3, protoName: 'userId')
    ..hasRequiredFields = false
  ;

  GetGroupsByUserRequest._() : super();
  factory GetGroupsByUserRequest() => create();
  factory GetGroupsByUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGroupsByUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetGroupsByUserRequest clone() => GetGroupsByUserRequest()..mergeFromMessage(this);
  GetGroupsByUserRequest copyWith(void Function(GetGroupsByUserRequest) updates) => super.copyWith((message) => updates(message as GetGroupsByUserRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetGroupsByUserRequest create() => GetGroupsByUserRequest._();
  GetGroupsByUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetGroupsByUserRequest> createRepeated() => $pb.PbList<GetGroupsByUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetGroupsByUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGroupsByUserRequest>(create);
  static GetGroupsByUserRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class GetGroupsByUserReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetGroupsByUserReply', package: const $pb.PackageName('chat_group'), createEmptyInstance: create)
    ..aOM<Group>(1, 'group', subBuilder: Group.create)
    ..hasRequiredFields = false
  ;

  GetGroupsByUserReply._() : super();
  factory GetGroupsByUserReply() => create();
  factory GetGroupsByUserReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGroupsByUserReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetGroupsByUserReply clone() => GetGroupsByUserReply()..mergeFromMessage(this);
  GetGroupsByUserReply copyWith(void Function(GetGroupsByUserReply) updates) => super.copyWith((message) => updates(message as GetGroupsByUserReply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetGroupsByUserReply create() => GetGroupsByUserReply._();
  GetGroupsByUserReply createEmptyInstance() => create();
  static $pb.PbList<GetGroupsByUserReply> createRepeated() => $pb.PbList<GetGroupsByUserReply>();
  @$core.pragma('dart2js:noInline')
  static GetGroupsByUserReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGroupsByUserReply>(create);
  static GetGroupsByUserReply _defaultInstance;

  @$pb.TagNumber(1)
  Group get group => $_getN(0);
  @$pb.TagNumber(1)
  set group(Group v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroup() => clearField(1);
  @$pb.TagNumber(1)
  Group ensureGroup() => $_ensure(0);
}

class Group extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Group', package: const $pb.PackageName('chat_group'), createEmptyInstance: create)
    ..a<$core.int>(1, 'groupId', $pb.PbFieldType.O3, protoName: 'groupId')
    ..aOS(2, 'groupName', protoName: 'groupName')
    ..hasRequiredFields = false
  ;

  Group._() : super();
  factory Group() => create();
  factory Group.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Group.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Group clone() => Group()..mergeFromMessage(this);
  Group copyWith(void Function(Group) updates) => super.copyWith((message) => updates(message as Group));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Group create() => Group._();
  Group createEmptyInstance() => create();
  static $pb.PbList<Group> createRepeated() => $pb.PbList<Group>();
  @$core.pragma('dart2js:noInline')
  static Group getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Group>(create);
  static Group _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get groupId => $_getIZ(0);
  @$pb.TagNumber(1)
  set groupId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => clearField(2);
}

