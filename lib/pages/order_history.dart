import 'package:flutter/material.dart';
import 'package:salon/widgets/order_view.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 245, 215),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Your orders"),
          // ListView.builder(
          //   itemCount: 10,
          //   itemBuilder: (context,index){
          //     // return OrderView();
          //     return Container(height: 100,);
          //   },
          // )
        ],
      ),
    );
  }
}