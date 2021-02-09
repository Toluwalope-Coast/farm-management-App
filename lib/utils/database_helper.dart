import 'dart:async';
import 'dart:io';
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
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper
      _databaseHelper; // singleton to ensure our databse is created only once

  static Database _database; //database object

  // Time to define all the table names and column names of the database
  String usersTable = "users";
  String columnUsersId = "id";
  String columnUsersUsername = "username";
  String columnUsersPassword = "password";
  String columnUsersDesignation = "designation";

  String incomesTable = "income";
  String columnIncomesId = "id";
  String columnIncomesProductType = "product_type";
  String columnIncomesWaybillNo = "waybill_no";
  String columnIncomesCustomerID = "customer_id";
  String columnIncomesPaymentMode = "payment_mode";
  String columnIncomesQuantitySold = "qty_sold";
  String columnIncomesUnit = "unit";
  String columnIncomesRate = "rate";
  String columnIncomesAmount = "amount_sold";
  String columnIncomesDate = "date";

  String expenesTable = "expense";
  String columnExpensesId = "id";
  String columnExpensesProductType = "product_type";
  String columnExpensesWaybillNo = "waybill_no";
  String columnExpensesCustomerID = "customer_id";
  String columnExpensesPaymentMode = "payment_mode";
  String columnExpensesQuantityRecieved = "qty_recieved";
  String columnExpensesUnit = "unit";
  String columnExpensesRate = "rate";
  String columnExpensesAmount = "amount_recieved";
  String columnExpensesDate = "date";

  String staffTable = "staffs";
  String columnStaffId = "id";
  String columnStaffFirstname = "firstname";
  String columnStaffLastname = "lastname";
  String columnStaffUsername = "username";
  String columnStaffDesignation = "designation";
  String columnStaffIDCardNo = "id_card_no";
  String columnStaffEmail = "email";
  String columnStaffAddress = "home_address";
  String columnStaffCity = "city";
  String columnStaffTelNo = "tel_no";
  String columnStaffEmploymentDate = "employment_date";

  String customerTable = "customer";
  String columnCustomerId = "id";
  String columnCustomerName = "name";
  String columnCustomerEmail = "email";
  String columnCustomerAddress = "address";
  String columnCustomerTelNo = "tel_no";
  String columnCustomerPaymentMode = "mode_of_transaction";
  String columnCustomerDate = "date";

  String machinesTable = "machines";
  String columnMachinesId = "id";
  String columnMachinesType = "type";
  String columnMachinesIDCardNo = "id_card_no";
  String columnMachinesDate = "date";

  String fuelTable = "fuel";
  String columnFuelId = "id";
  String columnFuelType = "type";
  String columnFuelIDCardNo = "id_card_no";
  String columnFuelMachineID = "machine_id";
  String columnFuelDate = "date";

  String seedTable = "seed";
  String columnSeedId = "id";
  String columnSeedType = "type";
  String columnSeedIDCardNo = "id_card_no";
  String columnSeedAcreage = "acreage";
  String columnSeedQty = "qty";
  String columnSeedUnit = "unit";
  String columnSeedQtyRemaining = "qty_remaining";
  String columnSeedDate = "date";

  String chemicalTable = "chemical";
  String columnChemicalId = "id";
  String columnChemicalType = "type";
  String columnChemicalIDCardNo = "id_card_no";
  String columnChemicalMachineID = "machine_id";
  String columnChemicalAcreage = "acreage";
  String columnChemicalDate = "date";

  String tillageTable = "tillage";
  String columnTillageId = "id";
  String columnTillageType = "type";
  String columnTillageIDCardNo = "id_card_no";
  String columnTillageMachineID = "machine_id";
  String columnTillageAcreage = "acreage";
  String columnTillageDate = "date";

  String harvestTable = "harvest";
  String columnHarvestId = "id";
  String columnHarvestType = "type";
  String columnHarvestIDCardNo = "id_card_no";
  String columnHarvestMachineID = "machine_id";
  String columnHarvestSeedsID = "seeds_id";
  String columnHarvestUnit = "unit";
  String columnHarvestQty = "qty";
  String columnHarvestTotalQtyStock = "total_qty_stock";
  String columnHarvestAcreage = "acreage";
  String columnHarvestDate = "date";

  String plantingTable = "planting";
  String columnPlantingId = "id";
  String columnPlantingType = "type";
  String columnPlantingIDCardNo = "id_card_no";
  String columnPlantingMachineID = "machine_id";
  String columnPlantingSeedsID = "seeds_id";
  String columnPlantingQty = "qty";
  String columnPlantingUnit = "unit";
  String columnPlantingAcreage = "acreage";
  String columnPlantingDate = "date";

  // Database and column names lists closes

  DatabaseHelper._createInstance(); //Named constructure to create instance of a databasehelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }

    return _databaseHelper;
  }
  Future _createDb(Database db, int newVersion) async {
    await db.execute("""
            CREATE TABLE $usersTable (
              $columnUsersId INTEGER PRIMARY KEY AUTOINCREMENT,
              $columnUsersUsername TEXT NOT NULL UNIQUE,
              $columnUsersPassword TEXT NOT NULL,
              $columnUsersDesignation TEXT NOT NULL
            )""");

    await db.execute("""
            CREATE TABLE $incomesTable (
              $columnIncomesId INTEGER PRIMARY KEY AUTOINCREMENT,
              $columnIncomesProductType TEXT NOT NULL,
              $columnIncomesWaybillNo TEXT NOT NULL,
              $columnIncomesCustomerID INTEGER NOT NULL,
              $columnIncomesPaymentMode TEXT NOT NULL,
              $columnIncomesQuantitySold REAL NOT NULL,
              $columnIncomesUnit TEXT NOT NULL,
              $columnIncomesRate REAL NOT NULL,
              $columnIncomesAmount REAL NOT NULL,
              $columnIncomesDate Text NULL,
              FOREIGN KEY ($columnIncomesCustomerID) REFERENCES $customerTable ($columnCustomerId) 
                ON DELETE NO ACTION ON UPDATE NO ACTION

            )""");

    await db.execute("""
            CREATE TABLE $expenesTable (
              $columnExpensesId INTEGER PRIMARY KEY AUTOINCREMENT,
              $columnExpensesProductType TEXT NOT NULL,
              $columnExpensesWaybillNo TEXT NOT NULL,
              $columnExpensesCustomerID INTEGER NOT NULL,
              $columnExpensesPaymentMode TEXT NOT NULL,
              $columnExpensesQuantityRecieved REAL NOT NULL,
              $columnExpensesUnit TEXT NOT NULL,
              $columnExpensesRate REAL NOT NULL,
              $columnExpensesAmount REAL NOT NULL,
              $columnExpensesDate Text NULL,
              FOREIGN KEY ($columnExpensesId) REFERENCES $customerTable ($columnCustomerId) 
                ON DELETE NO ACTION ON UPDATE NO ACTION

            )""");

    await db.execute("""
            CREATE TABLE $staffTable (
              $columnStaffId INTEGER PRIMARY KEY AUTOINCREMENT,
              $columnStaffFirstname TEXT NOT NULL,
              $columnStaffLastname TEXT NOT NULL,
              $columnStaffUsername TEXT NOT NULL UNIQUE,
              $columnStaffDesignation TEXT NOT NULL,
              $columnStaffIDCardNo TEXT NOT NULL UNIQUE,
              $columnStaffEmail TEXT NOT NULL UNIQUE,
              $columnStaffAddress TEXT NOT NULL,
              $columnStaffCity TEXT NOT NULL,
              $columnStaffTelNo TEXT NOT NULL,
              $columnStaffEmploymentDate Text NULL)""");

    await db.execute("""
            CREATE TABLE $customerTable (
              $columnCustomerId INTEGER PRIMARY KEY AUTOINCREMENT,
              $columnCustomerName TEXT NOT NULL,
              $columnCustomerEmail TEXT NOT NULL,
              $columnCustomerAddress TEXT NOT NULL,
              $columnCustomerTelNo TEXT NOT NULL,
              $columnCustomerPaymentMode TEXT NOT NULL,
              $columnCustomerDate Text NULL)""");

    await db.execute("""
            CREATE TABLE $machinesTable (
              $columnMachinesId INTEGER PRIMARY KEY AUTOINCREMENT,
              $columnMachinesType TEXT NOT NULL,
              $columnMachinesIDCardNo TEXT NOT NULL,
              $columnMachinesDate Text NULL,
              FOREIGN KEY ($columnMachinesIDCardNo) REFERENCES $staffTable ($columnStaffIDCardNo) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
            )""");

    await db.execute("""
            CREATE TABLE $fuelTable (
              $columnFuelId INTEGER PRIMARY KEY AUTOINCREMENT,
              $columnFuelType TEXT NOT NULL,
              $columnFuelIDCardNo TEXT NOT NULL,
              $columnFuelMachineID INTEGER NOT NULL,
              $columnFuelDate Text NULL,
              FOREIGN KEY ($columnFuelIDCardNo) REFERENCES $staffTable ($columnStaffIDCardNo) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
            )""");

    await db.execute("""
            CREATE TABLE $seedTable (
              $columnSeedId INTEGER PRIMARY KEY AUTOINCREMENT,
              $columnSeedType TEXT NOT NULL,
              $columnSeedIDCardNo TEXT NOT NULL,
              $columnSeedAcreage REAL NOT NULL,
              $columnSeedQty REAL NOT NULL,
              $columnSeedUnit TEXT NOT NULL,
              $columnSeedQtyRemaining REAL NOT NULL,
              $columnSeedDate Text NULL)""");

    await db.execute("""
            CREATE TABLE $chemicalTable (
              $columnChemicalId INTEGER PRIMARY KEY AUTOINCREMENT,
              $columnChemicalType TEXT NOT NULL,
              $columnChemicalIDCardNo TEXT NOT NULL,
              $columnChemicalMachineID INTEGER NOT NULL,
              $columnChemicalAcreage INTEGER NOT NULL,
              $columnChemicalDate Text NULL,
              FOREIGN KEY ($columnChemicalIDCardNo) REFERENCES $staffTable ($columnStaffIDCardNo) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
              FOREIGN KEY ($columnChemicalMachineID) REFERENCES $machinesTable ($columnMachinesId) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
            )""");

    await db.execute("""
            CREATE TABLE $tillageTable (
              $columnTillageId INTEGER PRIMARY KEY AUTOINCREMENT,
              $columnTillageType TEXT NOT NULL,
              $columnTillageIDCardNo TEXT NOT NULL,
              $columnTillageAcreage REAL NOT NULL,
              $columnTillageMachineID INTEGER NOT NULL,
              $columnTillageDate Text NULL,
              FOREIGN KEY ($columnTillageIDCardNo) REFERENCES $staffTable ($columnStaffIDCardNo) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
              FOREIGN KEY ($columnTillageMachineID) REFERENCES $machinesTable ($columnMachinesId) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
            )""");

    await db.execute("""
            CREATE TABLE $harvestTable (
              $columnHarvestId INTEGER PRIMARY KEY AUTOINCREMENT,
              $columnHarvestType TEXT NOT NULL,
              $columnHarvestIDCardNo TEXT NOT NULL,
              $columnHarvestMachineID INTEGER NOT NULL,
              $columnHarvestSeedsID INTEGER NOT NULL,
              $columnHarvestAcreage INTEGER NULL,
              $columnHarvestTotalQtyStock INTEGER NULL,
              $columnHarvestQty REAL NOT NULL,
               $columnHarvestUnit TEXT NOT NULL,
              $columnHarvestDate Text NULL,
              FOREIGN KEY ($columnHarvestIDCardNo) REFERENCES $staffTable ($columnStaffIDCardNo) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
              FOREIGN KEY ($columnHarvestMachineID) REFERENCES $machinesTable ($columnMachinesId) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
              FOREIGN KEY ($columnHarvestSeedsID) REFERENCES $seedTable ($columnSeedId) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
            )""");

    await db.execute("""
            CREATE TABLE $plantingTable (
              $columnPlantingId INTEGER PRIMARY KEY AUTOINCREMENT,
              $columnPlantingType TEXT NOT NULL,
              $columnPlantingIDCardNo TEXT NOT NULL,
              $columnPlantingMachineID INTEGER NOT NULL,
              $columnPlantingSeedsID INTEGER NOT NULL,
              $columnPlantingAcreage INTEGER NULL,
              $columnPlantingUnit TEXT NOT NULL,
              $columnPlantingQty REAL NOT NULL,
              $columnPlantingDate Text NULL,
              FOREIGN KEY ($columnPlantingIDCardNo) REFERENCES $staffTable ($columnStaffIDCardNo) 
                ON DELETE NO ACTION ON UPDATE NO ACTION,
              FOREIGN KEY ($columnPlantingMachineID) REFERENCES $machinesTable ($columnMachinesId) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
              FOREIGN KEY ($columnPlantingSeedsID) REFERENCES $seedTable ($columnSeedId) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
            )""");
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both android and ios

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'farm.db';

    // open database at a given path

    var farmDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return farmDatabase;
  }

