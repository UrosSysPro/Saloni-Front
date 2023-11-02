import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AppState>().loadSalonsOnMap().then((value) {
      setState(() {
        saloni = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> markers = saloni.map((e) => SalonMarker(salon: e)).toList();
    List<Widget> mapChildren = [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
      ),
      SalonMarker(
        salon: Salon(
          avgRating: 2,
          description: "",
          favorite: true,
          id: "",
          imageUrl: "s",
          lat: 51.509364,
          lng: -0.18928,
          name: "aaa",
        ),
      ),
    ];
    for (var marker in markers) mapChildren.add(marker);
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(51.509364, -0.18928),
          zoom: 9.2,
        ),
        children: mapChildren,
      ),
    );
  }
}
