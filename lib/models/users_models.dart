class User {
  int _id;
  String _username;
  String _password;
  String _designation;

  // Two constructor for the models (with the id and without id)

  User(this._username, this._password, this._designation);
  User.withId(this._id, this._username, this._password, this._designation);

  //  the getters

  int get id => _id;
  String get getUsername => _username;
  String get getPassword => _password;
  String get getDesignation => _designation;

  // the setters

  set setUsername(String newUsername) {
    if (newUsername.length <= 255 && newUsername.isNotEmpty) {
      this._username = newUsername;
    }
  }

  set setPassword(String newPassword) {
    if (newPassword.length <= 255 && newPassword.isNotEmpty) {
      this._password = newPassword;
    }
  }

  set setDesignation(String newDesignation) {
    if (newDesignation.length <= 255 && newDesignation.isNotEmpty) {
      this._designation = newDesignation;
    }
  }

  // Convert User Object to Map Object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['username'] = _username;
    map['password'] = _password;
    map['designation'] = _designation;
    return map;
  }

  // Extract a User Object from a map Object

  User.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._username = map['username'];
    this._password = map['password'];
    this._designation = map['designation'];
  }
}
