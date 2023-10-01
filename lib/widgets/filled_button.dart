import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  FilledButton({
    required this.text,
    required this.onTap,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 35,vertical: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 253, 94, 108),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}