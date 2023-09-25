import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon/pages/login_page.dart';
import 'package:salon/pages/signin_page.dart';
import 'package:salon/widgets/page_gradient.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageGradient(
        padding: EdgeInsets.fromLTRB(30, 60, 30, 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: topPicture(),
              flex: 1,
            ),
            SizedBox(height: 30,),
            prviText("Pronadji svoj \nomiljeni salon ovde"),
            SizedBox(height: 30,),
            drugiText(
                "Istrazi neke od najboljih salona i\n zakazi svoj termin u dva klika"),
            SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 233, 236, 244)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context){
                        return SigninPage();
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: loginButtonText("Registruj se"),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context){
                        return LoginPage();
                      }));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                      child: loginButtonText("Uloguj se"),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

  Widget topPicture() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 252, 94, 110),
                Color.fromARGB(255, 241, 92, 140)
              ])),
    );
  }
  Widget prviText(String text){
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      textAlign: TextAlign.center,
    );
  }
  Widget drugiText(String text){
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black54,
        fontSize: 15
      ),
    );
  }
  Widget loginButtonText(String text){
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16
      ),
    );
  }
  
}
