import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon/models/appointment.dart';

class AppointmentView extends StatelessWidget {
  final Appointment appointment;
  const AppointmentView(this.appointment, {super.key});

  @override
  Widget build(BuildContext context) {
    late String hour, minute;
    if ((appointment.dateTime?.hour ?? 0) < 10) {
      hour = "0${appointment.dateTime?.hour ?? 0}";
    } else {
      hour = appointment.dateTime?.hour.toString() ?? "00";
    }
    if ((appointment.dateTime?.minute ?? 0) < 10) {
      minute = "0${appointment.dateTime?.minute ?? 0}";
    } else {
      minute = appointment.dateTime?.minute.toString() ?? "00";
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 253, 94, 108),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "$hour:$minute",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 12),
                )),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 253, 94, 108),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 12),
                ))
          ],
        ),
      ),
    );
  }
}