// The CRUD operations functions

//  *********** USERS   **************

//  The Fetch Operation: Get all rows objects from a table in the database

  Future<List<Map<String, dynamic>>> getUsersMapList() async {
    Database db = await this.database;

    var result = await db.query(usersTable, orderBy: '$columnUsersId ASC');
    return result;
  }

//  Insert Operations: insert a new row into a table in the database

  Future<int> insertUser(User user) async {
    Database db = await this.database;

    var result = await db.insert(usersTable, user.toMap());
    return result;
  }

// Update Operations: Update aa existing row from a table and save it in the database

  Future<int> updateUser(User user) async {
    Database db = await this.database;

    var result = await db.update(usersTable, user.toMap(),
        where: '$columnUsersId = ?', whereArgs: [user.id]);
    return result;
  }

// Delete Operation: Delete a row object from a table in the database

  Future<int> deleteUser(int index) async {
    Database db = await this.database;

    int result = await db
        .delete("$usersTable", where: "$columnUsersId = ?", whereArgs: [index]);
    //  = await db
    //     .rawDelete('DELETE FROM $usersTable WHERE $columnUsersId = $index');
    // .delete(usersTable, where: '$columnUsersId = ?', whereArgs: [index]);
    return result;
  }

// Get number of row object from a table in the databse

  Future<int> getUserCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $usersTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the "map list" and convert it to User list
  Future<List<User>> getUserList() async {
    var userMapList = await getUsersMapList();
    int count = userMapList.length;
    List<User> userList = <User>[];
    for (var i = 0; i < count; i++) {
      userList.add(User.fromMapObject(userMapList[i]));
    }

    return userList;
  }

  //  *****************  USERS CLOSES  ****************

