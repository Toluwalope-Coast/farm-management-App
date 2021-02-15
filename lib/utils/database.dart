import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_manager/models/chemicals_model.dart';
import 'package:farm_manager/models/customers_model.dart';
import 'package:farm_manager/models/expenses_models.dart';
import 'package:farm_manager/models/fuels_model.dart';
import 'package:farm_manager/models/harvesting_model.dart';
import 'package:farm_manager/models/incomes_models.dart';
import 'package:farm_manager/models/machineries_model.dart';
import 'package:farm_manager/models/planting_model.dart';
import 'package:farm_manager/models/seeds_model.dart';
import 'package:farm_manager/models/staffs_model.dart';
import 'package:farm_manager/models/tillage_model.dart';
import 'package:farm_manager/models/users_models.dart';
import 'package:intl/intl.dart';

class DatabaseService {
  DateTime now = new DateTime.now();

  // Collection reference

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');
  final CollectionReference staffCollection =
      FirebaseFirestore.instance.collection('staff');
  final CollectionReference customerCollection =
      FirebaseFirestore.instance.collection('customer');
  final CollectionReference incomeCollection =
      FirebaseFirestore.instance.collection('income');
  final CollectionReference expenseCollection =
      FirebaseFirestore.instance.collection('expense');
  final CollectionReference machineCollection =
      FirebaseFirestore.instance.collection('machine');
  final CollectionReference fuelCollection =
      FirebaseFirestore.instance.collection('fuel');
  final CollectionReference chemicalCollection =
      FirebaseFirestore.instance.collection('chemical');
  final CollectionReference tillageCollection =
      FirebaseFirestore.instance.collection('tillage');
  final CollectionReference seedCollection =
      FirebaseFirestore.instance.collection('seed');
  final CollectionReference plantingCollection =
      FirebaseFirestore.instance.collection('planting');
  final CollectionReference harvestCollection =
      FirebaseFirestore.instance.collection('harvest');

  Future<void> addUser(User user) {
    // Call the user's CollectionReference to add a new user

    String _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    return userCollection.add({
      "username": user.getUsername,
      "password": user.getPassword,
      "designation": user.getDesignation,
      "date": _date
    }).then((value) {
      print("User Added");
    }).catchError((error) {
      print("Failed to add user: $error");
      return null;
    });
  }

  Future<void> addStaff(Staff staff) {
    // Call the user's CollectionReference to add a new user

    String _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    return staffCollection.add({
      "firstname": staff.getFirstname,
      "lastname": staff.getLastname,
      "username": staff.getUsername,
      "designation": staff.getDesignation,
      "id card no": staff.getIdCardNo,
      "home address": staff.getHomeAddress,
      "city": staff.getCity,
      "email": staff.getEmail,
      "tel no": staff.getTelNo,
      "date of employment": _date
    }).then((value) {
      print("Staff Added");
    }).catchError((error) {
      print("Failed to add staff: $error");
      return null;
    });
  }

  Future<void> addCustomer(Customer customer) {
    // Call the user's CollectionReference to add a new user

    String _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    return customerCollection.add({
      "name": customer.getName,
      "mode of transaction": customer.getModeOfTransaction,
      "address": customer.getAddress,
      "email": customer.getEmail,
      "tel no": customer.getTelNo,
      "date recorded": _date
    }).then((value) {
      print("Customer Added");
    }).catchError((error) {
      print("Failed to add customer: $error");
      return null;
    });
  }

  Future<void> addIncome(Income income) {
    // Call the user's CollectionReference to add a new user

    String _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    return incomeCollection.add({
      "product type": income.getProductType,
      "waybill no": income.getWaybillNo,
      "customer id": income.getCustomerID,
      "payment mode": income.getPaymentMode,
      "qty sold": income.getQtySold,
      "unit": income.getUnit,
      "rate": income.getRate,
      "amount sold": income.getAmountSold,
      "date recorded": _date
    }).then((value) {
      print("Income Added");
    }).catchError((error) {
      print("Failed to add income: $error");
      return null;
    });
  }

