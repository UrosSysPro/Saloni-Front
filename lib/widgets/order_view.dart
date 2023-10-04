import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Container(
        padding: EdgeInsets.only(left: 15),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            FlutterLogo(size: 50,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Title"),
                    subtitle: Text("Subitle"),
                    trailing: Icon(Icons.favorite,color: Colors.red,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text("Rating\n4.7",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}