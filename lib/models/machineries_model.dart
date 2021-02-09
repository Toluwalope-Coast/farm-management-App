import 'package:intl/intl.dart';

class Machinery {
  int _id;
  String _type;
  String _idCardNo;
  String _date = '';

  // Two constructor for the models (with the id and without id)

  Machinery(this._type, this._idCardNo);

  Machinery.withId(this._id, this._type, this._idCardNo, this._date);

  //  the getters

  int get getId => _id;
  String get getType => _type;
  String get getIdCardNo => _idCardNo;
  String get getDate => _date;

  // the setters

  set setType(String newType) {
    if (newType.length <= 255 && newType.isNotEmpty) {
      this._type = newType;
    }
  }

  set setIdCardNo(String newIdCardNo) {
    if (newIdCardNo.length <= 255 && newIdCardNo.isNotEmpty) {
      this._idCardNo = newIdCardNo;
    }
  }

  set setDate(String newDate) {
    this._date = newDate;
  }

  // Convert Machinery Object to Map Object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['type'] = _type;
    map['id_card_no'] = _idCardNo;
    if (_date != null) {
      DateTime now = new DateTime.now();
      _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);
      map['date'] = _date;
    }
    return map;
  }

  // Extract a Machinery Object from a map Object

  Machinery.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._type = map['type'];
    this._idCardNo = map['id_card_no'];
    this._date = map['date'];
  }
}
