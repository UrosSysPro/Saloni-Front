import 'package:flutter/material.dart';
import 'package:salon/models/salon.dart';

class CreateOrderPage extends StatefulWidget {

  final Salon salon;
  final int categoryId;
  const CreateOrderPage(this.salon,this.categoryId,{super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 245, 215),
      body: Column(
        children: [
          Container(
            // height: 70,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 253, 94, 108),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 10),
                  child: Text(
                    widget.salon.name ?? "Default name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(width: 70,),
              ],
            ),
          ),
          Align(
            heightFactor: 1,
            child: Text("Februar",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13
            ),),
          ),
          SizedBox(height: 70,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 70,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ["Pon","Uto","Sre","Cet","Pet","Sub","Ned"].map((e){
                return Expanded(child: Column(
                  children: [
                    Text(e,style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 5,),
                    Container(
                      width: 30,height: 30,
                      child: Center(
                        child: Text("11",style:TextStyle(
                          fontWeight: FontWeight.bold,
                          color: e=="Pon"?Colors.white:Colors.black
                        ),),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: e=="Pon"?Color.fromARGB(255, 253, 94, 108):Colors.transparent,
                      ),
                    )
                  ],
                ));
              }).toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:30),
            height: 140,
            child: Row(
              children: List<int>.generate(4, (index)=>index).map((e){
                return Expanded(child: Column(
                  children: List<int>.generate(3, (index) => index).map((f){
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          width: double.infinity,
                          child: Center(child: Text("${e+f*4+8}:00",style: TextStyle(fontWeight: FontWeight.bold),)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3),
                          ),
                      )
                    ));
                  }).toList(),
                ));
              }).toList(),
            ),
          ),
          Text(widget.salon.name??"Default name",style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(
            width: 100,height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage("http://localhost:5234/images/${widget.salon.imageUrl}"),
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.person);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}