//import 'package:flutter/material.dart';
//import 'package:flutter_me/Utility/TextField.dart';
//import 'package:flutter_me/models/leave_request.dart';
//import 'package:intl/intl.dart';
//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
//
//class BasicDateField extends StatefulWidget {
//  final LeaveForm leaveForm;
//  final String label;
////  final String value;
//
//  const BasicDateField({Key key, this.leaveForm, this.label}) : super(key: key);
//
//  @override
//  _BasicDateFieldState createState() => _BasicDateFieldState();
//}
//
//class _BasicDateFieldState extends State<BasicDateField> {
//  String _label;
//  LeaveForm _leaveForm;
//
//  final format = DateFormat("yyyy-MM-dd");
//  @override
//  Widget build(BuildContext context) {
////    print('pre-loaded _label: $_label');
//    _label = widget.label;
//    _leaveForm = widget.leaveForm;
////    print('post-loaded _label: $_label');
////    return FutureBuilder(
////        future: buildFutures(),
////        builder: (BuildContext context, AsyncSnapshot snapshot) {
////          switch (snapshot.connectionState) {
////            default:
////              if (snapshot.hasError) {
////                return Text(snapshot.error.toString());
////              } else {
////                if (snapshot.data != null)
//                  return Column(children: <Widget>[
//                    FormLabelMe(_label),
//                    DateTimeField(
//                      initialValue: DateTime.now(),
//                      validator: _validDate,
//                      format: format,
//                      onShowPicker: (context, currentValue) {
//                        return showDatePicker(
//                            context: context,
//                            firstDate: DateTime(1900),
//                            initialDate: currentValue ?? DateTime.now(),
//                            lastDate: DateTime(2100));
//                      },
//                      onChanged: (dynamic newValue) {
//                        setState(() {
//                          print('Date value: $_label $newValue');
//                          _leaveForm.formData[_label] = newValue.toString();
//                          print('Form value: $_label ${_leaveForm.formData[_label]}');
//                        });
//                      },
//                    ),
//                  ]);
////                else
////                  return LinearProgressIndicator();
////              }
////          }
////        });
//  }
//
//  Future<bool> buildFutures() async {
//    return true;
//  }
//
//  String _validDate(DateTime value) {
//    _leaveForm.formData[_label] = value.toString();
//    print('value: $value');
//    print('$_label has been filled: ${_leaveForm.formData[_label]}');
//    if (value == null)
//      return "$_label must be filled in.";
////    print('DateTime: $value');
//    return null;
////    var fromDate;
////    var toDate;
////    print('from: ${_leaveForm.formData[_leaveForm.leaveFields[2]]}');
////    if (_leaveForm.formData[_leaveForm.leaveFields[2]] != "" && _leaveForm.formData[_leaveForm.leaveFields[2]] != null)
////      fromDate = format.parse(_leaveForm.formData[_leaveForm.leaveFields[2]]);
////    print('to: ${_leaveForm.formData[_leaveForm.leaveFields[2]]}');
////    if (_leaveForm.formData[_leaveForm.leaveFields[3]] != "" && _leaveForm.formData[_leaveForm.leaveFields[3]] != null)
////      toDate = format.parse(_leaveForm.formData[_leaveForm.leaveFields[3]]);
////    print('fromDate $fromDate, toDate $toDate');
////    if (fromDate != null && toDate != null) {
////      if (fromDate.isAfter(toDate))
////        return "From date must be before To date";
////    }
////    return null;
//  }
//}
//
////class BasicTimeField extends StatelessWidget {
////  String _title;
////  BasicTimeField(String title) {
////    this._title = title;
////  }
////  final format = DateFormat("HH:mm");
////  @override
////  Widget build(BuildContext context) {
////    return Column(children: <Widget>[
////      FormLabelMe(_title),
////      DateTimeField(
////        format: format,
////        onShowPicker: (context, currentValue) async {
////          final time = await showTimePicker(
////            context: context,
////            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
////          );
////          return DateTimeField.convert(time);
////        },
////      ),
////    ]);
////  }
////}
////
////class BasicDateTimeField extends StatelessWidget {
////  final format = DateFormat("yyyy-MM-dd HH:mm");
////  @override
////  Widget build(BuildContext context) {
////    return Column(children: <Widget>[
////      Text('Basic date & time field (${format.pattern})'),
////      DateTimeField(
////        format: format,
////        onShowPicker: (context, currentValue) async {
////          final date = await showDatePicker(
////              context: context,
////              firstDate: DateTime(1900),
////              initialDate: currentValue ?? DateTime.now(),
////              lastDate: DateTime(2100));
////          if (date != null) {
////            final time = await showTimePicker(
////              context: context,
////              initialTime:
////              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
////            );
////            return DateTimeField.combine(date, time);
////          } else {
////            return currentValue;
////          }
////        },
////      ),
////    ]);
////  }
////}
