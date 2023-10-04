import 'package:flutter/material.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 253, 245, 215),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30,bottom: 20),
                child: Text("Your orders",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
              ),
              SearchBar(elevation: MaterialStateProperty.resolveWith((states) => 0),),
              SizedBox(height: 30,),
              Center(child: FlutterLogo(size: 150,),),
              SizedBox(height: 30,),
              Center(
                child: Text("Nemate nijedan promo kod.\nUnesite Promo kod.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}