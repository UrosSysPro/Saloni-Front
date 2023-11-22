class Appointment {
  DateTime? dateTime;
  Appointment(this.dateTime);
  static List<Appointment> fromJson(json) {
    try {
      List<dynamic> list = json["data"];
      List<Appointment> appointments = [];
      for (var appointmentJson in list) {
        var date = DateTime.tryParse(appointmentJson["dateAndTime"]);
        appointments.add(Appointment(date ?? DateTime.now()));
      }
      return appointments;
    } catch (e) {
      print("[ERROR] Parsing appointments");
      return [];
    }
  }
}
