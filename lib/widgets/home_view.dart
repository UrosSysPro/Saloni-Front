import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/pages/map_page.dart';
import 'package:salon/widgets/category_list_item.dart';
import 'package:salon/widgets/discoutnt_ad_card.dart';
import 'package:salon/widgets/home_category_view.dart';
import 'package:salon/widgets/home_section.dart';
import 'package:salon/widgets/page_view_indicator.dart';
import 'package:salon/widgets/salon_view.dart';
import 'package:salon/widgets/search_bar.dart' as Salon;
import 'package:salon/widgets/chip.dart' as Salon;
import 'package:salon/models/salon.dart' as SalonClass;

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPage=0;

  int selectedCategory=-1;

  List<SalonClass.Salon>? saloni;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<AppState>().getRecomended().then((value){
    //   // setState(() {
    //   //   saloni=value;
    //   // });
    // });
    // print("loading recomendations");
    context.read<AppState>().getRecomended().then((value){
      print("recomendations loaded");
      setState(() {
        saloni=value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    if(selectedCategory!=-1){
      return HomeCategoryView();
    }
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
                    Salon.SearchBar(),
                    SizedBox(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Salon.Chip(
                            text: "U Blizini",
                            onTap: (){
                              Navigator.push(context, CupertinoPageRoute(builder: (context){
                                return MapPage();
                              }));
                            },
                          ),
                          Salon.Chip(
                            text: "Sortiraj",
                            onTap: (){},
                          ),
                          Salon.Chip(
                            text: "Kategorije",
                            onTap: (){},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: PageView(
                        onPageChanged: (index){
                          setState(() {
                            currentPage=index;
                          });
                        },
                        children: [
                          DiscountAdCard(),
                          DiscountAdCard(),
                          DiscountAdCard()
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0,-10),
                      child: PageViewIndicator(count: 3, selected: currentPage)
                    ),
                    SizedBox(height: 20,),
                    HomeSection(
                      sectionName: "Kategorije", 
                      child: SizedBox(
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              CategoryListItem(categoryName: "Frizerski\nSaloni", icon: FlutterLogo(size: 40,),onTap: (){setState(() {
                                selectedCategory=1;
                              });},),
                              CategoryListItem(categoryName: "Kozmeticki\nSaloni", icon: FlutterLogo(size: 40,),onTap: (){setState(() {
                                selectedCategory=1;
                              });},),
                              CategoryListItem(categoryName: "Nokti", icon: FlutterLogo(size: 40,),onTap: (){setState(() {
                                selectedCategory=1;
                              });},),
                              CategoryListItem(categoryName: "Spa\Centar", icon: FlutterLogo(size: 40,),onTap: (){setState(() {
                                selectedCategory=1;
                              });},),
                            ],
                          ),
                        ),
                      ) 
                    ),
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