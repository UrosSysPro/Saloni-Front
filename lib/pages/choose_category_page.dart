import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon/pages/home_category_page.dart';
import 'package:salon/widgets/category_list_item.dart';

class ChooseCategoryPage extends StatelessWidget {
  const ChooseCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 245, 215),
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
                onPressed: () {
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
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(20)),
              ),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      listTile(
                          SizedBox(
                              width: 30,
                              child: Image(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/frizer.png"))),
                          "Frizer", () {
                        Navigator.pushReplacement(context,
                            CupertinoPageRoute(builder: (context) {
                          return HomeCategoryPage(
                              serviceId: 1,
                              icon: SizedBox(
                                width: 30,
                                height: 30,
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/frizer.png"),
                                ),
                              ),
                              serviceName: "Frizer");
                        }));
                      }),
                      listTile(
                          SizedBox(
                              width: 15,
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/kozmetika.png"))),
                          "Kozmetika", () {
                        Navigator.pushReplacement(context,
                            CupertinoPageRoute(builder: (context) {
                          return HomeCategoryPage(
                              serviceId: 1,
                              icon: const SizedBox(
                                width: 20,
                                child: Image(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/kozmetika.png"),
                                ),
                              ),
                              serviceName: "Kozmetika");
                        }));
                      }),
                      listTile(
                          SizedBox(
                              width: 25,
                              child: Image(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/nokti.png"))),
                          "Manikir", () {
                        Navigator.pushReplacement(context,
                            CupertinoPageRoute(builder: (context) {
                          return HomeCategoryPage(
                              serviceId: 1,
                              icon: SizedBox(
                                width: 30,
                                child: Transform.translate(
                                  offset: Offset(6, 0),
                                  child: const Image(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/nokti.png"),
                                  ),
                                ),
                              ),
                              serviceName: "Manikir");
                        }));
                      }),
                      listTile(
                          SizedBox(
                              width: 30,
                              child: Image(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/masaza.png"))),
                          "Spa", () {
                        Navigator.pushReplacement(context,
                            CupertinoPageRoute(builder: (context) {
                          return HomeCategoryPage(
                              serviceId: 1,
                              icon: SizedBox(
                                width: 30,
                                child: Image(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/images/masaza.png"),
                                ),
                              ),
                              serviceName: "Spa");
                        }));
                      }),
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

  Widget listTile(Widget icon, String categoryName, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(255, 255, 201, 72),
              ),
              child: Center(child: icon),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                categoryName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
