//import 'package:flutter/material.dart';
//import 'package:flutter_me/models/leave_request.dart';
//import 'package:flutter_me/ui/leave_form.dart';
//
//class RequestButton extends StatefulWidget {
//  final int leaveTypeIndex;
//  final LeaveForm leaveForm;
//
//  const RequestButton({Key key, this.leaveTypeIndex, this.leaveForm})
//      : super(key: key);
//
//  @override
//  _RequestButtonState createState() => _RequestButtonState();
//}
//
//class _RequestButtonState extends State<RequestButton> {
//  LeaveForm _leaveForm;
//
//  @override
//  Widget build(BuildContext context) {
//    _leaveForm = widget.leaveForm;
////    print('${_leaveForm.toString()}');
//    _leaveForm.leaveType = widget.leaveForm.leaveTypes[widget.leaveTypeIndex];
//
////    print("Leave button: " + _leaveForm.leaveType);
//    return RaisedButton(
//      onPressed: () {
//        _navigateAndDisplaySelection(context);
//      },
//      child: Text('REQUEST'),
//    );
//  }
//
//  // A method that launches the SelectionScreen and awaits the result from
//  // Navigator.pop.
//  _navigateAndDisplaySelection(BuildContext context) async {
//    print("Call leave widget: " + _leaveForm.leaveType);
//
//    // Navigator.push returns a Future that completes after calling
//    // Navigator.pop on the Selection Screen.
//    final LeaveForm result = await Navigator.push(
//      context,
//      MaterialPageRoute(
//          builder: (context) => LeaveFormWidget(leaveForm: _leaveForm)),
//    );
//
//    print("Leave form Results: $result");
////    this.widget.leaveForm.setStartTime(result.startTime);
////    this.widget.leaveForm.setEndTime(result.endTime);
//  }
//}
