import 'package:roles_challenge/commons/database.dart';
import 'package:roles_challenge/roles_challenge.dart';
import 'package:roles_challenge/model/entity/User.dart';

class SignupController extends ResourceController {
  @Operation.post()
  Future<Response> signup() async {
    final map = await request?.body.decode<Map<String, dynamic>>();

    if (map == null) {
      print('map is null');
      return Response.forbidden();
    }
    final User user = User.fromJson(map);

    final Database database = DatabaseMock();
    final User? foundUser = database.queryEmail(user.email);
    if (foundUser != null) {
      print('user already exists');
      return Response.forbidden();
    }

    database.addUser(user);

    return Response.ok('An user has been added');
  }
}
