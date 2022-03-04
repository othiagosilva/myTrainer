abstract class User {
  String _username = '';
  String _email = '';
  String _password = '';

  User(String username, String email, String password);

  get username => this._username;
  set username(username) => this._username = username;

  get email => this._email;
  set email(email) => this._email = email;

  get password => this._password;
  set password(password) => this._password = password;
}
