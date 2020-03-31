
import 'package:flutter/material.dart';

import '../constants.dart';
class BottomButton extends StatelessWidget {

  final String buttonName;
  final Function onTap;
  BottomButton({this.buttonName,this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: FlatButton(
        color: kBottomContainerColor,
        child: Text(
          buttonName,
          style: kLabelTextStyle.copyWith(color: Colors.white),
        ),
        onPressed: onTap
      ),
    );
  }
}