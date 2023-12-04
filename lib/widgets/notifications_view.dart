import 'package:flutter/material.dart';
import 'dart:math' as math;

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 253, 245, 215),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40,bottom: 30),
            child: Text("Obavestenja",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              gradientButton("Rezervacije", () {},true),
              gradientButton("Ocene korisnika", () {},false)
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlutterLogo(size: 60,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Anna Stoun",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                            Text("""Anna je zakazala termin 
( Feniranje na lokne )
11:00h"""
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget gradientButton(String text, void Function() onTap,bool selected) {
    return Container(
      width: 134,
      height: 27,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          transform: GradientRotation(math.pi/2),
          begin: Alignment(0.49, -0.87),
          end: Alignment(-0.49, 0.87),
          colors: selected?[Color(0xFFFF5E6C), Color(0xFFFFC847)]:[Color(0x99FF5E6C), Color(0x99FFC847)],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Center(child: Text(text,style: TextStyle(color: Colors.white),)),
    );
  }
}
