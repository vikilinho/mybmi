import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  final Widget cardChild;
  final Color color;

  BoxContainer({this.cardChild, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
