import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/models/salon.dart';
import 'package:salon/pages/select_subcategory_page.dart';

class SalonPage extends StatefulWidget {
  final String salonId;
  const SalonPage(this.salonId,{ Key? key,}) : super(key: key);

  @override
  State<SalonPage> createState() => _SalonPageState();
}

class _SalonPageState extends State<SalonPage> {

  Salon? salon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AppState>().getSalon(widget.salonId).then((value){
      // salon=value;
      setState(() {
        salon=value;
      });
    });
  }

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
                  child: Image(
                    image: NetworkImage("http://localhost:5234/images/${salon?.imageUrl}",),
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      
                      return Center(
                        child: Icon(Icons.photo,size: 200,),
                      );
                    },
                  ),
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
                            Text(salon?.name??"Default name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("Ocena\n${salon?.avgRating??4.0}",style: TextStyle(fontSize: 17),textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      kategorija("Sisanje i feniranje", () { 
                        Navigator.push(context, CupertinoPageRoute(builder: (context){
                          return SelectSubCategoryPage(salon: salon!, categoryId:2); 
                        }));
                      }),
                      kategorija("Farbanje", () { 
                        Navigator.push(context, CupertinoPageRoute(builder: (context){
                          return SelectSubCategoryPage(salon: salon!, categoryId:2); 
                        }));
                      }),
                      kategorija("Pramenovi", () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context){
                          return SelectSubCategoryPage(salon: salon!, categoryId:2); 
                        }));
                       }),
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
      child: GestureDetector(
        onTap: onTap,
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