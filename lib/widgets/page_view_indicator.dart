import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  final int count,selected;
  final PageController controller;
  const PageViewIndicator({
    Key? key,
    required this.count,
    required this.selected,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130),
      child: SizedBox(
        height: 10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List<int>.generate(count, (index) => index).map((e) => 
            GestureDetector(
              onTap: (){
                controller.animateToPage(e, duration: Duration(milliseconds: 300),curve: Curves.bounceInOut);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: e==selected?Color.fromARGB(255, 253, 94, 108):Colors.grey,
                  borderRadius: BorderRadius.circular(50)
                ),
                width: 10,
                height: 10,
              ),
            )
          ).toList()
        ),
      ),
    );
  }
}