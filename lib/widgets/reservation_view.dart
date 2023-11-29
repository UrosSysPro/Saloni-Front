import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon/models/reservation.dart';

class ReservationView extends StatelessWidget {
  final Reservation reservation;
  const ReservationView(this.reservation,{super.key});

  @override
  Widget build(BuildContext context) {
    late String hour,minute;
    if((reservation.date?.hour??0)<10){
      hour="0${reservation.date?.hour??0}";
    }else{
      hour=reservation.date?.hour.toString()??"00";
    }
    if((reservation.date?.minute??0)<10){
      minute="0${reservation.date?.minute??0}";
    }else{
      minute=reservation.date?.minute.toString()??"00";
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 253, 94, 108),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "${reservation.customerName}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 12),
                    )),
                SizedBox(
                  width: 20,
                ),
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
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
