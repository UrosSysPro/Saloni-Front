import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  final int count,selected;

  const PageViewIndicator({
    Key? key,
    required this.count,
    required this.selected,
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
            Container(
              decoration: BoxDecoration(
                color: e==selected?Color.fromARGB(255, 253, 94, 108):Colors.grey,
                borderRadius: BorderRadius.circular(50)
              ),
              width: 10,
              height: 10,
            )
          ).toList()
        ),
      ),
    );
  }
}