import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DiscountAdCard extends StatelessWidget {
  const DiscountAdCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 40,horizontal: 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 253, 114, 102),
                    Color.fromARGB(255, 253, 165, 84),
                  ],
                ),
                borderRadius: BorderRadius.circular(20)  ,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    offset: Offset(0,5),
                    color: Colors.black45
                  )
                ]            
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Podeli aplikaciju\n i osvoji svoj\n popust",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold                      
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text("Podeli",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromARGB(255, 253, 94, 108)
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 40,
            top: 15,
            child: FlutterLogo(size: 100,)),
        ],
      ),
    );
  }
}