import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon/pages/map_page.dart';
import 'package:salon/widgets/category_list_item.dart';
import 'package:salon/widgets/discoutnt_ad_card.dart';
import 'package:salon/widgets/home_section.dart';
import 'package:salon/widgets/page_view_indicator.dart';
import 'package:salon/widgets/salon_view.dart';
import 'package:salon/widgets/chip.dart' as Salon;
// import 'package:salon/widgets/filled_button.dart' as Salon;
import 'package:salon/models/salon.dart' as SalonClass;
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/widgets/search_bar.dart' as Salon;

class HomeCategoryView extends StatefulWidget {
  const HomeCategoryView({super.key});

  @override
  State<HomeCategoryView> createState() => _HomeCategoryViewState();
}

class _HomeCategoryViewState extends State<HomeCategoryView> {

  List<SalonClass.Salon>? saloni;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AppState>().getRecomended().then((value){
      print("recomendations loaded");
      setState(() {
        saloni=value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 253, 245, 215),
      child: ListView(
          children: [
            Stack(
              
              children: [
                Positioned(
                  left: -700/4,
                  top: -350,
                  child: Container(
                    width: 700,
                    height: 700,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 253, 94, 108),
                      borderRadius: BorderRadius.circular(350)
                    ),
                  )
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(width: 30,),
                          Container(
                            width: 70,height: 30,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(child: Icon(Icons.chevron_left,color: Colors.white,)),
                          ),
                          Expanded(child: Salon.SearchBar()),
                        ],
                      ),
                    ),
                    CategoryListItem(categoryName: "Frizerski\nSaloni", icon: FlutterLogo(size: 40,)),
                              
                    SizedBox(height: 20,),
                    HomeSection(sectionName: "Preporuceni", child: Column(
                      children: saloni?.map((e) => SalonView(salon: e)).toList()??[],
                    )),
                    SizedBox(height: 200,)
                  ],
                )
              ],
            )
          ],
        ),
    );
  }
}