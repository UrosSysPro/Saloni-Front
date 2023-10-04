import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon/pages/order_history.dart';
import 'package:salon/widgets/filled_button.dart' as Salon;

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 253, 245, 215),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlutterLogo(
                    size: 60,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "User Name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              child: Material(
                elevation: 0,
                color: Colors.transparent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      listItem("Izaberite karticu", () {
                        showCardEditBottomSheet(context);
                      }),
                      listItem("Istorija zakazivanja", () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context){
                          return OrderHistory();
                        }));
                      }),
                      listItem("Promo kodovi", () {}),
                      listItem("Pomoc", () {}),
                      listItem("Podrska uzivo", () {}),
                      listItem("Uslovi koriscenja", () {}),
                      listItem("Pravila privatnosti", () {})
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> showCardEditBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Kartice",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  )),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterLogo(),
                      Text("***** ***** 345",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Icon(Icons.more_vert),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 100,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    heightFactor: 1,
                    child: Chip(
                      backgroundColor: Color.fromARGB(255, 254, 201, 72),
                      label: Text(
                        "+ Dodaj karticu",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                SizedBox(
                  height: 20,
                  width: 100,
                ),
                Salon.FilledButton(
                  radius: 50,
                  text: "Potvrdi",
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        });
  }

  Widget listItem(String text, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        height: 50,
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 2, color: Colors.black12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}
