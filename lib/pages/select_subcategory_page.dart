import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon/models/salon.dart';
import 'package:salon/pages/create_order_page.dart';

class SelectSubCategoryPage extends StatelessWidget {
  final Salon salon;
  final int categoryId;
  const SelectSubCategoryPage(
      {super.key, required this.salon, required this.categoryId});

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
                    salon.name ?? "Default name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 253, 94, 108),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context) {
                        return CreateOrderPage(salon,categoryId);
                      },));
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 5,
                                color: Colors.black26)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SubCategory$index",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 253, 94, 108),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            child: Text("950,00",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
