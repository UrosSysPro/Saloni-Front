import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final double radius,fontSize;
  final EdgeInsets padding;
  FilledButton({
    required this.text,
    required this.onTap,
    this.radius=15,
    this.fontSize=20,
    this.padding=const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 253, 94, 108),
          borderRadius: BorderRadius.circular(radius)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontSize
            ),
          ),
        ),
      ),
    );
  }
}