//  *********** STAFFS   **************

//  The Fetch Operation: Get all rows objects from a table in the database

  Future<List<Map<String, dynamic>>> getStaffsMapList() async {
    Database db = await this.database;

    var result = await db.query(staffTable, orderBy: '$columnStaffId ASC');
    return result;
  }

//  Insert Operations: insert a new row into a table in the database

  Future<int> insertStaff(Staff staff) async {
    Database db = await this.database;

    var result = await db.insert(staffTable, staff.toMap());
    return result;
  }

// Update Operations: Update aa existing row from a table and save it in the database

  Future<int> updateStaff(Staff staff) async {
    Database db = await this.database;

    var result = await db.update(staffTable, staff.toMap(),
        where: '$columnStaffId = ?', whereArgs: [staff.getId]);
    return result;
  }

// Delete Operation: Delete a row object from a table in the database

  Future<int> deleteStaff(int index) async {
    Database db = await this.database;

    int result = await db
        .rawDelete('DELETE FROM $staffTable WHERE $columnStaffId = $index');
    return result;
  }

// Get number of row object from a table in the databse

  Future<int> getStaffCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $staffTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the "map list" and convert it to User list
  Future<List<Staff>> getStaffList() async {
    var staffMapList = await getStaffsMapList();
    int count = staffMapList.length;
    List<Staff> staffList = <Staff>[];
    for (var i = 0; i < count; i++) {
      staffList.add(Staff.fromMapObject(staffMapList[i]));
    }

    return staffList;
  }

  //  *****************  STAFFS CLOSES  ****************

