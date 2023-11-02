import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  final String categoryName;
  final Widget icon;
  void Function()? onTap;
  CategoryListItem({
    Key? key,
    required this.categoryName,
    required this.icon, 
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 254, 201, 72),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(child: icon),
            ),
            SizedBox(height: 10,),
            categoryText(categoryName)
          ],
        ),
      ),
    );
  }
  Widget categoryText(String name){
    return Text(
      name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}