import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/models/salon.dart';
import 'package:salon/widgets/salon_view.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

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
    context.read<AppState>().getFavorites().then((value) {
      print("favorites loaded");
      setState(() {
        saloni = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: const Color.fromARGB(255, 253, 245, 215),
          child: Builder(builder: (context) {
            if (saloni == null)
              return Center(
                child: Text(
                  "Loading...",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              );
            if (saloni!.isEmpty)
              return Center(
                child: Text(
                  "Nema favorite salona",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              );
            return ListView.builder(
                itemCount: saloni!.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return titleText("Omiljeni saloni");
                  }
                  index--;
                  return SalonView(salon: saloni![index]);
                });
          })),
    );
  }

  Widget titleText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: Align(
        heightFactor: 1,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
