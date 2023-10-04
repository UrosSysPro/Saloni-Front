import 'package:flutter/material.dart';

class SalonPage extends StatelessWidget {
  const SalonPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:const Color.fromARGB(255, 253, 245, 215),
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: const Color.fromARGB(255,253, 94, 108),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100,left: 20,right: 20),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Snip and Style",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("Ocena\n5.0",style: TextStyle(fontSize: 17),textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      kategorija("Sisanje i feniranje", () { }),
                      kategorija("Farbanje", () { }),
                      kategorija("Pramenovi", () { }),
                      SizedBox(height: 40,),
                      redSlika(),
                      redSlika(),
                      redSlika(),
                      redSlika(),
                      redSlika(),
                      redSlika(),
                      redSlika(),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.cancel),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ) 
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget kategorija(String name,void Function() onTap){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.only(left: 25),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Transform.translate(
              offset: Offset(20,0),
              child: Transform.scale(
                scale: 1.3,
                child: Container(
                  width: 80,height: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255,253, 94, 108),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: Icon(Icons.chevron_right),
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  Widget redSlika(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlutterLogo(size: 100,),
        FlutterLogo(size: 100,)
      ],
    );
  }
}