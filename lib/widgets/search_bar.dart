import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({ Key? key }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool expanded=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
          
      height: 70,
      width: double.infinity,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: 30,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 253, 158, 86)
          ),
          child: Icon(Icons.search,color: Colors.white,),
        ),
      ),
    );
  }
}