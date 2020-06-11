///
//  Generated code. Do not modify.
//  source: login.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'userEmail', '3': 1, '4': 1, '5': 9, '10': 'userEmail'},
    const {'1': 'userName', '3': 2, '4': 1, '5': 9, '10': 'userName'},
  ],
};

const LoginReply$json = const {
  '1': 'LoginReply',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 5, '10': 'userId'},
  ],
};

const LoginServiceBase$json = const {
  '1': 'Login',
  '2': const [
    const {'1': 'RequestLogin', '2': '.login.LoginRequest', '3': '.login.LoginReply'},
  ],
};

const LoginServiceBase$messageJson = const {
  '.login.LoginRequest': LoginRequest$json,
  '.login.LoginReply': LoginReply$json,
};

