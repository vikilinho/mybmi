import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants/boxContainer.dart';

class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  static const butcontainerHeight = 80.0;
  static const butContainerColor = Color(0xFFEB1555);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        centerTitle: true,
        title: Text("Check BMI"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: BoxContainer(
                        cardChild: Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.mars,
                              size: 80,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: BoxContainer(
                      label: "Female",
                    )),
                  ],
                ),
              ),
              Expanded(
                child: BoxContainer(),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: BoxContainer(),
                    ),
                    Expanded(
                      child: BoxContainer(),
                    ),
                  ],
                ),
              ),
              Container(
                color: butContainerColor,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: butcontainerHeight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
