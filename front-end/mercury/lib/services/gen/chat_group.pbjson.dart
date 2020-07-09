///
//  Generated code. Do not modify.
//  source: chat_group.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const CreateRequest$json = const {
  '1': 'CreateRequest',
  '2': const [
    const {'1': 'usersId', '3': 1, '4': 3, '5': 5, '10': 'usersId'},
    const {'1': 'groupName', '3': 2, '4': 1, '5': 9, '10': 'groupName'},
  ],
};

const CreateReply$json = const {
  '1': 'CreateReply',
  '2': const [
    const {'1': 'groupId', '3': 1, '4': 1, '5': 5, '10': 'groupId'},
  ],
};

const GetGroupsByUserRequest$json = const {
  '1': 'GetGroupsByUserRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 5, '10': 'userId'},
  ],
};

const GetGroupsByUserReply$json = const {
  '1': 'GetGroupsByUserReply',
  '2': const [
    const {'1': 'group', '3': 1, '4': 1, '5': 11, '6': '.chat_group.Group', '10': 'group'},
  ],
};

const Group$json = const {
  '1': 'Group',
  '2': const [
    const {'1': 'groupId', '3': 1, '4': 1, '5': 5, '10': 'groupId'},
    const {'1': 'groupName', '3': 2, '4': 1, '5': 9, '10': 'groupName'},
  ],
};

