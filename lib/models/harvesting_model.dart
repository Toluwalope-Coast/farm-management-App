class Harvesting {
  int _id;
  String _type;
  String _idCardNo;
  int _machineId;
  int _seedId;
  String _unit;
  double _qty;
  double _totalQtyStock;
  double _acreage;
  String _date;

  // Two constructor for the models (with the id and without id)

  Harvesting(this._type, this._idCardNo, this._qty, this._unit,
      this._totalQtyStock, this._acreage, this._machineId, this._seedId);

  Harvesting.withId(
      this._id,
      this._type,
      this._idCardNo,
      this._qty,
      this._unit,
      this._totalQtyStock,
      this._acreage,
      this._machineId,
      this._seedId,
      this._date);

  //  the getters

  int get getId => _id;
  String get getType => _type;
  String get getIdCardNo => _idCardNo;
  String get getUnit => _unit;
  double get getQty => _qty;
  double get getTotalQtyStock => _totalQtyStock;
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

  set setUnit(String newUnit) {
    if (newUnit.length <= 255 && newUnit.isNotEmpty) {
      this._unit = newUnit;
    }
  }

  set setQty(double newQty) {
    if (newQty != null) {
      this._qty = newQty;
    }
  }

  set setTotalQtyStock(double newTotalQtyStock) {
    if (newTotalQtyStock != null) {
      this._totalQtyStock = newTotalQtyStock;
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

  // Convert Harvesting Object to Map Object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['type'] = _type;
    map['id_card_no'] = _idCardNo;
    map['unit'] = _unit;
    map['qty'] = _qty;
    map['total_qty_stock'] = _totalQtyStock;
    map['machine_id'] = _machineId;
    map['seeds_id'] = _seedId;
    map['acreage'] = _acreage;
    map['date'] = _date;
    return map;
  }

  // Extract a Harvesting Object from a map Object

  Harvesting.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._type = map['type'];
    this._idCardNo = map['id_card_no'];
    this._unit = map['unit'];
    this._qty = map['qty'];
    this._totalQtyStock = map['total_qty_stock'];
    this._machineId = map['machine_id'];
    this._seedId = map['seeds_id'];
    this._acreage = map['acreage'];
    this._date = map['date'];
  }
}
