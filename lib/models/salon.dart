import 'dart:convert';

import 'package:salon/models/service.dart';

class Salon {
  String? name, id, adress, imageUrl, description;
  double? avgRating, lng, lat;
  bool? favorite;
  List<Service>? services;

  Salon({
    this.id,
    this.name,
    this.imageUrl,
    this.description,
    this.favorite,
    this.lat,
    this.lng,
    this.avgRating,
    this.adress,
    this.services,
  });
  static List<Salon> fromSearchResultJson(String responseBody) {
    List<Salon> salons = [];
    try {
      var json = jsonDecode(responseBody);
      List<dynamic> salonJson = json["data"];
      for (int i = 0; i < salonJson.length; i++) {
        salons.add(Salon(
          id: salonJson[i]["id"].toString(),
          name: salonJson[i]["name"],
          description: salonJson[i]["description"],
          avgRating: double.parse(salonJson[i]["avgRating"] ?? "4.0"),
          lat: double.parse((salonJson[i]["latitude"] ?? "45").toString()),
          lng: double.parse((salonJson[i]["longitude"] ?? "45").toString()),
          favorite: salonJson[i]["isFavorite"] ?? false,
          imageUrl: salonJson[i]["imageNames"][0],
          adress: salonJson[i]["adress"],
          services: (salonJson[i]["salonServices"]??[])
              .map<Service>((salonServicesJson) {
            return Service.fromJson(salonServicesJson);
          }).toList(),
        ));
        // print(salonJson[i]["salonServices"]);
        // print(salons[i].services);
      }
    } catch (e) {
      print("[ERROR] salon read json ${e}");
    }
    return salons;
  }

  static List<Salon> fromFavoriteResultJson(String responseBody) {
    List<Salon> salons = [];
    try {
      var json = jsonDecode(responseBody);
      List<dynamic> salonJson = json["data"];
      for (int i = 0; i < salonJson.length; i++) {
        salons.add(Salon(
          id: salonJson[i]["salonId"].toString(),
          name: salonJson[i]["salonName"],
          description: salonJson[i]["description"],
          avgRating: 4.0,
          lat: double.parse((salonJson[i]["latitude"] ?? "45").toString()),
          lng: double.parse((salonJson[i]["longitude"] ?? "45").toString()),
          favorite: true,
          imageUrl: salonJson[i]["imageName"][0],
          services: (salonJson[i]["salonServices"]??[])
              .map<Service>((salonServicesJson) {
            return Service.fromJson(salonServicesJson);
          }).toList(),
        ));
      }
    } catch (e) {
      print("[ERROR] salon read json ${e}");
    }
    return salons;
  }

  static Salon fromJson(String responseBody) {
    var json = jsonDecode(responseBody);
    // print(json["salonServices"]);
    return Salon(
      id: json["id"].toString(),
      name: json["name"],
      description: json["description"],
      avgRating: double.parse(json["avgRating"]?.toString() ?? "4.0"),
      lat: double.parse((json["latitude"] ?? "45").toString()),
      lng: double.parse((json["longitude"] ?? "45").toString()),
      favorite: true,
      imageUrl: json["imageNames"][0],
      adress: json["adress"],
      services: (json["salonServices"]??[])
          .map<Service>((salonServicesJson) {
        return Service.fromJson(salonServicesJson);
      }).toList(),
    );
  }
}
