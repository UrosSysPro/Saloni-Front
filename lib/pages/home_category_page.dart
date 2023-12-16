import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/models/salon.dart' as SalonClass;
import 'package:salon/widgets/category_list_item.dart';
import 'package:salon/widgets/search_bar.dart' as Salon;
import 'package:salon/widgets/home_section.dart';
import 'package:salon/widgets/salon_view.dart';

class HomeCategoryPage extends StatefulWidget {
  final int serviceId;
  final Widget icon;
  final String serviceName;
  const HomeCategoryPage({
    super.key,
    required this.serviceId,
    required this.icon,
    required this.serviceName,
  });

  @override
  State<HomeCategoryPage> createState() => _HomeCategoryPageState();
}

class _HomeCategoryPageState extends State<HomeCategoryPage> {
  List<SalonClass.Salon>? saloni;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<AppState>()
        .getRecomendedForCategory(widget.serviceId, "")
        .then((value) {
      print("recomendations loaded");
      setState(() {
        saloni = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(appBar: AppBar(title: Text('hello')),);
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 253, 245, 215),
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
                          color: Color.fromARGB(255, 253, 94, 108),
                          borderRadius: BorderRadius.circular(350)),
                    )),
                Column(
                  children: [
                    SizedBox(
                      height: 70,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              width: 70,
                              height: 30,
                              child: Material(
                                color: Colors.orange,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Center(
                                        child: Icon(
                                      Icons.chevron_left,
                                      color: Colors.white,
                                    ))),
                              ),
                            ),
                          ),
                          Expanded(child: Salon.SearchBar()),
                        ],
                      ),
                    ),
                    CategoryListItem(
                        categoryName: widget.serviceName, icon: widget.icon),
                    SizedBox(
                      height: 20,
                    ),
                    HomeSection(
                        sectionName: "Preporuceni",
                        child: Column(
                          children: saloni
                                  ?.map((e) => SalonView(salon: e))
                                  .toList() ??
                              [],
                        )),
                    SizedBox(
                      height: 200,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
