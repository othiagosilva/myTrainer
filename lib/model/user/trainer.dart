import 'package:my_trainer/model/user/user.dart';

class Trainer extends User {
  String _cref = '';
  String _permission = 't';

  Trainer(username, email, password, cref) : super(username, email, password);

  get cref => this._cref;
  set cref(cref) => this._cref = cref;

  get permission => this._permission;
}
