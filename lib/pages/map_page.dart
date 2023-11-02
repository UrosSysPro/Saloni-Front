import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
// import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:provider/provider.dart';
import 'package:salon/app_state.dart';
import 'package:salon/models/salon.dart';
import 'package:salon/widgets/salon_marker.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Salon> saloni = [];
  late FocusNode node;
  List<String> recomendations=[];
  bool showRecomendations=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AppState>().loadSalonsOnMap().then((value) {
      setState(() {
        saloni = value;
      });
    });
    node=FocusNode();
    
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    node.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> markers = saloni.map((e) => SalonMarker(salon: e)).toList();
    List<Widget> mapChildren = [
      TileLayer(
        maxNativeZoom: 40,
        maxZoom: 40,
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
      ),
    ];
    for (var marker in markers) mapChildren.add(marker);
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(44.787197, 20.457273),
              zoom: 15,
              maxZoom: 20
            ),
            children: mapChildren,
          ),
          Positioned(
            top: 10,left: 10,right: 10,
            // height: 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                  child: Focus(
                    focusNode: node,
                    onFocusChange: (value) {
                      // print(value);
                      setState(() {
                        showRecomendations=value;
                      });
                    },
                    child: SearchBar(
                      overlayColor: MaterialStateProperty.resolveWith((states) => Colors.white),
                      // focusNode: node,
                      hintText: "Adress",
                      onChanged: (value){
                        setState(() {
                          recomendations=saloni.map((e) => e.adress??"Adress").toList();
                          recomendations.removeWhere((element) => !element.contains(value));
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  padding: showRecomendations&&recomendations.isNotEmpty?EdgeInsets.all(8):EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black26,
                        offset: Offset(0,2)
                      )
                    ]
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: showRecomendations?
                    recomendations.map((e){
                      return Material(
                        
                        color: Colors.white,
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              
                            });
                          },
                          child: SizedBox(
                            width: double.infinity,
                            // height: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(e),
                            )
                          ),
                        ),
                      );
                    }).toList():
                    [],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
