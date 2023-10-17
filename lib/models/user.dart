import 'dart:convert';

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
      List<dynamic> list = jsonDecode(json["UseCases"]);
      User user = User(
        username: json["Username"],
        firstName: json["Firstname"]??"Defaultfirstname",
        lastName: json["Lastname"]??"Defaultlastname",
        useCases: list.map((e) => int.parse(e.toString())).toList(),
      );
      return user;
    } catch (Exception) {
      print("[ERROR] loading user form json: ${jsonEncode(json)}");
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
