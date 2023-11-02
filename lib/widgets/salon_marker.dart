import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:salon/models/salon.dart';

class SalonMarker extends StatelessWidget {
  final Salon salon;
  const SalonMarker({super.key,required this.salon});

  @override
  Widget build(BuildContext context) {
    return LocationMarkerLayer(
      position: LocationMarkerPosition(accuracy: 3,latitude: salon.lat!,longitude: salon.lng!),
      style: LocationMarkerStyle(
        accuracyCircleColor: Colors.transparent,
        marker: Container(
          width: 30,height: 30,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(1,1)
              )
            ]
          ),
          child: Icon(Icons.person),
        ),
        markerSize: const Size.square(30),
      ),
    );
  }
}