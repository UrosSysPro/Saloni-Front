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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            color: Colors.pink,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Text("Nalog"),
                Material(
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.cancel),
                  ),
                ),
              ],
            ),
          ),
          field("Ime", (value) {}),
          field("Email", (value) {}),
          field("Adresa", (value) {}),
        ],
      ),
    );
  }

  Widget field(String name, void Function(String value) onChange) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Text(name),
          TextField(
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}