  Future<void> addExpense(Expenses expenses) {
    // Call the user's CollectionReference to add a new user

    String _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    return expenseCollection.add({
      "product type": expenses.getProductType,
      "waybill no": expenses.getWaybillNo,
      "customer id": expenses.getCustomerID,
      "payment mode": expenses.getPaymentMode,
      "qty recieved": expenses.getQtyRecieved,
      "unit": expenses.getUnit,
      "rate": expenses.getRate,
      "amount sold": expenses.getAmountRecieved,
      "date recorded": _date
    }).then((value) {
      print("Expense Added");
    }).catchError((error) {
      print("Failed to add expense: $error");
      return null;
    });
  }

  Future<void> addMachine(Machinery machine) {
    // Call the user's CollectionReference to add a new user

    String _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    return machineCollection.add({
      "type": machine.getType,
      "id card no": machine.getIdCardNo,
      "date recorded": _date
    }).then((value) {
      print("Machine Added");
    }).catchError((error) {
      print("Failed to add machine: $error");
      return null;
    });
  }

  Future<void> addFuel(Fuel fuel) {
    // Call the user's CollectionReference to add a new user

    String _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    return fuelCollection.add({
      "type": fuel.getType,
      "id card no": fuel.getIdCardNo,
      "machine id": fuel.getMachineId,
      "date recorded": _date
    }).then((value) {
      print("Fuel Added");
    }).catchError((error) {
      print("Failed to add Fuel: $error");
      return null;
    });
  }

  Future<void> addSeed(Seed seed) {
    // Call the user's CollectionReference to add a new user

    String _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    return seedCollection.add({
      "type": seed.getType,
      "id card no": seed.getIdCardNo,
      "qty done": seed.getQty,
      "unit": seed.getUnit,
      "qty remaining": seed.getQtyRemaining,
      "acreage done": seed.getAcreage,
      "date recorded": _date
    }).then((value) {
      print("Seed Added");
    }).catchError((error) {
      print("Failed to add Seed: $error");
      return null;
    });
  }

  Future<void> addTillage(Tillage tillage) {
    // Call the user's CollectionReference to add a new user

    String _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    return tillageCollection.add({
      "type": tillage.getType,
      "id card no": tillage.getIdCardNo,
      "machine id": tillage.getMachineId,
      "acreage done": tillage.getAcreage,
      "date recorded": _date
    }).then((value) {
      print("Tillage Added");
    }).catchError((error) {
      print("Failed to add Tillage: $error");
      return null;
    });
  }

  Future<void> addChemical(Chemical chemical) {
    // Call the user's CollectionReference to add a new user

    String _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    return chemicalCollection.add({
      "type": chemical.getType,
      "id card no": chemical.getIdCardNo,
      "machine id": chemical.getMachineId,
      "acreage done": chemical.getAcreage,
      "date recorded": _date
    }).then((value) {
      print("Chemical Added");
    }).catchError((error) {
      print("Failed to add Chemical: $error");
      return null;
    });
  }

  Future<void> addPlanting(Planting planting) {
    // Call the user's CollectionReference to add a new user

    String _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    return plantingCollection.add({
      "type": planting.getType,
      "id card no": planting.getIdCardNo,
      "machine id": planting.getMachineId,
      "seed id": planting.getSeedId,
      "qty": planting.getQty,
      "unit": planting.getUnit,
      "acreage done": planting.getAcreage,
      "date recorded": _date
    }).then((value) {
      print("Planting Added");
    }).catchError((error) {
      print("Failed to add Planting: $error");
      return null;
    });
  }

  Future<void> addHarvest(Harvesting harvest) {
    // Call the user's CollectionReference to add a new user

    String _date = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    return harvestCollection.add({
      "type": harvest.getType,
      "id card no": harvest.getIdCardNo,
      "machine id": harvest.getMachineId,
      "seed id": harvest.getSeedId,
      "qty": harvest.getQty,
      "unit": harvest.getUnit,
      "acreage done": harvest.getAcreage,
      "date recorded": _date
    }).then((value) {
      print("Harvest Added");
    }).catchError((error) {
      print("Failed to add Harvest: $error");
      return null;
    });
  }
}
