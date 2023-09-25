import 'package:flutter/material.dart';
import 'package:salon/pages/welcome_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(visualDensity: VisualDensity.comfortable),
      title: "Salon",
      home: WelcomePage(),
    );
  }
}