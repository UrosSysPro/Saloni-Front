class Reservation {
  int? id;
  double? price;
  String? customerName,
      customerLastName,
      staffName,
      staffLastName,
      salonName,
      serviceName;
  DateTime? date;
  Reservation({
    required this.id,
    required this.price,
    required this.customerName,
    required this.customerLastName,
    required this.staffName,
    required this.staffLastName,
    required this.salonName,
    required this.serviceName,
    required this.date,
  });

  static List<Reservation> fromJson(dynamic json) {
    List<dynamic> jsonData = json["data"];
    List<Reservation> list = [];
    for (var jsonReservation in jsonData) {
      try {
        list.add(Reservation(
          id: jsonReservation["id"] as int,
          price: (jsonReservation["price"] as int).toDouble(),
          customerName: jsonReservation["customerName"] as String,
          customerLastName: jsonReservation["customerLastName"] as String,
          staffName: jsonReservation["staffName"] as String,
          staffLastName: jsonReservation["staffLastName"] as String,
          salonName: jsonReservation["salonName"] as String,
          serviceName: jsonReservation["serviceName"] as String,
          date: DateTime.tryParse(jsonReservation["dateAndTime"] as String) ??
              DateTime.now(),
        ));
      } catch (e) {
        if(e is Error){
          print("[ERROR] reading reservation form json: ${e.toString()}");
        }
      }
    }
    return list;
  }
}
