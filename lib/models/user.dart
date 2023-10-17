import 'dart:convert';

import 'package:salon/models/role.dart';

class User {
  String? username, firstName, lastName;
  List<int>? useCases;
  User({
    this.username,
    this.firstName = "Defaultfirstname",
    this.lastName = "Defaultlastname",
    this.useCases = const [],
  });
  static User? userFromJson(Map<String, dynamic> json) {
    try {
      List<dynamic>list=jsonDecode(json["UseCases"]);
      // for(var i in list)print(i.runtimeType);
      User user = User(
        username: json["Username"],
        useCases: list.map((e) => int.parse(e.toString())).toList(),
      );
      return user;
    } catch (Exception) {
      print("error reading json");
      return null;
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return """
      {
        'username':$username,
      }
    """;
  }
}
