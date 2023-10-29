import "dart:convert";

import 'package:flutter/material.dart';
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

  

  FlutterSecureStorage storage=const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  AppState() {
    loadingUser=true;
    storage.read(key: "user").then((value){
      if(value!=null){
        user=User.userFromJson(JwtDecoder.decode(value));
      }
      loadingUser=false;
      notifyListeners();
    });
  }

  bool debugServer=true;
  User? user;
  bool loadingUser=false;
  bool errorLogInInfo=false;
  bool errorSignInInfo=false;
  bool serverError=false;


  Future<bool> signIn(String email, String username, String password) async {
    if(debugServer){
      user=User(
        username: "Defaultusername",
        useCases: List<int>.generate(7, (index) => index)
      );
      notifyListeners();
      return true;
    }
    bool success=false;
    loadingUser=true;
    notifyListeners();

    var body = jsonEncode({
      "UserName": username.trim(),
      "LastName": "Defaultlastname",
      "FirstName": "Defaultfirstname",
      "Password": password.trim()
    });

    var headers = {'content-type': 'application/json'};

    try{
      var response=await http.post(
        Uri.parse("http://localhost:5234/api/Register"),
        body: body,
        headers: headers
      );
      if(response.statusCode==201){
        success=await logIn(username, password);
      }else{
        print("nije uspeo da napravi nalog ${response.statusCode} \n${response.body}");
      }
    }on Exception{
        print("nema interneta ili servera");
    }
    loadingUser=false;
    notifyListeners();
    return success;
  }

  Future<bool> logIn(String username, String password) async {
    if(debugServer){
      user=User(
        username: "Defaultusername",
        useCases: List<int>.generate(7, (index) => index)
      );
      notifyListeners();
      return true;
    }
    bool success=false;
    loadingUser=true;
    notifyListeners();

    var body = jsonEncode({'username': username.trim(), 'password': password.trim()});
    var headers = {'content-type': 'application/json'};

    try {
      var response = await http.post(
          Uri.parse("http://localhost:5234/api/Token"),
          body: body,
          headers: headers);
      if (response.statusCode == 200) {
        user=User.userFromJson(JwtDecoder.decode(response.body));
        await storage.write(key: "user", value: response.body);
        success=true;
      } else {
        print("[ERROR] Wrong username of password");
      }
    } catch (Exception) {
      print("[ERROR] server connection");
    }

    loadingUser=false;
    notifyListeners();

    return success;
  }
  void logOut(){
    user=null;
    notifyListeners();
  }

  // void signIn(String username,String password){}
  // void logIn(String username,String password){}
  // List<Salon> getSalons(String pattern){}
  // List<Salon> getRecomendedSalonsForUser(String userId){}
  // List<Salon> getRecomendedSalonsForUser(String userId,String categoryId){}
  // List<Salon> getFavorites(String userId){}
  // List<Order> getUserOrderHistory(String userId){}
  // void enterPromoCode(String userId,String code){}

  /*
  //////////////////////////////////////////////////////////
    token - user imageUrl
    /////////////////////////////////////////////////////////
    searchSalon - [
      {
        id,
        name,
        description,
        rating,
        imageUrl
      },
      {
        id,
        name,
        description,
        rating,
        imageUrl
      },
    ]
    //////////////////////////////////////////////////
    favoritesForUser - [
      {
        id,
        name,
        description,
        rating,
      },
      {
        id,
        name,
        description,
        rating,
      },
    ]
    vraca listu informacija o salonima koje je korisnik lajkovao
  ///////////////////////////////////////////////////////////
    salonInfo - {
        id,
        name,
        description,
        rating,
        salonProfileImgUrl,
        float lat,
        float lng,
        string adresa,
        services:[
          {
            id,
            name:"Sisanje i feniranje",
          },
          {
            id,
            name:"Farbanje"
          }
        ],
        images[
          url,url,url,url
        ]
      }
      //informacije o salonu, sta moze da se naruci i one slike na dnu
 ///////////////////////////////////////////////////////////// 
    near user
 [
      {
        id,
        lat,
        lng,
        name,
        description,
        rating,
        imageUrl
      },
      {
        id,
        lat,
        lng,
        name,
        description,
        rating,
        imageUrl
      },
    ]
    
   */
}
