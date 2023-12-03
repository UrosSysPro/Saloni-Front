import 'package:flutter/material.dart';

class ChooseCategoryPage extends StatelessWidget {
  const ChooseCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,255,245,215),
      body: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                splashRadius: 15,
                icon: Icon(Icons.cancel_rounded),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(20)),
                  ),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      listTile(FlutterLogo(size: 30,), "categoryName", () { }),
                      listTile(FlutterLogo(size: 30,), "categoryName", () { }),
                      listTile(FlutterLogo(size: 30,), "categoryName", () { }),
                      listTile(FlutterLogo(size: 30,), "categoryName", () { }),
                      listTile(FlutterLogo(size: 30,), "categoryName", () { }),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget listTile(Widget icon, String categoryName,void Function() onTap){
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 45,height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(255,255,201,72),
              ),
              child: Center(child: icon),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(categoryName,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
