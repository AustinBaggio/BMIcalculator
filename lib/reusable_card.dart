import 'package:flutter/material.dart';

class ReusableCard extends StatefulWidget {
  //final is set a runtime
  //const is set at compile time

  final Color colour;
  final Widget cardChild;
  final Function onTap;
  ReusableCard(this.colour, this.cardChild, this.onTap);

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  widget.onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.colour,
        ),
        child: widget.cardChild,
      ),
    );
  }
}
