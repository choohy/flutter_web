import 'package:flutter/material.dart';

class TextTile extends StatelessWidget {
  final String lineOne;
  final String lineTwo;
  final String lineThree;

  TextTile({Key key, this.lineOne, this.lineTwo, this.lineThree})
      : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          lineOne,
          style: TextStyle(
            color: Color(0xff115599),
          ),
        ),
        Text(
          lineTwo,
          style: TextStyle(
            color: Color(0xff999999),
          ),
        ),
        Text(
          lineThree,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
