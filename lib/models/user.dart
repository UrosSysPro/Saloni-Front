import 'dart:convert';

class User {
  String? username, firstName, lastName,jwtTokenString,id;
  List<int>? useCases;
  User({
    this.username,
    this.firstName = "Defaultfirstname",
    this.lastName = "Defaultlastname",
    this.useCases = const [],
    this.jwtTokenString,
    this.id
  });
  static User? userFromJson(Map<String, dynamic> json,String? jwtTokenString) {
    try {
      List<dynamic> list = jsonDecode(json["UseCases"]);
      User user = User(
        id: json["UserId"].toString(),
        username: json["Username"],
        firstName: json["Firstname"]??"Defaultfirstname",
        lastName: json["Lastname"]??"Defaultlastname",
        useCases: list.map((e) => int.parse(e.toString())).toList(),
        jwtTokenString: jwtTokenString
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
