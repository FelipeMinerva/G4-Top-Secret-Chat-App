import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_view_model.dart';

class UserProvider with ChangeNotifier {
  UserViewModel _user;

  UserViewModel get user => UserViewModel.fromModel(_user);

  set user(UserViewModel user) {
    _user = UserViewModel.fromModel(user);
    save(user).then((_) => print('user saved to shared preferences'));
    notifyListeners();
  }

  Future<int> checkOpenSession() async {
    final prefs = await SharedPreferences.getInstance();

    // prefs.clear();
    final userEmail = prefs.getString('user_email');
    final userTag = prefs.getString('user_tag');
    final userId = prefs.getInt('user_id');

    if (userEmail != null && userTag != null && userId != null) {
      this.user = UserViewModel(id: userId, email: userEmail, tag: userTag);
    }
    return userId ?? 0;
  }

  Future<void> save(UserViewModel user) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setInt('user_id', user.id);
    prefs.setString('user_email', user.email);
    prefs.setString('user_tag', user.tag);
  }
}
