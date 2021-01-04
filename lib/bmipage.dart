import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybmi/card_container.dart';
import 'package:mybmi/constants/boxContainer.dart';

const butcontainerHeight = 80.0;
const butContainerColor = Color(0xFFEB1555);
const activeColor = Color(0xFF1D1E33);
const inactiveColor = Color(0xFF111328);
enum Gender { male, female }

class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  Gender selectedGender;

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
                            selectedGender = Gender.male;
                          });
                        },
                        child: BoxContainer(
                          color: selectedGender == Gender.male
                              ? activeColor
                              : inactiveColor,
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
                          selectedGender = Gender.female;
                        });
                      },
                      child: BoxContainer(
                        color: selectedGender == Gender.female
                            ? activeColor
                            : inactiveColor,
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
                  cardChild: Column(
                    children: [
                      Text("HEIGHT",
                          style: TextStyle(fontSize: 80, color: Colors.white)),
                      Row(
                        children: [
                          Text("180"),
                          Text(
                            "cm",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
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
