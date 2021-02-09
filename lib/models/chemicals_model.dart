class Chemical {
  int _id;
  String _type;
  String _idCardNo;
  int _machineId;
  double _acreage;
  String _date;

  // Two constructor for the models (with the id and without id)

  Chemical(this._type, this._idCardNo, this._machineId, this._acreage);

  Chemical.withId(this._id, this._type, this._idCardNo, this._machineId,
      this._acreage, this._date);

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

  // Convert Chemical Object to Map Object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['type'] = _type;
    map['id_card_no'] = _idCardNo;
    map['machine_id'] = _machineId;
    map['acreage'] = _acreage;
    map['date'] = _date;
    return map;
  }

  // Extract a Chemical Object from a map Object

  Chemical.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._type = map['type'];
    this._idCardNo = map['id_card_no'];
    this._machineId = map['machine_id'];
    this._acreage = double.tryParse(map['acreage'].toString());
    this._date = map['date'];
  }
}
