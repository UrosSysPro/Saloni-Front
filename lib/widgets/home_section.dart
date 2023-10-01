import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  final Widget child;
  final String sectionName;

  const HomeSection({ 
    required this.sectionName,
    required this.child,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionHeader(sectionName),
            child
          ],
        ),
      ),
    );
  }

  Widget sectionHeader(String text){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Text(text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}