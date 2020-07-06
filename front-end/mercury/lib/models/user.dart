class User {
  String name;
  String email;
  int userId;

  User({
    this.name,
    this.email,
    this.userId,
  });

  User.fromName(this.name);

  User.fromModel(User user) {
    this.userId = user.userId;
    this.name = user.name;
    this.email = user.email;
  }
}
