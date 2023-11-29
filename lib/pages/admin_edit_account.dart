import 'package:flutter/material.dart';

class AdminEditAccount extends StatefulWidget {
  const AdminEditAccount({super.key});

  @override
  State<AdminEditAccount> createState() => _AdminEditAccountState();
}

class _AdminEditAccountState extends State<AdminEditAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: const Color.fromARGB(255, 253, 245, 215),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              color: Colors.pink,
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                  ),
                  Text("Nalog",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Icon(Icons.remove_sharp,size: 20,color: Colors.white,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            field("Ime", (value) {}),
            field("Email", (value) {}),
            field("Adresa", (value) {}),
          ],
        ),
      ),
    );
  }

  Widget field(String name, void Function(String value) onChange) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            SizedBox(width: 100,child:Text(name,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),)),
            Expanded(child: TextField(
              onChanged: onChange,
            ),),
          ],
        ),
      ),
    );
  }
}