//  *********** CUSTOMERS   **************

//  The Fetch Operation: Get all rows objects from a table in the database

  Future<List<Map<String, dynamic>>> getCustomerMapList() async {
    Database db = await this.database;

    var result =
        await db.query(customerTable, orderBy: '$columnCustomerId ASC');
    return result;
  }

//  Insert Operations: insert a new row into a table in the database

  Future<int> insertCustomer(Customer customer) async {
    Database db = await this.database;

    var result = await db.insert(customerTable, customer.toMap());
    return result;
  }

// Update Operations: Update aa existing row from a table and save it in the database

  Future<int> updateCustomer(Customer customer) async {
    Database db = await this.database;

    var result = await db.update(customerTable, customer.toMap(),
        where: '$columnCustomerId = ?', whereArgs: [customer.getId]);
    return result;
  }

// Delete Operation: Delete a row object from a table in the database

  Future<int> deleteCustomer(int index) async {
    Database db = await this.database;

    int result = await db.rawDelete(
        'DELETE FROM $customerTable WHERE $columnCustomerId = $index');
    return result;
  }

// Get number of row object from a table in the databse

  Future<int> getCustomerCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $customerTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the "map list" and convert it to User list
  Future<List<Customer>> getCustomerList() async {
    var customerMapList = await getCustomerMapList();
    int count = customerMapList.length;
    List<Customer> customerList = <Customer>[];
    for (var i = 0; i < count; i++) {
      customerList.add(Customer.fromMapObject(customerMapList[i]));
    }

    return customerList;
  }

  //  *****************  CUSTOMER CLOSES  ****************

