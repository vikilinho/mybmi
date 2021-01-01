import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final IconData icon;
  final String label;
  CardContainer({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
