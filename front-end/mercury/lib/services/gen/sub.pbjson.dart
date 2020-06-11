///
//  Generated code. Do not modify.
//  source: sub.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const SubRequest$json = const {
  '1': 'SubRequest',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.sub.User', '10': 'user'},
    const {'1': 'active', '3': 2, '4': 1, '5': 8, '10': 'active'},
  ],
};

const SubReply$json = const {
  '1': 'SubReply',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.sub.Message', '10': 'message'},
  ],
};

const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'userName', '3': 2, '4': 1, '5': 9, '10': 'userName'},
  ],
};

const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.sub.User', '10': 'user'},
    const {'1': 'groupId', '3': 3, '4': 1, '5': 5, '10': 'groupId'},
    const {'1': 'timestamp', '3': 4, '4': 1, '5': 9, '10': 'timestamp'},
  ],
};

const Close$json = const {
  '1': 'Close',
};

const SubscribeServiceBase$json = const {
  '1': 'Subscribe',
  '2': const [
    const {'1': 'Subscribe', '2': '.sub.SubRequest', '3': '.sub.SubReply', '6': true},
  ],
};

const SubscribeServiceBase$messageJson = const {
  '.sub.SubRequest': SubRequest$json,
  '.sub.User': User$json,
  '.sub.SubReply': SubReply$json,
  '.sub.Message': Message$json,
};