//  *********** INCOMES   **************

//  The Fetch Operation: Get all rows objects from a table in the database

  Future<List<Map<String, dynamic>>> getIncomesMapList() async {
    Database db = await this.database;

    var result = await db.query(incomesTable, orderBy: '$columnIncomesId ASC');
    return result;
  }

//  Insert Operations: insert a new row into a table in the database

  Future<int> insertIncomes(Income income) async {
    Database db = await this.database;

    var result = await db.insert(incomesTable, income.toMap());
    return result;
  }

// Update Operations: Update aa existing row from a table and save it in the database

  Future<int> updateIncome(Income income) async {
    Database db = await this.database;

    var result = await db.update(incomesTable, income.toMap(),
        where: '$columnCustomerId = ?', whereArgs: [income.id]);
    return result;
  }

// Delete Operation: Delete a row object from a table in the database

  Future<int> deleteIncome(int index) async {
    Database db = await this.database;

    int result = await db
        .rawDelete('DELETE FROM $incomesTable WHERE $columnIncomesId = $index');
    return result;
  }

// Get number of row object from a table in the databse

  Future<int> getIncomeCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $incomesTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the "map list" and convert it to User list
  Future<List<Income>> getIncomeList() async {
    var incomeMapList = await getIncomesMapList();
    int count = incomeMapList.length;
    List<Income> incomeList = <Income>[];
    for (var i = 0; i < count; i++) {
      incomeList.add(Income.fromMapObject(incomeMapList[i]));
    }

    return incomeList;
  }

  //  *****************  INCOMES CLOSES  ****************

//  *********** EXPENSES   **************

//  The Fetch Operation: Get all rows objects from a table in the database

  Future<List<Map<String, dynamic>>> getExpensesMapList() async {
    Database db = await this.database;

    var result = await db.query(expenesTable, orderBy: '$columnExpensesId ASC');
    return result;
  }

//  Insert Operations: insert a new row into a table in the database

  Future<int> insertExpenses(Expenses expenses) async {
    Database db = await this.database;

    var result = await db.insert(expenesTable, expenses.toMap());
    return result;
  }

// Update Operations: Update aa existing row from a table and save it in the database

  Future<int> updateExpenses(Expenses expenses) async {
    Database db = await this.database;

    var result = await db.update(expenesTable, expenses.toMap(),
        where: '$columnExpensesId = ?', whereArgs: [expenses.id]);
    return result;
  }

// Delete Operation: Delete a row object from a table in the database

  Future<int> deleteExpensese(int index) async {
    Database db = await this.database;

    int result = await db.rawDelete(
        'DELETE FROM $expenesTable WHERE $columnExpensesId = $index');
    return result;
  }

