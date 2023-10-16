import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/pages/home_page.dart';
import 'package:salon/widgets/filled_input.dart';
import 'package:salon/widgets/filled_button.dart' as salon;
import 'package:salon/widgets/page_gradient.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hiddenText=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageGradient(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 80,),
              Text(
                "Dobrodosli!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: 40,),
              FilledInput(
                placeholder: "Korisnicko Ime...",
              ),
              SizedBox(height: 40,),
              FilledInput(
                hiddenText: hiddenText,
                placeholder: "Lozinka...",
                icon: GestureDetector(
                  onTap: (){
                    setState(() {
                      hiddenText=!hiddenText;
                    });
                  },
                  child: Icon(hiddenText?Icons.visibility_off:Icons.visibility,color: Colors.grey,)),
              ),
              SizedBox(height: 20,),
              Align(
                  alignment: Alignment.centerRight,
                  child: forgotPasswordText("Zaboravio si lozinku?")),
              SizedBox(height: 20,),
              salon.FilledButton(
                text: "Uloguj se",
                onTap: () {
                  // var navigator=Navigator.of(context);
                  // navigator.pop();
                  // navigator.pushReplacement(CupertinoPageRoute(builder: (context){
                  //   return HomePage();
                  // }));
                  AppState appState=context.read<AppState>();
                  appState.logIn("","");
                },
              ),
              SizedBox(height: 15,),
              nastaviSa(),
              SizedBox(height: 30,),
              socials()
            ],
          ),
        ),
         Positioned(
           right: 20,
           top: 50,
           child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.cancel),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
         ),
      ],
    ));
  }

  Widget forgotPasswordText(String text){
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black87
      ),
    );
  }

  Widget nastaviSa(){
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container(height: 2,color: Colors.grey,width: double.infinity,)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("ili nastavi sa",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black54
              ),
            ),
          ),
          Expanded(child: Container(height: 3,color: Colors.grey,width: double.infinity,)),
        ],
      ),
    );
  }

  Widget socials(){
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlutterLogo(size: 50,),
          FlutterLogo(size: 50,),
          FlutterLogo(size: 50,)
        ],
      ),
    );
  }
}
