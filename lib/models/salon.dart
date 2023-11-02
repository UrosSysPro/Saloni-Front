import 'dart:convert';

class Salon {
  String? name, id, adress, imageUrl, description;
  double? avgRating, lng, lat;
  bool? favorite;

  Salon(
      {this.id,
      this.name,
      this.imageUrl,
      this.description,
      this.favorite,
      this.lat,
      this.lng,
      this.avgRating});
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
          avgRating: double.parse(salonJson[i]["avgRating"]??"4.0"),
          lat: double.parse((salonJson[i]["latitude"]).toString()),
          lng: double.parse((salonJson[i]["longitude"]).toString()),
          favorite: salonJson[i]["favorite"]??false,
        ));
      }
    } catch (e) {
      print("[ERROR] salon read json ${e}");
    }
    return salons;
  }
}
