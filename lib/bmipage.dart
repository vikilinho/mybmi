import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybmi/calculator.dart';
import 'package:mybmi/card_container.dart';
import 'package:mybmi/constants/boxContainer.dart';
import 'package:mybmi/resultPage.dart';

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
  int weight = 150;
  int age = 18;

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
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT",
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xFF8D8E98)),
                            ),
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                  fontSize: 50.0, fontWeight: FontWeight.w900),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        color: Color(0xFF1D1E33),
                      ),
                    ),
                    Expanded(
                      child: BoxContainer(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xFF8D8E98)),
                            ),
                            Text(
                              age.toString(),
                              style: TextStyle(
                                  fontSize: 50.0, fontWeight: FontWeight.w900),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        color: Color(0xFF1D1E33),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Calculator cal = Calculator(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                bmiResult: cal.bmiCal(),
                                resultText: cal.getResult(),
                                interpretation: cal.moreInfo(),
                              )));
                },
                child: Container(
                  child: Center(
                    child: Text("CALCULATE",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  color: butContainerColor,
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: butcontainerHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onpressed;
  RoundIconButton({@required this.icon, @required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
