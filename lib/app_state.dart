import 'package:flutter/material.dart';

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

  
  // void signIn(String username,String password){}
  // void logIn(String username,String password){}  
  // List<Salon> getSalons(String pattern){}
  // List<Salon> getRecomendedSalonsForUser(String userId){}
  // List<Salon> getRecomendedSalonsForUser(String userId,String categoryId){}
  // List<Salon> getFavorites(String userId){}
  // List<Order> getUserOrderHistory(String userId){}
  // void enterPromoCode(String userId,String code){}
}