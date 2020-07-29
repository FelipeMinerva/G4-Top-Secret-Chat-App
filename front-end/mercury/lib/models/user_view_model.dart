import 'package:mercury/services/gen/system/user.pb.dart';

class UserViewModel {
  String email;
  int id;
  String tag;

  UserViewModel({this.email, this.id, this.tag});

  UserViewModel.simple(this.id){
    this.email = '';
    this.tag = '';
  }

  UserViewModel.fromModel(UserViewModel user) {
    this.id = user.id;
    this.email = user.email;
    this.tag = user.tag;
  }

  UserViewModel.fromProto(User userProto) {
    this.id = userProto.userId;
    this.email = userProto.userEmail;
    this.tag = userProto.userTag;
  }

  User toProto() {
    if (this == null) return null;

    return User()
      ..userTag = this.tag
      ..userId = this.id
      ..userEmail = this.email;
  }
}
