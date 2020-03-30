import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class PlusMinusInput extends StatefulWidget {
  int value;
  String title;

  PlusMinusInput(this.value, this.title);
  @override
  _PlusMinusInputState createState() => _PlusMinusInputState();
}

class _PlusMinusInputState extends State<PlusMinusInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.title,
          style: kLabelTextStyle,
        ),
        Text(
          widget.value.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.value--;
                });
              },
              onLongPress: () {
                setState(() {
                  widget.value -= 10;
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
                  widget.value++;
                });
              },
              onLongPress: () {
                setState(() {
                  widget.value += 10;
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
    );
  }
}
