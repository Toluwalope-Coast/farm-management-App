import 'package:intl/intl.dart';

class Seed {
  String _id;
  String _type;
  String _idCardNo;
  double _qty;
  String _unit;
  double _qtyRemaining;
  double _acreage;
  String _date = '';

  // Two constructor for the models (with the id and without id)

  Seed(this._type, this._idCardNo, this._qty, this._qtyRemaining, this._acreage,
      this._unit);

  Seed.withId(this._id, this._type, this._idCardNo, this._qty, this._unit,
      this._qtyRemaining, this._acreage, this._date);

  //  the getters

  String get getId => _id;
  String get getType => _type;
  String get getIdCardNo => _idCardNo;
  double get getQty => _qty;
  String get getUnit => _unit;
  double get getQtyRemaining => _qtyRemaining;
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

  set setUnit(double newUnit) {
    if (newUnit != null) {
      this._qty = newUnit;
    }
  }

  set setQtyRemaining(double newQtyRemaining) {
    if (newQtyRemaining != null) {
      this._qty = newQtyRemaining;
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

  // Convert Seed Object to Map Object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['type'] = _type;
    map['id_card_no'] = _idCardNo;
    map['qty'] = _qty;
    map['unit'] = _unit;
    map['qty_remaining'] = _qtyRemaining;
    map['acreage'] = _acreage;
    if (_date != null) {
      DateTime now = new DateTime.now();
      _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);
      map['date'] = _date;
    }
    return map;
  }

  // Extract a Seed Object from a map Object

  Seed.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._type = map['type'];
    this._idCardNo = map['id_card_no'];
    this._qty = map['qty'];
    this._unit = map['unit'];
    this._qtyRemaining = map['qty_remaining'];
    this._acreage = map['acreage'];
    this._date = map['date'];
  }
}