// Get number of row object from a table in the databse

  Future<int> getExpensesCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $expenesTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the "map list" and convert it to User list
  Future<List<Expenses>> getExpensesList() async {
    var expensesMapList = await getExpensesMapList();
    int count = expensesMapList.length;
    List<Expenses> expensesList = <Expenses>[];
    for (var i = 0; i < count; i++) {
      expensesList.add(Expenses.fromMapObject(expensesMapList[i]));
    }

    return expensesList;
  }

  //  *****************  EXPENSES CLOSES  ****************

//  *********** MACHINES   **************

//  The Fetch Operation: Get all rows objects from a table in the database

  Future<List<Map<String, dynamic>>> getMachinesMapList() async {
    Database db = await this.database;

    var result =
        await db.query(machinesTable, orderBy: '$columnMachinesId ASC');
    return result;
  }

//  Insert Operations: insert a new row into a table in the database

  Future<int> insertMachines(Machinery machinery) async {
    Database db = await this.database;

    var result = await db.insert(machinesTable, machinery.toMap());
    return result;
  }

// Update Operations: Update aa existing row from a table and save it in the database

  Future<int> updateMachines(Machinery machinery) async {
    Database db = await this.database;

    var result = await db.update(machinesTable, machinery.toMap(),
        where: '$columnMachinesId = ?', whereArgs: [machinery.getId]);
    return result;
  }

// Delete Operation: Delete a row object from a table in the database

  Future<int> deleteMachines(int index) async {
    Database db = await this.database;

    int result = await db.rawDelete(
        'DELETE FROM $machinesTable WHERE $columnMachinesId = $index');
    return result;
  }

// Get number of row object from a table in the databse

  Future<int> getMachinesCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $machinesTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the "map list" and convert it to User list
  Future<List<Machinery>> getMachineList() async {
    var machinesMapList = await getMachinesMapList();
    int count = machinesMapList.length;
    List<Machinery> machinesList = <Machinery>[];
    for (var i = 0; i < count; i++) {
      machinesList.add(Machinery.fromMapObject(machinesMapList[i]));
    }

    return machinesList;
  }

  //  *****************  MACHINES CLOSES  ****************

//  *********** SEED   **************

//  The Fetch Operation: Get all rows objects from a table in the database

  Future<List<Map<String, dynamic>>> getSeedMapList() async {
    Database db = await this.database;

    var result = await db.query(seedTable, orderBy: '$columnSeedId ASC');
    return result;
  }

//  Insert Operations: insert a new row into a table in the database

  Future<int> insertSeed(Seed seed) async {
    Database db = await this.database;

    var result = await db.insert(seedTable, seed.toMap());
    return result;
  }

// Update Operations: Update aa existing row from a table and save it in the database

  Future<int> updateSeed(Seed seed) async {
    Database db = await this.database;

    var result = await db.update(seedTable, seed.toMap(),
        where: '$columnSeedId = ?', whereArgs: [seed.getId]);
    return result;
  }

// Delete Operation: Delete a row object from a table in the database

  Future<int> deleteSeed(int index) async {
    Database db = await this.database;

    int result = await db
        .rawDelete('DELETE FROM $seedTable WHERE $columnSeedId = $index');
    return result;
  }

// Get number of row object from a table in the databse

  Future<int> getSeedCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $seedTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the "map list" and convert it to User list
  Future<List<Seed>> getSeedList() async {
    var seedMapList = await getSeedMapList();
    int count = seedMapList.length;
    List<Seed> seedList = <Seed>[];
    for (var i = 0; i < count; i++) {
      seedList.add(Seed.fromMapObject(seedMapList[i]));
    }

    return seedList;
  }

  //  *****************  SEED CLOSES  ****************

//  *********** CHEMICALS   **************

//  The Fetch Operation: Get all rows objects from a table in the database

  Future<List<Map<String, dynamic>>> getChemicalMapList() async {
    Database db = await this.database;

    var result =
        await db.query(chemicalTable, orderBy: '$columnChemicalId ASC');
    return result;
  }

//  Insert Operations: insert a new row into a table in the database

  Future<int> insertChemical(Chemical chemical) async {
    Database db = await this.database;

    var result = await db.insert(chemicalTable, chemical.toMap());
    return result;
  }

