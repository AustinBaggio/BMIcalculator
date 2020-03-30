import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';
import 'input_plus_minus.dart';
import 'input_slider.dart';
import 'reusable_card.dart';

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
              InputSlider(height, kBottomContainerColor),
              () {},
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    kActiveCardColor,
                    PlusMinusInput(weight, "WEIGHT"),
                    () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    kActiveCardColor,
                    PlusMinusInput(age, "AGE"),
                    () {},
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: FlatButton(
              color: kBottomContainerColor,
              child: Text(
                "CALCULATE YOUR BMI",
                style: kLabelTextStyle.copyWith(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultsPage();
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  String calculateBMI() {
    return (weight/((height)/100*(height)/100)).toString();
  }
}
