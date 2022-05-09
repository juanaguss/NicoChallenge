import 'package:roles_challenge/model/entity/User.dart';

abstract class Database {
  int addUser(User user);
  User? queryEmail(String email);
}

class DatabaseMock implements Database {
  static final List<User> _users = [];
  static final DatabaseMock _instance = DatabaseMock._privateConstructor();

  DatabaseMock._privateConstructor();

  factory DatabaseMock() {
    return _instance;
  }

  @override
  int addUser(User user) {
    final id = _users.length;
    user.id = id;
    _users.add(user);
    return id;
  }

  @override
  User? queryEmail(String email) {
    for (User user in _users) {
      if (user.email == email) {
        return user;
      }
    }
    return null;
  }
}
