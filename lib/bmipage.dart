import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybmi/card_container.dart';
import 'package:mybmi/constants/boxContainer.dart';

class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  static const butcontainerHeight = 80.0;
  static const butContainerColor = Color(0xFFEB1555);
  static const activeColor = Color(0xFF1D1E33);
  static const inactiveColor = Color(0xFFEB1555);
  bool isActive = false;

  void changeColor() {
    if (isActive == false) {}
  }

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
                      child: GestureDetector(
                        onTap: () => changeColor(),
                        child: BoxContainer(
                          color: activeColor,
                          cardChild: CardContainer(
                            icon: FontAwesomeIcons.mars,
                            label: "Male",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () => changeColor(),
                      child: BoxContainer(
                        color: activeColor,
                        cardChild: CardContainer(
                          icon: FontAwesomeIcons.venus,
                          label: "Female",
                        ),
                      ),
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
