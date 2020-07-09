///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const SubscriptionRequest$json = const {
  '1': 'SubscriptionRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'active', '3': 2, '4': 1, '5': 8, '10': 'active'},
  ],
};

const SubscriptionReply$json = const {
  '1': 'SubscriptionReply',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.chat.Message', '10': 'message'},
  ],
};

const PushRequest$json = const {
  '1': 'PushRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.chat.Message', '10': 'message'},
  ],
};

const PushReply$json = const {
  '1': 'PushReply',
  '2': const [
    const {'1': 'acknowledged', '3': 1, '4': 1, '5': 8, '10': 'acknowledged'},
  ],
};

const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'groupId', '3': 3, '4': 1, '5': 5, '10': 'groupId'},
    const {'1': 'timestamp', '3': 4, '4': 1, '5': 9, '10': 'timestamp'},
  ],
};

const Close$json = const {
  '1': 'Close',
};

