import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  final Widget cardChild;
  final String label;
  BoxContainer({this.cardChild, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
