import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/screen/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double height = 150;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    IconContent("MALE", FontAwesomeIcons.mars),
                    () {
                      setState(
                        () {
                          selectedGender = Gender.male;
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    IconContent("FEMALE", FontAwesomeIcons.venus),
                    () {
                      setState(
                        () {
                          selectedGender = Gender.female;
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("HEIGHT", style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toInt().toString(),
                        style: kNumberTextStyle,
                      ),
                      Text("cm", style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: kBottomContainerColor,
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: height,
                      min: 120,
                      max: 220,
                      divisions: 300,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              () {},
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    kActiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              onLongPress: () {
                                setState(() {
                                  weight -= 10;
                                });
                              },
                              child: CircleAvatar(
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                                backgroundColor: kButtoncolor,
                                radius: 30,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              onLongPress: () {
                                setState(() {
                                  weight += 10;
                                });
                              },
                              child: CircleAvatar(
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                                backgroundColor: kButtoncolor,
                                radius: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    kActiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                              onLongPress: () {
                                setState(() {
                                  age -= 10;
                                });
                              },
                              child: CircleAvatar(
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                                backgroundColor: kButtoncolor,
                                radius: 30,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                              onLongPress: () {
                                setState(() {
                                  age += 10;
                                });
                              },
                              child: CircleAvatar(
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                                backgroundColor: kButtoncolor,
                                radius: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    () {},
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            buttonName: "CALCULATE YOUR BMI",
            onTap: () {

              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              String bmiNumber = calc.calculateBMI();
              String bmiTitle = calc.getTitle();
              String bmiDescription = calc.getDescription();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(bmiTitle,bmiNumber,bmiDescription);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  String calculateBMI() {
    return (weight / ((height) / 100 * (height) / 100)).toString();
  }
}
