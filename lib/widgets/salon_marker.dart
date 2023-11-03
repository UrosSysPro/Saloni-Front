import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:salon/models/salon.dart';

class SalonMarker extends StatelessWidget {
  final void Function() onTap;
  final Salon salon;
  const SalonMarker({super.key,required this.salon,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LocationMarkerLayer(
        position: LocationMarkerPosition(accuracy: 3,latitude: salon.lat!,longitude: salon.lng!),
        style: LocationMarkerStyle(
          accuracyCircleColor: Colors.transparent,
          marker: Container(
            width: 30,height: 30,
            padding: EdgeInsets.all(3),
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage("http://localhost:5234/images/${salon.imageUrl}"),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.person);
                },
              ),
            ),
          ),
          markerSize: const Size.square(30),
        ),
      ),
    );
  }
}