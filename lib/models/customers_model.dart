import 'package:intl/intl.dart';

class Customer {
  int _id;
  String _name;
  String _modeOfTransaction;
  String _address;
  String _email;
  String _telNo;
  String _date = '';

  // Two constructor for the models (with the id and without id)

  Customer(this._name, this._address, this._email, this._telNo,
      [this._modeOfTransaction]);

  Customer.withId(this._id, this._name, this._address, this._email, this._telNo,
      this._modeOfTransaction, this._date);
  //  the getters

  int get getId => _id;
  String get getName => _name;
  String get getModeOfTransaction => _modeOfTransaction;
  String get getAddress => _address;
  String get getEmail => _email;
  String get getTelNo => _telNo;
  String get getDate => _date;

  // the setters

  set setName(String newName) {
    if (newName.length <= 255 && newName.isNotEmpty) {
      this._name = newName;
    }
  }

  set setModeOfTransaction(String newModeOfTransaction) {
    if (newModeOfTransaction.length <= 255 && newModeOfTransaction.isNotEmpty) {
      this._modeOfTransaction = newModeOfTransaction;
    }
  }

  set setAddress(String newAddress) {
    if (newAddress.length <= 255 && newAddress.isNotEmpty) {
      this._address = newAddress;
    }
  }

  set setEmail(String newEmail) {
    if (newEmail.length <= 255 && newEmail.isNotEmpty) {
      this._email = newEmail;
    }
  }

  set setTelNo(String newTelNo) {
    if (newTelNo.length <= 255 && newTelNo.isNotEmpty) {
      this._telNo = newTelNo;
    }
  }

  // Convert Customer Object to Map Object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['mode_of_transaction'] = _modeOfTransaction;
    map['address'] = _address;
    map['email'] = _email;
    map['tel_no'] = _telNo;
    if (_date != null) {
      DateTime now = new DateTime.now();
      _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);
      map['date'] = _date;
    }
    return map;
  }

  // Extract a Staff Object from a map Object

  Customer.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._modeOfTransaction = map['mode_of_transaction'];
    this._address = map['address'];
    this._email = map['email'];
    this._telNo = map['tel_no'];
    this._date = map['date'];
  }
}
