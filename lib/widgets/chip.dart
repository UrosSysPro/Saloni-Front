import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Chip extends StatelessWidget {
  final String text;
  final void Function() onTap;
  Chip({ 
    required this.onTap,
    required this.text,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 253, 158, 86),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}