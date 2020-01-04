//import 'package:flutter/material.dart';
//import 'package:flutter_me/Utility/DateTimePicker.dart';
//import 'package:flutter_me/Utility/TextField.dart';
//import 'package:flutter_me/Utility/slider.dart';
//import 'package:flutter_me/models/leave_request.dart';
//import 'package:intl/intl.dart';
//import 'package:toast/toast.dart';
//
//class LeaveFormWidget extends StatefulWidget {
//  final LeaveForm leaveForm;
//
//  const LeaveFormWidget({Key key, this.leaveForm}) : super(key: key);
//
//  @override
//  _LeaveFormWidgetState createState() => _LeaveFormWidgetState();
//}
//
//class _LeaveFormWidgetState extends State<LeaveFormWidget> {
//  LeaveForm _leaveForm;
//  // Note: This is a `GlobalKey<FormState>`,
//  // not a GlobalKey<FormMeState>.
//  final _formKey = GlobalKey<FormState>();
//
////  @override
////  void initState() {
////    super.initState();
////  }
//
//  @override
//  Widget build(BuildContext context) {
//    _leaveForm = this.widget.leaveForm;
//    print("LeaveForm Widget: " + _leaveForm.leaveType);
//    _leaveForm.formData['Leave Type'] = _leaveForm.leaveType;
//
////    return FutureBuilder(
////        future: buildFutures(),
////        builder: (BuildContext context, AsyncSnapshot snapshot) {
////          switch (snapshot.connectionState) {
////            default:
////              if (snapshot.hasError) {
////                return Text(snapshot.error.toString());
////              } else {
////                if (snapshot.data != null)
//    return Scaffold(
//        appBar: AppBar(
//          titleSpacing: 5.0,
//          title: Text(
//            'New ' + _leaveForm.formData['Leave Type'] + ' Request',
//            style: TextStyle(fontSize: 15.0),
//          ),
//          actions: <Widget>[
//            Builder(
//              builder: (BuildContext context) {
//                return IconButton(
//                    icon: const Icon(Icons.check),
//                    iconSize: 20.0,
//                    tooltip: 'Save',
//                    onPressed: () async {
//                      if (_formKey.currentState.validate()) {
//                        _formKey.currentState.save();
//                        if (_validDates()) Navigator.pop(context, _leaveForm);
//
////                                      showDialog<String>(
////                                          context: context,
////                                          builder:
////                                              (BuildContext dialogContext) =>
////                                                  AlertDialog(
////                                                    content: Text(
////                                                      _validDates()),
//////                                                        'Data submitted is \n${_leaveForm.formData.toString()}'),
////                                                  ));
//                      }
//                    });
//              },
//            )
//          ],
//        ),
//        body: Container(
//            color: Colors.white,
//            margin: const EdgeInsets.all(15.0),
//            constraints: BoxConstraints.expand(),
//            child: Form(
//                key: _formKey,
//                autovalidate: false,
//                child: SingleChildScrollView(
//                  child: Card(
//                      elevation: 5,
//                      child: Container(
//                          margin: const EdgeInsets.all(15.0),
//                          child: Column(
//                            children: <Widget>[
//                              FormLabelMe(_leaveForm.leaveFields[0]),
//                              DropdownButton<String>(
//                                isExpanded: true,
//                                value: _leaveForm
//                                    .formData[_leaveForm.leaveFields[0]],
//                                items: _leaveForm.leaveTypes
//                                    .map((String dropdownItem) {
//                                  return DropdownMenuItem<String>(
//                                    value: dropdownItem,
//                                    child: Text(dropdownItem),
//                                  );
//                                }).toList(),
//                                onChanged: (dynamic newValue) {
//                                  _onChangeValue(
//                                      _leaveForm.leaveFields[0], newValue);
//                                },
//                              ),
//                              _checkMedicalCertificateRequired(),
//                              BasicDateField(
//                                leaveForm: _leaveForm,
//                                label: _leaveForm.leaveFields[2],
//                              ),
//                              BasicDateField(
//                                leaveForm: _leaveForm,
//                                label: _leaveForm.leaveFields[3],
//                              ),
////                                            _textFormField(
////                                                _leaveForm.leaveFields[3]),
////                              FormLabelMe(_leaveForm.leaveFields[4]),
////                              DropdownButton<String>(
////                                isExpanded: true,
////                                value: _leaveForm
////                                    .formData[_leaveForm.leaveFields[4]],
////                                items: _leaveForm.leaveTypes
////                                    .map((String dropdownItem) {
////                                  return DropdownMenuItem<String>(
////                                    value: dropdownItem,
////                                    child: Text(dropdownItem),
////                                  );
////                                }).toList(),
////                                onChanged: (dynamic newValue) {
////                                  _onChangeValue(
////                                      _leaveForm.leaveFields[4], newValue);
////                                },
////                              ),
//                              _textFormField(_leaveForm.leaveFields[5], false),
//                            ],
//                          ))),
//                ))));
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
//  void _onChangeValue(String field, String newValue) {
////    print('field: $field, newValue: $newValue');
//    setState(() {
//      _leaveForm.formData[field] = newValue;
//      if (field == 'Leave Type') {
//        _leaveForm.leaveType = newValue;
//      }
//    });
//    print('$field: ${_leaveForm.formData[field]}');
//  }
//
//  Widget _textFormField(String label, bool mandatory) {
//    return TextFormField(
////      expands: true,
////      minLines: 1,
////      maxLines: 3,
//      validator: (value) {
//        if (mandatory && value.isEmpty) {
//          return 'Please enter some text';
//        }
//        _onChangeValue(label, value);
//        return null;
//      },
//      decoration: InputDecoration(labelText: label),
//    );
//  }
//
//  Widget _sliderWidget(String label) {
//    _leaveForm.formData[label] = false;
//    return SliderWidget(
//      label: label,
//      leaveForm: _leaveForm,
//    );
//  }
//
//  Widget _checkMedicalCertificateRequired() {
//    print('Medical Certificate Required? LeaveType: ' +
//        _leaveForm.formData['Leave Type']);
//    return _leaveForm.formData['Leave Type'] == 'SICK LEAVE'
//        ? _sliderWidget(
//            "Medical Certificate") //_textFormField(_leaveForm.leaveFields[1])
//        : Container();
//  }
//
//  bool _validDates() {
//    bool validForm = true;
//    final format = DateFormat("yyyy-MM-dd");
//    String message = 'Data submitted is \n${_leaveForm.formData.toString()}';
//    var fromDate;
//    var toDate;
//    print('from: ${_leaveForm.formData[_leaveForm.leaveFields[2]]}');
//    if (_leaveForm.formData[_leaveForm.leaveFields[2]] != "" &&
//        _leaveForm.formData[_leaveForm.leaveFields[2]] != null)
//      fromDate = format.parse(_leaveForm.formData[_leaveForm.leaveFields[2]]);
//    print('to: ${_leaveForm.formData[_leaveForm.leaveFields[3]]}');
//    if (_leaveForm.formData[_leaveForm.leaveFields[3]] != "" &&
//        _leaveForm.formData[_leaveForm.leaveFields[3]] != null)
//      toDate = format.parse(_leaveForm.formData[_leaveForm.leaveFields[3]]);
//    print('fromDate $fromDate, toDate $toDate');
//    if (fromDate != null && toDate != null) {
//      if (fromDate.isAfter(toDate)) {
//        print('To date must be on or after From date');
//        message = 'To date must be on or after From date';
//        validForm = false;
//      }
//    }
//
//    print('Toast');
//    Toast.show(message, context,
//        duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
//    return validForm;
//  }
//
////  _datePicker(BuildContext context,int labelID) async {
////    print("Call date picker widget: " + _leaveForm.leaveType);
////
////    // Navigator.push returns a Future that completes after calling
////    // Navigator.pop on the Selection Screen.
////    final Leave result = await Navigator.push(
////      context,
////      MaterialPageRoute(
////          builder: (context) =>
////              BasicDateField(leaveForm: _leaveForm,
////                label: _leaveForm.leaveFields[labelID],)),
////    );
////
////    print("Date Results: $result");
////  }
//}
