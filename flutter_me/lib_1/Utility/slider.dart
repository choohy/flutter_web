//import 'package:flutter/material.dart';
//import 'package:flutter_me/Utility/TextField.dart';
//import 'package:flutter_me/models/leave_request_model.dart';
//
//
//class SliderWidget extends StatefulWidget {
//  final String label;
//  final LeaveForm leaveForm;
//
//  const SliderWidget({Key key, this.label, this.leaveForm}) : super(key: key);
//
//  @override
//  _State createState() => new _State();
//}
//
////State is information of the application that can change over time or when some actions are taken.
//class _State extends State<SliderWidget>{
//  bool _value = false;
//
//  void _onChanged(bool value) => setState(()
//  {
//    setState(() {
//      _value = value;
//      this.widget.leaveForm.formData[this.widget.label] = value;
//    });
//  });
//
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//        alignment: Alignment(-1.0, 0),
////        padding: new EdgeInsets.all(32.0),
//        child:
////        new Center(
////          child: new Column(
////            children: <Widget>[
////              new Switch(value: _value1, onChanged: _onChanged1),
//              new SwitchListTile(
//                value: _value,
//                onChanged: _onChanged,
//                title: FormLabelMe(
//                    this.widget.label),
//              )
////            ],
////          ),
////        ),
//
//    );
//  }
//}
