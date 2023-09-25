import 'package:flutter/material.dart';
import 'package:salon/widgets/discoutnt_ad_card.dart';
import 'package:salon/widgets/search_bar.dart' as Salon;
import 'package:salon/widgets/chip.dart' as Salon;
class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                        ),
                        Salon.Chip(
                          text: "Sortiraj",
                        ),
                        Salon.Chip(
                          text: "Kategorije",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 270,
                    child: PageView(
                      children: [
                        DiscountAdCard(),
                        DiscountAdCard(),
                        DiscountAdCard()
                      ],
                    ),
                  ),
                  SizedBox(height: 1000,)
                ],
              )
            ],
          )
        ],
      );
  }
}