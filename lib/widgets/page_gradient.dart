import 'package:flutter/material.dart';

class PageGradient extends StatelessWidget {
  final Widget? child;
  final EdgeInsets padding;
  PageGradient({
    this.padding=const EdgeInsets.all(30),
    this.child, 
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 241, 244, 248),
              Color.fromARGB(255, 218, 225, 237),
            ]),
      ),
      child: child,
    );
  }
}
