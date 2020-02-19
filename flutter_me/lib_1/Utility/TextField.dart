import 'package:flutter/material.dart';

class FormLabelMe extends StatefulWidget {
  final String _label;

  FormLabelMe(this._label);

  @override
  _FormLabelMeState createState() => _FormLabelMeState(_label);
}

class _FormLabelMeState extends State<FormLabelMe> {
  String _label;

  _FormLabelMeState(String _label) {
    this._label = _label;
  }

  Widget build(BuildContext context) {
    return
      Container(
        alignment: Alignment(-1.0, 0),
        child:
        Text('$_label',
          style: TextStyle(color: Colors.black.withOpacity(0.6)),
        ),
      );

  }

}