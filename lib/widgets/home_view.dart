import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/pages/choose_category_page.dart';
import 'package:salon/pages/home_category_page.dart';
import 'package:salon/pages/map_page.dart';
import 'package:salon/pages/sorting_parameters_page.dart';
import 'package:salon/widgets/category_list_item.dart';
import 'package:salon/widgets/discoutnt_ad_card.dart';
import 'package:salon/widgets/home_section.dart';
import 'package:salon/widgets/page_view_indicator.dart';
import 'package:salon/widgets/salon_view.dart';
// ignore: library_prefixes
import 'package:salon/widgets/search_bar.dart' as Salon;
// ignore: library_prefixes
import 'package:salon/widgets/chip.dart' as Salon;
// ignore: library_prefixes
import 'package:salon/models/salon.dart' as SalonClass;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPage = 0;

  List<SalonClass.Salon>? saloni;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    context.read<AppState>().getRecomended().then((value) {
      setState(() {
        saloni = value;
      });
    });
    controller=PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 253, 245, 215),
      child: ListView(
        children: [
          Stack(
            children: [
              Positioned(
                  left: -700 / 4,
                  top: -350,
                  child: Container(
                    width: 700,
                    height: 700,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 253, 94, 108),
                        borderRadius: BorderRadius.circular(350)),
                  )),
              Column(
                children: [
                  const Salon.SearchBar(),
                  SizedBox(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Salon.Chip(
                          text: "U Blizini",
                          onTap: () {
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (context) {
                              return const MapPage();
                            }));
                          },
                        ),
                        Salon.Chip(
                          text: "Sortiraj",
                          onTap: () {
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (context) {
                              return const SortingParameterPage();
                            }));
                          },
                        ),
                        Salon.Chip(
                          text: "Kategorije",
                          onTap: () {
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (context) {
                              return const ChooseCategoryPage();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: PageView(
                      controller: controller,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      children: const [
                        DiscountAdCard(icon:Image(fit:BoxFit.cover,image: AssetImage("assets/images/bank.png"),)),
                        DiscountAdCard(icon:Image(fit:BoxFit.cover,image: AssetImage("assets/images/hand.png"))),
                        DiscountAdCard(icon: Image(fit:BoxFit.cover,image: AssetImage("assets/images/marketing.png")),)
                      ],
                    ),
                  ),
                  Transform.translate(
                      offset: const Offset(0, -10),
                      child:
                          PageViewIndicator(count: 3, selected: currentPage,controller: controller,)),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeSection(
                      sectionName: "Kategorije",
                      child: SizedBox(
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              CategoryListItem(
                                categoryName: "Frizerski\nSaloni",
                                icon: const SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/frizer.png"),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      CupertinoPageRoute(builder: (context) {
                                    return const HomeCategoryPage(
                                      serviceId: 1,
                                      icon: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/frizer.png"),
                                        ),
                                      ),
                                      serviceName: "Frizerski\nSaloni",
                                    );
                                  }));
                                },
                              ),
                              CategoryListItem(
                                categoryName: "Kozmeticki\nSaloni",
                                icon: const SizedBox(
                                  width: 20,
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/kozmetika.png"),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      CupertinoPageRoute(builder: (context) {
                                    return const HomeCategoryPage(
                                      serviceId: 2,
                                      icon: SizedBox(
                                        width: 20,
                                        child: Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/kozmetika.png"),
                                        ),
                                      ),
                                      serviceName: "Kozmeticki\nSaloni",
                                    );
                                  }));
                                },
                              ),
                              CategoryListItem(
                                categoryName: "Nokti",
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
                                onTap: () {
                                  Navigator.push(context,
                                      CupertinoPageRoute(builder: (context) {
                                    return HomeCategoryPage(
                                      serviceId: 3,
                                      icon: SizedBox(
                                        width: 30,
                                        child: Transform.translate(
                                          offset: Offset(6, 0),
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/images/nokti.png"),
                                          ),
                                        ),
                                      ),
                                      serviceName: "Nokti",
                                    );
                                  }));
                                },
                              ),
                              CategoryListItem(
                                categoryName: "Spa\nCentar",
                                icon: SizedBox(
                                  width: 30,
                                  child: const Image(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/masaza.png"),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      CupertinoPageRoute(builder: (context) {
                                    return const HomeCategoryPage(
                                      serviceId: 4,
                                      icon: SizedBox(
                                        width: 30,
                                        child: const Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/masaza.png"),
                                        ),
                                      ),
                                      serviceName: "Spa\nCentar",
                                    );
                                  }));
                                },
                              ),
                            ],
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeSection(
                      sectionName: "Preporuceni",
                      child: Column(
                        children:
                            saloni?.map((e) => SalonView(salon: e)).toList() ??
                                [],
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
