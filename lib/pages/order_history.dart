import 'package:flutter/material.dart';

import '../widgets/order_view.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 253, 245, 215),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30,bottom: 20),
              child: Text("Your orders",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
                  // if(index%2==0)
                    return OrderView();
                  // else
                    // return SizedBox(height: 20,);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}