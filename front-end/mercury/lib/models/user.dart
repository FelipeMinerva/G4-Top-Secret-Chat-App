class User {
  String name;
  String email;
  int userId;

  User(this.name);

  User.withEmail(this.name, this.email);
}