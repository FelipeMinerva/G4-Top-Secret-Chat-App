import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_view_model.dart';

class UserProvider with ChangeNotifier {
  UserViewModel _user;

  UserViewModel get user {
    return UserViewModel.fromModel(_user);
  }

  set user(UserViewModel user) {
    _user = UserViewModel.fromModel(user);
    notifyListeners();
  }

  Future<int> checkOpenSession() async {
    final prefs = await SharedPreferences.getInstance();

    await save();

    final userEmail = prefs.getString('user_email');
    final userTag = prefs.getString('user_tag');
    final userId = prefs.getInt('user_id');

    if (userEmail != null && userTag != null) {
      this.user = UserViewModel()
        ..id = userId
        ..email = userEmail
        ..tag = userTag;
    }
    return userId ?? 0;
  }

  Future<void> save() async{
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt('user_id', 2);
    prefs.setString('user_email', 'carolina@mercury.com');
    prefs.setString('user_tag', 'tassol');
  }
}
