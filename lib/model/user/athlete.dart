import 'package:my_trainer/model/user/user.dart';

class Athlete extends User {
  String _permission = 'a';

  Athlete(String username, String email, String password)
      : super(username, email, password);

  get permission => this._permission;
}
