class User {
  final String id;
  final String userName;
  final String password;
  final String jwt;

  User(
      {required this.id,
      required this.userName,
      required this.password,
      required this.jwt});
}
