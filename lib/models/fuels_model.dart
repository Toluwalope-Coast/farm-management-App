class Fuel {
  int _id;
  String _type;
  String _idCardNo;
  int _machineId;
  String _date;

  // Two constructor for the models (with the id and without id)

  Fuel(this._type, this._idCardNo, this._machineId);

  Fuel.withId(
      this._id, this._type, this._idCardNo, this._machineId, this._date);

  //  the getters

  int get getId => _id;
  String get getType => _type;
  String get getIdCardNo => _idCardNo;
  int get getMachineId => _machineId;
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

  set setDate(String newDate) {
    this._date = newDate;
  }

  // Convert Fuel Object to Map Object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['type'] = _type;
    map['id_card_no'] = _idCardNo;
    map['machine_id'] = _machineId;
    map['date'] = _date;
    return map;
  }

  // Extract a Fuel Object from a map Object

  Fuel.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._type = map['type'];
    this._idCardNo = map['id_card_no'];
    this._machineId = map['machine_id'];
    this._date = map['date'];
  }
}
