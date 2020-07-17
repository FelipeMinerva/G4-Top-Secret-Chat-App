import 'package:flutter/foundation.dart';

import '../models/user_view_model.dart';

class UserProvider with ChangeNotifier {
  UserViewModel _user;

  UserViewModel get user{
    return UserViewModel.fromModel(_user);
  }

  set user(UserViewModel user){
    _user = UserViewModel.fromModel(user);
    notifyListeners();
  }
}
