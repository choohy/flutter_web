import 'package:flutter/material.dart';
//import 'package:flutter_me/Utility/DateTimePicker.dart';
import 'package:flutter_me/Utility/TextField.dart';
//import 'package:flutter_me/Utility/slider.dart';
import 'package:flutter_me/models/profile.dart';
//import 'package:intl/intl.dart';
//import 'package:toast/toast.dart';

class ProfileWidget extends StatefulWidget {
  final Profile profile;

  const ProfileWidget({Key key, this.profile}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  Profile _profile;
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<FormMeState>.
  final _formKey = GlobalKey<FormState>();

//  @override
//  void initState() {
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    _profile = this.widget.profile;
    print("profile Widget: " + _profile.lanID);
//    _profile.formData['Leave Type'] = _profile.leaveType;

//    return FutureBuilder(
//        future: buildFutures(),
//        builder: (BuildContext context, AsyncSnapshot snapshot) {
//          switch (snapshot.connectionState) {
//            default:
//              if (snapshot.hasError) {
//                return Text(snapshot.error.toString());
//              } else {
//                if (snapshot.data != null)
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 5.0,
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 15.0),
          ),
          actions: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                    icon: const Icon(Icons.check),
                    iconSize: 20.0,
                    tooltip: 'Save',
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
//                        if (_validDates()) Navigator.pop(context, _profile);

//                                      showDialog<String>(
//                                          context: context,
//                                          builder:
//                                              (BuildContext dialogContext) =>
//                                                  AlertDialog(
//                                                    content: Text(
//                                                      _validDates()),
////                                                        'Data submitted is \n${_profile.formData.toString()}'),
//                                                  ));
                      }
                    });
              },
            )
          ],
        ),
        body: Container(
            color: Colors.white,
            margin: const EdgeInsets.all(15.0),
            constraints: BoxConstraints.expand(),
            child: Form(
                key: _formKey,
                autovalidate: false,
                child: SingleChildScrollView(
                  child: Card(
                      elevation: 5,
                      child: Container(
                          margin: const EdgeInsets.all(15.0),
                          child: Column(
                            children: <Widget>[
                              FormLabelMe(_profile.lanID),
//                              DropdownButton<String>(
//                                isExpanded: true,
//                                value: _profile
//                                    .formData[_profile.leaveFields[0]],
//                                items: _profile.leaveTypes
//                                    .map((String dropdownItem) {
//                                  return DropdownMenuItem<String>(
//                                    value: dropdownItem,
//                                    child: Text(dropdownItem),
//                                  );
//                                }).toList(),
//                                onChanged: (dynamic newValue) {
//                                  _onChangeValue(
//                                      _profile.leaveFields[0], newValue);
//                                },
//                              ),
//                              _checkMedicalCertificateRequired(),
//                              BasicDateField(
//                                profile: _profile,
//                                label: _profile.leaveFields[2],
//                              ),
//                              BasicDateField(
//                                profile: _profile,
//                                label: _profile.leaveFields[3],
//                              ),
//                                            _textFormField(
//                                                _profile.leaveFields[3]),
//                              FormLabelMe(_profile.leaveFields[4]),
//                              DropdownButton<String>(
//                                isExpanded: true,
//                                value: _profile
//                                    .formData[_profile.leaveFields[4]],
//                                items: _profile.leaveTypes
//                                    .map((String dropdownItem) {
//                                  return DropdownMenuItem<String>(
//                                    value: dropdownItem,
//                                    child: Text(dropdownItem),
//                                  );
//                                }).toList(),
//                                onChanged: (dynamic newValue) {
//                                  _onChangeValue(
//                                      _profile.leaveFields[4], newValue);
//                                },
//                              ),
                              _textFormField(_profile.firstName, false),
                              _textFormField(_profile.lastName, false),
                            ],
                          ))),
                ))));
//                else
//                  return LinearProgressIndicator();
//              }
//          }
//        });
  }

  Future<bool> buildFutures() async {
    return true;
  }

//  void _onChangeValue(String field, String newValue) {
////    print('field: $field, newValue: $newValue');
//    setState(() {
//      _profile.formData[field] = newValue;
//      if (field == 'Leave Type') {
//        _profile.leaveType = newValue;
//      }
//    });
//    print('$field: ${_profile.formData[field]}');
//  }

  Widget _textFormField(String label, bool mandatory) {
    return TextFormField(
//      expands: true,
//      minLines: 1,
//      maxLines: 3,
      validator: (value) {
        if (mandatory && value.isEmpty) {
          return 'Please enter some text';
        }
//        _onChangeValue(label, value);
        return null;
      },
      decoration: InputDecoration(labelText: label),
    );
  }

//  Widget _sliderWidget(String label) {
//    _profile.formData[label] = false;
//    return SliderWidget(
//      label: label,
//      profile: _profile,
//    );
//  }

//  Widget _checkMedicalCertificateRequired() {
//    print('Medical Certificate Required? LeaveType: ' +
//        _profile.formData['Leave Type']);
//    return _profile.formData['Leave Type'] == 'SICK LEAVE'
//        ? _sliderWidget(
//        "Medical Certificate") //_textFormField(_profile.leaveFields[1])
//        : Container();
//  }

//  bool _validDates() {
//    bool validForm = true;
//    final format = DateFormat("yyyy-MM-dd");
//    String message = 'Data submitted is \n${_profile.formData.toString()}';
//    var fromDate;
//    var toDate;
//    print('from: ${_profile.formData[_profile.leaveFields[2]]}');
//    if (_profile.formData[_profile.leaveFields[2]] != "" &&
//        _profile.formData[_profile.leaveFields[2]] != null)
//      fromDate = format.parse(_profile.formData[_profile.leaveFields[2]]);
//    print('to: ${_profile.formData[_profile.leaveFields[3]]}');
//    if (_profile.formData[_profile.leaveFields[3]] != "" &&
//        _profile.formData[_profile.leaveFields[3]] != null)
//      toDate = format.parse(_profile.formData[_profile.leaveFields[3]]);
//    print('fromDate $fromDate, toDate $toDate');
//    if (fromDate != null && toDate != null) {
//      if (fromDate.isAfter(toDate)) {
//        print('To date must be on or after From date');
//        message = 'To date must be on or after From date';
//        validForm = false;
//      }
//    }

//    print('Toast');
//    Toast.show(message, context,
//        duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
//    return validForm;
//  }

//  _datePicker(BuildContext context,int labelID) async {
//    print("Call date picker widget: " + _profile.leaveType);
//
//    // Navigator.push returns a Future that completes after calling
//    // Navigator.pop on the Selection Screen.
//    final Leave result = await Navigator.push(
//      context,
//      MaterialPageRoute(
//          builder: (context) =>
//              BasicDateField(profile: _profile,
//                label: _profile.leaveFields[labelID],)),
//    );
//
//    print("Date Results: $result");
//  }
}
