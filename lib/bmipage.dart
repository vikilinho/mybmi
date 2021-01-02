import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybmi/card_container.dart';
import 'package:mybmi/constants/boxContainer.dart';

const butcontainerHeight = 80.0;
const butContainerColor = Color(0xFFEB1555);
const activeColor = Color(0xFF1D1E33);
const inactiveColor = Color(0xFF111328);

class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  Color maleCardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;
  void changeColor(int gender) {
    if (gender == 1 && maleCardColor == inactiveColor) {
      maleCardColor = activeColor;
      femaleCardColor = inactiveColor;
    } else {
      maleCardColor = inactiveColor;
    }
    if (gender == 2 && femaleCardColor == inactiveColor) {
      femaleCardColor = activeColor;
      maleCardColor = inactiveColor;
    } else {
      femaleCardColor = inactiveColor;
    }
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
                        onTap: () {
                          setState(() {
                            changeColor(1);
                          });
                        },
                        child: BoxContainer(
                          color: maleCardColor,
                          cardChild: CardContainer(
                            icon: FontAwesomeIcons.mars,
                            label: "Male",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          changeColor(2);
                        });
                      },
                      child: BoxContainer(
                        color: femaleCardColor,
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
                child: BoxContainer(
                  color: Color(0xFF1D1E33),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: BoxContainer(
                        color: Color(0xFF1D1E33),
                      ),
                    ),
                    Expanded(
                      child: BoxContainer(
                        color: Color(0xFF1D1E33),
                      ),
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
