class Planting {
  int _id;
  String _type;
  String _idCardNo;
  int _machineId;
  int _seedId;
  double _qty;
  String _unit;
  double _acreage;
  String _date;

  // Two constructor for the models (with the id and without id)

  Planting(this._type, this._idCardNo, this._qty, this._acreage, this._unit,
      this._machineId, this._seedId);

  Planting.withId(this._id, this._type, this._idCardNo, this._qty, this._unit,
      this._acreage, this._machineId, this._seedId, this._date);

  //  the getters

  int get getId => _id;
  String get getType => _type;
  String get getIdCardNo => _idCardNo;
  double get getQty => _qty;
  String get getUnit => _unit;
  int get getMachineId => _machineId;
  int get getSeedId => _seedId;
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

  set setQty(double newQty) {
    if (newQty != null) {
      this._qty = newQty;
    }
  }

  set setUnit(String newUnit) {
    if (newUnit != null) {
      this._unit = newUnit;
    }
  }

  set setMachineId(int newMachineId) {
    if (newMachineId > 0) {
      this._machineId = newMachineId;
    }
  }

  set setSeedId(int newSeedId) {
    if (newSeedId > 0) {
      this._seedId = newSeedId;
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

  // Convert Planting Object to Map Object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['type'] = _type;
    map['id_card_no'] = _idCardNo;
    map['qty'] = _qty;
    map['unit'] = _unit;
    map['machine_id'] = _machineId;
    map['seeds_id'] = _seedId;
    map['acreage'] = _acreage;
    map['date'] = _date;
    return map;
  }

  // Extract a Planting Object from a map Object

  Planting.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._type = map['type'];
    this._idCardNo = map['id_card_no'];
    this._qty = map['qty'];
    this._unit = map['unit'];
    this._machineId = map['machine_id'];
    this._seedId = map['seeds_id'];
    this._acreage = map['acreage'];
    this._date = map['date'];
  }
}
