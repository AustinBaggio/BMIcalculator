import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResultWord;
  final String bmiResultNumber;
  final String bmiDescription;

  ResultsPage(this.bmiResultWord, this.bmiResultNumber, this.bmiDescription);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              "Your Result",
              style: kNumberTextStyle,
            ),
            Expanded(
              child: ReusableCard(
                kActiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                    ),
              
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        Text(
                          bmiResultNumber,
                          style: TextStyle(
                              fontSize: 80, fontWeight: FontWeight.w700),
                        ),
                        Text(
                      bmiResultWord,
                      style: kLabelTextStyle,
                    )
                      ],
                    )),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          bmiDescription,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                () {},
              ),
            ),
            BottomButton(
              buttonName: "RE-CALCULATE",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
