import "dart:convert";

import 'package:flutter/material.dart';
import 'package:salon/models/appointment.dart';
import 'package:salon/models/reservation.dart';
import 'package:salon/models/salon.dart';
import "models/user.dart";
import "package:http/http.dart" as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppState extends ChangeNotifier {
  ThemeData themeData = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 253, 94, 108),
          brightness: Brightness.light,
          primary: const Color.fromARGB(255, 253, 94, 108),
          onPrimary: Colors.white,
          secondary: const Color.fromARGB(255, 254, 201, 72),
          onSecondary: Colors.black,
          tertiary: const Color.fromARGB(255, 253, 163, 85),
          onTertiary: Colors.white,
          background: const Color.fromARGB(255, 253, 245, 215),
          onBackground: Colors.black),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      ));

  FlutterSecureStorage storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  AppState() {
    loadingUser = true;
    storage.read(key: "user").then((value) {
      if (value != null) {
        String? jwtTokenString = jsonDecode(value)["token"];
        print(jwtTokenString);
        user = User.userFromJson(JwtDecoder.decode(value), jwtTokenString);
      }
      loadingUser = false;
      notifyListeners();
    });
  }

  bool debugServer = false;
  User? user;
  bool loadingUser = false;
  bool errorLogInInfo = false;
  bool errorSignInInfo = false;
  bool serverError = false;
  String api = "";

  // bool searching = false, searchError = false;
  // List<Salon> searchResults = [];

  Future<bool> signIn(String email, String username, String password) async {
    if (debugServer) {
      user = User(
          username: "Defaultusername",
          useCases: List<int>.generate(7, (index) => index));
      notifyListeners();
      return true;
    }
    bool success = false;
    loadingUser = true;
    notifyListeners();

    var body = jsonEncode({
      "UserName": username.trim(),
      "LastName": "Defaultlastname",
      "FirstName": "Defaultfirstname",
      "Password": password.trim()
    });

    var headers = {'content-type': 'application/json'};

    try {
      var response = await http.post(Uri.parse("http://$api/api/Register"),
          body: body, headers: headers);
      if (response.statusCode == 201) {
        success = await logIn(username, password);
      } else {
        print(
            "nije uspeo da napravi nalog ${response.statusCode} \n${response.body}");
      }
    } on Exception {
      print("nema interneta ili servera");
    }
    loadingUser = false;
    notifyListeners();
    return success;
  }

  Future<bool> logIn(String username, String password) async {
    if (debugServer) {
      user = User(
          username: "Defaultusername",
          useCases: List<int>.generate(7, (index) => index));
      notifyListeners();
      return true;
    }
    bool success = false;
    loadingUser = true;
    notifyListeners();

    var body =
        jsonEncode({'username': username.trim(), 'password': password.trim()});
    var headers = {'content-type': 'application/json'};

    try {
      var response = await http.post(Uri.parse("http://$api/api/Token"),
          body: body, headers: headers);
      if (response.statusCode == 200) {
        String? jwtTokenString = jsonDecode(response.body)["token"];
        user =
            User.userFromJson(JwtDecoder.decode(response.body), jwtTokenString);
        await storage.write(key: "user", value: response.body);
        success = true;
      } else {
        print("[ERROR] Wrong username of password");
      }
    } catch (e) {
      print("[ERROR] server connection");
    }

    loadingUser = false;
    notifyListeners();

    return success;
  }

  void logOut() {
    user = null;
    storage.write(key: "user", value: null);
    notifyListeners();
  }

  Future<List<Salon>> search2(String value) async {
    if (debugServer) {
      //vrati fake data
    }

    var headers = {"Authorization": "Bearer ${user?.jwtTokenString}"};
    try {
      var response = await http.get(
          Uri.parse("http://$api/api/Salon?Keyword=$value"),
          headers: headers);
      if (response.statusCode == 200) {
        return Salon.fromSearchResultJson(response.body);
      } else {
        print("[ERROR] AppState Search nema interneta ili server ne radi");
      }
    } catch (e) {
      print("[ERROR] AppState Search nema interneta ili server ne radi");
    }
    return [];
  }

  Future<List<Salon>> loadSalonsOnMap() async {
    if (debugServer) {
      //vrati fake data
    }

    var headers = {"Authorization": "Bearer ${user?.jwtTokenString}"};
    try {
      var response = await http.get(Uri.parse("http://$api/api/Salon?Keyword="),
          headers: headers);
      if (response.statusCode == 200) {
        // searchError = false;
        return Salon.fromSearchResultJson(response.body);
      } else {
        // searchError = true;
      }
      // print(response.body);
    } catch (e) {
      // searchError = true;
      print("[ERROR] AppState Search nema interneta ili server ne radi");
    }
    return [];
  }

  Future<List<Salon>> getFavorites() async {
    if (debugServer) {
      //vrati fake data
    }

    var headers = {"Authorization": "Bearer ${user?.jwtTokenString}"};
    try {
      var response = await http.get(
          Uri.parse("http://$api/api/Favorite?UserId=${user!.id}"),
          headers: headers);
      if (response.statusCode == 200) {
        return Salon.fromFavoriteResultJson(response.body);
      } else {
        print("[ERROR] get favorites ${response.statusCode}  ${response.body}");
      }
      // print(response.body);
    } catch (e) {
      // searchError = true;
      print("[ERROR] AppState Favorite nema interneta ili server ne radi");
    }
    return [];
  }

  Future<bool> addFavorite(String salonId) async {
    if (debugServer) {
      //vrati fake data
    }

    var headers = {
      "Authorization": "Bearer ${user?.jwtTokenString}",
      "Content-Type": "application/json"
    };
    var body = {"salonId": salonId, "userId": user!.id};
    try {
      var response = await http.post(Uri.parse("http://$api/api/Favorite"),
          headers: headers, body: jsonEncode(body));
      if (response.statusCode == 201) {
        print("added favorite");
        return true;
      } else {
        print(
            "[ERROR] adding favorite ${response.statusCode} ${response.body}");
        return false;
      }
    } catch (e) {
      print(
          "[ERROR] AppState addFavorite nema interneta ili server ne radi${jsonEncode(e)}");
    }
    return false;
  }

  Future<String> _findFavoriteId(String salonId) async {
    var headers = {"Authorization": "Bearer ${user?.jwtTokenString}"};
    try {
      var response = await http.get(
          Uri.parse("http://$api/api/Favorite?UserId=${user!.id}"),
          headers: headers);
      if (response.statusCode == 200) {
        // return Salon.fromFavoriteResultJson(response.body);
        var json = jsonDecode(response.body);
        for (var s in json["data"]) {
          if (s["salonId"] == int.parse(salonId)) {
            int id = s["id"];
            return "$id";
          }
        }
      } else {
        print(
            "[ERROR] finding favorite id ${response.statusCode}  ${response.body}");
      }
      // print(response.body);
    } catch (e) {
      // searchError = true;
      print("[ERROR] AppState finding favorite ${jsonEncode(e)}");
    }
    return "";
  }

  Future<bool> removeFavorite(String salonId) async {
    if (debugServer) {
      //vrati fake data
    }

    String favoriteId = await _findFavoriteId(salonId);
    print(favoriteId);

    var headers = {"Authorization": "Bearer ${user?.jwtTokenString}"};

    try {
      var response = await http.delete(
        Uri.parse("http://$api/api/Favorite/${favoriteId}"),
        headers: headers,
      );
      if (response.statusCode == 204) {
        print("removed favorite ${response.statusCode} ${response.body}");
        return true;
      } else {
        print(
            "[ERROR] removing favorite ${response.statusCode} ${response.body}");
        return false;
      }
    } catch (e) {
      print("[ERROR] AppState finding favorite ${jsonEncode(e)}");
    }
    return false;
  }

  Future<List<Salon>> getRecomended() async {
    if (debugServer) {
      //vrati fake data
    }
    var headers = {"Authorization": "Bearer ${user?.jwtTokenString}"};
    try {
      var response = await http.get(Uri.parse("http://$api/api/Salon?Keyword="),
          headers: headers);
      if (response.statusCode == 200) {
        return Salon.fromSearchResultJson(response.body);
      } else {
        return [];
      }
      // print(response.body);
    } catch (e) {
      // searchError = true;
      print("[ERROR] AppState Search nema interneta ili server ne radi");
    }
    return [];
  }

  Future<List<Salon>> getRecomendedForCategory(String category) async {
    return await search2("");
  }

  Future<Salon> getSalon(String salonId) async {
    if (debugServer) {
      //vrati fake data
    }

    var headers = {"Authorization": "Bearer ${user?.jwtTokenString}"};
    try {
      var response = await http.get(Uri.parse("http://$api/api/Salon/$salonId"),
          headers: headers);
      if (response.statusCode == 200) {
        return Salon.fromJson(response.body);
      } else {}
      // print(response.body);
    } catch (e) {
      print("[ERROR] AppState Search nema interneta ili server ne radi");
    }
    return Salon();
  }

  Future<bool> createAppointment(DateTime date) async {
    if (debugServer) {
      //vrati fake data
    }
  

    var headers = {
      "Authorization": "Bearer ${user?.jwtTokenString}",
      "Accept":"application/json",
      "Content-Type":"application/json"
    };
    var body = {
      "staffId": user?.id,
      "dateAndTime": date.toIso8601String()
    };
    print(headers);
    print(jsonEncode(body));
    print("http://$api/api/StaffAppointment");
    try {
      var response = await http.post(
        Uri.parse("http://$api/api/StaffAppointment"),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        print(
            "[ERROR] AppState createAppointment ${response.statusCode}  ${response.body}");
        return false;
      }
      // print(response.body);
    } catch (e) {
      print("[ERROR] AppState Search nema interneta ili server ne radi ${e}");
      return false;
    }
  }
  Future<List<Appointment>?> getAppointments()async{
    if (debugServer) {
      //vrati fake data
    }
  

    var headers = {
      "Authorization": "Bearer ${user?.jwtTokenString}",
      // "Accept":"application/json"
    };
    try {
      var response = await http.get(
        Uri.parse("http://$api/api/StaffAppointment?staffId=${user?.id}"),
        headers: headers
      );
      if (response.statusCode == 200) {
        return Appointment.fromJson(jsonDecode(response.body));
      } else {
        print(
            "[ERROR] AppState getAppointments ${response.statusCode}  ${response.body}");
        return null;
      }
      // print(response.body);
    } catch (e) {
      print("[ERROR] AppState getAppointments nema interneta ili server ne radi");
      return null;
    }
  }
  
  Future<List<Reservation>?> getReservations()async{
    if (debugServer) {
      //vrati fake data
    }
    var headers = {
      "Authorization": "Bearer ${user?.jwtTokenString}",
      // "Accept":"application/json"
    };
    try {
      var response = await http.get(
        Uri.parse("http://$api/api/Reservaiton"),
        headers: headers
      );
      if (response.statusCode == 200) {
        return Reservation.fromJson(jsonDecode(response.body));
      } else {
        print(
            "[ERROR] AppState getReservations ${response.statusCode}  ${response.body}");
        return null;
      }
      // print(response.body);
    } catch (e) {
      print("[ERROR] AppState getReservations nema interneta ili server ne radi");
      return null;
    }
  }

  // Future<http.Response> apiRequest(String method,String path,{Map<String,String>? headers,Object? body})async{
  //   if(method=="POST"){

  //   }

  // }
}
