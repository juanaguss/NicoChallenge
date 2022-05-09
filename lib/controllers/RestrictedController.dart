import 'dart:convert';

import 'package:roles_challenge/roles_challenge.dart';
import 'package:roles_challenge/model/entity/User.dart';
import 'package:roles_challenge/commons/database.dart';

class RestrictedController extends ResourceController {
  @Operation.get()
  Future<Response?> restricted(
      @Bind.header('authorization') String authHeader) async {
    if (!_authSuccess(authHeader)) {
      return Response.forbidden();
    }
    return Response.ok('Hola mundo!');
  }

  bool _validUsernameAndPassword(String credentials) {
    final String decoded = utf8.decode(base64.decode(credentials));
    final parts = decoded.split(':');
    final User user = User(parts[0], parts[1]);

    final Database database = DatabaseMock();
    final User? foundUser = database.queryEmail(user.email);

    return foundUser != null && foundUser.password == user.password;
  }

  bool _authSuccess(String authHeader) {
    final parts = authHeader.split(' ');
    if (parts == null || parts.length != 2 || parts[0] != 'Basic') {
      return false;
    }
    return _validUsernameAndPassword(parts[1]);
  }
}
