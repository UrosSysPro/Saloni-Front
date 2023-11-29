import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/pages/admin_edit_account.dart';

class AdminAccountView extends StatelessWidget {
  const AdminAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 70),
      color: const Color.fromARGB(255, 253, 245, 215),
      child: Column(
        children: [
          FlutterLogo(
            size: 70,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Ime",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          listItem(Icon(Icons.person), "Izmenite nalog",onTap: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context){
              return AdminEditAccount();
            }));
          }),
          listItem(
              Icon(Icons.add_circle_outline_outlined), "Dodajte fotografije"),
          listItem(Icon(Icons.add_circle_outline_outlined), "Dodajte uslugu"),
          listItem(Icon(Icons.remove_red_eye), "Pregledaj nalog"),
          listItem(Icon(Icons.logout), "Log out", onTap: () {
            context.read<AppState>().logOut();
          }),
        ],
      ),
    );
  }

  Widget listItem(Icon icon, String text, {void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Row(
                children: [
                  icon,
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    text,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
