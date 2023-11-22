import 'package:flutter/material.dart';

class Order{
  int id;
  String? customerName,type;
  // String? salonId;
  DateTime? time;
  double? price;

  Order(
    {
      this.id=1,
      this.type="Feniranje i kosa nzm",
      required this.customerName,
      required this.time,
      required this.price,
    }
    // this.salonId,
    // this.time
  );
}