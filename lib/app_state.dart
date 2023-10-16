import "dart:convert";

import 'package:flutter/material.dart';
import "models/user.dart";
import "package:http/http.dart" as http;

class AppState extends ChangeNotifier{
  ThemeData themeData=ThemeData(
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
      onBackground: Colors.black
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black
      ),

    )
  );

  AppState(){

  }
  
  User? user;
  Future<void> signIn() async{
    print("sign in");
    return Future<void>.value();
  }
  Future<void> logIn(String username,String password) async{
    print("log in");
    username="Proba2";
    password="Sifra123!";

    var body=jsonEncode({'username':username,'password':password});
    var headers={'content-type':'application/json'};
    print(body);
    var response=await http.post(
      Uri.parse("http://localhost:5234/api/Token"),
      body:body,
      headers:headers
    );
    if(response.statusCode!=200){

    }
    print(response.body);
    return Future<void>.value();
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
      },
      {
        id,
        name,
        description,
        rating,
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
    

    
   */
}