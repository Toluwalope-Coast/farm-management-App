class Staff {
  int _id;
  String _firstname;
  String _lastname;
  String _username;
  String _designation;
  String _idCardNo;
  String _homeAddress;
  String _email;
  String _city;
  String _telNo;
  String _empDate;

  // Two constructor for the models (with the id and without id)

  Staff(
    this._firstname,
    this._lastname,
    this._username,
    this._designation,
    this._idCardNo,
    this._homeAddress,
    this._email,
    this._city,
    this._telNo,
  );

  Staff.withId(
    this._id,
    this._firstname,
    this._lastname,
    this._username,
    this._designation,
    this._idCardNo,
    this._homeAddress,
    this._email,
    this._city,
    this._telNo,
    this._empDate,
  );

  //  the getters

  int get getId => _id;
  String get getFirstname => _firstname;
  String get getLastname => _lastname;
  String get getUsername => _username;
  String get getDesignation => _designation;
  String get getIdCardNo => _idCardNo;
  String get getHomeAddress => _homeAddress;
  String get getEmail => _email;
  String get getCity => _city;
  String get getTelNo => _telNo;
  String get getEmpDate => _empDate;

  // the setters

  set setFirstname(String newFirstname) {
    if (newFirstname.length <= 255 && newFirstname.isNotEmpty) {
      this._firstname = newFirstname;
    }
  }

  set setLastname(String newLastname) {
    if (newLastname.length <= 255 && newLastname.isNotEmpty) {
      this._lastname = newLastname;
    }
  }

  set setUsername(String newUsername) {
    if (newUsername.length <= 255 && newUsername.isNotEmpty) {
      this._username = newUsername;
    }
  }

  set setDesignation(String newDesignation) {
    if (newDesignation.length <= 255 && newDesignation.isNotEmpty) {
      this._designation = newDesignation;
    }
  }

  set setIdCardNo(String newIdCardNo) {
    if (newIdCardNo.length <= 255 && newIdCardNo.isNotEmpty) {
      this._idCardNo = newIdCardNo;
    }
  }

  set setHomeAddress(String newHomeAddress) {
    if (newHomeAddress.length <= 255 && newHomeAddress.isNotEmpty) {
      this._homeAddress = newHomeAddress;
    }
  }

  set setEmail(String newEmail) {
    if (newEmail.length <= 255 && newEmail.isNotEmpty) {
      this._email = newEmail;
    }
  }

  set setCity(String newCity) {
    if (newCity.length <= 255 && newCity.isNotEmpty) {
      this._city = newCity;
    }
  }

  set setTelNo(String newTelNo) {
    if (newTelNo.length <= 255 && newTelNo.isNotEmpty) {
      this._telNo = newTelNo;
    }
  }

  set setEmpDate(String newEmpDate) {
    if (newEmpDate.length <= 255 && newEmpDate.isNotEmpty) {
      this._empDate = newEmpDate;
    }
  }

  // Convert Staff Object to Map Object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['username'] = _username;
    map['designation'] = _designation;
    map['id_card_no'] = _idCardNo;
    map['home_address'] = _homeAddress;
    map['city'] = _city;
    map['email'] = _email;
    map['tel_no'] = _telNo;

    // if (_empDate != null) {
    //   DateTime now = new DateTime.now();
    //   _empDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    //   map['employment_date'] = _empDate;
    return map;
    // }
  }

  // Extract a Staff Object from a map Object

  Staff.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._firstname = map['firstname'];
    this._lastname = map['lastname'];
    this._username = map['username'];
    this._designation = map['designation'];
    this._idCardNo = map['id_card_no'];
    this._homeAddress = map['home_address'];
    this._city = map['city'];
    this._email = map['email'];
    this._telNo = map['tel_no'];
    this._empDate = map['employment_date'];
  }
}
