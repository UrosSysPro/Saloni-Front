import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
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
              children: [
                ListTile(
                  title: Text("Title"),
                  subtitle: Text("Subitle"),
                  trailing: Icon(Icons.favorite,color: Colors.red,),
                ),
                Text("Rating\n4.7",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),)
              ],
            ),
          )
        ],
      ),
    );
  }
}