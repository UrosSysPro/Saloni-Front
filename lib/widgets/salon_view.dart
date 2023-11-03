import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/models/salon.dart';
import 'package:salon/pages/salon_page.dart';

class SalonView extends StatefulWidget {
  final Salon salon;
  const SalonView({super.key,required this.salon});

  @override
  State<SalonView> createState() => _SalonViewState();
}

class _SalonViewState extends State<SalonView> {
  @override
  Widget build(BuildContext context) {
    // print("http://localhost:5234/images/${widget.salon.imageUrl}");
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return SalonPage(widget.salon.id!);
        }));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 253, 94, 108),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(0,2),
                color: Colors.black26
              )
            ]
          ),
          height: 200,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                width: double.infinity,
                height: 200,fit: BoxFit.cover,
                image: NetworkImage("http://localhost:5234/images/${widget.salon.imageUrl}"),
                errorBuilder: (context, error, stackTrace) {
                  return Transform.translate(
                    offset: Offset(0,-40),
                    child: Icon(Icons.image,size: 100,)
                  );
                },
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              nameText(widget.salon.name??"Default name"),
                              typeText(widget.salon.description??"Default description"),
                              SizedBox(
                                height: 10,
                              ),
                              ocenaText("Ocena:\n${widget.salon.avgRating??4.0}")
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            widget.salon.favorite??false?Icons.favorite:Icons.favorite_outline,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              if(widget.salon.favorite!){
                                widget.salon.favorite=false;
                                context.read<AppState>().removeFavorite(widget.salon.id!);
                              }else{
                                widget.salon.favorite=true;
                                context.read<AppState>().addFavorite(widget.salon.id!);
                              }
                              // widget.salon.favorite=!widget.salon.favorite!;  
                            });
                          },
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget nameText(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
    );
  }

  Widget typeText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black45, fontSize: 11),
    );
  }

  Widget ocenaText(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
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
