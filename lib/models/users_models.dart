import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String username;
  String password;
  String designation;
  Timestamp date;

  // Two constructor for the models (with the id and without id)

  User({this.username, this.password, this.designation, this.date});
  User.withId({this.id, this.username, this.password, this.designation});

  //  the getters

  String get getId => id;
  String get getUsername => username;
  String get getPassword => password;
  String get getDesignation => designation;

  // the setters

  set setUsername(String newUsername) {
    if (newUsername.length <= 255 && newUsername.isNotEmpty) {
      this.username = newUsername;
    }
  }

  set setPassword(String newPassword) {
    if (newPassword.length <= 255 && newPassword.isNotEmpty) {
      this.password = newPassword;
    }
  }

  set setDesignation(String newDesignation) {
    if (newDesignation.length <= 255 && newDesignation.isNotEmpty) {
      this.designation = newDesignation;
    }
  }

  set setDate(Timestamp newDate) {
    if (date != null) {
      this.date = newDate;
    }
  }

  // Convert User Object to Map Object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['username'] = username;
    map['password'] = password;
    map['designation'] = designation;
    return map;
  }

//   // Firestore data converter
// var cityConverter = {
//     toFirestore: function(city) {
//         return {
//             name: city.name,
//             state: city.state,
//             country: city.country
//             };
//     },
//     fromFirestore: function(snapshot, options){
//         const data = snapshot.data(options);
//         return new City(data.name, data.state, data.country);
//     }
// }

  // Extract a User Object from a map Object

  User.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.username = map['username'];
    this.password = map['password'];
    this.designation = map['designation'];
  }
}
