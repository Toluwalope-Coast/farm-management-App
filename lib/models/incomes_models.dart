import 'package:intl/intl.dart';

class Income {
  int _id;
  String _productType;
  String _waybillNo;
  int _customerId;
  String _paymentMode;
  double _qtySold;
  String _unit;
  double _rate;
  double _amountSold;
  String _date = '';
  // Two constructor for the models (with the id and without id)

  Income(
      this._productType,
      this._waybillNo,
      this._customerId,
      this._paymentMode,
      this._qtySold,
      this._unit,
      this._rate,
      this._amountSold);

  Income.withId(
      this._id,
      this._productType,
      this._waybillNo,
      this._customerId,
      this._paymentMode,
      this._qtySold,
      this._unit,
      this._rate,
      this._amountSold,
      this._date);

  //  the getters

  int get id => _id;
  String get getProductType => _productType;
  String get getWaybillNo => _waybillNo;
  int get getCustomerID => _customerId;
  String get getPaymentMode => _paymentMode;
  double get getQtySold => _qtySold;
  String get getUnit => _unit;
  double get getRate => _rate;
  double get getAmountSold => _amountSold;
  String get getDate => _date;

  // the setters

  set setProductType(String newProductType) {
    if (newProductType.length <= 255 && newProductType.isNotEmpty) {
      this._productType = newProductType;
    }
  }

  set setWaybillNo(String newWaybillNo) {
    if (newWaybillNo.length <= 255 && newWaybillNo.isNotEmpty) {
      this._waybillNo = newWaybillNo;
    }
  }

  set setCustomerID(int newCustomerID) {
    if (newCustomerID <= 255 && newCustomerID > 0) {
      this._customerId = newCustomerID;
    }
  }

  set setPaymentMode(String newPaymentMode) {
    if (newPaymentMode.length <= 255 && newPaymentMode.isNotEmpty) {
      this._paymentMode = newPaymentMode;
    }
  }

  set setQtySold(double newQtySold) {
    if (newQtySold != null) {
      this._qtySold = newQtySold;
    }
  }

  set setUnit(String newUnit) {
    if (newUnit.length <= 255 && newUnit.isNotEmpty) {
      this._unit = newUnit;
    }
  }

  set setRate(double newRate) {
    if (newRate != null) {
      this._rate = newRate;
    }
  }

  set setAmountSold(double newAmountSold) {
    if (newAmountSold != null) {
      this._amountSold = newAmountSold;
    }
  }

  set setDate(String newDate) {
    this._date = newDate;
  }

  // Convert Income Object to Map Object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['product_type'] = _productType;
    map['waybill_no'] = _waybillNo;
    map['customer_id'] = _customerId;
    map['payment_mode'] = _paymentMode;
    map['qty_sold'] = _qtySold;
    map['unit'] = _unit;
    map['rate'] = _rate;
    map['amount_sold'] = _amountSold;
    if (_date != null) {
      DateTime now = new DateTime.now();
      _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);
      map['date'] = _date;
    }
    return map;
  }

  // Extract a Income Object from a map Object

  Income.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._productType = map['product_type'];
    this._waybillNo = map['waybill_no'];
    this._customerId = map['customer_id'];
    this._paymentMode = map['payment_mode'];
    this._qtySold = map['qty_sold'];
    this._unit = map['unit'];
    this._rate = map['rate'];
    this._amountSold = map['amount_sold'];
    this._date = map['date'];
  }
}