// Update Operations: Update aa existing row from a table and save it in the database

  Future<int> updateChemical(Chemical chemical) async {
    Database db = await this.database;

    var result = await db.update(chemicalTable, chemical.toMap(),
        where: '$columnChemicalId = ?', whereArgs: [chemical.getId]);
    return result;
  }

// Delete Operation: Delete a row object from a table in the database

  Future<int> deleteChemical(int index) async {
    Database db = await this.database;

    int result = await db.rawDelete(
        'DELETE FROM $chemicalTable WHERE $columnChemicalId = $index');
    return result;
  }

// Get number of row object from a table in the databse

  Future<int> getChemicalCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $chemicalTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the "map list" and convert it to User list
  Future<List<Chemical>> getChemicalList() async {
    var chemicalMapList = await getChemicalMapList();
    int count = chemicalMapList.length;
    List<Chemical> chemicalList = <Chemical>[];
    for (var i = 0; i < count; i++) {
      chemicalList.add(Chemical.fromMapObject(chemicalMapList[i]));
    }

    return chemicalList;
  }

  //  *****************  CHEMICAL CLOSES  ****************

//  *********** TILLAGE   **************

//  The Fetch Operation: Get all rows objects from a table in the database

  Future<List<Map<String, dynamic>>> getTillageMapList() async {
    Database db = await this.database;

    var result = await db.query(tillageTable, orderBy: '$columnTillageId ASC');
    return result;
  }

//  Insert Operations: insert a new row into a table in the database

  Future<int> insertTillage(Tillage tillage) async {
    Database db = await this.database;

    var result = await db.insert(tillageTable, tillage.toMap());
    return result;
  }

// Update Operations: Update aa existing row from a table and save it in the database

  Future<int> updateTillage(Tillage tillage) async {
    Database db = await this.database;

    var result = await db.update(tillageTable, tillage.toMap(),
        where: '$columnTillageId = ?', whereArgs: [tillage.getId]);
    return result;
  }

// Delete Operation: Delete a row object from a table in the database

  Future<int> deleteTillage(int index) async {
    Database db = await this.database;

    int result = await db
        .rawDelete('DELETE FROM $tillageTable WHERE $columnTillageId = $index');
    return result;
  }

// Get number of row object from a table in the databse

  Future<int> getTillageCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $tillageTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the "map list" and convert it to User list
  Future<List<Tillage>> getTillageList() async {
    var tillageMapList = await getTillageMapList();
    int count = tillageMapList.length;
    List<Tillage> tillageList = <Tillage>[];
    for (var i = 0; i < count; i++) {
      tillageList.add(Tillage.fromMapObject(tillageMapList[i]));
    }

    return tillageList;
  }

  //  *****************  TILLAGE CLOSES  ****************

//  *********** PLANTING   **************

//  The Fetch Operation: Get all rows objects from a table in the database

  Future<List<Map<String, dynamic>>> getPlantingMapList() async {
    Database db = await this.database;

    var result =
        await db.query(plantingTable, orderBy: '$columnPlantingId ASC');
    return result;
  }

//  Insert Operations: insert a new row into a table in the database

  Future<int> insertPlanting(Planting planting) async {
    Database db = await this.database;

    var result = await db.insert(plantingTable, planting.toMap());
    return result;
  }

// Update Operations: Update aa existing row from a table and save it in the database

  Future<int> updatePlanting(Planting planting) async {
    Database db = await this.database;

    var result = await db.update(plantingTable, planting.toMap(),
        where: '$columnPlantingId = ?', whereArgs: [planting.getId]);
    return result;
  }

// Delete Operation: Delete a row object from a table in the database

  Future<int> deletePlanting(int index) async {
    Database db = await this.database;

    int result = await db.rawDelete(
        'DELETE FROM $plantingTable WHERE $columnPlantingId = $index');
    return result;
  }

// Get number of row object from a table in the databse

  Future<int> getPlantingCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $plantingTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the "map list" and convert it to User list
  Future<List<Planting>> getPlantingList() async {
    var plantingMapList = await getPlantingMapList();
    int count = plantingMapList.length;
    List<Planting> plantingList = <Planting>[];
    for (var i = 0; i < count; i++) {
      plantingList.add(Planting.fromMapObject(plantingMapList[i]));
    }

    return plantingList;
  }

  //  *****************  PLANTING CLOSES  ****************

