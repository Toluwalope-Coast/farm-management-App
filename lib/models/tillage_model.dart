import 'package:intl/intl.dart';

class Tillage {
  int _id;
  String _type;
  String _idCardNo;
  int _machineId;
  double _acreage;
  String _date = '';

  // Two constructor for the models (with the id and without id)

  Tillage(this._type, this._idCardNo, this._machineId, this._acreage);

  Tillage.withId(
      this._id, this._type, this._idCardNo, this._machineId, this._acreage);

  //  the getters

  int get getId => _id;
  String get getType => _type;
  String get getIdCardNo => _idCardNo;
  int get getMachineId => _machineId;
  double get getAcreage => _acreage;
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

  set setMachineId(int newMachineId) {
    if (newMachineId > 0) {
      this._machineId = newMachineId;
    }
  }

  set setAcreage(double newAcreage) {
    if (newAcreage > 0) {
      this._acreage = newAcreage;
    }
  }

  set setDate(String newDate) {
    this._date = newDate;
  }

  // Convert Tillage Object to Map Object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['type'] = _type;
    map['id_card_no'] = _idCardNo;
    map['machine_id'] = _machineId;
    map['acreage'] = _acreage;
    if (_date != null) {
      DateTime now = new DateTime.now();
      _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);
      map['date'] = _date;
    }
    return map;
  }

  // Extract a Tillage Object from a map Object

  Tillage.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._type = map['type'];
    this._idCardNo = map['id_card_no'];
    this._machineId = map['machine_id'];
    this._acreage = map['acreage'];
    this._date = map['date'];
  }
}
