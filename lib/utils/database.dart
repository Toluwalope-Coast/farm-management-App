import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_manager/models/users_models.dart';
import 'package:intl/intl.dart';

class DatabaseService {
  DateTime now = new DateTime.now();

  // Collection reference

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

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
}