//  *********** HARVESTING   **************

//  The Fetch Operation: Get all rows objects from a table in the database

  Future<List<Map<String, dynamic>>> getHarvestMapList() async {
    Database db = await this.database;

    var result = await db.query(harvestTable, orderBy: '$columnHarvestId ASC');
    return result;
  }

//  Insert Operations: insert a new row into a table in the database

  Future<int> insertHarvest(Harvesting harvesting) async {
    Database db = await this.database;

    var result = await db.insert(harvestTable, harvesting.toMap());
    return result;
  }

// Update Operations: Update aa existing row from a table and save it in the database

  Future<int> updateHarvesting(Harvesting harvesting) async {
    Database db = await this.database;

    var result = await db.update(harvestTable, harvesting.toMap(),
        where: '$columnHarvestId = ?', whereArgs: [harvesting.getId]);
    return result;
  }

// Delete Operation: Delete a row object from a table in the database

  Future<int> deleteHarvest(int index) async {
    Database db = await this.database;

    int result = await db
        .rawDelete('DELETE FROM $harvestTable WHERE $columnHarvestId = $index');
    return result;
  }

// Get number of row object from a table in the databse

  Future<int> getHarvestCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $harvestTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the "map list" and convert it to User list
  Future<List<Harvesting>> getHarvestList() async {
    var harvestMapList = await getHarvestMapList();
    int count = harvestMapList.length;
    List<Harvesting> harvestList = <Harvesting>[];
    for (var i = 0; i < count; i++) {
      harvestList.add(Harvesting.fromMapObject(harvestMapList[i]));
    }

    return harvestList;
  }

  //  *****************  HARVESTING CLOSES  ****************

//  *********** FUEL   **************

//  The Fetch Operation: Get all rows objects from a table in the database

  Future<List<Map<String, dynamic>>> getFuelMapList() async {
    Database db = await this.database;

    var result = await db.query(fuelTable, orderBy: '$columnFuelId ASC');
    return result;
  }

//  Insert Operations: insert a new row into a table in the database

  Future<int> insertFuel(Fuel fuel) async {
    Database db = await this.database;

    var result = await db.insert(fuelTable, fuel.toMap());
    return result;
  }

// Update Operations: Update aa existing row from a table and save it in the database

  Future<int> updateFuel(Fuel fuel) async {
    Database db = await this.database;

    var result = await db.update(fuelTable, fuel.toMap(),
        where: '$columnFuelId = ?', whereArgs: [fuel.getId]);
    return result;
  }

// Delete Operation: Delete a row object from a table in the database

  Future<int> deleteFuel(int index) async {
    Database db = await this.database;

    int result = await db
        .rawDelete('DELETE FROM $fuelTable WHERE $columnFuelId = $index');
    return result;
  }

// Get number of row object from a table in the databse

  Future<int> getFuelCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $fuelTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the "map list" and convert it to User list
  Future<List<Fuel>> getFuelList() async {
    var fuelMapList = await getFuelMapList();
    int count = fuelMapList.length;
    List<Fuel> fuelList = <Fuel>[];
    for (var i = 0; i < count; i++) {
      fuelList.add(Fuel.fromMapObject(fuelMapList[i]));
    }

    return fuelList;
  }

  //  *****************  FUEL CLOSES  ****************

// functions to  Returns every field in each table
//
  // Future<List> queryUsersDataTableKeys() async {
  //   Database db = await this.database;
  //   List<Map> result = await db.rawQuery('SELECT * FROM $usersTable');
  //   result.forEach((map) {
  //     var keys = map.keys;
  //     print('List of Keys: $keys');
  //     return keys.toList();
  //   });
  // }

  // Future<List> queryUsersDataTableValues() async {
  //   Database db = await this.database;
  //   List<Map> result = await db.rawQuery('SELECT * FROM $usersTable');
  //   result.forEach((map) {
  //     var values = map.values;
  //     print('List of Values: $values');
  //     return values.toList();
  //   });
  // }
} // Database helper Class
