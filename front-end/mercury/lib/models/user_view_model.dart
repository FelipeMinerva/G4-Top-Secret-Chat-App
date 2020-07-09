class UserViewModel {
  String name;
  String email;
  int userId;
  String userTag;

  UserViewModel({this.name, this.email, this.userId, this.userTag});

  UserViewModel.fromName(this.name);

  UserViewModel.fromModel(UserViewModel user) {
    this.userId = user.userId;
    this.name = user.name;
    this.email = user.email;
    this.userTag = user.userTag;
  }
}
