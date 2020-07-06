import 'package:flutter/foundation.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User _user;

  User get user{
    return User.fromModel(_user);
  }

  set user(User user){
    _user = User.fromModel(user);
    notifyListeners();
  }
}
