import 'package:flutter/material.dart';

class ReadField extends StatelessWidget {
  final String label;
  final String value;

  ReadField(this.label, this.value);

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(-1.0, 0),
      child: Row(
        children: <Widget>[
          Text(
            '$label: ',
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold),
          ),
          Text(
            '$value',
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}
