import 'package:intl/intl.dart';

class Expenses {
  String _id;
  String _productType;
  String _waybillNo;
  String _customerId;
  String _paymentMode;
  double _qtyRecieved;
  String _unit;
  double _rate;
  double _amountRecieved;
  String _date = '';

  // Two constructor for the models (with the id and without id)

  Expenses(
      this._productType,
      this._waybillNo,
      this._customerId,
      this._paymentMode,
      this._qtyRecieved,
      this._unit,
      this._rate,
      this._amountRecieved);

  Expenses.withId(
    this._id,
    this._productType,
    this._waybillNo,
    this._customerId,
    this._paymentMode,
    this._qtyRecieved,
    this._unit,
    this._rate,
    this._amountRecieved,
    this._date,
  );

  //  the getters

  String get id => _id;
  String get getProductType => _productType;
  String get getWaybillNo => _waybillNo;
  String get getCustomerID => _customerId;
  String get getPaymentMode => _paymentMode;
  double get getQtyRecieved => _qtyRecieved;
  String get getUnit => _unit;
  double get getRate => _rate;
  double get getAmountRecieved => _amountRecieved;
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

  set setCustomerID(String newCustomerID) {
    if (newCustomerID != null) {
      this._customerId = newCustomerID;
    }
  }

  set setPaymentMode(String newPaymentMode) {
    if (newPaymentMode.length <= 255 && newPaymentMode.isNotEmpty) {
      this._paymentMode = newPaymentMode;
    }
  }

  set setQtyRecieved(double newQtyRecieved) {
    if (newQtyRecieved != null) {
      this._qtyRecieved = newQtyRecieved;
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

  set setAmountRecieved(double newAmountRecieved) {
    if (newAmountRecieved != null) {
      this._amountRecieved = newAmountRecieved;
    }
  }

  set setDate(String newDate) {
    this._date = newDate;
  }

  // Convert Expenses Object to Map Object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['product_type'] = _productType;
    map['waybill_no'] = _waybillNo;
    map['customer_id'] = _customerId;
    map['payment_mode'] = _paymentMode;
    map['qty_recieved'] = _qtyRecieved;
    map['unit'] = _unit;
    map['rate'] = _rate;
    map['amount_recieved'] = _amountRecieved;
    if (_date != null) {
      DateTime now = new DateTime.now();
      _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);
      map['date'] = _date;
    }
    return map;
  }

  // Extract a Expenses Object from a map Object

  Expenses.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._productType = map['product_type'];
    this._waybillNo = map['waybill_no'];
    this._customerId = map['customer_id'];
    this._paymentMode = map['payment_mode'];
    this._qtyRecieved = map['qty_recieved'];
    this._unit = map['unit'];
    this._rate = map['rate'];
    this._amountRecieved = map['amount_recieved'];
    this._date = map['date'];
  }
}
