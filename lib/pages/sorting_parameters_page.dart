import 'package:flutter/material.dart';
import 'package:salon/widgets/filled_button.dart' as Salon;

class SortingParameterPage extends StatefulWidget {
  const SortingParameterPage({super.key});

  @override
  State<SortingParameterPage> createState() => _SortingParameterPageState();
}

class _SortingParameterPageState extends State<SortingParameterPage> {
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
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, top: 10),
                          child: Text(
                            "Sortiraj po ceni",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: SizedBox(
                          height: 40,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 15,
                                left: 20,
                                right: 20,
                                bottom: 15,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                bottom: 0,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "0\nRSD",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "15000\nRSD",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 40,bottom: 50),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Sortiraj po oceni",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),)),
                      ),
                      Center(
                        child: Container(
                          // width: 70,
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [BoxShadow(
                              blurRadius: 10,
                              offset: Offset(0,4),
                              color: Colors.black26,
                            )]
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star,color: Colors.yellow,),
                              Icon(Icons.star,color: Colors.yellow,),
                              Icon(Icons.star,color: Colors.yellow,),
                              Icon(Icons.star,color: Colors.yellow,),
                              Icon(Icons.star,color: Colors.grey,),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 110,
                          padding: EdgeInsets.all(20),
                          child: Salon.FilledButton(
                            text: "Pretrazi",
                            onTap: (){
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ))
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
}
