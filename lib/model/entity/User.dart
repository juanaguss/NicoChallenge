class User {
  User(this.email, this.password) : id = _currentId++;

  late int id;
  static int _currentId = 0;
  String email;
  String password;

  factory User.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw const FormatException('JSON is null');
    }
    return User(json['email'] as String, json['password'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
