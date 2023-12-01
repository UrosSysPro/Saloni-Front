import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon/models/salon.dart';
import 'package:salon/models/service.dart';
import 'package:salon/pages/create_order_page.dart';

class SelectSubCategoryPage extends StatelessWidget {
  final Salon salon;
  final int serviceId;
  const SelectSubCategoryPage(
      {super.key, required this.salon, required this.serviceId});

  @override
  Widget build(BuildContext context) {
    int salonServiceId=-1;
    for(int i=0;i<(salon.services?.length??-1);i++){
      if(salon.services?[i].serviceId==serviceId){
        salonServiceId=salon.services?[i].id??-1;
        break;
      }
    }
    bool isLeaf=true;
    for(int i=0;i<(salon.services?.length??-1);i++){
      if(salon.services?[i].parentId==salonServiceId){
        isLeaf=false;
        break;
      }
    }
    if(isLeaf)return CreateOrderPage(salon, serviceId);
    List<Service> subservices=salon.services?.where((element) => element.parentId==salonServiceId).toList()??[];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 245, 215),
      body: Column(
        children: [
          Container(
            // height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                      color: const Color.fromARGB(255, 253, 94, 108),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, 10),
                  child: Text(
                    salon.name ?? "Default name",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 253, 94, 108),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
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
              itemCount: subservices.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context) {
                        return CreateOrderPage(salon,subservices[index].serviceId);
                      },));
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      width: double.infinity,
                      padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                             BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 5,
                                color: Colors.black26)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subservices[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 253, 94, 108),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            child: Text("${subservices[index].price}",style: const TextStyle(
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
