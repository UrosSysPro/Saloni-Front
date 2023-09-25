import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon/pages/home_page.dart';
import 'package:salon/widgets/filled_input.dart';
import 'package:salon/widgets/filled_button.dart' as salon;
import 'package:salon/widgets/page_gradient.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({ Key? key }) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
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
              SizedBox(height: 35,),
              FilledInput(
                placeholder: "Email adresa...",
              ),
              SizedBox(height: 35,),
              FilledInput(
                placeholder: "Korisnicko ime...",
              ),
              SizedBox(height: 35,),
              FilledInput(
                hiddenText: hiddenText,
                placeholder: "Lozinka...",
                icon: GestureDetector(
                  onTap: (){setState(() {
                    hiddenText=!hiddenText;
                  });},
                  child: Icon(hiddenText?Icons.visibility_off:Icons.visibility,color: Colors.grey,)),
              ),
              SizedBox(height: 35,),
              salon.FilledButton(
                text: "Registruj se",
                onTap: () {
                  print("hello");
                  var navigator=Navigator.of(context);
                  navigator.pop();
                  navigator.pushReplacement(CupertinoPageRoute(builder: (context){
                    return HomePage();
                  }));
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