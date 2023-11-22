import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/models/user.dart';
import 'package:salon/pages/admin_home_page.dart';
import 'package:salon/pages/home_page.dart';
import 'package:salon/pages/welcome_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

var navigatorKey=GlobalKey<NavigatorState>();

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    User? user;
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData.light().copyWith(visualDensity: VisualDensity.comfortable),
      title: "Salon",
      home: Consumer<AppState>(builder: (context, value, child) {
        if(value.user==user&&child!=null){
          return child;
        }else{
          user=value.user;
          if(user==null){
            return const WelcomePage();
          }else{
            if(user?.role=="customer"){return const HomePage();}
            if(user?.role=="worker"){return const AdminHomePage();}
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("unknowon role"),
                    ElevatedButton(
                      onPressed: (){
                        context.read<AppState>().logOut();
                      },
                      child: Text("log out"),
                    )
                  ],
                ),
              ),
            );
          }
        }
      }),
    );
  }
}