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
  int height = 180;

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("HEIGHT",
                          style: TextStyle(
                              fontSize: 18, color: Color(0xFF8D8E98))),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(),
                              style: TextStyle(
                                  fontSize: 50.0, fontWeight: FontWeight.w900)),
                          Text(
                            "cm",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      //To make the slider adjust the height string, simply set it as a variable and use the variable in the slider
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29EB1555),
                          thumbColor: Color(0xFFEB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  color: Color(0xFF1D1E33),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
