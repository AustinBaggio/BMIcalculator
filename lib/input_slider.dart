import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class InputSlider extends StatefulWidget {
  final Color colour;
  double height;

  InputSlider(this.height, this.colour);
  @override
  _InputSliderState createState() => _InputSliderState();
}

class _InputSliderState extends State<InputSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("HEIGHT", style: kLabelTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              widget.height.toInt().toString(),
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
            value: widget.height,
            min: 120,
            max: 220,
            divisions: 300,
            onChanged: (value) {
              setState(() {
                widget.height = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
