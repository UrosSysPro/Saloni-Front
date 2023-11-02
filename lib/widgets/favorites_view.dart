import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/models/salon.dart';
import 'package:salon/pages/salon_page.dart';
import 'package:salon/widgets/salon_view.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({ Key? key }) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  List<Salon>? saloni;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("loading favorites");
    context.read<AppState>().getFavorites().then((value){
      print("favorites loaded");
      setState(() {
        saloni=value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 253, 245, 215),
        child: Builder(
          builder: (context) {
            if(saloni==null)return Center(child: Text("Loading..."),);
            return ListView.builder(
              itemCount: saloni!.length+1,
              itemBuilder: (context,index){
                if(index==0){
                  return titleText("Omiljeni saloni");
                }
                index--;
                return SalonView(salon: saloni![index]);
                // return GestureDetector(
                //   onTap: (){
                //     Navigator.push(context, CupertinoPageRoute(builder: (context){
                //       return SalonPage("2");
                //     }));
                //   },
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                //     child: Container(
                //       clipBehavior: Clip.antiAlias,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(20),
                //         color: const Color.fromARGB(255,253, 94, 108),
                //       ),
                //       height: 200,
                //       width: double.infinity,
                //       child: Stack(
                //         fit: StackFit.expand,
                //         children: [
                //           Positioned(
                //             bottom: 0,
                //             left: 0,
                //             right: 0,
                //             child: Container(
                //               height: 90,
                //               width: double.infinity,
                //               decoration: BoxDecoration(
                //                 color: Colors.white,
                //                 borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                //               ),
                //               child: Row(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Padding(
                //                     padding: const EdgeInsets.only(top: 10,left: 12),
                //                     child: Column(
                //                       crossAxisAlignment: CrossAxisAlignment.start,
                //                       children: [
                //                         nameText("Hair Palace"),
                //                         typeText("Frizerski salon"),
                //                         SizedBox(height: 10,),
                //                         ocenaText("Ocena:\n4.6")
                //                       ],
                //                     ),
                //                   ),
                //                   IconButton(
                //                     icon: Icon(Icons.favorite,color: Colors.red,),
                //                     onPressed: (){},
                //                   )
                //                 ],
                //               ),
                //             )
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // );
              }
            );
          }
        )
      ),
    );
  }

  Widget nameText(String text){
    return Text(text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14
      ),
    );
  }

  Widget typeText(String text){
    return Text(text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black45,
        fontSize: 11
      ),
    ); 
  }

  Widget ocenaText(String text){
    return Text(text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 11
      ),
    );
  }

  Widget titleText(String text){
    return Padding(
      padding: const EdgeInsets.only(top: 30,bottom: 10),
      child: Align(
        heightFactor: 1,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}